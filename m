Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7E561CB2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358513.587782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004nI-WF; Thu, 30 Jun 2022 14:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358513.587782; Thu, 30 Jun 2022 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004fP-RW; Thu, 30 Jun 2022 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 358513;
 Thu, 30 Jun 2022 14:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IH8=XF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1o6umK-0004O6-9U
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:04:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8398080f-f87d-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 16:04:10 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 14:04:16 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:04:16 +0000
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
X-Inumbo-ID: 8398080f-f87d-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N28HQzeyfEkoXNgIyh6g3bG4X1wzaLamMZwAcohnVXQ76Q/PKm2TxVyE8p9EpQPr3hhSudVf2+RWX9J1U7cZ96DSdVO21i5R8Jc19xbTBGZvmaTL4qJK/pbNMC1YfxyDHTKDdCyNsqu5oWpqp8OeWNz33V5b0L+olVnT+3o0eHc1DrP2aGopaU2NzL6DA9xmq7QAYTcLLPWho/QU6gaZmBdsDhHZfMolcIywrZefEGbqsAzGbv69NaWZBLzgQRDhixk/HpKWZRZUc8xndf1L+KsX6L3LKaoi/7bKLJbCmlrZF1l7GSdkHzJz9ARXi7p0O//TRFAeYV4DbZshQAhgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slRq7QSM4ixKn2x0tNbd2VGZDBfK2EupasNiNNU+x2c=;
 b=nkBLdNbmNoyQ3V0LM2eNHDA8otlqnWNCEGLxyU09082a7HtXThmCqyQTilYT+WarAbuJbupVsN1yqDGSeg83bvJAinKmxm1XeIkJgp9Gv4buU4EMWFMANG8bHNiodEPpU3nJZT7oUPAKaqzFQ63dlbJbqm3bZkYpuaCQtQ2ZI2VU3zHaRZx9ffW69VbL1EXR4xb4sK9h3pJ+4nMxcLAATF3+OF3Iu+84eTIhyCJYSyoL9rUW4V38hgQV/rqB0zHUVQQFXCn+0i7uD5o7qBRwRVeDg2QxuA6UJ5dv8xQNX6hgMmUy5VGRHSwnRXsCsWuTcXvZ5vDOj0XGeLBR/eqTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slRq7QSM4ixKn2x0tNbd2VGZDBfK2EupasNiNNU+x2c=;
 b=KqRcy4Z6BEh5Ei+OsiD3dQNyV5WK6l2weeqhYIlP4UknJm5B1EF5KFj3mwvj30nSkBg4fRGl20g5BQdsRVXWa/fuEOdcy7HaTRt+99SATXSA/V8BkHQwgzPPxioGLQokrzsLelZyfVCt1aY4OU7a8R7Vg2nVTmz3D29SsCymI5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v2 3/4] uboot-script-gen: Enable appending extra commands to boot script
Date: Thu, 30 Jun 2022 17:00:28 +0300
Message-Id: <20220630140028.3227385-4-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3acbee7f-13ba-46e9-6d00-08da5aa16b77
X-MS-TrafficTypeDiagnostic: DU0PR04MB9322:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8hu0YU/b5vU/Au3Dw7O9H3DsUtx/yMPpoUQUu7/TS2HaVc6vxDmJVL2EbGtmNSglIRVSTJmr4WfBp8KbpOYuFs7SmHJ7J3EeDzxFnHxcOcaVW3QVBKltR9fvH0JHaErKhRpIYJU/7voixjiTZhr5b7gWM58OkTQd2uXznnt7bYAEAxAbl3qkRxJZA9GxOsX5biCKWn6RbpQUBLSZBJ5ABa6KiUwj6kqcEA18wppzAWT+l7E9GYJls9+nRLmQH6+albhqB4vE1bEE7JSUvIeaSPQVOk7Ydj/qJRgzzQ4Y4w4+LfkqMIhtrHc3wu0lkKlq35t8I/s3u7dpYJHT3FrkqiSHGJsmSDC1B5I6em2eLQZKj4E/cDRqFRQTSP7eKCDYfOjHkfaXq5i8tP+bWvVcOXOuDZenil25vLW5q7NYffBVrH5Y00ANE9vd5HbQ28ALfblZTPyKAzp/wHT7lOfP+m/GBQrDw+Zx3FSbtVb72S0KLb/AWGWeHfxz1EiDPES1X+CuNbrDpCDzQ68TqYOpDj1oc6RkLrZHXWy/WXYqOwlcrC0Wr0YbMxTfoK31gav4TCT+91TZKE6aPbk3aoUSxFsUzhMdAT8T+jbRUUCOJ3nf4kTiAmZqjCS+mipVlPNa9LdqkK4g7SmxJl2on3cm+D4MktG65DjuzDrnnHY2XQUNMO0ktLVlaBXhfsI2MlE06HGoph+bJVLnrY/5JZWX5SJuFF6uUFU6/5PNM5Vikayba2jh95V/NC21B2zIWz7hQzQxK1lGMNe3AIGyO2VCOzXRSEFYf7wCQ8kl7mvFWvmhaj4w1Lkg4c23pLy20TZ2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(478600001)(41300700001)(5660300002)(6666004)(186003)(6486002)(6512007)(52116002)(1076003)(86362001)(26005)(8936002)(2906002)(2616005)(66946007)(4326008)(38100700002)(8676002)(6506007)(316002)(66476007)(66556008)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tOqvql/MD4ejQ4kO7mo54xgh9ZR7tORA7n1HzA+7Kjzk+vWBcQopMhSvOPsZ?=
 =?us-ascii?Q?2Q1Atdo/vQx2ZXhBRwoTMKRN/KPtuRaE+LPnJc8qI9UcsJkT17WBeuJ2tf2f?=
 =?us-ascii?Q?YxUt46KlEHTeTfFvFKmSBNyeBB1VRSvZbscHdReKMBw9Zm6e6bqhuFZitFeN?=
 =?us-ascii?Q?FfoSSekMwY4qx9MbAv8U7UZGz86ZHdUc2XjBD60ixXKpoQtksxp39JLZ/qkO?=
 =?us-ascii?Q?Y78dYOeet4Oalyu+kIcI8K2M2ZdKY98eevpMc7q9z8UIsfPUHmbcrzlBqSTQ?=
 =?us-ascii?Q?mBOP6odYYJNURjsUBhw5KQi8rEDDG/R1aaVcWNdOMAsr1x8r8gjBZkD1cUxO?=
 =?us-ascii?Q?LWu/UTW5BkmJ0qVEvpROO12/D5pT3WSA1DyjLYpxRIBk3Ykkmq7wYbqs42sU?=
 =?us-ascii?Q?kj2VdYgQbyJ7fhfkKi/CrNSo29czF0Qi1p7+kuOO/gyimlolicrvg2f0LR/4?=
 =?us-ascii?Q?8EGh/UX4VTH/AD2O9BxOl/MZqvTqJ6G0rfphuCvc477kVGWTZiuvcus4slLT?=
 =?us-ascii?Q?yUWGGRQigviByUI61GwQvRMyxWT7BF4EkG1ia+FnsdzRNh2/75WkOfCRWX1w?=
 =?us-ascii?Q?tP7fzl7YZHeTGBntZIW0W1rDiGk/z7GPIRTPqD+ctg//7pUZS73f1ZAJFgl/?=
 =?us-ascii?Q?Q1Ycr+ZHHtxaWdMd91ceq4c5vbgtwTQg9Jee8KRC7W3lJsk2cnqIYIR8P8mW?=
 =?us-ascii?Q?4kP+qABetjiltYOL7Vp1bLp3PmuHJq7YzoDp6n/23PbjVJ0+zQZhwpsUsdvN?=
 =?us-ascii?Q?wh7rlNVoELA3KRZWIIk9b+MyMB4KTyIJ7BOvFgPhv1V7Qk/GtFCKCxllLeJI?=
 =?us-ascii?Q?u55eDP9o33NjKC0Sucj9XNa64RygyesoHCwkhiW94Uot4apJVXo9cNMUReyq?=
 =?us-ascii?Q?YH4FiZGnQ/yYIvXT1KNtgQ0eKFt+GjSN4UKbLGbAlDn2jMucVF6CnMXH40E5?=
 =?us-ascii?Q?D4FVN8QZI1BKElWA4bKDKlEvfTAhQlOQ+99wYE05Unnn+Fml0ecAq32nArRf?=
 =?us-ascii?Q?HVocK0IwCp7URTYd63syUs0Yy1gHC3JSB6dqZcysEeCYgSPFNrTQAXhjR8tJ?=
 =?us-ascii?Q?Vv/NSCr6MobaI4iXVAcVXY8Iescot7ETM2WhMOkF5Ml4nAJYRdRrbW0tB07U?=
 =?us-ascii?Q?GVy59pDLrusq0HE1iRQzHHvGhdXKoYR4FOAVXdkvtAA8DkEtrWRzREdOAArm?=
 =?us-ascii?Q?s7DkXhNaKZmyxYH28v9Uw3HFQH4fKsIjapJV2kQTBrB07oZhd47z7Ynms4lk?=
 =?us-ascii?Q?oQY8zwaZ0TIhxDbVifU0Z+Sh45TgRJ6YcMeYgQpGARJNomLanWGs4/musL2b?=
 =?us-ascii?Q?htyfN3nP6dtyiTOHApCc7YEbHe50mqUHPgyiS/csu4XoiEkx8rzOiwWINa/c?=
 =?us-ascii?Q?slZoAvogKBRAJn57VQsONeRNFLSIOfrUoHtPZbcnWmw3REtmzQzXjXi4qo8o?=
 =?us-ascii?Q?iSfYMjKtgi82ATihtxPzFx4qyz615f8O0OQ6mSE1ViGorerg3i+2yFduFc3c?=
 =?us-ascii?Q?lhBDbOu+VyjZWph1azu2mTh8eRFBwjvfKTaiyYc81IAL7xLpaWrwbNphCmo8?=
 =?us-ascii?Q?qhk5g4D7CZC4boemWWwoKbmE5FIRK8Bk8CprNJ0yZY4Q0xvPgUCDsb5AKoTS?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acbee7f-13ba-46e9-6d00-08da5aa16b77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 14:04:16.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ACarorNNtrjb3ap2HLw+RmQDTul/TZbMMNGeyHQS2j8KwlE5RZR9ONyJ5qxnsTPJbo2nOui4rgbjN1cEZcDyVWi1PApoNKHu/guKoTyyfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added the "-a" parameter which stands for APPEND_EXTRA_CMDS option,
which enables the user to specify the path to a text file that contains,
on each line, u-boot commands that will be added to the generated script as
"fixups", before the boot command.

The file specified via the "-a" parameter will be copied as-is in the
generated script.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 scripts/uboot-script-gen | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f8d2fb0..444c65a 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -416,6 +416,10 @@ function check_file_type()
     elif [ "$type" = "Device Tree Blob" ]
     then
         type="Device Tree Blob\|data"
+
+    elif [ "$type" = "text" ]
+    then
+        type="ASCII text"
     fi
 
     file -L $filename | grep "$type" &> /dev/null
@@ -973,7 +977,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s] [-a APPEND_EXTRA_CMDS]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -991,6 +995,7 @@ function print_help
     echo "	-f - enable generating a FIT image"
     echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
     echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
+    echo "	APPEND_EXTRA_CMDS - absolute path to file containing extra u-boot cmds (fixups) to be run before booting"
     echo "	-h - prints out the help message and exits "
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
@@ -998,7 +1003,7 @@ function print_help
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:fp:s" opt; do
+while getopts ":c:t:d:ho:k:u:fp:sa:" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -1043,6 +1048,9 @@ while getopts ":c:t:d:ho:k:u:fp:s" opt; do
     s )
         dynamic_loading_opt=y
         ;;
+    a )
+        extra_cmds_file=$OPTARG
+        ;;
     h )
         print_help
         exit 0
@@ -1235,6 +1243,13 @@ load_file $DEVICE_TREE "host_fdt"
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
+# append extra u-boot commands (fixups) to script before boot command
+if test "$extra_cmds_file"
+then
+    check_file_type "$extra_cmds_file" "text"
+    cat $extra_cmds_file >> $UBOOT_SOURCE
+fi
+
 # disable device tree reloation
 echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
 
-- 
2.35.1


