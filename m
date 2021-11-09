Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380EC44A748
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223705.386599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkLA0-0002iC-Cj; Tue, 09 Nov 2021 07:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223705.386599; Tue, 09 Nov 2021 07:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9z-0002bV-Te; Tue, 09 Nov 2021 07:03:11 +0000
Received: by outflank-mailman (input) for mailman id 223705;
 Tue, 09 Nov 2021 07:03:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9x-00004s-P0
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17876806-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:03:07 +0100 (CET)
Received: from SN7PR04CA0165.namprd04.prod.outlook.com (2603:10b6:806:125::20)
 by DM6PR02MB3963.namprd02.prod.outlook.com (2603:10b6:5:95::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 07:03:04 +0000
Received: from SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:125:cafe::98) by SN7PR04CA0165.outlook.office365.com
 (2603:10b6:806:125::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0011.mail.protection.outlook.com (10.97.5.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:48 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:48 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9c-000Ga6-Kr; Mon, 08 Nov 2021 23:02:48 -0800
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
X-Inumbo-ID: 17876806-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjDJCREnjc/R3Tgtz+/Ide2ELBuw5EczeKdxmP8JaMqSj60ITmzEV4vZ2ke0ryS9fvMODllPwI+9mjGQtWNNzJM3R8bhUmHGQDJklWUVH7KxPGx2IvDq0S1ToF01lWvNlMkKFShFcGvyVUB/slMovKV0bwTisyBmDv86c6cdJw/hc5AdV2DT4ByLWT689lFzt08LpPUEU8wRDHtMjDtP2epFT3LFIYZyON3Gr+NqEkuUfMxWqKisAUnaWnWTFOCwAOQxgws7a1EcWXhV8Ggd7CE3uyQ5SLNftyJgw8EL+5Ts9Vgw9SN5qHNJs+C1NObzopeQR5b7FElXnTUPBE1mXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3epwOTRbTwCC6qELaH9f3CNhp6wdSrPjn5h5Ob5r4mE=;
 b=bDLg5XDWi4QE7QCucKw8Xjk6ueACZb1/dQW5Zbp6CVfStiX/araOeiznCQNCs4bwLfZkMhCACkU2bH9PQPR7QneYJakvo+yvszNNQidbnDd0u/fDNv1uBZaY1GqK2GgoURL8eC9UZZAFvNDaYtKbxCc7qfdkuvIpbeGqlKxNLRPr7l8V03ELvg9g2iz3krdIpk6OqAvMKKC89gBLV+dPvQehEfGRqtZviL7Pm+6Km5RVEy/1ZhCo8DieECGMlw88sY9KjNLW/KLi0fPQqCAIru8kraehB40W/f93a3IQKoLd88lJx+Jmhnnjrpiec7iUGAjzmruYnf4QM2Q/EOTmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3epwOTRbTwCC6qELaH9f3CNhp6wdSrPjn5h5Ob5r4mE=;
 b=TxrDKZAIME9NJR0cWlLT4ctjAE74CiYkWv0cLU7PuV8BmqnobU9beEmuEASgIZoUdEpuc/soH4uZVd+76LC38TpmvyLCyezjWwuxqsx1fKr2NOiTgFXr8J6n3gvZLY41KRl3QjwRt6QOoFxVwob+z6cmet46f11Dv36KKin07po=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: [XEN][RFC PATCH v2 07/12] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Mon, 8 Nov 2021 23:02:22 -0800
Message-ID: <1636441347-133850-8-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09a1caf-13d6-416d-378a-08d9a34ef9fc
X-MS-TrafficTypeDiagnostic: DM6PR02MB3963:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB3963CB23A3465E4254EB9FC6BC929@DM6PR02MB3963.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IfA09W3pIEgPQT6Hcxe9ccp+O+2bbYG1KKLGfosynnytPwctXLEZtKRFR4lZM7G+Ug3GZWJlTZt4AYX+pFLDxbyQABhIHriBPR/SF+rGS8xJGZeJ68NtgDETCNZ0EYEhTHmrvf5jXgBvhIdtyatPdGpVroJID1UjqibLRJmQtowkapowhAbKGECukusIIkqvyuwiadJFoxv/wNf4SRq4FQbFVCh9eY8RcgbG8WIC2Jf5AKT+92sB2iNTwxNiC3JWDLJdfsG6WH6XuUEGTT8ynSyLOWTwl4RUbQTqaZJ6YSzsFfPwx9hijT0Ec3u643XkP8bwsIdtBWxSyubTwLBzBiY25BAF5TXcL4jTkBAdKby2f3IgSn8+2ijRi8UEc3NYdiqaY8EuAjpTky/IlAgwtAY/1hLtgHaFH5I9hDe9opCdcqrNKKrO/VpWYB/qkt0W8n9vwm0Gf8W65C5k40nv+O6XB2Qy0D41dY0eym6yeBqQXPlGOWtqdOUq5lXjHXV/x2iwBdsYRt2Eoso6aN67aQCuJU4HSUO+/QAiq3mCflNpj2XHxphxhx246nL/cYbWJU6wJgSGmT7teeq70zdsg45UBxbdL5d5TE7JCTq8RuR6wCrzkrwz9kcAeUVGGbL/jn3FyP43p2srP1mCJQN4y8NWqHNTN1Bi/YvTqX/iqwgIZOCmBIeWLzgUfOSq5P7b0137OKmqJBFcAIwtcR9scdEdiNFyPe/B4bqsuE6c+oc=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36906005)(7636003)(36860700001)(8936002)(47076005)(54906003)(316002)(82310400003)(2616005)(70586007)(2906002)(426003)(508600001)(70206006)(6916009)(9786002)(36756003)(5660300002)(186003)(7696005)(4326008)(8676002)(26005)(356005)(336012)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:04.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09a1caf-13d6-416d-378a-08d9a34ef9fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3963

Add remove_device callback for removing the device entry from smmu-master using
 following steps:
    1. Find if SMMU master exists for the device node.
    2. Remove the SMMU master

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/device_tree.c | 30 ++++++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 98f2aa0..9d9eed8 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,6 +127,36 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    if ( iommu_dt_device_is_assigned(np) )
+        return -EPERM;
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device )
+        return -EOPNOTSUPP;
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( rc == 0 )
+        iommu_fwspec_free(dev);
+
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 6b2cdff..c4d5d12 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -215,6 +215,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-- 
2.7.4


