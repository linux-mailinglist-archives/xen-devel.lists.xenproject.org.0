Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069B5573B47
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366874.597798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGg-0003D5-5N; Wed, 13 Jul 2022 16:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366874.597798; Wed, 13 Jul 2022 16:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGf-00038F-VY; Wed, 13 Jul 2022 16:31:17 +0000
Received: by outflank-mailman (input) for mailman id 366874;
 Wed, 13 Jul 2022 16:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9THP=XS=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oBfGe-00035D-7H
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:31:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36bf0573-02c9-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 18:31:15 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 16:31:12 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:31:12 +0000
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
X-Inumbo-ID: 36bf0573-02c9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdqDrjrPfltX+vj28Yq5YzPy2OIt/4OHk1ktTlhWd0krippHSguVhd8tFktQ0dTO/DCVJtamcahOk+nxWaFVGJlg4BHAlhkjaC07b4ZosAbAvVqQfkfjDbs0cTBz6acN7CCo6DoloSjNQmNcHaeD6IM+l4nHD0eSxlFzDUu/Bm7g6wr87swlyWyCWYnaTl8Bd5HFgFNuAo/QIrgkzr3s6t+HM1wX81a8ve6ANMCRxE7PX5chMJyefonqceMYKzvY3oRg+CSTtvDu50aY0AxywsLo7PS/zPwYp4PqHXz7UYXurOaLGIPXTtQnztkvVFRHoGL56+IKWolPz3d8bm8K5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p9WID8wCWme7yTVDlS/nHDHlNEKgtykRbLwYbaQeI4=;
 b=Emulg3+6T4a3SE2tes00OcPcEfuIyQlVJXu9xPOqBCQyJvFXNHqCgVwIqt6vipKj8Zjpc9CxZXIbza+31qx2nNtZtYccHov2wn984eobkcKz7LVFajQUgPqNB+77O9IGLJ6paQ90LBZRnMBqR+EJGWKWTKk0Dhes185hk2FKtTiu+mNiz/EqPqnOP4m17FZRfTSVNT9CKR/0+EhKZtyL2rIgaBmeXovhVi07G5wTRKK79pEI7aS8YfbgtvQRDARV6MwpiPwShTecgyVTA2+V2lriPnwoYtmAJVJbGhP+lmJqkSGS4RKN5FK8Y8qdb6V2Utms7FxlDA7kmAaq4Snb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p9WID8wCWme7yTVDlS/nHDHlNEKgtykRbLwYbaQeI4=;
 b=MBOLXsBVERafZbLh7mkeLaZFo2epkrLgUA/HZW1MFs0A6SZ2zt26DRSBFEa1BQ/464BczpJR1H4u1/5OAhakuUVHFj8w+YD5z/bCddeq697DfQJvxU9g9CIAiJBMTmlOUBptaqodKEgSTHHDSoZHt2O3KypqBv1y24GcnCgLoAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v3 1/3] uboot-script-gen: Dynamically compute addr and size when loading binaries
Date: Wed, 13 Jul 2022 19:30:42 +0300
Message-Id: <20220713163044.3541661-2-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9cf94d7b-33f0-47f4-4bbb-08da64ed1918
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AafPFvYV+v5lxHgOj7XIkckOVmNDIuWbDaSt/XJeXaZbr9pGGZC8v8m+z16Bq8HsW2c5W/FEX1PaszfRqvXpTiAphcK896JethKJu4PKUBJfG4vGBPAPYoTGWSTN7retkOFKFUZCNOwQlb6Uuy1AWcQH8SQ8EFQKZ6xUHjT91fhOmuw2x7mZie7HrJLu2rNq5GfRvG5nrP6ATXwlIxncHucxELVQ2FTX2kiz8WBANjvgnvILRqoK7Yd8+y3x53R6zMMwLPBp+f6ZazN5eHYWaC8dj/xbBlpcx4K1LV8sOVa6qN6UNcotnESS3NlFNlnl0eUiUoBhjDxbRjsAp0w0d7bl6ESHAsg06RQIf7Y1bBA5KXEIuEeWH3dN4YtPFm6oQor023SckcNyto3fRh+veoU+B1965Wt7rcnjIm9umBNP44Z2riQ/NEbsnyGNNf3f5NrJR4x9dYf4rqBrN/qSM4Mw81pD+iGYUzDLQELIC6cmXM2YkwxqZjH4orBUk+IkbUfWIhWiS6HQmQwQml5VscDdjNlef/gs5pgYfuU//QvPK7BTquo6+o8H4esbksSqDv5nBmDsuIpiMjyNxct4dYxZgqVL5PIaULWm18VfCB1ozs2j53xUMSWxVCFnGVIXvm+S+T37STCxgXnAMtCiW05Qa5eJclbnwLeIF+gopccyqeU6mKw+a9CsZTuVWB/pdA8qS1LNziwe2ZrAZvGSeI8qMyvill5W0e6kl3NoLGYIHHH3kuIp42xXzLwZgxY4SHIMo4SAgEgMMU49JI1M+XBYUnja4JSWjRs0l1E7Mkwoy79DLEoaRWxAWNcTF/Wd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(83380400001)(86362001)(38350700002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(30864003)(6666004)(41300700001)(6916009)(6506007)(316002)(52116002)(4326008)(66476007)(66556008)(8676002)(66946007)(186003)(6512007)(2906002)(2616005)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lg6aoX5P3bHY0og/gSzld682c3Ky/vP+JCeMrimuoCuJYDzGBTSzEKN3jnUo?=
 =?us-ascii?Q?KOzCsDnyUvzTWNlOHOp68V/WuVPh1LQYKme5EqRAvFIjyde/5nE9aWhoAly4?=
 =?us-ascii?Q?5mnGWq3O9VnJ0UwLjqoYyblNoNVeRc4iyWCNNbyrFXot5XnR2zFpyX3DLyFx?=
 =?us-ascii?Q?GRYSlwBvawq4H9u8Gt4Zto+A91PcCgncdkhOcTrGoM0gB4miK8/5jKS/s/8A?=
 =?us-ascii?Q?3GZuTGbQU03CfZOQZhXENPCuIxMtTz9sx7VXWC+AUniMKMhG+0R/0Au8T3D6?=
 =?us-ascii?Q?mkgnl0mLGGyUlAoBJ0yrLo/DV5linFDn5RWrPfWM5pyowntaL+8RZRUHTCzk?=
 =?us-ascii?Q?8VYWFW9EVeFRI/Lpn90tmICyDZUE2p7mNJda0kenKvEaeSfZl1lFBaZi0zSw?=
 =?us-ascii?Q?prNxgisBtZS4y0x1rIAB34Wu3MHgrYXWSvpaIp8E8b6ikAP0HFve+m/xjPDd?=
 =?us-ascii?Q?dwzFyrXlsTVC96UAbclHlBaDIg/55rKqmASTCSIghePjfBku7iJ7mq040itK?=
 =?us-ascii?Q?TdPfw8xeWDv9snan3XE7tqzVXRmTP982oFrrQj81pSPUqXl048kPCC6sVxmU?=
 =?us-ascii?Q?eC4F/vtp9z+4W2UjwfDB96FsYPMKrQmEDO899EEatazdfU5Al3V1LC79r5NH?=
 =?us-ascii?Q?X8qfm14+20pCPq7ExX8doCM3dIuIkSOlK9JqtiEyFhg4GWoaX31iJzlwnJ/n?=
 =?us-ascii?Q?D1nNSu+mw0R4GlO2ObU310pz19mvx3FSMXn3ewhrVF0waEv0tflJLrebJADs?=
 =?us-ascii?Q?I0Xe5PCTTp6pwI42HRK/gjqVpXA5V4jgjKMxsCr5gt6HsWxTx8rQDoaPrxW4?=
 =?us-ascii?Q?h4OQ9aBK1pjd8mLjqjBHj21SU1TQbQblWj3HM3QBxEuISpwbZv6bfG9vrVBX?=
 =?us-ascii?Q?+lzl3NgXhqAWY6w2vrLpxYV8vwS715jXq4yOhDcFctWPOL2soB3ZSK/Rlw6n?=
 =?us-ascii?Q?7DG295ejYgtb4mXFPS2VKGyBxxxcsQ7hc4u6imHhC5Z+XhTwU+bBzMX2dblm?=
 =?us-ascii?Q?JwWm/NRWCyVAPh4PjuEDrnZbLPmSAvC/Llv3phjTzC9thpRJTc37tgODhNU5?=
 =?us-ascii?Q?CkoAl2w8P73YvuaMDhaDLuax9tHGfH+yWS4NG3T05wy2G7ohcdc/SJswXhHc?=
 =?us-ascii?Q?lyalWp0UdVoKmptA3Kp9BPYQXVAKhDrq1iQjUxogk3Jy+F4BVXUceZbYtLr1?=
 =?us-ascii?Q?LBxc+9O/cgyjWcku36AN7pnAFe6VP24o6jCexRSos6Xj9ie5jvj5/0c7UoDn?=
 =?us-ascii?Q?W2sB5Zvr9JwapjJu9BCTOBdbg11EFj0ypJzgi6gzgl4IuvQ8GXG2o29fDqVT?=
 =?us-ascii?Q?gGd0p6LZnx/fgn2jLpOkv+N+/2hrulD/kb2L4qo5WaRkBp1SiyLeWqFhGQ0S?=
 =?us-ascii?Q?tyFZMAvhutIWPOM3KVw/MRxDCmVfLDHTZnADGcNAVPvawjA+p8GvxSwDq/Ib?=
 =?us-ascii?Q?g57l1PaqpTxl+ppXfU0+rbvUXkgs16DKbQWdZrRpVlhoaQjY/vwqcGEfepmP?=
 =?us-ascii?Q?9+WMzJOfHO0bZmrcCo95z8YZNb4Ej7lOs4Hxat1AgIu2K/gOYdfXx9ymYAiG?=
 =?us-ascii?Q?+xk2yWyRWSld7ZfXBBAjqUKkmUkxNL8n462ypAh5ra+TGaty2ufgi+S1M/LU?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf94d7b-33f0-47f4-4bbb-08da64ed1918
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 16:31:11.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/4rivODVPS8rlEtcax28qLBlyExKlhpPxp/1P2jNn3Khd1MEptHoQW1iG7/EYF6F97Ibr9tHH6gf/C+VBQzwqMsD28a/ldkQBw5WkicvXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Normally, the script would precompute the sizes of the loaded binaries
and addresses where they are loaded before generating the script,
and the sizes and addresses that needed to be provided to Xen via
/chosen would be hardcoded in the boot script.

Added option via "-s" parameter to use the ${filesize} variable
in u-boot, which is set automatically after a *load command.
The value stored by filesize is now stored in a u-boot env variable
with the name corresponding to the binary that was loaded before.
The newly set variables are now used in setting the /chosen node,
instead of the hardcoded values.

Also, the loading addresses for the files are dynamically computed
and aligned to 0x200000 using the `setexpr` u-boot command. Basically,
if the option is used, there are zero hardcoded addresses inside the
boot script, and everything is determined based on the MEMORY_START
parameter and each binary's size.

If the "-s" parameter is not used, the script does not store the
binaries' sizes and addresses in variables and uses the precomputed
ones when advertising them in the /chosen node.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 scripts/uboot-script-gen | 136 ++++++++++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 22 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 8f08cd6..f8d2fb0 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -4,6 +4,9 @@ offset=$((2*1024*1024))
 filesize=0
 prog_req=(mkimage file fdtput mktemp awk)
 
+padding_mask=`printf "0x%X\n" $(($offset - 1))`
+padding_mask_inv=`printf "0x%X\n" $((~$padding_mask))`
+
 function cleanup_and_return_err()
 {
     rm -f $UBOOT_SOURCE $UBOOT_SCRIPT
@@ -91,10 +94,18 @@ function add_device_tree_kernel()
     local size=$3
     local bootargs=$4
 
-    dt_mknode "$path" "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
-    dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
+    if test "$dynamic_loading_opt"
+    then
+        dt_mknode "$path" "module\${"$addr"}"
+        dt_set "$path/module\${"$addr"}" "compatible" "str_a" "multiboot,kernel multiboot,module"
+        dt_set "$path/module\${"$addr"}" "reg" "hex"  "0x0 0x\${"$addr"} 0x0 0x\${"$size"}"
+        dt_set "$path/module\${"$addr"}" "bootargs" "str" "$bootargs"
+    else
+        dt_mknode "$path" "module$addr"
+        dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
+        dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+        dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
+    fi
 }
 
 
@@ -104,9 +115,16 @@ function add_device_tree_ramdisk()
     local addr=$2
     local size=$3
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    if test "$dynamic_loading_opt"
+    then
+        dt_mknode "$path" "module\${"$addr"}"
+        dt_set "$path/module\${"$addr"}" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
+        dt_set "$path/module\${"$addr"}" "reg" "hex"  "0x0 0x\${"$addr"} 0x0 0x\${"$size"}"
+    else
+        dt_mknode "$path" "module$addr"
+        dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
+        dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    fi
 }
 
 
@@ -116,9 +134,16 @@ function add_device_tree_passthrough()
     local addr=$2
     local size=$3
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    if test "$dynamic_loading_opt"
+    then
+        dt_mknode "$path" "module\${"$addr"}"
+        dt_set "$path/module\${"$addr"}" "compatible" "str_a" "multiboot,device-tree multiboot,module"
+        dt_set "$path/module\${"$addr"}" "reg" "hex"  "0x0 0x\${"$addr"} 0x0 0x\${"$size"}"
+    else
+        dt_mknode "$path" "module$addr"
+        dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
+        dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    fi
 }
 
 function add_device_tree_mem()
@@ -186,7 +211,12 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0"
         dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        if test "$dynamic_loading_opt"
+        then
+            dt_set "/chosen/dom0" "reg" "hex" "0x0 0x\${dom0_linux_addr} 0x0 0x\${dom0_linux_size}"
+        else
+            dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        fi
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
@@ -194,7 +224,12 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0-ramdisk"
         dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
+        if test "$dynamic_loading_opt"
+        then
+            dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 0x\${dom0_ramdisk_addr} 0x0 0x\${dom0_ramdisk_size}"
+        else
+            dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
+        fi
     fi
 
     i=0
@@ -241,14 +276,29 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "colors" "hex" "$(printf "0x%x" $bitcolors)"
         fi
 
-        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
+        if test "$dynamic_loading_opt"
+        then
+            add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel_addr" "domU${i}_kernel_size" "${DOMU_CMD[$i]}"
+        else
+            add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
+        fi
         if test "${domU_ramdisk_addr[$i]}"
         then
-            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
+            if test "$dynamic_loading_opt"
+            then
+                add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk_addr" "domU${i}_ramdisk_size"
+            else
+                add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
+            fi
         fi
         if test "${domU_passthrough_dtb_addr[$i]}"
         then
-            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
+            if test "$dynamic_loading_opt"
+            then
+                add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt_addr" "domU${i}_fdt_size"
+            else
+                add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
+            fi
         fi
         i=$(( $i + 1 ))
     done
@@ -271,7 +321,12 @@ function device_tree_editing()
 
     if test $UBOOT_SOURCE
     then
-        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        if test $dynamic_loading_opt
+        then
+            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
+        else
+            echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        fi
         echo "fdt resize 1024" >> $UBOOT_SOURCE
 
         if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
@@ -306,7 +361,7 @@ function add_size()
 function load_file()
 {
     local filename=$1
-    local fit_scr_name=$2
+    local binary_name=$2
 
     local absolute_path="$(realpath --no-symlinks $filename)"
     local base="$(realpath $PWD)"/
@@ -314,11 +369,30 @@ function load_file()
 
     if test "$FIT"
     then
-        echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
+        echo "imxtract \$fit_addr $binary_name $memaddr" >> $UBOOT_SOURCE
     else
-        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+        if test "$dynamic_loading_opt"
+        then
+            echo "$LOAD_CMD \${curr_addr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+        else
+            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+        fi
     fi
     add_size $filename
+
+    if test "$dynamic_loading_opt" && test ! "$FIT"
+    then
+        # Store each binary's load addr and size
+        local binary_name_addr="${binary_name}_addr"
+        local binary_name_size="${binary_name}_size"
+        echo "setenv $binary_name_addr \${curr_addr}" >> $UBOOT_SOURCE
+        echo "setenv $binary_name_size \${filesize}" >> $UBOOT_SOURCE
+        
+        # Compute load addr for next binary dynamically
+        echo "setexpr curr_addr \${curr_addr} \+ \${filesize}" >> $UBOOT_SOURCE
+        echo "setexpr curr_addr \${curr_addr} \+ \${padding_mask}" >> $UBOOT_SOURCE
+        echo "setexpr curr_addr \${curr_addr} \& \${padding_mask_inv}" >> $UBOOT_SOURCE
+    fi
 }
 
 function check_file_type()
@@ -536,6 +610,14 @@ generate_uboot_images()
 
 xen_file_loading()
 {
+    if test "$dynamic_loading_opt"
+    then
+        local curr_addr=`printf "%x\n" $memaddr`
+        echo "setenv curr_addr $curr_addr" >> $UBOOT_SOURCE
+        echo "setenv padding_mask $padding_mask" >> $UBOOT_SOURCE
+        echo "setenv padding_mask_inv $padding_mask_inv" >> $UBOOT_SOURCE
+    fi
+
     if test "$DOM0_KERNEL"
     then
         check_compressed_file_type $DOM0_KERNEL "executable"
@@ -891,7 +973,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -908,6 +990,7 @@ function print_help
     echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
     echo "	-f - enable generating a FIT image"
     echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
+    echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
     echo "	-h - prints out the help message and exits "
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
@@ -915,7 +998,7 @@ function print_help
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:fp:" opt; do
+while getopts ":c:t:d:ho:k:u:fp:s" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -957,6 +1040,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
     p )
         prepend_path="$OPTARG"
         ;;
+    s )
+        dynamic_loading_opt=y
+        ;;
     h )
         print_help
         exit 0
@@ -1151,7 +1237,13 @@ device_tree_editing $device_tree_addr
 
 # disable device tree reloation
 echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
-echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
+
+if test "$dynamic_loading_opt"
+then
+    echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
+else
+    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
+fi
 
 if test "$FIT"
 then
-- 
2.35.1


