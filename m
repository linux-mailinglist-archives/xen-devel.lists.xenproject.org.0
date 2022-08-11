Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6158FBFE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384526.619915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM75V-0003hp-RR; Thu, 11 Aug 2022 12:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384526.619915; Thu, 11 Aug 2022 12:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM75V-0003fo-Ng; Thu, 11 Aug 2022 12:14:57 +0000
Received: by outflank-mailman (input) for mailman id 384526;
 Thu, 11 Aug 2022 12:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WeOc=YP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oM75U-0003fg-3p
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:14:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cfeff3b-196f-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:14:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4855.eurprd04.prod.outlook.com (2603:10a6:20b:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Thu, 11 Aug
 2022 12:14:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 11 Aug 2022
 12:14:54 +0000
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
X-Inumbo-ID: 2cfeff3b-196f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOOXpVApNrSgBgt9wbX9F+zJeswgqm5hA/hF9kWYbaEe2PFszQHz6KSMXPH+5DhqvKCCTGwiKvpoP5L+ImMfzuRMstZ5eqiOBeBu2BWqUVKwolzgUVOpKnV4YObrCNdLqGFOCsT3y8anCczjs8X50tOQwAzCfucZRh691Mr7BpZ/yKQXU8NJYjp16BVTPvTwgBLcYgkx1R5UCPzR+rw0fxMhy1wj29L4wmAWvFiyjurf9Y/dtAI15a1Rt2T8CpHBlTsdjTB0VW23Dn7O3EJnQB8MOpgD81BRqy1nlR6YxuYPL81GOrOrEunuxX4TNOxCFbk770pVKrlCERcKkwha7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyFc4NWRO6qB3BSVKcXz9B1gIArA808DxqvfItKNDBs=;
 b=F2t3wC1XbqJ1OSxSD13NQ//7wnzFIec6gcklexFfWGATSkel1Sw/TYEVhj2YBXI8A5X4jxTc6TESEdMoAwplbb11oAKfv9W9KYiNvx55RBoATelMQ2ef1waHC+eliR8H0XS+NB3sjGGTRN+jCWJqK30ZCuUge/Xu7xAaQkhw3thJvyB7WCc6/sMJBEsBNEmDoKW1HcPTzjxaXYtlycxqtV3+x58BhPZPU+BvOyH5ENAnAyOJdnbwS+m6jsYKSSSje688RA9it1jrkcUNbuAkliUBgNRyRTUgUwRclKubE+gEcKVQJjV0wZqt2H+B/b6o/K1Y5mW9cxwBHMxAmpgqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyFc4NWRO6qB3BSVKcXz9B1gIArA808DxqvfItKNDBs=;
 b=uwoY7eIHpuOcgyEgyS1tTdNhEeZBTtj9WfEsb3YNuHoUUfQ+A6yUajnKX9jmOGglgaRuQS+noe4DA79oqYDmaoBzcXG8mDM4YJzXsA3qZAF5v2gLPBizAOF8HVOB6QGNMIQtTKVe6AXEzVOwhisj64Sy3iM4pf74r4P/+1rKNFfuu0jFfG7QRXIiUG19mRk9Tfu8dhddGXrP8OV97DLkSBi+kLS+h2e5zPpwgF9vLoAAtqmmz4aUUJOLJOEeIels2u5+AyvPELYwGxTViteb578wkMVaB8ST8WUHW+IkE3FZw2wb5BLRLuvJEUVFqTp4isd3qWeU0x5a2PY7k6Ob5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdaf00fc-d0ca-988f-565a-1fef3ae203e5@suse.com>
Date: Thu, 11 Aug 2022 14:14:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] config/x86: tidy {Free,Open}BSD LDFLAGS_DIRECT handling
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0746.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82cbebd3-1df4-4125-c921-08da7b9318fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB4855:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IR6nLaXsZuW/KN/lgoRkuZL+p2CiIGRyeZSGlczlnqKC/q+AApONZuZ+3nz1vvfUyJ3Zl96XByaUXo9onE34lajIxlPPl1wA5pgZZ5fCSx8Uz2mTFp7aE3USitLq9mRExERrwKilI4YfOGcFS85C7JtyqCkmQ8/iV1bLr2/CxjRHWs3KMYmm4Z3wZJGGLXTtAV2oMi+lnfkrBrOLQkv6vlIqRIYozF9rtKmrw2L7CsoUIIZUxn4Wu2E7ysQaqWXYnUMoP3LQL9zT9GkqHXOiljFN9t5ok6+A0i39OG4F1X9Badt8O34nwoSTOWxaQjWEqV9cOhqrWuyo/eohSqUVTMo1vaZNCay7ZJewm8oJgFVBMryyHpGQgwTUNv47lEyrxxVYAi6J5V/zm6w2Mi0LAXsh/7GJwJoe7IcZnZBeQQLlxqT2MS2azGURd/q2MAE/wkvRMqNxlaocR2fjsn81c5DJISQ/HqYtsYVHidLC62xl3ZllAO+G44JWGc337cLlA1h10zVlXWurmb+d0kJmEpAAlFPvZ3slMifo7ZxEevQQBb6ndzzHf7tdX+VVBHw+XXEN8VMFONI/MwyhZ3vMSInDT4xbVbMmlraQYObhLT7jwSIN9pB/xUjjHh0YeGZTE7vcxhLU4VJzAxGofUQqJjCNA/+eSUmupqdM7UeHSVB5MwP+1qe26CBVwjbla5CgX6/R7AdZqXIGYANaKGF3/jebyLVT6jTKX9CmPPXQ7Iy/r/cYCzIleGJ1NLtcPl/LGI9JFyFRU+8+9y0us5B27PT2f59GsHY76oDskZhuUhpv1fK/MSZpnumuWIkNqvcgrkR2GzuZv9CEzC7YV2chTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(366004)(346002)(316002)(54906003)(6916009)(6486002)(41300700001)(8676002)(478600001)(2906002)(4326008)(8936002)(66476007)(66556008)(5660300002)(66946007)(38100700002)(36756003)(186003)(2616005)(6506007)(26005)(31696002)(86362001)(6666004)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmduOFg4TjNoME14aGNjVS94dFBRdVdwaGxHbnlXWnhxeTcyZ0MrZFVaYW9X?=
 =?utf-8?B?QitDSmJCd2RGZXFXd3JiU1I3dnRoakRSTTFYdld3Wm1Na2NBdDlhZE1lUlMr?=
 =?utf-8?B?OGwwVTVOTWFzVFBabFVQcUJMVTNGc1QwZ0lPRjJidmtKZ0dLa1BRa2RzSWtN?=
 =?utf-8?B?ck1Yc0VZOXFWNTVPallyR2djUEdtQkF0QVJQaFhOc3IvR0lNdGJaMUV6Mkc4?=
 =?utf-8?B?ZHdscTRoUWJ0cnhFbXkyckRrMUdDTE5mTEZMTlBUdU5WMUNjZ1pPaEZTTjlx?=
 =?utf-8?B?aVJpMnpodnMyMnJiZ2tFMUUrbUt6ajY0NFlxZUJ6dWpZSGpLY3RKOGdEQ1lP?=
 =?utf-8?B?aU1XNkwrYjk3K0FpVXA2MHNQRTZLcWFIRkk5UCs4R05HVWp0SlBrOXVnaWJJ?=
 =?utf-8?B?TzVHREFtekJiSUs5K2RuT3JseFVzVS9HTTIwVm9UYmw5M1R1VjkxRllicE9h?=
 =?utf-8?B?UjlsS0RXUUlKaklsMXVQV29JS3hNbytPc3lqK1FCZHJNSVlBaDAyZm1rdzQx?=
 =?utf-8?B?SWZlUllwSngxUE9YRTJ1VEJicGtNVDVyZWFXTlhPRUEyMTJJV3lZVzdlSnZm?=
 =?utf-8?B?SDFFOWpUWUVwUSthRkZLalIwOHlZYXlHb1ovZlNyNG03Qy91MElEaHRzRUNj?=
 =?utf-8?B?d3lnclN0TDNCTXBTRDRNQ0dZd3FYaEpYMnVqaG0wbUdRVXNnR1FqejdhZzd5?=
 =?utf-8?B?aU94YlVZc2ZULzVSZUlJWDdkQXU0VThrSERCbTZNbFpUbjViSjdhMjlhTGgz?=
 =?utf-8?B?SDJPMnpLZHByVGNLaUdUaDJuWEFhVUxRQmxBVi80OGc0YTBIR0hkdVFMRUwr?=
 =?utf-8?B?VE9Qd0E2cllYYitFNzdrdWxvMXEzRTBmM0xNNFExb2pBVVpCN2VWOWRiallq?=
 =?utf-8?B?Vk82L081dXExR1FSd0ZjT3lHajZDSldaRVAxaUpZbm5uZ2IrczdWOUdLRFRs?=
 =?utf-8?B?Wld2aGZEZlljOVhjeVZyaXFEN3N6RlBiQndzbENWeS9MTkJ5ZHF6SHFtWU16?=
 =?utf-8?B?WWJVelRvSDNicDBaQnE0QlJsVzBtaGxuMjlydVh1dnQwVHNNQ2t4YkFQSkpz?=
 =?utf-8?B?a0tWQW5jalZqYTRHWnR5ZThXbC9aOWlQdlZLMXNMcVBMMm5hRXAxVlF5SFVj?=
 =?utf-8?B?dWF5MzVtTFNBQ3JBeXA4SXowMm5nT1BuTHc3dDBmNTZQQndZSGtseWh6NGVF?=
 =?utf-8?B?WlJXekd1eFlubTNIVE5wQWJMWnNJTTliWHJOeWw3N1VmRGFTQWdvWGRMVDlQ?=
 =?utf-8?B?RmY1dTdDcmk3RFFQeUYvcFZDMS9NTS9iRXdQZlZxaUtiL2VvbElCQ2xXdFMx?=
 =?utf-8?B?QkFCRXZyL3hhSkdwUWg2T2pCRzFiS0VpU05vOUcvOUliZFZhTnFQamM4eUFQ?=
 =?utf-8?B?NHZ1eVBJUXpsMDZRNktGTy9yZFo3Y3lUZmxaMUJEdlB1VDFVeHhHMkYzZVV1?=
 =?utf-8?B?QUxML1gyMHJsZ0dYQmc4SHFVSTlxYndyKzhDdEYrSEF6Tjl0M2dXWm9Qd1FM?=
 =?utf-8?B?N1BSc3VGUnVFNm9qakxFVVNORkdWY2RZQjZ5RndkWHpINXlGNWRpOUVkSzE1?=
 =?utf-8?B?djQvU3RJNlZIUEt5MWJUYVRBUmgrb2NJaHRvZGJJUDVESVo0WUp3UDN2bnZn?=
 =?utf-8?B?SDNwd1l1R0dRaVd1R0FQckJnaEt0cW1PNVhpRXZQRGNsbDg5NnBubisxV2s0?=
 =?utf-8?B?SHJ4ME41Ky9SOUFXNzc4dWJmeWhGYnhqZWhQUTRqTzRMSDFrcmtFY3IvUFR1?=
 =?utf-8?B?V2tsOU1sbktUU1Z0UTA4WjhmaE1GWmw3dWlkK1FMb0xrbVRwa3VaN2Jwd3Yy?=
 =?utf-8?B?Ym1MK3IyaWtHOGZjcUhUR2RjbEF6alNNUTZESjViTjI5N2JuZFlkMGJpbjZO?=
 =?utf-8?B?dHRsREMyUERzbDc0MWVVQWVpbC9EZDZFUFprZ1AxUlpPT0RDMTRSRjNkZnZM?=
 =?utf-8?B?eHorUGd6eEk3My9iZm9ibXhsOXgzRmRRM2RVRkU4L1JPeWc5eElyZVN5Rzhx?=
 =?utf-8?B?NWpLM3lCa0hMeHF0VFcvK0hzaVJSWCt5cE10SkpEYkNrTHNkdVk2UlJGai8r?=
 =?utf-8?B?dEY3TVl3S2VwZ3FNQ3pJUjAxd3M3TzU2OWJHYWN4S1pLU3RGblBSdDlCRHRi?=
 =?utf-8?Q?PKbf6YVGeWBKQHwdxh3hB+NWq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cbebd3-1df4-4125-c921-08da7b9318fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:14:53.9346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b0xJktd5b1TLEwOuiB/qN9rpSHFw0Ms59jBPoV3pXPpNrUF1Tde79IieAy7tHJisTtXn0d9+HxSmCd2050iWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4855

It's not clear why for x86-64 a different approach was used than the
(shorter) one x86-32 has been using. Move the LDFLAGS_DIRECT_*BSD
setting to the respective OS files and reuse x86-32's approach for
x86-64.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was actually inclined to go further and rename the variable(s) as
well, to e.g. XEN_ELF_SUB_FLAVOR, at the same time eliminating the
indirection via $(XEN_OS).

--- a/config/FreeBSD.mk
+++ b/config/FreeBSD.mk
@@ -1,5 +1,7 @@
 include $(XEN_ROOT)/config/StdGNU.mk
 
+LDFLAGS_DIRECT_FreeBSD = _fbsd
+
 # No wget on FreeBSD base system
 WGET = ftp
 PKG_INSTALLDIR = ${prefix}/libdata/pkgconfig
--- a/config/OpenBSD.mk
+++ b/config/OpenBSD.mk
@@ -1 +1,3 @@
 include $(XEN_ROOT)/config/StdGNU.mk
+
+LDFLAGS_DIRECT_OpenBSD = _obsd
--- a/config/x86_32.mk
+++ b/config/x86_32.mk
@@ -8,8 +8,6 @@ CONFIG_XCUTILS := y
 CFLAGS += -m32 -march=i686
 
 # Use only if calling $(LD) directly.
-LDFLAGS_DIRECT_OpenBSD = _obsd
-LDFLAGS_DIRECT_FreeBSD = _fbsd
 LDFLAGS_DIRECT += -melf_i386$(LDFLAGS_DIRECT_$(XEN_OS))
 
 IOEMU_CPU_ARCH ?= i386
--- a/config/x86_64.mk
+++ b/config/x86_64.mk
@@ -14,14 +14,6 @@ SunOS_LIBDIR = $(SunOS_LIBDIR_x86_64)
 EFI_DIR ?= /usr/lib64/efi
 
 # Use only if calling $(LD) directly.
-ifeq ($(XEN_OS),OpenBSD)
-LDFLAGS_DIRECT += -melf_x86_64_obsd
-else
-ifeq ($(XEN_OS),FreeBSD)
-LDFLAGS_DIRECT += -melf_x86_64_fbsd
-else
-LDFLAGS_DIRECT += -melf_x86_64
-endif
-endif
+LDFLAGS_DIRECT += -melf_x86_64$(LDFLAGS_DIRECT_$(XEN_OS))
 
 IOEMU_CPU_ARCH ?= x86_64

