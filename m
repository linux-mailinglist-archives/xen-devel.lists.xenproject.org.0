Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC986ADB7C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:11:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507263.780551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHc-0006RA-Qn; Tue, 07 Mar 2023 10:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507263.780551; Tue, 07 Mar 2023 10:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHc-0006OZ-O5; Tue, 07 Mar 2023 10:11:00 +0000
Received: by outflank-mailman (input) for mailman id 507263;
 Tue, 07 Mar 2023 10:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob8o=67=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pZUHb-0006Nh-5X
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:10:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 597925f7-bcd0-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 11:10:56 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PAXPR04MB8094.eurprd04.prod.outlook.com (2603:10a6:102:1c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:10:54 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:10:54 +0000
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
X-Inumbo-ID: 597925f7-bcd0-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnIAxOG5Tr4iGrWOVRe5bXYIYJi6xISWNzBCAI+3A7HZmiQZ9Qz25eWaXhrAl3x2h184dSFljXF2gv20BEm69fCXppdL7TupHVvkfytOFEkN7UvSbUO6Scf+W+Z0Mn41G3kRgOXE5+00A8+fpC2E2hfwszPvg3p2dVK9MZDo+MPkuNo6DdKYzfuhPYFaPGkzzRHVDZdW0QnI3jdx0UrAKzHKCfNXrjfDTe4L6KRUA4RmYuuXqk2daK0hYnEtmXADGFAp+xMN20jc3jCCz0yNTE7Tn9we2N/1obLF9OEySKlaTmfzVFLQXemSLCnjhTDyCyB/uTOli6ps1l6U/yjiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tyq86JbXHflsMuSweaOQDMiXi/8wRTSxsXZl4iIFAhs=;
 b=brcei4ePtvnp831MMkK0VyhdMcOCOUhU/aoAj/HUrHkNoUeJdscKiw2ylMU+qZEZF65UvTGqaFgsmqIJQnb7p7djVFXn1Vs7+pa2Rx5GEOast6XawhKmJ3vR3hSG575tRhuHkKn7TPqocmduB2Y0ULieiYWAc6RpuSoylyKiFLKFDB9ebfGClJslepltKLoEJN7byJHyelYnkCQ0AVPBV5ZY7HBnqSyhEn8W6OLNkVFoC/OxSy15tjqT+2Nor3ZOTGi3qlSh4gd2GUGlcYQPYAGuX2tr7gbd0nvwuOhEfQVRbXBOtI/5FOWrKLeebC1/tb2MHc5McipEJwKadpCdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tyq86JbXHflsMuSweaOQDMiXi/8wRTSxsXZl4iIFAhs=;
 b=BD9yj3gMnctJ7+6wK3sXVbUX9MMd65W8g+txHlyOpDU2rn+iV98BAljE31kbvo16TrNhimmEn3Z9cnKbfz4jk5i5SAtl4g4KhvpruJkNbzyq3G7MgJixviemoxTCHflHfyd75QbFsdil5FnNcrdaZSBiAEaxpaOQKzXzdXeRhYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v1 1/2] arch/arm: irq: Add platform_get_irq_byname() implementation
Date: Tue,  7 Mar 2023 12:09:48 +0200
Message-Id: <20230307100949.9231-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::11) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PAXPR04MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 12146b3f-9fc9-4667-408e-08db1ef43c4c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JF0gh7sPMbTpxgODkZjn63eI6nP4rzrsjoVLCq6v9bvemYms34mKLotXtPLyLTMHBLKn366vmK0UrSki9Nx8z54n2qDM/3uITp7JNIzGZGDFLZUj7+JUWF+99abUJo/TYz5ApIOGRo0BlE/J1j9by7C2Q7di1H6B2AlyVrF5eE4ZsObv2cJhfkGb5Mp6mS0MoXMHESFl//oNyfP1kGTC79lZ0znX6e4sIh7U/stm3YH7Qx99xgMdl9uOIeTXqZqMTMnwpBFsMGmGNh+X9FlCXoiY9jpu7syKh2UwAGJV9hf+l42J2692dk/zgzBE2k+FjTlsNU93zrZN70c3slHqW1H6UXHMR9WMB3Ln8ilrWv60U8mlg1njxcv3P9883TJfKet+Kg9VFUYKWbfkeMwISy3XQZ1iVG4ty0LuC2RWVTQUsHiS8e25AXtQsaEn9AVIpc43uuvlkYiFrWb2ke3F0ZQnyyhg+WXEmRYE7S8I7356kq2BIoRYu2J0sS6BH2c6b3Q+BMtmsG7qET09FfLSbTSp4EOH0RSR2gg4RD3ABz1XAcsd9eg91cLMfkXkkb/noBXjktepy99JLBnl+KrznCeRFbcKU6rWol8xLbk/9ItusXp6+UASyXa+5b2gk9MZHNdmErEHvzMZi3oRBxYwlNdQA3W+0JMNJ5RGYK4lGd6nkjKJ3kPlotyPRBVok5bvucYWSxQpFs1uxshE9PiLgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199018)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66946007)(6916009)(66556008)(83380400001)(66476007)(8676002)(316002)(6666004)(478600001)(6486002)(52116002)(1076003)(6512007)(6506007)(86362001)(186003)(38100700002)(26005)(2616005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0X2VBnQ7m9TkKF7HDOMAUc6BAKmfX2yRxYmTFKjLXrVcrovirw9qD9oTENS?=
 =?us-ascii?Q?SIghaHukTE57A3X6q4kXuSZ9yCghk0i2lXVs6nB6/L/xX6uP6956VIUmHkPk?=
 =?us-ascii?Q?gS2+B9pM1gbD15cwqxzIIBeqewQzLFk9pT+9r/E+7mxbvTQvQ1TZG1rFw2JO?=
 =?us-ascii?Q?hpkqW/WmSoaSS7BD4hVIb+OQjSkopI4K57WE+lkeTvd4A2H8Z9tC+CvmoYbK?=
 =?us-ascii?Q?jrGkjhshfitHoVKYeOVVdtCsPKUoeBDg4oYqMWMvrpT7cApHeovr6NrjoEDq?=
 =?us-ascii?Q?JOBzBzbOdTQU1BemVRl+Z4cVCzDVbTPBv3bl0KpSsAaSjoA6NKb7XApB629n?=
 =?us-ascii?Q?13pkKX6IxSxrxKwWM3DKah3PV2/4J1lMWk4C2sw/qqva7Pc6xaSb7/DTLeTq?=
 =?us-ascii?Q?wf06vvW2bdOBrbGl3Mlzo8F6oqFN/pcP95CviqBrn34c+pkm5+DWOpiGHnaw?=
 =?us-ascii?Q?6y1YqCanBDHf8omPR095rgArUD89N3UokzdjZrtc6Aw/r3UyC6wOeNE/fhWK?=
 =?us-ascii?Q?mh+dYYPsV/TVOsLZbMwW3mDejAIz1/Fwhfwo55A8PSIZb/xqGCysabxAZo3r?=
 =?us-ascii?Q?yM8vQJV149k7yvUxx5KI6oJA6cLsH9unRAC2rtr+e12UNebFlQ39T2DuTZM7?=
 =?us-ascii?Q?6EnTHAFCOjPFmz1QN99VAC0feE2QJgZBghYQt8MFEa0ahN30ig9QfmxvJpVQ?=
 =?us-ascii?Q?0HjTldcV9py9bzBRkqLcOu7dwiOhaCK/11/LBlpvFOpanANiOcJF16C+ZNYL?=
 =?us-ascii?Q?5YNkvOLx/C2duD2P/Sha/Gnh4WD4WBC2dHioBzTWakPpETDWhEYUc19WxnZt?=
 =?us-ascii?Q?dqgvB8iI8+gmARiuP118sfHQRLQj/bQsniNYpDWw0KybNzRZo1+ZOxi6Mfub?=
 =?us-ascii?Q?oEGRvKUaTDb9M1hDjbuD86s03ELQ4dd/tRCLTx1vywPsu7XmjomVsC+g/i5u?=
 =?us-ascii?Q?QicYJX4a81H+CZtsqQNz1ZmzB02lx99fIwdV+dba6TgkUJI0ICFtVccMlgPT?=
 =?us-ascii?Q?svWQxjER7kcVrkacvDQZ5QEDpQv2iz3mNanRAqjHscVDly9JMytKE8eStEgC?=
 =?us-ascii?Q?PWLKjPhkI71zCIFPP4FDjorqpfk4YSoyCI1bjKNk3GQkPlxD/dmEdOxAAx5F?=
 =?us-ascii?Q?TBOGeNzeHjWOWMFlEy8POL7lNv1yLulABhiaPAp+jW76WGAB8uINjJuZjsCN?=
 =?us-ascii?Q?337g23sdkb/AdeCEjs+uV0IcxSohiWMNG7Z7JjtC52IdMNvySSYmfK6LmKYG?=
 =?us-ascii?Q?u2lKD0jxuqFDFqD1Z3OUCta1B6I8dyJwIKViEc+yhS/RRGcEWn8xHK1Rbmbg?=
 =?us-ascii?Q?rF+eevWNo2gWQS4lgH48BucGg9A2Zbc1kvLX9GYuuk34bUKlcDevUJ8+UoSs?=
 =?us-ascii?Q?DqoP5IZELqbPSMEE/fqIY+2SW94Nu2azT6bxHVouK+mcwhb3d+1bp3SzYVs7?=
 =?us-ascii?Q?uBouvGxvk2kvnABQqTMqe02tlCBOG1rH7ZmiXdsJvQS8tyouyb7bxCo+0sYo?=
 =?us-ascii?Q?cmuTHief0S8ls+G8RU78zXsrdg3ckSz7Jil5yUKar75S8CQFKRfLhahrek2W?=
 =?us-ascii?Q?bLbtpdzPeJTK+rApBzGeng6bRtMaT5FpgmFC7KSw/uJUg3gKyQiZiI6poGzQ?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12146b3f-9fc9-4667-408e-08db1ef43c4c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:10:53.9134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/5kjByvuv5osyD6jJwCNwgZKnoPywLCEVpObXeSuwmSW3q54dUNItUrheQ6XJVi5zKeBXGk/qO4OH+p7vo0FA2cTg6YKSil7bWwcbyhnBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8094

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Moved implementation for the function which parses the IRQs of a DT
node by the "interrupt-names" property from the SMMU-v3 driver
to the IRQ core code and made it non-static to be used as helper.

Also changed it to receive a "struct dt_device_node*" as parameter,
like its counterpart, platform_get_irq(). Updated its usage inside
the SMMU-v3 driver accordingly.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
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


