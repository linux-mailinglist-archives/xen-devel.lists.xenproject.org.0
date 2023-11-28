Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2D7FC465
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 20:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643448.1003683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r840w-0005VF-PH; Tue, 28 Nov 2023 19:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643448.1003683; Tue, 28 Nov 2023 19:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r840w-0005Tc-L6; Tue, 28 Nov 2023 19:44:58 +0000
Received: by outflank-mailman (input) for mailman id 643448;
 Tue, 28 Nov 2023 19:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FWLy=HJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r840u-0005Sf-L2
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 19:44:56 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99d3d679-8e26-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 20:44:54 +0100 (CET)
Received: from DS7PR03CA0317.namprd03.prod.outlook.com (2603:10b6:8:2b::20) by
 LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 19:44:50 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::20) by DS7PR03CA0317.outlook.office365.com
 (2603:10b6:8:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22 via Frontend
 Transport; Tue, 28 Nov 2023 19:44:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 19:44:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:44:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 13:44:48 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 13:44:47 -0600
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
X-Inumbo-ID: 99d3d679-8e26-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5mSnHVqhSMNlhsYtI8Y2wkyHrJd/v9eiRAWALvn0d//T+NV28kXBBmqsezi6XeWllliVZQrsTY/skNrxFMatX+enGTnX/gqq4Vr9Te7IBjYwM0OyK/iETW7kueBiLrpz4Eg+Lan+KQ8Y5CFkrUU1Dky715b3B7TnNPK5Da6Q5VSZlAV/rrTcFO11xwj3NNY/9nrZOy8cNA8VdtoHZgWOF2W/SNhQjvAMpiv0fvkDz1jHfLqQ6OlvGSmdKiPlgnvuGkrd8YGbP5Ebx4yVfHYbtppIqP89efWtXNJGmPSddh1sTOJcgqT4zdSluLDlA443EPEVTvaDOHd0MwDV+7C2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BVDdM0ntVTlJW1zzT07NjWnqB72PNmuaW7nBCP92pk=;
 b=ZeDj3ZU3UQLJO/SLoTTFb7XGsdGI1HH76sagrDuSWe6mrJOsM39lyPZ8OIWEJfTp4f+TdRZSWRj4Gr6GqWAqOk17/nn88C1ESDyyTl6IF4JlGHaUI8cFH/7LPaHS5jkMbEKN2medGCbUSg7l1+ZwNbtaBgjHZmJsOd33L61EjtPa9OJ5oc1BS/nbuEa8LBkMdKc289EG8n8yRojb8v/xDeU8emC0LWn48+XVWAJM9tyR+6vTpwXBKmCLv7QxRHD/+6c0LKkmElWsfAo0tIB3PcPHEKYaz6ytBFUr0wXrUzHiFCwWI+w0nP01+ra+5QNjOSsD2J8/tAoW0roPLGBZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BVDdM0ntVTlJW1zzT07NjWnqB72PNmuaW7nBCP92pk=;
 b=2SaqMq9kETh1J0/mV3siMxquYy3MYuqaXV5MjBWdSn8l6Lx06byClJIoWKhf/UCQAw7d5lin9nAqE+L4HnVAZgxP/I7PYUEFla3P3kDBcWlL9LS4yqxgTjCvp4mHALi7AuR5r4pMbRDAGb6YL14VsQyVTH5bq6qQnfTOoij3PXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v8 1/2] xen/vpci: header: status register handler
Date: Tue, 28 Nov 2023 14:44:24 -0500
Message-ID: <20231128194427.2513249-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb33b39-cb3a-4a1a-b9ee-08dbf04a7ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eWqtwrN4mMvr/C7ApElTVvErFQF2hWIcxtw7mZKk7XMVpRVGemjLVMyYFtd0ZAx2o4gbEWIE6c9PfOuDbF6gxBXYucDzGlX2NHHAychccNqvPqpXhTwxDpqqVefojzfWo8HY8ZVXF+iqMG7htCIWxo+lQzB2g70Pm+FYDdjSnP57Gq0rjHXoNHMCUyDgDKSL06ZNlKQ1iNaG8jxYbVb/rirNFVF+BsqHHZDL8RlEKyrDCD17Uw6nP0dIJQxxaxdTMyccXvFJvfueUNEpdpL6IQuaX2a42rMaq8ZtTE0yCgr5KJmI+/EfwtpF5qavr+b36f3gWPWvPCDwpT99Ht4XSNZdw9UvegIpR7NukvOEw8gk4xaneIBXNHF77wpiSiirznHm0goVihUBrlULLQmmGo3EXu8B2s7gJKMXNLpKfGqIf/jcNHSWs4zP4QUn+wK3skvwpZuBCuHiV3u9tKVtdGS3pJIbdRwcLgupwn0nfUcbdITHZ0R+6CcXHd0YaZTNHbCyzHCt2S4z08s/dAw904xLQ5bx0wsl2rvUfcosix0K97UVRjua2HyQMfALiLwUBjV4TcIt70K3MgZEiZ7caRRCF6+xXFAkBEow/mry5QMBs5S/5LvCFdFP+R9t3IxAIEaElnuUyo51zvQdqUk8Y3LahuIjyXN3oiFr/6MxE5ZaP7ZS9iNnZzjv6SYgLOfUVDN9hcXFfOmjSHM4j5WrW9C5FPVghvbKx/SYP9jdAzBA0oVCI2JyAuNgJQ0TpCz9OUb8rRD+tKEQOHAJ1im4ZA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(82310400011)(186009)(1800799012)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(5660300002)(8676002)(8936002)(44832011)(4326008)(316002)(6916009)(70586007)(54906003)(70206006)(41300700001)(30864003)(6666004)(478600001)(19627235002)(966005)(2616005)(1076003)(26005)(336012)(426003)(83380400001)(47076005)(2906002)(40480700001)(36860700001)(86362001)(66899024)(40460700003)(82740400003)(356005)(81166007)(36756003)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 19:44:49.4653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb33b39-cb3a-4a1a-b9ee-08dbf04a7ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142

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

The mask_cap_list flag will be set in a follow-on patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 tools/tests/vpci/main.c    | 98 ++++++++++++++++++++++++++++++++++++++
 xen/drivers/vpci/header.c  | 12 +++++
 xen/drivers/vpci/vpci.c    | 62 +++++++++++++++++++-----
 xen/include/xen/pci_regs.h |  9 ++++
 xen/include/xen/vpci.h     |  9 ++++
 5 files changed, 178 insertions(+), 12 deletions(-)

diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index b9a0a6006bb9..b0bb993be297 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -70,6 +70,26 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
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
+    struct mask_data *md = data;
+    return md->val;
+}
+
+static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
+                              uint32_t val, void *data)
+{
+    struct mask_data *md = data;
+    md->val  = val | (md->val & md->rw1c_mask);
+    md->val &= ~(val & md->rw1c_mask);
+}
+
 #define VPCI_READ(reg, size, data) ({                           \
     data = vpci_read((pci_sbdf_t){ .sbdf = 0 }, reg, size);     \
 })
@@ -94,9 +114,20 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
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
+                                  NULL, ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
+
 #define VPCI_REMOVE_REG(off, size)                                          \
     assert(!vpci_remove_register(test_pdev.vpci, off, size))
 
@@ -154,6 +185,7 @@ main(int argc, char **argv)
     uint16_t r20[2] = { };
     uint32_t r24 = 0;
     uint8_t r28, r30;
+    struct mask_data r32;
     unsigned int i;
     int rc;
 
@@ -213,6 +245,14 @@ main(int argc, char **argv)
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
     /* Read/write of unset register. */
     VPCI_READ_CHECK(8, 4, 0xffffffff);
     VPCI_READ_CHECK(8, 2, 0xffff);
@@ -287,6 +327,64 @@ main(int argc, char **argv)
     VPCI_ADD_REG(vpci_read8, vpci_write8, 30, 1, r30);
     VPCI_WRITE_CHECK(28, 4, 0xffacffdc);
 
+    /*
+     * Test ro/rw1c/rsvdp/rsvdz masks.
+     *
+     * 32     24     16      8      0
+     *  +---------------------------+
+     *  |            r32            | 32
+     *  +---------------------------+
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
index 3bec9a4153da..96187b70141b 100644
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
+static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                        vpci_write_t *write_handler, unsigned int offset,
+                        unsigned int size, void *data, uint32_t ro_mask,
+                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                        uint32_t rsvdz_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -155,7 +167,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     /* Some sanity checks. */
     if ( (size != 1 && size != 2 && size != 4) ||
          offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
-         (!read_handler && !write_handler) )
+         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
+         (ro_mask & rsvdp_mask) || (ro_mask & rsvdz_mask) ||
+         (rw1c_mask & rsvdp_mask) || (rw1c_mask & rsvdz_mask) ||
+         (rsvdp_mask & rsvdz_mask) )
         return -EINVAL;
 
     r = xmalloc(struct vpci_register);
@@ -167,6 +182,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
+    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
+    r->rsvdp_mask = rsvdp_mask & (0xffffffffU >> (32 - 8 * size));
+    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));
 
     spin_lock(&vpci->lock);
 
@@ -193,6 +212,24 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
+int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                      vpci_write_t *write_handler, unsigned int offset,
+                      unsigned int size, void *data)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        0, 0, 0, 0);
+}
+
+int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
+                           vpci_write_t *write_handler, unsigned int offset,
+                           unsigned int size, void *data, uint32_t ro_mask,
+                           uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                           uint32_t rsvdz_mask)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask);
+}
+
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
@@ -376,6 +413,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         }
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~(r->rsvdp_mask | r->rsvdz_mask);
 
         /* Check if the read is in the middle of a register. */
         if ( r->offset < emu.offset )
@@ -407,26 +445,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
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
+    uint32_t val = 0;
+    uint32_t preserved_mask = r->ro_mask | r->rsvdp_mask;
+
     ASSERT(size <= r->size);
 
-    if ( size != r->size )
+    if ( (size != r->size) || preserved_mask )
     {
-        uint32_t val;
-
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->rw1c_mask;
         data = merge_result(val, data, size, offset);
     }
 
+    data &= ~(preserved_mask | r->rsvdz_mask);
+    data |= val & preserved_mask;
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
index d743d96a10b8..8e8e42372ec1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -37,6 +37,13 @@ int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_write_t *write_handler,
                                    unsigned int offset, unsigned int size,
                                    void *data);
+int __must_check vpci_add_register_mask(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data, uint32_t ro_mask,
+                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
+                                        uint32_t rsvdz_mask);
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
@@ -50,6 +57,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.43.0


