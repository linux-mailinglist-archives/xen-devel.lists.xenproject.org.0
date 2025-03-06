Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118EA55948
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904069.1312023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK0-0001ru-Sh; Thu, 06 Mar 2025 22:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904069.1312023; Thu, 06 Mar 2025 22:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJK0-0001mQ-L7; Thu, 06 Mar 2025 22:04:04 +0000
Received: by outflank-mailman (input) for mailman id 904069;
 Thu, 06 Mar 2025 22:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJz-0000Ss-A9
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2417::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e3402f-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:02 +0100 (CET)
Received: from CH2PR18CA0044.namprd18.prod.outlook.com (2603:10b6:610:55::24)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:03:57 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::13) by CH2PR18CA0044.outlook.office365.com
 (2603:10b6:610:55::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 22:03:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:03:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:55 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:55 -0600
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
X-Inumbo-ID: e8e3402f-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVDL9TUBVc6TJ42XC6chKgATlMLtrut3e7ymOyXVIy4HdMCO0ZmlLEORpHu3Q+TiomO7mpjtIs1KifyxAVepcGT4yx1nwWHbsaVsvfvrU8SnCFPeg6KpMTrXcXxTG3wXX1yDtZWbw17Ag17L1pIhiwrlkclz7b/ELavCdCY1E5oOB+QU0l0n2Kfl0E/RIHpyLloUJrftIXrMNgp6XbONUffbCRI5Sk0oltPwPyK6I1bo4yP02LDtLMZkyA4ZQ4q/IN1Ux8OTaE4/9/vmPFCIudJeCkq5FKTz3ic+dmUKqSDCg7BO9RqFx/uTJZdQaLA2hwT0srqKCkM74OUbEo+UrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+m/QdRPMsN/ArRHcQsjPmQFgNz4Tb8oT1TBtzTvHvQ=;
 b=TA/2jOIzAWBpIGHNzfs2dIaqznCbt3ovyhwF+QJkcZ4zPMdogoNZaMKb9QHPRQaVe1OvvmBY/6sVNfg5A+YY/nTOBr443kdWp/B7IeovMB4pVWKE6yEpWCDbzReo5Fl+Bige5j6iKgjYwqEU0t0fFfJz+3Xa9FvXSSrLyv7HXQRZkX0Du5rg39hrX5s02CAuJqI0XuJGceav8R7HR5DU9sc2nhvVZMte5k+6I4kXFwOtEv6JN+c260Ubb6Tex+m/uULxctvePHyXNV/9mARUQGzKBjWZz72LPsOV4Wqold6/cSEsfyCtk0Y6swcEmdN+jIEPn7EUEOmcDV4Ct1IkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+m/QdRPMsN/ArRHcQsjPmQFgNz4Tb8oT1TBtzTvHvQ=;
 b=RnqK++Chx2NX5HI/1X55R/bEpNfw7XngiXisDpORQCtr5Ef/5kwb51Ke5B68zp1HucVu9gtt915o/7aBRq5mvEkJqxmFbZ2CLYYYRDvWdO2XPK6uwUwVBIXf4p6q0p5c+/xu1wNG9rFRaKx/RcoNAXnDWFF/5NMqL/3p22xi0Eg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 07/23] tools/libxl: Expose hardware and privileged flags
Date: Thu, 6 Mar 2025 17:03:27 -0500
Message-ID: <20250306220343.203047-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e417f6d-e3fc-4f50-c021-08dd5cfacaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMRLkGXCXAwlGkJY6M2CepOIB18Q4kY/gHFfeUSJUDkeuWLuTZz7n0IxPdVv?=
 =?us-ascii?Q?6TVtVqCex1gkxyqdLA+rYiOfG7UGQJ9wRz/SdkjrI2yruuNVpteoQLTkoHiM?=
 =?us-ascii?Q?QExMqYRji8Lab5sDvtcVvoK7+AxsFuF42Y4jzb8Uv361/ThmFe0PXVyr3Jtv?=
 =?us-ascii?Q?F3wwGQ8ycJtx9vjaM8Tm4VniVa4CRM9HgrXWnoNQHETpCIL/2fAYivR5IwOZ?=
 =?us-ascii?Q?Iheq8NyZtlKkqat8Bs0eP2TFVy/pz12UBYm+o/vF+F2OMNH/NEx6znRyFa56?=
 =?us-ascii?Q?Qi4SLjsJwTNtcGK9GJMd2vYZ+1ZBAJsYFYN3B1Ow9665iAUcOWF1t7/iHgjU?=
 =?us-ascii?Q?8ecywFlERMfW+T2iCgfpYTfG7JSeKaOhDDByXmwCc7pKCYhHnw5+WUDW7E33?=
 =?us-ascii?Q?wD3VQfRFKceOtT3JWjoYUnvRO2kB1J9+xqRsXxQgEqGwOzFByipnFjVtk2ro?=
 =?us-ascii?Q?SOMqelVha4SQauIHLg+NsxZ3jsimIWqKgZDCXb35wTJzGGpGCOMIf9r6nnv2?=
 =?us-ascii?Q?Ttt4H0ptW1E+n0P0CBhL2e1Z38moMRuzF7r7KPLatNXqyxdWddxXRjYhlmuc?=
 =?us-ascii?Q?fFB3oc6ayrqd4omj+l8NfCDLanjiLHUEblc6uBu4L8jgU756Z6++GTC2Ultx?=
 =?us-ascii?Q?ofZ5OcbXFSxR4N2dNdzpyESMLNQ50MUk7/awPAWQixp4kL9YUoO2kAmyNiq6?=
 =?us-ascii?Q?6LUzwZuerOjS9kUViWcuo+qp5o7/FAolQ3vuCsHtgLcocMmdeHUBqi0zRTjn?=
 =?us-ascii?Q?4CYwybQyMdFJHJC8AqlJYXYuqmCueBhP5O5gtPEaFk81r3KN8xdlMw4bmtjs?=
 =?us-ascii?Q?LE4tWYzu3HOlpAAF36ygdTqEO/4MKQCVSoCj8aP38zVbXkdGvzQ2UrUhLaM9?=
 =?us-ascii?Q?X02a9nMcZNlawbfCl+xuXI1f4Noa9wgJ1X+uyHSDVhG4nAt4NoQrFOfxgmEB?=
 =?us-ascii?Q?KdaREBoInloDbvHq0PH3we7MxYDX3f1JnJg5SrrNMnuOjZDY8+6GSgAI5OWl?=
 =?us-ascii?Q?OD0zNBS57PT3gnUMWA/MfhHvlE28uXxNSYRuLVkI+tPUrBUp2EvkeWFqphC8?=
 =?us-ascii?Q?/ouwuwm+67ZfB++ZoJwHkh3pSfX5LwJxZXULbfx2v5DTvu5+ajQ/wVn+zGBS?=
 =?us-ascii?Q?VeZhUwRzKyPMd1LlXtkV7zpqfsS0TbJXET8UHiaaIRYgG8aOwZJ9A05Vs5na?=
 =?us-ascii?Q?gXTA91bcsDTP4JiH4BKcNQejFtvOxRT4poK+zrThJzND1oZAJlbovN86JxF5?=
 =?us-ascii?Q?Rvnb3cO/sXr+Uib6SrS49LvUfEzo28pGjdBcC3TjsX+yG2vxD7XX9M08AD4K?=
 =?us-ascii?Q?JDemVpGW0o1qjo7f3thLQn/YSze2UYuxY81MkJHRMYC+dOdd8oxksEVbiF9w?=
 =?us-ascii?Q?LqRYNVmBrcAl7HALTL09nq/Pgwpontdssfm9pwuMITGUGG+2VuTUDk48NS6U?=
 =?us-ascii?Q?hB9z29kdmO972ru/mUIRr1U5lJ/IYcraPf9g1m30a2f0wZkkjmf5ukaoYera?=
 =?us-ascii?Q?fFYtfUBZLSC4Zwk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:56.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e417f6d-e3fc-4f50-c021-08dd5cfacaba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344

Expose the new hardware and privileged domain flags in libxl_domain as
boolean fields.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/include/libxl.h            | 16 ++++++++++++++++
 tools/libs/light/libxl_domain.c  |  2 ++
 tools/libs/light/libxl_types.idl |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f8fe4afd7d..bdf4c301c0 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1010,6 +1010,22 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_DOMINFO_GPADDR_BITS 1
 
+/*
+ * LIBXL_HAVE_DOMINFO_HARDWARE
+ *
+ * If this is defined, libxl_dominfo will contain a flag called hardware
+ * indicating that the specific domain is the hardware domain.
+ */
+#define LIBXL_HAVE_DOMINFO_HARDWARE 1
+
+/*
+ * LIBXL_HAVE_DOMINFO_PRIVILEGED
+ *
+ * If this is defined, libxl_dominfo will contain a flag called privileged
+ * indicating that the specific domain is privileged.
+ */
+#define LIBXL_HAVE_DOMINFO_PRIVILEGED 1
+
 /*
  * LIBXL_HAVE_QXL
  *
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 6751fc785f..c6e3072027 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -291,6 +291,8 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
     xlinfo->blocked    = !!(xcinfo->flags&XEN_DOMINF_blocked);
     xlinfo->running    = !!(xcinfo->flags&XEN_DOMINF_running);
     xlinfo->never_stop = !!(xcinfo->flags&XEN_DOMINF_xs_domain);
+    xlinfo->hardware   = !!(xcinfo->flags&XEN_DOMINF_hardware);
+    xlinfo->privileged = !!(xcinfo->flags&XEN_DOMINF_priv);
 
     if (xlinfo->shutdown)
         xlinfo->shutdown_reason = (xcinfo->flags>>XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdownmask;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index bd4b8721ff..4fab558896 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -365,6 +365,8 @@ libxl_dominfo = Struct("dominfo",[
     ("shutdown",    bool),
     ("dying",       bool),
     ("never_stop",  bool),
+    ("hardware",    bool),
+    ("privileged",  bool),
 
     # Valid iff ->shutdown is true.
     #
-- 
2.48.1


