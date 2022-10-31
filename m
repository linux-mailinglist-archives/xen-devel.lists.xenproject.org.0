Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99E6139C3
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433028.685886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUR-0001NP-2H; Mon, 31 Oct 2022 15:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433028.685886; Mon, 31 Oct 2022 15:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUQ-0001Ju-To; Mon, 31 Oct 2022 15:14:14 +0000
Received: by outflank-mailman (input) for mailman id 433028;
 Mon, 31 Oct 2022 15:14:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUP-0008Dn-Lt
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac948e34-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:13 +0100 (CET)
Received: from BN0PR04CA0069.namprd04.prod.outlook.com (2603:10b6:408:ea::14)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:09 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::38) by BN0PR04CA0069.outlook.office365.com
 (2603:10b6:408:ea::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:07 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:06 -0500
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
X-Inumbo-ID: ac948e34-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeKhL96Zw7e7L9eZ/5IZAaQasBSl4JgavTTGCOKYoaTTt5vAdtlX8o1GD8LfcvbiglShgC95vt8PBjOjNLMuMsmlPioNPwUPgzU7rwIPWBUvLOxMV9E5EwHgHYErv88gqglMJQG53SgUhsCsHseg3NefLjp1ggpXgTfr6mqJA7WSy2AJmOykQnK8m/PdPA1m7ncXM/So013wTjHJi6gts0K9v9Et5nZDYFk5AMpxuzhkXFgPqaqdBQ+azM/bo7JJMdQbOskby0xD6bchr0HgaNMarjlwkYA+LXXi/G3OrFJCfUR1KJHH588yWQiy6lSaCUywVIiVQjB5BqEd5VKWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p5jkWoda03qGdQLpQMhA6Pfpa9oQEXMii4oL6oeQfo=;
 b=U4oPUJfOtdvW2Oa9WicG4Zky2xfKt+/t/uVkjBzytdnxqkSxRArx+t5kxz40OrJgPMeJJG9d0zZI6Zm4iJdK4LL0Uu9f3FN4h4LKYehnaNO+Br7PeiKXsPyz8Dv9bT5iCZcZQKmSeQiaS1wi7ZquMHW5xKkO+yJpKB4u8NNUsPNQuDkxcNX+y+7RD9X1XQ8040CdKBawpvQyR+M/hQ15+dkVLI50Ry9242doHQ4n3spf+Y65PB67wijcJR/8Vpzr+bahKBREeJemaKgeu0w4RvGNtcjqsMMO5pIpKtgn9qX9qJyf84R8AM42UaVNXeEyuPEPghVQlSaD2PLYK4KFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p5jkWoda03qGdQLpQMhA6Pfpa9oQEXMii4oL6oeQfo=;
 b=iMI4uOWxKrAhPJu2HX9BDpMduKSoEfBMmgpEIfeuT/6L4RhaeT3ponYzGJO5p3DFNcOUyR5JzOpQjAllOHY4gYOYhmwl1j17Dane3v13fzumFlTsKFFt/rlaZOwWHjoIr/wNNKbrQptIVG6RNVn60RfZB7xyqSb3uoG8IXy7ORE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 06/12] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
Date: Mon, 31 Oct 2022 15:13:20 +0000
Message-ID: <20221031151326.22634-7-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT009:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: d3368698-a592-4bf3-fdba-08dabb528f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u2zsv+y3hAmCawjxYt94RzsDAytQR4BT5ImykO+zdI1E3ULKBltKQd/WbkXj9yORxH5BTlM69LXuY8tk+xrft47U39Q4hRVIMqVYQcVT0g3adhIpaBBYtjMN0kiU/GlTph7JShBIO/3MGzgWr3ovCS19YQZFTbcT8Ryd0hGGXxkxnTOTycUs5sp/WiTvOimvXikR+CVtv8+95EPlfmOMAV6jgDZqDkjdNgd0CsUKDX9u19PCRxN6zhWQ96oyk77RjD1Mf7C/AVGLVUuvK8m7I7iOkyINw//v4JhKzz1bc62COwHJzK0tvgjUtxz8HzkKHYf1JKnhajQ1HUsNkNe3QQ0jVAtYrE8VuaZv8UW3mNeE7z8EKiT1OZ49YpiMmEwRh7ZW0EtPd8LkuwMa9jD2cmX8/C59OITlfEWCIeA9a3A/v+9vNrcIg71twMTj4O0CXwJ7vitmWi0ViPccxGiKkl3xKowtnSiSv21muL+XqYhyCqCa8k98DHaaWFLuEkt2Tp79NOiToPY+l8fTAKhfnYeQKEotBz4JvMry+S9u9NYPwU06/UXr9fx/nCuA+XdoKIwPINAjD08s6S650lQukIMCb3vig2ZoXMpLsc+h2FGIvGmY9pEGYKV6TY9LcICvCqJAX6yOOoQjlVLl7PsNbh6xZt6AKsESNz2OviK0M07+ycHre1kU5nm5b0VZ0QOpC3DeZdKRAYcahncLe59tGPGXNurEmDBp2Kbns1KgkEoajcukABX49ljp6uxmHr204J0N2Q3YhnnJl/Ngy1ayb08MzEF0a00em9uhKn4symA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(47076005)(426003)(8936002)(82740400003)(4326008)(83380400001)(5660300002)(4744005)(40460700003)(316002)(2906002)(36756003)(478600001)(70586007)(6666004)(40480700001)(6916009)(54906003)(82310400005)(2616005)(41300700001)(1076003)(336012)(186003)(356005)(26005)(81166007)(8676002)(70206006)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:08.8853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3368698-a592-4bf3-fdba-08dabb528f1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
Aarch32 systems. Thus, the prototype needs to change to reflect this.
The reason being 'register_t' is defined as 'u32' on AArch32.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Updated the commit message.

 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index e5e6f2c573..1bae76a1e1 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1477,7 +1477,7 @@ write_reserved:
     return 1;
 }
 
-static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
+static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
 {
     int virq;
     int irqmode;
-- 
2.17.1


