Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 393A26B2A9B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 17:20:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508328.782924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIzv-0005fY-LU; Thu, 09 Mar 2023 16:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508328.782924; Thu, 09 Mar 2023 16:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIzv-0005br-IP; Thu, 09 Mar 2023 16:20:07 +0000
Received: by outflank-mailman (input) for mailman id 508328;
 Thu, 09 Mar 2023 16:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaV7=7B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1paIzt-0004YB-Ui
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 16:20:06 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe16::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4018f434-be96-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 17:20:05 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AM9PR04MB7667.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 16:20:02 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 16:20:02 +0000
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
X-Inumbo-ID: 4018f434-be96-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSgY9SjtE7MbRUG3P7gNlSXUK7GQ7nLtc/EZ8VSdH1w5Q5t7ysJTakLWjYxzTS5+gvIMpCogd9l3UWaJbKKeHgTehplAcRJW5QNQPGKjVj23pC8So+zFB68FDhhDTwea4Vxxewbw/C9qtvWmkgQEEoj5b0cnrYCfbwGV10JiJz0vtZ8808YDSxYsoUY2wExNe/M8uRcIaN59UOuiiQRv8oyBS1Zv42ta3qYWRmqyGaxI2vy/g6o6oYAKmYGxqTZ4SKB+GjZGkqVnfsUR4rBRonKLB5ZKrCVmRtd02l8ZJFfqT42RRBlx/AE5tuWVHzBUkF6u3u6M37c9Hh9pg+InuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQNYeJoSq7Q9ZqnSKcAT7DwtkzmkKIujQqNfvAuqlr0=;
 b=Dyg7i8umN99wdedUkRE5e3dyD69PlDuMG0Hh67Nm0Moc9UdqrOGPfR85JsZ9p/91aIihgAD8AV7ZUCH7o6gekCJnL60ClzYjqWnYGxIrpix9YPmdRsWfhV4WufYmF3+QQlUGKuIg8oYbjFiqHDLqwe4QE6o71KM+/uXqNTGmVIaL7jpL6EGl9KEJFR4jH4UmyOtytwuGJ+h7KyKJ3jqb5UGEjF2oTj8MV58ZOlAdgGZRbZrHoZl15NDQ5Ji5MzQOD2h3VP2jrzMCjP3kmZTquyPZzaYiNmEVif4cSeeZgOjcrdITgmTqe/DFvHPa6saxhj6onyV9L8mXOKgbw3O0XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQNYeJoSq7Q9ZqnSKcAT7DwtkzmkKIujQqNfvAuqlr0=;
 b=fU0NGVSXiJ1P7tbZxoYMfn67bABKnvWziFXjNkrO1JYJGVNmw5FB2gyNSnDLR/bas+4zKQx6odUDMzrIPpkTrwbMp9eXWe4mJQ6Cgdgge38hiR4nIROCTViK3KjQpZYGNxd7GrelLmTxw1iX8sLuhpFRA9l3EoNO5mq3hgRp8ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v2 1/2] arch/arm: irq: Add platform_get_irq_byname() implementation
Date: Thu,  9 Mar 2023 18:19:32 +0200
Message-Id: <20230309161933.1336367-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
References: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0138.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::35) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AM9PR04MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 369c9141-dcdd-447f-8e32-08db20ba2239
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YXlPzAvoipRdxPghJFetJ3SvPPigtGrS3oOVsZt/uLcb+uieUuwt3tXr+kEMzXOYujqXKstYtCjVl7AD9Wb66I6iKr/xBJXkPehk+hu2mDSes8Kydpbbn6Vs0X4TiPSl0Oyg72VMxcd9mTq+WLCJSPpEgl2LMfQX/UD8T4JH57dZ5XBGFaU7PUVpMmMPjzyZKNpw8yU9s8NyK4KeCk5WIj2ZxNAWKfYCE8y3/2Oz+NxENcSfyNvjX+/zxwKF3jST5/d4IbRrDo6uEvk0znTdlLQ9faZYI2UIrAoU77ttXm227ihavm6NrlFQs48MsJuuHbcp3I1tph/JbMiNOtu2hZuFcOeHXQCx3BluumEykW0xQV9gBQMoNxzHuprx2GXOQHG+9y/mnJ0QY34DstzH9TwVzdnDjrhvB2qr8AB4YOJcy3Bn67iECgoyqKztcn6sMISiOIfaUZnx1rYTGhiI4pQCfw15DG2B7GAaSMUWgBz/NCzG/Ar7Tt6r6cupCaADBqX/nhyAdzbtP8cmuHv3KRzCA1FBuqm7AwMFs5wqXGZjdAq03Hrh6I7TJ4QrjoARtwqcxhKyTBhvbhVURCGFMr4Q2u2JT1BsM/4AIJiqgET0ZSiReXYuY+hdcOJT4Fo8oIJ6XFMG/YTDPSigr3sycz1mq4x6Ymv6rlzlN5Y003O081Idq+de4AcuDakPsECSDdoN+nMInpR2PGlBVVQzXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(86362001)(316002)(54906003)(52116002)(478600001)(6486002)(2906002)(8936002)(5660300002)(4326008)(6916009)(66946007)(8676002)(66476007)(66556008)(41300700001)(1076003)(38100700002)(38350700002)(186003)(2616005)(6666004)(6506007)(26005)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DdktHC6EEgaLZkw/SrG9y9Q1Bi51YZ2RB2uHIe+vc6ONuqtwCOv8oaic3NN4?=
 =?us-ascii?Q?0ECOLKxjQ3veM8hEgah6Kn/gclcX40ORH89R64tz6u0nBsbdPFcrOeQy2NBw?=
 =?us-ascii?Q?1anLrA/Ma/XwheFwSFe/5hdRxKx0KlZe63ok/bwUMeyGiRLnF9ecc5YVJ7ik?=
 =?us-ascii?Q?klrdtx3zzd7uTu+yPtnbHgjGUovR77fy3FsG4gBqC52HezYs78u6sOV1wZbX?=
 =?us-ascii?Q?kUNBBImgxnlNojBBvvIMPuw2Qey04h4gEv31wxpeGmT0q+O4rQAh/04aEQx/?=
 =?us-ascii?Q?lA69hINPO9M8SYbxMcu1mD7GSr0a7uaGIv16kz5qt9ZcohPlSuPnGnvKrU+V?=
 =?us-ascii?Q?fRykbLukfZJdwbKl7KR4hhxecfkPi8ZiqAQV7XaXbdN2NSQntWqU2jF+Ayco?=
 =?us-ascii?Q?H1hlShvSPzLpJYO5+iArAuh2JtsevGNLTUyBRUmrynem/oyadEDaqZxyvErm?=
 =?us-ascii?Q?ErUg9i4cHsIAqf9M7K7uWEED5Z0uewpOfquipMlMQ9aW7OUAkpvP95IoNe6W?=
 =?us-ascii?Q?NZ9aiHvmfyN3SbVMa5ak6b1yEWD39M+q14H7fyD3/Urmx39YFIBBdEbzikdS?=
 =?us-ascii?Q?PycP1TFJ0jy2QlVqNGrn5ZQKbybYql6Xv4UPqTh+N4btCDQCvd5nk1bruyqD?=
 =?us-ascii?Q?eYj0u90idk9lf/ctPtY+Sn+gamhLYTp1gEkfMQHQwtN4zS6dG06sFTZ0eDdK?=
 =?us-ascii?Q?UNM82RTykL8mOH0uTNypYKD6hhOA5X2NwKxdijChgroGWKmtgE5sHJIzzPVm?=
 =?us-ascii?Q?ZCgZCzqBB3H6nzahQeAzhrGOEcNSGoksgDUhm3EUs0iJavgaGLmu8aG4opcn?=
 =?us-ascii?Q?qn81vKCl7TaGbL1eOF6dOnDTu+2442uVZf0cMjFzFi1O8xkCUBnXlUUx3hTE?=
 =?us-ascii?Q?i8A+mKILM4mL6uYYnczk5gM8h+6a4nc1ObqyVIk6GCZzGLE71YIedQRQnUuc?=
 =?us-ascii?Q?N0o0ux5i1tSLqmxT+z26DoiU81qo/T+nwF+QL5KrbLmgWaPrnzAzl9Szjwxs?=
 =?us-ascii?Q?i2AdscSyzGWT41Wnl2taV+G9yjw8GazpDp5zIn+pmGlbJRXe1DfP/+xU20Yr?=
 =?us-ascii?Q?5rCAhqjRthN7DFJVUpiz3TZx04zEiI4M8VOEVapMbjEVC9VAzrnxCpaPPdzY?=
 =?us-ascii?Q?KUm50gZJB966MTT12CArU5Qy1mO8I6iLurePQgbwn9N8nJpUTTtZD544V8Ae?=
 =?us-ascii?Q?DSKSmz7F/BLJXmqqKFeW8/g8jzK4TxfRufsQOLoDOhq0N8Zi5TtoqZ8IElot?=
 =?us-ascii?Q?wJOkSDAP1/xyX5GLCmQZK/KHTW/1gj0b/mUOtgCXxN48wRhWvKrGccI+5x27?=
 =?us-ascii?Q?jdjcfL3cfleT7ZHJfhKo9NYZGYVHGtc22Z1UfoOa2j1NHq+W67lX2EtsiH0k?=
 =?us-ascii?Q?ILCbIn5BphcmovmbysD4t0jQKV8InvWPdp2m/7bUfxjbHFPbFWwrC1Abv3r0?=
 =?us-ascii?Q?vVAnWa5G1mmZPaH++ZVhq/5QKDn1A82BekAOF1vLSHVQwfgXns3ZnE7I5eZ7?=
 =?us-ascii?Q?sqw2GCwQCTH4f0MMuRePkz3LnfQCr3sk/dcKWksaPzVk5DoLHRcWLlNhgVHt?=
 =?us-ascii?Q?TYMk5P2x6HZfd1wsqihbMSd0bY2AjLDscUKZWvFv77nCHrsoo4dsbnTQfOvD?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369c9141-dcdd-447f-8e32-08db20ba2239
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:20:02.7634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpHaSp42uvqVjcX6SOwlu5lhiU923kvT0cqURQH3Gc2X87mciN7TomXT4SZ6Sd0Oz1NnY8/x2aKiaIlg7m3PI6XCdCA+cZZjgJagSS7oHeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7667

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Moved implementation for the function which parses the IRQs of a DT
node by the "interrupt-names" property from the SMMU-v3 driver
to the IRQ core code and made it non-static to be used as helper.

Also changed it to receive a "struct dt_device_node*" as parameter,
like its counterpart, platform_get_irq(). Updated its usage inside
the SMMU-v3 driver accordingly.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/include/asm/irq.h        |  2 ++
 xen/arch/arm/irq.c                    | 14 +++++++++++
 xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
 3 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 245f49dcba..af94f41994 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -89,6 +89,8 @@ int irq_set_type(unsigned int irq, unsigned int type);
 
 int platform_get_irq(const struct dt_device_node *device, int index);
 
+int platform_get_irq_byname(struct dt_device_node *np, const char *name);
+
 void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
 
 /*
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 79718f68e7..ded495792b 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -718,6 +718,20 @@ int platform_get_irq(const struct dt_device_node *device, int index)
     return irq;
 }
 
+int platform_get_irq_byname(struct dt_device_node *np, const char *name)
+{
+	int index;
+
+	if ( unlikely(!name) )
+		return -EINVAL;
+
+	index = dt_property_match_string(np, "interrupt-names", name);
+	if ( index < 0 )
+		return index;
+
+	return platform_get_irq(np, index);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index d58c5cd0bf..bfdb62b395 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -200,30 +200,6 @@ static inline void dev_iommu_priv_set(struct device *dev, void *priv)
 	fwspec->iommu_priv = priv;
 }
 
-static int platform_get_irq_byname_optional(struct device *dev,
-				const char *name)
-{
-	int index, ret;
-	struct dt_device_node *np  = dev_to_dt(dev);
-
-	if (unlikely(!name))
-		return -EINVAL;
-
-	index = dt_property_match_string(np, "interrupt-names", name);
-	if (index < 0) {
-		dev_info(dev, "IRQ %s not found\n", name);
-		return index;
-	}
-
-	ret = platform_get_irq(np, index);
-	if (ret < 0) {
-		dev_err(dev, "failed to get irq index %d\n", index);
-		return -ENODEV;
-	}
-
-	return ret;
-}
-
 /* Start of Linux SMMUv3 code */
 static bool disable_bypass = 1;
 
@@ -2434,6 +2410,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	int irq, ret;
 	paddr_t ioaddr, iosize;
 	struct arm_smmu_device *smmu;
+	struct dt_device_node *np = dev_to_dt(pdev);
 
 	smmu = xzalloc(struct arm_smmu_device);
 	if (!smmu)
@@ -2451,7 +2428,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	}
 
 	/* Base address */
-	ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
+	ret = dt_device_get_address(np, 0, &ioaddr, &iosize);
 	if (ret)
 		goto out_free_smmu;
 
@@ -2484,19 +2461,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 
 	/* Interrupt lines */
 
-	irq = platform_get_irq_byname_optional(pdev, "combined");
+	irq = platform_get_irq_byname(np, "combined");
 	if (irq > 0)
 		smmu->combined_irq = irq;
 	else {
-		irq = platform_get_irq_byname_optional(pdev, "eventq");
+		irq = platform_get_irq_byname(np, "eventq");
 		if (irq > 0)
 			smmu->evtq.q.irq = irq;
 
-		irq = platform_get_irq_byname_optional(pdev, "priq");
+		irq = platform_get_irq_byname(np, "priq");
 		if (irq > 0)
 			smmu->priq.q.irq = irq;
 
-		irq = platform_get_irq_byname_optional(pdev, "gerror");
+		irq = platform_get_irq_byname(np, "gerror");
 		if (irq > 0)
 			smmu->gerr_irq = irq;
 	}
-- 
2.35.1


