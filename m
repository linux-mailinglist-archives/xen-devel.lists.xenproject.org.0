Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDD8753675
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 11:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563549.880804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKF6w-00047S-Vn; Fri, 14 Jul 2023 09:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563549.880804; Fri, 14 Jul 2023 09:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKF6w-00045G-R8; Fri, 14 Jul 2023 09:29:14 +0000
Received: by outflank-mailman (input) for mailman id 563549;
 Fri, 14 Jul 2023 09:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHA8=DA=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1qKF6v-00044r-Ih
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 09:29:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e30037f6-2228-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 11:29:10 +0200 (CEST)
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Fri, 14 Jul
 2023 09:29:07 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:254:cafe::f4) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.15 via Frontend
 Transport; Fri, 14 Jul 2023 09:29:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.27 via Frontend Transport; Fri, 14 Jul 2023 09:29:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 14 Jul
 2023 04:29:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 14 Jul
 2023 02:29:05 -0700
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 14 Jul 2023 04:29:04 -0500
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
X-Inumbo-ID: e30037f6-2228-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMnpdvlxNR7gN13AKguLpbh1b2uTlfiXGHTRNgGK+TNjPbx+LDl4+CyB3MyP8gDvMSall9l9USxdlHJP0k2bUDXZC3nMTAptwDXTSq+mh7JObDLJ4Hb7xwMFndnooBKV7JEGBbaiMes7lndIAgYQLFwQnomETzWqCa1jFROHlggIQIQFmP7kJHPvH77zPFZ7SL83iB+qZ/iLTxkGiTK/BOIYjDcbL3ca2UEG7H2vlFnK1jWt7iEHcsHvqnlZrdMBlQHzkSOLiCuX1SWpwIvhhypHUyDwbahDidjnSS8lJO5DH2U/QFOt5fR7mRS0ehmRzlXGCIiVuWXhhuJ3D3cJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xOoX2/Cgac9pFbV1Jy/oMIpEZrUX9KsUGUFT4KaB8k=;
 b=mzatdwN+kyGU7PecrYVN7jwASXzSaDRITLswK5LMJh7Nku//EIFbsPjmG7ypgrf/pjVXeVzgFZRXj0xixcyhzD9m6HRJyzs11eDsHTA6cq1OH4NWGe59U+CdtRNy6RGlecyDxC3hCjvPAkFuy17AcTjIfi6qKh5aaWFLr62z3MMOKU8RV53EsCNuVOmop31NNsZqenYe15eHeJdR8+ff92YMQF0lm7XyqFNfwDQmXJPRrM2LAAVgI55gV3QCVp/S6rLDMBuEAvtJYvhAug7ADKlKrM4HpZP1LPBg8HbD+7ZMHRC9B8HQRp/+I/hjD0OfjNvEeXlCRGEmvWSJ1/X24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=seabios.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xOoX2/Cgac9pFbV1Jy/oMIpEZrUX9KsUGUFT4KaB8k=;
 b=Yitsv9p+gF7xfGu0OpdX6uq2F+pkIoQc1+xEs4peC4pok4bd97lGsE2zAN5NlhvBVgt0eVsSlRSnzt+BWWcOPN4vwoM7srNV54aYSka8SHWNQWI1Qj46S4K+DsvtYtfwN/cXYFy+vTEFF3h/5XUQwP+TCVIACfZu00sOVRZZybA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <seabios@seabios.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Gerd Hoffmann
	<kraxel@redhat.com>, Kevin O'Connor <kevin@koconnor.net>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH] paravirt: call pci_bios_init_devices() when runningOnXen()
Date: Fri, 14 Jul 2023 12:28:09 +0300
Message-ID: <eed01ea56212a0e1c5ebfd7d087da5a231cb7af1.1689326029.git.xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT012:EE_|CH2PR12MB4937:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c03ef3-fd5a-41a9-05b8-08db844cc532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yxctxlntajJR0I3b0s6BCYonnnAY4xGNFdhzLpSa+ovIW6Zf0tf+IgQCodXNcesPgh2T6/uD4pmy6RPXRXsFkFtEdYuRrNTza4DckCzMJ+FHmrkno9iNiL00V2ydMfN1LhFdzaD261khhRT0cBohwk7zKQPsfySfEbEF9llsNVn8QICcBjgg4CFYDWSCkgodpS5oaG+bPtP0GtEH9feO7iSlm1r+EWl/69nGKVcKSsupHNO20rqOS/IJwP4wiIkuhZ3yW9b3Tcrl69yoxfm7cNNh+lROXfmVTJlY/dnVQx7EJC+f2iqBFQKt9zUHawZ5pcs8AG9juMAKL/1JMIz/Zz6AM9zLvlnR+Fsw88yzK2cVh3tMtTM3E3tLKTDEQeGFlBj7otClEMhZ7HRnz7u4WrX9dOaHQniqFqViDsXASbZG2UoQ3TBicHJy9w7B7COwWrGXEUaF2VzEOxpbXEdUt96L1lwWfvtW3IWMf3E38xPaYZpLvgSpibSn37QSpwTh2DE+DvrBYaeOwONbW0XbuOUoQ84vjOMcoTziTkmoko0++/0/f33kq6w29oRQgiZ1+oZYP3hbA7bficvplH6QjsrcDEDv6PbeiEH7PrNDgv8AsG+fdLjlCPg0uWQOCcAMy19mboVA0avKXR9JI0vcSABLkwxFZ0kAM8zLHTKoNoBFxTjFp9ANn4oiQSD7r8m5a8B4fhuNnWFRidA2UND/xC2YkgRh7IBsSb09AleGKRkdmiaKy3fU4jQ9Q+b9JNQUHT9s37CIf2k9HfV1qTK6VA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(6029001)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(82310400005)(36756003)(86362001)(40480700001)(81166007)(40460700003)(82740400003)(356005)(16576012)(54906003)(44832011)(478600001)(316002)(70586007)(4326008)(6916009)(70206006)(5660300002)(8676002)(2906002)(41300700001)(8936002)(2616005)(336012)(186003)(26005)(47076005)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:29:06.2890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c03ef3-fd5a-41a9-05b8-08db844cc532
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937

The issue that this patch attempts to address is S3 related.
Currently, suspending a XEN guest multiple times does not work.
This happens because PIIX4 PM io space gets unmapped during S3
resume and any accesses performed to trigger subsequent suspends
are not handled. So, the guest spins on the wake sts bit forever.
Below follows a more detailed description of the issue.

On S3 resume path, QEMU issues piix4_pm_reset() to bring PPIX4 PM
controller to the state expected. More specifically, piix4_pm_reset()
zeroes PMIOSE register, i.e pci_conf[0x80] = 0, and this results in
unmapping PIIX4 PM io space,
i.e. memory_region_set_enabled(&s->io, d->config[0x80] & 1)
It is bios responsibility to reenable PIIX4 PM io space during
S3 resume path. However, when running on XEN, the qemu platform
initialization code does not call pci_bios_init_devices(), hence
the PIIX4 PM controller init function is not called and PiixPmBDF
is not set. The value of PiixPmBDF indicates the presence of PIIX4
PM controller. Thus, S3 resume code in pci_resume() considers that
PIIX4 PM controller is not present and does not perform the relevant
post-resume setup that restores PIIX4 PM io space. This is the reason
why any subsequent guest access to those registers is not handled.

This patch adds a call to pci_bios_init_devices() to the early xen
platform setup code.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---
 src/fw/paravirt.c | 1 +
 src/fw/pciinit.c  | 2 +-
 src/util.h        | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/fw/paravirt.c b/src/fw/paravirt.c
index fba4e52..0c035eb 100644
--- a/src/fw/paravirt.c
+++ b/src/fw/paravirt.c
@@ -205,6 +205,7 @@ qemu_platform_setup(void)
 
     if (runningOnXen()) {
         pci_probe_devices();
+        pci_bios_init_devices();
         xen_hypercall_setup();
         xen_biostable_setup();
         return;
diff --git a/src/fw/pciinit.c b/src/fw/pciinit.c
index badf13d..f955481 100644
--- a/src/fw/pciinit.c
+++ b/src/fw/pciinit.c
@@ -417,7 +417,7 @@ static void pci_bios_init_device(struct pci_device *pci)
                          PCI_BRIDGE_CTL_SERR);
 }
 
-static void pci_bios_init_devices(void)
+void pci_bios_init_devices(void)
 {
     struct pci_device *pci;
     foreachpci(pci) {
diff --git a/src/util.h b/src/util.h
index aff8e88..ebd863f 100644
--- a/src/util.h
+++ b/src/util.h
@@ -137,6 +137,7 @@ extern u64 pcimem64_start, pcimem64_end;
 extern const u8 pci_irqs[4];
 void pci_setup(void);
 void pci_resume(void);
+void pci_bios_init_devices(void);
 
 // fw/pirtable.c
 void pirtable_setup(void);
-- 
2.34.1


