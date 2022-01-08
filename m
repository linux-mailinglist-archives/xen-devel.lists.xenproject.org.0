Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D58488011
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254735.436600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zx8-0003sy-8H; Sat, 08 Jan 2022 00:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254735.436600; Sat, 08 Jan 2022 00:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zx8-0003qu-14; Sat, 08 Jan 2022 00:51:26 +0000
Received: by outflank-mailman (input) for mailman id 254735;
 Sat, 08 Jan 2022 00:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zx6-0003o0-FP
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:51:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 195d5f2d-701d-11ec-81c1-a30af7de8005;
 Sat, 08 Jan 2022 01:51:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C34461F20;
 Sat,  8 Jan 2022 00:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358F3C36AEB;
 Sat,  8 Jan 2022 00:51:21 +0000 (UTC)
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
X-Inumbo-ID: 195d5f2d-701d-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641603081;
	bh=Evoa4GFz1qTowYJne3oUn6qfMxpVbs6Xo5ayW1kl7h4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vOsLVvbpkAZ7i2npsV+5gqf+gRfFetMK++NyRJJGyZ7nGBm7bqiXez4VEAmd5RFxo
	 culRQ1eMpDrzSPjiWuQI6NIZES7j1Bhq+bmpygf1CuYt1yxAH1btgf6PfeWUb+lolk
	 ZHsTJWE1df5l0EkGRWMLnEhgs3TQ5Kxf98Cc882VwHF/Fcqikt+o555k9LBtMm4WaT
	 qLoqtmBNPudBbRe936mNuwxATMXkiQjwkpDRyEZD2orVe1f/2igPykiZ+bqt4NAHul
	 y3cvYO5Jl/2qnudfzRD9Qa/8wdz9NLmyoYXrngVqXRxtt0KjaFqFStlwb6RgC+ygcO
	 kFmGllZw/9J/w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [LINUX PATCH 1/2] xen: introduce XENFEAT_xenstore_late_init
Date: Fri,  7 Jan 2022 16:51:18 -0800
Message-Id: <20220108005119.3820799-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071621100.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071621100.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add the new XENFEAT_xenstore_late_init flag to the features header file.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 include/xen/interface/features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/xen/interface/features.h b/include/xen/interface/features.h
index 53f760378e39..2b121b53394f 100644
--- a/include/xen/interface/features.h
+++ b/include/xen/interface/features.h
@@ -97,6 +97,11 @@
 #define XENFEAT_not_direct_mapped         16
 #define XENFEAT_direct_mapped             17
 
+/*
+ * The xenstore interface should be initialized only after receiving a
+ * xenstore event channel notification.
+ */
+#define XENFEAT_xenstore_late_init 18
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.25.1


