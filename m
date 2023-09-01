Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C278F7D8
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594262.927565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR8-0001Ys-U8; Fri, 01 Sep 2023 05:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594262.927565; Fri, 01 Sep 2023 05:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR8-0001Sh-Lu; Fri, 01 Sep 2023 05:11:14 +0000
Received: by outflank-mailman (input) for mailman id 594262;
 Fri, 01 Sep 2023 05:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=am4h=ER=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qbwGz-0000Nr-Fi
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 802edf13-4884-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 07:00:43 +0200 (CEST)
Received: from CYXPR03CA0024.namprd03.prod.outlook.com (2603:10b6:930:d0::6)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 05:00:39 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::e0) by CYXPR03CA0024.outlook.office365.com
 (2603:10b6:930:d0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.26 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:37 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:36 -0500
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
X-Inumbo-ID: 802edf13-4884-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALwvTiVUKP2LQF75EQ4M+lHRB/TQENH+gIgDX76ZiF3WdchiZtCEWONgYCBp6eUfXpGTJTjWBwvPO8BNjkYB+MYd85ypUKh/EYePIF3Cph25ndvf68REvGA1QyxKqbpxeTk2g/MCMTOJhbLDdZSTwn6y9BVbs8V6DGObQ3p8o0wMq4sa6KwSWiKMRFMQBH/bOHLcScMtVDnWxxlZf9hcav+tDSiYC5FqEzZtA3NgwIVX6hj8wA0tBr0NkYV0KEL3y0cFoGYeGMzOhVebn6HlS0FUdtdKpP11muS/gl8XqOxeeLpOt60YQpfgVSG/Mgoh4IooEXWO1tM8B756CGb6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KaFay1YX9Z8ga1iLYKzEiksiXOhKppKo65QZoKXwB8=;
 b=NuFS3lhaCNw/RU0x1VS53d920Ag+6pL+O2N9GsrIzA59Rq0Q5vX5iHeWvKRnFzKvNkepR7uWpXO7TEAoeNeKCZLtjs6U0sOPNiJ8C7mW7fo85qWWDlPzFU3yhehRznSiQ1JUhqhHvraPwUo7WzxdzBnGG91SwSFtKBWKG5vyRDujAPjvx6HQvbit0FEwLcS7CbogXoeyu57+tKGi3JSmUqfFrCFHWbCI2ObkEnkEjzJlFiYlwhHfeHH14VwTLOTucLyy9XG9sa6xW8o/u0AJnmVxQnrH6Mirz7si6A9YZvJ9xEuIA8pzlizCzJTQSbOB1rhxFQRfmbgRfyn6EtghJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KaFay1YX9Z8ga1iLYKzEiksiXOhKppKo65QZoKXwB8=;
 b=2+xToq1c3rldSz2P2GatSA9a9MZgg3TC2zQ32xI9auzwxzfiiYwsSQCx0ZDTNTZTswRO2tHN+a53ExaUakjeXx9Za+2q+TctHrY+hi/5gMfH+ywieBp3HkjvBEFTSSK04sKYDVyS14B6H6DpsXnZxQ2Bd9sT7SPEcqP1kNzHfTc=
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
Subject: [PATCH v5 4/5] xen/vpci: header: status register handler
Date: Fri, 1 Sep 2023 00:57:31 -0400
Message-ID: <20230901045742.235975-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901045742.235975-1-stewart.hildebrand@amd.com>
References: <20230901045742.235975-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c3caae-94ad-4aa0-0895-08dbaaa86291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xmVTJfwepUxRAI4b5u7VJxt9BSNe9tL+3Hi6kSQrHajETJ7SW5WWJ6D0DdPDh7Fnxv6baRpww+DbhLkjuw5vgXLYqJ6jOJmwM0VTNmM28+V3ySBp1w4aIhQWFrJyB9EVxSAY8sjeenZys3d44vidsqIFNZUtALYBN0L2sZrP4CeLQg+YxZEULc2GchuTSjE5djW4WK4CCbAuVaoGfGDjzlXmhqCVfhvKDctR1nYm9cXBHdnoltlLV93ErnCKM3q2oUO/LYwp/E9ieLtVBA/28IFpM32j7EYHicUeSaDj7XgEXaLetz/vyvB3g+1FfIaz0FdupgkpObPvJ8J8jouUAA2g8deeqHj8n/xAnTvwVd7iPPfUD/bFY8Tv0at9MXrQZpSEk/q4JxYw9ONAQCPUxzqU+hyM31wnoW0b9Pd2tTeL6/voN4L+5HopHqwIFT3J2IAPah55ykOlR+tXasxJsr8+qENxRU13NjVVgY1Qa3eiYwK4v80bR9Woqxpc+xlUe6dbUCOz/q2Ws9kBRvcHbaOfF/WRFILkusGxrNblv5bSTomr3oESdBBjISfPnDVYD/PPvDaTmD9b+M+Smq0txGiaxixE2AaOFEyI54n5FPfZIdH17vwe3eFNuFjuBbTFFocexkLMFx+nHbWQstC1/WX7ZdZUQqBacRaVXXQfiL1ClHGalhFCB/iSC8iimN2RDzmr6GUAgCa9/OqPW/O2dSQ8CtSDoSU04xNaiTZAfSBz/JbLHezdrimGvqeWlkVyXBSsW+NdrGx6c2Gaazwt6HBscKthfM7jdnCL9acAMfs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(66899024)(356005)(6666004)(40460700003)(36756003)(86362001)(81166007)(36860700001)(40480700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(8936002)(70586007)(70206006)(54906003)(8676002)(4326008)(44832011)(5660300002)(41300700001)(6916009)(316002)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:38.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c3caae-94ad-4aa0-0895-08dbaaa86291
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

Introduce a handler for the PCI status register, with ability to mask the
capabilities bit. The status register contains reserved bits, read-only bits,
and write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a
bit in the bitmask is set, then the special meaning applies:

  res_mask: read as zero, write ignore
  ro_mask: read normal, write ignore
  rw1c_mask: read normal, write 1 to clear

The mask_cap_list flag will be set in a follow-on patch.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/vpci/header.c  | 18 +++++++++++++++
 xen/drivers/vpci/vpci.c    | 46 +++++++++++++++++++++++++++++++-------
 xen/include/xen/pci_regs.h |  8 +++++++
 xen/include/xen/vpci.h     | 10 +++++++++
 4 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 767c1ba718d7..791791e6c9b6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -413,6 +413,18 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static uint32_t cf_check status_read(const struct pci_dev *pdev,
+                                     unsigned int reg, void *data)
+{
+    struct vpci_header *header = data;
+    uint32_t status = pci_conf_read16(pdev->sbdf, reg);
+
+    if ( header->mask_cap_list )
+        status &= ~PCI_STATUS_CAP_LIST;
+
+    return status;
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -544,6 +556,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    rc = vpci_add_register_mask(pdev->vpci, status_read, vpci_hw_write16,
+                                PCI_STATUS, 2, header, PCI_STATUS_RESERVED_MASK,
+                                PCI_STATUS_RO_MASK, PCI_STATUS_RW1C_MASK);
+    if ( rc )
+        return rc;
+
     if ( pdev->ignore_bars )
         return 0;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 3bec9a4153da..6e6ad4b80a0d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,9 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    uint32_t res_mask;
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
+                        unsigned int size, void *data, uint32_t res_mask,
+                        uint32_t ro_mask, uint32_t rw1c_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -167,6 +177,9 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->res_mask = res_mask & (0xffffffffU >> (32 - 8 * size));
+    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
+    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
 
     spin_lock(&vpci->lock);
 
@@ -193,6 +206,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
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
+                           unsigned int size, void *data, uint32_t res_mask,
+                           uint32_t ro_mask, uint32_t rw1c_mask)
+{
+    return add_register(vpci, read_handler, write_handler, offset, size, data,
+                        res_mask, ro_mask, rw1c_mask);
+}
+
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
@@ -376,6 +406,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         }
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->res_mask;
 
         /* Check if the read is in the middle of a register. */
         if ( r->offset < emu.offset )
@@ -407,11 +438,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
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
@@ -424,9 +450,13 @@ static void vpci_write_helper(const struct pci_dev *pdev,
         uint32_t val;
 
         val = r->read(pdev, r->offset, r->private);
+        val &= ~r->res_mask;
+        val &= ~r->rw1c_mask;
         data = merge_result(val, data, size, offset);
     }
 
+    data &= ~r->res_mask;
+    data &= ~r->ro_mask;
     r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
              r->private);
 }
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 84b18736a85d..b7cb200969c6 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -66,6 +66,14 @@
 #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
 #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
 #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
+#define  PCI_STATUS_RESERVED_MASK	0x06
+#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
+    PCI_STATUS_CAP_LIST | PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | \
+    PCI_STATUS_UDF | PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MASK)
+#define  PCI_STATUS_RW1C_MASK (PCI_STATUS_PARITY | \
+    PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_REC_TARGET_ABORT | \
+    PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_SYSTEM_ERROR | \
+    PCI_STATUS_DETECTED_PARITY)
 
 #define PCI_CLASS_REVISION	0x08	/* High 24 bits are class, low 8 revision */
 #define PCI_REVISION_ID		0x08	/* Revision ID */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 0b8a2a3c745b..0a6c9e19b399 100644
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
+                                        void *data, uint32_t res_mask,
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
@@ -94,6 +102,8 @@ struct vpci {
          * upon to know whether BARs are mapped into the guest p2m.
          */
         bool bars_mapped      : 1;
+        /* Store whether to hide all capabilities from the guest. */
+        bool mask_cap_list    : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.42.0


