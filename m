Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BBE6C8A52
	for <lists+xen-devel@lfdr.de>; Sat, 25 Mar 2023 03:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514517.796848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftya-0000es-OU; Sat, 25 Mar 2023 02:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514517.796848; Sat, 25 Mar 2023 02:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pftya-0000bp-Lf; Sat, 25 Mar 2023 02:49:52 +0000
Received: by outflank-mailman (input) for mailman id 514517;
 Sat, 25 Mar 2023 02:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pftyZ-0000bj-9C
 for xen-devel@lists.xenproject.org; Sat, 25 Mar 2023 02:49:51 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3ef1c2d-cab7-11ed-b464-930f4c7d94ae;
 Sat, 25 Mar 2023 03:49:48 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 76C39320093C;
 Fri, 24 Mar 2023 22:49:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 24 Mar 2023 22:49:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Mar 2023 22:49:42 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b3ef1c2d-cab7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1679712584; x=1679798984; bh=joFi90XdDmKTY5YmFubF7MD/2
	V9iCbVRiW8Q7hMfwlc=; b=b5VU8DgSJQNTaBIfn3dlpIhJ65UHCnAav/uff34a7
	uOORWdBj8i57zOQtUTq2sQYIhSxX9hyPWAFEB55FkieN20mX6dBvRjSJnu7BNw26
	foEg1JXF9pTWCxpXfVfQ4ixb7uPDq5bnsnAtWMp71tTlvVZgSIeeTMU4WUSanQ1N
	oGHOzObL7Ej/lWC6zBwm/y0P098KxVKHgRSE3fveXvRAohoOMUZHA7fy6dfo0Wjh
	bB+OmmeXygB8OPZQNS9crpQAhZPTjg1fu1vd/DOVlkw+CRbsceI9tFYrSBblqMOR
	ly3nzw/cYO9AD5bBIpZiW/08eE08AAjndeMezf0PehaoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1679712584; x=1679798984; bh=j
	oFi90XdDmKTY5YmFubF7MD/2V9iCbVRiW8Q7hMfwlc=; b=Xr0C8oR+CyjrHdpdi
	ovzWPzGiZfcLYzfVlAxDoSXvGNIyRTQjdwkHqTQeDMR93+OP1M8QdpvV7oVn6OOB
	HMrbNkEsCI+w5bm3SmtaSotCOVPDuoBTZ8SG0J/26qnjfUf4HIYXiYGeGN48+yPE
	+edglj/yuWjMHyLv/aDvqy6xnMQEukmTHMOLQX0pNnhQQz7FJWP+F0tuzb0V8PNg
	kvzux/Mr4T6cTfcrSpL18e5jQxQ5IUwUB9HdiX9qHFj/ADkjEEWiJZBfdiirMX9h
	W4UvtvzHEIBwXS5ljBHRrZ8nRpxK6KRk+LFADH2DxSpDcxZqejMqA7Fb1Te/QHyS
	/KC+w==
X-ME-Sender: <xms:R2EeZP36aiTk_GJ2NGH_hKnBzr0WBErj1mDoo-Q5IJzuXHaNNBUGlA>
    <xme:R2EeZOFHPq7SXDufToyXZy1QkQ9SYX9ft8L5F7AKeyp5V5cWmSApEBjPrl_TGboqP
    KXb4_QTIA7X5g>
X-ME-Received: <xmr:R2EeZP4Y5X2xovX5kDj6KIfAbuPaUM3j33p9fysqHjUKQIyl6-S0UgQKGHaO3eE9m9OodCOp1Rn5pwd91t3gvWxr8OIhWAPnuUWRer-DXRazMQKZzYcK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegjedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelkefh
    udelteelleelteetveeffeetffekteetjeehlefggeekleeghefhtdehvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:R2EeZE1ECwKMuaUjhkjEhsHSmgo8qUVe_vbZXpeN1vrEwYWY8n6Eng>
    <xmx:R2EeZCEHaff0OYDW-FnmoEUMLPugvpppCf7OvlOqDRkig2RsWm3uVg>
    <xmx:R2EeZF9LcmX-KTA-HO-4dd-eLTS30lk2PUfcaoowvWBvtVH7CdsJvQ>
    <xmx:SGEeZOiXuhwWgB23CsvCVjh7Phv119PPovPtRZC5SR0etYfBqf3OOA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Sat, 25 Mar 2023 03:49:22 +0100
Message-Id: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QEMU needs to know whether clearing maskbit of a vector is really
clearing, or was already cleared before. Currently Xen sends only
clearing that bit to the device model, but not setting it, so QEMU
cannot detect it. Because of that, QEMU is working this around by
checking via /dev/mem, but that isn't the proper approach.

Give all necessary information to QEMU by passing all ctrl writes,
including masking a vector. This does include forwarding also writes
that did not change the value, but as tested on both Linux (6.1.12) and
Windows (10 pro), they don't do excessive writes of unchanged values
(Windows seems to clear maskbit in some cases twice, but not more).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
v2:
 - passthrough quad writes to emulator too (Jan)
 - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
   #define for this magic value

This behavior change needs to be surfaced to the device model somehow,
so it knows whether it can rely on it. I'm open for suggestions.
---
 xen/arch/x86/hvm/vmsi.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 3cd4923060c8..9c82bf9b4ec2 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -272,6 +272,15 @@ out:
     return r;
 }
 
+/*
+ * This function returns X86EMUL_UNHANDLEABLE even if write is properly
+ * handled, to propagate it to the device model (so it can keep its internal
+ * state in sync).
+ * len==0 means really len==4, but as a write completion that will return
+ * X86EMUL_OKAY on successful processing. Use WRITE_LEN4_COMPLETION to make it
+ * less confusing.
+ */
+#define WRITE_LEN4_COMPLETION 0
 static int msixtbl_write(struct vcpu *v, unsigned long address,
                          unsigned int len, unsigned long val)
 {
@@ -283,9 +292,6 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
     unsigned long flags;
     struct irq_desc *desc;
 
-    if ( (len != 4 && len != 8) || (address & (len - 1)) )
-        return r;
-
     rcu_read_lock(&msixtbl_rcu_lock);
 
     entry = msixtbl_find_entry(v, address);
@@ -345,7 +351,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
 
 unlock:
     spin_unlock_irqrestore(&desc->lock, flags);
-    if ( len == 4 )
+    if ( len == WRITE_LEN4_COMPLETION )
         r = X86EMUL_OKAY;
 
 out:
@@ -357,6 +363,9 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
+    if ( (len != 4 && len != 8) || (address & (len - 1)) )
+        return X86EMUL_UNHANDLEABLE;
+
     return msixtbl_write(current, address, len, val);
 }
 
@@ -635,7 +644,7 @@ void msix_write_completion(struct vcpu *v)
         return;
 
     v->arch.hvm.hvm_io.msix_unmask_address = 0;
-    if ( msixtbl_write(v, ctrl_address, 4, 0) != X86EMUL_OKAY )
+    if ( msixtbl_write(v, ctrl_address, WRITE_LEN4_COMPLETION, 0) != X86EMUL_OKAY )
         gdprintk(XENLOG_WARNING, "MSI-X write completion failure\n");
 }
 
-- 
2.39.2


