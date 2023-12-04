Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE888040C9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 22:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647310.1010312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGCG-0005q8-IK; Mon, 04 Dec 2023 21:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647310.1010312; Mon, 04 Dec 2023 21:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAGCG-0005oW-FY; Mon, 04 Dec 2023 21:09:44 +0000
Received: by outflank-mailman (input) for mailman id 647310;
 Mon, 04 Dec 2023 21:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y+Gv=HP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAGCF-0005XB-7r
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 21:09:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fa195a7-92e9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 22:09:40 +0100 (CET)
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by SJ2PR12MB8848.namprd12.prod.outlook.com (2603:10b6:a03:537::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 21:09:34 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::a7) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 21:09:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 21:09:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 15:09:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 4 Dec
 2023 13:09:32 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 15:09:31 -0600
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
X-Inumbo-ID: 6fa195a7-92e9-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj2Y1ESJVqX/l7ZysLMAcHn2IH/EqtzxL8Miq3DKJ/i1xNLkx/BaLcYsP5y6JPOcplXAR5kXrC3WOaCpWYhZTV5kHFWcz63znLsRmFNmLdxgIyVkcUQazU9FN8hoQpwHlpdZb/5CyTKtZCubPoPU4EiawGPxkwRuBljfaSMh3+krftI8iAMh47CmgBmrFkXsHRVp5ffPM2b3K6A5HMpRczIo93ZvZWnFWr0/oKni7o3iacrARNJcLeF9D0nxxuDA9Mb1avL+s3Jd7HQBtxaW3LwBupUw8DjLZDDM0vlOJ+ImHHLycgggDL3NoJxEbURIKL1YThZmn1erXe8B3gyUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+quwPLtW2g+qaggyRdl6Ui8Hi5RH/K25fGJJ240XZ0=;
 b=OBTCU1ViBAvE5r8yfWDNkQv9SmoqT/o3oVzd9vZJyD5+EMZDPiyRBvM9E97eEEBQTPsfS49Hspz+MDIYE5jzx+p4OdcIQk80uVl6RleG1wKCZQJyB/YFlrFuXF745VM6fD264IfEWl4R7uvZWHs6o29pGu/iEK6h5ASJbBCxlRypa/AGcEc968eEUhu8CyQSgJZIPw3fMYK6KROiU7Yujuq7heQNYetMV+fXYHi/TAqU/fGQVubK1Rl5xrOFEosWJqH0wOyLaAxNmd7/vOmk5R9m0oMCL4Jl56oLC72kbq5UPat3ucYsnJOLc9uKN1T2mRQE+Jp3vaCqaFkeynST1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+quwPLtW2g+qaggyRdl6Ui8Hi5RH/K25fGJJ240XZ0=;
 b=AFiCAd0hbSlBoV78LjC3Y5WzBAwFeDFgxa6ZbxFYaGMb888D37+UWQFf3pBhQJvIA6qd9Dr6YEdzWw7P5cq6Mp7/PSKfG5gaeFfj62U2EdKRwbdkiRAOfS/bgzyypRJrZ5aIPEcfYNgfkr9EjggQ0ijTkWGy5SSmoC6Yc3+HVtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v10 1/2] xen/vpci: header: status register handler
Date: Mon, 4 Dec 2023 16:09:12 -0500
Message-ID: <20231204210916.3651999-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204210916.3651999-1-stewart.hildebrand@amd.com>
References: <20231204210916.3651999-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|SJ2PR12MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 7934089c-0147-454b-59a1-08dbf50d5081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wCAynt1HobAl+DYfbdl2gH1IjTVSlQdw2egznzNpuJOyjMbWawsZwAcqCA6nahyaZU9utrp0K1+ihnzpGZsKME7z4JoGKkGUrKrTHyXQ9h/qK53k9yGnKx4e3Y8opIGT3Lgklk6iRSDLDM+WYw6SfZRzU7GAILRwFvmSWze0Ka8+FotqCv93S3NWsS6+x0DxKZm5xfno1bT0R3BdYv60pqfPxYmyTVicEKXib+oJ6oKo6d2frdcslkIGV1il5bjpWyM4F5Fbl+7M6o/YIjN5PfjBiBfFzC+IL1poy50C9BPoZ+61BBuX9PGUxBVcw8q4cI2dj9QmxUN3sr0eSJkf+LFlCu6kL9a+KPOe+BkxsaH5tX5aSXO7lUYg/WT70ztI/h28amXlF4Temghl20oGoKLj3fDQeCi/A/RW4x4ZZYRr5Fy2t8v7WLeNYaoCL1a33szK8X+Um5yhiaw6LYz/4VQUTpFuiL52D2Pf3fXlgA1iXWCB+YFcye08ODhgGzDR0xDEgdnRu77hVX9yJvDH/f/hmLfAuxior9uO9wKCDxSNI+rlTGhVEMmVaMAaGAx7QfAMTqPs75wptJaQEQPxdu3zbPgM//61VZLp8U8MY3geYHz8nC8NPP2WMm4aZhmDTHBwG2NhSzQAN1zNH1rrzW41cQu7Y6IwjEOTpvu8kQ6EdPKWEd79TgaxAZqNGtsm/Nd66zdPnUTzBqNhAYjYDi47Dw/f61hI8JyXrCFe5l2UQaTeSobG0gQZk/F8b4kRWsFFeq1ZWBYeLP8LLyR/9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(40460700003)(66899024)(6916009)(54906003)(316002)(44832011)(8936002)(86362001)(8676002)(4326008)(70206006)(478600001)(70586007)(966005)(19627235002)(41300700001)(36756003)(2906002)(30864003)(5660300002)(36860700001)(356005)(81166007)(47076005)(26005)(2616005)(426003)(1076003)(82740400003)(83380400001)(336012)(6666004)(40480700001)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 21:09:33.5529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7934089c-0147-454b-59a1-08dbf50d5081
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8848

Introduce a handler for the PCI status register, with ability to mask
the capabilities bit. The status register contains RsvdZ bits,
read-only bits, and write-1-to-clear bits. Additionally, we use RsvdP to
mask the capabilities bit. Introduce bitmasks to handle these in vPCI.
If a bit in the bitmask is set, then the special meaning applies:

  ro_mask: read normal, guest write ignore (preserve on write to hardware)
  rw1c_mask: read normal, write 1 to clear
  rsvdp_mask: read as zero, guest write ignore (preserve on write to hardware)
  rsvdz_mask: read as zero, guest write ignore (write zero to hardware)

The RO/RW1C/RsvdP/RsvdZ naming and definitions were borrowed from the
PCI Express Base 6.1 specification. RsvdP/RsvdZ bits help Xen enforce
our view of the world. Xen preserves the value of read-only bits on
write to hardware, discarding the guests write value. This is done in
case hardware wrongly implements R/O bits as R/W.

The mask_cap_list flag will be set in a follow-on change.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v9->v10:
* change a word in the commit message
* add Roger's R-b tag

v8->v9:
* check that masks don't have bits set above register size
* rename variable in vpci_write_helper()
* only export one vpci_add_register* function, make the other one static inline
* style fixups

v7->v8:
* move PCI_STATUS_UDF to rsvdz_mask (per PCI Express Base 6 spec)
* add support for rsvdp bits
* add tests for ro/rw1c/rsvdp/rsvdz bits in tools/tests/vpci/main.c
* dropped R-b tag [1] since the patch has changed moderately since the last rev

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00909.html

v6->v7:
* re-work args passed to vpci_add_register_mask() (called in init_bars())
* also check for overlap of (rsvdz_mask & ro_mask) in add_register()
* slightly adjust masking operation in vpci_write_helper()

v5->v6:
* remove duplicate PCI_STATUS_CAP_LIST in constant definition
* style fixup in constant definitions
* s/res_mask/rsvdz_mask/
* combine a new masking operation into single line
* preserve r/o bits on write
* get rid of status_read. Instead, use rsvdz_mask for conditionally masking
  PCI_STATUS_CAP_LIST bit
* add comment about PCI_STATUS_CAP_LIST and rsvdp behavior
* add sanity checks in add_register
* move mask_cap_list from struct vpci_header to local variable

v4->v5:
* add support for res_mask
* add support for ro_mask (squash ro_mask patch)
* add constants for reserved, read-only, and rw1c masks

v3->v4:
* move mask_cap_list setting to the capabilities patch
* single pci_conf_read16 in status_read
* align mask_cap_list bitfield in struct vpci_header
* change to rw1c bit mask instead of treating whole register as rw1c
* drop subsystem prefix on renamed add_register function

v2->v3:
* new patch
---
 tools/tests/vpci/main.c    | 111 +++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/header.c  |  12 ++++
 xen/drivers/vpci/vpci.c    |  52 ++++++++++++-----
 xen/include/xen/pci_regs.h |   9 +++
 xen/include/xen/vpci.h     |  24 ++++++--
 5 files changed, 189 insertions(+), 19 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index b9a0a6006bb9..64d4552936c7 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -70,6 +70,28 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
     *(uint32_t *)data = val;
 }
 
+struct mask_data {
+    uint32_t val;
+    uint32_t rw1c_mask;
+};
+
+static uint32_t vpci_read32_mask(const struct pci_dev *pdev, unsigned int reg,
+                                 void *data)
+{
+    const struct mask_data *md = data;
+
+    return md->val;
+}
+
+static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
+                              uint32_t val, void *data)
+{
+    struct mask_data *md = data;
+
+    md->val  = val | (md->val & md->rw1c_mask);
+    md->val &= ~(val & md->rw1c_mask);
+}
+
 #define VPCI_READ(reg, size, data) ({                           \
     data = vpci_read((pci_sbdf_t){ .sbdf = 0 }, reg, size);     \
 })
@@ -94,9 +116,21 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
     assert(!vpci_add_register(test_pdev.vpci, fread, fwrite, off, size,     \
                               &store))
 
+#define VPCI_ADD_REG_MASK(fread, fwrite, off, size, store,                     \
+                          ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask)          \
+    assert(!vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
+                                   &store,                                     \
+                                   ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
+
 #define VPCI_ADD_INVALID_REG(fread, fwrite, off, size)                      \
     assert(vpci_add_register(test_pdev.vpci, fread, fwrite, off, size, NULL))
 
+#define VPCI_ADD_INVALID_REG_MASK(fread, fwrite, off, size,                   \
+                                  ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask) \
+    assert(vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
+                                  NULL, ro_mask, rw1c_mask, rsvdp_mask,       \
+                                  rsvdz_mask))
+
 #define VPCI_REMOVE_REG(off, size)                                          \
     assert(!vpci_remove_register(test_pdev.vpci, off, size))
 
@@ -154,6 +188,7 @@ main(int argc, char **argv)
     uint16_t r20[2] = { };
     uint32_t r24 = 0;
     uint8_t r28, r30;
+    struct mask_data r32;
     unsigned int i;
     int rc;
 
@@ -213,6 +248,24 @@ main(int argc, char **argv)
     /* Try to add a register with missing handlers. */
     VPCI_ADD_INVALID_REG(NULL, NULL, 8, 2);
 
+    /* Try to add registers with the same bits set in multiple masks. */
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 1, 0, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 1, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 0, 1);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 1, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 0, 1);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 0, 1, 1);
+
+    /* Try to add registers with mask bits set beyond the register size */
+    VPCI_ADD_INVALID_REG_MASK(vpci_read8, vpci_write8, 8, 1, 0x100U, 0, 0, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read8, vpci_write8, 8, 1, 0, 0x100U, 0, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read8, vpci_write8, 8, 1, 0, 0, 0x100U, 0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read8, vpci_write8, 8, 1, 0, 0, 0, 0x100U);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read16, vpci_write16, 8, 2, 0x10000U,0,0,0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read16, vpci_write16, 8, 2, 0,0x10000U,0,0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read16, vpci_write16, 8, 2, 0,0,0x10000U,0);
+    VPCI_ADD_INVALID_REG_MASK(vpci_read16, vpci_write16, 8, 2, 0,0,0,0x10000U);
+
     /* Read/write of unset register. */
     VPCI_READ_CHECK(8, 4, 0xffffffff);
     VPCI_READ_CHECK(8, 2, 0xffff);
@@ -287,6 +340,64 @@ main(int argc, char **argv)
     VPCI_ADD_REG(vpci_read8, vpci_write8, 30, 1, r30);
     VPCI_WRITE_CHECK(28, 4, 0xffacffdc);
 
+    /*
+     * Test ro/rw1c/rsvdp/rsvdz masks.
+     *
+     * 32     24     16      8      0
+     *  +------+------+------+------+
+     *  |rsvdz |rsvdp | rw1c |  ro  | 32
+     *  +------+------+------+------+
+     *
+     */
+    r32.rw1c_mask = 0x0000ff00U;
+    VPCI_ADD_REG_MASK(vpci_read32_mask, vpci_write32_mask, 32, 4, r32,
+                      0x000000ffU   /* RO    */,
+                      r32.rw1c_mask /* RW1C  */,
+                      0x00ff0000U   /* RsvdP */,
+                      0xff000000U   /* RsvdZ */);
+
+    /* ro */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(32, 1, 0x0f);
+    VPCI_WRITE(32, 1, 0x5a);
+    VPCI_READ_CHECK(32, 1, 0x0f);
+    assert(r32.val == 0x000f0f0fU);
+
+    /* rw1c */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(33, 1, 0x0f);
+    VPCI_WRITE(33, 1, 0x5a);
+    VPCI_READ_CHECK(33, 1, 0x05);
+    assert(r32.val == 0x000f050fU);
+
+    /* rsvdp */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(34, 1, 0);
+    VPCI_WRITE(34, 1, 0x5a);
+    VPCI_READ_CHECK(34, 1, 0);
+    assert(r32.val == 0x000f0f0fU);
+
+    /* rsvdz */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(35, 1, 0);
+    VPCI_WRITE(35, 1, 0x5a);
+    VPCI_READ_CHECK(35, 1, 0);
+    assert(r32.val == 0x000f0f0fU);
+
+    /* write all 0's */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
+    VPCI_WRITE(32, 4, 0);
+    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
+    assert(r32.val == 0x000f0f0fU);
+
+    /* write all 1's */
+    r32.val = 0x0f0f0f0fU;
+    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
+    VPCI_WRITE(32, 4, 0xffffffffU);
+    VPCI_READ_CHECK(32, 4, 0x0000000fU);
+    assert(r32.val == 0x000f000fU);
+
     /* Finally try to remove a couple of registers. */
     VPCI_REMOVE_REG(28, 1);
     VPCI_REMOVE_REG(24, 4);
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..351318121e48 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -521,6 +521,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool mask_cap_list = false;
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -544,6 +545,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
+    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                PCI_STATUS, 2, NULL,
+                                PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                PCI_STATUS_RW1C_MASK,
+                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
+                                PCI_STATUS_RSVDZ_MASK);
+    if ( rc )
+        return rc;
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153da..d569f596a4c3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,10 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    uint32_t ro_mask;
+    uint32_t rw1c_mask;
+    uint32_t rsvdp_mask;
+    uint32_t rsvdz_mask;
 };
 
 #ifdef __XEN__
@@ -145,9 +149,17 @@ uint32_t cf_check vpci_hw_read32(
     return pci_conf_read32(pdev->sbdf, reg);
 }
 
-int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
-                      vpci_write_t *write_handler, unsigned int offset,
-                      unsigned int size, void *data)
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
+{
+    pci_conf_write16(pdev->sbdf, reg, val);
+}
+
+int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
+                           vpci_write_t *write_handler, unsigned int offset,
+                           unsigned int size, void *data, uint32_t ro_mask,
+                           uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                           uint32_t rsvdz_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -155,7 +167,14 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     /* Some sanity checks. */
     if ( (size != 1 && size != 2 && size != 4) ||
          offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
-         (!read_handler && !write_handler) )
+         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
+         (ro_mask & rsvdp_mask) || (ro_mask & rsvdz_mask) ||
+         (rw1c_mask & rsvdp_mask) || (rw1c_mask & rsvdz_mask) ||
+         (rsvdp_mask & rsvdz_mask) )
+        return -EINVAL;
+
+    if ( size != 4 &&
+         ((ro_mask | rw1c_mask | rsvdp_mask | rsvdz_mask) >> (8 * size)) )
         return -EINVAL;
 
     r = xmalloc(struct vpci_register);
@@ -167,6 +186,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->ro_mask = ro_mask;
+    r->rw1c_mask = rw1c_mask;
+    r->rsvdp_mask = rsvdp_mask;
+    r->rsvdz_mask = rsvdz_mask;
 
     spin_lock(&vpci->lock);
 
@@ -376,6 +399,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         }
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~(r->rsvdp_mask | r->rsvdz_mask);
 
         /* Check if the read is in the middle of a register. */
         if ( r->offset < emu.offset )
@@ -407,26 +431,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
 /*
  * Perform a maybe partial write to a register.
- *
- * Note that this will only work for simple registers, if Xen needs to
- * trap accesses to rw1c registers (like the status PCI header register)
- * the logic in vpci_write will have to be expanded in order to correctly
- * deal with them.
  */
 static void vpci_write_helper(const struct pci_dev *pdev,
                               const struct vpci_register *r, unsigned int size,
                               unsigned int offset, uint32_t data)
 {
+    uint32_t curval = 0;
+    uint32_t preserved_mask = r->ro_mask | r->rsvdp_mask;
+
     ASSERT(size <= r->size);
 
-    if ( size != r->size )
+    if ( (size != r->size) || preserved_mask )
     {
-        uint32_t val;
-
-        val = r->read(pdev, r->offset, r->private);
-        data = merge_result(val, data, size, offset);
+        curval = r->read(pdev, r->offset, r->private);
+        curval &= ~r->rw1c_mask;
+        data = merge_result(curval, data, size, offset);
     }
 
+    data &= ~(preserved_mask | r->rsvdz_mask);
+    data |= curval & preserved_mask;
+
     r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
              r->private);
 }
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 84b18736a85d..9909b27425a5 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -66,6 +66,15 @@
 #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
 #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
 #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
+#define  PCI_STATUS_RSVDZ_MASK		0x0046 /* Includes PCI_STATUS_UDF */
+
+#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
+    PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | PCI_STATUS_FAST_BACK | \
+    PCI_STATUS_DEVSEL_MASK)
+#define  PCI_STATUS_RW1C_MASK (PCI_STATUS_PARITY | \
+    PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_REC_TARGET_ABORT | \
+    PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_SYSTEM_ERROR | \
+    PCI_STATUS_DETECTED_PARITY)
 
 #define PCI_CLASS_REVISION	0x08	/* High 24 bits are class, low 8 revision */
 #define PCI_REVISION_ID		0x08	/* Revision ID */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d743d96a10b8..85c52a1ebac7 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -32,11 +32,23 @@ int __must_check vpci_add_handlers(struct pci_dev *pdev);
 void vpci_remove_device(struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
-int __must_check vpci_add_register(struct vpci *vpci,
-                                   vpci_read_t *read_handler,
-                                   vpci_write_t *write_handler,
-                                   unsigned int offset, unsigned int size,
-                                   void *data);
+int __must_check vpci_add_register_mask(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data, uint32_t ro_mask,
+                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                                        uint32_t rsvdz_mask);
+static inline int __must_check vpci_add_register(struct vpci *vpci,
+                                                 vpci_read_t *read_handler,
+                                                 vpci_write_t *write_handler,
+                                                 unsigned int offset,
+                                                 unsigned int size, void *data)
+{
+    return vpci_add_register_mask(vpci, read_handler, write_handler, offset,
+                                  size, data, 0, 0, 0, 0);
+}
+
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
@@ -50,6 +62,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.43.0


