Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316F76FA1D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576879.903531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKI-0004q3-Ih; Fri, 04 Aug 2023 06:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576879.903531; Fri, 04 Aug 2023 06:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKI-0004n9-Fh; Fri, 04 Aug 2023 06:30:18 +0000
Received: by outflank-mailman (input) for mailman id 576879;
 Fri, 04 Aug 2023 06:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoKG-0004V1-L4
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:30:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fc27f67-3290-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:30:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:30:15 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:30:15 +0000
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
X-Inumbo-ID: 5fc27f67-3290-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gs04y2bRLoSOIC/O5daECMMYZc7FpA1V1x3wGUo1SAWv+j8Qv043wMdjgf2FGBYMnXhH3wSD9pbA/CI+u4DP1gdEtmr90MTVCrADqKDLaRC80mL68mnkkSLixnghX4cQCI6hqelY5X6L6niq4vTtYcw5J3laJ2/zIvJd3l9HkmOZDg0Hz8jIGtIhS6Q7k65y+V2sIE42ln74k8vmy6+rAQtTmI7u3FU/Mf2mL5BibHmfHwV03JcQUpaoipMH5r9wjNsHM3R3lbqw9fsjzS0kIpiYNpiaqAmntjvrafhg2WISjUQcMS9iFE/98MFrZBVceaLSyxsEM6ziDCQwC2/VVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5BIsX4FSDC0bHsNPv5zyFFrdlOeD6u1F2sVkFP/hDk=;
 b=GCG6IOxZ/+3H5dB7nFMPA5uJ9Zybi1o3l8J076k3cAVpc9OtnnDAsStoRPd06ePxDQ2LimCwRHWx8vda5XAWSG/HoHv5aAT8UZold+xHpXV+U2USz+AAe+p1h6nOxokaHeRVlD2A4oyO93pIvo9VfeKwhQwPjhlIPRPhVQv/NSUuwxuknNk1RT/pUq3kkH8an4ZDOqFmk5SX4GMPaKyl1Mi0rHL8i1q3KdoxaGPNtEOMVtqwaJi6vH04Jhl+pzHhHVxOdCQgVrd74aZ7qK9oopd3A6zQXQbJ4k8/1W2kHv+lUa3A+HPMIpotn3exIcURSgLTLdT7k3jHo1obXSCqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5BIsX4FSDC0bHsNPv5zyFFrdlOeD6u1F2sVkFP/hDk=;
 b=REvIjxpOiQ9k8mQbOavFaTAXXZ0UJ8797VdaQkxMHxks/8SOYPghJhEQ+XRHwgJd4kzpi1k1QJqE0wLL9X30aNX10CgIAWfHNqwAM62EgHA8WrJyfr1iRKrZ+9xqiNINy8asF0SYWJCeYM1uSBc/xyVJX/CVRMBtZwiQAfcaiSSRmOIlpA3vYOoSTddxQVe3GH/w8exJHpp8W41Vz+T9YWflREFO5lbWeaHZmalysDBqkTtWPPHefiCwaw0CuR1Pmr6aJOb4lciunIY+JvgPLqkxPhNUkCBH5nXSFriSolbPoxhjstLULS0pVnnqH7XsBk3a7QKbCTSBM7PDJrnHeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f855a0f-602f-910d-8fd9-956b379229f3@suse.com>
Date: Fri, 4 Aug 2023 08:30:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 5/8] PPC: switch entry point annotations to common model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 5586d770-0169-415c-d8a2-08db94b44373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IY9cps9VzvlNY0zPpJCRsNSwd9y7evuPlYSh5JA5lnm+j3cCcjtgqPFH3G++IenLrEotc5BLNbrzIlbya89WPtjiXhHg2EyPmGRiDeUQ+OYfDHGjUsUmvtG8qdC9lA7cnSSeZ5sTYSPJiC3OYWwUatnxGHZ+uCCzLO2RjMc5Q+C48zRe7G8qoFT181P0+BUPU2DhxeB7qAFTVYym66cwWPUIzLhHqNROzvulL1niXVxSLqfKAzQODOD4AtEing6sVeSLW2TuPER8rlvagpeWemIwP8pJUZtvLdui0GqSzANoGdhLXglEYzk3gwTffzr9zgbsJAP024c8FH0ctSsTuIPQEo0ppew6D3qvUKz9XikJMQFzzL5r4tQQLEM8puMZ7mntm0kTOXnbm1Lsa3ln1HegiY4aVkyNADirZLfD3OSdMqn5rEjFjFzezs9x0CnevpciAP89Xr1GGJMYwkMfWUG233ld/rBTB8pDeceuo+X9HcaNH1FoKxvCUzhG0Y9dMDpkYmHlC43z92+kaOyOCL74PQPm0PwmpQS5e8pj8hE5FY3Zwmf2CVPG/prfpOT/2tL1dDh5EzbeTS+Vx4IobEcVbeklbKSo6KuLYx8HDsWktZcfA2qFRCi65wleZeA3aT9jNe5RzcVk/SNY3a9ecA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?USs1K3ZLajNXNUVPdCtYblJVTjFJd2Y0ZUJnNnVFS1k5TDd5MUxCdEVJWTBx?=
 =?utf-8?B?VXZ2cFN1bksxdjlNL0VNRHFvSEluQnk2VlRPclNkZnRLb3RkRlFXU1IvQVpH?=
 =?utf-8?B?QVhrR29KTUVpbXdNbUpIOFNvSExpRVllbzhJMDJoRE9WMTZrNmVzWFVrK2Y5?=
 =?utf-8?B?aklwS01tQzg4TTBBcTJvWTF2QXFkM1VxRjJ3YjZRdWF3ODJac0s3UzZpVEtM?=
 =?utf-8?B?V3VibER2a2F1MmVkSHBheHN4YThlMlBWdGFSZHRNQ2dCZ1VhamYwS1VvMGE1?=
 =?utf-8?B?Ty9kMUxTaWRodEV0bkRjT1ZTZnJHdURncWs1ODFQdFJ4Tkk0Skk1U1h2Q2NR?=
 =?utf-8?B?TXd4amFCVS9xd0lyd0FxUUFuUGpLK2JqQmUreFVObUR5L29BT3N3cnI4RWli?=
 =?utf-8?B?NG1LUzZuaXhzK2l5TUVEOGFEaUduWlU1MThOVmhoTkRXRjR4b01kakNnZnNq?=
 =?utf-8?B?TXc0Ykx0R2FDT2lwRVlwUE1Ed1pSZEZsOXE2NjNGMXVieE9lekRmK0dQVWRH?=
 =?utf-8?B?RFBOSEZaQ01qMWY3RGFvSG11SCtBUTJoUzQ3RGorS2FBOGFCblgwVDN2L1Aw?=
 =?utf-8?B?SnN0ZmlnRnBiZmxvUnM2TGZPMENydmZjTE9aVTUza1F3SVZvUzNZeXBpcGVk?=
 =?utf-8?B?bm1ZdGlYNzJycnltaGlWQlo5bUpCSUtXMmRhck14VjRJcS9ZRUl5d1RTNWo0?=
 =?utf-8?B?QlNHRzNLVjdIS21SN1dVQjFaR3RpOVU3L29vTERaTm5MM0Q0a2MvWTBTQzBE?=
 =?utf-8?B?QndacGgzbWY3bVo0b1NWZHI5VjJnZFhNdGtyR3crODNxeUtJUWxmdEtNSFQ4?=
 =?utf-8?B?V0JreUVpVXpKRk1OU05DS0tJQ3lZanpUbUtpNFZQTG5ENVVwUkhiY3Z1by90?=
 =?utf-8?B?dUtXZHltWlEzK0YrclNWTmhseU5xTHRmTUcrd2ttL0JVMCtvV1hhdnUvNnlW?=
 =?utf-8?B?S2lJOTVxUERUa25WdUMxUzduUGtRVjJ2enI0QXA1MC9zaVhkK1NtUkZRY05t?=
 =?utf-8?B?QnFvYkM5dVFWWndvQ3ZMUysraE5aaGFIRWxMWE1IZkg2bWVBQmpmK2NMR3pS?=
 =?utf-8?B?WEZNTndxSjdrTGVmWlIwUlZ6dFlhd1NpWm40NDhGT2lGUmxNOW9WREl6ZTV1?=
 =?utf-8?B?SGRMRWV3b3dzVU0zSEtKTzkvanZRMmFqM2xEZXVqdXVVSW96SS9QTzZxbE1q?=
 =?utf-8?B?b3MrcnZxY2g4L2xVMXEybktTdWhDVWErUFJ4WkszTEJTa3U1U1NpcklPYUVm?=
 =?utf-8?B?VkFBMkJDWkFScEVjVWl0dFN2NkVvWTVMZ0NJMkdnZFpJTGp1enNacXRQQ0Yz?=
 =?utf-8?B?WWh5SHc5MU13alVSb3JoNWs2SVZnU3dnNjhmMVprUHZycjliR3JKVS9GMEo4?=
 =?utf-8?B?cnFOOC9Obnpjak5ROXVsVUFGdVFzbWh0TEZTTlorcGJDZytMYVdTRkRmaDJ4?=
 =?utf-8?B?NFBPV3c1SUhwMzcyTEp3WnNPanFLaGRMZE5YSGwyNHdxL3VJalBic1VBaUtF?=
 =?utf-8?B?UXpNblZOMURsT1h6VllvWW5NMmNHNE9jK0JJcjQzNG43VDNuQ3Nna2swSHBM?=
 =?utf-8?B?YUVYZkF0TVRSMkRkRFRpTWlsZTVRTGFyZkhaaHBxNTRueHE0Uml5VW5XZG9U?=
 =?utf-8?B?d2ljWWtvQzhhRzFhTk1kVE10NXJCZHZJOGs3UW01SFY0ekhFMnhubFdLVFFl?=
 =?utf-8?B?SG1oUE45emlRK0dyVm5PSHBTN1NRanpqNElLVVZGVmcvTHlOaGQ3ZFI4YjZm?=
 =?utf-8?B?WWNOQTRDc2w3RFZGTjFsbE5YTnNTNXJjM1dPSllvcVoyR2MrdFhhOTZqSzJD?=
 =?utf-8?B?azNzOGFwdnlaN3NYalNQeUZBVDBtcmIrb1FTb3JtRDBLS1ZrWW50NHNvMnJx?=
 =?utf-8?B?SmhibXhaMmxkd0VudHEwQXk1d3k1S2VFa0pOeHlnczU1a095TEFuNS9ydmdr?=
 =?utf-8?B?Q09CS25HcmQrMGZUaEN6RDhLdU4ybGxIMDRWME5YYnduWVpwQThmUlNJM0Vt?=
 =?utf-8?B?dEptM3FZUFpxbHFtUWdhTDRUU2FzdW0yR1g4ODFyMlZiVTlsWHdVL0E4dmg1?=
 =?utf-8?B?OGFXWDAxN3RQdlU0UmZnb1NkR1RQems1M0MzV2JzNXZ2UzJvNmFvQ0tQQkJM?=
 =?utf-8?Q?H4cFnYWbA9K39mdAQX7f+z0Iz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5586d770-0169-415c-d8a2-08db94b44373
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:30:15.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 548XGWNPmS4WUxgWjBCr9m2i63ALLZf15s/z9SveaL5saH7UofCEGCCGwy+sX4Zp/X+r5TKBH93+UX/BUqs7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Use the generic framework in xen/linkage.h. No change in generated code
except of course the converted symbol changes to be a hidden one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Also drop #undef-s from linker script. Re-base.
v3: New.

--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_PPC_ASM_DEFNS_H
 #define _ASM_PPC_ASM_DEFNS_H
 
+#include <xen/linkage.h>
+
 /*
  * Load a 64-bit immediate value into the specified GPR.
  */
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -31,12 +31,7 @@
 
 /* Linkage for PPC */
 #ifdef __ASSEMBLY__
-#define ALIGN .p2align 2
-
-#define ENTRY(name)                                                            \
-    .globl name;                                                               \
-    ALIGN;                                                                     \
-    name:
+#define CODE_ALIGN 4
 #endif
 
 #define XEN_VIRT_START _AT(UL, 0xc000000000000000)
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -5,7 +5,7 @@
 
     .section .text.header, "ax", %progbits
 
-ENTRY(start)
+FUNC(start)
     /*
      * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
      */
@@ -36,6 +36,4 @@ ENTRY(start)
 
     /* should never return */
     trap
-
-    .size start, . - start
-    .type start, %function
+END(start)
--- a/xen/arch/ppc/ppc64/of-call.S
+++ b/xen/arch/ppc/ppc64/of-call.S
@@ -23,7 +23,7 @@
 
     .section .init.text, "ax", @progbits
 
-ENTRY(enter_of)
+FUNC(enter_of)
     mflr    %r0
     std     %r0, 16(%r1)
     stdu    %r1, -STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */
@@ -78,6 +78,4 @@ ENTRY(enter_of)
     ld      %r0, 16(%r1)
     mtlr    %r0
     blr
-
-    .size enter_of, . - enter_of
-    .type enter_of, %function
+END(enter_of)
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -1,9 +1,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 
-#undef ENTRY
-#undef ALIGN
-
 OUTPUT_ARCH(powerpc:common64)
 ENTRY(start)
 


