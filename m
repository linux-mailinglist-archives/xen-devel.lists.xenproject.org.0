Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9C628933
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 20:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443551.698162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf1F-00040y-CL; Mon, 14 Nov 2022 19:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443551.698162; Mon, 14 Nov 2022 19:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouf1F-0003y4-8x; Mon, 14 Nov 2022 19:21:21 +0000
Received: by outflank-mailman (input) for mailman id 443551;
 Mon, 14 Nov 2022 19:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGCG=3O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouf1E-0003F1-78
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 19:21:20 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839dd65a-6451-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 20:21:19 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 51083320096E;
 Mon, 14 Nov 2022 14:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 14:21:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 14:21:15 -0500 (EST)
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
X-Inumbo-ID: 839dd65a-6451-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1668453676; x=1668540076; bh=nPfMqp058g7kRRkTy0PrtYx6pL+BIhReFJy
	JxLlMvDU=; b=adB/wBdxqn4/pY6JIFrxF6O1vOBh44yy4R4Dc2AZL08q4ws41M5
	xI/6lI96evI9Zf3+P97qNAHGg5AwCEVE1ItUteABcYnD8ofDZ4G9EIakwcVYt23i
	qQaICE23Ct2ItuohBscfgzZ6yyN1DTSINqt//+E0pIL39xDPimxW+Y8apZi3fpYf
	FNBkBjgCanTFoEz7HbQYK9lrZyEDwfIA1ABy+wB3I4Hrw8DgE9KV1FiGbdgNghPc
	+NJ5J2Q0fM/wvH74TPNx1a4mvqI/AAPGyZ3Oc6ksm3JPgeRCzrAlZ1YPPpf8lva6
	MoPezvGUMpsViTcfLaba83fEj5UFl+oPfqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668453676; x=1668540076; bh=nPfMqp058g7kR
	RkTy0PrtYx6pL+BIhReFJyJxLlMvDU=; b=SD2laVW9Ax8rDvDZpjGg6HEw90BFA
	xWiAwbnB8WGQuLHNn22HG92VuL5ipHx4+A5lCz2SL8RUcHlCuR85GmwhyWn6nqRM
	WzI/rqpDaDyZVb9jfkvOkTiOmjisKchSKuGZKRu3HsDXtfdgv9/pGh+m/gAF/wxR
	vL7i0lYbFTOE3GEAD140RLIDpyn92Dz4bc/MKXfGcHib/68S1Hj+4U6wGFq2N1jL
	TL7PNZmEvTL+k86rqpTNJR8TKIubbDJRPsOiplAMF+v8IpzN7WSy3bJq9UhQcMbz
	LmfnYwVDOcVeFvFeq5TmekV8Y0L+hFC0P4st/naRROEXfK4iBNLlJ66fw==
X-ME-Sender: <xms:LJVyY1Qnwvl8qow4MxjXs6-LnkAHsebMTAu1yPtcTp-zBl2caer8Lw>
    <xme:LJVyY-xSZiiBT3e1GJbrX1HmDG3wqhTOY_B8RoSjfgvVTYLUQxQYy6XninvaIwx6Y
    YG5_rwwYTKPzw>
X-ME-Received: <xmr:LJVyY62uATPi8uVTorJhwHnjglx1TJhbVtAATLVIcQwzL0bIPwedgZ6BAm6Y_nWPQlavrXNiYgdqpkqjJO-F8oRBEW_fGLvxmzdi0G3_uKDIhfMdGhE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleekhfdu
    leetleelleetteevfeefteffkeetteejheelgfegkeelgeehhfdthedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:LJVyY9A5Bo1rTzfno8cnuhRTt-o7dLqeN3Cy7VgyGLDzTj7yUz-nPA>
    <xmx:LJVyY-hBm4vFbcYaOpvXoU2J_7mmmQxvnp20lIo27dyzkbPEgwwPEA>
    <xmx:LJVyYxocGGHyQUWAQyXxSIcG3EImttxnq6Z04cNPMvWUho29hQa4Ow>
    <xmx:LJVyY_sq-pjFdGx5pbP9gnRqtKSGneKtasP_HwpxgKosdGGSxqIwTw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/msi: passthrough all MSI-X vector ctrl writes to device model
Date: Mon, 14 Nov 2022 20:20:59 +0100
Message-Id: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QEMU needs to know whether clearing maskbit of a vector is really
clearing, or was already cleared before. Currently Xen sends only
clearing that bit to the device model, but not setting it, so QEMU
cannot detect it. Because of that, QEMU is working this around by
checking via /dev/mem, but that isn't the proper approach.

Give all necessary information to QEMU by passing all ctrl writes,
including masking a vector.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 xen/arch/x86/hvm/vmsi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 75f92885dc5e..ba4cf46dfe91 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -271,7 +271,8 @@ out:
 }
 
 static int msixtbl_write(struct vcpu *v, unsigned long address,
-                         unsigned int len, unsigned long val)
+                         unsigned int len, unsigned long val,
+                         bool completion)
 {
     unsigned long offset;
     struct msixtbl_entry *entry;
@@ -343,7 +344,7 @@ static int msixtbl_write(struct vcpu *v, unsigned long address,
 
 unlock:
     spin_unlock_irqrestore(&desc->lock, flags);
-    if ( len == 4 )
+    if ( len == 4 && completion )
         r = X86EMUL_OKAY;
 
 out:
@@ -355,7 +356,7 @@ static int cf_check _msixtbl_write(
     const struct hvm_io_handler *handler, uint64_t address, uint32_t len,
     uint64_t val)
 {
-    return msixtbl_write(current, address, len, val);
+    return msixtbl_write(current, address, len, val, false);
 }
 
 static bool cf_check msixtbl_range(
@@ -633,7 +634,7 @@ void msix_write_completion(struct vcpu *v)
         return;
 
     v->arch.hvm.hvm_io.msix_unmask_address = 0;
-    if ( msixtbl_write(v, ctrl_address, 4, 0) != X86EMUL_OKAY )
+    if ( msixtbl_write(v, ctrl_address, 4, 0, true) != X86EMUL_OKAY )
         gdprintk(XENLOG_WARNING, "MSI-X write completion failure\n");
 }
 
-- 
2.37.3


