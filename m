Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEE7561CB5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 16:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358512.587776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004gS-Os; Thu, 30 Jun 2022 14:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358512.587776; Thu, 30 Jun 2022 14:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6umr-0004Zn-I3; Thu, 30 Jun 2022 14:04:53 +0000
Received: by outflank-mailman (input) for mailman id 358512;
 Thu, 30 Jun 2022 14:04:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IH8=XF=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1o6umJ-0004O6-OP
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 14:04:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8319805a-f87d-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 16:04:09 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 14:04:15 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::1549:6f15:1949:f1a5%6]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 14:04:15 +0000
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
X-Inumbo-ID: 8319805a-f87d-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0TPi6aWJw0SO7x+DuRH21xHOnECvpwd0r0ZTSN/0C+JhUd8zMpFDTT9eZUTMQHK6+uxz04snj/mFZ5Hwcr/WD7rWEvVE5RvSFNZFs58sLW4oG0OpWDPCuBKjZlwXOe6BNuSQkVw2wbpfp4xNYLMoXMAb17gou6LzD3TcAIShzuzyfAefit0i4iH2m8/k5xR0GDJoGeCUt4d5FKGIl6+6SZ+utgoPiMhEhOBa7/9l8z3mOgFQHGl+Ja8ZtGmBh/qvn8cl0BKUzV89WjVWExpXtFzlr0Fq/uQFgEsmYABjnlq3Izp7hdZkSTVgAyy6BPSrrZ5l/WJPf5EkpkoeoPQIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p9WID8wCWme7yTVDlS/nHDHlNEKgtykRbLwYbaQeI4=;
 b=mfbrWwedUKkeHZ6Vzec50C9Ikd+SBPs+wJbOhcnk7gjpJFkuSMl8fCTm5iURExowkUzuP4fDtjcJX6kb0sBJ9AhqZ0+W8gY4LYfFM1AP6fzYM1/tybx4DeB/PUOwqtAL9S5AIegQxgpcICifnfOZwkeUGPnSWelqDfFpZQ5inK1tyLY+0dstNax/rnoQiHj1eAYbbsWCanowMDxm9RqhgJadC7fX7vQM2fKzzI3nsUAuYZk+FeLAiliu6KFozvtWwCc8lg1h04OarUR8puEYXHyLGW1qXU+oZG/jmziGx/IMqW0cXqoZXYxuYA/J7fpbU0hX6exXzY/EyFTWHWHvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p9WID8wCWme7yTVDlS/nHDHlNEKgtykRbLwYbaQeI4=;
 b=FpqiTeDycGl20L854ENWpvCiRyWibKzqfc8uPwHzhnDd5BNm7EoF+ZiLiwuLzP/REW/T7F8aBlp+IVeQ3FyojFetGjaFRbd/q4gjYCJNpUYxqSRdUmSGHTHoTYZW0w5y/d5CWg2+zzxq/EdV9DvhWIKBcukOQEjkvCIz5XSG57A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v2 2/4] uboot-script-gen: Dynamically compute addr and size when loading binaries
Date: Thu, 30 Jun 2022 17:00:27 +0300
Message-Id: <20220630140028.3227385-3-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d9c75e5c-1b4c-4582-c8fa-08da5aa16aac
X-MS-TrafficTypeDiagnostic: DU0PR04MB9322:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N59m1XvfonJiMTpf+UpG/yzpCE7zOaAYt3GjBy5A1i+bySQs6loarS8kvi4osTx1MKoDYVagDkAO78BJ07t+yVBfTNGsyhS6lJBjfXebx+woEGOewxF7DQDV3RhokQpT2CifvB+NM8Ke+y+nErbhnjf/a8ogGxDkGYKrBoBzvSHfpzJLOH/9jPFwbXTGf5bhT0t9ViDhJ+NDwCmlV0zcVb0WXWix4jkdmicD1U+LeE+6VZMUsUpuUNEhw3t2jZwWHFOUzmySpFb5IT0alpQMumuSg7IhBL2qtUMv717hx9LDzLtqfQJaw1+1pjuw+r34x3B5cOHs8H2O0INJjoSAma7IlbSPTEgG2IY5MbaFVEycQiDZ5t23DN60mBqAdmjEGRn2FAmbg0ItOgg0e37AgzS+zs6UjCLNfI30PcKvMLYeCrtLqxlhtPfdznWupMp2trUJ54QQl0BeWjV4X6/qTQmgLftOgd0PSZVcLjfzUqQDOozRYV/CGBnnuORDrG3pYSiLqtlutlqMWIpAlmhPFVo5cBiAO03XZ5u5nvf8ynMACiuppq6QcqsQmd9Hb9bZZaDu/NWniycjpFAvEelgolT99uI3FHngUwuOnCiXyWDq9jOYvKH4ZPmz09d7p3HtxT1m/8UQQD8VuEYdhgK7UiOGLlE7J6xAd82myKsj34AmOhhr291Ismo8pxqN8I7IBuWMUFN0lmwLoXpg4eamT5nwRRpojbHTpA18w4wvjYBSIEQGSfxnXVfVJfMfZAGPHKL5GMFwoVnJSS4XCibaDkJ4gRBxeBAQIlrRh1OkQ0ohfNooMN0iAOv/KGZExZtV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(478600001)(41300700001)(5660300002)(6666004)(186003)(6486002)(6512007)(52116002)(1076003)(86362001)(26005)(8936002)(2906002)(2616005)(30864003)(66946007)(4326008)(38100700002)(8676002)(6506007)(316002)(66476007)(66556008)(38350700002)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UqVlQVeYBSBgjIjgqtGzIINuDHvlUtdBkhqdpht7W1WhNJvjwmMQp0/VKFTB?=
 =?us-ascii?Q?XrJ2yAsG8Gz0wId8uNdO5dmrHs/Rj0F3zt4XMab3rhceNjzEGa44Vhfxi+ZE?=
 =?us-ascii?Q?HYcjIKvo92FWvHNlTYHdpE3fk/yKssE4kQLyZUv+HM9+ztSSuzz95wsRguix?=
 =?us-ascii?Q?KxbcF8zIKUaZqmSay5u9MzC19noNw6iCXBPhxVhcyfseDpgxrw+InLaegPTi?=
 =?us-ascii?Q?3FxiyQTzY7jFt+6IIPmvTg8H98IZHqAF7jPkgLrSQfghjka5JwV2ue2WmMRV?=
 =?us-ascii?Q?UIZqH//uO5HmkpIs03iW0b4HbWaH1Y13BRH5egrs+SCSNt7Y9nRzO2cjxm6w?=
 =?us-ascii?Q?/97SSSvDuMq7b07e4ALbdzIEwrbgQ9cl+njU/NOGVYEg8jQJ/ltAr9BfGMm5?=
 =?us-ascii?Q?K9bR+J33uPkggcOYIPPYuXVoAPOAxzkCTYeNhhC2yNzu7ZrsESJuOHeqYlSl?=
 =?us-ascii?Q?no0yXVsHCgBcs/8GLGKpzEl4SXmgXdU960rSzUbreat0zgpf3WaARm6d3+2y?=
 =?us-ascii?Q?Nxj49R+dX46q09ahzlT0V2SBM5cuueaU/R06vgPzYz5YWWq7joyConCnNMgz?=
 =?us-ascii?Q?0OFQ25MgxkzdI5VSDo3jnLIc1BeZ2ZKuXttR6eMsqIM8I4jn4ElGZ9V1/cO4?=
 =?us-ascii?Q?LllIcFfTtNvN38ACAz281ex4i/R+nnibl0XwMtEvb/cA/KOo9LTThfBPpwBn?=
 =?us-ascii?Q?srh7mZ99lNIjAWO2NHbfXTz7tZs5rFxq5Na0IZTJQkwNX8zc834+VRDdK4O4?=
 =?us-ascii?Q?XAHpgj/Q55/5XAo4kveJIRkeuxqZq9nvEWb+CX6pkf5zoMAHIcpvtTrI2aHz?=
 =?us-ascii?Q?y/rlkiaWj6ChxzzPVOyeRlFZgSWZWuNjcj4RWqL/YT5aI055EWeLJO7A0ElG?=
 =?us-ascii?Q?y5EapPm84aVgZy5LAdHv0Dxiqzx7P36C6k9Fnf9yaWsK7+G7JYdVHJkezL8G?=
 =?us-ascii?Q?H4qg2gJSzvehwjK7YwEUjMLwFd2z7DkDIq1lvDtMQ1kRU4hJL184ZtRiTJJR?=
 =?us-ascii?Q?7xm11C3uY4fR57X+EIV1chYiZx7cLYYSrwA1RI5Burctg6EN0LUZtNgEBH6o?=
 =?us-ascii?Q?KRslUvkvL3FkL4QMzXu3E173txSMvK/FU97ZIsabbO23xNVHr5hZT3lnW9n6?=
 =?us-ascii?Q?YJbc/jVyGWerYM2t1yuWhhU37BI22uKNOaA60IJiqz+YQeyiOUnFOeIrpgO+?=
 =?us-ascii?Q?ofOOGcq6kCclhHYuVXSeLzAryQCbhuJu9Ef48bsCn9Rp+W3wZr+FL/hPQ7PF?=
 =?us-ascii?Q?xbX/qvevfIpupq8q6FK2mKsa32P1dtAW4Anm4GcBQJRJ0tZDquNg5MROX3nn?=
 =?us-ascii?Q?5QAeuyK83JAPtFf2eBPXYK/T4xDJwFuszzt4vLovdNfFFrNjh8WR2s6RBb8+?=
 =?us-ascii?Q?OVupmjUplCAKVVipxvdWfxVAWb9yzqHEhzhe+6o53iE6/9r5oY0i3LHjjlcQ?=
 =?us-ascii?Q?TjXSxIgKL56VhadpgzkEDRoUuS5ncRcls/WtlPO1gmqpdv4ODbmg0n3PPaY9?=
 =?us-ascii?Q?Ih4hv3oFli26sHJ9Zz4BbVy5WNiqfe7ubSqraZnv3txb5g0pu5z2sRZhU0DK?=
 =?us-ascii?Q?KC+aW+iCSqI2/Pdr9BQyzkAgXBRkkDiW3uaRlwsPqTfddf/89EEafv8EwX3C?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c75e5c-1b4c-4582-c8fa-08da5aa16aac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 14:04:15.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoCm1R/4Tv579CrJBDiUZo5DW0flBwP9NdKGmmPYGSSNxoNrEVX9HE67SqbzQrhxC7/QLlMjZYXhpPlxVqRrd8x7fGFj7biLyLNlyleLIuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

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


