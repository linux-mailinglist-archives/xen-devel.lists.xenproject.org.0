Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA2ACE73A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 01:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006038.1385300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxeF-0001A9-3j; Wed, 04 Jun 2025 23:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006038.1385300; Wed, 04 Jun 2025 23:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMxeF-00017O-0s; Wed, 04 Jun 2025 23:35:55 +0000
Received: by outflank-mailman (input) for mailman id 1006038;
 Wed, 04 Jun 2025 23:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A6Ei=YT=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uMxeD-00017I-Dt
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 23:35:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5251c0e-419c-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 01:35:50 +0200 (CEST)
Received: from SJ0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:33a::13)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 23:35:40 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::93) by SJ0PR03CA0008.outlook.office365.com
 (2603:10b6:a03:33a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 4 Jun 2025 23:35:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 23:35:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:35:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 18:35:38 -0500
Received: from ubuntu-linux-20-04-desktop.tail503a2a.ts.net (10.180.168.240)
 by SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 4 Jun 2025 18:35:37 -0500
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
X-Inumbo-ID: a5251c0e-419c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIZnqQcQdjBWrygGQrlBxO6Au3F0so/8uIA3aSH+9hWaa5JRwPM6y6T9LtTNp/qNMfn1AZvmfELfKEyZnjaHElboIT5V9eSwxJGKu5CoxKx2kx087zmdiRmKVeaw8nDfpAK9+zFMPzKuH/INxbgPO0AZvaWrQpRxxw0kaC0wR6sYZM7rF3TzyZVz8NGXZqj0X/0gK/2OfSmCOgUkZlqDUg5EpsIdCxBpAuAds62ZNHb5wy8Kre6OuZylBkH1wFAZ1jIMxIHFHZflXNk5UXb6EU3/v8ln2wj/TMl4I67kmxpX9vrfxuvB2xrybfJIBwgPBWxmqiIxku3lcPJqiCz9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uleT6ILVG7kx3wLTyOv2IoCuR7/et9OzSZjso4aXr6I=;
 b=STQSxsj+aZTLBASuRlTwZDNoXHb8iP/SqSFffsQyAQxT7+9Fg3GHdT1W7+9QZOD2hhuxUXbygAhzzb9f9wpRsC4c6Yaju2+HOPEKDoPkeg4JEiySBsUYy455rZVXkydICRkxYxdjeioFXgIQTleIeV8antg4I0t1iG1SRe8JcmW5sDBFaykYp2Ugj9tzbvvqi9sNNY/NY3IUmr2DhpvurGzlo5H3fCRB8CCDBgUH7DK9BVT9QEcUn4o8RXu0joo2+mtueish2j/e0X3OQdWjlNqhf86H5oKLJmgv11Gcd1WKbaRiUHyP1pIUmdhotD896QaNrBD60pvX4sjPDNb6lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uleT6ILVG7kx3wLTyOv2IoCuR7/et9OzSZjso4aXr6I=;
 b=CxT5bU4sevjz8DIbYgd3zXCUu+i9paFn6ld73isDB4WqgSUUhGU9RL9E/myoB2R4FeiFITtz34t5cbCZSq2osvLbtc1KyAvSgajibsb+YSDfuvJ8AebiWV/DJQHcI2MsL8UnlQCWgritaxG0MxMGKhDS6AxIrket35mZHXS4ZR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alessandro Zucchelli
	<alessandro.zucchelli@bugseng.com>
Subject: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
Date: Wed, 4 Jun 2025 16:35:37 -0700
Message-ID: <20250604233537.2892206-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e5b231-f937-4755-acde-08dda3c083a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzrhkUGhs1n5yosw8wwGYWTrRbp6g8xsSjkhw8jcOvrO4jqeYh6Q52DlZ4dL?=
 =?us-ascii?Q?CIffi6oWdY/M9RovNKXdzCtcDWz2q88sAetEdIheGUsPsQwOtFgqXHQoTmpi?=
 =?us-ascii?Q?xk1BttcwkGx0LhKIOOhHT7o2ZJCACA7p1P44TRHD9ymBUaTM/Hfj3uBnWBv9?=
 =?us-ascii?Q?r4SwmdtDkDIsAopKmU5t4uLYpDiKqSqvZbJRw+Tbcd6dSeq2+NcTrCU+BJDi?=
 =?us-ascii?Q?BoB/1/xt0aJTq0Z7oPDKePz32E+ykPrATbk/MhEVqu8S0yK1Ht/XmP69iLtH?=
 =?us-ascii?Q?xuMvJSY+7O4+wYMhGgxiJJMTW1/RVORkEd2pIehdlF43x57RzfiorFCoHCeK?=
 =?us-ascii?Q?b19JhK6iTnbIy/6QlUpvHwl4w/dw1NrxaCcC21xynMEcC0IkOARg1Ra/NOzY?=
 =?us-ascii?Q?+/aTu9TVeqxbjvgE2RViRPxumLezTe50d1ezOIog26Yw4yfKiW8DZuNoFZr6?=
 =?us-ascii?Q?Cuszu+zm0Z8uFscD7Gz74EoIT1aLArzwQ2Cxf7q6OID08wZTdp1GojO6n4uf?=
 =?us-ascii?Q?DbveQFY+pDylyoFItu10UvLcJPVe/5wZbs7LN4UXD9FKKMIUmyiVSVwtJEOn?=
 =?us-ascii?Q?ureQ5EU2X9Z/R1yAWcr46+AK3HkH5f3JS/ji7cXbNakQOEbAwJfITmBJC4gP?=
 =?us-ascii?Q?VJDF7MoXQnr4s7gY/+hHdaqFwEEYaXF/V0MlLzWMS9qkRDKwa6XEcLOsVBX0?=
 =?us-ascii?Q?sxmPFJVacnkfBSbraJpLs940Zxojditeobw8KG/X2Lj0PflPOTQhQiLcCkgP?=
 =?us-ascii?Q?Z/b72XW9OjacJB68qkFUanH3+GzIcsZL8wZzR38Nm8tyGmn2n7clL6og7ZhU?=
 =?us-ascii?Q?jCwkYI0DOOej/JA+MzwhpHqp03QNYM5AuXIxqccU8SO0E4E0gGgC6rSQdjQ/?=
 =?us-ascii?Q?s8ae0MIM5JrgL7rO7cQJNCK7ebJFsUw4lfhswDN+3HIEoj7Qd4VQ3kLvtBGj?=
 =?us-ascii?Q?A65aVglkBM18TSEKFaY75TYzbXk1HSUoriJ0nTBmCZ9NZM/V4Uog3gDptgOh?=
 =?us-ascii?Q?RCjqrHYiasiSYdPDmW3Us1anfvlp5GeaLbw3NiNCWxSgVm/V21M3KyR3TVGC?=
 =?us-ascii?Q?BVh5yExGivc8xYmlYjzTH1xfiPUuVVKUm6W9RhANWh4Cs6Xx3CvsMWe82+dj?=
 =?us-ascii?Q?XeNYUvOPBzcS1CHp3dkwMy8bFm5Tk4MIYMoy3CBwyis2YTFf8Lg0yAnYJFhX?=
 =?us-ascii?Q?2Y5vljyeLEheb1CuzTYuzjz/A/ybbr/7ff70wItZiV5nipgyeIMbyyihR+TR?=
 =?us-ascii?Q?TQhKwUPISA3OUvjB3LZnK9K7aJnf5NVW2W1lNrxDtbMgMBbJkjxyhUFVBC8/?=
 =?us-ascii?Q?g0AlI2z+1g7aC3EDKhtYnTsTIe9j4iAM4ceqyQCEtWzMWcRRHCzrTV/Hc8Rq?=
 =?us-ascii?Q?Dod11DVhPIL0F/Yky9VHCnArV7tFL7GGJf4nhlN6WnkafCjg2nV3dRwyEcsa?=
 =?us-ascii?Q?FsQ/FFQSgjfRukZBYJ/3cHumUsrz3uAip47IgVlsGYGugXKC6SNnjzowkyOr?=
 =?us-ascii?Q?EMTX7/jycIWGMQjU+gqvWOQa3/PjMrjAN/Im?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:35:39.2559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e5b231-f937-4755-acde-08dda3c083a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

MISRA C Rule 21.16 states the following: "The pointer arguments to
the Standard Library function `memcmp' shall point to either a pointer
type, an essentially signed type, an essentially unsigned type, an
essentially Boolean type or an essentially enum type".

Comparing string literals with char arrays is more appropriately
done via strncmp.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/x86/dmi_scan.c | 20 ++++++++++----------
 xen/arch/x86/mpparse.c  | 10 +++++-----
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index eb65bc86bb..b6edd7a965 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
 	const struct smbios_eps *eps = smbios;
 	const struct smbios3_eps *eps3 = smbios3;
 
-	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
+	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
 	    eps3->length >= sizeof(*eps3) &&
 	    dmi_checksum(eps3, eps3->length)) {
 		efi_smbios3_address = eps3->address;
@@ -241,13 +241,13 @@ void __init dmi_efi_get_table(const void *smbios, const void *smbios3)
 		return;
 	}
 
-	if (eps && memcmp(eps->anchor, "_SM_", 4) == 0 &&
+	if (eps && strncmp(eps->anchor, "_SM_", 4) == 0 &&
 	    eps->length >= sizeof(*eps) &&
 	    dmi_checksum(eps, eps->length)) {
 		efi_smbios_address = (u32)(long)eps;
 		efi_smbios_size = eps->length;
 
-		if (memcmp(eps->dmi.anchor, "_DMI_", 5) == 0 &&
+		if (strncmp(eps->dmi.anchor, "_DMI_", 5) == 0 &&
 		    dmi_checksum(&eps->dmi, sizeof(eps->dmi))) {
 			efi_dmi_address = eps->dmi.address;
 			efi_dmi_size = eps->dmi.size;
@@ -288,7 +288,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
 		for (q = p; q <= p + 0x10000 - sizeof(eps.dmi); q += 16) {
 			memcpy_fromio(&eps, q, sizeof(eps.dmi));
 			if (!(instance & 1) &&
-			    memcmp(eps.dmi.anchor, "_DMI_", 5) == 0 &&
+			    strncmp(eps.dmi.anchor, "_DMI_", 5) == 0 &&
 			    dmi_checksum(&eps.dmi, sizeof(eps.dmi))) {
 				*base = eps.dmi.address;
 				*len = eps.dmi.size;
@@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, u32 *len)
 				continue;
 			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
 			              sizeof(eps.smbios3) - sizeof(eps.dmi));
-			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
+			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&
 			    eps.smbios3.length >= sizeof(eps.smbios3) &&
 			    q <= p + 0x10000 - eps.smbios3.length &&
 			    dmi_checksum(q, eps.smbios3.length)) {
@@ -370,14 +370,14 @@ static int __init dmi_iterate(void (*decode)(const struct dmi_header *))
 	for (q = p; q < p + 0x10000; q += 16) {
 		if (!dmi.size) {
 			memcpy_fromio(&dmi, q, sizeof(dmi));
-			if (memcmp(dmi.anchor, "_DMI_", 5) ||
+			if (strncmp(dmi.anchor, "_DMI_", 5) != 0 ||
 			    !dmi_checksum(&dmi, sizeof(dmi)))
 				dmi.size = 0;
 		}
 		if (!smbios3.length &&
 		    q <= p + 0x10000 - sizeof(smbios3)) {
 			memcpy_fromio(&smbios3, q, sizeof(smbios3));
-			if (memcmp(smbios3.anchor, "_SM3_", 5) ||
+			if (strncmp(smbios3.anchor, "_SM3_", 5) != 0 ||
 			    smbios3.length < sizeof(smbios3) ||
 			    q > p + 0x10000 - smbios3.length ||
 			    !dmi_checksum(q, smbios3.length))
@@ -406,7 +406,7 @@ static int __init dmi_efi_iterate(void (*decode)(const struct dmi_header *))
 		memcpy_fromio(&eps, p, sizeof(eps));
 		bt_iounmap(p, sizeof(eps));
 
-		if (memcmp(eps.anchor, "_SM3_", 5) ||
+		if (strncmp(eps.anchor, "_SM3_", 5) != 0 ||
 		    eps.length < sizeof(eps))
 			break;
 
@@ -429,7 +429,7 @@ static int __init dmi_efi_iterate(void (*decode)(const struct dmi_header *))
 		memcpy_fromio(&eps, p, sizeof(eps));
 		bt_iounmap(p, sizeof(eps));
 
-		if (memcmp(eps.anchor, "_SM_", 4) ||
+		if (strncmp(eps.anchor, "_SM_", 4) != 0 ||
 		    eps.length < sizeof(eps))
 			return -1;
 
@@ -437,7 +437,7 @@ static int __init dmi_efi_iterate(void (*decode)(const struct dmi_header *))
 		if (!p)
 			return -1;
 		if (dmi_checksum(p, eps.length) &&
-		    memcmp(eps.dmi.anchor, "_DMI_", 5) == 0 &&
+		    strncmp(eps.dmi.anchor, "_DMI_", 5) == 0 &&
 		    dmi_checksum(&eps.dmi, sizeof(eps.dmi))) {
 			printk(KERN_INFO "SMBIOS %d.%d present.\n",
 			       eps.major, eps.minor);
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index e74a714f50..c86c38f191 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -303,7 +303,7 @@ static int __init smp_read_mpc(struct mp_config_table *mpc)
 	int count=sizeof(*mpc);
 	unsigned char *mpt=((unsigned char *)mpc)+count;
 
-	if (memcmp(mpc->mpc_signature,MPC_SIGNATURE,4)) {
+	if (strncmp(mpc->mpc_signature,MPC_SIGNATURE,4)) {
 		printk(KERN_ERR "SMP mptable: bad signature [%#x]!\n",
 			*(u32 *)mpc->mpc_signature);
 		return 0;
@@ -720,10 +720,10 @@ static void __init efi_check_config(void)
 	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
 	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
 
-	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
-	    mpf->mpf_length == 1 &&
-	    mpf_checksum((void *)mpf, 16) &&
-	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
+	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
+            mpf->mpf_length == 1 &&
+            mpf_checksum((void *)mpf, 16) &&
+            (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) {
 		smp_found_config = true;
 		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
 		mpf_found = mpf;
-- 
2.25.1


