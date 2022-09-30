Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29965F0F69
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 17:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414302.658516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIQB-0005ZX-V7; Fri, 30 Sep 2022 15:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414302.658516; Fri, 30 Sep 2022 15:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIQB-0005Wy-Ra; Fri, 30 Sep 2022 15:59:27 +0000
Received: by outflank-mailman (input) for mailman id 414302;
 Fri, 30 Sep 2022 15:59:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi5f=2B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oeIQ9-0005DO-Ph
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 15:59:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dad37a75-40d8-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 17:59:24 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by AS8PR04MB7991.eurprd04.prod.outlook.com (2603:10a6:20b:289::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:59:22 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::90be:f320:716c:5bf8]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::90be:f320:716c:5bf8%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:59:22 +0000
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
X-Inumbo-ID: dad37a75-40d8-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyIZ4ti9MzAOu0++a4afSh2u9ooiJw6OSX7/5jV/ML9OuYJ52/UoMiBdNFVDsYH3It6CusYGpp07r5CkfIb/MbGHuyC4G8WjYD3o2tg+vJ/eL/iiqVkvzSnyPm4A/3+2wqDvN+f21SkbpRtaWLHMj3vL/Qk10reEqEJSvazfjoBIVX7BfqlBIYdhKCsTeUEGPLwFzNoukeJgJ16ByUjbLWg2ZBkiK3K1bZ5pQmLx1CTClVAt+byZp45n1ijf5X3SS3lzOae/jNIBcZdbG+Ytg99DtmyYH3ORubgAtgnHBC3vs3l02uSmqizbfKE4NSpWbSFzPCYy2ofDAZCKx/spfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdzjZTKmnGZB4Jrjg5RvYEjwLWaqX1ih9fF/MAq9rCo=;
 b=ibi6XMArHCGt2F5aJI1hiuC05tieosBtzNe1cbzGljgitaQBqfo1tiwVsyTwfg8NOZuQwOsw1h4cxC2Uyggq3oZpIHv6XsCvi24BT6aAC3PziWnnl0qcpXEN3yrEj2bM4uGOfPqHj/EeoNyfLOy3yhH/4hbi2jvt0f/k0FBMZyT4TqALppJi8dBRZH6D79Q5YxqUdlnD0sVnQSo04ClensRWP8LATG4ec/HpN9OJn/ecUdNKr43XYjMMCjvTe1F2K0yF0vA46+c9pr7CQ/E0u4hyZZnOV3xMUJvvcjctRSxt1xZWNl3UTcn3ynGTxkgl40fUf8X4M7B69u2rtdzSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdzjZTKmnGZB4Jrjg5RvYEjwLWaqX1ih9fF/MAq9rCo=;
 b=cXeTB/Gc7yVvZdcTKgn+73N/MKdcPPp4WJiedDRFfEheul2SLnVQCO+qUm0wyf5+M7wDtJvmypgPGcOw1FqE6b7d4opARLLTgejnUZuXybCmu1HkZB7M+JkWRYRICRzJBP8JGQrSl9y6AggcMd7v96mUxCCG1cx0uLqOvUmCjJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v4 1/1] uboot-script-gen: Dynamically compute addr and size when loading binaries
Date: Fri, 30 Sep 2022 18:58:49 +0300
Message-Id: <20220930155849.2210574-2-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930155849.2210574-1-andrei.cherechesu@oss.nxp.com>
References: <20220930155849.2210574-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::13) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|AS8PR04MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce8de5e-3de6-43be-9380-08daa2fcbd46
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iiRHUdK78Fz7ux3lKq3MVTlGqpMcRAoqAfgzp5/zcEQlKT+ShmvTbEm88v1vO/EmN9aMlnPTmlL07PUr9KkYIQet9rKqphfnRN0Q7a1k6nYnqEiL+7XRTzfL+FQDVFieII2N/5Xn4oi5+vjZhhxT2cUrSU3qHZH+/fQ2OwTDXFYHN+VkszkVY6LP4OwJMPlgO/OX6CoGd9qJXzmG+hRiDl/NiTAhk6ZhKJ08WkgoB89raKd+YP80ecVHtOU8AnTfuXlxPCiolOcd8psK+jZIZrIu++ww07lxz/vxtd+OnQ/JMCQ4x0l4dqn4domj4CmT4VuOKKw03wYJw/2EaAUWZ8aC/9vBnLNpzXH35g+vdkGA0REHL7vz8SZTSlwYmr2L2nlTuHmy9wCT/k5ZUbG+Acq8dVMcVGIVTljH1fV533Zl1Gv3APkNiezjZrvjX4+BIDzkGMpccpm7swNZmy1nBZW0e1UHvsQ7NVEen5UQNHMdVe4KeMU65yo5h/SzEwzwWgxJOTbmoFDVAW/r+BGyUSlVl46WMURQVFUBnVHFIYfk9EO1U4hlA6QLIPi5dQbkr4SKmOo0uqnK9UgoUYkCm326/w18CODIq/G4ukppNWLmoJi5jUOHl2CNdy6PY2ykHq0VKSewy6lThOtRluU9T7G6QKOyqmSmuPSPUfTgTAxbs4L1x2RVnbnOHVDxlsxfRLshq+fHqA3fV7Hd7ofqLCeLqTTt1+gqmABR7skscxM3pPhviCBHTnLgIoXv9Lgr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199015)(4326008)(8676002)(66946007)(66476007)(66556008)(38100700002)(6486002)(2616005)(186003)(478600001)(38350700002)(6506007)(1076003)(52116002)(6666004)(316002)(54906003)(6916009)(86362001)(83380400001)(6512007)(26005)(8936002)(30864003)(41300700001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MOXhr70FC9vvsg/fAYGSnDBcDYrz2VcAWsI1mj818929LCU+eSXOkB5tdyfs?=
 =?us-ascii?Q?YgFZuz6qlnu2vq3rGfQkYZXABlpPNiQkgmNsbAMV2fwuu/ki4QB3NXmnC+h6?=
 =?us-ascii?Q?I93w9xlGttcMYwFMFp9veH8tMc/ryOtxhieLWMAdgrVo2l/ISZ/eAaVnKXnL?=
 =?us-ascii?Q?tCA5o0g3Du+4Q48aLg2MQJd4XV/XKmk1v9CUi4G8SB7fyMC0CozOsiNyMFAx?=
 =?us-ascii?Q?J684J3fJR68pDcuzlDEYAG0YdqAY4gCIaDg7azC0BXxM0GMoL54i5x9hqMFz?=
 =?us-ascii?Q?KSRCzjR2Loov2+tGvA4YfQjBCiETfBegsSgEiaLoVqMvk25uJ1bgVlD1Qn46?=
 =?us-ascii?Q?sy8i6/HvgokZquWgjbWOkhY1LVJk/krUwG3g7sI7Hlr4Zg5M/d0i35t0gm5v?=
 =?us-ascii?Q?LcYUj1K6TkMdQfPtHcNauETsh+WYDrO4nwDAoaA4ogasDYMKzV5hE/bfrxX4?=
 =?us-ascii?Q?/k+2ls3l1F1W+UZamoxu383X2PrWPN8LOVSIoizO3v2TnlflW9o8BpotPnMx?=
 =?us-ascii?Q?xn//49XPxbq8xWXXUnTnvGc1B7BLYvx6g2gml8pOTjIbCazX6pqBRjA4pato?=
 =?us-ascii?Q?vXLj1EiLE3xq4at3gDZcDCRBRGGz+3eDA8mxD68l1rsnTXKr6nwcO6AWol9a?=
 =?us-ascii?Q?V2fEUYqOR0r4iDEAupN/Z1IdC2O01pnwW+YNEgw7TCVfTSGtUQ9k6RTpvzSa?=
 =?us-ascii?Q?UtT4w2WcT4ZwDzrnZmoI4yNIekE/1iNgU8hQWb5GDarbWhM8rCAA5lK36wBc?=
 =?us-ascii?Q?0BKA9/i1wMEx4yiGy3AkPRIQf4z+CiQQ8yO2SasQzhCsL0mqdh44uAGLtZNV?=
 =?us-ascii?Q?MMOQ1VdrDzLZ4LmhcO/HjDAWUkReVCV7liwavUhwC/txQB2rLgqOV38iVqKU?=
 =?us-ascii?Q?uIVrXLAV1SosDfct3SnvH351bs+qiy+qKSru/J/I0g6kMFjeJz8PpPOD1dpv?=
 =?us-ascii?Q?778gfmN9fRvw4MeTHbvpIRPSLrsBpgQN7GCuWg/tfC2tn55RcAo4a/mtoPuo?=
 =?us-ascii?Q?6CRtPIs7Lw7knyUyx3fmWtlOHa0l6HOmOCTs63WXLVasMpqe4XTuVGf0nYih?=
 =?us-ascii?Q?Uykpb0QEJAOohPQDYarvLn3uLVfEyH1TfHfjqrlQrpJQI0F2zqSGk8Vh4Cqw?=
 =?us-ascii?Q?ktEDGBvzVIzzGWNH0drwAtWiEZu4yh/bqw7/Bnb+s2+mQLRbrEPsyYeE/Jf8?=
 =?us-ascii?Q?QAVxsjy5kJf7zOdzpaGnwmivM9L19UW6jaEd3nx0KUWmxb2x+iPx3WBeHgdB?=
 =?us-ascii?Q?iFblljgUbABHhXDWDXMDouguqZeaUluUD1yhGT55JmzU+FBEI0uqbqINbqr6?=
 =?us-ascii?Q?Dx5tzf/+l1EC3zIeFf4rQpIh6rGxBdnWAVAmwwKzqvoqvCbL/Y0uoKZ9ROb5?=
 =?us-ascii?Q?qhFWmgCFBgJAV6yazv3zzcBo5LaOZibAf8+40bYhC/1DO2KyTDwP3alV10KN?=
 =?us-ascii?Q?hhxfGEhwMZRy/JgMpIXYPN+da2rNDMZWwyHAFPUp707OxW6Gw1xSSaaHRF1a?=
 =?us-ascii?Q?81kHMLF/AvLbd1ZgHpv2zIzqYaPJwalAuzf9xnJinRz1dTRptdBQyJXWaNBu?=
 =?us-ascii?Q?yiQhdbTyHiA9YR0+tNNNeKQDUL9ioGw9sXzhr4vBqlMsWbGCRnrUKwqWm6R4?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce8de5e-3de6-43be-9380-08daa2fcbd46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:59:22.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5ie2XGDesjONBOGahqR4kChDbugPQ2uHWyyHnAgtJjoxIECh3uXL5mQ/xFopAXhNeZzaChBkSTqbPW1y31/qTsRYK5WCltVL7vn108T86U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7991

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Normally, the Imagebuilder would precompute the sizes of the loaded
binaries and addresses where they are loaded before generating the
script, and the sizes and addresses that needed to be provided to
Xen via /chosen would be hardcoded in the boot script.

Added an option via "-s" parameter to avoid hardcoding any
address in the boot script, and dynamically compute the
loading addresses for binaries. The first loading address is based
on the MEMORY_START parameter and after loading each binary,
the loading address and the size of the binary are stored in
variables with corresponding names. Then, the loading address
for the next binary is computed and aligned to 0x200000.

If the "-s" parameter is not used, the normal flow is executed,
where the loading addresses and sizes for each binaries are
precomputed and hardcoded inside the script, but the loading
addresses and sizes for each binary are now also stored for eventual
later use.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 scripts/uboot-script-gen | 114 +++++++++++++++++++++++++++------------
 1 file changed, 80 insertions(+), 34 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index b24dca2..16269f0 100755
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
@@ -28,6 +31,7 @@ function dt_mknode()
 #   str
 #   str_a
 #   bool
+#   var
 function dt_set()
 {
     local path=$1
@@ -35,11 +39,26 @@ function dt_set()
     local data_type=$3
     local data=$4
 
+    if test $data_type = "var"
+    then
+        eval data_addr_var="$data"_addr
+        eval data_addr=\$"$data_addr_var"
+        eval data_size_var="$data"_size
+        eval data_size=\$"$data_size_var"
+    fi
 
     if test "$UBOOT_SOURCE" && test ! "$FIT"
     then
         var=${var/\#/\\#}
-        if test $data_type = "hex" || test $data_type = "int"
+        if test $data_type = "var"
+        then
+            if test $dynamic_loading_opt
+            then
+                echo "fdt set $path $var <0x0 0x\${"$data_addr_var"} 0x0 0x\${"$data_size_var"}>" >> $UBOOT_SOURCE
+            else
+                echo "fdt set $path $var <0x0 $data_addr 0x0 $data_size>" >> $UBOOT_SOURCE
+            fi
+        elif test $data_type = "hex" || test $data_type = "int"
         then
             echo "fdt set $path $var <$data>" >> $UBOOT_SOURCE
         elif test $data_type = "str_a"
@@ -63,7 +82,10 @@ function dt_set()
 
     if test $FDTEDIT
     then
-        if test $data_type = "hex"
+        if test $data_type = "var"
+        then
+            fdtput $FDTEDIT -p -t x $path $var 0x0 "$data_addr" 0x0 "$data_size"
+        elif test $data_type = "hex"
         then
             fdtput $FDTEDIT -p -t x $path $var $data
         elif test $data_type = "int"
@@ -87,38 +109,35 @@ function dt_set()
 function add_device_tree_kernel()
 {
     local path=$1
-    local addr=$2
-    local size=$3
-    local bootargs=$4
+    local varname=$2
+    local bootargs=$3
 
-    dt_mknode "$path" "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,kernel multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
-    dt_set "$path/module$addr" "bootargs" "str" "$bootargs"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,kernel multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
+    dt_set "$path/module-$varname" "bootargs" "str" "$bootargs"
 }
 
 
 function add_device_tree_ramdisk()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local varname=$2
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
 }
 
 
 function add_device_tree_passthrough()
 {
     local path=$1
-    local addr=$2
-    local size=$3
+    local varname=$2
 
-    dt_mknode "$path"  "module$addr"
-    dt_set "$path/module$addr" "compatible" "str_a" "multiboot,device-tree multiboot,module"
-    dt_set "$path/module$addr" "reg" "hex"  "0x0 $addr 0x0 $(printf "0x%x" $size)"
+    dt_mknode "$path" "module-$varname"
+    dt_set "$path/module-$varname" "compatible" "str_a" "multiboot,device-tree multiboot,module"
+    dt_set "$path/module-$varname" "reg" "var"  "$varname"
 }
 
 function add_device_tree_mem()
@@ -260,7 +279,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0"
         dt_set "/chosen/dom0" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0" "reg" "hex" "0x0 $dom0_kernel_addr 0x0 $(printf "0x%x" $dom0_kernel_size)"
+        dt_set "/chosen/dom0" "reg" "var" "dom0_linux"
         dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
     fi
 
@@ -268,7 +287,7 @@ function xen_device_tree_editing()
     then
         dt_mknode "/chosen" "dom0-ramdisk"
         dt_set "/chosen/dom0-ramdisk" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
-        dt_set "/chosen/dom0-ramdisk" "reg" "hex" "0x0 $ramdisk_addr 0x0 $(printf "0x%x" $ramdisk_size)"
+        dt_set "/chosen/dom0-ramdisk" "reg" "var" "dom0_ramdisk"
     fi
 
     i=0
@@ -315,14 +334,14 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "colors" "hex" "$(printf "0x%x" $bitcolors)"
         fi
 
-        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
+        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" "${DOMU_CMD[$i]}"
         if test "${domU_ramdisk_addr[$i]}"
         then
-            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
+            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk"
         fi
         if test "${domU_passthrough_dtb_addr[$i]}"
         then
-            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
+            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt"
         fi
         i=$(( $i + 1 ))
     done
@@ -350,7 +369,7 @@ function device_tree_editing()
 
     if test $UBOOT_SOURCE
     then
-        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
+        echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
         echo "fdt resize 1024" >> $UBOOT_SOURCE
 
         if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
@@ -375,11 +394,33 @@ function device_tree_editing()
 function add_size()
 {
     local filename=$1
+    local fit_scr_name=$2
+    local binary_name_addr="${fit_scr_name}_addr"
+    local binary_name_size="${fit_scr_name}_size"
+    eval "$fit_scr_name"_addr=$memaddr
+
     local size=`stat -L --printf="%s" $filename`
+    filesize=$size
+    eval "$fit_scr_name"_size=`printf "0x%X\n" $size`
+    eval binary_name_size_value=\$"$binary_name_size"
+    
+    if test $dynamic_loading_opt
+    then
+        echo "setenv $binary_name_addr \${memaddr}" >> $UBOOT_SOURCE
+        echo "setenv $binary_name_size \${filesize}" >> $UBOOT_SOURCE
+        # Compute load addr for next binary dynamically
+        echo "setexpr memaddr \${memaddr} \+ \${filesize}" >> $UBOOT_SOURCE
+        echo "setexpr memaddr \${memaddr} \+ $padding_mask" >> $UBOOT_SOURCE
+        echo "setexpr memaddr \${memaddr} \& $padding_mask_inv" >> $UBOOT_SOURCE
+    else
+        # Store load addr and size as literals
+        echo "setenv $binary_name_addr $memaddr" >> $UBOOT_SOURCE
+        echo "setenv $binary_name_size $binary_name_size_value" >> $UBOOT_SOURCE
+    fi
+
     memaddr=$(( $memaddr + $size + $offset - 1))
     memaddr=$(( $memaddr & ~($offset - 1) ))
     memaddr=`printf "0x%X\n" $memaddr`
-    filesize=$size
 }
 
 function load_file()
@@ -394,10 +435,13 @@ function load_file()
     if test "$FIT"
     then
         echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
+    elif test "$dynamic_loading_opt"
+    then
+        echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
     else
         echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
     fi
-    add_size $filename
+    add_size $filename $fit_scr_name
 }
 
 function check_file_type()
@@ -978,7 +1022,7 @@ function print_help
 {
     script=`basename "$0"`
     echo "usage:"
-    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
+    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
     echo "	$script -h"
     echo "where:"
     echo "	CONFIG_FILE - configuration file"
@@ -995,6 +1039,7 @@ function print_help
     echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
     echo "	-f - enable generating a FIT image"
     echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
+    echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
     echo "	-h - prints out the help message and exits "
     echo "Defaults:"
     echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
@@ -1002,7 +1047,7 @@ function print_help
     echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
 }
 
-while getopts ":c:t:d:ho:k:u:fp:" opt; do
+while getopts ":c:t:d:ho:k:u:fp:s" opt; do
     case ${opt} in
     t )
         case $OPTARG in
@@ -1044,6 +1089,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
     p )
         prepend_path="$OPTARG"
         ;;
+    s )
+        dynamic_loading_opt=y
+        ;;
     h )
         print_help
         exit 0
@@ -1223,6 +1271,8 @@ uboot_addr=$memaddr
 # 2MB are enough for a uboot script
 memaddr=$(( $memaddr + $offset ))
 memaddr=`printf "0x%X\n" $memaddr`
+start_addr=`printf "%x\n" $memaddr`
+echo "setenv memaddr $start_addr" >> $UBOOT_SOURCE
 
 if test "$os" = "xen"
 then
@@ -1266,11 +1316,7 @@ fi
 
 if [ "$BOOT_CMD" != "none" ]
 then
-    echo "$BOOT_CMD $kernel_addr - $device_tree_addr" >> $UBOOT_SOURCE
-else
-    # skip boot command but store load addresses to be used later
-    echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
 fi
 
 if test "$FIT"
-- 
2.35.1


