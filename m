Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912486B7875
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509254.784699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhui-00088M-Ha; Mon, 13 Mar 2023 13:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509254.784699; Mon, 13 Mar 2023 13:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhui-00085l-Dl; Mon, 13 Mar 2023 13:08:32 +0000
Received: by outflank-mailman (input) for mailman id 509254;
 Mon, 13 Mar 2023 13:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E75v=7F=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pbhuh-0007qY-45
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:08:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2684480d-c1a0-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 14:08:30 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:08:28 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:08:28 +0000
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
X-Inumbo-ID: 2684480d-c1a0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYBbjh9zCziNfLx7Kqv+dlOwe2Bt+LRSwO7PRtKi1o/vu0V6BsS4jta6S6/hFJp2IxC7Wli6/fVR0YY4wBOAFLhfGeLWG9zeM8U9eg2iFP9qaGtoqOuAKfab7LglehIPhn7Gl3OyiWTHoejtBXMUsnBIY0hFxpYaSa0vOiE8zAlEWA45y+bG7ODih2ukpXuCdkwUl+YSvmG0xkcVmtdOTNC6QeEG8CBAS5e9KNPmlWpsvCWk/cGamXxt28uTbHmRlW85Z2H+HOsSEEn9R2BqgtbBpmBheyPPtw6dXA8/gkIh0I+oSVyq6uZd6B3ulfoVjdsaJAGqlZKw1FMmkJMR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQNYeJoSq7Q9ZqnSKcAT7DwtkzmkKIujQqNfvAuqlr0=;
 b=LvCs9hwahRHCh2qbt8fUOYjq4fwtGgmTH/TQcCGJfef33+h9Uv0qEFsFiCqiXiEHYSGsNClgx1Sff7xZp+2DuRAYYiBZ9H/i9QeWjYPQ8Wde8+AYuSyT/oHPkkVfNJYnsLQ058HW8CFo+w4OaiCMOlKuGZQsLTxfJaL3F1JhnoNBOXZANkQonMDJGwf/VIEntxRmOLadQbmAXhW+3OslVXQZqgjfotOJuI6O8RBhELkqzyRqodmMUbBbmUtP58efFPt+YmJPQPbu1wKFkNbtWpKdBhEtVTekA+X8sKMDZWyEqfWReps5SRjm4XLJvwMQXfT2ae58fzYk/TZBibUG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQNYeJoSq7Q9ZqnSKcAT7DwtkzmkKIujQqNfvAuqlr0=;
 b=RHu/3XfhBS606kxDz3C7rgzQwNFecSBeM1AVKWDxDgs/ggnBV59B7hLo2VFqGkiMm67kcRRWSfMfub2vF4Waqib6e4+Fn1aX/IX6yvd2bbeFHa+pnd9YJvTvJH6ZsZuzU2bo98+56bHcNlm92ftcYvE4ti0uECG8FBQjJNkKLxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	sstabellini@kernel.org,
	Bertrand.Marquis@arm.com,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3 1/2] arch/arm: irq: Add platform_get_irq_byname() implementation
Date: Mon, 13 Mar 2023 15:08:02 +0200
Message-Id: <20230313130803.3499098-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0001.eurprd03.prod.outlook.com
 (2603:10a6:208:14::14) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|DU2PR04MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 9064394f-12b0-4336-5bb0-08db23c40918
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+vIMt+qbAQt3KeSXQuiqxuShSWEIZd4vIBMSEj4/G8JcKQ4mBpbKGcKe+tCbYvly5V7EhSzIFpbQL0J7iuktU99VYE2YVS5tOAd/BRjjGAKbLjPcafgYi+BdnH1iiT0rlnTazGinJKMzh829mhYnhafLOAvUDcEiCn4wMreYr2u6tEt6T7LSOOW+ywnO42uC+AFBXoqe7iVqu262ExG4ToRYFD/SEGFrkz/U2ZrZskdj1P9Cp0Ia4bSuDD5+ibp8X/AyRgP6GRIwBve22xRuC/WClaO/o48CZ+BbeV6/wFv+Ysbm4weIrzft6L737+MLBLO5UTUstpwo1i0fy2CCt3ZsYTolMkuEXNgMLvkK6M6seeyyO0mYjMCjB9mUQ5Cpoh4QjKBM7WN7hie1l2+d7B2hQHhJ5xxRBKf5yfuktyKyqdiHK+lQLLXjAviRidLL1uBkw725p1Tb+XjfU363STzJ/sz5B/+3qiZvWEp4/0HuQc01gzUQubv7hnbuDb0RR6SKij8ePKhqPoyYYdKXR7GqoT8PjpIDiHxs+2wB4CyXL1tYcrcBaQ+8GeO9YEwdEkyBSqAIvNR7IlXJh4Eti3N92NQKR6kRc4Xj9InpGNxNt+1awRCJ6gELDB+gbVNRMC9NvrTJLaHdSPgF8Xe7PBfBZlP/T6R+l9xt44wH7y1fsVWQ3Wi26mh26+KSmwlF33pQVeVmm4uQOORqK9F5Iw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(2616005)(186003)(6512007)(26005)(1076003)(6506007)(83380400001)(8936002)(6666004)(38100700002)(5660300002)(6486002)(66556008)(66476007)(8676002)(4326008)(52116002)(38350700002)(6916009)(66946007)(41300700001)(2906002)(478600001)(316002)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gssfjbbymzR8dHKbGSQXnU1vO0NcpOQPMv8nXLbZ3/I4e2lAgtH/1Pd2gpif?=
 =?us-ascii?Q?rAD+FHSsI+iJT+kaApOArXIePK4/vRWAYtLfl7EGhgbXwwvnC4fPhlFBllB6?=
 =?us-ascii?Q?9c3Y/CK7nIPHl5DAhN4pzJYa9y1nndm2WQ1YghC8TjffBgev8uL9WH+0NZZ+?=
 =?us-ascii?Q?pX1bAnf+l3W/gTXk1Snr4jTSmhwUM+Q+44g1lak7eqwn/aBj4Z02MIpcrxCD?=
 =?us-ascii?Q?yoi6cm040bpJsXZZNs5fms+OfD5PHWAeVJUSRKUIGRYrY291JXYwpX+IZWPS?=
 =?us-ascii?Q?nvTod/6ddpF3e3zqOotHs3LYzsN5URJhBmCTy58UylWBFgieX3ny+0UPMEhI?=
 =?us-ascii?Q?QKLzfzJdwx2kCtN0dFg2a/OOxaWajdyX/BxU1eieiZDZ584mE28hGOIiF2x4?=
 =?us-ascii?Q?4MPgi8oC2cSpoUtRyOcWku+Jt9VsgnEfOLqAIkEg30jrwUz743v2u2we+bdB?=
 =?us-ascii?Q?hm3p3RdCKqv8NLjXmiQMxULLMs86em5h30EdUbDAZoqQ+rIkrFCQ42OEd+dL?=
 =?us-ascii?Q?fUSruFetDWlC633hhwBq4AG+biS8N2O94cXC65qfo8JfVq7SN435Lbnm7FpB?=
 =?us-ascii?Q?2214Xjo3PmFngspNuNRDcYd5GChXhwTIGyzJCfAbDBfMAdygvwOAfhgAfxUg?=
 =?us-ascii?Q?2IbNHxUjmKPM6ynrBTKBzhTxxdyE8q6RfY98p34lGRnfu16PauTcbiyfjvAD?=
 =?us-ascii?Q?4agoWqpx9gNVFhd7qACHSHgK0raHy3mu35wVXSp/GReYJD2nhOD42SU0vJkN?=
 =?us-ascii?Q?mnqIv4+HvzD94QsmzGCnbuuEOtyWfYopZH1oP66DJC3GR6JXUfOdFbCGN6qL?=
 =?us-ascii?Q?mhwqxiqSETZQQRJehGtAPZr29dt/xvTJyoOZEs9f+2UAs/yCNwvMH+4xK4ZP?=
 =?us-ascii?Q?0Pita7D8qQudyQ5sIWrROXL0j+49TtE+LqXBMY0bcUw8x65+zeSB9GSNBMKZ?=
 =?us-ascii?Q?+D9JwTqXB+MdFbmV+yH0RW+C+Ch2XoTaurBk11gk15+AnqACp81Bqf6N+w7n?=
 =?us-ascii?Q?dHCjffkoCaaUmFSqWm84YSN9cRUcTTxu0mWRNraqEZGvjMRdXFr8fP4beSJ5?=
 =?us-ascii?Q?IkDPC3k47GkTDxAD3XliSZoQo0jHnYYmkgmaZBcMeXgxVOjmsaf6aHjuX//n?=
 =?us-ascii?Q?Ox0y0MWsnTBaDFHMDG7QcsSNuaKuXsL/FXhHfKZoNWlqJbfSQ/5nsuz1A0jY?=
 =?us-ascii?Q?nyLdlGQKxmQhtKbX8hjdNU9UJnIIlgatTxp4QwpIMjLM8wDh8hlzktkimWlK?=
 =?us-ascii?Q?enhSnj3jxj9mqvLJifOgcYHt+6P76nS2jp7uOMUGTGqJ4/DLZBIJB4Qn2sol?=
 =?us-ascii?Q?eXH29U4eMLNHfguuMq4QkPfh81EZ42yYy7rgWMwLtYc/Z+Ja6RiNOnpipvSV?=
 =?us-ascii?Q?oAGcNor73LhYRxsBjWyMqy+bKMQuAXECzmRjlrxDMAvNis4ei/3+9gSnpB6d?=
 =?us-ascii?Q?cWm3sCcKfyHi/gI426HxNdJCmZFlbEJ6upX3jBSO6aGE/XKVLUG1yf5hU4W0?=
 =?us-ascii?Q?Vnbg5plOG8OtHjykR3BgP+s543K2JrBqB9H//w3NbE1Ol6PwJjg+XqZ4JrG6?=
 =?us-ascii?Q?ltdVOXRVk7vODynTi7Su1E8tzTD9Uxxc7nPlyv5a3hbpb5y7K4RFAVqGc5H1?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9064394f-12b0-4336-5bb0-08db23c40918
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:08:27.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhIq6XikF4xyjnHVwZDKialzGi94INt+y4Nr8nAYFTNVdGDvnkha918Rym7OOhUdYkTNjhnIHZB+jF6xm5ZvX+/WlugPnGa8+BgmBl/x0vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520

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


