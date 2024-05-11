Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3868C2E49
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 02:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720145.1123229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2P-00086y-89; Sat, 11 May 2024 00:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720145.1123229; Sat, 11 May 2024 00:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2P-00084N-3p; Sat, 11 May 2024 00:56:33 +0000
Received: by outflank-mailman (input) for mailman id 720145;
 Sat, 11 May 2024 00:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5b2N-0007p5-3Y
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 00:56:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c44d00c-0f31-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 02:56:29 +0200 (CEST)
Received: from SJ0PR05CA0136.namprd05.prod.outlook.com (2603:10b6:a03:33d::21)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Sat, 11 May
 2024 00:56:24 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::e7) by SJ0PR05CA0136.outlook.office365.com
 (2603:10b6:a03:33d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.18 via Frontend
 Transport; Sat, 11 May 2024 00:56:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:56:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:22 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:56:19 -0500
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
X-Inumbo-ID: 4c44d00c-0f31-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/GTqvrUh3lG7vVOODAiuRg5gsaArpYy5zp/D0mu5yZ1/RudkWsk9y5k/zKjMRuiVxcZmSdgpXQy1CP4vWIFnVGUAWMMDEbPxzeEJU9R9xk8XvG5R7zMxY96NOMJeI3BZzVECwJ90oQhCLJIWPFlvoKMt+EW5/QQCGQqhO1OsrKISo2mmoq2V1DfMcA+0WneXI6603qySECDsXZdR2lUTd+c3VbXgKRktzWrQc8SX/FVPE8brgVhvVThSxh6u5U3hVhS0NZX1G8H54k4WvBF5PHdqwvczry/eionr/HapQOTA1zJZ0SVndvbT0deQ/14iiXGi/t3hktVwywb+agAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pDtPG/gwtKzswtOqvdxKDHnF7RDE7VlIypy2jSq22o=;
 b=B5lhSGdWmNKbjWDV7srQNFt4QaBPG/CT6c0Jweo5eJrSV/TJoeetYN9TzBDserlSrme+IfrdElCy72UPml+8iHA8Ox0sHBLtX1bvIfjmfuStkuty5daS4daEoJGRsYITSydE/T7zX5gUE/FylwSiskfgj9UH1fiR/3Va+S+Bmx/ih7HSLpOOg5OvJfHiy2wfutNY9/MgEM2vlIf3yEofoSoKVsE6bnHoO8mZ5NgNGH0d2ES1w2hKXXYk0nuctveeXpVBwYn1GZPPf1Mk+A8CFGM4r55FoVCPYB+Jh/VJ2S1e5yeYWTDg/HOi0Dr0CfgIQFlkEmVv9s4VGHOE3YGl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pDtPG/gwtKzswtOqvdxKDHnF7RDE7VlIypy2jSq22o=;
 b=Wfc0LLInNkZZiaLcaMQ4zg6Dh+CViHAkWJo87ZadO0j0kYBfrHMTGuPCqjm33V8nGegM4rhnyp+lVRTnVtmdIYiQbS5Uv0wcyObCYJi8qciSffhj+CC6hTHvsbkjYn5Irat/1IBmcir36FfQlggVH+aZ7294FaQx8QW0EN7uOGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v2 2/4] xen/arm: Add new HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} keys in HVMOP
Date: Sat, 11 May 2024 08:56:09 +0800
Message-ID: <20240511005611.83125-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511005611.83125-1-xin.wang2@amd.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 74eccd9c-6c6b-419a-0958-08dc71552dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kg+ZdbpbSZavsTg+6Plfd2hHqc2S9v5hb4o/i4O/w9JNQtZEAEUipThT+/Ll?=
 =?us-ascii?Q?XFqH04Z3YJaQhY4aNs1da2EsVH2VIh/ESpYRrRgGLt9rQPW65/NZ5Juq/G7O?=
 =?us-ascii?Q?Xx/qfej/cmRnLXL2H8696v+RSAQV7J5b/CJanexpwb+s+N2XXf+vVbwmV1/S?=
 =?us-ascii?Q?B8j2fsArazyY5INhq2KA+XX9kkDK34dHkGEo7Tq269ljoOTOIzgBt2y1KFza?=
 =?us-ascii?Q?zoeCpcMkJkJaqKq27fASF3t51jlJzHi03UhgN0zseN1pWtzrMwwFqP2TL2NB?=
 =?us-ascii?Q?493tS7dRKvhdB54sSR6mP+Yt8cgHujg7IliDWFR0zY3tVYAQ6QXHhk1WUXmx?=
 =?us-ascii?Q?fw+CYe4yD8Z/uvNgiieD/cJ9vnLZ6pIkTeJleeDK5E/MVkLAKpm0GpffMDGq?=
 =?us-ascii?Q?00tRoIjaE4wahjsRET/75Ywvs5VfchY9MrJ8pu3zxfHQU/gF0prUQqrCmHYi?=
 =?us-ascii?Q?ZI9oUohf9d1WR94hZjfANJPbqt2vHz/pfUYKzwGRFP+bNNyV4nyHPdv+YiNn?=
 =?us-ascii?Q?omXXoHkZnu5cInLXjv7T1n7L619+uOGcYUClMlRRtSHJfNayO2AWFoXMI+EB?=
 =?us-ascii?Q?x2U7WuYANssyAqwDH03TAwBdSTbhP8IcJtVXujkzbpcMWqeTEgxnCzA7ZRGf?=
 =?us-ascii?Q?+ubVUM/yffbkZBU8XFthtzvmMguY/GL6I+G8eXj79sJQyCvDN8NVF8Fwci4G?=
 =?us-ascii?Q?EZy5Af4lEsPF/S0nj25k5JlPYTLBkkM/pnWhUjLwiv331WetljMC43SPTZJ6?=
 =?us-ascii?Q?ZnFMclvda41bA1OCuNy41NPRN8/CQUHTuxNsiOWXLJPOZxY5rS+KT9aQizWI?=
 =?us-ascii?Q?gJuKUDq62u8qzYVWlbgqaQZr5v3UUn3ZfSNErCUpTrqPFER2xDsUOxyyhLLq?=
 =?us-ascii?Q?SXZ2cJzgmwkcte7f2QTr4Xxpo5YdoNSoAx1P1w2+o/fUs7ITzP/nbjq51e9z?=
 =?us-ascii?Q?KsSqFG6DTwyt7qq2X8QhZHdJ2nhAnYv8Js/pldAyVEKzPbtQPBHG0txU8eMt?=
 =?us-ascii?Q?SiBjIJS4ZxVFVQBOg3ojNkDzCWXsMfhpGzutD4OA1GsejvEo/GAxMzJVirkR?=
 =?us-ascii?Q?vQa0Qt0NpeQpEHWX58wOmny3qZvrhFSjKpjwt3wKMjKJvg6nP0O+40/K4E8A?=
 =?us-ascii?Q?RsUhZaFnvG4lVZNaDqPxa0sSm1EM6UA/pArbP46Vma+g+FD87N6L1AWlkXi1?=
 =?us-ascii?Q?fLPUrEQgYXH+ouiJ5+4lVowGxoMkebemM+k+Bc+EYUHNB5pMz1k8IMCTWwst?=
 =?us-ascii?Q?KRRBXUt5e9GAz1tozlv1WGyHmzsKr/MDMlCYEodmfGjuqf+D8nPOQ7hrXgWj?=
 =?us-ascii?Q?IuLeYTwb6Iue24FTpHmQXBzCex6HyVtrjvANn8AEuMRWvv7jBWUdPEXj12l8?=
 =?us-ascii?Q?q+UMv4w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:56:23.2932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74eccd9c-6c6b-419a-0958-08dc71552dcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452

For use cases such as Dom0less PV drivers, a mechanism to communicate
Dom0less DomU's static data with the runtime control plane (Dom0) is
needed. Since on Arm HVMOP is already the existing approach to address
such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
add new HVMOP keys HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} for storing the
hypervisor reserved pages region base PFN and size.

Currently, the hypervisor reserved pages region is used as the Arm
Dom0less DomU guest magic pages region. Therefore protect the HVMOP
keys with "#if defined(__arm__) || defined(__aarch64__)". The values
will be set at Dom0less DomU construction time after Dom0less DomU's
magic pages region has been allocated.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Rename the HVMOP keys to HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE}. (Daniel)
- Add comment on top of HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} to describe
  its usage. Protect them with #ifdef. (Daniel, Jan)
---
 xen/arch/arm/dom0less-build.c   |  3 +++
 xen/arch/arm/hvm.c              |  2 ++
 xen/include/public/hvm/params.h | 11 ++++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4b96ddd9ce..5bb53ebb47 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -764,6 +764,9 @@ static int __init alloc_magic_pages(struct domain *d)
         return rc;
     }
 
+    d->arch.hvm.params[HVM_PARAM_HV_RSRV_BASE_PFN] = gfn_x(gfn);
+    d->arch.hvm.params[HVM_PARAM_HV_RSRV_SIZE] = NR_MAGIC_PAGES;
+
     return 0;
 }
 
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 0989309fea..949d804f8b 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -55,6 +55,8 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
     case HVM_PARAM_STORE_EVTCHN:
     case HVM_PARAM_CONSOLE_PFN:
     case HVM_PARAM_CONSOLE_EVTCHN:
+    case HVM_PARAM_HV_RSRV_BASE_PFN:
+    case HVM_PARAM_HV_RSRV_SIZE:
         return 0;
 
         /*
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index a22b4ed45d..337f5b0bf8 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -296,6 +296,15 @@
 #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
 #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
 
-#define HVM_NR_PARAMS 39
+/*
+ * Base PFN and number of pages of the hypervisor reserved pages region.
+ * Currently only used on Arm for Dom0less DomUs as guest magic pages region.
+ */
+#if defined(__arm__) || defined(__aarch64__)
+#define HVM_PARAM_HV_RSRV_BASE_PFN 39
+#define HVM_PARAM_HV_RSRV_SIZE 40
+#endif
+
+#define HVM_NR_PARAMS 41
 
 #endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
-- 
2.34.1


