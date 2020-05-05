Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78931C58C2
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:18:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyOS-0002Cx-PB; Tue, 05 May 2020 14:17:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sfw0=6T=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jVyOR-0002Cs-R4
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:17:55 +0000
X-Inumbo-ID: 367d83fe-8edb-11ea-9dc1-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 367d83fe-8edb-11ea-9dc1-12813bfff9fa;
 Tue, 05 May 2020 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aznXzJb7bC80HkraGpCr4P91jZn6zGG8FU6thEDrtOc=; b=nMMasNV2zYjmI8eZikgVoC9nv8
 yFMIKabmvs6M73fuuPfanBJk6yC3c4IeaQ5J9LZs+4lLMpb9/yNoFdTEfFfVQ7HD97wcNbkr2lx3u
 rWucL6h1tLqJgqn5Tz9ASK5ebMXU42Y02jdFIR64MqZsLjcyI6EmzyozELx2yvxUCMfU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jVyOQ-0003pp-Tn; Tue, 05 May 2020 14:17:54 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jVyOQ-0007dV-H3; Tue, 05 May 2020 14:17:54 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] x86/traps: fix an off-by-one error
Date: Tue,  5 May 2020 15:17:35 +0100
Message-Id: <f825eca729ee9fab872e4ef1b0af10d0a7b3d852.1588688249.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

stack++ can go into the next page and unmap_domain_page() will unmap the
wrong one, causing mapcache and memory corruption. Fix.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v2:
- tweak how the unmap is handled.
- fix the bug in compat as well.
- remove part of the commit message which was not accurate.
---
 xen/arch/x86/traps.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 33e5d21ece..73c6218660 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -236,6 +236,7 @@ static void compat_show_guest_stack(struct vcpu *v,
                                     int debug_stack_lines)
 {
     unsigned int i, *stack, addr, mask = STACK_SIZE;
+    void *stack_page = NULL;
 
     stack = (unsigned int *)(unsigned long)regs->esp;
     printk("Guest stack trace from esp=%08lx:\n ", (unsigned long)stack);
@@ -258,7 +259,7 @@ static void compat_show_guest_stack(struct vcpu *v,
                 break;
         if ( !vcpu )
         {
-            stack = do_page_walk(v, (unsigned long)stack);
+            stack_page = stack = do_page_walk(v, (unsigned long)stack);
             if ( (unsigned long)stack < PAGE_SIZE )
             {
                 printk("Inaccessible guest memory.\n");
@@ -285,11 +286,9 @@ static void compat_show_guest_stack(struct vcpu *v,
         printk(" %08x", addr);
         stack++;
     }
-    if ( mask == PAGE_SIZE )
-    {
-        BUILD_BUG_ON(PAGE_SIZE == STACK_SIZE);
-        unmap_domain_page(stack);
-    }
+
+    UNMAP_DOMAIN_PAGE(stack_page);
+
     if ( i == 0 )
         printk("Stack empty.");
     printk("\n");
@@ -300,6 +299,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
     int i;
     unsigned long *stack, addr;
     unsigned long mask = STACK_SIZE;
+    void *stack_page = NULL;
 
     /* Avoid HVM as we don't know what the stack looks like. */
     if ( is_hvm_vcpu(v) )
@@ -328,7 +328,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
         vcpu = maddr_get_owner(read_cr3()) == v->domain ? v : NULL;
         if ( !vcpu )
         {
-            stack = do_page_walk(v, (unsigned long)stack);
+            stack_page = stack = do_page_walk(v, (unsigned long)stack);
             if ( (unsigned long)stack < PAGE_SIZE )
             {
                 printk("Inaccessible guest memory.\n");
@@ -355,11 +355,9 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
         printk(" %p", _p(addr));
         stack++;
     }
-    if ( mask == PAGE_SIZE )
-    {
-        BUILD_BUG_ON(PAGE_SIZE == STACK_SIZE);
-        unmap_domain_page(stack);
-    }
+
+    UNMAP_DOMAIN_PAGE(stack_page);
+
     if ( i == 0 )
         printk("Stack empty.");
     printk("\n");
-- 
2.17.1


