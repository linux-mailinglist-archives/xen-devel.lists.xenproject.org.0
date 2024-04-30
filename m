Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29448B7EB3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 19:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715153.1116683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMy-0006up-R5; Tue, 30 Apr 2024 17:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715153.1116683; Tue, 30 Apr 2024 17:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1rMy-0006sF-Na; Tue, 30 Apr 2024 17:34:20 +0000
Received: by outflank-mailman (input) for mailman id 715153;
 Tue, 30 Apr 2024 17:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DdMh=MD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s1rMw-0006ry-Ih
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 17:34:18 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd215911-0717-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 19:34:16 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id CD6471C0014B;
 Tue, 30 Apr 2024 13:34:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 30 Apr 2024 13:34:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 13:34:12 -0400 (EDT)
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
X-Inumbo-ID: dd215911-0717-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714498453; x=1714584853; bh=Qs8kJgBcfw
	yVOBoQxWcf1KBTRIcqfqizvEFlALXjf5I=; b=Tx91T/7M5pyjm1ZLOqRo/WBhz/
	WOyep28ohOqlogY8JT1Ju2Eax1bEUT/OUDTV6leXE8D2rVb4z36q8LnTCR5wyth3
	sj/6mfL7doX8+ddMC5JbSz29m8mWTtRQEpD3DGxSMnEgDkC3u6yPcOz32Kw2FWrx
	cnlZ9oCEGVDtlUJ2qEifigdNjmeO8vsVJ9t1wTAXJ3ZkLN7TOP6RRIAAkQrJWUWB
	fyDWl8X8+/AJj9USHZffUktTQ1YyIG0+/inCRn+pJEyACivmMIIP0kebtYjXBN+x
	re6AYGRgzQvNJUr+NmBQa4sTolMJzlj5tCGkfhdQsS9ogHckGvis/75NGxCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714498453; x=
	1714584853; bh=Qs8kJgBcfwyVOBoQxWcf1KBTRIcqfqizvEFlALXjf5I=; b=Q
	kZMVqAMSDBz6UWOLheED3emtMNTFXIcBCufzKgTVtnb1gIKSkGkpKsMLsluVLgAK
	WKG+WMJ5vKGXiyXz21R8h4U04j7tf3HsnZkhtHOnK7OpMLFm/xtlJ86UuCXAn9Dm
	FAx68BR50OadJm3OPuBYujXyhNSpV/FTDhGOWQG+Tz2eROM62Ov3t6e6HZpIjkO3
	z47vgJ6q0Rk2XrGr4xpfqWFlU92nLcLc3zm3ydBy9myOAlm2fePZTY4tPd8sTzl9
	ggC8iahXP6rp4Ehc/tXZaBzczY/C1Nge2XyyUc7Ap9a8GX/cH4PI2EaBx/txi5JA
	fMiKS0TbFffkMQzVi+gbg==
X-ME-Sender: <xms:lSsxZufwQd_xOIe0hJNfrDtyljz7dOugVUqnXApB1Z5kwB0Oo3zJvQ>
    <xme:lSsxZoM4bfwY8HF4j3dKEUDUXdAzgp2nRB3_RJqPMN7r0hrKqnlUkbaEQSPWHwAbs
    DOdKtYhsW04_Q>
X-ME-Received: <xmr:lSsxZvgZa0U0DVGMmOobydQJCjltkJDXxcjeyp4ikUlArtKWGXizc4Oamm3Bewit-hRHCLle>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    gfeuudehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
    vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lSsxZr9Kcg1hK15kbmicl32mi5K7a4azjLfIXuRhy6hvw3_UhfVq2A>
    <xmx:lSsxZqsxKS8onaQQg2I2TYRa7H6CBW9YxYnbxyBJMayU_p_fJk1ELg>
    <xmx:lSsxZiFktKsH7EX66ruzKThMjKGyRUAUgmsAwFmSCeWDbJia07QMDg>
    <xmx:lSsxZpPZzYyX-zvGbEsR-hymJNprUfLHvD90U2Gzqe4E6z9aXnHUqg>
    <xmx:lSsxZsXv-oqlURToAHcUq0XMFoYcpNgY5UBVsfOImIjkDti4ICEEXi2o>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v2 2/3] Update Xen's features.h header
Date: Tue, 30 Apr 2024 19:33:10 +0200
Message-ID: <bd499d1c412502afad60bff73a088b94a4ba43da.1714498385.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
References: <cover.ea761e8c87cc41550b01d6fbc1cd1116af55e288.1714498385.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update it to get XENFEAT_dm_msix_all_writes for the next patch.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 include/hw/xen/interface/features.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/hw/xen/interface/features.h b/include/hw/xen/interface/features.h
index d2a9175..8801930 100644
--- a/include/hw/xen/interface/features.h
+++ b/include/hw/xen/interface/features.h
@@ -111,6 +111,23 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * Signal whether the domain is able to use the following hypercalls:
+ *
+ * VCPUOP_register_runstate_phys_area
+ * VCPUOP_register_vcpu_time_phys_area
+ */
+#define XENFEAT_runstate_phys_area        18
+#define XENFEAT_vcpu_time_phys_area       19
+
+/*
+ * If set, Xen will passthrough all MSI-X vector ctrl writes to device model,
+ * not only those unmasking an entry. This allows device model to properly keep
+ * track of the MSI-X table without having to read it from the device behind
+ * Xen's backs. This information is relevant only for device models.
+ */
+#define XENFEAT_dm_msix_all_writes        20
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
git-series 0.9.1

