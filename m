Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C840C6453E4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455849.713482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlJ-0001zl-1z; Wed, 07 Dec 2022 06:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455849.713482; Wed, 07 Dec 2022 06:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlI-0001vv-Uw; Wed, 07 Dec 2022 06:18:32 +0000
Received: by outflank-mailman (input) for mailman id 455849;
 Wed, 07 Dec 2022 06:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlG-0001rE-MQ
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6d01796-75f6-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:29 +0100 (CET)
Received: from DM6PR07CA0066.namprd07.prod.outlook.com (2603:10b6:5:74::43) by
 SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:26 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::6b) by DM6PR07CA0066.outlook.office365.com
 (2603:10b6:5:74::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:24 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:24 -0600
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
X-Inumbo-ID: f6d01796-75f6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COXahS98tM4FADTgTRdCU6PTsyCqJ90PakUz/8fXKjZw5LsbiM6Wuj+SHG0lWu79gwATRYIpEMMP4lqE4mfNw9juwYBBl69Vv1HdisG1hIiHeVkzER0NKpw/LXALWsX7OI34v/YSLIk7DLQACK1d/FmcU0Ep006hHn67WCxsKWFlG+RFwRtuf2TdwNArnT3c0NSunt0HNKCLXS2ixaWf2p+Bm1LQkcLVp1RF6bCD8vS2Rqj1UoZBNo++Ss/1E6UqoCffmUkg40CnRna3IV/eKBc0VQ3nocsxbHoIhOWXCDPCwLLo6yZgqfweiDHdlgC0+Zpkf3JQZ9tKAOdw5NiFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=hikzcibQ0nJOOKfCK5FgUvIPTCOdqHLUb/xiWwNXEa1M3jUmktZctPe1ByZF0GVsk/+0BM1XDum5OosYsGUJJEDT5v8w8jubwt+gtuHFiX1QEy1yErWKZWSgC3I23cuXA1u5PB/XJ2I+1eIli5kfzIHRRO+BnSbqvi5v5EVoDJPQ4cPYiKVZA8i/xgpVxAjs7OxbSE2Cq3N1rUW/NdtqaaFquIv1L/C5uvlNIG2Huh/54Bd18dldS8P+MqBwP4wrCJJpNThevjKJqK16/RUm6swkwVxzo8JkFZxxdxNdPhIvMuZq9wtoCDsRUpq0EnYJYH/8g8gk6wDFJdvo0CKZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd0QFdZvzHUGWrw0BfIrEu3cWkp8jWSV4vPT9FURuHE=;
 b=xNiVNLih/dhMiVdLuKF4gDjHAxUTDns4Rxu5GfACJjnCZUis5L7cNKcQM5hrOb8xXC0uiXAWcrm5hgrP5a20sgdSch9aUxu9Je6NCPO/lM+jfaF5n4TTgLG6pAB4k3DVgSJIKLmSfvyoC3k0M/jfjpzFvJ49OZpLp4eyIPL1Nlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>
Subject: [XEN][RFC PATCH v4 08/16] xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
Date: Tue, 6 Dec 2022 22:18:07 -0800
Message-ID: <20221207061815.7404-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: c6125904-23d9-4acf-0acd-08dad81ada07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PFFaUz3KDhfbBWArza2pLzmf/uod3NHSSW+oJFGi1oSmQdGYKaw4EzNrfAJhAeTJXPnp4MXLLV+JzIbjxzE71vevsQw40gbP6YHTJF99EOBg9HcCBbNKXSIN+sXTcfA7QhwDV3vhsrcdj81Tp+Zfy6nGibejsIvilKvQ5ezIgIuvzT0BerP5MBOxNU3rVA9es8dbvMJ8cKVLH3sYKVApNbPoiTGn1MyQVrkFab5SiTwyuuviWouVw+Nobx31J1sntqxOnGfQzHQ1BeKzyqd7pBXOStPtT3l/eWOgbtNQSNdWIwU0TUOXEfDCituQgCMLXpmkyUa5ytZoyDLtXx6uXNfuskMdPsApeGF9phSJPcEudYUDn+dpAxW4FsbJ1trMLVorVP/tXOgTq9loxXTSjq5JNafz5qqRax+n0e2bWCFhVSKwjECPZthLasX2FPQdw87SBavkIJw7SdY5MzS4Ro0eCU419HGk7Fcg3H+wk8yNz3sJvXH7iopq80vRrHGM2k7+Cu4jIhiNR8YAVzJgW9TBSyq73zGTIbEKu5jt8bAaMA2+5cMQA76jvA7p4NFRdEbCYlR0iAO4XyGVeTQtN/aLxK1YViYt1Lh8kFs/9uysJqzzjA1OEism2X1ctIlqTCvkm9vldfiiBrg8erWAGBJtOw38brVBbdBafx+AlEK423g85eg12AOkZ/t5wNm3sxsJ2rCXfL3d6I5xZyopaVXGmthd4uojG91iuZLQ5jc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(356005)(82740400003)(82310400005)(81166007)(36756003)(86362001)(40460700003)(316002)(478600001)(54906003)(6916009)(36860700001)(44832011)(4326008)(2906002)(5660300002)(41300700001)(8676002)(70586007)(8936002)(70206006)(83380400001)(26005)(426003)(6666004)(2616005)(47076005)(336012)(186003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:26.4209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6125904-23d9-4acf-0acd-08dad81ada07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access add.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/drivers/passthrough/device_tree.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index bb4cf7784d..457df333a0 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -146,6 +146,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( dev_iommu_fwspec_get(dev) )
         return 0;
 
+    spin_lock(&dtdevs_lock);
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
@@ -158,7 +160,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
          * these callback implemented.
          */
         if ( !ops->add_device || !ops->dt_xlate )
-            return -EINVAL;
+        {
+            rc = -EINVAL;
+            goto fail;
+        }
 
         if ( !dt_device_is_available(iommu_spec.np) )
             break;
@@ -189,6 +194,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( rc < 0 )
         iommu_fwspec_free(dev);
 
+fail:
+    spin_unlock(&dtdevs_lock);
     return rc;
 }
 
-- 
2.17.1


