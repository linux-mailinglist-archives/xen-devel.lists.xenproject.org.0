Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11663FE6A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451348.709062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHx-0007dP-Sh; Fri, 02 Dec 2022 03:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451348.709062; Fri, 02 Dec 2022 03:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHx-0007aq-O0; Fri, 02 Dec 2022 03:00:33 +0000
Received: by outflank-mailman (input) for mailman id 451348;
 Fri, 02 Dec 2022 03:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHv-000723-Th
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ac3bf25-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:31 +0100 (CET)
Received: from DM6PR12CA0035.namprd12.prod.outlook.com (2603:10b6:5:1c0::48)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 03:00:27 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::a6) by DM6PR12CA0035.outlook.office365.com
 (2603:10b6:5:1c0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:26 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 19:00:26 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:25 -0600
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
X-Inumbo-ID: 7ac3bf25-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmAa+NYFaCYapMtMXzFo5YrBBpfW6gc9g/G7wGf/WDV8vzBGlRhPthkn720XVrvpsnvVS+5+CYRKRx/xbd+cfPTzgKsy7J8C7dJ6DLXIndmsSBwgn+JzneeDLbS8MM8NGZwN5XpwxDFKJtPeaOgqYT+wA9U8+DIHwUMNMn88j/MXuQhVul8WB3rQHdO89B5HegzGGTFSGICqaA6dxMbzuPZEsy9Ne1EsiEojsQ3F73fmy/rpXoo0/ehECUF/t1opkCaOko89+uSuFAmV87w/TIcLtoYQKK+Q3vtEtfgGFhPfWj+Dke3PUnIENVjMBVwjer8ii+KIbGFFJXEJMATaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UkSque7kYbu/UdRzUr1qe1upkasGFglxoTjB32qnP0=;
 b=UbuntOvJSnIFnQwjCzTohGlMSdDkqGO3K4uH0ADL9Ve2xCRuSkg7IjI9g6GKHhCKZkMAkd8xedSlWUlzxC5yKEspq/bH7Ge3qTb0owU5+FhWac05qL6W4n1e/348+zMaZxXgrcSO9w5iESiT3g7D2HYC0lhhkyKEm3bszgewwasD6HnuSSY7SCkG4wr5UgwKlaRv+1lwyKua2B81fB1vtcEcOysfUC61oNgufsyDUSNtyQZpKMMgn9aAaGM9fCbNcwIDwUOUSFzdRNtIjqyb3yhPWhYH2f8w4eVXIouXHLPpyzPsk44buWfQZctGP0b+5q4LdGU3Fqmpuyum8QAuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UkSque7kYbu/UdRzUr1qe1upkasGFglxoTjB32qnP0=;
 b=qhQpc0gMtvhzYCAtkmYuW83nywh+UBkcszRN14weXLPYSbwEIeLb1kMmLsAwVuq4mARbVhcWh2FLAvljIVM+pQP80b8fPI/KnnWLTR5gPrUe8xWGrDpayTnJw7zanjZ28bZF1cRfUAs6f1unEC8m0+DaXmZgJFOsMzau5pod1DA=
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
Subject: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error from xen_create_ioreq_server
Date: Thu, 1 Dec 2022 18:59:57 -0800
Message-ID: <20221202030003.11441-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT026:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d863e76-b239-4b82-d926-08dad4115db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WrTiO8CInG2wcQwwM1J4TPhmyuzxSxuww5G6P2QpHLQL+en/HmayB4g7csFKlC8/zehiqBoPGfoH6SVBvc6qszHrmTq3+DzurGOydSf1we1FBoDsuOSy47WCln4HfZhHfvdva4WfNNYHHt6We22rRWVCF9DNu+gLRzGebHCJEvWhHYrCTVA5d+sTKqWvj59uyVaadQvQ4dZRucwLGp5oAwRICP73oFSboIikwCfF181nQRCJlRlDHQftP/zmP2U4FMmQzSEY5iQvylSTNVMedmwZT2glWFE0gkbQvtGFmm1sjqmgedRahJE48wj6yoO3aAxjwNLNyjuoRrKb7QWyeyvaQmLgcT+SESMdxxst4wdaJwq7Uij2WeQQFnF5CqMzlRWvx7JaAygEmsQvfaHRHmukFc7b6fi0dfoO9tDbhvYLM+3kaYv2luVGrqid6FNXg8B/VUftQgX50emzlMthGgjbQRepr0KWnrrAf1KEjueO9DV72xO6HfhMfpNNj2AquAlbTWJ73/+gYrXF9YxRJapTXPMzpfKJBFljcNWo0ttwLcZmf1k08sXtPx+cCmqyw5vDZ4Zj69RkiBXOIHHGwqEkzJFK2yeH3Qy3voPn9lS7J1/rdmTIxc28CaYT3/PvupAK+n0tnVtvoWk3ur7jTyE9DS2cQGq2CY78gMno+ze3agR6rHEQhWHDncflYzXenKlGkLAjueZGs5j4zG8hFMRO8DGcoew794A88U+bvKw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(54906003)(5660300002)(36756003)(83380400001)(47076005)(426003)(6862004)(40460700003)(8676002)(70206006)(70586007)(2616005)(186003)(1076003)(316002)(8936002)(82310400005)(36860700001)(81166007)(356005)(44832011)(86362001)(4326008)(2906002)(336012)(40480700001)(41300700001)(26005)(6666004)(478600001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:27.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d863e76-b239-4b82-d926-08dad4115db2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213

From: Stefano Stabellini <stefano.stabellini@amd.com>

This is done to prepare for enabling xenpv support for ARM architecture.
On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails,
continue to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 include/hw/xen/xen_common.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 77ce17d8a4..6510ac15e0 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
 {
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
+    return 0;
 }
 
 static inline void xen_destroy_ioreq_server(domid_t dom,
@@ -600,8 +601,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
                                                   PCI_FUNC(pci_dev->devfn));
 }
 
-static inline void xen_create_ioreq_server(domid_t dom,
-                                           ioservid_t *ioservid)
+static inline int xen_create_ioreq_server(domid_t dom,
+                                          ioservid_t *ioservid)
 {
     int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
                                                 HVM_IOREQSRV_BUFIOREQ_ATOMIC,
@@ -609,12 +610,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
 
     if (rc == 0) {
         trace_xen_ioreq_server_create(*ioservid);
-        return;
+        return rc;
     }
 
     *ioservid = 0;
     use_default_ioreq_server = true;
     trace_xen_default_ioreq_server();
+
+    return rc;
 }
 
 static inline void xen_destroy_ioreq_server(domid_t dom,
-- 
2.17.0


