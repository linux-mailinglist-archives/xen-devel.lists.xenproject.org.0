Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C7C63AD1A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449023.705666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVt-0006QG-Uh; Mon, 28 Nov 2022 15:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449023.705666; Mon, 28 Nov 2022 15:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVt-0006MO-R2; Mon, 28 Nov 2022 15:57:45 +0000
Received: by outflank-mailman (input) for mailman id 449023;
 Mon, 28 Nov 2022 15:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVs-00040T-LC
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e89::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a35b60-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:57:43 +0100 (CET)
Received: from DM6PR12CA0007.namprd12.prod.outlook.com (2603:10b6:5:1c0::20)
 by DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:39 +0000
Received: from DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::b) by DM6PR12CA0007.outlook.office365.com
 (2603:10b6:5:1c0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT077.mail.protection.outlook.com (10.13.173.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.22 via Frontend Transport; Mon, 28 Nov 2022 15:57:38 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:38 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:36 -0600
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
X-Inumbo-ID: 63a35b60-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8esFL0K/xFVRY+msOleT44SMjlUxipeGE0vvCAOgEL+XElp4XiqXiX3pe7NktIJCOo04TaCP7ZtVCh+LWKQhWi2ff5fcT+wD+NXAP+IcOW5FjR8Uua/DhGgRULoGdZW4wi5QEZYQP+PKo5bqZKlQjm1ozN1qYQq41BcSzcOld9XdAaYCKyO7ynTxHySLADIDwTsUKztJMwiTlhkKzPz+rKGAcbQcftBwLZP4RILjSfPDegBUB9LqBlHOa+rIHqtViWgfxZxz3Sk25GDzNf4OIbw1XhGtuQGS6xCdRvVFFxZwDY4MauJHZnAw7awgKUlnt5cQyNXdHd14zCXHQTCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWnmupfzzitApxD+hPh9hKT2gUvFQ71h9WJ/O2B/tL4=;
 b=VekTy9ztrqYP+G1ShiIfTccBTzqwT6APmor9AEaDWCL/w1YNp+FEaMqquD4vCcyPBhzIspyTVmYqGs0qoETsDkXbm/LAET+xnxe4EOna10k96a/atGVoqPm1whpn7Krn+c1FykZQ4jAQHnJYf2Juf6jfQbT4dJ2krimI2tGOB03KtJ25acBktXQED85Z6ABxumPYTZ1Ggadl8rf65b4KJtrrLUUT3rPG0IHjWhEiYtDfi3XlJXRRV0NYqePiFRsVU525OGb2jhSlBkPIMPiobA5PN2qzE2fEmY6jbRF0asiHne4b4bsw24H2D6m1NF5nhlc1TZFxiuDPFiwzPkvnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWnmupfzzitApxD+hPh9hKT2gUvFQ71h9WJ/O2B/tL4=;
 b=TecdKDIiGkJVYISCWX5fPUN/f2gLaprIDZbEDthnRFKv41p84FP6S3pcEj0A9GsTdc7+JtKCRYnA3KWLpEWEbIJMY5RDK9jb1grQDEtguBkklbSKnApIs8W8v7JRNH+VLyYfvsMnOZy5VdV/JmXfEA67CajUb68fTdTLXxGl594=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 06/11] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
Date: Mon, 28 Nov 2022 15:56:44 +0000
Message-ID: <20221128155649.31386-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT077:EE_|DM6PR12MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d3af6e-94b9-4a21-9370-08dad1594658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/oH3VVmLde9UeMRcq/gB+2H9Tq873ugViYMeaiby1BDJCw0LihnnFK7ZxjO9D5GuqHnCYHq1x/IeS7pMvDSsGFbOiZE8niGeoUZgBRUClSP6YA08ORJV8ykFweAntmw4vuLiMxwgxBSv8Fqp3irn7Np6hAxz7A5hzc3J6eZQsAGtmRuPFpb/b9QxlGUKI4U84kKuIs5AniVLceTJqJyP6NQ/bD1nDM2PNuXoPenBI60brsBzqxCFZSJAgX9mqGhpsU/G5KwqQYulPCjp0mrl3v4qwewykSAWIQXJkhxy+tHlIKqnowYx8pRvmYFgP53nUpA8sfbMhJ+bcehPB/nKK330DAHZvNGmlxXJmT48wLRyuIcCIfTdim3vwmTp98nO7leMVK1znyV1amVMLoC02GJ7BhD3+a7YsvcUFnsyKhXgSdmwMq77kCaI+PE1Uz2c/8+BICJ1soewaqQe7mKjTSzNagrMdzDvvhGtiN8C2fFvhu/lAb+YuNphnSEgTEpeXxidGZY+YG2CWzCyVFZhbA67SGkH6M/Va2fq5KWEoOjVj6PH5p0l6Q6zmZvlJGsKs7LQuq73Ln8GQEV9demRrwfvGrqtem2NseIYbW/+8Mqcg9DObALCZQ5aSiM8j4jAWZWxDVT6bJCDw9uoFPIV8MyHMMR5zbo6DhzEU2vaQfMMaa+mgUVBL1dHjBt63XQwiLllIwwMiqd8A0Buz5aC7oUaG99dpchgDorgyp1lpk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(81166007)(40480700001)(82740400003)(356005)(82310400005)(6666004)(26005)(478600001)(41300700001)(70586007)(8676002)(70206006)(40460700003)(86362001)(54906003)(4326008)(316002)(4744005)(6916009)(186003)(103116003)(8936002)(5660300002)(336012)(426003)(47076005)(1076003)(2616005)(83380400001)(2906002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:38.8069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d3af6e-94b9-4a21-9370-08dad1594658
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4895

Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
AArch32 systems. Thus, the function needs to change to reflect this.
The reason being 'register_t' is defined as 'u32' on AArch32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-
v1 - 1. Updated the commit message.

v2 - 1. No changes.

v3 - 1. No changes.

 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index e0b636b95f..47575d4944 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1483,7 +1483,7 @@ write_reserved:
     return 1;
 }
 
-static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
+static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
 {
     int virq;
     int irqmode;
-- 
2.17.1


