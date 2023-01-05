Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87065E994
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 12:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471821.731834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOAL-0000z2-7v; Thu, 05 Jan 2023 11:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471821.731834; Thu, 05 Jan 2023 11:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOAL-0000xA-56; Thu, 05 Jan 2023 11:12:09 +0000
Received: by outflank-mailman (input) for mailman id 471821;
 Thu, 05 Jan 2023 11:12:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDOAJ-0000K8-F1
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 11:12:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2087.outbound.protection.outlook.com [40.107.15.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ef8586-8ce9-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 12:12:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6929.eurprd04.prod.outlook.com (2603:10a6:208:181::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 11:12:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 11:12:04 +0000
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
X-Inumbo-ID: c8ef8586-8ce9-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyXTtLgnBsZZO9u37fZXGeTTu5JWvKD1DVDmwSnNIsJQhB4siXfK9v9Tcogv9xqtAuOJ34+E92vtmDxOo1cXP0yuIguQPvURdOmjE4EqTkJiDgYvqu+ZeL6PIfUedMqOIouLtV9Key2oj7EoCKMZbh8UbGmDN8raP3k7zcKAGMhYbs9nxJh6nST71VLKQhm1mwZfnQfTm4y9gaUlQFKoa+ecGv/jux4cmyVFNe5pkPkto2RAvnovUuynVzsU6tYFrhjiqqmYA3p9mH3JoQh29hsxMgwPcHBeTDHkVxQbI41HRxdZi9QXUiQsd0qv5DNNZLgk2PXzdYPkWaTcKd3yyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJJFY6hYgfpPLoX7W5+fl1W4cpHjk669sUfN4cB1eO4=;
 b=Gl2XsCoFZrKOoBk5spBRrAEktn0fQa577mT5Rnth1Dk6kGV6ksK+avl2viwFwl6P3ElZKsl4MZuSCjWG0Yozb7PPGsBMiGPoAV66uCe1qLMhGzmVEVXzck/Xz0t6QUTnanPEkiFjgKxhZ3beKo16vF2NheRMJ6bhGgVuFTtnB8bOB154N+daxkCHO0+ssF0yJRvuuOxUvkLxmW7astb0J5SDjZLss9JVoqRpjtwmLQi4WaJ6YNNIx4FTmxIIfBYZDyhi/zwA53l6LH8Dp3moRFyrno13sf/oxRL7WEHjPR0vojwTMy2pM4dkwqYi3g/lL2WzH917ZCi1DjHtq74zmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJJFY6hYgfpPLoX7W5+fl1W4cpHjk669sUfN4cB1eO4=;
 b=r9cAfSWtjaYlWbFUtsDO0rIgcMGtWDSdnzVedeNJEcmPFJl/IYnCluiuWlueG4j33u5CQPjW7RYLwsy12Ci2xKnsJS/2hO0onT31j2TYhfCAlQwX+Pc2bsjinKeyS7SL1+5FJ8Us0VrDyXJI+3Quwxn6CYvn+ZwBuJKpYbOoCHfO6CdOUQYO9+nIrML2Be7+U8Dke3CJu+gm3uTXEPf1o0Et9ZMwf0cAt67UhvqZJba78DkPSw1535c8TIuQjvSFB8+H4VyQluEPgoEnJ0KpVz/b1WINzX+S+YyZAEmotC26dZYasfnh35iu4iUvuRy+MNDhaeU+/DrkpmkxpCa8Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d223a0f9-6a66-8d7d-a214-51ddc24bb40f@suse.com>
Date: Thu, 5 Jan 2023 12:12:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 2/2] x86: split .fixup section with new enough gas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
In-Reply-To: <ae3f21f6-6a66-2fe5-9d4a-3f93e6dd64d7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: c7427232-bf02-40f8-a2bf-08daef0dacc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lC9rxu0veaq+jiBLxYuaD8heqYt7pi8bkfVQSigOj/ZB8x23c/gswtkVkwOdqcS6xqwV/gAh1kWxUHwlM3uUgDbLqLz+JGEm/g/JxObZ7TIau6nr95lUV8UQIf0WMfcU+pdlLqHrNj92ggQVkdGa4x/H4ZpW8S1w0alnxaBMTsAJ8XBThlATmdAj0cIxhTyu/tAiuqHNf2Xh7uO5oNjWitCezEXYmb14uU/OC7X92ppMjEyh19THOKQDxWOCtkgUrwexCMb0xsrNSF8namc2Hgm20DFUoLB9QzvEa4l0QSO6mwcF41zG+wJCPD/MmnUzDuiC77Adev8Cbvfn3rRKuGmoYcUsC8X27yp6Zru/UZd0ZSSANf9DkVYzgrOE0mQ/ow45omhfbI2sxhaWoM9EGlgO1b59+dgRigLdqKnee+8MVZ9bT/R9KG5FCOPGq1xk439o1l6h3Tf86f8MIUOf81SWZ33MDUIeyzTGBrCM1u4t663Kzf58YWjTQDVJyKa+TS/0Wp2gQRS3mGZ2DgGZmZ6AZsg/PczsKKD/JaPjfpp3J6HEa7gd6qqcL1KPj6FQ+vB6ThMh6G0Rp6BOjj73392UZpxXGeF0NwccMGvczpAVyJdZze3b8ZagE05rf8rmsLoLc+J5HwBkHisSG2tBthfhr89wrVHC/Q+SjM+ogZB12ybIxOiUuC1pGMKyUhPvZlwKb9a/gs5i6s7QRR0dXM2mXNCPIjyBCWV7i8gBwE4+07FJccqGZgj18OprApUe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199015)(31686004)(5660300002)(316002)(8676002)(54906003)(6916009)(2906002)(41300700001)(4326008)(66556008)(66476007)(8936002)(66946007)(6486002)(6506007)(478600001)(36756003)(83380400001)(186003)(86362001)(26005)(2616005)(6512007)(31696002)(38100700002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW5FME1OQ3FuMkdlOGNwY2c2MWFQNW8yUkxaMU1HWG5sRDJJK2lFblROaTBr?=
 =?utf-8?B?ZVVnb3duakVkRDFLSitlNlVkenVTcVZlR0UxdzQyUkdBRU1rZEM2eFVKUVZy?=
 =?utf-8?B?NXB3QUIwZjVnQ3ZnUjRORVhMSXVCdDFMSkRQSkdOaWZ6azlzc3NyOTFoaVc3?=
 =?utf-8?B?SE9keEppeG1wRHFRTkxDMXRkMkpYZ1I3dlRSTEQ4NWZGQWJpeFZlVGI3QWtj?=
 =?utf-8?B?bGVRbEpjc2hvVGNmRGtheFpiUmdoSVdTYjgxeEJnZGxyeWJGY01DbkdqVDF3?=
 =?utf-8?B?amkzbEQ2UHEzTE9xTkYwdkZ4QzJqN3o5S3FySmFkSFBZQzlTUWtUaVFPUnFw?=
 =?utf-8?B?VlcyakYzWHpVUVgzUDc1dTMzMTVtRzRxalNFV0RraURjOHdCcm0rY2FuN0hO?=
 =?utf-8?B?dFRWU1hKeHZmejlNY0ptdmJaZHFUWHVFanZVYkh0eEZnNmVyR3owenMxUEtt?=
 =?utf-8?B?Mno0dnM3M21QbXZxZXA2Q2JEVzd0NUwyWGQ5dGxuSnJ5UDBRbmxDTzBZNHJk?=
 =?utf-8?B?eSticjlBdTBXTGM4cFZzM0RzSEJlTnRCT0tVeVNWWTEwU0ZQRHA4ajY5M3lE?=
 =?utf-8?B?Yi9vS2tYQzZJbW9XZjlNcUtrLzlwQ3ZUZ1VWY0ZMeWJpa2FQcFp6NTVhL3Fx?=
 =?utf-8?B?RmdxTWZSVit4V2FFdVVncFViN1ZKbnU0RGVJKzFKSC93M1Bya0pTM241ZU1O?=
 =?utf-8?B?c2IxRVF4ejhWWUVLem9VU005b1l4bWpYbWhmZjZ4ekVFSS8vRjZRU3FZcFMz?=
 =?utf-8?B?KzF2VmNId09CdEgwWkdXQnJBc3hGeml6OHJGelZ0dDhFRkZrb2JXT3hJK28w?=
 =?utf-8?B?NmU1bVlCbUtTWkdjdEFGMDZmTDhLUnVxVnc3L2FIQ1NPU2JUOFNCSFhUTDQw?=
 =?utf-8?B?MUEvN015YlNPRlgxZlNQZDZua0NaTG0xajlGMzJxNVBPZWVjQndNT21RRmxu?=
 =?utf-8?B?MEgrRVZnamNLcThlR3BzWDg4VC9Cc3Q2dUVYSnorK3lFQWtCOG5JcGdoNEc3?=
 =?utf-8?B?SlM4YnpTTmZWOVdDV2tWU2l2RkpvaDlhS0lSR3orMXZjb1A2bGxGbkplU2ZH?=
 =?utf-8?B?V2E2QlhqNGhDa3Uwd0tSOHpnazJ5YkhpNlRpOUd6TDQxeFllWUdud3UrRnVm?=
 =?utf-8?B?eXBDbzllOWs3RWZLZ2NycGlMLzBNL215Uk9vVnpyWHphelpnWmVCSDZiUVJp?=
 =?utf-8?B?Z3lCMUZXNDgyRGlFUTBwYzd4bjliemFyYWxsM0xSYWFsU0FTNUdVNjU1Mk16?=
 =?utf-8?B?WHF1ZGUzV1Q2bk1mTWFwakZwZEV1L2Q0ZnNTNG5Fa2gxdUFjZzJucDJoVkRw?=
 =?utf-8?B?N0ZWZ1YvYjd0K3NmYVl0L2I1SkNCQzdmYm9XZDlDNjNRdFUzaGF4U24zU0p2?=
 =?utf-8?B?OE9ZUVlYZ1I3Nmx1a1VIVWtUSnI4N0I1Tk94U0MrN1JoTGNVNzc5TzRXbEpV?=
 =?utf-8?B?YmUzbGd3MkhHN0J1SWpJazJ0R2FwUXNRWWRqaUczSWxjRmx3SlVSYXdZcm9O?=
 =?utf-8?B?ODlzWDFYV3hxQzhwanFuQWdNNkVDMUF5TkNnZXFOSkUrRkFPbDJHRW53OThG?=
 =?utf-8?B?cXVJa0ZwLzVvdDZkdFBQNk5uREZrcytEeVRSWjYwUkh5cFNGN2xPVG4wamhN?=
 =?utf-8?B?ZkZLQngzWmRxU2VuV3NoSlVQM1lKbUhHK2lTa2dIM3U1NXE2bkNMTmtpbDZX?=
 =?utf-8?B?dThLajdzeVRRY2hFRnU1cmR6VzZtcFF1Y1dNLzdZd0Q4d0p0blZnekk0amhu?=
 =?utf-8?B?Qnh4WnZrVWFKeE4vR0JJT3YvbUdSRE5UU01DajFzR2xNVkR3bC9ZTWxJOERP?=
 =?utf-8?B?VGs3c3N3eGwvVDJvZk96L0dCWlkyOUxMTzV4Mk5iVlJYa042djljMmpxLzBP?=
 =?utf-8?B?Z2t4bHlFaERQcVFuRjE4NTNrWVU5SzI2TmV1TzlzdmQycDdNem1neFFHcGRm?=
 =?utf-8?B?dFAzUjBIYTlsRXV5LzJoTlVRem5BVG1Jb3ZCVHFFd2tOREpWQzdRdlhvSVVw?=
 =?utf-8?B?dkhtbEgydWY3ZWFKTXcrYmVpcXBSV2NNbm9rNG1LazFlQUhGYnE1c2JQa2U5?=
 =?utf-8?B?YzBkaGs1SnZyaS9FbUhLWS8rWnZ5M2h5VnF4dGxrNGlVVE5xdzl6cDFOZmg5?=
 =?utf-8?Q?kKn3C+plDyUlzhPCa6SC7RhUZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7427232-bf02-40f8-a2bf-08daef0dacc1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 11:12:04.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYs/zNKJahfOc5qL3EDW2ibHQ07ZE6zKwKZrrrrslZYiriAQh7Hseqoq2oJI8IdzYcnk0/MUltBfNdqG5klAqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6929

GNU as, as of version 2.26, allows deriving the name of a section to
switch to from the present section's name. For the replacement to occur
--sectname-subst needs to be passed to the assembler.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Similarly (and perhaps of more interest) we could split .ex_table,
allowing to reduce the number of entries to search through post-init.

--- a/Config.mk
+++ b/Config.mk
@@ -98,7 +98,7 @@ cc-option = $(shell if test -z "`echo 'v
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
 cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
 define cc-option-add-closure
-    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
+    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
         $(1) += $(3)
     endif
 endef
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -34,6 +34,9 @@ $(call as-option-add,CFLAGS,CC,\
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
 
+# Check to see whether the assmbler supports the --sectname-subst option.
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
+
 CFLAGS += -mno-red-zone -fpic
 
 # Xen doesn't use MMX or SSE interally.  If the compiler supports it, also skip
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -81,10 +81,18 @@ register unsigned long current_stack_poi
 
 /* Exception recovery code section */
 #ifdef __ASSEMBLY__
-# define _ASM_FIXUP     .pushsection .fixup, "ax", @progbits
+# ifdef HAVE_AS_SECTNAME_SUBST
+#  define _ASM_FIXUP    .pushsection .fixup%S, "ax", @progbits
+# else
+#  define _ASM_FIXUP    .pushsection .fixup, "ax", @progbits
+# endif
 # define _ASM_FIXUP_END .popsection
 #else
-# define _ASM_FIXUP     " .pushsection .fixup, \"ax\", @progbits"
+# ifdef HAVE_AS_SECTNAME_SUBST
+#  define _ASM_FIXUP    " .pushsection .fixup%%S, \"ax\", @progbits"
+# else
+#  define _ASM_FIXUP    " .pushsection .fixup, \"ax\", @progbits"
+# endif
 # define _ASM_FIXUP_END " .popsection"
 #endif
 
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -103,6 +103,12 @@ SECTIONS
        *(.text.__x86_indirect_thunk_*)
 
        *(.fixup)
+       *(.fixup.text)
+       *(.fixup.text.cold)
+       *(.fixup.text.unlikely .fixup.text.*_unlikely .fixup.text.unlikely.*)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.fixup.text.*)
+#endif
        *(.gnu.warning)
        _etext = .;             /* End of text section */
   } PHDR(text) = 0x9090
@@ -215,6 +221,8 @@ SECTIONS
        _sinittext = .;
        *(.init.text)
        *(.text.startup)
+       *(.fixup.init.text)
+       *(.fixup.text.startup)
        _einittext = .;
        /*
         * Here are the replacement instructions. The linker sticks them
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -89,7 +89,9 @@
 #define DISCARD_SECTIONS     \
   /DISCARD/ : {              \
        *(.text.exit)         \
+       *(.fixup.text.exit)   \
        *(.exit.text)         \
+       *(.fixup.exit.text)   \
        *(.exit.data)         \
        *(.exitcall.exit)     \
        *(.discard)           \


