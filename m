Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E78BC4E1
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 02:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717145.1119098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3mIy-0006jd-0f; Mon, 06 May 2024 00:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717145.1119098; Mon, 06 May 2024 00:34:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3mIx-0006h2-UE; Mon, 06 May 2024 00:34:07 +0000
Received: by outflank-mailman (input) for mailman id 717145;
 Mon, 06 May 2024 00:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOxl=MJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s3mIw-0006Sc-VW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 00:34:06 +0000
Received: from wfout5-smtp.messagingengine.com
 (wfout5-smtp.messagingengine.com [64.147.123.148])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55575c70-0b40-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 02:34:02 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id CA52B1C0015F;
 Sun,  5 May 2024 20:34:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 05 May 2024 20:34:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 May 2024 20:33:58 -0400 (EDT)
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
X-Inumbo-ID: 55575c70-0b40-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1714955640; x=1715042040; bh=Qs8kJgBcfw
	yVOBoQxWcf1KBTRIcqfqizvEFlALXjf5I=; b=OGX8DgO8lNe7otID6bNrAnu9YY
	KjGEIZo/Ne7N+S4xYFfXvsa4W2P3LvNayRzh2sg7+5XueAYDyB5ZzKHSdEOGNpLO
	EJH8nIXcq0o/XGW9/QD6LfQRsc36Nu7p72z1/x5e1ANkSRlS+5+qICb2tM/lElpZ
	0zLT83dd9YxNCGVa8aPCiDgdcUv3xhQ6478yiwUUvMloHIZ7EyGN8O+LMlTngoYh
	mv1+SXLB8yWB9NQ+0wDskBUxc9m8fLbD/dzcii8Wgibcob1y3Bmtht8zj0mIwr21
	xxxG2cbKkL2fI65Bao2ROJ4d1KrObiI5akm1iM2FD7fuPKNX/tPS+XV3hn3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1714955640; x=
	1715042040; bh=Qs8kJgBcfwyVOBoQxWcf1KBTRIcqfqizvEFlALXjf5I=; b=Z
	nxaS/Ij6kfcXycAu1vAl/Q0d++lt1aUh2niCpqU7QVANb6PjJx67MsB7+ficiqkE
	bbX3p0MOtwDygs3nHnhdUT2XdhO4x6/uFZ0c2ExD1JX8eHYdTa/33FwXnjpDFK11
	onHN1cMStJ9VdeMuDPTWVJW4iPM1Csd2fu2qfKpaQrbCJe7jLTA2ufuQ29jeuwg/
	FyD+2JS4fE3Q3ZhahBOJFQRRiHPRRziVnw9PYM+wMWU39JdxqErU4PlnAxIVCVRv
	y/BkSdab3Jg/Ml5RTl0vpzPeNdS0yehtvVVitSo/2BG0fv4jIiDs0llow8jovAuz
	NNOUG5p42I2kV8RkcithQ==
X-ME-Sender: <xms:dyU4ZjDZIinHH1_higeCrLB99UJHlcRB0NdbdoKtwgIau3h-TPe5gQ>
    <xme:dyU4Zpi1LfPQF67CdXSW8hMaUAPx_8GxcDDqJmEiOnwW-_NRy2Y5ABZx7hxet6Pdq
    3z-VkBU35J_6g>
X-ME-Received: <xmr:dyU4Zuk5Hcu_YoRRfyZU1iEtBGRuj5cyauISpJM2aWhWhX1WbbUYOlBTm-XZMm5lX2a3uJ4u-XDYiHxZRmLbSIMxLj-6c9ecPCrlagKAGdhYCZ5uPeY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvhedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:eCU4ZlxqKHPKIjWiwJiG9fqpoWLp5QL4t2xPc81FDn7nsFg4mX3Big>
    <xmx:eCU4ZoS112h0PQEaEr87XWs51M_2YfNs0dVbf0i66Scnc0DuEYCceA>
    <xmx:eCU4ZoZ9g7_iPAEiSGZTZCu8kkGcVIUm3qTt0T3zHFLlD34wnYiN3w>
    <xmx:eCU4ZpRn6AvV4io_V7hcRo8UN4AVC-TzEJu8S8nuyuuPSCV4iTeHHQ>
    <xmx:eCU4ZtKM3j44LbYJps7jLc0H9V6UoimAubG5li6GYHOf-3cMst5N3Uyj>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v3 2/3] Update Xen's features.h header
Date: Mon,  6 May 2024 02:33:21 +0200
Message-ID: <e167b362448dc3abc677f3b925a58c55d6158da7.1714955598.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com>
References: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com>
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

