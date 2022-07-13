Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56C573B46
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366876.597823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGk-0003w6-0p; Wed, 13 Jul 2022 16:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366876.597823; Wed, 13 Jul 2022 16:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGj-0003tR-Tn; Wed, 13 Jul 2022 16:31:21 +0000
Received: by outflank-mailman (input) for mailman id 366876;
 Wed, 13 Jul 2022 16:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9THP=XS=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oBfGh-00035D-WD
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:31:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2068.outbound.protection.outlook.com [40.107.104.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 390a49aa-02c9-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 18:31:19 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 16:31:17 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:31:17 +0000
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
X-Inumbo-ID: 390a49aa-02c9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAjRY1aKk49WIgUCzjN5b31/IZaXOTKvzbgaAXnXoBkC/IqTbCcvjubhofKh0YdmRMljEA0ZPvvO+fPum++5Gt43ajl9Xe99eiPk+XRSPpEzqZMIlHRZkB92ecHsldMviPf30FpFk+TS8Pdmvleu4ARcjvguvf6Jg1M6w2EuG1hWH/TxdoXs67PQtX2ECnbHsGOUcEFru/KthMuIPFJhocxutIa2V+AHi2KISwtRH7j6pmWQ4Bj5k62IJXxIbv9XL/mZRjfX/H2Pe5oLo994LKdNEsa0RnOQWAK1O7wfxXZHQYW9QA/2h6CkMWlDct5Zd0lZCjpq1Fw8M7Amyb2jTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwKeDBebJwjIYx1Qo5KRUn+UFPyCgLpm22C/91nkWr4=;
 b=e9cYdKKXgnwoIR3Av1erPKvEdGXSkshryzcHBcfYeegALLH9btawuMkk0wbYIXEmtLzN7mwDIQYYaHGOsgMrHvHm6/WyvM6cq75imrCb1H3ZEQWlSA8VPE8wIjpub+mBwH5Sbg41fWEKR8D4jt38N/o5Q+NXqrAmMe6Q/zOw9OrgF0nDVmwy0x1O3z8KVEf+M1TYnGqPHvnT3lEGD5TufEIzYkigUx4euRw0WpCloKN3arkkzJFJBtOggGgK4b+AWJVWaOWPrl29zIFSAlYry51ibPWrFQoF5DE3zUszt1L3YUgYL480T05k2wFFJRe14e4dD8SDIbvAuxKGTWrAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwKeDBebJwjIYx1Qo5KRUn+UFPyCgLpm22C/91nkWr4=;
 b=XcMemcdtYKM6RIOzQefMhfarzQGBCgh3BTBFj1OenFQj6PLZZbW+8O+4HPidUjpKJMnFvhDttOCwqY6pZYPtKHbEjkRnRAbaXuNP7oKkUw1b8NHJ4g8VGg1ni8U76u0z6EClLqigOk8G6AP9DwHGsCM2c0Y0wwMeKciUvEYVUWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v3 3/3] uboot-script-gen: Enable not adding boot command to script
Date: Wed, 13 Jul 2022 19:30:44 +0300
Message-Id: <20220713163044.3541661-4-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com>
References: <20220713163044.3541661-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR08CA0022.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::35) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a5bd6a-79c7-4edc-b45b-08da64ed1c3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jXvn7kw9b3BAlgk70W448MiIJ1FF35LvFMhX5LMWEp7bEnpJOc5uiwMq5XPeCVyIl+7dcrmFlytKgkRoxElZ8YlJY3m9zj+q1woVyBnczV8HDDWEwCwTHm0HYeiWFFCIlOfsH0zxQ4OzGo5hg3Q0n4drfhDb1yBnCttIDHq3unwtrXnelESyk5YR6RgY+AU8sEnytPNIOUcvHvNsZrPd70bWuMpu16ejVL6ZlK+MaUDsU1CtiDQNMa59xYUhldJ8caRUqa2mtQB19kCO9dQS0wKbIr+uj1HUP0pNgElQiw8m7aCarI2NHToqGGmFwrY1v4wS65nn08Vbc9nWpcWtVoA6S60r8U5zeOoaC4Fq97Fq4gfTOhPJmg6RuH+NX2Mgw6Kd6bEhBBkBnh8wRYkvbdGZbyHU5+0CazU5xGe/P3WrvgZq8jO451M1dXXwH58eTt+y2ggbJzKqcUY64XBWcniMrZtGdJ7EleHeFrrjiJw3aCu8WYtRK8P3kLEJ5aQN4U8GMQwEnRWUGmCYm37BamelQc94L5JUo9dkpAiRO5+sPWhKbaPYBS3M6c8gFNL32HNrYgqhzzhd1HpPoIycbvNq/l1eDFaWfJtNBQwoRkr9gNegg6VV/7C9tgvHdtZpxDw1q97yPBkatjBI9Ao670V06yutYEwPeR3+LiQqd6ZgvWwjDjP70X2hH580ql3pC+94PtaTFNrGuFm+fykQ/NH7DYN16swvlmEYDl32380lVZnuD8v5NcMg7e1z62RBM93unjKeWbu3r3nSlR7qLQkwY+1t4U68cqSDlwv6r6urYGPmQhM+jTQkk5TIGRRH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(83380400001)(86362001)(38350700002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(6666004)(41300700001)(6916009)(6506007)(316002)(52116002)(4326008)(66476007)(66556008)(8676002)(66946007)(186003)(6512007)(2906002)(2616005)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0YmgZcCCpqZiq7pxm2LR7EhPrSHzChZZfuj/Hrsz5gaQJI60RyLa0h4pPuGe?=
 =?us-ascii?Q?iS8hG3KQ2uY/gPR1vx1yXhnGa9oSBk080jKVGCg35o8/oW7MQGNrqfZiVyPm?=
 =?us-ascii?Q?Atl5ITez4N2igPFlx24T/ARuwKFTwHpGqAnUp2mA+bELpK229rOTT3Cd8+tP?=
 =?us-ascii?Q?7JurHNt9CJ9RZBM7Bwe/IHPuiXwCmBhHPzpYXZzviLWldiIBcpcH+Zd4Itnv?=
 =?us-ascii?Q?l7XK9Xk/fBEvO964UbtbHyIHrCaQjnOVH0URXJ6J+BWOF9biKdJaKxCz8g1f?=
 =?us-ascii?Q?R60gxeTP/QdZJfpFAHr6g2YDU/v5RNmwjnk/nv2tI8LEUUpcKckyfrfPjofk?=
 =?us-ascii?Q?BCCcai5ojSXGr7JwJz4U/R5J+SH9rlh5laV2h/gkND8MCXY3UUIrPf4VUnJx?=
 =?us-ascii?Q?v3ancvV7Sr81K+fcW5zKO5/t1wsyCaFKJTImgKcC/fZhPi8hM/pIFl/zmmYG?=
 =?us-ascii?Q?Q5GcKmst5Sxcc3TsAoTA2a3JyHTVZ21DlHQIXpDA0vkFohvRoY+ZZFXmIivj?=
 =?us-ascii?Q?F57FUG35rAo/0G6RK74tdWSun5M20laQQ3bhrXQNJKlJHhxiiJYv3l6tVmp8?=
 =?us-ascii?Q?LfnUiB6Ykiu+SFcrYtYyfK+b/jqSxEgUoTIWF9h59Sc1QNpLe46G6+PWOPhd?=
 =?us-ascii?Q?rVFW2AtpEjOJf/R+Mk8gGAee6IjvLaTv94Ryvnan4VK3PAAxSCouKScahGol?=
 =?us-ascii?Q?rB07PNXMh72RMzYn9mx2pvKu0uADwxFd1J4relI9eZeSI78+0uuG5L4eb7gE?=
 =?us-ascii?Q?OI/owmhG1Xk5s01EGNQAu7VEr1zXrcLGOuQRrt9NBsbi2S2bpx7+yNjsS7Jy?=
 =?us-ascii?Q?bCL32g083s1VJJSprsfOkjhQQcetC9TF1OZhEjV77Q4s1nG+LMPQr/8aggh/?=
 =?us-ascii?Q?K14kTp+OAZHHTDsMGa69D73CZliPKbcVXywm2fkMUQFM4rd8NlE8f8P4TJlR?=
 =?us-ascii?Q?ON6A9ZyHkyLpJE/gD2MGWjwG+yCLQAZ+s5+LcL58xRn12tg+ZwnrmpRPpD2p?=
 =?us-ascii?Q?K9ilitoFs7IGuXCXQlSIJ2NS6bKHac5XE6Vl/QUUgMo6NOhEwcqDqY5x/AjG?=
 =?us-ascii?Q?Rr2mmvEDJl3QG2J5dg2SDqQYpALC57eBRcednL8ubexBHkWPqflaThkoS0iE?=
 =?us-ascii?Q?pSnZZDtYQK37kDWJwb80CpmdK4bzmFfPSgD88nFhT684QBci7YBijHsaV8VQ?=
 =?us-ascii?Q?09t7dP3Ic3cG3Cq3H6TWIjRTolwoI3tw8GMUoV2bot+oyrwGJg316Un2+3Ql?=
 =?us-ascii?Q?h/m3fxtUkkqbY6QCIxk42L9+WleES/6vBqTGFx60W0drcbjElQlnYTDNzbzj?=
 =?us-ascii?Q?zJY+B4ZadDSuvZ3sBnShynQLaAw1h/ZiL/DkK+GziMrB8yVA3fNdVmpad9La?=
 =?us-ascii?Q?7vN294dS72h+Wo3Z4eR3TMilRevw2c9h4ss4qt2VeatezzamdCw9LZO1Py3/?=
 =?us-ascii?Q?coPmvs5LlgzWs+SDJOi1I63pb74WTiq/JMwHrASZTo98W/HeiN+2L4edeG/j?=
 =?us-ascii?Q?lKade289aoTMrZ50Hub2Mtfml1b27NbZDQhGgv6OaEMurnOUD+svs1JHLEnQ?=
 =?us-ascii?Q?RBF7uAZAHVqMxW4bFGGBiUFLcgFny29ZO/YG3a6hDIzEC7wERkIqHJo6peQ7?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a5bd6a-79c7-4edc-b45b-08da64ed1c3b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 16:31:17.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuGgE3vq74fc35QzRSq1CGbyOLhwc8k4vQqqEB0KJqmjPFTX1zJaVKDiEgoKyHFkzZQYSgrRJb36nuw/4WpwLbpAmRx37nnVe3F6SY2f5YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

If the "BOOT_CMD" variable is set to "none" inside the config
file, the boot command (i.e. "booti") will not by added to the
generated script, to allow the user to customize the u-boot env
or the device-tree after executing the script commands and before
actually booting.

Added commands to store the addresses where the Xen image and
device-tree file are loaded, in 'host_kernel_addr' and 'host_fdt_addr'
variables, if BOOTCMD = "none".

The `booti` command can then be executed as part of the 'bootcmd' variable
in u-boot, which should contain:
	1. fetching the generated u-boot script
	2. executing the script
	3. running `booti ${host_kernel_addr} - ${host_fdt_addr}` command

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 README.md                |  5 ++++-
 scripts/uboot-script-gen | 16 +++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 3566a6d..07ad432 100644
--- a/README.md
+++ b/README.md
@@ -81,7 +81,10 @@ Where:
 
 - BOOT_CMD specifies the u-boot command used to boot the binaries.
   By default, it is 'booti'. The acceptable values are 'booti', 'bootm'
-  and 'bootefi'.
+  and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
+  added to the boot script, and the addresses for the Xen binary and the
+  DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
+  env variables respectively, to be used manually when booting.
 
 - DEVICE_TREE specifies the DTB file to load.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f72551a..6a8a2b8 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -966,7 +966,7 @@ function check_depends()
 
 function check_boot_cmd()
 {
-    if ! [[ " bootm booti bootefi " =~ " ${BOOT_CMD}" ]]
+    if ! [[ " bootm booti bootefi none " =~ " ${BOOT_CMD}" ]]
     then
         echo "\"BOOT_CMD=$BOOT_CMD\" is not valid"
         exit 1
@@ -1251,9 +1251,19 @@ fi
 
 if test "$dynamic_loading_opt"
 then
-    echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
+    if [ "$BOOT_CMD" != "none" ]
+    then
+        echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
+    fi
 else
-    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
+    if [ "$BOOT_CMD" != "none" ]
+    then
+        echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
+    else
+        # skip boot command but store load addresses to be used later
+        echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
+        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    fi
 fi
 
 if test "$FIT"
-- 
2.35.1


