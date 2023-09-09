Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92DB7995EE
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 04:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598357.933097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenZD-0004ZV-1E; Sat, 09 Sep 2023 02:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598357.933097; Sat, 09 Sep 2023 02:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenZC-0004Wt-U6; Sat, 09 Sep 2023 02:19:22 +0000
Received: by outflank-mailman (input) for mailman id 598357;
 Sat, 09 Sep 2023 02:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbb/=EZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qenZC-0004WR-0j
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 02:19:22 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 483775d2-4eb7-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 04:19:20 +0200 (CEST)
Received: from SN6PR16CA0038.namprd16.prod.outlook.com (2603:10b6:805:ca::15)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 02:19:16 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:805:ca:cafe::4f) by SN6PR16CA0038.outlook.office365.com
 (2603:10b6:805:ca::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sat, 9 Sep 2023 02:19:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 02:19:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:19:15 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 21:19:13 -0500
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
X-Inumbo-ID: 483775d2-4eb7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaU/lWH+gBe6XbortBLbrqmomZuDmki6FzuRrkai/JH397wBr2T8BEB+nmNBRn1hkmZLaFmlG/QijBWoQCuylOo3Dx4LU2AvUV4hECAgntnKc3MoN5IyG8fl7LHJCsc/uQPyY6N5BwFivfmAc/jJcGjfaH8cjBCFrs/oNSjfR07S48EyrXLBJ0FJhSHtkodBPwSTmrMvuz+/nWJMQZ7KXRK142wEgol7HXWX6BxEYYVDxL6cu26VQpo5ilh7vk8ULgJSwcQOjIdPsLt6UmqzTsPWhnwSTUa1KBBmlAIQh5a0rx/IBrUIddUQ6lX5GZ6QfnqSgNkrRd5unN6m5+/M+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMCuF10qBS80uuE3Gw9n2rizrqn0mnEqVqquOunu4kU=;
 b=hlXJFaBv+CyATBWMUQbtE2cZHeTRKUZSsGg9LcMnTUp4+Fpcm2l7pPkLvRA57Vw03C5IhWD/FqgPE5mnfPTp/80/lG1m9UiGhtn3RdeRl0987fANc+FcJT02ES1KlIej4K/AekBEwK5nrMZsyPPtHTmD3UY+nmUByvXW2TB+b8nx/zWsGXkdWKD05N9HuetCH3ZEqf8zLp0r2Qdp4NcZkh+l+VxkeuNUmtlw+opWkIhgzS0w2NeBOriVOYooiUb63CBPdQZGXArsMZujRfk7XQMg6QjjGf58f3pfapZv8m1FuZJhnEtm72xBj1hHXvC9Pz3xm100cyy7UxwzdKxqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMCuF10qBS80uuE3Gw9n2rizrqn0mnEqVqquOunu4kU=;
 b=cku6f6+zlQYDO5KscNBpY0E2WJ9yQIRI9TxBJXm10CVuyve2IqPimGlacGXR5fFmyUlSTWRFMf8rUpTjR69JvbGfQEQRuCEmVPTgqmHjr8Ww0RaCXixFmqHaUOR9oXVw7p8z566A37L1BQCMu0cEzZBGX31h39xccJnrr/T5jWE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v6 3/4] xen/vpci: header: status register handler
Date: Fri, 8 Sep 2023 22:16:27 -0400
Message-ID: <20230909021647.558115-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230909021647.558115-1-stewart.hildebrand@amd.com>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fdb78b-cd0d-41f9-53a6-08dbb0db2a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JT4aqjCbG2lJiE7LofRiBN9mMRB1S7hW/Z0/bR3GIN1Oa1rTe5JGFwuMzrHtCNVJP4Dmy39c6E3pXavhwrFnWscv68ptA/o5px9N7GoTNYW4/opcOJGe4dp6UG9FwRjBLVz6ISqVzueM3aHTY+VScN6EcbXITe5+y7d1cf6hw4fomt+906x77heLWoitS5UhSELG9n/47xN89096EzTs5L4GjhIBnZG4uGcs7bJH6o2MzoTfD6nZYjckgDTFbhwPqwlNPxL4Nl9ntSNgTaoOqFJ8UHx9l2zv23k3psRoo5CignGGFYfRUO/+n/vTG1ATY+jG+Hss9+o+1MBCwvwBL9zKUICCAKo1vwkIQ1+XL+MWhvIyHuwGqdLHlcXW/tbzKICwUhzh2CAgkwEWo/gZnNCm5XmgJ0Dvdf5tGvTEFPvovNOeAjbT87VhRItLN6nxHEtkS+UFUu+CzV7+VzPhB3yuNqNwffE6mpWKdS6UI1hvKjoYN8gAXiJ20YTXQACchMN+jkYfkxw9GMEynPRqA6Vd9J8HfiEf/2VtMD8XNBrE0wa/qY114Srrqcv+G0eiebTKaNLa4v6MKtwcaZsSdyFNQ1cc7X77kJMvuF6+USgtUx51WU1hrSrP+gmPHsyvIwrOg8BxBxPRoph1j6I/gjCFjhBevJ8q7Iq5LII3icKGira5VPLxqD9ha49UUxn3GVj9xls5Pit4K4kqN+Hmm4ZH0ZN5s2wiTXxtpFlWkM/6oqlOr0TBq1lZ+BS5TbitL2t/YTTQj2Xq7tSc9k1TTVYuinxLI2uQdUur4mqhOi0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(6666004)(83380400001)(26005)(478600001)(2616005)(426003)(336012)(1076003)(2906002)(54906003)(6916009)(44832011)(316002)(70206006)(5660300002)(8936002)(4326008)(40460700003)(8676002)(70586007)(41300700001)(36756003)(86362001)(47076005)(40480700001)(36860700001)(82740400003)(81166007)(356005)(66899024)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 02:19:15.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fdb78b-cd0d-41f9-53a6-08dbb0db2a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806

Introduce a handler for the PCI status register, with ability to mask the
capabilities bit. The status register contains RsvdZ bits, read-only bits, and
write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a bit
in the bitmask is set, then the special meaning applies:

  rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
  ro_mask: read normal, guest write ignore (preserve on write to hardware)
  rw1c_mask: read normal, write 1 to clear

The RsvdZ naming was borrowed from the PCI Express Base 4.0 specification.

Xen preserves the value of read-only bits on write to hardware, discarding the
guests write value.

The mask_cap_list flag will be set in a follow-on patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/vpci/header.c  | 13 +++++++++
 xen/drivers/vpci/vpci.c    | 55 +++++++++++++++++++++++++++++---------
 xen/include/xen/pci_regs.h |  9 +++++++
 xen/include/xen/vpci.h     |  8 ++++++
 4 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..99dcf57678a8 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -521,6 +521,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool mask_cap_list = false;
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -544,6 +545,18 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    /*
+     * If mask_cap_list is true, PCI_STATUS_CAP_LIST will be set in both
+     * rsvdz_mask and ro_mask, and thus will effectively behave as rsvdp
+     * (reserved/RAZ and preserved on write).
+     */
+    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                PCI_STATUS, 2, header, PCI_STATUS_RSVDZ_MASK |
+                                (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);
+    if ( rc )
+        return rc;
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153da..586c6057365b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,9 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    uint32_t rsvdz_mask;
+    uint32_t ro_mask;
+    uint32_t rw1c_mask;
 };
 
 #ifdef __XEN__
@@ -145,9 +148,16 @@ uint32_t cf_check vpci_hw_read32(
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
+                        unsigned int size, void *data, uint32_t rsvdz_mask,
+                        uint32_t ro_mask, uint32_t rw1c_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -155,7 +165,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     /* Some sanity checks. */
     if ( (size != 1 && size != 2 && size != 4) ||
          offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
-         (!read_handler && !write_handler) )
+         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
+         (rsvdz_mask & rw1c_mask) )
         return -EINVAL;
 
     r = xmalloc(struct vpci_register);
@@ -167,6 +178,9 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));
+    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
+    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
 
     spin_lock(&vpci->lock);
 
@@ -193,6 +207,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
+int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                      vpci_write_t *write_handler, unsigned int offset,
+                      unsigned int size, void *data)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        0, 0, 0);
+}
+
+int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
+                           vpci_write_t *write_handler, unsigned int offset,
+                           unsigned int size, void *data, uint32_t rsvdz_mask,
+                           uint32_t ro_mask, uint32_t rw1c_mask)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        rsvdz_mask, ro_mask, rw1c_mask);
+}
+
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
@@ -376,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         }
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->rsvdz_mask;
 
         /* Check if the read is in the middle of a register. */
         if ( r->offset < emu.offset )
@@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
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
+
     ASSERT(size <= r->size);
 
-    if ( size != r->size )
+    if ( (size != r->size) || r->ro_mask )
     {
-        uint32_t val;
-
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->rw1c_mask;
         data = merge_result(val, data, size, offset);
     }
 
+    data &= ~r->rsvdz_mask & ~r->ro_mask;
+    data |= val & r->ro_mask;
+
     r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
              r->private);
 }
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 84b18736a85d..b72131729db6 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -66,6 +66,15 @@
 #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
 #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
 #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
+#define  PCI_STATUS_RSVDZ_MASK		0x0006
+
+#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
+    PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | PCI_STATUS_UDF | \
+    PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MASK)
+#define  PCI_STATUS_RW1C_MASK (PCI_STATUS_PARITY | \
+    PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_REC_TARGET_ABORT | \
+    PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_SYSTEM_ERROR | \
+    PCI_STATUS_DETECTED_PARITY)
 
 #define PCI_CLASS_REVISION	0x08	/* High 24 bits are class, low 8 revision */
 #define PCI_REVISION_ID		0x08	/* Revision ID */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c745b..7a5cca29e54c 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -37,6 +37,12 @@ int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_write_t *write_handler,
                                    unsigned int offset, unsigned int size,
                                    void *data);
+int __must_check vpci_add_register_mask(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data, uint32_t rsvdz_mask,
+                                        uint32_t ro_mask, uint32_t rw1c_mask);
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
@@ -50,6 +56,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
-- 
2.42.0


