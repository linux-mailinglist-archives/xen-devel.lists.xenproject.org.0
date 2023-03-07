Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F036ADB7D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507265.780561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHe-0006hb-6P; Tue, 07 Mar 2023 10:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507265.780561; Tue, 07 Mar 2023 10:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUHe-0006ei-1H; Tue, 07 Mar 2023 10:11:02 +0000
Received: by outflank-mailman (input) for mailman id 507265;
 Tue, 07 Mar 2023 10:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob8o=67=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pZUHc-0006Nh-Ep
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:11:00 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ade7ad3-bcd0-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 11:10:58 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AM8PR04MB7921.eurprd04.prod.outlook.com (2603:10a6:20b:247::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:10:56 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 10:10:56 +0000
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
X-Inumbo-ID: 5ade7ad3-bcd0-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxdIJcwQSctzoQSsxT9vzZLcP4ucpRrb1ur3H+MbCwFU3lABQ4GHOo0XvxfbRKwjoysrXufuHDKc4eXBfetVlgY9lzsL9i4Wb6y3VdACY73P5wwWNqUnjmIUGntx20bsgASDYZgCPfRSyhEkTfPC9tpTvyEZP960FuXZW94qZV/e1ezoYOZp60CfqEwAWmhWLsUia0sYh3AO2+ODVo77rm++3wNZuP3Nh3WxqpvBo7E3MKpf78kslrQrbbcON8swGB8vRloOft/aY5LqLogeS5JGMjz2DtbMdQTlCNlZ7JL8xrftHWZTfMslOiI+LQk8J0wVK56xHC4kponP5yDYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujULk3y1sKw+hpceXjwl0rWf8ealySFr+FKiZ5uJz1k=;
 b=k3tgYjR1qR2xxaZQUxhgH7YAHANul07u0zbXjZqytrkp57ZASLmwHCilWUwDJ5fHbqYgjNJhngAv44nAongMk9VwEZ9kb3i3te+EEccJG1iK1hzg9C2pmdOI6ZH8Ih94MU15zwdcUz15LQzbhPQ7nxPG1GfuOcNMaiZeGnuUoXhXv1xV04qWRDG1U5mrHqgU2EHJTDIV0XxNEvCuirgE3cpiezzlI7iq/9pw0KZNYWNCzoCXRYDJlqQsEYBPXPi2Tpv1oInj9Bly1Bh85S8gqliOyo/Cj2AU/vGdVl8tzJXFI73A+E16sLesgGZawnvYY6g8RCix7UEUYELKIu1//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujULk3y1sKw+hpceXjwl0rWf8ealySFr+FKiZ5uJz1k=;
 b=XPFeCHSuaf/Maik/y0ickPs3kDmeBO35t8/7+v93NIcM3/IQkPznGWOo+F6bO9x2wS50JH7U6kvM7L0XyWbAyJZgbnNeVxn4GqoYbYUwE/NLJRagcML8Gf8v40ZBsNSTAjR+SGR8swYFsvaxgAQ+68xDp7aeTDO3YUZHGOWbLcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts by names
Date: Tue,  7 Mar 2023 12:09:49 +0200
Message-Id: <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AM8PR04MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 605580d9-2297-40be-ea7b-08db1ef43de3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o64yeR9N+eIHS8LmikWqMxovNJV3eLVOTHrsPYKDlA3JU+pniDRsXertxsnF6sSlVXIMhVZL1FTkaqbXKzfhl1clXqZ8Cy08yVqUza6LRixsxZx+nRucWZXPX4+Cpxae+gIpJG/3/hpoYiTMyhuvLifpxd/wvL5j5dSyZl63rdq5w6c7Di7ISSh/9aI41WPuir7KEDfYvzAJw2qZtdzJsuUAvWXUSP0CMtb7TrSlBCHw9a2qnRzqA8ETfTS6JiFjs6J1yA2wxSUsUCyoLGP2GWNz51CKKezFVJ6fjsDY5nUfF/OF9dy68Vvb0EqFVci4YevQNGx1SizZTYhQ1FcZuMPPVjRJFrCSvleW0rQqGpqHGrKXM7BSz8DDWTMSDiWm4igVQHfYYHW6g2mL0j7zhKaO5tRBhkZ7c9s3WBYXBuwpu2QK9Q1V7WUpHHgejv3gbkhSNFJCFmbxm9Y5Lu0/iCVzZSAizshNK+yoX2Cz0PPENFajf+BSfWPy6XwP3/R2lGSAV2VVuNMPkY8EXIlcZWz9K7v/5q9nDx3SPmiAukq5V5HX5oO+iQQPkQ2x5YGF+sAxQinqbtlVNzBpQv2TDguq2gLTvYPBAJrdDQ0TEQnyExVjaC0/nnsIfKqQ2nKqyYXVumYJgBJVh8C8i32xmlBTgqFW38HdR0nf5O8adxw5BqZ/y/Ond/Pl4LQwRGTQ394Xhv+mT5kbunrh6xri3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199018)(38350700002)(38100700002)(86362001)(8676002)(6666004)(8936002)(6506007)(5660300002)(2906002)(4326008)(66946007)(41300700001)(66556008)(6916009)(66476007)(186003)(2616005)(83380400001)(6512007)(316002)(478600001)(26005)(1076003)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TYJ/TmdxBe2a/uhqf/wbD5Ey93eechP/sH8L43YsjcuscsJC4qiAI5/ihiH0?=
 =?us-ascii?Q?0paqdWCNpDxdtanBSo5mJUAEFV7hf7AOGjYNeMgboMIosWGUnr5+Hgbh06hq?=
 =?us-ascii?Q?jsX7jsHb9nQ0WfS1pwrjGBYFFiGLNCVPJSNlHxz64site/p1cGY6g+k8Am3b?=
 =?us-ascii?Q?+++1ZQ5Ml2NCX/BpdfSoNPp8XPg+XAmhihzUD5WMmCuwDvSOJAureWZpCjvI?=
 =?us-ascii?Q?aQpei8YG15y9TyNoyz5oXWs6mbsnwJHnPZ2B3HVgrLxnFNOfUI/+Oy+FDXHb?=
 =?us-ascii?Q?xUHukOnXdoOM5gECLlGEIyIPw8fbeipNYUMwIjT7h+gDlE1OuoEb/4BYZkH7?=
 =?us-ascii?Q?nsNFqZuV/C0PmL8r4glV6ruJjfx2pvrlm1soYTk2P0saTOJM6Fg988wDoMXg?=
 =?us-ascii?Q?LdgMa8cu4me754jp4M2gYT7QZfahdtTLjsvIfuZLn/ndg0/wHiDBMYiwg4Df?=
 =?us-ascii?Q?P8m2yClNdApWNg9upwxFQlQPnSnnPf+jStAJaB1akU0/GJWevqopALLGRQib?=
 =?us-ascii?Q?wBeQ8p0khlQixTKkS8NDqEhYzXMc9A9Ym+FdaAEaiCedKYLQYhnvH0F3N71i?=
 =?us-ascii?Q?AVif3gWAxFkxVNgLfBxL7B1btNhDl1UTxEPXYwXsVmRD6tS7/OBynQ/d6+xx?=
 =?us-ascii?Q?OuSQuhVhScmzqR+gLV3HUf9aFCDlYTR3wgj225k03bdRvPXbyTLLEnot9gl/?=
 =?us-ascii?Q?4aX7mIw6fdux60HEmRbmQ+1OIdX/Y2JnnkiaZrpcXWer6haJoYixBQJoHYOI?=
 =?us-ascii?Q?1wip7wlUGGYJY15aTZ4WurDcT4wJJ3n83CN0uO4G2+h7B+/iTPziTeF+LLA5?=
 =?us-ascii?Q?Bk+86EyicZfPvl94WJtpv7qM6G3NZW5xAIlCsLrBBobZ6SHr8nDsypGc14gq?=
 =?us-ascii?Q?jiWbbQiiHJXTGmRU6slYVM0br1LTC6krS9Rud+bksx3cceVmT2tLglo4cua9?=
 =?us-ascii?Q?67+OB5V3G9x26x4VcxP6Knyl+5lTSuipTQ8ZNsNPBlY4023C0Qmtt5yukCu0?=
 =?us-ascii?Q?5DCpokomVy2H0u87ocY/JSPsrUOzfvVyjZ9ERus/fihqaRKolkJBgTWZ17ZE?=
 =?us-ascii?Q?YLIUV1WMlsyACxDorx/4pYiFlQnQPrj6/SPj3iZ13ELqvVVa4WYwk1WIFKjj?=
 =?us-ascii?Q?AnRzw274YqPa4G+f3Hc7l7IgvrEqHnV6BpSyBhUFub0Siap0ffmy48rpiOdv?=
 =?us-ascii?Q?CPtg1qP34pdu1FouOCA3iPyKMjGR9MoLN3R95fyt8o/2/PbpJZstBLV/khue?=
 =?us-ascii?Q?HwIhw4FRxUsck65qJtua1+/JG9pmVi0Cnnf+TTYCGkWNpq42hRpcgEQnbGyl?=
 =?us-ascii?Q?b6NmNA1pfWblY0YtwjOyTXafsFULChT1EblAc6cj5r6QT2ALuneG5se/ue5G?=
 =?us-ascii?Q?442v/mcR95h5XLux0+ursizpZUEkEeSawo/3ngkU3hUs+OxDj0NWd1gLIzAl?=
 =?us-ascii?Q?RaAwr6bJfM5MFCrmX7gvPk6VcHmJ98jvYX8OSBtvbKKq9vPaLt+fmfBLOv6t?=
 =?us-ascii?Q?S34UDIghY37ufP+XeVopB51aJzW9yK2p3HikbP7K+wpXxyBK+PHhqqUIvXA3?=
 =?us-ascii?Q?jYo9C2c9FexnqbPMRZrVM82Nssny6bcZOQahkrYsaluaGVZq6YR0cn0F9Fe8?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605580d9-2297-40be-ea7b-08db1ef43de3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:10:56.3663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0VS2RlksyQqhiEV6H/MdXbNrrljZHWFvHhl458JIuau/l5rwejIACS6mvjiVWF45kHjbeJqybiKfsHrds3j7fhYuuA89+TwHl2d0CJQnzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7921

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added support for parsing the ARM generic timer interrupts DT
node by the "interrupt-names" property, if it is available.

If not available, the usual parsing based on the expected
IRQ order is performed.

Also added the "hyp-virt" PPI to the timer PPI list, even
though it's currently not in use. If the "hyp-virt" PPI is
not found, the hypervisor won't panic.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/include/asm/time.h |  3 ++-
 xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 4b401c1110..49ad8c1a6d 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -82,7 +82,8 @@ enum timer_ppi
     TIMER_PHYS_NONSECURE_PPI = 1,
     TIMER_VIRT_PPI = 2,
     TIMER_HYP_PPI = 3,
-    MAX_TIMER_PPI = 4,
+    TIMER_HYP_VIRT_PPI = 4,
+    MAX_TIMER_PPI = 5,
 };
 
 /*
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 433d7be909..794da646d6 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
 
 static unsigned int timer_irq[MAX_TIMER_PPI];
 
+static const char *timer_irq_names[MAX_TIMER_PPI] = {
+    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
+    [TIMER_PHYS_NONSECURE_PPI] = "phys",
+    [TIMER_VIRT_PPI] = "virt",
+    [TIMER_HYP_PPI] = "hyp-phys",
+    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
+};
+
 unsigned int timer_get_irq(enum timer_ppi ppi)
 {
     ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
@@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
 {
     int res;
     unsigned int i;
+    bool has_names;
+
+    has_names = dt_property_read_bool(timer, "interrupt-names");
 
     /* Retrieve all IRQs for the timer */
     for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
     {
-        res = platform_get_irq(timer, i);
-
-        if ( res < 0 )
+        if ( has_names )
+            res = platform_get_irq_byname(timer, timer_irq_names[i]);
+        else
+            res = platform_get_irq(timer, i);
+
+        if ( res > 0 )
+            timer_irq[i] = res;
+        /* Do not panic if "hyp-virt" PPI is not found, since it's not
+         * currently used.
+         */
+        else if ( i != TIMER_HYP_VIRT_PPI )
             panic("Timer: Unable to retrieve IRQ %u from the device tree\n", i);
-        timer_irq[i] = res;
     }
 }
 
-- 
2.35.1


