Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC760561CB3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358511.587769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004Zt-CX; Thu, 30 Jun 2022 14:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358511.587769; Thu, 30 Jun 2022 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004UL-8z; Thu, 30 Jun 2022 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 358511;
 Thu, 30 Jun 2022 14:04:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IH8=XF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1o6umJ-0004O6-3c
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:04:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 821adbf6-f87d-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 16:04:08 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 14:04:14 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:04:13 +0000
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
X-Inumbo-ID: 821adbf6-f87d-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXY1k/P0bk3m/GfBSMjWRH/ulnetKmgn6JNt09emUVtWhvCIDRzeOG6JjBVuQRWJ09l2t24WvRmzC35k2VlcOUfN21SyrHOkeZyBb+jy1PqhN0xcj6/37merMNIV+Q6ChDuo7cYzz41W5iPUhPJ8voMXymuIQ/9ki7lEa2bmqSJmLDnv5eccTSQZikjvYHDOFY8TJd7L3llcKEKsYC8DK99G18z+wtUsb0yKILxjmSP1U0/XjvKDnIPx9NGTO81Qm9T1yTJ4/MnCVi1A0Mm2e7NSd2cnoZYFENFtEs0jh1319cKecuO1CFeDVFlWGD/w2auZbHWrBIkLBNAht8y8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7giP8A1iOXK4r5YaK7UVvP9/j+xU4cgR7sxpc6z2ONI=;
 b=GieAOesNy7rYgjEKVCPDOMjUvJJGdkNuuuwBavfMGjHZmzQBdcD2CU/caecYoLhwNgwcNdXPxI/1TQuPOm22vIEZfgMegA+prtPy/Z2M8TZvBXsi2BnH2vouskn/SVmBX9ikYuMU6ndd7VMQTu7EVYqFYmwpNLzx+gpg2+g10pZONnn6+qVQN3r0fCdycrEGCaVTNHZH+TZYyppr3cblXOTVxBcUkyZKHxaDFN1kIfmj00BivrFSqrGecYo8k5BcydqU2YluCIPAP5hu6nRPYeJ0ExtL9VanNVQc4mW0nQHz6tz1iyKjAMJ0eqowcJj7gzWqR8ewS0ATSMspRBogow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7giP8A1iOXK4r5YaK7UVvP9/j+xU4cgR7sxpc6z2ONI=;
 b=b3bKox2luCJh3uG9LYknIigWafyWSjOli0Y1SR+sOoYxuYYO4VE80EM4bW2FgjZA3SBpTSv8tmd8PNPpXL531DKapfJl2+HlUfcuxA9NSkMKgcPXH136zTsGKEL3RWAo0QCz+JiHfHca7yFvku/8Eidimf8yjPLy8d3glCKB6HE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v2 1/4] scripts: Add support for prepending path to file names
Date: Thu, 30 Jun 2022 17:00:26 +0300
Message-Id: <20220630140028.3227385-2-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 933f6104-b5ca-4a51-6275-08da5aa169be
X-MS-TrafficTypeDiagnostic: DU0PR04MB9322:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BdocNINpiOuxSxtoTht6KPhwqlNKePMkfJSIq6FOuxQaVDoFCP4nhhSeplKZyQBDHPKzePTYt8JSzFfsR1RcEAhHKerSto06RXCpgV0BcOl6YMOlEVCpDlvHaVD2e97+59Xs7AiFAgo1QCTWVLF7b2/DqzLbbLCIHUzZq6KkQ4zNAdrdKQuN689lSILZ1bewSKCSovQniv5N7HQDr2lj6cMXTfpWCT5YzhD/nJs5QUHioiLgdv41epBZhk/yIvcY0nnu+HzZVob/6E6qc9LlsAgxfeh7uipVoyY8zT9i+7Yr+HSTjvUK2W7g6U6LCVlJES3IBkuAIw92AQWBNr4oRj5iZ8YproCIr4lGCNqtFh1Wz2WmSSms5HS0XfmKPexBBrhzv8PcaILo2tKHdX4ENvLP27d4vklv0LW9fT802z1d1YJRfPZUJkRVvM7A3MUtNP1yGCzz3X6jZdAfTZJr2KOmfC8F+nyX5SH+jn69eeK8Pz92iuMvcKFH2x6wa1yRPF6rN65hVGZ9Fmxz4aQLGLdYQcYpgtOTC1XVCqwZC2DuzP6L81Eoy4btk7TGLag1mfu6aPXN4rPGa6Rykn0xCwm/WuheL5PERneR/NwQ4P4iIzT4qfEVBq14/pH5FqyM1Xzj0dCJ6wFUJPAzph2yk0ssQWTfjE2pe8tvBVDn+85EV1uQATR7vwbhCDEWnSH+sw1aV+Jq6bdk29uAVkyIrOItiCOjQflFe19yPAWE088dz+gq0xblpFUUdVosl9f3yxo9SIKbR/tS8CDHk1Gy15htYOiG1sUm/l/SocVqhKJG1k95jszzM2NEggVU+u9U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(478600001)(41300700001)(5660300002)(6666004)(186003)(6486002)(6512007)(52116002)(1076003)(86362001)(26005)(8936002)(2906002)(2616005)(66946007)(4326008)(38100700002)(8676002)(6506007)(316002)(66476007)(66556008)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6inGlVl0mxGbVn8w8PbvLkPDC4AUGE/pgfQHpesNPuYCCLAmpi29Cl0t/NQ?=
 =?us-ascii?Q?9BRCqJXQdNDdv3A4H2LtWzF5xAB168Kv/LXTXZ26XDitkWhJbB/tQ1Xck4zA?=
 =?us-ascii?Q?EOJvU9ijtrnP/ZuYHU4Sbjnkzz2DSsJ3R8pV/PMSNMfgrnuEEHraEK0Lb5jB?=
 =?us-ascii?Q?Xr16uPHmzT2RdEbmKcYzcAJWEaB4/Vbl2mGeWNOFggRkYQv5lTF1fyz37bOO?=
 =?us-ascii?Q?QMW4vl78MElFaxW6+DqBU/lhMQ8sQlCe8tcIZv3JS5mDtXYWRfQMPQNQ/cDl?=
 =?us-ascii?Q?8TxWSZE9Ss//ZFZsgf1GCkXJt2CTMjPy+hwvNl9cqCfycU4qlu3fulJ+ENet?=
 =?us-ascii?Q?HQAVNRApL+CH7WcSDu+d1pzUPFNRj0wqu50YU6cGXMP5KuGY6Gyq4vnvumti?=
 =?us-ascii?Q?FAme0Uus9injZihicHZNWMonB1RprOKiFkqcmdv9SOYz6NZLhlFSWxaP9Vpq?=
 =?us-ascii?Q?NEdGaOSBpzNFns+1Rq1dZI3n61karxUD0VuFjoaQAUc2c6kM943PMMEgv974?=
 =?us-ascii?Q?X/eATYref4q9X4mzdGCNEhpLi+tEZMG97rEy7BhvRL997LGg7//Ipyy+4gxl?=
 =?us-ascii?Q?KJLWBc0N9SGls7xtYQxkrTJPWK2E70WWmvSdMYDAcckU9YePq0lwARLkdeYG?=
 =?us-ascii?Q?mbhtc9SCf+nEx9SNkTkxt9powzvvoMpI6Cp9X083qrhtN8M/xfWG1YpF0PxK?=
 =?us-ascii?Q?Smp5i2SXfUsMFHqFaUCPPC8kmEGNEX3QST4+SLeHHt0k1U+n5fgrfG778yFD?=
 =?us-ascii?Q?Ag+JhCwtOb7cyW8JetoQmZnBebWWxkYutJBUUrshPLuvWEaPJkvcOaCmMwRa?=
 =?us-ascii?Q?uk/CNRxzj8DbmiRmo1XjYEJjvNv+kikR32akLjDrBQPqVmfd9C3iQmIsRhCs?=
 =?us-ascii?Q?iOAf4HFS1LQJ4tm+9juTOKDvyLmX2dKJXj6a0DriZPXu77e+/322ptosY0JY?=
 =?us-ascii?Q?OA8jBNbQgH67LwEjOMTe+8aM060GK9bWWHt/PeeG33Rw9IID6uujRvCwz7jY?=
 =?us-ascii?Q?ziiZf5KrgeMQAVXHwA8vdp9todO6BF+W8d9KvPrEBNYn6or8B64JqhmTxZsc?=
 =?us-ascii?Q?XfyWywGvAeYxFno+4PKWOH9PhePPrquFz9Reke1pTWWDf2oSP78YLGChElfT?=
 =?us-ascii?Q?Rk1ieXapFdw9bSN31QIOtkVWI1wF52naLgIdVYtGTeX7aEDoiJuKqeOuhkBE?=
 =?us-ascii?Q?nb0UhBxwlhjTxXDYbqYYkoBnO1D63wvFCYclT6ZRdRXl+u3zlCv2ulaEqe4s?=
 =?us-ascii?Q?XJj7XdFrPuNs2w/2I9dHLoe2OBYvfMZruBt9o3XDVnY1nt0u/riGjipA+NYL?=
 =?us-ascii?Q?fzdB15ProqVY9G2a9fcrB8ohtp+fuIoJUwQHhUmuItkthA9HOoMgqS0U+gN/?=
 =?us-ascii?Q?7U8wpzfXAWoGW/L/zV3vT8lZ4Hod1kNpIqZbCU3AUH14S98KWqa7OkvRg15w?=
 =?us-ascii?Q?MAk5Syzf4pGwN3lHi+8PlfD37Yg1s1ZgtuJwdsi79OUKzrgQ1GeOz9lRWwWP?=
 =?us-ascii?Q?s9XUz4tbesTk6WL2HTToEREiV/ypz+C26qTUORz+JgMw+v7aPB5JsyyUA59Y?=
 =?us-ascii?Q?FElrY4T8MJC+3r1P+BcDC9AFQyY0fRX22XtiixNp+Er4MgAm1A01iLDRs+Mg?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933f6104-b5ca-4a51-6275-08da5aa169be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 14:04:13.8853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk+Jo9wKlfQGj/dT1D9pz1hszik6zTfmW5Y20Lc2T+4qz7HCqHjB50M18gYJcUbIp8kFVcNJ4rbfvoTArrghYEZJhAvbAkOzzhO1YIdwfxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added support for prepending path to file names in the final generated
u-boot script, for the use-case where we have the files in a separate
folder that can be accessed with a given $LOAD_CMD.

For example, we can have "fatload mmc 0:2" as LOAD_CMD but the
files would need to be loaded from the /boot folder within the 2nd
partition, not from the root ("/"). By specifying the "-p <path>"
parameter when running the script, paths like "/boot" can be
automatically prepended to the generated u-boot commands used
to load the files in board's memory.

Also added the support to disk_image script, to enable generating
a FAT partition with the binaries deployed in a custom folder
within it, if the "-p" parameter is specified.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 scripts/disk_image       | 37 +++++++++++++++++++++++--------------
 scripts/uboot-script-gen | 12 ++++++++----
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/scripts/disk_image b/scripts/disk_image
index 12fb06b..97e798f 100755
--- a/scripts/disk_image
+++ b/scripts/disk_image
@@ -539,7 +539,7 @@ function write_rootfs()
 function print_help
 {
     echo "usage:"
-    echo "	$0 -c CONFIG_FILE -d UBOOT_DIRECTORY -t UBOOT_TYPE <-w WORK_DIRECTORY> <-s SLACK> <-a> -o IMG_FILE"
+    echo "	$0 -c CONFIG_FILE -d UBOOT_DIRECTORY -t UBOOT_TYPE <-w WORK_DIRECTORY> <-s SLACK> <-a> -o IMG_FILE <-p PREPEND_PATH>"
     echo "	$0 -h"
     echo "where:"
     echo "	-c CONFIG_FILE - configuration file"
@@ -553,6 +553,7 @@ function print_help
     echo "	-s SLACK - free MB to add to each partition, default 128"
     echo "	-a specifies that the size of IMG_FILE has to be aligned to the nearest power of two"
     echo "	-o IMG_FILE - the output img file "
+    echo "	-p PREPEND_PATH - path to be appended before file names to customize deploy location within rootfs"
     echo "Example:"
     echo "	$0 -c ../config -d ./build42 -w tmp -o disk.img"
 }
@@ -564,7 +565,7 @@ then
     exit 1
 fi
 
-while getopts ":w:d:c:t:s:o:ah" opt
+while getopts ":w:d:c:t:s:o:ahp:" opt
 do
     case ${opt} in
     t )
@@ -606,6 +607,9 @@ do
     a )
         ALIGN=1
         ;;
+    p )
+        PREPEND_PATH="$OPTARG"
+        ;;
     h )
         print_help
         exit 0
@@ -828,56 +832,61 @@ mount /dev/mapper/diskimage1 $DESTDIR/part/disk1
 
 # only copy over files that were counted for the partition size
 cd "$UBOOT_OUT"
-cp --parents "$DOM0_KERNEL" "${DESTDIR_ABS}/part/disk1/"
-cp --parents "$DEVICE_TREE" "${DESTDIR_ABS}/part/disk1/"
-cp --parents "$UBOOT_SCRIPT" "${DESTDIR_ABS}/part/disk1/"
+if [ -n "$PREPEND_PATH" ]
+then
+    mkdir -p "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
+fi
+
+cp --parents "$DOM0_KERNEL" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
+cp --parents "$DEVICE_TREE" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
+cp --parents "$UBOOT_SCRIPT" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
 
 if test "${DOM0_RAMDISK}"
 then
-    cp --parents "$DOM0_RAMDISK" "${DESTDIR_ABS}/part/disk1/"
+    cp --parents "$DOM0_RAMDISK" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
 fi
 if test "$NUM_DT_OVERLAY" && test "$NUM_DT_OVERLAY" -gt 0
 then
     i=0
     while test $i -lt "$NUM_DT_OVERLAY"
     do
-        cp --parents "${DT_OVERLAY[$i]}" "${DESTDIR_ABS}/part/disk1/"
+        cp --parents "${DT_OVERLAY[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
         i=$(( $i + 1 ))
     done
 fi
 if test "${UBOOT_SOURCE}"
 then
-    cp --parents "$UBOOT_SOURCE" "${DESTDIR_ABS}/part/disk1/"
+    cp --parents "$UBOOT_SOURCE" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
 fi
 if test "${XEN}"
 then
-    cp --parents "$XEN" "${DESTDIR_ABS}/part/disk1/"
+    cp --parents "$XEN" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
 fi
 if test "$NUM_BOOT_AUX_FILE" && test "$NUM_BOOT_AUX_FILE" -gt 0
 then
     i=0
     while test $i -lt "$NUM_BOOT_AUX_FILE"
     do
-        cp --parents "${BOOT_AUX_FILE[$i]}" "${DESTDIR_ABS}/part/disk1/"
+        cp --parents "${BOOT_AUX_FILE[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
         i=$(( $i + 1 ))
     done
 fi
 if test "${BITSTREAM}"
 then
-    cp --parents "$BITSTREAM" "${DESTDIR_ABS}/part/disk1/"
+    cp --parents "$BITSTREAM" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
 fi
 
 i=0
 while test $i -lt $NUM_DOMUS
 do
-    cp --parents "${DOMU_KERNEL[$i]}" "${DESTDIR_ABS}/part/disk1/"
+    cp --parents "${DOMU_KERNEL[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
     if test "${DOMU_RAMDISK[$i]}"
     then
-        cp --parents "${DOMU_RAMDISK[$i]}" "${DESTDIR_ABS}/part/disk1/"
+        cp --parents "${DOMU_RAMDISK[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
     fi
     if test "${DOMU_PASSTHROUGH_DTB[$i]}"
     then
-        cp --parents "${DOMU_PASSTHROUGH_DTB[$i]}" "${DESTDIR_ABS}/part/disk1/"
+        cp --parents "${DOMU_PASSTHROUGH_DTB[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
     fi
     i=$(( $i + 1 ))
 done
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 085e29f..8f08cd6 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -316,7 +316,7 @@ function load_file()
     then
         echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
     else
-        echo "$LOAD_CMD $memaddr $relative_path" >> $UBOOT_SOURCE
+        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
     fi
     add_size $filename
 }
@@ -891,7 +891,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -907,6 +907,7 @@ function print_help
     echo "	HINT - the file name of the crt and key file minus the suffix (ex, hint.crt and hint.key)"
     echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
     echo "	-f - enable generating a FIT image"
+    echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
     echo "	-h - prints out the help message and exits "
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
@@ -914,7 +915,7 @@ function print_help
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:f" opt; do
+while getopts ":c:t:d:ho:k:u:fp:" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -953,6 +954,9 @@ while getopts ":c:t:d:ho:k:u:f" opt; do
     f )
         fit_opt=y
         ;;
+    p )
+        prepend_path="$OPTARG"
+        ;;
     h )
         print_help
         exit 0
@@ -1179,5 +1183,5 @@ then
     echo "$LOAD_CMD $fit_addr $FIT; source $fit_addr:boot_scr"
 else
     echo "Generated uboot script $UBOOT_SCRIPT, to be loaded at address $uboot_addr:"
-    echo "$LOAD_CMD $uboot_addr $UBOOT_SCRIPT; source $uboot_addr"
+    echo "$LOAD_CMD $uboot_addr ${prepend_path:+$prepend_path/}$UBOOT_SCRIPT; source $uboot_addr"
 fi
-- 
2.35.1


