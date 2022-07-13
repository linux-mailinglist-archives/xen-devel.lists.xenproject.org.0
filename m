Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062D573B44
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 18:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366875.597814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGi-0003fU-L6; Wed, 13 Jul 2022 16:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366875.597814; Wed, 13 Jul 2022 16:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBfGi-0003bO-Ff; Wed, 13 Jul 2022 16:31:20 +0000
Received: by outflank-mailman (input) for mailman id 366875;
 Wed, 13 Jul 2022 16:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9THP=XS=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1oBfGg-00035D-Iz
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 16:31:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2041.outbound.protection.outlook.com [40.107.104.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 382e66dd-02c9-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 18:31:17 +0200 (CEST)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by VI1PR04MB4893.eurprd04.prod.outlook.com (2603:10a6:803:5c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Wed, 13 Jul
 2022 16:31:15 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::c2a:42b9:f908:e991%6]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 16:31:15 +0000
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
X-Inumbo-ID: 382e66dd-02c9-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR8xtkUATNFYuRzWZKrnDCi8y/1Do2U5afdZaF6ksnyCcc7I0UHUxmmRC7JvpVZ9etHScboqnIRP7i4JJvcHTM3qOsYlHUJ6q8cztR9SsSbIxmudytC1bGsgdSOlucDL0vjQjBnnI+ct6jg+bYSC/EQLlTeIdXF+P8KmAJABouhPuYodbkU9NXuZZkQiOnaKJbdEV02kLLGETSZ566xhuC3JbvFiq04MLrjeXkjwC3FR7D39UTDg3l9Q20LPWHHpXfyl0OaqLSxV5VsOu1SyfiDL0PeHGs4NctErTImPDBbCh061SHbK4zkwVhj2NKeSwuZ8CiQdi3wVPPqaZ1ZwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmqTgyPFFWr6Cy0aMCwaNL1SgYThtx501TxRMDkfl/c=;
 b=TRgDIP+2NzxZRMJ3Tu0mcTQiA9GVqPSH88x8BTlKzCM+ZdS2ljP0UM9g9euekpThTLy5DSwjKvvlL/8/5xhzU8WKq6HvtTUXmPHXQmdlGSd5hUjK5v/moCdyuwmtdtXvsevfiSMbr16lyLwitkxa4PDOL9gD1248uH4eseaVznqfM2DX/waWsukOzlneAMEUlydlN1ycN5RrFVYQSkk6WsK8SuGurBqrs9mbDRuDNU3bQBbA/nzAd5J4qEyZ0UCc6/On+LMx2cdkZTrq1d7+o+XDXeIRYbOcsfI33wpzKbk1X5mtJPW2cmymSL5ACB0OC3XMvHGFHol0cxTNTu4BKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmqTgyPFFWr6Cy0aMCwaNL1SgYThtx501TxRMDkfl/c=;
 b=Uy0YfAtcMIb45xb6Kf+PJ0ObyB15W/Q9rdAzfj7QkidqCXeRSxDqFY24YwiItNIiCZfmHfhU23jAJHiI8wQFLbnMeWY4W3n+lrkYbZsf274ZEL6MnJLIqt45JYYE3fudR8aWaH4o+nR5lf+OIqcHhbNuvJJS5lGiz0YSFwiZ6z0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: viryaos-discuss@lists.sourceforge.net,
	sstabellini@kernel.org,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [ImageBuilder][PATCH v3 2/3] uboot-script-gen: Enable appending extra commands to boot script
Date: Wed, 13 Jul 2022 19:30:43 +0300
Message-Id: <20220713163044.3541661-3-andrei.cherechesu@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2ee13a77-9f45-432e-eba0-08da64ed1b4a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4893:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1U1NCAxm426kbrrJSQm+ZUSU+sb7yeRZ/Y1U4e9TzYf/qYpe/4FGct29qXg4T5/Ells4X/K4Hd/4MeZlvpoiWz3HPEvwD/++e48NiA9KAJ1MnrDZ0DMFaf4qo3TyV7ZhGNuAAp214CsIzhzr8st8udITALDLvlhioqMMmRJfzw3QtfbDtfUenNKjDvK3baIDJw7MaJOwTGK4yKeqFNnDqjPsK3MLG5Dx6deU4ouC9EF8SSEEMBz46jriniZR1ZU2DnNAo39hN4RJEzsd6Gq7qEnFh+SQsMrekVz5236iqCEpZRrppUI2q7IrLTclMotvGxboTMeqNP35nIiIH5cyL6LdS+T1yBuLRGBgf0C//U+WtgMSy7pDoaH98Pk83K4XnQ8P1m0gaBQ70O8CbmUTk2PTWeCVOiAf/oxSLrP+NGtgiX6o1eI2y5CC2TrHpwD5DQZuNka98gqpQxExMe4944l3mTpAnDrzJQHuYgRBtcdYqHfT5lUtfaBYZE3xzNcaskn2wi2dlXtP3l6cNcMW9fbU78MDGO2l77vf2phrPUOc2kJRi3uzrZxp1P2Ok/99LsPOA+KIc/REq1FCR1YK4m7p3qp73p8HkNHRXbNXCPjSFLgw45sqy6YQ2+MILCT008iN2ZYk29oS62zpyn28KP8i7jjoc91YUGfm2XRBLFOBSw08aXYMK8dCFPIBAOZupXGRSzJHK/R/zLZ2MXmqXiwvoAmvembrihCdLu874PymoxD8UFcrjmjK/YVw1fgHmbVO3g37Thz31RwOGIw5NNPSL2652zWv6MN9d1i83fm0yP4M8IafQnBuHe0AVH1YABgfDbyHprASGGdUJk2SFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(86362001)(38350700002)(38100700002)(8936002)(5660300002)(478600001)(6486002)(6666004)(41300700001)(6916009)(6506007)(316002)(52116002)(4326008)(66476007)(66556008)(8676002)(66946007)(186003)(6512007)(2906002)(2616005)(1076003)(26005)(139555002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2dJVpksJKh6Ah6mquzNtwx9fNdnTBLO0eIEi7huZ0oiiGh0U9T0AVmPEW9xL?=
 =?us-ascii?Q?APf7jfEjrf5luxfXtlEsoBT51LPGDz/8IVWTt9oA1uJcr4B/ECjRioWesE3W?=
 =?us-ascii?Q?nZa4F1q7Imjrb1jk6W175oSKaRbacLxqpTCErgpZyME7mjNMXWVl9WPM3S64?=
 =?us-ascii?Q?xT5ZBjbZKLYOlVVz/HHw/zMvgp9bt2ty2huGmiEQLDqrZeAqsHV/j0RT1LJY?=
 =?us-ascii?Q?ZUBK8Co6YkcDJZCdbV3dpKD8TpMUahXCGhOavVvFESDG5CcR+byOs15ovYHm?=
 =?us-ascii?Q?kEPWFU/xfwfaxzbRB14QxfLqdo+NKG++CYg+yPf5y67bQ1tRJ9D6Yt9U4xUJ?=
 =?us-ascii?Q?xeON3XmgWxqUHLJdB6mAZqaukFtqD09x5F5VK08I8VP/+197bLPk2igZgPiL?=
 =?us-ascii?Q?5MKg6iNflOvbSujkk0x9FVPGRfEZ4H7uegcR1YPGbDtSIGHG5RhusNX7LZ+i?=
 =?us-ascii?Q?ZpUisyCva4M9zS0UoNgACWWQsIubCw1vwKseqIgNCOmMie3Khn15KdWrQ1t3?=
 =?us-ascii?Q?0JnnEs+2e90LkJm/LaI+bV5KOFBtLFg6T8KzNoxCvzh+JjRW0KX+q6faodJX?=
 =?us-ascii?Q?od5TBEQAGpOC4NP60MYIeRmqTWDSOmB8olSymstjXZiZ9YmU7Apfks2Da8Rr?=
 =?us-ascii?Q?iu3ziP2Im57239IhKMPp/zFwpjkv5FpVxyriLTw56zYZatE0t0YYN0/ILqou?=
 =?us-ascii?Q?5ebockCSO3IaRGofhl5npQ0b7XKkjB5CoizBmIdWwdZN6u6THqN0tmUwvblG?=
 =?us-ascii?Q?U5aOooumNI5whYcIn7aDtrf+v/l/TWpHP31ZP1Ld8hlZV43XX2cEaXt85Om7?=
 =?us-ascii?Q?INyTNv4q51T/sVjL36zH9QNFr7cQkD2vtSkl3xaZv0Rk5iTnzceCYAXHYC4F?=
 =?us-ascii?Q?MsBWDuXxHKqBE0QmQZdw0NSirK4dF7IXxafLcUeJKlrGe2fvvYuCYL7EDUBM?=
 =?us-ascii?Q?MmNmDdNzdjMI/CIxww7rscnhzAxvwkcW3gb1aj4RWG2tFuLyrI5g9d26R1QU?=
 =?us-ascii?Q?QBn4pIz27vjKRhf6bQ0zi8k6tqf6lgczWYGy0lO53BHQmwk32L7k6pSJOV0Z?=
 =?us-ascii?Q?daViSTIbFssEPkIVTKVqTNKfK0Sp6TcLECM8loJDDOUK1eKO0VpoETLoIqyT?=
 =?us-ascii?Q?NdBFUa47JcMQRBEmUCVjnT5r3ihJ0veSK12mm30f7xwnhgXIed3x6azpBj72?=
 =?us-ascii?Q?viXT7AUIf5+dyp8juUYb+D8b28APHH/0vBMztnIWMuDdFq2yv0XsFyZPDfdh?=
 =?us-ascii?Q?D8a6ahNS7PTftkRZ1JANj9gSoQVNZ7jSFbIAD7Va3/luCNzG+zqZy8CVSOhK?=
 =?us-ascii?Q?V0nO/BvhmJDwEylJlhnXNMEqmSdXJBxyhn8Xx5IsnliRbyG+yM6NbS184Ihi?=
 =?us-ascii?Q?wVzqF60kRrKJ87YF2mexS5e2+aiS93pj7PTC0HGxOufEORYaBucnZ3wMy86n?=
 =?us-ascii?Q?XdnL/op5d2ocAXHSti7m05ajGvsz5gxHsgOwD0JDUSM/VMmQgJ+gzLxYC457?=
 =?us-ascii?Q?7VYRkLsyk1+bUP153oP1kwXOc5feEgqeKU17luJ6BPasp1oF/a7qkh/7HoHY?=
 =?us-ascii?Q?ewO1nBXCqTLdZSapLiB7w+otxLEiRvIM2yuxnCrasBc/tojiL/LhKnW56oc0?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee13a77-9f45-432e-eba0-08da64ed1b4a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 16:31:15.6142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g312/3O5qxeaMK1nJ90tWipBRIQs+2SoIKYIFc4VB+XNpgOJfLnnRSCN/5R5aCcOgybJkV0ElolyD32SE9wXrPu34H3+4y2ukLPjP13FKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4893

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added the parsing for APPEND_EXTRA_CMDS variable, which enables the
user to specify the path to a text file that contains, on each line,
u-boot commands that will be added to the generated script as
"fixups", before the boot command.

The file specified by the APPEND_EXTRA_CMDS variable parameter will be
copied as-is in the generated script.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 README.md                |  5 +++++
 scripts/uboot-script-gen | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/README.md b/README.md
index cb15ca5..3566a6d 100644
--- a/README.md
+++ b/README.md
@@ -64,6 +64,7 @@ BOOT_AUX_FILE[1]="uboot.cfg"
 
 UBOOT_SOURCE="boot.source"
 UBOOT_SCRIPT="boot.scr"
+APPEND_EXTRA_CMDS="extra.txt"
 FDTEDIT="imagebuilder.dtb"
 FIT="boot.fit"
 FIT_ENC_KEY_DIR="dir/key"
@@ -197,6 +198,10 @@ Where:
   as you can pass -o FILENAME to uboot-script-gen as a command line
   parameter
 
+- APPEND_EXTRA_CMDS: is optional and specifies the path to a text file
+  containing extra u-boot commands to be added to the boot script before
+  the boot command. Useful for running custom fixup commands.
+
 - FDTEDIT is an optional and is off by default.  Specifies the output
   modified dtb, used for reference and fdt_std.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f8d2fb0..f72551a 100755
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
@@ -1238,6 +1242,13 @@ device_tree_editing $device_tree_addr
 # disable device tree reloation
 echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
 
+# append extra u-boot commands (fixups) to script before boot command
+if test "$APPEND_EXTRA_CMDS"
+then
+    check_file_type "$APPEND_EXTRA_CMDS" "text"
+    cat $APPEND_EXTRA_CMDS >> $UBOOT_SOURCE
+fi
+
 if test "$dynamic_loading_opt"
 then
     echo "$BOOT_CMD \${host_kernel_addr} - \${host_fdt_addr}" >> $UBOOT_SOURCE
-- 
2.35.1


