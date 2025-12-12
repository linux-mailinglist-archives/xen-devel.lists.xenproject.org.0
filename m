Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D865CB9F18
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 23:30:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185954.1507884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBeP-0000JV-60; Fri, 12 Dec 2025 22:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185954.1507884; Fri, 12 Dec 2025 22:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUBeP-0000HB-3O; Fri, 12 Dec 2025 22:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1185954;
 Fri, 12 Dec 2025 22:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL34=6S=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vUBeN-0000H3-Ac
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 22:30:11 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 182822b0-d7aa-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 23:30:00 +0100 (CET)
Received: from SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::17)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 22:29:54 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::71) by SA1P222CA0080.outlook.office365.com
 (2603:10b6:806:35e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 22:29:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 22:29:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 16:29:52 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 14:29:52 -0800
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
X-Inumbo-ID: 182822b0-d7aa-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDU8hHS28m1eVw5uuC8VnZaGVl3UmFtePs9HnkOfftetiTLQDBdhqu356oN6qMsD5e9tjcZiTaAqAxuss9ArX57u1/R6qVdZ9q7LLLVpMqOK7oluOLqlubed5nRrsZPoHXTuuPF6pRdOrZCriSoKKM4ZjMMgTElU0w00u0gDw+ZGSYgJTPK9v9gQICfraD+8c5kECfyu6zQ4PotNDpKV+Oha8GDXaB5pcPQqxE+iId7rRuzVOdaOi5lcIBMdPZEUljbSldt5GQUBswynBp+GClsiFNnqexA9ifdHZoPEipLp1x+l5c2054GffaYnef6J1yBqjx1VJCh3f9O6Nd1fKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHt93iO4Bir86TPYeBqDCrXpSjAw0WEGbKSHRnGDY7k=;
 b=s4REc3b5A4oUyHrmj3lSvYltTp6LRjsRhOJ6AHQ41P02Z1Jcq+flp7PjOfhtFQfuA7YrZwNXsc9AET8iE+9APKhOxq+oDY3Ap4Acjq5KEQA1FDS1ED6oJ7A3ScGAAmZ6YECeqHPO7mG17+UaOOLGdigKBmCUsclaEO0gMQ6820CGfQfyEXBWYs1X1j1by3cqliezQwJll9s7uKnGeFI4iy9A6NkcGp7IfBXx32fhjkUQSr+r7j0prmGO/qT5aJVFH6XFupLWBPEqtb8JGLv0FOmWT/H9cK8xWQJ5k57pS37JH3Kv5DHh5rRVMG44xv7kS76gpXMSDS8920rqrdJO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHt93iO4Bir86TPYeBqDCrXpSjAw0WEGbKSHRnGDY7k=;
 b=XqzdT5+cTaGMLVWcNEIsGBqPg3SJZuivl4YB+GpWk+k6p4AUjWMnrwb6cAoNwvyqvbbEaNRITejBCbn12iLg8Nl8HXID81cRLbz6HyjzEwWh34OODOV0IKsCAR+E74p7o5i4Sdg5CS7LKzbWWAmyP0wetUOw8SDdKu7DTNVoF1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/x86: Pass TPM ACPI table to PVH dom0
Date: Fri, 12 Dec 2025 17:29:49 -0500
Message-ID: <20251212222949.626539-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: 113dfd83-3fff-4456-dab4-08de39cdf88f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JBVeJ346g2O8kfTT17JjvlIQ75LLkXQCKBQZTiPrRC0AyWllgSZtW34cj0/k?=
 =?us-ascii?Q?jHoM8No4pzF3KjMhwb835kt5bDNA+DWOxbC0YTogqNjNjLbarMLt47jKPdHc?=
 =?us-ascii?Q?UDEyyS2xgviyIH3XacRx5oe0MQ3Nfk+lDw+SFeUtUAybgtJh96WAycBS2fp4?=
 =?us-ascii?Q?uz4sEutmhq7153SFtkXLhvwA9oyoxlNwKnoVMARJsZRHy4hhWBzxA9U2Cjbo?=
 =?us-ascii?Q?DmwamxXBGizFC4FtFQadAyJCU6Se9sOffPuhZsqJw96w0Q8iX8mkJPtBMqN0?=
 =?us-ascii?Q?5H45wiHLAExByKD84p97F1fkreyJG8d24sj/3HPT12sSQabZD1fA/eMeuzIU?=
 =?us-ascii?Q?Y6VJip7PrdvaJs4Vww5fkARFY4z+ld68Y0GMexLoqtLpzBgeIOQA82KfJVEj?=
 =?us-ascii?Q?YSkLMiI62IU8wIZeGqLXfOkQk7+/0RQIkoDQeBmvjm3eQOsyAkI5h5XjTI+Q?=
 =?us-ascii?Q?7I6U7/bhGSU41Cr3ATUElXdx0R8rSLKTu5K7Ms5REVAFphPjigVMtMpR/xJK?=
 =?us-ascii?Q?3pJPXxeox7gIbuCjL1++eK56A0+Xz9CzEeOnlUtMWCioleNRIDQFu1JXTgf2?=
 =?us-ascii?Q?zifQM8K+aaQeMFM/MyO7wxSssg+CvPmeU00PfqE/53rcZl+JGiEaAFz/tt/j?=
 =?us-ascii?Q?fpIzwOO0gzSicCJ4WUrqZ8oKbTDSmg+cOR96vTlmyysGH5xbW3q/bj63MdNv?=
 =?us-ascii?Q?McsONVTrpoqknnsoI+lY65HCtuEgsZj2LudGgo2ak3zhhUHHjq953C70opaA?=
 =?us-ascii?Q?MWJPGDoLxdj98s/OqxRyW0xI3VmxzhMeCohIiC/iJ3dlwgaW6qS0jsZ2ntvx?=
 =?us-ascii?Q?jnSZ5hV97OFgoSaGZGJN29fcbh1pa0JUoB1XC5Vh8HW/aNW5wOOhkCGnw/V4?=
 =?us-ascii?Q?9+npOaQiaC3JlZo6bw+94p/af95UMeDIdFbFhm6ulMdZEi1McqF5gIjUX6+s?=
 =?us-ascii?Q?9nHwGS6a2tDQhD5t4tWRof4pUfi7G4bLCNyS4mdQIaBC9nYIIKHvEhoINseN?=
 =?us-ascii?Q?gZg2a5SWDAiHxim8kDjShrXcENPG119fP8XTOqwYgy0QZjKhME9YqDLN84mj?=
 =?us-ascii?Q?qPdVuxMtWzaWtXkU6sOLjc1kBd0ZLMCbfXes5hbhPga+hnRRA6DWKKCszKT+?=
 =?us-ascii?Q?EVLUuo8nIXkaxf6ziN6LdRHolYGUbu37HusyNwh9eNAFGdVrqLvG2hjcYvz0?=
 =?us-ascii?Q?dzR/RqYVj4/FN8FQD1KK1J+YjFMxIS5QNFCBPH3bP5LGUy4f4qVgyOiK/QSa?=
 =?us-ascii?Q?KnVBI8xN/oXVxCVY/ZX2NtYx8WgZ3zBVCP8YAhByJUxjU0uaSimJOqZDeICu?=
 =?us-ascii?Q?9RjyA8LhnOfMTP7ZbVx9cN32UtoLKq4cobP/2v75SCdrVZtN3D7+fIvfrmZM?=
 =?us-ascii?Q?5gDKDzMXwS6boq0vPtcet4c0Yh0iNpeM51A9n8+mZAxXLLgSJEV//JFpwZNR?=
 =?us-ascii?Q?kd/L/PQB52lLlcGh6ba2kEvNO2uG2XcaGfF1Hxe6TPIR6SolAy2cfoC0sWCb?=
 =?us-ascii?Q?H+KvU6c7ZOoRPjXLpPm1iiAtSjIUkBU/3KnohogG7p2+Ft5Ft5YTNICKOFdp?=
 =?us-ascii?Q?+nuoEUjUfvLAGKMoyJA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 22:29:53.3795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113dfd83-3fff-4456-dab4-08de39cdf88f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840

Pass the TPM2 ACPI table so that the device can be found by a PVH dom0.

Otherwise dom0 shows:
tpm_tis MSFT0101:00: [Firmware Bug]: failed to get TPM2 ACPI table
tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -22

TCPA is "Trusted Computing Platform Alliance table", but it is really
the table for a TPM 1.2.  Use that as the comment as it's more
identifiable for readers.

While doing this, move ACPI_SIG_WPBT to alpabetize the entries.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Only TPM2 has been tested.

AIUI, a TPM 1.2 is probed without the ACPI entry, so it is usable.
But since I know the table exists, I added it.
---
 xen/arch/x86/hvm/dom0_build.c | 2 +-
 xen/include/acpi/actbl3.h     | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 5ac2cf8394..7eccadf7aa 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1013,7 +1013,7 @@ static bool __init pvh_acpi_table_allowed(const char *sig,
         ACPI_SIG_DSDT, ACPI_SIG_FADT, ACPI_SIG_FACS, ACPI_SIG_PSDT,
         ACPI_SIG_SSDT, ACPI_SIG_SBST, ACPI_SIG_MCFG, ACPI_SIG_SLIC,
         ACPI_SIG_MSDM, ACPI_SIG_WDAT, ACPI_SIG_FPDT, ACPI_SIG_S3PT,
-        ACPI_SIG_VFCT,
+        ACPI_SIG_TCPA, ACPI_SIG_TPM2, ACPI_SIG_VFCT,
     };
     unsigned int i;
 
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 6858d3e60f..b8db95a18b 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -78,8 +78,10 @@
 #define ACPI_SIG_CSRT           "CSRT"	/* Core System Resources Table */
 #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
 #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
-#define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
+#define ACPI_SIG_TCPA           "TCPA"	/* TPM 1.2 Table */
+#define ACPI_SIG_TPM2           "TPM2"	/* TPM 2.0 Table */
 #define ACPI_SIG_VFCT           "VFCT"	/* AMD Video BIOS */
+#define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
 
 /*
  * All tables must be byte-packed to match the ACPI specification, since
-- 
2.52.0


