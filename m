Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD478B6F3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591756.924254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagZi-00035U-98; Mon, 28 Aug 2023 18:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591756.924254; Mon, 28 Aug 2023 18:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagZi-00032T-5Z; Mon, 28 Aug 2023 18:02:54 +0000
Received: by outflank-mailman (input) for mailman id 591756;
 Mon, 28 Aug 2023 18:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qagZf-00030x-TC
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 18:02:51 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e88::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f359bc-45cd-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 20:02:49 +0200 (CEST)
Received: from DM6PR13CA0031.namprd13.prod.outlook.com (2603:10b6:5:bc::44) by
 SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 18:02:46 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::a4) by DM6PR13CA0031.outlook.office365.com
 (2603:10b6:5:bc::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.17 via Frontend
 Transport; Mon, 28 Aug 2023 18:02:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 18:02:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 13:02:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 11:02:24 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 13:02:24 -0500
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
X-Inumbo-ID: 18f359bc-45cd-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPHH0+u5014acUuC1706UsAUtoAetJ4rPxNach1h23NS91Dq7/TMuEc0VXdgshXD7hhHRsxIX/0Ut4Rap8s5WVWGa1WvHirn4M4lLQLwTFmfWH9WBBLD8JEXXey5XgYK4/FMZLBmqwIeFDvZRsuUH5lmgDMivKiBdAaiwLlHB0YA/hCKrN+mweaVIcaL3Es/TFw8nahWAwK+h8dsGZ67+8pxEurws4yc3ZlnTqXTaklM5fZbmZOZwOSSl0RotQFHHxQ6LQgWLTZnKZJ3hSXDkedTbr/s0UshQ5I9+TwPaNaUBEFmfTnBGMWQn2pd2KT7iDX4eAohSMU9P3r0dvvn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU/f6BYM+t+yAh1uQ1Cq9rU23TlKf83Tj/wjom6+IVU=;
 b=jaoompQuoo7wzvnNfndd0zsZJZu7DkQk/iSOc3CNauejuUQC4Eh3TCBl81X2c6U1dOy1CSWiBV5nk2dN+gbW/qvlMrPdRm1PbgAFJL8lLrvZyEp5KH6Nh2FHgNPLSwR6jQ0R4BUN8tyip4sNhYxFu53fddv4+LGSvaEnd6jwgIRIxNEAlXTiRnBtHhqrF9UxRm59uL9HQPvVL4rUiOlry0dRasf+TmzOVNarE2HnFBLc/0SwRrTK66meq0d0jrhbt9vVPWNQ7weF9YBSjYFcN1LSpYXf2wXGoS1XPXTQWfQZx7dzC9UoozMOR8QwfdQDWSin6PGa04hFSrdq3N2JKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dU/f6BYM+t+yAh1uQ1Cq9rU23TlKf83Tj/wjom6+IVU=;
 b=zCaLUy0h85pU+40YoySWVLeXUBQfRmqoN09nGL7KBFTFTwdE6UY/vWBiE5Tlwysjm1D1FTHK5gS2TJyUzzQy9xcJBnqjHOqbBTXgJDN8rjF1xeP8a6QmQ4cQTNPTvMoA3+OPBkfi7U+ZtzdrTR3d3jkRtTYJl4HLJ0g9Cqy47cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH v4 5/6] xen/vpci: support ro mask
Date: Mon, 28 Aug 2023 13:56:53 -0400
Message-ID: <20230828175858.30780-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828175858.30780-1-stewart.hildebrand@amd.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 96754622-b765-4e00-c8a8-08dba7f0fb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	248eUgPEvL4aBCElLvvHqtJAPCn1seaBQW9NHZ3Lx+lGONPEybiOjJnYy7ODcurbhFzg52n4MD2CB4yvRm0DkJSGfxsebFfpBYUHX0VPSGeF0WlMhtWzg2+yoMq4W7i2Se1zYaNKS+t/yIq5E6oqOLsU1tRp62Igg0v9I/AJMAH+Blv4+43YgIyfJ1L4/57shiQPdZMdYnNj/7L8Ba0DKP/suj9Yhi7y6meKP3cVRixWUK6gUpzFQ5NtnJeHhAvZ9/BKhx0QqficcgZfEzm0psSKn24HQJg380+nzhSOa31gJNkpW5a9UrJ5SxvDRKRLlsCdcvdwGx+FqnrmcpzGLZQfveIMf1ih4hH0H8ZrNtXxb/X6JZXprw5owegPv+Be+qQw/efB+axetv3W3JSJC7RkDJ9CD1b9GeHhWbZv0m2lPmdg1TX6gnzqJBOmSRSynPXNdkRDPlUzwofn40KcAPjB4LrGg3bBHzFQ+7pYbA76pYN/cJqpeXe4lh4DZnflfkKCxgK+NJAoxCLlRC165fAamU8MoqaX9xaK6u4+qIpFoSMM4+GWNChxj7pKTAvYrgj8+uVY+L0ycxo7JtjRPQ098u7LKeZ/h98Bh9nAVbFX76XMD7et0LfpqnbOMimp0Dc+dSB5vB3KwH5u+GHuEt0SeeUuUva2uAWGS1VoxLHoo8GIjaSvnmHflc3utwEdUunYJCb1fmP3qCnZqNFqJib5vAEi1bifmR8vo4A/hCgcDD5iQ9xNw0jWNzWTZSc/l4E+Y08z5WvGgozooaSlFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(186009)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(6666004)(1076003)(2616005)(40480700001)(40460700003)(86362001)(5660300002)(2906002)(44832011)(41300700001)(8936002)(70206006)(36756003)(8676002)(4326008)(316002)(6916009)(54906003)(70586007)(82740400003)(478600001)(356005)(83380400001)(36860700001)(47076005)(81166007)(26005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:02:45.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96754622-b765-4e00-c8a8-08dba7f0fb8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927

Add support for a read-only bit mask for vPCI register handlers.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* new patch

RFC: It seemed like a low-hanging fruit to add support for ro mask. Let me know
     what you think, and I could squash it into the status handler patch for the
     next version of the series.
---
 xen/drivers/vpci/header.c |  4 ++--
 xen/drivers/vpci/vpci.c   | 15 ++++++++++-----
 xen/include/xen/vpci.h    |  5 +++--
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index dc8c6a66770b..4a4dbb69ab1c 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -556,8 +556,8 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( rc )
         return rc;
 
-    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
-                                PCI_STATUS, 2, header, 0xF900);
+    rc = vpci_add_register_mask(pdev->vpci, status_read, vpci_hw_write16,
+                                PCI_STATUS, 2, header, 0x06F8, 0xF900);
     if ( rc )
         return rc;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 8b26870a8a2b..2a67cc516626 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -29,6 +29,7 @@ struct vpci_register {
     unsigned int offset;
     void *private;
     struct list_head node;
+    uint32_t ro_mask;
     uint32_t rw1c_mask;
 };
 
@@ -154,7 +155,8 @@ void cf_check vpci_hw_write16(
 
 static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
                         vpci_write_t *write_handler, unsigned int offset,
-                        unsigned int size, void *data, uint32_t rw1c_mask)
+                        unsigned int size, void *data, uint32_t ro_mask,
+                        uint32_t rw1c_mask)
 {
     struct list_head *prev;
     struct vpci_register *r;
@@ -174,6 +176,7 @@ static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
     r->size = size;
     r->offset = offset;
     r->private = data;
+    r->ro_mask = ro_mask;
     r->rw1c_mask = rw1c_mask;
 
     spin_lock(&vpci->lock);
@@ -206,15 +209,16 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
                       unsigned int size, void *data)
 {
     return add_register(vpci, read_handler, write_handler, offset, size, data,
-                        0);
+                        0, 0);
 }
 
-int vpci_add_rw1c_register(struct vpci *vpci, vpci_read_t *read_handler,
+int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
                            vpci_write_t *write_handler, unsigned int offset,
-                           unsigned int size, void *data, uint32_t rw1c_mask)
+                           unsigned int size, void *data, uint32_t ro_mask,
+                           uint32_t rw1c_mask)
 {
     return add_register(vpci, read_handler, write_handler, offset, size, data,
-                        rw1c_mask);
+                        ro_mask, rw1c_mask);
 }
 
 int vpci_remove_register(struct vpci *vpci, unsigned int offset,
@@ -447,6 +451,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
         data = merge_result(val, data, size, offset);
     }
 
+    data &= ~r->ro_mask;
     r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
              r->private);
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 51b1b06c2c71..b0636182d91e 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -37,11 +37,12 @@ int __must_check vpci_add_register(struct vpci *vpci,
                                    vpci_write_t *write_handler,
                                    unsigned int offset, unsigned int size,
                                    void *data);
-int __must_check vpci_add_rw1c_register(struct vpci *vpci,
+int __must_check vpci_add_register_mask(struct vpci *vpci,
                                         vpci_read_t *read_handler,
                                         vpci_write_t *write_handler,
                                         unsigned int offset, unsigned int size,
-                                        void *data, uint32_t rw1c_mask);
+                                        void *data, uint32_t ro_mask,
+                                        uint32_t rw1c_mask);
 int __must_check vpci_remove_register(struct vpci *vpci, unsigned int offset,
                                       unsigned int size);
 
-- 
2.42.0


