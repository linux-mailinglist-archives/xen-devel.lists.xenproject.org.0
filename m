Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77FFA7B19B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937342.1338370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOG-00015B-B5; Thu, 03 Apr 2025 21:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937342.1338370; Thu, 03 Apr 2025 21:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOG-00012d-6o; Thu, 03 Apr 2025 21:46:24 +0000
Received: by outflank-mailman (input) for mailman id 937342;
 Thu, 03 Apr 2025 21:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOE-0000LK-ET
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:22 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:2409::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13887f1b-10d5-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:46:20 +0200 (CEST)
Received: from BN9PR03CA0975.namprd03.prod.outlook.com (2603:10b6:408:109::20)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Thu, 3 Apr
 2025 21:46:12 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::7d) by BN9PR03CA0975.outlook.office365.com
 (2603:10b6:408:109::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.25 via Frontend Transport; Thu,
 3 Apr 2025 21:46:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:11 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:10 -0500
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
X-Inumbo-ID: 13887f1b-10d5-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHC64li2N7s842xsH/lbTDyHbbIz55gm6oYoaeZbJmwl6nm/1DGysckuF7Htr8etaSqN8hZNPjVPMI81A5JAXheXJht087QbkwLwpDLCo8nz9b/Yd8I0iO/Ku7+85cjJXRg7//QCz0CZ0AywX+cP2TxOdwbwzGQVaPZGT+TU1uMhETYjczchQlUB/QUX9LuvnJU4c4JFPjmWVb0IWeclvhA91b7bWtNS19FepRMfCDS4+9DpLN79E+gUm6lkwWZPC63BqX8BD9WfWANkY/8widvYvgn6cXAhnd6YoA8pwGLym0DMRpnsCakPhJ+sF5FILW3dmJ0XCPASpyZw4lIvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQHFzDKnNDGytpctVWKmIThcFF4nssmMh+JtL5p8sGY=;
 b=P0XbcjGVXtmzs00eMWKThYxeySUVYVT3r07Ew/kTXZYIRPf2MqyUuH5L9rPEtI77eWZyIyAk/o7sVdqlB6aO4EvVCWBpe0DTfK77AgSQio8O5wvQVNwR8hPAYPmimb9H5tH+iO0CIQhvxdxjNCLD3gRLTOs7cSmEmsuL7L/aD6SbKf3fnI8BbtIFevpVKMEhJZtWpGOSqYpyO0S3WXK9FlTnsDJLCLawALYEaFZ3/Q49rB1x9WY2Si3304wKpVovMDI2hXlQe18t/0BqQ1+uq2OJhmomalVHCVeEBAEWIOoYmfy4qAX3mXjgHX6NNKEXseWPXdskNoAdQp/z831ONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQHFzDKnNDGytpctVWKmIThcFF4nssmMh+JtL5p8sGY=;
 b=b5yleN2PIgXfP/oNEhEUa3UikGEOqq4GbD6cFvwlX+VgBtdWa6h6Qd4lHFGIIg2a6J/5GpA2jXq7QViQLCjahFv7Y07J0zw9UCpdCBIjxjJv26Bj/rAHMlNRjdAsD2OEFEdr68MdXAFajdvAszVo7VEfPsX7q5tXvbaHL4h+QUM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 1/7] xen: introduce hardware domain create flag
Date: Thu, 3 Apr 2025 17:46:02 -0400
Message-ID: <20250403214608.152954-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5f4112-6fb5-4a54-fef1-08dd72f8f3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+raaxEOxIh3uGbT2FD2VIPon+vOmGhEcSD0dhi0EQ7gnSiFG/YXgkPSX1WZB?=
 =?us-ascii?Q?dDffEyCULEJbCwUCzpTtsqYnFi/c5q3cf6J/9+7W/Gc5J70LO+4dLyWNvgnY?=
 =?us-ascii?Q?JDTUdnyASH0L4RAtikQBiJEUJFw7BWPGywkcPLgfucsj+qA673DEnDF3V+Bv?=
 =?us-ascii?Q?GbF2EpEPTUZBMZzbEH+X5dLLAppA+L8sutwXcHxsYk+k8d9YNXeuzRQgQ4hZ?=
 =?us-ascii?Q?GmGjQxvdvoWs9NMGYA13ouoOTHCKAr/nKq5QeuD8vLdkChDXwlSOt9cs6DsU?=
 =?us-ascii?Q?IxmekKHaMGBLMqregqIIIJge8w6N3KcJ8q8S+0Cbfxw2fZP6Q/EeFdLJjPNv?=
 =?us-ascii?Q?0YlLmkIkoqLmuSJxQ3nFT9bbm8cn3gEnZ8XgnzPzi9f1lyfO1HHbFxpsNT3P?=
 =?us-ascii?Q?FejzsgdyP3NW4YervMP6iTQlXiQlNdiyPg4Tgj9wlmScT6r6fal66ewXtjVA?=
 =?us-ascii?Q?KkPj/MgOI4Cd8LSyrSo+ambnF7BqazwILDjX4j4VMYGyHtHjNoTA3fl+DUsw?=
 =?us-ascii?Q?fKab9NqPcdF/XgT/RaOacO+sV5fVukUB1tASSiIIY9g9Ywsj3xuGN7mhHcA5?=
 =?us-ascii?Q?4Ua0GpqiyQwbKTU+Rh8ZYlgHkJjqK9OsqovfuTlOc+5MK0Q4YDtyZP8l/7cM?=
 =?us-ascii?Q?vrn20VQiz0w3gp0DZdMIqH4ldAI5+oG1pVHt0EHoC58zpCc4JZvXy9ItSQOi?=
 =?us-ascii?Q?igD19ZKes2gpAjbJKIQ99fXbXo2LDk87UacQo5/Xjkx5SFUWR8Asl+8yjT/b?=
 =?us-ascii?Q?MIbyXXg7pLrpevSG1ztkSvRpwZ6r8RZeekEsEfYAa0MLtv/ip0rfBU59c4Q5?=
 =?us-ascii?Q?H70B9aeHitoOVHo0Ezb8Gt2zWsHuPxE4Iz8zHR91ie64R5gxda32CF/s+Lw3?=
 =?us-ascii?Q?vT4+GcVzAPoQVzSrQwSVykCBs3lt2LuQByPgODgMAd8/mFPeoJEpReIPl/vs?=
 =?us-ascii?Q?S6QtDvQYteUrKytfAMB5Jtdij5/sbQLk8HCcvwwSefmTq69Bj3Bd85FM3TOA?=
 =?us-ascii?Q?/gmhFZB5CNWBZgIa5xvY2+7csvZDYfza7eaXvhJ6AP+VCLcQAOk/69osPZYb?=
 =?us-ascii?Q?zNU5RwHE4daqw3czLYOl45p7YbYvXCKMHEHNHA4oRuT2IEtK5PcVuJQtKJqp?=
 =?us-ascii?Q?Ufnhiki+Ku4FvUB5XWNmynycM5xd0DHirNYb7AanIv/yKIcpvhxVcTRLqD7U?=
 =?us-ascii?Q?kZdgG8xemEAwtuTr123t/5bbFiyRSrXU9g79P8hCEAmwEwABdZGyZ5VuV1S1?=
 =?us-ascii?Q?d6XH2FInCarjYlGszs2f4Vv5qGrzU70iqKEIRK/Taz6y32jnyr0Ef4uzZdzs?=
 =?us-ascii?Q?Vu5r6i8971v6iUaesRja4D/c4R6XJgQDhvt0AzblyRQETs4rGMryY1iK5d/9?=
 =?us-ascii?Q?UcrT/3Qs8Tx6gckXB7Ef+dNkCRvMT3nnLdiJ35AT4wPbPhz58+FDVncQ2c3S?=
 =?us-ascii?Q?wTuxLwGVDxQzMy6sngv/fHncJnT2gp/UMb6/TyqvY1YU2N5zZeUVjw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:12.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f4112-6fb5-4a54-fef1-08dd72f8f3ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add and use a new internal create domain flag to specify the hardware
domain.  This removes the hardcoding of domid 0 as the hardware domain.

This allows more flexibility with domain creation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v3:
Or-in CDF_hardware for late hwdom case
Add Jan's R-b

v2:
() around binary &
Only allow late_hwdom for dom0
---
 xen/arch/arm/domain_build.c | 2 +-
 xen/arch/x86/setup.c        | 3 ++-
 xen/common/domain.c         | 7 ++++++-
 xen/include/xen/domain.h    | 2 ++
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 634333cdde..b8f282ff10 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2369,7 +2369,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
-    unsigned int flags = CDF_privileged;
+    unsigned int flags = CDF_privileged | CDF_hardware;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70abb7e0c..67d399c469 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1018,7 +1018,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Create initial domain.  Not d0 for pvshim. */
     domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(domid, &dom0_cfg,
+                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 585fd726a9..da74f815f4 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -820,13 +820,18 @@ struct domain *domain_create(domid_t domid,
     d->is_privileged = flags & CDF_privileged;
 
     /* Sort out our idea of is_hardware_domain(). */
-    if ( domid == 0 || domid == hardware_domid )
+    if ( (flags & CDF_hardware) || domid == hardware_domid )
     {
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
 
+        /* late_hwdom is only allowed for dom0. */
+        if ( hardware_domain && hardware_domain->domain_id )
+            return ERR_PTR(-EINVAL);
+
         old_hwdom = hardware_domain;
         hardware_domain = d;
+        flags |= CDF_hardware;
     }
 
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index a34daa7d10..e10baf2615 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -53,6 +53,8 @@ domid_t get_initial_domain_id(void);
 #else
 #define CDF_staticmem            0
 #endif
+/* This is the hardware domain.  Only 1 allowed. */
+#define CDF_hardware             (1U << 3)
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
-- 
2.49.0


