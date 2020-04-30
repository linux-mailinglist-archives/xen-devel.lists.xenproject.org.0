Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD981C087A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 22:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUG3B-0002qt-1N; Thu, 30 Apr 2020 20:44:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fL57=6O=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUG39-0002qK-EF
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 20:44:51 +0000
X-Inumbo-ID: 6c920ebc-8b23-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c920ebc-8b23-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WTEV0oPtcbmzQwnNtr2I2AVsKwc6yGr7IZ4NoXd1nT4=; b=cdbbpPvFM/mqtoRn44qvXJUJ4E
 SAz077vwekyoVNG4sLAzgzr8i2FsuLB8SvwFl0rw55f/u0ElP8VlofANR8/aRzyeJOtHaQBSzKarT
 PiJ8oEW5NYkGxTPvhqeuh7OVM/GrUQcqaVtacXAAc/XRSz5Kxlryon/f9Swfq02cHHyA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUG32-0004LP-Mo; Thu, 30 Apr 2020 20:44:44 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUG32-0005wj-Cc; Thu, 30 Apr 2020 20:44:44 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 05/16] x86: map/unmap pages in restore_all_guests.
Date: Thu, 30 Apr 2020 21:44:14 +0100
Message-Id: <97a7680a1be26f6e34b91d29551747afa5235555.1588278317.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
References: <cover.1588278317.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Before, it assumed the pv cr3 could be accessed via a direct map. This
is no longer true.

Note that we do not map and unmap root_pgt for now since it is still a
xenheap page.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/x86_64/entry.S | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index d55453f3f3..110cd0394f 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -154,7 +154,24 @@ restore_all_guest:
         and   %rsi, %rdi
         and   %r9, %rsi
         add   %rcx, %rdi
-        add   %rcx, %rsi
+
+         /*
+          * Without a direct map, we have to map first before copying. We only
+          * need to map the guest root table but not the per-CPU root_pgt,
+          * because the latter is still a xenheap page.
+          */
+        pushq %r9
+        pushq %rdx
+        pushq %rax
+        pushq %rdi
+        mov   %rsi, %rdi
+        shr   $PAGE_SHIFT, %rdi
+        callq map_domain_page
+        mov   %rax, %rsi
+        popq  %rdi
+        /* Stash the pointer for unmapping later. */
+        pushq %rax
+
         mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
         mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
         mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
@@ -166,6 +183,14 @@ restore_all_guest:
         sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
                 ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
         rep movsq
+
+        /* Unmap the page. */
+        popq  %rdi
+        callq unmap_domain_page
+        popq  %rax
+        popq  %rdx
+        popq  %r9
+
 .Lrag_copy_done:
         mov   %r9, STACK_CPUINFO_FIELD(xen_cr3)(%rdx)
         movb  $1, STACK_CPUINFO_FIELD(use_pv_cr3)(%rdx)
-- 
2.24.1.AMZN


