Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958319F7A4A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861110.1273112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd3-0008MX-Vc; Thu, 19 Dec 2024 11:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861110.1273112; Thu, 19 Dec 2024 11:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEd3-0008G3-Rl; Thu, 19 Dec 2024 11:23:41 +0000
Received: by outflank-mailman (input) for mailman id 861110;
 Thu, 19 Dec 2024 11:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vR1G=TM=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1tOEd2-00089J-QL
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:23:40 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2423776-bdfb-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:23:39 +0100 (CET)
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:102:268::8)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:23:37 +0000
Received: from PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce]) by PA4SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::fd16:4665:bad7:33ce%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 11:23:37 +0000
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
X-Inumbo-ID: b2423776-bdfb-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXq0wmAxhELERVWndeEwt+Nj/om35zrQ+84GeuEKc5n9mcXm37B4Ojz5bsl71e8ph201BrHh5Kiaj9UTv2B/xMy7hquK7OfcL7cGjMtKe7xGWZRGreSfV48vbR+ltw6VgRzZ0pyGwK6qwvgKl0b7hIdpk/Neh01vW5A63XztwX0UY21q2fULiTKeDLzGTTaNpSNuINJIqey/Q+HOvldRN6yl+HKgCUgzqgH+hVw5bIakuri4NNF3bBOzvYypRfnohBHiEKsSkRt2XsZUxfGoIo/SbH1izIgo4lldx02qLas/Ps4nFKjvNS+o0hESXM8Rktc4zphGXAO+6Ili1he8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl6a2ZFCdB7uSAUka3CQGXl5zPhfOlTYRKt+89VAhOE=;
 b=UnlXPIGAiagkfEFV9OSUSG9JR7i+b0mHEpuNpjAoai2UhoD8aFasckl/P2dpzQW2SmkwURYZwC/EcY/QmxxTsdGqZC1mF1pxiyVd+YrnLFFyB+epozl/DSlR2brI+o0ZQTWt2Nddefu57cMjgw9IopHvPnFm0yOykjXGzgiLIvTqV0CvWLRercDAPPnwl4mM0oCT5n1q2odMP7ual4i6XywKdjC5LTJOodKDwlfKB2nHke36vH2QimnijeTUJHBaisJRb/KhUgOoSouLMQllYIBHC3JUQr065n68kPqusvxczzd1r6o56s052PokfnHjA2Fg9rQ+xyutzqBp9biiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl6a2ZFCdB7uSAUka3CQGXl5zPhfOlTYRKt+89VAhOE=;
 b=IrSZ20TEnqTZxX74TgBNTXBsIxapUBMi0VQVjgmxivTmCuOWZA8Td+f2//ceBxVDMLKxFLDUsaENJ/bA5i83F+a3GVGbNcOeSuYLTjAucm6fLRjvgE5A6Bf6WVDbppL7Fvo+1FFbY9CNqZTbKNgiO794ALK6ezqprpLpVtQ0L3qH0UFTWbuRfAnForxcTs+btPVBoPw2qdL43ApmDiRidUX63gnQX6ov7nJLQXwafIlS4dDT4k+IVD+FJ/cfFhGdHXh+sYFL/OhAcjag+mVSItHlQiU8QT4i7ygK4TbUdjta796WGRYWXKSdbdPGh/ju6qyIuQ1gGIJTUcbIr3hk3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: S32@nxp.com,
	andrei.cherechesu@oss.nxp.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/6] xen/arm: vsmc: Enable handling SiP-owned SCMI SMC calls
Date: Thu, 19 Dec 2024 13:23:11 +0200
Message-ID: <20241219112315.2461048-3-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
References: <20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:208:1::16) To PA4SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:102:268::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4SPRMB0023:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 09499d96-fb3d-45bb-fe50-08dd201f93a7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9owx1PcL99jevXt75Sfru1/e5yXeizbiVeYLeIAVIEn4HGVSSY136cYlG2CF?=
 =?us-ascii?Q?43m5GXoU8xWlyLUknVchvC/kLJppChLeUqZ7y+d9lUZcKC3Npxn8oCjyXftN?=
 =?us-ascii?Q?zopNV///7cPJXlOZGy0SlaRRdLNZTf6IqF1d/wIGmhSEBsj3v5/97ce4Rn16?=
 =?us-ascii?Q?bEY/7EA4plwifJxvfHxmbEBEHsamxJ97ofWYMaPUAMLfRnZ3Wp3E+KxbgbEW?=
 =?us-ascii?Q?P0WEL0a6/YGB4dBZ193iPYhEgjXEbIBN8cCziZ4rBfNdss7nRXQQKvTlFPyJ?=
 =?us-ascii?Q?ZPDx7uvz7fXe0FbYctVa/a75lF8iyIIov+P1fZK42M0kHE0XRrtLPxt9IR3c?=
 =?us-ascii?Q?yFDgkcn7RTBVnfQebVAz24wM7ngOvrWQdPc9stDTsKaxqrzmN7SdS/I82R3f?=
 =?us-ascii?Q?YU/LqsMqHhKQcaJPw3hbx+HJAImDtAgtXPtLFcfFk769GuzMOlYz86lCH3Nz?=
 =?us-ascii?Q?LKocNZHj60DkIfxkWb7fZGskojk/VG+ab2f036a5yXYmC/XQRwEUrJ7Azwc+?=
 =?us-ascii?Q?VJr/gJWXdxwtK19ctbgdqboytTB2eKAwUywWk7gPZU/7fPAvGozNvE6HSdm8?=
 =?us-ascii?Q?TIqlsIyX2lddR1/QQXt3THSLoa3NBjaBhGj2j3/4F4Wxrf7c8U/oiu9UborV?=
 =?us-ascii?Q?mPVDkv4jq2Aq2+njAFWiYvhUBGc0K0CZXpL2RWVJpzDsulA3CZkFucUDjsY+?=
 =?us-ascii?Q?Vk9jB0R/q63c2HLVkAj4kOCUT6YjOxVNjiE5eXvxVnP2tn/gwFQJ0kTPaZKS?=
 =?us-ascii?Q?jaAFpC8zqlIdsZ6AYEe/WI12o81ph9jWXr5mUdSUgm+nfx+P8BQJxjjuTg8R?=
 =?us-ascii?Q?eUxenu1uD44Kd9dRCY2jrsyFkacv1WoEOCsrawsSfpZwj1wSrr+PtRxt+65K?=
 =?us-ascii?Q?AQYD0enpa94Pkd/Dr4BNaKlJJNM4NL7PgjUNycb4WMK4D8jpyl4tTrmi51/5?=
 =?us-ascii?Q?vzZBdMFumT1jw0DOxGq+v7zCS0uIHvC1i0aHJyf4HucefwI1jMzBp13uHa+I?=
 =?us-ascii?Q?rz48bcGxHXeBdndk5wljckDTlX8cRqNl0ZhiCGWJMcFHuXHjYLOpKzgx8su1?=
 =?us-ascii?Q?g7CIGJZvawfWayE3VOfsgSPvHHqsshf4okhTUM5bWGL0NNQ7X+LYz4LMTVMY?=
 =?us-ascii?Q?Gb91O5WdEYu9C2843TIqUXGnN3+DqwyRuEupBXyNqhByYkwZjBfF3l1Zz+uN?=
 =?us-ascii?Q?cSb5wwiWid6atbYTjJQXJVg5YWIF9DuGDsA6Ud26Ad54rA+04gAFRXuj991q?=
 =?us-ascii?Q?uRANuek9G3FNTMCosRANtUKePsVtz8msIJv4wD0apV9PLZPWNoBlUckSPC/E?=
 =?us-ascii?Q?KIUtyzRsO2klEw1e8sRdHDi0dmAhx1Pn7guJ5qC5/LagMJLhe7M53/Xiwgoj?=
 =?us-ascii?Q?ca1bYBX+aGsylH74EvUdKhEgcamSBPORfiw1HyA9OQCkp/03nZqHTfWOTTcB?=
 =?us-ascii?Q?J1Xy0NUnQrZYw7tJ3fxg2Ue5Farpt3Ew?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Agv5RufhN3Wy3eEeOzXVIycdXX3R6+Y1c6G1TwzTPzl9sfvYnBCCAWEFRk4J?=
 =?us-ascii?Q?5+OFS9uDe3/hA7XJwZGD6RaFHtVpG44wLti7HVzatGzRoV6bg7WrhySO3OMV?=
 =?us-ascii?Q?IVYQPNPH1HbGnvfWNx0P/+NLIGfEIRkB06vqDhE2DHeovoW4LH4+l3BT53Kj?=
 =?us-ascii?Q?7qRCp3B3jdCXG/spLCuyWsOrqvHTeoaxBVJPPIO3hlLGdR6+KB//2zTIBrCM?=
 =?us-ascii?Q?FkYht8eQEdN6xvGoayJlVnRNb8BK76b5Mw3g4e0NH7kts/ksf77FzA4DFBoB?=
 =?us-ascii?Q?nlxzRk1VMn84FXiX3Wi1QBCgYETxYnikrZxdouOVvIRAYtYR107QKJeJ5tRR?=
 =?us-ascii?Q?MBZLqwLW7Zkjxej5QvXWaTl1S8w9Hgan5OcwTPuSlbiTt0WFNJNEaoD3P131?=
 =?us-ascii?Q?ENIftydgkAQxKmYPN4uxVrPDWHnJZkav/IqNE9V9mOMhArNXmsLJ/hTLOweK?=
 =?us-ascii?Q?1K8QfpINBBSdvp4kVI0MYaVPT5kAuXRJcDRleP4i5hTDFls+xdXVgjC8mpgc?=
 =?us-ascii?Q?5iTe3T81eG2XeCHSwvp6vkye/hEDl9xiYn52adK/uHiea3CR5TIxHMh84l2+?=
 =?us-ascii?Q?pNbzVdj27HrZ/2U1BIZdloJkjsK05zLxmQOUXHnhfK5hpypWQQDcN2wlDNvd?=
 =?us-ascii?Q?CPQoVdyAICro8BouZ/Q1vux4fSZ7ZASBsV2o+/jOGCoRWe61wUcLo8TuBTX/?=
 =?us-ascii?Q?GC0N1yb6uQlEXpnnLYuxI9MSZCTUsf1Eryjj1DpfESlgfDh/7kd2DJc6NIOU?=
 =?us-ascii?Q?RlRj+IIr1yzrOZLYSNLV2LSl5WfHjrCmZvHwrWtI1994txU6EALKuEtwEQ5g?=
 =?us-ascii?Q?IIbVQcYy/9+lKD3lyajPxdupi+76626J73RBoYjSF3ZqsxEQ1k5fmYlD2Mlz?=
 =?us-ascii?Q?HtkGKAppQTebdf1AD9idSLBnpA5raDfKAI/900j5CIvbD1Gp3l2mdyuTZUnF?=
 =?us-ascii?Q?QqnR6tujcStGtC5IvU8OX4ys9DVLBSU5p6M9Jw/Fe/gszFWrYA2oOyRjHu1K?=
 =?us-ascii?Q?gF0ANoPV45XUxHhp9sXAZLt3K9YP0XagtzbXHySDfFH/BN0vvFFXEf0aKQQJ?=
 =?us-ascii?Q?xnOqpGg8hVYqwoGx4/zVBX7QoYlUG8vdt+xQD92bvCwJbSRTcQUWj1lbXoqW?=
 =?us-ascii?Q?mCszZKH41b8SWj3iwmcez0XMqbufmYaWS3RFKTgRNYvWne13ntIub8/M3Tc4?=
 =?us-ascii?Q?0OuKWmj+eGHihLjHZY3bWPbH4iDExHyfACh6HUDu6d7B3KnrY0d/jj654rIi?=
 =?us-ascii?Q?QBCEzyYZAsWnb57pgLhrC1IPfmfvPAIU+LRAjRrEkJeG6CEVZ+gPKiauAl7R?=
 =?us-ascii?Q?PTMvrDgex0FLifOpKD6K9dn1BcWS/V3VhbU7Wb+WdBHlrHukbKDtZcBj/HNs?=
 =?us-ascii?Q?zRAPJwi4vG67TDif42hhkgA+IsUIlRzVlbm4WpS6UNZ7mXcdzS+z9YUanjsK?=
 =?us-ascii?Q?8se7lPz6IIIr40TMgBIDAcPsUy55PosFh1A1Vty10RFW7nQMc7tcswLOYEDI?=
 =?us-ascii?Q?N7IWbwopL5H3Vgqils3c0nEWpU0D0f6qd8/p/P3EYh+dNrqNUxF3cHqxaeRp?=
 =?us-ascii?Q?0zqGoPgX+eefaMpEO4xhkhSj7kK+egmBxKI6TuDH0ukyifbyBB/cpeRFI0qN?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09499d96-fb3d-45bb-fe50-08dd201f93a7
X-MS-Exchange-CrossTenant-AuthSource: PA4SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:23:35.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yINuT/MC29Taswd4lu0pbGfsr53IdC5QOesUADz92PIj39aQaffeXz11m1S/5spg3rKLEkmABPL7iD43DDzLeIoNmtUcNuMK1AVpDuI52is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Change the handling of SiP SMC calls to be more generic,
instead of directly relying on the `platform_smc()` callback
implementation.

Try to handle the SiP SMC first through the `platform_smc()`
callback (if implemented). Otherwise, try to handle it as SCMI
message.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/vsmc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index f679cced7f..62d8117a12 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -20,6 +20,7 @@
 #include <asm/traps.h>
 #include <asm/vpsci.h>
 #include <asm/platform.h>
+#include <asm/firmware/scmi-smc.h>
 
 /* Number of functions currently supported by Hypervisor Service. */
 #define XEN_SMCCC_FUNCTION_COUNT 3
@@ -224,6 +225,16 @@ static bool handle_sssc(struct cpu_user_regs *regs)
     }
 }
 
+/* Secure Calls defined by the Silicon Provider (SiP) */
+static bool handle_sip(struct cpu_user_regs *regs)
+{
+    /* Firstly, let each platform define custom handling for these SMCs */
+    if ( platform_smc(regs) )
+        return true;
+
+    return scmi_handle_smc(regs);
+}
+
 /*
  * vsmccc_handle_call() - handle SMC/HVC call according to ARM SMCCC.
  * returns true if that was valid SMCCC call (even if function number
@@ -288,7 +299,7 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
             handled = handle_sssc(regs);
             break;
         case ARM_SMCCC_OWNER_SIP:
-            handled = platform_smc(regs);
+            handled = handle_sip(regs);
             break;
         case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
         case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
-- 
2.45.2


