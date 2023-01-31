Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7146839A2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487902.755735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUI-0001S7-GV; Tue, 31 Jan 2023 22:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487902.755735; Tue, 31 Jan 2023 22:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUI-0001Ox-Ax; Tue, 31 Jan 2023 22:52:26 +0000
Received: by outflank-mailman (input) for mailman id 487902;
 Tue, 31 Jan 2023 22:52:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzUG-0000Ma-F5
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:24 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea5a87be-a1b9-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 23:52:20 +0100 (CET)
Received: from MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::34)
 by PH8PR12MB6913.namprd12.prod.outlook.com (2603:10b6:510:1ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:17 +0000
Received: from CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::6d) by MW4P222CA0029.outlook.office365.com
 (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT066.mail.protection.outlook.com (10.13.175.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Tue, 31 Jan 2023 22:52:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:15 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:15 -0600
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
X-Inumbo-ID: ea5a87be-a1b9-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T93iwMoZgy9Jf7xdUTsUCVfYa/D6Jpp0RXFRIlQSwkCyfc7s9hL1LJQgcoR4/I0ER+9zBSr8ZmZC6cC75vECbi47vsdPwEXGiEE7WJu4O/+z25AKLzGdttzJgwhgHtxTGviy2M12pyuLE+B43l8qjBOcBmKBeBW3VRAKRFa8d1kQZCoSBJWXtxb8S8m/wwrhu/QBFG3lW6xGQ9bNnngBgrtE4BXYL/gJFlQPi0Gv/pxY0QyRAQJ+KQwZjWNeJIU9e7QYDyI47u/+LRdOglQ7tS4FNDPS0Z9HzaP8G06LYjkVxkoHeOfhvEQOSfV1cQbsdcJMmta41NabIAEfBhiIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G835PztH0JFR0+pwJr/tzQC6Id3/bG3j6rumsmwk9Us=;
 b=j02vR+MZE15i1yfU/QTGm/OBjwSG1Ici7XSnR9VoefRgytLEMyUiIdMHb4RAJrOCAHhkonIsFQOK+oI15UifbqQLyJ1Ir5P/FmS+8zIIvmKeLcFirUrjFT2ioy4zvFAVyqzjYIG1JxYnQcyCYo7j0f0tzuiJ7pNh78zeDvvZdBnZYlCbKe3Dwr2lvMTjfbzXV2F+DovtM8oFxmePnv3BpIaxAIbGg73QRT8ZT0ekxEBVT6f9ZomoYVNyve4cbII7kJ5O7Ncv7TGKlP0gZ0wLN0Fn/DduOPZsVkgDAgVLHbro/HG2F9ChG5miuTtS2HV/KmhXSb0eKrBHI1mvHM1crA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G835PztH0JFR0+pwJr/tzQC6Id3/bG3j6rumsmwk9Us=;
 b=vvhB+nQylkuBK5EK0LeDpUQH+WM/0vZ8QuPvhwY6uC+8S3P+PEIIBPdxMpX8qBsw3IRouMD3kIK09w5+v7yKCRemeRj3duCc6WN3sMLKyW0FSh5o7doe7WJsYqU8Jm0Z02qLyOR3JXiiOiJohnsgbNjMDogZjhmHB313kZjK2lU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v5 05/10] include/hw/xen/xen_common: return error from xen_create_ioreq_server
Date: Tue, 31 Jan 2023 14:51:44 -0800
Message-ID: <20230131225149.14764-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT066:EE_|PH8PR12MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 83650632-186f-4e4d-bceb-08db03ddccf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z/DzTBG2KJu2lQZgNJo1jzl6BYALwZkz81aWsaHCo0wnAHFAHW5T4x4hO+W5StoejY7jvmfZcPHP+GJ0Ez2mNToJIMABJz4sPcD5/f7pFMXoArorGVeAzQZXVP4YdPihFx6qAIG0WQ4b2+98uCQadhHNcHol3+PTe5YcBkYdjEWpNGxfUed2ShISyVFvNDFQ9zY0iHwGOPo+NZ1YtBv+FtmFW48VSwI8rAiG4jOP8X+JTBC72GENzEAHGgZ8JQJHWPr1dhln6sPELrpl8hTp+3bDPswgtjdKznUVKwpr1pn0up/wJMU/vHObjHkSVqm/58Qoj1//FY2n/F4mqk8OF6ATqTiJhNRj2fPtKdmjzQaUebe+90ekXOxtss3mYG6IwbVZHKMrOYaR9VrcX/vCqG37XmteKI+NeorKot7izauKgottbL3DrODI8GsXptBxwnsAbqIfy/RQ73aUa+TncU8MEn0P3DC2YrilbYo82kANGnXGSJ7ATw09GTGAliKKVmNvkn8Lv1oVk46FViDBiXwcmW8hXs7lB/pblj5Npg7Af2h1jCgByOboxJhFE5T9EYJL1i0SdrR0pEpzlc0QXowv/FCUyDJgaUk/oNeScye89DvlO7WoWV+viayCUeXzJQqY//xnKiOnd2qjiCzVnYARYTbHf5sPXfVxd0FvRbaToA+E10H9Npo8MB4MARJO2mDxXN+Y3pCXOKTDVVcNhn0Kt4ggfPhx3STWBd/8CPs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(6666004)(1076003)(6916009)(186003)(26005)(478600001)(8676002)(4326008)(70586007)(70206006)(336012)(2616005)(47076005)(41300700001)(426003)(83380400001)(2906002)(40460700003)(82740400003)(8936002)(86362001)(81166007)(36860700001)(36756003)(82310400005)(40480700001)(356005)(44832011)(316002)(5660300002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:16.2741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83650632-186f-4e4d-bceb-08db03ddccf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6913

From: Stefano Stabellini <stefano.stabellini@amd.com>

This is done to prepare for enabling xenpv support for ARM architecture.
On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails,
continue to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 include/hw/xen/xen_common.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 9a13a756ae..9ec69582b3 100644
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


