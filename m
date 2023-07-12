Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE924750858
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 14:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562452.879119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ2b-0002vw-5w; Wed, 12 Jul 2023 12:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562452.879119; Wed, 12 Jul 2023 12:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZ2b-0002tj-2K; Wed, 12 Jul 2023 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 562452;
 Wed, 12 Jul 2023 12:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZ2Z-0002td-Su
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 12:33:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe13::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c6580c5-20b0-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 14:33:53 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS4PR04MB9292.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 12:33:51 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 12:33:51 +0000
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
X-Inumbo-ID: 5c6580c5-20b0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjkcbXJKpkJgADoQrPWMuRUJjgUDSQTxUcVZCAfFcSAioOvD0DXcSGPkki6dkfmixbttxclxA+NcxJDtkluo64pAT7v1eV1Zj4Rs9pswk0n84Wbvlq1d7FyhqWTTSWMSqXEibRnal1OMI21kcJj0lEhrPn+xdpQZcgbTGbdNLHwRLaNL5vSNx0D/N4r0vDsBUHYdIiJfdTQO37ZKuT3siNBp9EsA7JWUK7uCzaMccy3I64mk1Z9vzSwYxfz9LKZnpAk5XbP+t/4n1q6diIBbMSyK8/77bCNd3Tz4rr15vAmHwaVo7Da/n9FGyEzvQJU9LlK2y6zRlQ+Umq+Yc8iA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtLOHvDW3yXb0XGX8XzAuCLdaHStzU+kOEDq0XjqWuA=;
 b=I4fKpzesTseIoyK38wJ4GmMgVt7S8m0EN1FiBcaGCfkrdme32hxC16SxWzVC52T2Pw0Eb6HwKNG+3PSnZqfGuHD1EieoiePMnccfRG2epW0VCbK+OA3wMSwCP04bk62ZmFc1U04dMZjmSk/4okQ/OkPwRBpfvB28RfEt62p+rN/X53Rx74z407JwymWHE9rvexKewdA1o6rpTMFn/mNgR24ez2kB2kIR/Lj+HqbIbfKLEaUSj/kkGVoq6wMTzeEyLy9qw9xxkfHW4URJhV4Oz+op9aM/LJCnzggAeOdekElklz8NeG43JOSgX8p2t7AwRy84oVCrgiFQEu16XgOLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtLOHvDW3yXb0XGX8XzAuCLdaHStzU+kOEDq0XjqWuA=;
 b=oqlTc+fin4OP8CvpFNUXlGbx4eELx5eNb/lzUcIuWlKFiPbhpRho5qhM/UPbmiZwgmuncaPlp3F44p8Gj7yU483/4GvaWp0QwNSobomhvPOeGJ5U5N0+dAh2NFu30ecAc1SdgHw3GqVc234GMobCiFcJDXW9r2TK9Mwxm2ZRf11r2L9FbmUM+qAsjkP7P1Otzx4Q/y8B/s24xphlQ1z7dX6H5z9vCh9a9qPWt/zUDvbbFGOfPfbeC1SkCEpSMXmOBOPm5Lji+O8H4z+94T/dAmxJpLnrbhfuCqP33c+m4VsIRDPd0BBtvuGZNcs58Rxgmvvz8GLvLHjzyx/a1aOnKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
Date: Wed, 12 Jul 2023 14:33:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH 1/3] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
In-Reply-To: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS4PR04MB9292:EE_
X-MS-Office365-Filtering-Correlation-Id: f46273bf-9082-4e09-b993-08db82d43f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDLpCWTtimiydtP2txdryUMtLZG6UC8YLtyg8tJizd8AW2UAz8cUAGBUmRfN1qmP/Z83NEcsqua8m64AJ/pniwvpAYEm4BleINJ2GRLODevHiAJ19J0v4okArk/hbkwcIuEyHI3jnwR2NVbITECjM90mdL9wRa9/bNuCIiIMJphp8raET0cOBtHwewmRjuhjlMLWnojxkvWO7QwWb3KiBtI6Yge6lTkKLEjH5RFx1ICuCQqNKqRm6NeujPivN8pVBG0q0wD84sVKsbilZ4vEc/XtB1eTfEFpwka5r2yAHmqA/6472xZlP9KSwRfS/vaXSAYa7f7VL/7ASdy8e1rCSdxvZJBTlURwUFBI8fthfY4zElyKQIifmO6E6bwsaNkSep1GroZPx38sapNtatW4S+j2FsqEA6bEBsPM7KA1a/ef2yMaWAIAUfB/10jGR3N6eA3THMILRqv1jgVJek9lfUCGLriVkClHP/pyVGfjS/gQg54fuVVqwyjHlZlf26JgTv/hf5GN1JTVckcSl84ebD63UDWZH9vtM+3ht7cJ2p4fuhjlZnFc/kUCVBjwzSc0EsayxGevsrFTHLJqGU7wmY/TOPeGXPrb6i1CPq26rFzs97feydkSwkQYK0AUbehPB8+THNndApqBHGcFtriIbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(2616005)(2906002)(66556008)(6486002)(66476007)(4326008)(316002)(66946007)(83380400001)(54906003)(6916009)(478600001)(26005)(8676002)(186003)(6512007)(5660300002)(6506007)(41300700001)(8936002)(38100700002)(86362001)(36756003)(31696002)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjFSenpJaS9zMjZCTTlPSWp4VDYyN0dtaUoxUUFZQmNhWHBNQjZiTTF2czFL?=
 =?utf-8?B?azljOCtLN2RnaldZR2N2L2czQnl1bTlxTmM4L3hOUU9ORTYyaWpqRHdpTlZi?=
 =?utf-8?B?bnBGN1VrOUdWVERZVndTMjJlbnI1Nm5XOHpyeit5MnpOQm1SU0JFVFhOSE85?=
 =?utf-8?B?MWdyeG11cE82aXJkVStJaGxOMjFSQkZNdllxcWpSZFY1a0FhVEhVWWtVQ1hy?=
 =?utf-8?B?NWMvTUZPalhWUTFLeVBPQVNHVlBrcWNGSFR4U0pXVnFKTmRGVXM4cmJydlBP?=
 =?utf-8?B?dSsybmd2d2JZSWt3VFhuRHdpSkZBcXhaQktYVTBBSVZYUDNScUhiWnc0YWJE?=
 =?utf-8?B?cHhsTGZUd0psYkpvNFI4c2FyTXIxRzZVeE9yTTNvWmQxUWRValJ6RXQ2UWVo?=
 =?utf-8?B?ekZMMkFiRWg2cUpRS0I2RVRaUnJqa0lyT2dKWGtRais2b0taaXRZZTRkcG5O?=
 =?utf-8?B?RG9LV3dWek5PaHhPSC9objFPalZMdytPUXMzQkNCRWhWVG9uSkJpNDVJWWVZ?=
 =?utf-8?B?dHFLeGg0Ukd0d0I1SlFHWTF6V29JSk93TCsxTHA4eGhxcFJyenVZa3hwYklR?=
 =?utf-8?B?T25hNkJzQXhzRVg5RUtwQmFhNFFXMGYxekdyLzE0YXRqR3JQWENNN0FrR2Jo?=
 =?utf-8?B?QVpHRVpFdGNtTkx3OTlvNSt1bER4d1VXenl3a0N0dTRQZ0ZEanYvTXZPeWV4?=
 =?utf-8?B?MnJ4aURpZVJlVXpFOEN0QVJ5dGxEcWQ2ZGpUV2hRa2UrcXlxb2lwQzliMm9z?=
 =?utf-8?B?ajBIaisyajBVL09PK3MwWEJwS3MvUzFzeFJjcjBKUHdZSFhId2hrazlyaVcy?=
 =?utf-8?B?ZG9lQTdnNVRxT3YvUmF6S3k3UlJBTE9vSTloN25yQVoyOE5UaVZVRFJ6ZlJh?=
 =?utf-8?B?Q2xSaWozV0xQUnFoc3pQejR6MHQ1V0g4WWE4Umdlb2QzSFowMmprR2NaN08w?=
 =?utf-8?B?ZGdnR0NWRXRzRFY3RHVaTkNqOW9ybDA0NWNrVmk5RTVpcUZ3dEZwTXpKdWh3?=
 =?utf-8?B?VzNPeitrZ3dhTnhjaHdjYnVlRWQzS0U1VXkxS1liZ1NSVXZ5TTVLbVE3VEZZ?=
 =?utf-8?B?VEphMnBEb2l3UVF4V1BrbFlzWTdhWnJMbm5KRWFmTWpORU5NWnFYQTRMZVNp?=
 =?utf-8?B?THA4NGRBQWtOTThwSW1KbG5MTG5ZQXlPMURCV0xvMWVxUWRFaVJJK21QOUw4?=
 =?utf-8?B?YlpRWUZZTm0yelZkZWRjeC9EQXhLcDluTmM1SHlTbmViYS9qcStTYWlKajYv?=
 =?utf-8?B?eGgwTlNxM2VmRklpbHhvNFlkWVoyekF5UXpNdEcrc1dydEdqR3pqaU04VTRm?=
 =?utf-8?B?ZHpLS1lGOC9MYTMxL2ZraUl1VDFqOXpzczZHa1IxYUV1T2tHeVNGKzhxNXJ2?=
 =?utf-8?B?UDNXK2ZGaFpHb213bS9tZjB0NnMxdFFVTTlkeFZ2RCtlQXE1djh4cTQ3Vmhn?=
 =?utf-8?B?UUI2R2J6SmZMRElJVUgxZHlieC9HeTVzTGF2ekhKcW5CclBEeWdGR2x5VGlB?=
 =?utf-8?B?Y3E1YzlHQ2oybEMyQ1pIenFhdUVyT1FqdTNtKzBER1BoK2ZSUmxnQTVhYTVR?=
 =?utf-8?B?My94RFRqd0RqRlNVL2dzUStqenVPV2V6RFU1OFlVYUFjODZIZGdlTDJwTXBr?=
 =?utf-8?B?dklLRkpmSGliNjRMWE1Wd2IvczMvMVg1VXhQVWxFbTl2QTE4aHdheXhKYlJS?=
 =?utf-8?B?amwxL29JT05NblR0Z0ppd0FMN2ZvcjVCcXFMLzBLOU12dHVjSFpkd29Md1hl?=
 =?utf-8?B?ajN4a2NkZjBpdVZ2Rk1JQ3lDd1I5b2d6NUlUV2xrRVJjclRKYXczQ0cyUVhB?=
 =?utf-8?B?NGdxSVBvU1JWeWJGZXdiN2d4M0d5dXhCU1J0OThOYWRsUVZERXBTeG9pczFs?=
 =?utf-8?B?cVlSWEVLalhXVlZjaHhJZGVZK3lZYjYrZFBYM2pMSHRGVFc5QjNVRkEwUHdB?=
 =?utf-8?B?cHJDNlpLVEIxRGtzUjYrSjA4clR3WXozbWprSEdTYWlBVkNPRUlkR0dKOTdt?=
 =?utf-8?B?UHlRbzFqMHRRdFl0Wmk2d2p2WSt3YUJLU2NkbFIrbThyZTVEVWpIMUsxUjdC?=
 =?utf-8?B?aUxFZEN0U0hjM1R4V2JGNExOL05veFRPUWdraEZuMFA2L2h1ajR1WG43L0JQ?=
 =?utf-8?Q?7rPjCgln7s0ju+L/ndJOHXZKw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46273bf-9082-4e09-b993-08db82d43f84
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 12:33:51.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61l5IlMj2cDt8JatQ54Tl9TDHvXLi6OTP6REw24xvbgrHhy5Oy9oZMExn5j5UZ1zDjrLn/+k/qoOW21WKo/AmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9292

Newer hardware offers more efficient and/or flexible and/or capable
instructions, some of which we can make good use of in the hypervisor
as well. Allow a basic way (no alternatives patching) of enabling their
use. Of course this means that hypervisors thus built won't work
anymore on older, less capable hardware.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Should we, just like for NX, add an early check in assembly code,
     to have a "clean" failure rather than a random crash?

Whereas the baseline -> v2 step isn't much of a difference (we'll gain
more there by a subsequent patch), v2 -> v3, while presumably (or shall
I say hopefully) faster, yields an overall growth of .text size by (in
my build) about 2k. The primary reason for this appear to be conversions
of SHL-by-immediate to SHLX.

--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -118,6 +118,36 @@ config HVM
 
 	  If unsure, say Y.
 
+choice
+	prompt "base psABI level"
+	default X86_64_BASELINE
+	help
+	  The psABI defines 4 levels of ISA extension sets as a coarse granular
+	  way of identifying advanced functionality that would be uniformly
+	  available in respectively newer hardware.  While v4 is not really of
+	  interest for Xen, the others can be selected here, making the
+	  resulting Xen no longer work on older hardware.  This option won't
+	  have any effect if the toolchain doesn't support the distinction.
+
+	  If unsure, stick to the default.
+
+config X86_64_BASELINE
+	bool "baseline"
+
+config X86_64_V2
+	bool "v2"
+	help
+	  This enables POPCNT and CX16, besides other extensions which are of
+	  no interest here.
+
+config X86_64_V3
+	bool "v3"
+	help
+	  This enables BMI, BMI2, LZCNT, and MOVBE, besides other extensions
+	  which are of no interest here.
+
+endchoice
+
 config XEN_SHSTK
 	bool "Supervisor Shadow Stacks"
 	depends on HAS_AS_CET_SS
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
 # the SSE setup for variadic function calls.
 CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
 
+# Enable the selected baseline ABI, if supported by the compiler.
+CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
+CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)
+
 ifeq ($(CONFIG_INDIRECT_THUNK),y)
 # Compile with gcc thunk-extern, indirect-branch-register if available.
 CFLAGS-$(CONFIG_CC_IS_GCC) += -mindirect-branch=thunk-extern


