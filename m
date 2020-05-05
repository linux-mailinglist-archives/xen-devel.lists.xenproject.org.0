Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE941C53EB
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 13:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVvPL-0002N6-41; Tue, 05 May 2020 11:06:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sfw0=6T=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jVvPJ-0002N1-BN
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 11:06:37 +0000
X-Inumbo-ID: 7ce87a80-8ec0-11ea-9daa-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ce87a80-8ec0-11ea-9daa-12813bfff9fa;
 Tue, 05 May 2020 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6t4XEAWupBQ7XmDt0+Vd5JHQn6V1VVS150N+FXhM2w=; b=7Lt4gWISKrG9ePh0o1ZJnfhFsQ
 93z1oftshVhjhiOT0HNao9nHEja7pa9jVgi6RU7OLzhpPkzM1wfaHyWRkzVv2vVge8huzVUebnQDL
 6GfC9TLWOHrlgstDd97zafKR6GzSZp520i6MDhi08XbT9xDnekMyEXqcM9ikbIep592E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jVvPI-0000Dz-El; Tue, 05 May 2020 11:06:36 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jVvPI-0003lw-4N; Tue, 05 May 2020 11:06:36 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] x86/traps: fix an off-by-one error
Date: Tue,  5 May 2020 12:06:30 +0100
Message-Id: <37b7ec049ff82f92cc6724a743867e1cd9365f5b.1588676790.git.hongyxia@amazon.com>
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

This is found with direct map removal. For now, the idle domain does not
have a mapcache and uses the direct map, so no errors will occur.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/traps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 33e5d21ece..f033a804a3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -300,6 +300,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
     int i;
     unsigned long *stack, addr;
     unsigned long mask = STACK_SIZE;
+    void *stack_page = NULL;
 
     /* Avoid HVM as we don't know what the stack looks like. */
     if ( is_hvm_vcpu(v) )
@@ -328,7 +329,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
         vcpu = maddr_get_owner(read_cr3()) == v->domain ? v : NULL;
         if ( !vcpu )
         {
-            stack = do_page_walk(v, (unsigned long)stack);
+            stack_page = stack = do_page_walk(v, (unsigned long)stack);
             if ( (unsigned long)stack < PAGE_SIZE )
             {
                 printk("Inaccessible guest memory.\n");
@@ -358,7 +359,7 @@ static void show_guest_stack(struct vcpu *v, const struct cpu_user_regs *regs)
     if ( mask == PAGE_SIZE )
     {
         BUILD_BUG_ON(PAGE_SIZE == STACK_SIZE);
-        unmap_domain_page(stack);
+        unmap_domain_page(stack_page);
     }
     if ( i == 0 )
         printk("Stack empty.");
-- 
2.17.1


