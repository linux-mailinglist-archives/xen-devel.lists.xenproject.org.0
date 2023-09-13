Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5DA79EB3C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 16:37:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601462.937458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQzT-0001YM-7z; Wed, 13 Sep 2023 14:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601462.937458; Wed, 13 Sep 2023 14:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgQzT-0001Tk-4j; Wed, 13 Sep 2023 14:37:15 +0000
Received: by outflank-mailman (input) for mailman id 601462;
 Wed, 13 Sep 2023 14:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUH4=E5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qgQzQ-0001Cp-PQ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 14:37:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 058c23ea-5243-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 16:37:11 +0200 (CEST)
Received: from MN2PR06CA0002.namprd06.prod.outlook.com (2603:10b6:208:23d::7)
 by SJ0PR12MB5453.namprd12.prod.outlook.com (2603:10b6:a03:37f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 14:37:08 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::b3) by MN2PR06CA0002.outlook.office365.com
 (2603:10b6:208:23d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19 via Frontend
 Transport; Wed, 13 Sep 2023 14:37:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 13 Sep 2023 14:37:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:37:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 09:36:49 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 13 Sep 2023 09:36:47 -0500
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
X-Inumbo-ID: 058c23ea-5243-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwVTX60YABCVOG1hJwsr36Tuouk4goqfpLP6QRDlV9Tgv8FOQehWHOpmJQDrrBGZ9IhoSIUL4lW/6Wo5b5c+aK/yCCF2D/3QYCWfr4+VZ6hKtMjw2QmV64Sc52WkYqCz68arhKtEXEv6ODBuhKWGnKYBuwlNslpMnHrBPgh2v/NuonJrp67L8RBHGedgO5u6WknB1QGCHZHdeB4Y9s9E3bIcC9wejOsszczRP4RRpKEzMwak3z8GxD3MABLPh+vmknQvTplTxHBl0D/ac6eDUU35SpJP/yTACDOAC1hi5UDMRclBvNMFe/8Y38PCW1MrKWFkhC+d/t4iY1KODr5AxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ahhd5zJ3mfG/9xPdvxCSZHAmhExddjzLft5mnxormRA=;
 b=ea6kPzsVKyuniLB9AkULCM4Y15unhnop+ePLpnOr3qctd0nPZaTy5g1jlG+lKrwxEiKNrxHYR4g75nGXwY7oh3jHT9xYkATh0ScFsoA/TYy2Zn8w6Z/IpxQYonpXGo1YtwA0g8qVAT9jdhre9BsA28I5YTX0M2OvHKDnNIVLVmkyKKIGABnmXVBWUuvlDd3sfgOTCtZtokCE5a5/8SSPExLtvTBwL+liIjAKg7aIb9UBZlkIpKgHXHODGY2cUDuOL7lWpDpPJFy+t7YFwro0wf88u7L9tN4veVvFCCsiUkz2YBgk2ghZr2YMkLsluT35Dfc8WtpEnq65kHAw72DUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ahhd5zJ3mfG/9xPdvxCSZHAmhExddjzLft5mnxormRA=;
 b=zCJ6aH9vaW7Qb2ML66eAkTipI1HUgElPYihrXOol77TYt7zCrkLkDRriCfxbUKR3XLAnMqWifL3qExAVCz7ubvuMAcrP/OUvDYzzE4lsZjNN2+FB4GMyyKA3MkDIbAkFK4WAugsLEfXLhGIfFtZuaFgpcofC6FE0/PcjUmqkLNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 1/2] xen/vpci: header: status register handler
Date: Wed, 13 Sep 2023 10:35:46 -0400
Message-ID: <20230913143550.14565-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230913143550.14565-1-stewart.hildebrand@amd.com>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|SJ0PR12MB5453:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f605ac4-6fb6-474e-ee99-08dbb466e7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v+DgMEUZ1EEbNCIzTG07BptWjCk5NwtKaQq+N4omEIiNU52pgEGl0gukmK6RrcYuj+tezbC2WvZlamNubROelCWF798XNR02fH2fu3/hgTCGuHNWeulqRkZ4V09oj3oudjg4d2nJD5JdTr4fnIqyHh+jSBLYT5Mjp9f71502LMb/34HZC1Itz7G3WEQEateEJ6FzXbClsHuY/tmjKthtsGLJEisa1l5GC/n6Gmy0ElybA7ITB2qMZGLo4yH0v98PYw1PMBJGzv5ptvmX+mmMbt/7iuBXzbjkHqfvBtiU43g/SfXdQDs2ETsFs6sdSCVZ5TmB6QKrGWm2Dts1vDd80G8CQfwDjmOElDYTjQv9poqEXWfxyCXf2NNcrWIyd/xYp8StzBzI/KgGHdlZMNzHu5MbJdr26/nDD69ZoKA6ow8iP5+W4HH0FMv2IGC2TJRgZjHUIxotCUvNE/F6v6QKBBTDvhx5kyrFJEHxTq1Dwj0ZEV9/5PHfrebL0+W1/G2QdRGHlvadRMxvub73ng3Bxv3ZY++dngbpK2HjXga3z0bazi3vU0U3jUu+4AnPYGzUmeX3kGyPJ8MLcJTJwKi9Qtj74NKCqrZoUoRpKBYjT9B6taBvmhAuTKol3bdby7+4xa+IHeuc6uD6TWagczWP1DYdHCcLb8VdwxhXVa+LVR1nCsHgUl8bir2rxBSGpvzcNUWK3aU40rdrlJfJ4W6ZnEhjqQdF00FCp6kSP98SHNlRLouQZC8ZcgkipnLE2+t0jjNhHRuFAOnnJLtZ7RPmEV10gDBKlMtsmsA6/dUii28=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(41300700001)(54906003)(316002)(82740400003)(2616005)(1076003)(70586007)(26005)(70206006)(47076005)(478600001)(81166007)(356005)(86362001)(4326008)(36756003)(8936002)(2906002)(6916009)(8676002)(5660300002)(44832011)(36860700001)(336012)(83380400001)(426003)(40460700003)(40480700001)(66899024)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:37:07.0897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f605ac4-6fb6-474e-ee99-08dbb466e7d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5453

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
 xen/drivers/vpci/header.c  | 16 +++++++++++
 xen/drivers/vpci/vpci.c    | 55 +++++++++++++++++++++++++++++---------
 xen/include/xen/pci_regs.h |  9 +++++++
 xen/include/xen/vpci.h     |  8 ++++++
 4 files changed, 76 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..af267b75ac31 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -521,6 +521,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *bars = header->bars;
     int rc;
+    bool mask_cap_list = false;
 
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
@@ -544,6 +545,21 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    /*
+     * Utilize rsvdz_mask to hide PCI_STATUS_CAP_LIST from the guest for now. If
+     * support for rsvdp (reserved & preserved) is added in the future, the
+     * rsvdp mask should be used instead.
+     */
+    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
+                                PCI_STATUS, 2, NULL,
+                                PCI_STATUS_RSVDZ_MASK |
+                                    (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                PCI_STATUS_RO_MASK &
+                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
+                                PCI_STATUS_RW1C_MASK);
+    if ( rc )
+        return rc;
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153da..b4cde7db1b3f 100644
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
+         (!read_handler && !write_handler) || (rsvdz_mask & ro_mask) ||
+         (rsvdz_mask & rw1c_mask) || (ro_mask & rw1c_mask) )
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
 
+    data &= ~(r->rsvdz_mask | r->ro_mask);
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


