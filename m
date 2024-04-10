Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA48A0434
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 01:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703702.1099535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfV-0000U0-Jp; Wed, 10 Apr 2024 23:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703702.1099535; Wed, 10 Apr 2024 23:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruhfV-0000Qs-Fr; Wed, 10 Apr 2024 23:47:53 +0000
Received: by outflank-mailman (input) for mailman id 703702;
 Wed, 10 Apr 2024 23:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHON=LP=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ruhfT-0007t7-Kn
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 23:47:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd3430bf-f794-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 01:47:49 +0200 (CEST)
Received: from CH2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:5a::26)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 23:47:45 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::99) by CH2PR08CA0016.outlook.office365.com
 (2603:10b6:610:5a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 23:47:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 23:47:44 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 18:47:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 16:47:44 -0700
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 10 Apr 2024 18:47:43 -0500
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
X-Inumbo-ID: bd3430bf-f794-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkx5idiKwmP+0GweDu1YTBHzCHkqO/wiF3WavkELe4upegSJlqZYX5BCmEn/D1jcEiTBVXit69MZeN9jWj2GA7B2h93/nC7L7U+yepencwyv3U/uiD8EpZzb1SdKNzd70410jdVweXim3koSBJn2lsr9JLXutIC8bjxYFtEuZz8ipPBx5E9rmYlX9kMnTLXg5Y8lMj2eXjvS/KY+VDRDLcxDnoea9cr1gBwFcdte2eOdbNBZTKZ4mZuWpK9xtjLjQUMKna/nqFkNCHB2jxhB8OZWOTl+zxMSPU1shTNw25LCphCOdiRRnRbRKvsyZMJBONipBHZIFvrEbKntfH37mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjXObuSoQi0Mi/Diq12/QBuomsKSbc6r1oDEiMbK9vk=;
 b=I6L8vm5mo/Xl4aNQHg/6NJHvPYE+pygsKlG+VSHl2lCQ8efJYESUTDbzsfaKi1J6EQ9GCj1xWX2mM8lZtIa1SX5BUuhr4pVvkHN0HwdvXgwzI+zJPEAOCRYSO7LUeaiXU8XidFPxU6cjCodvpiuUBq/FaJqHkSdw0L8AsW0/z4UTfbIFetSwAvZMf/S5DaCESw3auaJ6k1UTrBOg7l87JEI1nvTr3CCsavkFXorprXbX4+RqNgu2E7zo6VP1AAjUKlgs2Sw6c8bXR+MBfBeezVBmRzmegiSg8C9JV2R6ZIA92dhhYZdz0NschqAMBiflusEOscwjQrXe1m3hWOd51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjXObuSoQi0Mi/Diq12/QBuomsKSbc6r1oDEiMbK9vk=;
 b=es3hTMFov5ZMIHMGDSoXos8kcktB16wHQUMQjVROTw1/wZMOtfgYM+Ye+uLV1BCN6mEMOKXk2KOsO/PkW5RaV901JZQ4h/Q4WwfJHIyvsNGrEMAQSi6oM3kUyKWoUx9F2hzj8SOwC22fe3jUNmuRGPPnI41/PfTXH8G5ijI1/FM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v2 3/4] xen/public: s/unsigned long/xen_ulong_t
Date: Wed, 10 Apr 2024 16:47:39 -0700
Message-ID: <20240410234740.994001-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: 293d367a-adbf-428b-22a8-08dc59b89e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ogr6uBxTnxgTj99C/iDnAqFU0kbREFzKw4LECr69WNyoafHJYXOoA57svm3urbqif1nv2gog1LaiExvbwBx3/piJ9PswmoTQgnlq9rPdOaIKS4ue3T+QcGkHmiuetniCCzA97sgUaJMw7YjeHPIOKXJXyloDmvR1GYzfyrJ6MzysUf1nk6JdmfeMyAAN89wm0lWrRecfFctn2SVFCeDJhZ3SqqbTYlh4GFQJIhGo3534XDfHrEI8GTy19nxnVBRR+83RAYFrkwB6JION+MYAYK/qxayV6d4Zaw9GfKlTn/q92IZK4EB72butZiN34W25ONOcQLN678cEsPLW+kTTGgqGSm45CTr/gWHhu9pvoFwfB/hjKovJ8YpNiJnVVKez7VzKDWyRRjGaS+e+IdL/W6/99J/cJikLsCySyrKeV1dq2b5kNaJTQ8rAyy3CmP4bDVoFbERperaGdJadU/3ne1nNDIlMvlLskK/GxVPWnOLAfkM9rqPC2gQt/NHGxzr02J7hEW2yhIY4fvrIBdB4zftqfDDuwB8OAhwz3cYyyPtB02Ls0NFB8d31HJERv+kOZiPNsRegNfKio9SwTM0LMtFhm76AbftVHBrShN3hrueHucV5ooF/uaD8G7FOcd86sZTrUOkAIajcPhW5qZKgBJZayD10zI2Y17M8bN1oeG63S2x8MqtbMdyzt1FbhE5rHUznN8AsQEiwEcLmzijcogsnXSdgfnNv2BGMmOltQmXEYLob4KlNFJUirN2wEMm8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:47:44.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293d367a-adbf-428b-22a8-08dc59b89e74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

The goal is to use only fixed-size integers in public headers, such as
uint32_t and uint64_t.

However, there are cases where the ABI changes depending on the
architecture. In those cases, adding #ifdefs might be the clearest
solution but it is also cumbersome. We already define a xen_ulong_t type
which is widely used in public headers and it is defined differently by
architecture.

Instead of unsigned long, use xen_ulong_t in public headers:
- it makes it clearer that size might change by arch
- it gets us closer to the goal of no unfixed-size integers in public
headers

Note that unsigned long and xen_ulong_t are the same thing on x86 (both
32-bit and 64-bit) but they differ on all other arches. However, all
the interfaces with xen_ulong_t or unsigned long are x86-only interfaces
today. Thus, this patch doesn't introduce any ABI or semantic changes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/include/public/kexec.h   | 10 +++++-----
 xen/include/public/nmi.h     |  4 ++--
 xen/include/public/physdev.h |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 8d2a0ef697..89164094d9 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -78,10 +78,10 @@
 
 typedef struct xen_kexec_image {
 #if defined(__i386__) || defined(__x86_64__)
-    unsigned long page_list[KEXEC_XEN_NO_PAGES];
+    xen_ulong_t page_list[KEXEC_XEN_NO_PAGES];
 #endif
-    unsigned long indirection_page;
-    unsigned long start_address;
+    xen_ulong_t indirection_page;
+    xen_ulong_t start_address;
 } xen_kexec_image_t;
 
 /*
@@ -145,8 +145,8 @@ typedef struct xen_kexec_load_v1 {
 typedef struct xen_kexec_range {
     int32_t range;
     int32_t nr;
-    unsigned long size;
-    unsigned long start;
+    xen_ulong_t size;
+    xen_ulong_t start;
 } xen_kexec_range_t;
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00040400
diff --git a/xen/include/public/nmi.h b/xen/include/public/nmi.h
index 5900703f5f..c8c0ddafc2 100644
--- a/xen/include/public/nmi.h
+++ b/xen/include/public/nmi.h
@@ -43,8 +43,8 @@
  */
 #define XENNMI_register_callback   0
 struct xennmi_callback {
-    unsigned long handler_address;
-    unsigned long pad;
+    xen_ulong_t handler_address;
+    xen_ulong_t pad;
 };
 typedef struct xennmi_callback xennmi_callback_t;
 DEFINE_XEN_GUEST_HANDLE(xennmi_callback_t);
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index 03ccf86618..5bbb809fae 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -109,7 +109,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_set_iobitmap_t);
 #define PHYSDEVOP_apic_write             9
 struct physdev_apic {
     /* IN */
-    unsigned long apic_physbase;
+    xen_ulong_t apic_physbase;
     uint32_t reg;
     /* IN or OUT */
     uint32_t value;
-- 
2.25.1


