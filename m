Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25140783763
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588011.919450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGFm-0003aH-1g; Tue, 22 Aug 2023 01:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588011.919450; Tue, 22 Aug 2023 01:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGFl-0003YW-UH; Tue, 22 Aug 2023 01:32:17 +0000
Received: by outflank-mailman (input) for mailman id 588011;
 Tue, 22 Aug 2023 01:32:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiiM=EH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYGFl-0000x3-18
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:32:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9fd4221-408b-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 03:32:16 +0200 (CEST)
Received: from MW4PR04CA0235.namprd04.prod.outlook.com (2603:10b6:303:87::30)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 01:32:11 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::7d) by MW4PR04CA0235.outlook.office365.com
 (2603:10b6:303:87::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 01:32:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 01:32:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:32:10 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 20:32:09 -0500
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
X-Inumbo-ID: b9fd4221-408b-11ee-8782-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8OEjwnlsvr7Lk9u/0W5YWXHeZT5a2US3Ixw5ZJiTrOeTiaYE5VoSh4NW2XsOBE9trfo8OEKoHUAV3MXS26IVXmyinz2ne2Jn5v7lg/esU8zJ7p5m7oU5R6jS8LzGR3iEhu7x1ycF9xJMotVZSORVP1Dg21XXenowaPxGGFJx9W5+4LEDMsKcxTCyIW6ur91y1a3VYtmf9/+Yy4JDLwQJgIICgU8r6c8tOeXP2u6PTDFtEp21QPACNKL2rHXyTut55wDhiliPN9N0+fVuVh4IiQf/m6RdbV5l6XRwCD7NrNeYgpR5gfQWoek26QTKND8WvC4fvSsN8Y0HqXZc3B2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n1yyNK6sHaopm2rNEybK0BDTFSOqSy/3YHjVA/ulc0=;
 b=OiHtNLn1vuFjBt2sfCrLYT1uk5odD78ncqrL6w0S3kV7fdQb2/kyZnXLHzePjviXPNTd9JdqUDPVb8ACb8xtnEhJtBzAaDaDvYVv8k0Os+ZoAmUYecZ8mQKdyiSMu2HSDzr7SfshKDtv+hWJXPY2VR2oVZVQKzzFZ3XYkAHgP+yvsO9A7B2wtr5iOhHP5OAUn/J/ui3DZFl7Rtq0FkZmhUF9tOFqPS3Y1OtZNSS8vB3EzumAWQRCc2xtBVT4THV0o5O8CUD9KdebEZ7E64vJD1c0lWp4s3lXJ0j91ykw+K3ykWIrwrPzSyEHW9pGaAOPfZR3Dwc4u/bzgAE+wirtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n1yyNK6sHaopm2rNEybK0BDTFSOqSy/3YHjVA/ulc0=;
 b=2LCh8dP6COnO9KItM2RD80vyBfTzzrU1nDlTA/laucbg3nu4RAMGm5dLl8lFl2PnS4LNZsvC2n3YXXao9tkh1qdj+LwwQIkpQCIB+rJPXYfH02vPCvDsscqKhkRL6vbrT7f5kJQXNX0XZQxu/Gw3fJmmzLqdcOKG2qqj7JX44Qc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/4] xen/vpci: header: status register handler
Date: Mon, 21 Aug 2023 21:29:52 -0400
Message-ID: <20230822012955.312930-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822012955.312930-1-stewart.hildebrand@amd.com>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: f5def659-3b9b-4ad9-1f94-08dba2af9b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MsQb/n10me63qZXGgoZJ2qBLKZmjWw8KNEdalPBGgW+ryqY63xwiNauy6CFV+hCLRzjrx5x725yvpdMm+OMJZlEQjyXMDOLee5Q6wwPzf0Pp5+5Kmy7xrwzuyIkeVFyKxymcAEmbhD7b1Wu7bb/XawhLyqkpDAyX13UXlh4hyMQO/U4y7sTfT2o/BPw7FKdwz4MUVXzaBVoYgDWyq5T0HyiVDizr+CIEVV+BKZa08aSGOQRVjYk+u+KxeZvJyGXXfmDV4s5uD/zxT6Gx8zWs6lhYGep03hzt8CTUgua83ue4iPri0bMRob1MG5gm2EmlZgRXr1XgbJHLEBeQ73L+94RBC2RS6EUEFD4/LpJfWanMVEAu8hrBip1b5j/lULJWXYldm3adJLUreo5k6QFBbB9tbS1bP0loQxhEwqPYTPL6ZoF4UYh4zrO6zM0rGGk8iavToTJ2bNI+Z70ov0PUT90ApnI8sVYo55g+1/6KdOuDEW35f1gYk0h1ev4wXsoS4pih68K0flj580pzWZbmu37FoEW2LULQSY4oh+6tzsigeYslpZVW5hTfvSn5vlogiID1/cMxXRrMh8V+X3D4Hl6bPfLl4WoBUT0DgSc7IWWwd2MHcxEGUTaNuNbx8RaPi5tERv1RpTwvGunMcJRM/TXuvCWZM5q3NBBrQ1KZOIHu55f+2TY+Z4xbUlId8vcUx9vt8XKajEDrXFOBhg7DNtjBBOO6RivQLuFqxnlyhEe4cqdDfkFk9Plttz5zcuB4pQAxfjCiZMtaeOx5VMCFLw0O/CuwIY0YrGLcIMoLiXI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(356005)(40460700003)(66899024)(1076003)(36860700001)(2616005)(336012)(426003)(6666004)(26005)(47076005)(83380400001)(5660300002)(44832011)(8936002)(4326008)(8676002)(2906002)(478600001)(41300700001)(70586007)(54906003)(316002)(70206006)(6916009)(82740400003)(40480700001)(86362001)(36756003)(81166007)(36900700001)(357404004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:32:11.3588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5def659-3b9b-4ad9-1f94-08dba2af9b8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955

Introduce a handler for the PCI status register, with ability to mask the
capabilities bit. The status register is write-1-to-clear, so introduce handling
for this type of register in vPCI.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* new patch
---
 xen/drivers/vpci/header.c | 24 +++++++++++++++++++++++
 xen/drivers/vpci/vpci.c   | 41 +++++++++++++++++++++++++++++----------
 xen/include/xen/vpci.h    |  9 +++++++++
 3 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index b531ab03cec1..7061b85e337b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -413,6 +413,17 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
 
+static uint32_t cf_check status_read(const struct pci_dev *pdev,
+                                     unsigned int reg, void *data)
+{
+    struct vpci_header *header = data;
+
+    if ( header->mask_cap_list )
+        return pci_conf_read16(pdev->sbdf, reg) & ~(PCI_STATUS_CAP_LIST);
+
+    return pci_conf_read16(pdev->sbdf, reg);
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
 {
@@ -556,6 +567,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
+    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
+                                PCI_STATUS, 2, header);
+    if ( rc )
+        return rc;
+
     if ( !is_hardware_domain(pdev->domain) )
     {
         if ( !(pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST) )
@@ -583,6 +599,14 @@ static int cf_check init_bars(struct pci_dev *pdev)
 
             next &= ~3;
 
+            if ( !next )
+                /*
+                 * If we don't have any supported capabilities to expose to the
+                 * guest, mask the PCI_STATUS_CAP_LIST bit in the status
+                 * register.
+                 */
+                header->mask_cap_list = true;
+
             while ( next && ttl )
             {
                 uint8_t pos = next;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 4a96aa50494d..a34d85f4ed3c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,7 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    bool rw1c : 1;
 };
 
 #ifdef __XEN__
@@ -157,9 +158,15 @@ uint32_t cf_check vpci_hw_read32(
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
+static int _vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                              vpci_write_t *write_handler, unsigned int offset,
+                              unsigned int size, void *data, bool rw1c)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -179,6 +186,7 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->rw1c = rw1c;
 
     spin_lock(&vpci->lock);
 
@@ -205,6 +213,22 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
     return 0;
 }
 
+int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
+                      vpci_write_t *write_handler, unsigned int offset,
+                      unsigned int size, void *data)
+{
+    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
+                              data, false);
+}
+
+int vpci_add_rw1c_register(struct vpci *vpci, vpci_read_t *read_handler,
+                           vpci_write_t *write_handler, unsigned int offset,
+                           unsigned int size, void *data)
+{
+    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
+                              data, true);
+}
+
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
                          unsigned int size)
 {
@@ -419,11 +443,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
 
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
@@ -433,9 +452,11 @@ static void vpci_write_helper(const struct pci_dev *pdev,
 
     if ( size != r->size )
     {
-        uint32_t val;
+        uint32_t val = 0;
+
+        if ( !r->rw1c )
+            val = r->read(pdev, r->offset, r->private);
 
-        val = r->read(pdev, r->offset, r->private);
         data = merge_result(val, data, size, offset);
     }
 
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 17fd252746ec..518d381b2df7 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -37,6 +37,11 @@ int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_write_t *write_handler,
                                    unsigned int offset, unsigned int size,
                                    void *data);
+int __must_check vpci_add_rw1c_register(struct vpci *vpci,
+                                        vpci_read_t *read_handler,
+                                        vpci_write_t *write_handler,
+                                        unsigned int offset, unsigned int size,
+                                        void *data);
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
@@ -55,6 +60,8 @@ uint32_t cf_check vpci_hw_read16(
     const struct pci_dev *pdev, unsigned int reg, void *data);
 uint32_t cf_check vpci_hw_read32(
     const struct pci_dev *pdev, unsigned int reg, void *data);
+void cf_check vpci_hw_write16(
+    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data);
 
 /*
  * Check for pending vPCI operations on this vcpu. Returns true if the vcpu
@@ -99,6 +106,8 @@ struct vpci {
          * upon to know whether BARs are mapped into the guest p2m.
          */
         bool bars_mapped      : 1;
+        /* Store whether to hide all capabilities from the guest. */
+        bool mask_cap_list : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
-- 
2.41.0


