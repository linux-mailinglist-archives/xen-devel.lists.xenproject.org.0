Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DF71FBD69
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFru-0007Ug-JY; Tue, 16 Jun 2020 17:59:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlFrt-0007Ta-0W
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:59:29 +0000
X-Inumbo-ID: 1c087dbd-affb-11ea-b923-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c087dbd-affb-11ea-b923-12813bfff9fa;
 Tue, 16 Jun 2020 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W4Ily84UCBoYBbX+TgbLDPbYSt958UYp94RRwD0IRi4=; b=pfedFbfkmM6wYWHAroxsXB8U1v
 xtuP6mMvmNW6IpScKo7PEFQYLuCgrQDuWUM+fq9gN+DzJuK8fL7jszH5GXayggAYsQl62oBuWYzN+
 +xdnM6o9q2bULSdXdEiXTrKPngJRRv7TWkHShDZuzuD866Epv9bqBhxvA2ztrw7hHgbY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFrj-0003ka-KK; Tue, 16 Jun 2020 17:59:19 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlFrj-00036w-B3; Tue, 16 Jun 2020 17:59:19 +0000
From: Julien Grall <julien@xen.org>
To: security@xenproject.org
Subject: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following an
 ret instruction
Date: Tue, 16 Jun 2020 18:59:12 +0100
Message-Id: <20200616175913.7368-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616175913.7368-1-julien@xen.org>
References: <20200616175913.7368-1-julien@xen.org>
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
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Some CPUs can speculate past a RET instruction and potentially perform
speculative accesses to memory before processing the return.

There is no known gadget available after the RET instruction today.
However some of the registers (such as in check_pending_guest_serror())
may contain a value provided the guest.

In order to harden the code, it would be better to add a speculation
barrier after each RET instruction. The performance is meant to be
negligeable as the speculation barrier is not meant to be archicturally
executed.

Note that on arm32, the ldmia instruction will act as a return from the
function __context_switch(). While the whitepaper doesn't suggest it is
possible to speculate after the instruction, add preventively a
speculation barrier after it as well.

This is part of the work to mitigate straight-line speculation.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I am still unsure whether we preventively should add a speculation barrier
preventively after all the RET instructions in arm*/lib/. The smc call be
taken care in a follow-up patch.
---
 xen/arch/arm/arm32/entry.S | 1 +
 xen/arch/arm/arm64/entry.S | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
index b228d44b190c..bd54fc43558b 100644
--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -442,6 +442,7 @@ ENTRY(__context_switch)
 
         add     r4, r1, #VCPU_arch_saved_context
         ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
+        sb
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 175ea2981e72..b37d8fe09dc2 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -522,6 +522,7 @@ abort_guest_exit_end:
         cset    x19, ne
 
         ret
+        sb
 ENDPROC(check_pending_guest_serror)
 
 /*
@@ -583,6 +584,7 @@ ENTRY(__context_switch)
         ldr     lr, [x8]
         mov     sp, x9
         ret
+        sb
 
 /*
  * Local variables:
-- 
2.17.1


