Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D96B7876
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 14:09:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509255.784709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhuk-0008OT-Rc; Mon, 13 Mar 2023 13:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509255.784709; Mon, 13 Mar 2023 13:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbhuk-0008MD-Oe; Mon, 13 Mar 2023 13:08:34 +0000
Received: by outflank-mailman (input) for mailman id 509255;
 Mon, 13 Mar 2023 13:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E75v=7F=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pbhuj-0007qY-64
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 13:08:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27bdb825-c1a0-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 14:08:32 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 13:08:29 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 13:08:29 +0000
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
X-Inumbo-ID: 27bdb825-c1a0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWZUlXNTG07dt+BjWWkxWvRibvGI4lRy8+gYAfsbDLZ6BMt42swFZ8Gv/pjXMvUvbUh9Su0ZcYFaVeSeOvSLkbTgsLWuze8JAJI79rkIsbBp9WoALfuQ3N3pxZ02U0SqD/6e32TBF4eNNr2MNQKRXcVtxI1Z9DHmHwy9tolvKRFVP8IM+0gJ7mqZWw4TZQkA/tsl4JVVd9kxKqORl9VHuNFaLQo5OHlhzgXkbFY3Br5JyJgMbTDnLfTU3xRAaA4yg6VRHAFAq1D+8PCh5/XVoGTuzG1xmud1pTgupwvwvC02z7a5WPdPX577W+Mc5v/ehcMTu09rtBvcBbLF6jL8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPWtOsd8bEyOgAZcfrDEhyFoI+CfhjDjX+52uaAqMtY=;
 b=XLHiaE+koF80w6fLqy7Pe/Ha6kuOmGaj56h3X0JkRHGigXZvn6jIbBsOvusGPrQzpmsQWNjWWUYuWrlf6R3pVGdoOlfevxONjDAYwD23ssbB2rWU/xsyy7a7cFwTwR3qwr6Nb6baK9ouhJJBXkvD9BUISu7+jz35jjzV4/aLeDHbhtxBQQ34md5ImzBiuylMoa9eOSCn4QRpCgnjIkpYeRQD/3/xxg3tGHRJaNNlbrV4MRCA8C6v1e7c+J+rgubM6inew4wRZu7BL7k/L2iQzTOebYYBBuaH/+BbLHL3V+O+n5Q21jYijVW3PevBfGrvnPagKVbC/q91ci1GsqFJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPWtOsd8bEyOgAZcfrDEhyFoI+CfhjDjX+52uaAqMtY=;
 b=ca3eE8gy6O6HWTE6ZXdsPOXGvoFnRsDn+nhbLO9lOAMJ5WustH4OYkJzJoXmWJpklT+NT5r3Ros9EZASpPsRYjV2BEBqY2H/HY7aa9lkfQm/XTvUL8lm3Hf7/HH+PUnknGXOpsNudtjEzEHemjQ/8OK9h8OEat2K0UmozxTUhtU=
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
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v3 2/2] arch/arm: time: Add support for parsing interrupts by names
Date: Mon, 13 Mar 2023 15:08:03 +0200
Message-Id: <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cc591c29-5634-4b82-4ae7-08db23c40a10
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zhZ60xI4deaenT1uEApWs8Eyj9aUCo4ERO/Bcy03z6i5UvLxKlA+wCeCFrGqmhGhvDMpbR5SOnqvmFX5HuSx/xDMJPJBNz9L/z/CEGmlr7ICoxR9idqoawiDhFWgU57Wh62je+usp/HzG/+iGR7K9lOpWdbgZtB0xyjKPtHLGPGKirGP9sgCj9Fa3Qf4d5LWC7EemworENqHliCTz2yH3G9d0E/8k2JaWEV5bj+LbEebVajyo16LjkH8i0bN1iMTMgsFi+JKC6p+/iM6CDSXK2c2TnSnS9xumigp2g4V7zFQbT+9l/Z+z1OMGBUFRSD/taNS23sWOYccfbXIbrZFW8RKXx/WbF5agD1kdnEjwEJMrCWCW2csX6Bb7yAmdBb0dfm73HkPq74+shyqowA1z65de+k3h3ioAwjDjc90yXkuKumC+3og3cZXmU5zdjmlt7tsAbjyAEadk8tFBe/9UsTLhl/TzJmJlDlZGd+/ZmKL32kAezxJiPt0llsqsneJbwBBeIeQurv8K9pP1hyGuep6MB/3OFNEDBmKrEx1PnAaGueKdfVklvcoz0waRko/M/CiGmvKxRqVNVkl9nGr8JQEXpnk4UHG+y4h6U2smOZ+N7pGMuOtrKuUIfG3h6NBbHRbU8ftDZdoHhltjMfq2JX9KXi6k11VhPBeUwnVzbQ491meUWj7DqHSg39Xysva
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(2616005)(186003)(6512007)(26005)(1076003)(6506007)(83380400001)(8936002)(6666004)(38100700002)(5660300002)(6486002)(66556008)(66476007)(8676002)(4326008)(52116002)(38350700002)(6916009)(66946007)(41300700001)(2906002)(478600001)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r582WB3UeEYYEjVkJzH5ldN2+hGPNaPF842iU3tdZJ4rGE3JA8caIdoAVtFg?=
 =?us-ascii?Q?pi4c3a1hKGDU3jle2LFeZo070nDzIPz8hR4ZNGxvh35z99XuuDBp+tM3sTb1?=
 =?us-ascii?Q?rMxRqGMn9gso3XK75E4na1cvRXIGKZR7Sb4w/BR40Lw7aeaOV2g0BXX+ueRz?=
 =?us-ascii?Q?Ke4/mdj0XouIafBUAyiBzd1u+lssXCX85L71wTpPUo10J32dxu2JoFkSurW5?=
 =?us-ascii?Q?652Qknd7Y3VFrPQL6Kx7ccs8npQeo5Sp8w5fFLuzvIE7KmwP2nyvNNLszY7Y?=
 =?us-ascii?Q?kgjxrTmuI5uUlDmDN+8NflM0gd5I53voTRfNKem18uFCJw/hcL/TLYjA+ngB?=
 =?us-ascii?Q?qv3k5xIpPubQdwofRgFYZQbTwkTtbKd/sFRK9x0yMtpOUDakJInIeWYlIkHY?=
 =?us-ascii?Q?gTmxn3C68lfQb8u3/WFeWAinYM3Irtbbi92mcbfl+keYszrP30IPGINuDTzD?=
 =?us-ascii?Q?cLFuMwb7zH0ofiir0HiGp+Z/boWmPNWQT07WlaC3B5+ejt+HLULw+DpSC2zR?=
 =?us-ascii?Q?2npeZ123udwj1yKTjmxihhNNTxM3zu5Lwca22SDJBV/vGi+8lpU0/BLymVSp?=
 =?us-ascii?Q?+WlYl+bWaLr8ONN6bqAejhhhpGvEVOywjUwEgUOTZQmIJcgfpdfSnRHqi3RJ?=
 =?us-ascii?Q?nr7X/ob+CsA725gPLga7vIuKgt4p5sDz5A5kLGUaxN92OK9GybUJJePMrWpc?=
 =?us-ascii?Q?hfocM/5YUOPkRP8cSFWv0Tdw6nhbI9T3hN7MpnECR4hdhOj7BJ+7I+RY1yOv?=
 =?us-ascii?Q?YEBgp17UlGzUx2rOyD8CBTQeH1+8x5cLYTI/XaMYRb1KT9JI3M+KyzpaMskK?=
 =?us-ascii?Q?uTZfon0VwBaVgm67XliDhPgOviwizikIqSsyUOEYuipkNn8vVPUQ0/145unB?=
 =?us-ascii?Q?gFSPGrLg9zIhi9hZJBKve5HegExCkgHVtSzfugc0ZZFQA0j/W9q+jJLeo4iy?=
 =?us-ascii?Q?1GiuU0bDtxXLdm3ppwQqFvHiXM27nn8XdQE5mI0VbWo6lbv8xyQ+VFMzPKj0?=
 =?us-ascii?Q?eYDyvCAyZxDqqNYLyfBa1xm8t/giNDXv9zykK8BRpYLWjD8O+SOdaCDrLV4W?=
 =?us-ascii?Q?I0G53B9N+kMHwCP6OoPAb61PtZzEjL/a96n1SQmTYSYprBCA1q5k9TFOwonm?=
 =?us-ascii?Q?QiLbTryJb3wk6PAyvglG58ZpYZVY2D2vMZtEZ/l6Af65N1Lmhuz8mi1RzgVD?=
 =?us-ascii?Q?U/q1FFmv+NHL/CJBjRHEKHYmDU+wHp2ARXA9oilCWx5phCt3vAeAKCatcD/E?=
 =?us-ascii?Q?IA90UZREscxI8rQB5z3TJ3fRHUeOU6Asf0UZH9fFjrimhCwXaOaflNhlByTG?=
 =?us-ascii?Q?jK3fiRgvrypM0cjWdEs+/oz83krr/ErqY3JU2NiY7JMGtWnlpo5pHYS3lk9K?=
 =?us-ascii?Q?cWpK8zlF1jtM2UycB9m0odgrCZPT5iIXFujaBZJPmU2CsRAXWAbEjNUkLTTS?=
 =?us-ascii?Q?LzasHUouR9xA6TYjWXZI8LdJuSqgh4n7y9Fy6k3UujrUxnSfYW8OH0u8scim?=
 =?us-ascii?Q?T7PYNj1dhrrdjZP+hcOXKa2BCQqSGgpSLWqyhpJuL2ioR6N80HS84A13nOMj?=
 =?us-ascii?Q?1YOgF9SAeAcA/vaiY16TJ7+Sd8oRbEPn6VyN4q2QDtWGejPgzPQ8PZ8epc5S?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc591c29-5634-4b82-4ae7-08db23c40a10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 13:08:29.4490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t256aXf0uQkd9l/UPMtc60fxJZg2d06NPf7xIDGTkzA+9pHj6XwKq3IXpREbJaPUBHsTHaC94Y5Ic6h0nrhR+OG8l1SwkdIv22y1mM89M3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added support for parsing the ARM generic timer interrupts DT
node by the "interrupt-names" property, if it is available.

If not available, the usual parsing based on the expected
IRQ order is performed.

Also treated returning 0 as an error case for the
platform_get_irq() calls, since it is not a valid PPI ID and
treating it as a valid case would only cause Xen to BUG() later,
when trying to reserve vIRQ being SGI.

Added the "hyp-virt" PPI to the timer PPI list, even
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
index 433d7be909..0b482d7db3 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -149,15 +149,33 @@ static void __init init_dt_xen_time(void)
 {
     int res;
     unsigned int i;
+    bool has_names;
+    static const char * const timer_irq_names[MAX_TIMER_PPI] __initconst = {
+        [TIMER_PHYS_SECURE_PPI] = "sec-phys",
+        [TIMER_PHYS_NONSECURE_PPI] = "phys",
+        [TIMER_VIRT_PPI] = "virt",
+        [TIMER_HYP_PPI] = "hyp-phys",
+        [TIMER_HYP_VIRT_PPI] = "hyp-virt",
+    };
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
+        /*
+         * Do not panic if "hyp-virt" PPI is not found, since it's not
+         * currently used.
+         */
+        else if ( i != TIMER_HYP_VIRT_PPI )
             panic("Timer: Unable to retrieve IRQ %u from the device tree\n", i);
-        timer_irq[i] = res;
     }
 }
 
-- 
2.35.1


