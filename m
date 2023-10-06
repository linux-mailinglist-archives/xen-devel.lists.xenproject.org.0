Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918227BB034
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613211.953633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDq-0007eC-Go; Fri, 06 Oct 2023 02:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613211.953633; Fri, 06 Oct 2023 02:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDq-0007WJ-8Q; Fri, 06 Oct 2023 02:05:46 +0000
Received: by outflank-mailman (input) for mailman id 613211;
 Fri, 06 Oct 2023 02:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDo-0006iG-8T
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:44 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da2474ef-63ec-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 04:05:42 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A77E95C0346;
 Thu,  5 Oct 2023 22:05:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 05 Oct 2023 22:05:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:40 -0400 (EDT)
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
X-Inumbo-ID: da2474ef-63ec-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696557941; x=1696644341; bh=xU
	VmAHd/upd/HZf/2/vIJOjnVKPpjlKUVUtDDxC5laI=; b=WMr8VMYVeaAIYcJhht
	t+fPdJi4ksa1jU27ABf5bi1Bwvghhe6EoYH4+VJNjlvlc/3qyvPIqpt3te1RgGtn
	YBocQqddSHtJJ++sHhy4aYRkJDZk1m7oeOczcKW45w0cyynKEjZxT2SizUOvTqwE
	CiQdO1umXr9iVgY88W7RH97obnvmsEdSqgxA/XDKB0YBT+pnZf+0kulelt2pwMBR
	w5TgPqCQO57WH9gdRZ8okhg17t2YQ3w5AW7qGS3Z6fvX+UVjuhnP71FXSAKr4t9W
	Z0Non/g2S4t6YstN9emrAuQT9B7dT3+tsmdmy5w6oxTtujbZ5sBwYi7xkevoVs6v
	kZwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696557941; x=1696644341; bh=xUVmAHd/upd/HZf/2/vIJOjnVKPpjlKUVUt
	DDxC5laI=; b=U0SvVFbQOSN9+HsQMuN5UB63ruRmHXyzsQ+RL7Q8evZnOlZ9pW4
	QRU3IRP7vRl9ucXBuBX/WnT+yEawh8uzznrS8LBPuzEqxPYlXs1jc2Tku0mHbIqQ
	36F8NT1cCNIDqua5EbGGXJLGqC4+1FpnI/vxnCcX3LuSKE+og5SKtudQyLm96VR3
	URjtpNS5Tfxlp5Q30pWcDXfdgwC26tRiOtQ5s1RsZNmZ7Er5ckOBg7mvCPXDxoJc
	NdHsz8rwgk4juAE4fS06jMaJH6XtGDqLscR4bZAUGIqINrKhOjMocFyGallbimUL
	MdUGyigcWhNHrJpHlpsyX2eKX1gAL/ebI0g==
X-ME-Sender: <xms:dWsfZQuIleFHFj9yCm3o1G0I7Am5PcQrwOLYnKiFV1e_CZY-MtEwMw>
    <xme:dWsfZdfq_qD8Ba1I4sDkEo0BcG1DqOUkSbLVl7F70dU7YUMrECCO2uNA9TNTCDUgU
    mQyi5vVTz-66g>
X-ME-Received: <xmr:dWsfZbx_G3uAgDGN6UHqJqdkV3S74kZ14lIleBEaLepd_1RjzCyHOIUQ4AS2JMsbFTiL8oo4EeV4X88-7qwPX4_r-Dl8HN17rNw43TwNzGCbr1FWMW0X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:dWsfZTO3qy2Jf4FRu1T1n_wbGv8yxW7VpLzxMHAZgfT3lbsWvjoGMw>
    <xmx:dWsfZQ-X_BHSOYoBWEe6i-XTfviUDX0lLqFmDY8abtxzp1Y-yL8Iog>
    <xmx:dWsfZbVn_lyBBCF9_ttlfGlnWDYsUex0DZZ9wASwtIf1beickCU7kw>
    <xmx:dWsfZSLXVxaflCWKL4WENhov6OmaOUXQSf5_zefO5O49aa_twnbLqQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/5] automation: extract QEMU log in relevant hardware tests
Date: Fri,  6 Oct 2023 04:05:19 +0200
Message-ID: <7844dbd88559ac5a52c0511bcfbc33cf835e9f56.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Let it be printed to the console too. QEMU and Linux messages have
different enough format that it should be possible to distinguish them.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 842e6fae7204..fe80a1c84308 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -109,6 +109,7 @@ echo \"${passed}\"
 "
 
     dom0_check="
+tail -F /var/log/xen/qemu-dm-domU.log &
 until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
-- 
git-series 0.9.1

