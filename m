Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086A8561CB4
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358515.587790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ums-0004x6-E7; Thu, 30 Jun 2022 14:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358515.587790; Thu, 30 Jun 2022 14:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ums-0004nh-6E; Thu, 30 Jun 2022 14:04:54 +0000
Received: by outflank-mailman (input) for mailman id 358515;
 Thu, 30 Jun 2022 14:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IH8=XF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1o6umL-0004O6-5X
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:04:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845c74a2-f87d-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 16:04:12 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 14:04:18 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:04:18 +0000
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
X-Inumbo-ID: 845c74a2-f87d-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaNeOhHqZRiDSLBjIYipfklZW9Ie3cfyB6qlqKLAY9+osIwNHCX2Z4oV6garVDFhCFPTZDj9Jc8/bBI3F4JhMwB9QVg/LjHaA06d+/gw2Pl/UlyKemZfw8O2EKruZGpH+oUVhIyWZCA0mxVGdn9nPqnu+b0P3Rx6+PvsQ3gA4ve3oDVj2bASEReS9W/lHB1IUihBAkM9tS3J1v2u41U8mJIyMaV69LySbl3BWiQeGS2Ww0ns6NdudVumlR454V61FW4wc9oicKlgSp698atFQntRKlyg2/9r8SPwuVGgmL7DO9FQmwEBq/AbVfzkUbYVNOOZwHfar0Dl6eOWlncifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEOir/TcWxDepJgogJp+rLWOzXH0RRWLH/R0bAwSxes=;
 b=Y3Gd2hQrS94vwh16oJ2N70W43LWmaZtdvJKE2Zt2VcuxgbRYqMxnzMu0TSdDgPoUshpeRFDTp1fWXCll9q2BwXXwyVk03PPQ6Cu/Z4ucfbEgQZNJBMQ+Bw0HKSi9qcFKdffbDtDBoHn5cIjmhHtkygrGytwYwm7fj/Z9CJ1rtcFJ15nVr+oCeNVMprMZXXkCgOyYvMyNISLOtC+M36qNO8mOxUn2wqYszwkF1udHbPw6t1iBLmLYzaI6AepV+FH1FMpqvGbfzw98amyrLPTw13fafU3CrBn4Wk88Tmm3ZujTZEs1oXm3K+Fw5TYsix74/ALQuGK+Pp5paGE3k8Eh7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEOir/TcWxDepJgogJp+rLWOzXH0RRWLH/R0bAwSxes=;
 b=Z4ij3h4QhH+o8FEfpit/cKJUDNqRo4BGo6jBHrPyoDNLC6on4wf1xChSgB7itEzIvKd9uLcFIvWP+26hflWlmB+4UEyl3q5mMaaNUc0E9wstB/kaL7bwKsN6jSMqp3+4QAzXQ9Uz1roOo1Hcv5jLBNZ4ClD6Wn2FIcmuSFx4qGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v2 4/4] uboot-script-gen: Enable not adding boot command to script
Date: Thu, 30 Jun 2022 17:00:29 +0300
Message-Id: <20220630140028.3227385-5-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com>
References: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0089.eurprd03.prod.outlook.com
 (2603:10a6:208:69::30) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91ed6371-c465-42ee-1f5a-08da5aa16c93
X-MS-TrafficTypeDiagnostic: DU0PR04MB9322:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2R0yvQkVV0ZbmP+qQBWaoy+eo1ecg8F5/ZC0MyL1ZxXepCy83RY8kHeCzfOSoQR52FNG+xrOJH3ls4Adbnq8GYOGXJN1+DkvK689YcJSbzGkfbvvpxrFhg6oYqWnWhBKe/0L/+C+OfH9S7ycSK2BHClF5pxACUeljsI3JgVc6duED8+upYjopZfJ7KiZ/KsVCgMzVHwDBbxM6cMNRudm73qrv8SCyzpIkl2paCPNMhea44pivSRFfMA03c39VJKB2PL+zYWKCkZ2EC9PSJ5xxpOBW2i1R7Y0f8VRfcivwhNfuQQ+ynivlqPVF1x8r69skFcOWZX72iEAFf3wbZJomta0H/KbenL3YezO1BcUmo/6J//E8beFlpAl1k4sz1df2Ewa+pjIZizdiVzUACenrVcjKVPp9/EmwlUlE0erhzQh3rm6o57xSi22aiZEwoPL3Bq08qFB5w+cZnCKV0xkIvycc+YoAh0UgQsO9he9VVJlEaUEMRNK9//w9wNAkqWNo22LRyyBjbpCImNcuJiEED778/uyAAO5j1yrBbx+Ov7/RrUy/DJFwsNsRNOi6vLai5M/j+BfpZRY3BGY0UxSP9u78YWMU4IxkTxIaOpxeiS3VXL/x5UQBRrSDOTWmuaLTXDAe+wpDGMsALhbQ7KqettF2OprRgZskZqZsEXGRaxlzRcMtgz/oSZ95SNFpwnPDAe85vHR2RnSsvAKPToDp4sAyx6+SFaO34gwz6nM06U7Nzjuvs3Fh0VVZYMdz919h+Pqp1a+MIXIMgYz+cH6y2kSasO7mHQ9xBd/uCmO7Y/jCcY6PUdKQ0BDDZveI9x9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(478600001)(41300700001)(5660300002)(6666004)(186003)(6486002)(6512007)(52116002)(1076003)(86362001)(26005)(8936002)(2906002)(2616005)(66946007)(4326008)(38100700002)(8676002)(6506007)(316002)(66476007)(66556008)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LsaCxl+YMIsKgAg1h9c7B4CTIvi+WIDV/juo2j+mf04+HNBfGNa75fFtUkAa?=
 =?us-ascii?Q?DadxhNl+NTWCNRPX1trj8/VIQRypK38xVKtcrDnJI2I9bydO9veYf7XtvT8C?=
 =?us-ascii?Q?a9jgs/vtXS5o8V9lGUcM85H0h4U2FCCdmjHJ5AihbtIqviRxXICppYyqP0XE?=
 =?us-ascii?Q?anWu921kndKGTXFOIkDBxW3YT7csh7OiTxltvjVHksR8NuDPhPoAnmqwatVD?=
 =?us-ascii?Q?0D9sjJy+qjLCBjbWl/QUshgQc79kGYO9S1Fl11fjEDaGPTKCw0fnsL5h9Oxv?=
 =?us-ascii?Q?e3M+pb6HewoP2m89fb3YOwulmSDLHvlBgKU6fL8J/nM2TTXbuL7X0BckCrbz?=
 =?us-ascii?Q?ReT5isJqfs1bj/KvqPHqYkt4DtPuzBb20itLXyjb4P0b+8d64c4Pb1iBK/yk?=
 =?us-ascii?Q?F1pu1hqxf+en04Vv5BTNrf7wU14Wo5FGOtxyJeb4SKxX4QWvApHfqFCr8V/4?=
 =?us-ascii?Q?aJTXsg628vMokulEsUfSXnaCwgDNwMlnbu7/tXLfV1VM/oIpkWzdTt4KwhgA?=
 =?us-ascii?Q?gvEKRLHHzMlHp/niiicZUB2Hq1LUlAiSXedvuRvGFJPj8NBtq+LzU+qTUhq6?=
 =?us-ascii?Q?xgLqcm5g9uh6YVzvoevNyz+v7aTbH7EvvStrdKy7nZ3x0YU00K5q78K/BYI+?=
 =?us-ascii?Q?s0nxgnBTNF6MXdb6CiKLf4q8tZkwjUfdsE73NT1klGTxru6ESujv1/0I7Uvl?=
 =?us-ascii?Q?IYa3HPm/GmVJB1A6mppbWo1L6MEnhnGUlcI9gmTPwALGx0S7AseSGl0mMhWl?=
 =?us-ascii?Q?sOasHUrTz0MTmGV2/qmiua3PdwFhy5F+j6xHjh05SNWj85CA2gAhQCJARV9n?=
 =?us-ascii?Q?1eDFV2SYd0BKLqjpXhjlHDoMxtHGJgFJKEz+UvPc4UAyC/wEnxbFgSklVZ8K?=
 =?us-ascii?Q?I5fsg+31uwqhkab26yLtUIQNpgH+JH8HD+mGSaaf40JKEG7pt4PNkEWbpi0c?=
 =?us-ascii?Q?cgt04z3CAKGyhb80KVkGrdGEgZYWTbmSHj9nb7eZ7cUHU2Xdre4WjQoOUAug?=
 =?us-ascii?Q?zr+/0p6dWBDisnCxB2kI2ll9MIaJRjfUWXMsMVh8Zx+CJIEetS5rC+p3dKRo?=
 =?us-ascii?Q?V66HOoDKQnjdDswXMHbudbfLkHCj/4+E5jfAGlCJIMeHG7OpoafHe24QfmGk?=
 =?us-ascii?Q?yRr/IMSDMTEDf2ZTNNsHqFoEJv0Gl6YPi+M5J327UKJq9woP1BD0U0Q7oQ/c?=
 =?us-ascii?Q?Kg5d8ptlzoqpekqc+cOKQcI8GgoZ6aUI3k5HlVwO1dwgxn9v1qszJntJhfji?=
 =?us-ascii?Q?J2E6k4pm2MN7Icq8mlhEmiggKDwAzy7F9ERHXX9ueJ7rW1KsYRtvesHu+CNv?=
 =?us-ascii?Q?0+6PXy6SXr4zulaUqrpiuVVyR7sCdztZ1bgh7v/qj41Zcf5OlDZbsxtFxAy+?=
 =?us-ascii?Q?BMSF4cBxIgzf5VZZA5HDRH7RTvc7+m0OeK5iMKYD76J0S3Eu4QUCtyI7mWJk?=
 =?us-ascii?Q?7l1hwkS5ey2iEgP7ikmFT5dVES+6RJwHAjCqEzSH7ffBkWUCO8LIz54rmYtK?=
 =?us-ascii?Q?EfqWM1fIhchUm4PVbaoPJDCH67NqMyFU/YEmD4mj6LHpr01/3rjuPx5rSCDJ?=
 =?us-ascii?Q?XSAQ+sjGWfz2dFSBLl50rGoNsLuIPjlWbT8KHtw0X1bdONFULNvIw6GHUMWP?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ed6371-c465-42ee-1f5a-08da5aa16c93
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 14:04:18.5412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5vxLpA8FjH1rw/tAW8CEsO+tDdQA1nyED8JOKEL42MJf7Nfu/7+s7bZfFo4Mi52c0QS64OJH5O5P263s4OJBwADWDPF1LdIGluXou/pYos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

If the "BOOT_CMD" variable is set to "none" inside the config
file, the boot command (i.e. "booti") will not by added to the
generated script, to allow the user to customize the u-boot env
or the device-tree after executing the script commands and before
actually booting.

Added commands to store the addresses where the Xen image and
device-tree file are loaded, in 'host_kernel_addr' and 'host_fdt_addr'
variables, if the boot command is skipped and the "-s" parameter is
not used.

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
index cb15ca5..b1a9b9d 100644
--- a/README.md
+++ b/README.md
@@ -80,7 +80,10 @@ Where:
 
 - BOOT_CMD specifies the u-boot command used to boot the binaries.
   By default, it is 'booti'. The acceptable values are 'booti', 'bootm'
-  and 'bootefi'.
+  and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
+  added to the boot script, and the addresses for the Xen binary and the
+  DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
+  env variables respectively, to be used manually when booting.
 
 - DEVICE_TREE specifies the DTB file to load.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 444c65a..994369c 100755
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
@@ -1255,9 +1255,19 @@ echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
 
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


