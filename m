Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFD7591DA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565707.884107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3jF-0002UW-Un; Wed, 19 Jul 2023 09:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565707.884107; Wed, 19 Jul 2023 09:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3jF-0002Rq-RR; Wed, 19 Jul 2023 09:44:17 +0000
Received: by outflank-mailman (input) for mailman id 565707;
 Wed, 19 Jul 2023 09:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM3jE-00020n-8K
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:44:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d28ce73c-2618-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 11:44:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Wed, 19 Jul
 2023 09:44:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:44:13 +0000
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
X-Inumbo-ID: d28ce73c-2618-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGOF+FIwUf9k7TpJvcSQwl9bFov7vXUwsNqps1W7+U/a6FKvcT1rcxqWrFhrftHlx3z0MoasJdxImVM+tvjRK3vnb4LG30uVv8arsywdPYaxQ1gUhDyZ+x9UZ1V+wpatvuHJuEt+7X7CNn7eEFsOZZaBZXRGXbSM2yJSnvGcthEPl4kb0JjUI5uYnFST8fZNPEnUePc39UJ9AgbzBIzDLlfiC4zhtriV5r5PrkHtoUVpJzJsIKCGV4gt6tv5oG71y9L5+8eXUm+4U20WpE6zf4kfOBuKLmvoduuWMYsETNYHk5W44wr+v4jkHltcdI4VzhBvoPFBaxME/48o72fMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/62dXeGLGtd8XVzqmQ/9q/ddkhQ4yGM4klh0gvZiAA=;
 b=JAkdlEm+D9XAFtTMJ5UIixH5fjHwaCmDKUpMQkGO8hXOY5Lpb7xdfKCtFi42SUMuPk88lcm14JQr31UKtPkgbsp35oqdfo32QVfteMIeGPEbyvvr6GleT3ZU2MDKnylvSWIu9CUuCwPJYSaj4xLPoAo+ZlZUbF9AXZN/XYKCjbAffP1WkXXYuObPS+G3JmVP7RmRkfaILoxhEHfGEzQkkV+EVtnJJwNOTgKlAZltihsRyj6rTnsTk0M9A6mMo1jA+UxAICmeFgcOV7xWJQerDUTPTpD4dnh3KJIB6/5984eGYidC8ss3BKyyT13+drFLUTTlVlJWtCY7OeEu0YTRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/62dXeGLGtd8XVzqmQ/9q/ddkhQ4yGM4klh0gvZiAA=;
 b=mT5JWEFLnGD34ACR1NSNuWxTKKuqoZja54gufFQRuEOD+FR1aR7jE+tE9eYpalE2Bz+YYGg0vigkcOHgIfI0gXGzIfXJpUBjHtU68BtGRrMav0fgXQGhDwbSvujtVRQa6/mVHEg/8T4iTi/VdM0F311rCmVauJL1gXgULau8KxvLWySKbfm+VHUqECx2FsJDG05gLRdldx5Wqu+ANteuvzs9NnLwRjb9yJ6OHZ964bEfKrsZlht+ptX+nOxukHoX6ondF2KiJ1NzchEnz6Smn4g7Hc1U7VzXJO/z6teh+ymmoS1nxruZmW66SQz0Vcqebm7qTYVh7/JglOumI03jag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <28a84bbd-b0c4-dd80-b9c2-59770d0f54fc@suse.com>
Date: Wed, 19 Jul 2023 11:44:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v2 2/4] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
In-Reply-To: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 849a18dc-f280-4825-f852-08db883cb596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2lPJj1tSAfbx4IG49ym4VSnueQcGFxKeYdVzr5zy6/4/k7jimk1QMcDL7r1CXX07KpN5KuXBTn5EiUm9pvXa2rVwJ6UpcVRQ0skqXUMCK0Iqq51km2SohSEjBIJu0ZyNK4qXTakDGiN1IQVDLsHFZCoQeCqJvAbZK9v6BtujS5q4/G860qRbNfbUpNXrCd3OTiku4jfmLjIi0l1zB3hSCsb0O9HEJqfl5gKXzI+IF/vmIAUJMtbIoZc+4f07DunbygTKNEglMaPLZ6dCHmsrmEUkLnYTqYpoi27KoGoXo0gmrsPTPmcH5wXE6IxQpfqpB9/yYPaEEbRtlhAZZyOPFhJSKx8C+jgRgodF20C5HQ9nll4CVM01jnBsj3WA9QXESKCTQsqzBdgnCS/UO0KsWSm4YeqkOl9Rl9ccFfWvOXuwe1BgepoITlo2PyJLfGGB5iY1afcE0Jmtw/v63dpyOYddbDV2kuW+RvguF+d34ZSItuZVojtfe2qUTxlx8ov8C+5WCDq42vTpzdUX9RX6/1xT2jKgcZjBlAn7kfbiMOhKhInG23eXboPcx1VECjuN3SU9vZF8VW5z2rNFx0v7yOjVMYkhsRvAczsYaDkMrdGLBLY2wELQ25fIgJQNSIMuEMlopad28/SgqgkAH9/IAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(31686004)(66899021)(6486002)(478600001)(54906003)(83380400001)(2616005)(36756003)(31696002)(86362001)(2906002)(26005)(6506007)(186003)(6512007)(38100700002)(6916009)(4326008)(66946007)(66556008)(66476007)(316002)(41300700001)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkxiMSt2ZURjV01rcVlIYUtjL3RpaFR5NFN5ZXlyYU8vdTVYbEsyaVdyU3ZX?=
 =?utf-8?B?UkI5Ry9TWDA2eE10a0IvK2pWQ1hBa2ptTVNNSG9PNzhqbVZUOVVndHhqTXhU?=
 =?utf-8?B?RnR3empDaVdlY0g3OHQrSE9TaVdnN0RGYk95Qk5MSFZvZm1mWGtHdi9qYjEx?=
 =?utf-8?B?R2R0Y3B6Z2JUUTYvV1oyK2xTZTlwMThWQXFySVZPNWFWdmJROCsxanJpNy8x?=
 =?utf-8?B?NHJ1K1dNQnRKa250L0hRaWdsaVZFbWNjc2d3VDgwR0JqVmU5Wm5NTFE1Vzg3?=
 =?utf-8?B?RC83NGU5LzBaQjJZcG9UOFRtY1hMazM4L1VXclE4L3UwRXUraVVEdE81NXpv?=
 =?utf-8?B?Q3hKeWhDb3NmOTFoYnRTRkdhTlNBSGNmM2Jpak9XUzhtMGtvTTd2WWl5L3Av?=
 =?utf-8?B?ZVY3VjB4a0VkUTVQbTcyMFRZN0JQSDhSVElLRkZPMzhvcVBJODA4d3dseTZ5?=
 =?utf-8?B?QkZnRlhXd1BvUllVa096YUJPS2c1bmtPTmx6R0RSWlpwdDQva0h4V1RTQUFj?=
 =?utf-8?B?WFpPN0k5dGJqeGRzM1Rwa3JIT01MSk4vTEtGQjVCdFF4SFRDZDVITXdZc2hx?=
 =?utf-8?B?MkZxSUZtQ05XT3lNZGlCdU9vTTRZQlRLMmZ6N2pJNnRDSW56ak42SmJQQUhZ?=
 =?utf-8?B?Ry95eUN2WmxNb2UySGlpVnhZdUppdWt6MkpBMS92WjcvVUJDeVkwM1hWWnVr?=
 =?utf-8?B?cCt0RzRtSldSd1dIT0lYTWNZbkI4UkE5VmZPZGYvcjN2L3ZGaTVNTUQvSW14?=
 =?utf-8?B?N2ZOTmlhR2tDcjFjSERpaHhjb2pmZDlxeHR4U2RQaksyRTZCTldaU09VdGt3?=
 =?utf-8?B?akFHWlJ2SWxiaktUUVN5ZVZEcEZSWWlzTm10ZVVYTDRTODF6ckhCQ3ZUeitO?=
 =?utf-8?B?Ny9PcUwvYjBVM1l5eThVZUhxQS9pci9WeGJydllGWmpoaVlHTzZ0dGxEbTZh?=
 =?utf-8?B?QVJQVmE3cFlxYnlzM2hhUFlkY0crY0pDM3QxdHhSZm5PUkZYQTFEQ3UzU0cv?=
 =?utf-8?B?RTFvbTB6aGI3UFQ2Z1ZxcnJKWEptSlBJanRKYW1DdjlyVWNtRHEwdEhRa0xQ?=
 =?utf-8?B?VmMveUFENG1XWjdEVGx3ZFY5WmxFcDd3MDBCTHI0cGVuOUkyNEF2M05BVGx5?=
 =?utf-8?B?Q1RaRUlvMEdkVHZnSjZ0T05zaFEwSnhqUEowK0VMMHBmS01taERPNEQySDhV?=
 =?utf-8?B?VVNSTzNXSVdSMDdsaFJoOUc4R0hYRTBBdjFWUXFsY1NEd1ZJREJsNmtaTTVs?=
 =?utf-8?B?NGFuTGE2dWNPeFVqZjhtaXZNVTduUHZlSTk2WkJncDdYRGNWTFFFY1l2WU1E?=
 =?utf-8?B?TWlrenloVUtnY3hSTXo1N3lmcW00WjMxUERZSy9rRWdzaDN0SWR4RU1zWE9o?=
 =?utf-8?B?eU9CcmFjRE5kMmZadlpnZGgwaGQ3Sldsdmw0dmI5U1hodXB6RStEMFhNc2pL?=
 =?utf-8?B?MmtmK0tBQzJ6MXlVL0VMalVITFJkajVXT0EzWWUrOHBaVGR5eTZCeERaeWha?=
 =?utf-8?B?SlFNanFiN1U3ZXN2QldKa3dpYnREem9PSlZDUW1NcVE4YTJRR0JwMk5hamJu?=
 =?utf-8?B?Z3k0bUZlRExqeXBuMDBTYTdJbzlnM2t5L25hMks1VzdIdHFvSy9HN1NRN29Y?=
 =?utf-8?B?cGx0REE1SU1ld0QwOEZNVXF6UTA1bEJQTzI3NWNxUlUwbTI2em1SaHB2cUtz?=
 =?utf-8?B?SS9lUDJGUnRNaUpMdVlSbUF6aXJvOEhMcDUwYlhJZmJNK1Z3YVJtTVVVd2Z5?=
 =?utf-8?B?TEpia1F5aFQrMUdQVHN3RnJCSnhtclJBaTlDbUIwRDNGV1dQZ3dTTnBpd3dN?=
 =?utf-8?B?Z1EvRnVmcERyaU5QYStqVXQ0UTNKK0o4Yzk3eHdrTEpnWHJCRmthYVpYd3dO?=
 =?utf-8?B?eENEazdmVWt0QXpDRXVsOE51MUxqUHowcHlGdmhjQ2VGYWlST2c2MXF5SzBM?=
 =?utf-8?B?TXZRV24zZTU5ODduSC8zYi95SGJlWVpXUUhqV0xDOU9sc0EzS1NweVhYQzF1?=
 =?utf-8?B?QStjRzFIQWN3MGlFdVYyZm8rbkROQ0cwUHRSZXBucTBJb25YUUZkTUZFUmZV?=
 =?utf-8?B?eDNmZUFhTkZpek9nSWhZTzZPSk1BengzTmhkQm1PMnp5bGJBcThUdStNekVG?=
 =?utf-8?Q?44b9yApk/wbPzCGSiEGIG7vY9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849a18dc-f280-4825-f852-08db883cb596
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:44:12.9994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp+iEE/dVvSQK2SFWRkOuifGjegMoSMYcR5f/hU6E8mBGUsuE7BFhfXCfAjR7U8WCvnFkHIEEJiaR1LofTctOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

Newer hardware offers more efficient and/or flexible and/or capable
instructions, some of which we can make good use of in the hypervisor
as well. Allow a basic way (no alternatives patching) of enabling their
use. Of course this means that hypervisors thus built won't work
anymore on older, less capable hardware.

Note that in efi_arch_cpu() the filling of 7c0 and 7d0 are forward-
looking; we only require 7b0, but we need to use cpuid_count() anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Since older compilers (apparently gcc10 / clang11 and older) won't
     recognize -march=x86-64-v2 etc, we could fall back to passing
     -mpopcnt and alike explicitly.

TBD: While the added assembly code goes strictly from the CONFIG_*
     settings, EFI code uses the compiler provided manifest constants
     where available (just like the subsequent "x86: short-circuit
     certain cpu_has_* when x86-64-v{2,3} are in effect"). While I
     generally prefer it that way, this comes with a downside: If we
     ever started to use one of the ISA extensions in assembly code
     (and then keyed to the CONFIG_* settings), things could break. I
     don't view us doing this as very likely though, as then we'd need
     to have two (or more) variants of such assembly code, which we
     would likely want to avoid. (What I'd like to avoid is using the
     compiler manifest constants in assembly code: In principle we ought
     to filter out any -march= when constructing AFLAGS, and perhaps
     at least all -m... and -f... options. Compilers might rightfully
     complain about their use as inapplicable, much like we've seen for
     -Wl,... when no linking is done.)

TBD: While we don't document most "cpuid=no-*" options (and hence imply
     their use to be unsupported), using e.g. "cpuid=no-popcnt" with a
     V2=y hypervisor clearly can't have the intended effect, and hence
     might perhaps better be flagged in some way.

TBD: v2 also includes LAHF/SAHF. Since we don't use floating point and
     hence FPU insns, we ought to be okay not explicitly checking for
     it. But there is a certain amount of risk of the compiler finding
     some "smart" use for one or both of the insns. However, if we were
     to check the feature, we'd need to account for the quirk that
     init_amd() also works around.

Whereas the baseline -> v2 step isn't much of a difference (we'll gain
more there by a subsequent patch), v2 -> v3, while presumably (or shall
I say hopefully) faster, yields an overall growth of .text size by (in
my build) about 2k. The primary reason for this appear to be conversions
of SHL-by-immediate to SHLX.

The VGA output attempt in early (MB/MB2) boot code does not appear to
work (anymore?). The serial output may work, but only if - without any
setup in Xen - both sides agree on the serial settings (baud rate etc).
Hence the feature checks added on the legacy paths are of limited use.
---
v2: Also cover XSAVE. Add early boot feature checking.

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
+	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
+	  extensions which are of no interest here.
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
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -124,6 +124,12 @@ multiboot2_header:
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2_msg:   .asciz "ERR: Not an x86-64-v2 capable CPU!"
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3_msg:   .asciz "ERR: Not an x86-64-v3 capable CPU!"
+#endif
 
         .section .init.data, "aw", @progbits
         .align 4
@@ -156,9 +162,20 @@ early_error: /* Here to improve the disa
         jmp     .Lget_vtb
 #ifdef CONFIG_REQUIRE_NX
 .Lno_nx:
+        pop     %ecx
         mov     $sym_offs(.Lno_nx_msg), %ecx
         jmp     .Lget_vtb
 #endif
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+.Lno_x86_64_v2:
+        mov     $sym_offs(.Lno_x86_64_v2_msg), %ecx
+        jmp     .Lget_vtb
+#endif
+#ifdef CONFIG_X86_64_V3
+.Lno_x86_64_v3:
+        mov     $sym_offs(.Lno_x86_64_v3_msg), %ecx
+        jmp     .Lget_vtb
+#endif
 .Lmb2_no_st:
         /*
          * Here we are on EFI platform. vga_text_buffer was zapped earlier
@@ -657,6 +674,7 @@ trampoline_setup:
         mov     $1, %eax
         cpuid
         mov     %ecx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_HYPERVISOR) + sym_esi(boot_cpu_data)
+        mov     %ecx, %edi
 
         mov     $0x80000000,%eax
         cpuid
@@ -674,6 +692,9 @@ trampoline_setup:
         bt      $cpufeat_bit(X86_FEATURE_LM),%edx
         jnc     .Lbad_cpu
 
+        /* Preserve %ecx for later use. */
+        push    %ecx
+
         /*
          * Check for NX
          *   - If Xen was compiled requiring it simply assert it's
@@ -724,6 +745,36 @@ trampoline_setup:
 .Lno_nx:
 #endif
 
+        /* Restore CPUID[80000001].ecx output. */
+        pop     %ecx
+
+#if defined(CONFIG_X86_64_V2) || defined(CONFIG_X86_64_V3)
+        mov     $cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_CX16), %eax
+        and     %edi, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_POPCNT) | cpufeat_mask(X86_FEATURE_CX16), %eax
+        jne     .Lno_x86_64_v2
+#endif
+
+#ifdef CONFIG_X86_64_V3
+        mov     $cpufeat_mask(X86_FEATURE_MOVBE) | cpufeat_mask(X86_FEATURE_XSAVE), %eax
+        and     %edi, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_MOVBE) | cpufeat_mask(X86_FEATURE_XSAVE), %eax
+        jne     .Lno_x86_64_v3
+        bt      $cpufeat_bit(X86_FEATURE_ABM), %ecx
+        jnc     .Lno_x86_64_v3
+        xor     %eax, %eax
+        cpuid
+        cmp     $7, %eax
+        jb      .Lno_x86_64_v3
+        mov     $7, %eax
+        xor     %ecx, %ecx
+        cpuid
+        mov     $cpufeat_mask(X86_FEATURE_BMI1) | cpufeat_mask(X86_FEATURE_BMI2), %eax
+        and     %ebx, %eax
+        cmp     $cpufeat_mask(X86_FEATURE_BMI1) | cpufeat_mask(X86_FEATURE_BMI2), %eax
+        jne     .Lno_x86_64_v3
+#endif
+
         /* Stash TSC to calculate a good approximation of time-since-boot */
         rdtsc
         mov     %eax,     sym_esi(boot_tsc_stamp)
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -740,29 +740,53 @@ static void __init efi_arch_handle_modul
 
 static void __init efi_arch_cpu(void)
 {
-    uint32_t eax = cpuid_eax(0x80000000);
+    uint32_t eax = cpuid_eax(0), dummy;
     uint32_t *caps = boot_cpu_data.x86_capability;
 
     boot_tsc_stamp = rdtsc();
 
-    caps[FEATURESET_1c] = cpuid_ecx(1);
+    if ( eax )
+        caps[FEATURESET_1c] = cpuid_ecx(1);
 
-    if ( (eax >> 16) == 0x8000 && eax > 0x80000000 )
-    {
-        caps[FEATURESET_e1d] = cpuid_edx(0x80000001);
-
-        /*
-         * This check purposefully doesn't use cpu_has_nx because
-         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
-         * with CONFIG_REQUIRE_NX
-         */
-        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
-             !boot_cpu_has(X86_FEATURE_NX) )
-            blexit(L"This build of Xen requires NX support");
-
-        if ( cpu_has_nx )
-            trampoline_efer |= EFER_NXE;
-    }
+    if ( eax >= 7 )
+        cpuid_count(7, 0, &dummy,
+                    &caps[FEATURESET_7b0],
+                    &caps[FEATURESET_7c0],
+                    &caps[FEATURESET_7d0]);
+
+    eax = cpuid_eax(0x80000000U);
+    if ( (eax >> 16) == 0x8000 && eax > 0x80000000U )
+        cpuid(0x80000001U, &dummy, &dummy,
+              &caps[FEATURESET_e1c], &caps[FEATURESET_e1d]);
+
+    /*
+     * Checks here purposefully don't use cpu_has_* because they bypass
+     * boot_cpu_data reads if Xen was compiled with respective CONFIG_*.
+     */
+#define CHK(ppsym, feat) do {                                        \
+        if ( IS_ENABLED(ppsym) &&                                    \
+             !boot_cpu_has(X86_FEATURE_ ## feat) )                   \
+            blexit(L"This build of Xen requires " #feat " support"); \
+    } while ( false )
+
+    CHK(CONFIG_REQUIRE_NX, NX);
+
+    /* x86-64-v2 */
+    CHK(__POPCNT__, POPCNT);
+    CHK(CONFIG_X86_64_V2, CX16);
+    CHK(CONFIG_X86_64_V3, CX16);
+
+    /* x86-64-v3 */
+    CHK(__ABM__, ABM); /* LZCNT */
+    CHK(__BMI__, BMI1);
+    CHK(__BMI2__, BMI2);
+    CHK(__MOVBE__, MOVBE);
+    CHK(__XSAVE__, XSAVE);
+
+#undef CHK
+
+    if ( cpu_has_nx )
+        trampoline_efer |= EFER_NXE;
 }
 
 static void __init efi_arch_blexit(void)


