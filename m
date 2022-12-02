Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E863FE74
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451354.709126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI4-0000rO-2N; Fri, 02 Dec 2022 03:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451354.709126; Fri, 02 Dec 2022 03:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI3-0000mG-SF; Fri, 02 Dec 2022 03:00:39 +0000
Received: by outflank-mailman (input) for mailman id 451354;
 Fri, 02 Dec 2022 03:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wI1-0007SV-Ra
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e19ff92-71ed-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 04:00:36 +0100 (CET)
Received: from DM6PR13CA0070.namprd13.prod.outlook.com (2603:10b6:5:134::47)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 03:00:30 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::52) by DM6PR13CA0070.outlook.office365.com
 (2603:10b6:5:134::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:29 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:29 -0600
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
X-Inumbo-ID: 7e19ff92-71ed-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdIhCNEBnbLOiJClPfztF3LRc5JIvFUhnyDG5bH5ALU8nRdCjDCF7Dkrth/8bk9beQSBnEnJs2687skHuYXMllD3LZv+2ZJqVWhlH/xnanUNkcrUuKCDPpgeeRd9TbVvbIHRkxdEuzGkN7Oms3fZkNr80ALz1zEgfXBvpHL//lGX3SaHGN/TVEhMYKAt4yk3zzMYPKROJ52jc+LWyCD3HozgfqH3FQ9gEfZeO9jBL9U9ikP6L75fGxS0TL2Es2FK8Aw+O/dsLd1TLwmx1ruzlI+OIvvNDfSh3fCO/UhTCtVJN+gh/Ca4yeG11wbac1jYGf3mo6M70n9RX8KC20wMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQIEWPZU8OPBKR+IgmJ7ZTGjyMzMiJdFmkXcdrWRhf0=;
 b=eUKW/znGKnlCEYRmlxbT9RsnQaYP6J+rIVb+xGSv6J0pmfHSu/T1eVA9cTvhR0HivOuJwpAjbWgSGg2WU1M/10nvsb8qhz/99HwgZEPlaCAUehQR5La5W/eBXkD5yhd5dAt5Vl91TW/cZSvxU2yaeTqLSsu4F35SW9Ifww9Y6vTgu8nIHYHTI5uc3TIVHghSXgWGBlLQDI80xEh9YNXyZ49pVagsLfbyzgRXugGdsifmOvnp5f9U6KxBCJnE3j9oMd5QzVyzvyJEln1Z6lOCUJPjUX+7woeJEqrLXkqWkaBtelpuGPX52ZJMBo//Jlv7OTc3w1VNhT2o+CJ9Mcfc8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQIEWPZU8OPBKR+IgmJ7ZTGjyMzMiJdFmkXcdrWRhf0=;
 b=c5s2SIUIkvzEjXVP/TTSzlzUei8fZa4QHMgGfPnDAB9OnGbdiqx4KdQ6/zXbY4BtpFWTK0Sig46XZL7VgbD1Zcd2JQDSfEhI8RfBBI/hs5CWxu44YTX4kf7PGDhdbNQb2Ee281kLc3T9NuGRdp1RBwEL4rfsi6jXHw4nJSccNms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 08/11] accel/xen/xen-all: export xenstore_record_dm_state
Date: Thu, 1 Dec 2022 19:00:00 -0800
Message-ID: <20221202030003.11441-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|MN2PR12MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d2de42-3607-48cb-9629-08dad4115f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cuKhhC87lDgm75v2cR3IK8eyct8EOqrC/CXo9mJhYFdHSz3WprAQ/v4HxEmhcKSHSHxdXxUiBqdRGnSuNyZoGEDy2lMDq7g/mhQ+TIMetOl7kdc1eYRtcI3Hs3HHn4MsADLWFYytoauS5Xx28lQee061ZXHrP3xuxlIEP8AQXpl/6qhfUoHsyhl2UXa6EZibpw2mOrLkvanLDZt1t1ow6hR7bdt8xqf1bttI6uyFtGbHrayis4osyoqjw0LYTfnC6qKqQvq6SVAIm9efz8Gn6q8e1Nay4qhPRBlRxrvxj8BFHN/nhIYdsZstyytmEdkZMXysU2E3euEyv2hfHLtVdVu+9mJoGYc3KpAzQsFKrprG6MBAyb7JdiqR9fc+40VB7A6dVn/sXCRS8HyfKoWnSN7xktn+VggraS0ZNTivfaovBH2vOVb+PNh2UKe/jwxYKOsUqoLxY746xHDyRd8cYcth2Jcog4ZzdJFJjoR3b3gTSFlKT0NR0AfxIh62g77XXF2KNMwGYj/nH+iG5FAx68PNC498q4C4U4xJ+QSd02YL5enN4Sob5LhD6CoDBXfjaghC99NQAqcKDuorZ+nrgxPu6K2DWswALyiopwyAzHLb+6rCSW8WukGV+ZJNE7Dv2txPouW3QgxQaFw5g/6LcIhFuKCwr30+Jt2hEjdYCyWGvHqgL/h/4gYwcoAegyrzbvy76XOppb4Z7Uy5Roj2itG5GeOfUNmADoCU11nHWUI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(356005)(8936002)(40480700001)(186003)(5660300002)(86362001)(54906003)(6862004)(8676002)(26005)(70586007)(6666004)(2616005)(40460700003)(478600001)(336012)(4326008)(47076005)(36860700001)(44832011)(316002)(82740400003)(83380400001)(2906002)(426003)(41300700001)(1076003)(70206006)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:30.4582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d2de42-3607-48cb-9629-08dad4115f58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238

xenstore_record_dm_state() will also be used in aarch64 xenpv machine.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 accel/xen/xen-all.c  | 2 +-
 include/hw/xen/xen.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..276625b78b 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -100,7 +100,7 @@ void xenstore_store_pv_console_info(int i, Chardev *chr)
 }
 
 
-static void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
+void xenstore_record_dm_state(struct xs_handle *xs, const char *state)
 {
     char path[50];
 
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..b966db3c84 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -19,6 +19,7 @@ enum xen_mode {
 extern uint32_t xen_domid;
 extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
+struct xs_handle;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
@@ -31,5 +32,6 @@ qemu_irq *xen_interrupt_controller_init(void);
 void xenstore_store_pv_console_info(int i, Chardev *chr);
 
 void xen_register_framebuffer(struct MemoryRegion *mr);
+void xenstore_record_dm_state(struct xs_handle *xs, const char *state);
 
 #endif /* QEMU_HW_XEN_H */
-- 
2.17.0


