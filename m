Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D778875ABD1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566522.885443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQnD-00018l-MN; Thu, 20 Jul 2023 10:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566522.885443; Thu, 20 Jul 2023 10:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQnD-00015g-JE; Thu, 20 Jul 2023 10:21:55 +0000
Received: by outflank-mailman (input) for mailman id 566522;
 Thu, 20 Jul 2023 10:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMQnB-0000Wm-TN
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:21:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e28dfa3-26e7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 12:21:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 10:21:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 10:21:49 +0000
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
X-Inumbo-ID: 3e28dfa3-26e7-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUQUR1JaDJR+P70L7t57L55CJQBIE2O7IFbNK0GbYuwH929NeKIF4HnZbItS69wNt4kvVcSELgQDVHlPsneEPG2+RVRG8qztun/wdPCYQdYp5yQPMWDOwAH9PNXYX6kts0a5ERYd2yeFtwI8yx/tAJv8Ukz5vo8hub7cWoPWM7fbDqYFjjuThvoF9+ofREwp6+63iwcRR7NpCmhDEe8/1NAvEvyj04zdxBJZmcc+HZYWNjZiJzr/RhqPVvb1mYevSCpS5qMa6yZxE29z83P7ahwFa9SMFrPjywPXPTDQPf9fvsk/jelc/ij/7YlXlXazsOzmmPjYHIJjQwwuU35Aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVosn8KbbEh8shoZ5dipkNuZa/OiREsGX1tv/RMnen0=;
 b=Sx24rBSqyUci/EdSejpihaR4ExArYhPEGdhmItt0+6biVW55Prb64YKCQ4noHnWhe6BBWNAPnYrlXo2++8vvIqdJrN86m5Sa9cEyH9+Z+iraCWn4jqc1Fa5KJTlooTNpHH+NXMJ2GUZoQtBwtuOQ6RnyNi+tV7M5/L4SUGvs32AF4eKm+j3jvfN0BvhmrQlp6UowVSjDkXMYG5jaISp1DxpM7HaXDB3sCUztt3nAignpmrXWV+pWVTMzcF2qPJjdh9mBVwC/2iC/ZtNQOBH3gEfF7eeMrbUAUgQtLNKsnER5LIiP80WJ4yf/qUr6M54I0mFvktj55/0/JBZ1lScS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVosn8KbbEh8shoZ5dipkNuZa/OiREsGX1tv/RMnen0=;
 b=bkbpzu9qXCqcs2+1gaK2ibLcM/Rq944Fm6+VleCQtrV4QPO0iOcp2zhykGJaDpw7Gnn7r3YbOluQy03lawgb5hyocD8tUQ3g/1LdFT2BlzOYZeTUbaHYhylcdCnpaJaxZIfr6RCRSI+rHBDRjvTcpR04eT7HqnUYOMqHIp2yPdZ3P44Ko+s7VP5Q2+lVgCb+rU74WaFKUDX59bPJW/Jhy5/OtGSyoRMneFL6nNPi2QE0oGeoQyIQc+JSeZR+eF653IisOSJ1LB6E9kxVcuL/JmpwuBe+o8GlxWoHVXvHfFEwe9R3nR5YIInJb+z0uFqW4lH7JEa3GoZ6FW96amstug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f80d9124-4ff5-3553-7ccc-9a6c2205ff6f@suse.com>
Date: Thu, 20 Jul 2023 12:21:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/4] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <dace10da-f108-fbe5-da4f-0e4497f512d9@suse.com>
 <28a84bbd-b0c4-dd80-b9c2-59770d0f54fc@suse.com>
 <bb671300-543f-3754-b428-73b91ae321a5@citrix.com>
 <b4559e5d-9736-af7f-bc0b-130a9b391b69@suse.com>
In-Reply-To: <b4559e5d-9736-af7f-bc0b-130a9b391b69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: adbb1e37-27a4-491b-6cbf-08db890b20e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D/w5w5UKZj0ixeiolNitjUd2/Ntasay6oVLI/Mc4QFaA9v6PfXnA+tSVkd8VO4/EI1A+Q8FOBEkslC8yFOCMztlPvwQBHbonq/+q/j2creZjIMHdjj4znCc3xnR7JrerW84SO7Qwvce8MToiOHe1YuB9oyDDXgDayGVMr66lkCL6838Ul5apgSlHli9K3GjHdDhXjmWvF3Seo9s9CbCSQszB5mMrZqHD8eFPAzIpjaUctlB09g/yXY16jk94hWX0A1Iry4bxTVmxgRVYht5nA9NKqueY1TXMz1Csxw8BYIbAYGYhbycLUZW7u1UVasoffh0R6LNtKJGbzAv3lh70qfBRXifmw1y2+b4i7r+Ypc+Ca0Et7cFG8nndCUuPAQ8cyXRM6pFXFkdWBhy1A4+m0Fb55sl1OhY9kds5GNuiQVWctKHgT7vIqHvLYrXYdA4pDIguGVdUX1tQ7+Iz2tDSCvp3Oq59EOf7SG1CTr0R7GZG9R1YJx+xMtOR0ckVHgSIA76u6fXoTCd/1/g3Xb1TiUM4tNGiOC33zAxTjYjZpp/7Ei/b0yMGqwL5cQKhQrjHrpnlL8AE3LmdHn8GyD+G3ovHqK0iqKVqDiP2aMdIy6gDgm+VeDGCnyrtPaQwbTvKLHgeRc8+cj7QJhPig7qT/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(66476007)(6916009)(66556008)(66946007)(4326008)(54906003)(41300700001)(2906002)(316002)(66899021)(8676002)(5660300002)(8936002)(31686004)(478600001)(6666004)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(83380400001)(36756003)(53546011)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXlGTkVtRDlrclBUNVdaZXZiK0FZUXVCMExLWGV4REs5RlQ1SUJhSW5CeThQ?=
 =?utf-8?B?c1JyWTNHK1UvSEt4ZEJzMUhRcG53N3h1Ulo0TzhCdXZXNEd4azZ6QUhYMXd5?=
 =?utf-8?B?T3NsUnNvV0xTbjE3MG9sY2thNDAzTVFuYTZPc29lOXFYdnBXRzZ2b0VWUENX?=
 =?utf-8?B?dTJIVDU5MmxDWVNkRGRCSUF1MHpEekovdFh5YTd2WUlWWXFyVmgwV1VITFlF?=
 =?utf-8?B?QS93RklrTlpYN2trRUJFM1VGLzRkSTNrRlEvNld4dHF4eWJOVmwrVk1wRWJZ?=
 =?utf-8?B?YnZaU0t5U3JtMnpvdkpqMjNNZTljZ0N0Nnl5K1JJMlNham03QzRCb1ZLSTNx?=
 =?utf-8?B?RDA5V2hnV0NuRCtiOXVBbkxSeno3NkdEZ3Z2N2xOekFPRXZYRzJkbTZPeUpN?=
 =?utf-8?B?R1lkcUF2bTl3bDF5dlVSVFlZT2l5dG1lb0RsU2tZbGhaWDNrc1kwY0c3WUNL?=
 =?utf-8?B?c2hnaWE2clNCVGY2K3BseVJWa1czNzFZRUkvWWxEZFk1ZGlhSG94cHdIR0xw?=
 =?utf-8?B?eU1QVGYrWVlwdExxdVFxY3Q1MkozbTZCdWZ4WDdWVThEandxRENRRHovd3lx?=
 =?utf-8?B?a0crMlF0TTNJWWRlYzdwSFF4QVVFWng5ZDNQTzJyZll4aDhxTjFuSVVwOVVM?=
 =?utf-8?B?UjhzSHIvdHg1NlBxZnhaMWtXVGtWM0tNUmxLOXVIV2cyUklLcXJPK3ByU01v?=
 =?utf-8?B?OGMxR04xc0RUcVJ2OGRKb01LQzhpdmpTVzBUS0JsV2pDS2xpUHhXeHdBcU41?=
 =?utf-8?B?aFBPNHFYK3FmYWFaSUI4Um0zUkp1aURGclB2VkhlZUpkVGJQaXNDcFVWd1hi?=
 =?utf-8?B?NnB4SnFyZDIxS2RsdGcveDIrdVdRUFJIemYyQ1VxWEhxaDhLcTBabnpJQWNM?=
 =?utf-8?B?NTE4L2hnb3lDSlZuZzIyd3E3R3dHYlJKM2J0akxiRDF0aDJ1c0hqVVRkZTFj?=
 =?utf-8?B?Q2NucjJ5Q29maG9mMytmckpOUDFsUXA5akdGNU5OT0ZPNmZCSHBsSm9RQ1dh?=
 =?utf-8?B?MnNSQVM0czAyYmVBcXZTaGwrRlloWGlHdm8ycmd3TmtsTmcwZndFaVI2NEtR?=
 =?utf-8?B?b1NCQ2FyTHVQNmJYZTBMUTlyUE9RSTAzRFRBR3N6Mnl3UW5COCtMd1pzTmNa?=
 =?utf-8?B?U0VXZEkxZ0V5d3F5V2VrZGtNMTFYc1ljYUxBeS9mSVNGbGdMdURPRW9WMFlk?=
 =?utf-8?B?RkRxMlY5bUVudVFGYjMvam1hcmJ2MjdGK2VpdUlIZ25yTHhhZUE1REs4WndG?=
 =?utf-8?B?ZFJ0ekhLZGIxajJuVUV0ZDhhWTIzT0NSbHlLbUNPbmdVOGM2dzEyZko3L1Vt?=
 =?utf-8?B?Q0JacDhYQm8wU0txSEFlRWdJcW5TbFA5OFlxMXpSc0diR05UNDNpb1d0V2Ft?=
 =?utf-8?B?OXFuZHFDQ3BwWEhmUDFzUG1sTXhHcFh3MVRIaXc4bGFkQVZvSTh4OERyNFd5?=
 =?utf-8?B?UDFsRm5HNENYc3czWUtNNG1WR3hkNFYwcnFYd3lpSnZnV0FxdmdvV2JubFdx?=
 =?utf-8?B?dXR0cjVoSngzTVNMa2VLMVJGaEJ4V3NKczl6eU0wektoZm5nRE44SnhSRjhW?=
 =?utf-8?B?WlVvRUJVTW5GdCtHT1p6UGk4RVN2azF6TTUrS3hUcVpXWmw0VGEyaWgwTnZo?=
 =?utf-8?B?YWU4V2phL203MjcwV1A3RlpCVEI1Y2tDMzJLakF1OHBoMlo1TDRzQmlFbDhi?=
 =?utf-8?B?MmwxcklRaHJDRmVYamlpOGgzZGtpMUR3cHYvVS95dVZXVjF5T2IvSENXZ3Ay?=
 =?utf-8?B?dHVvNVFqZmtXWkt6UmZyZXBZRXZOb0V2cENrMUVMRmUxYmlieTRDbmtZVGYw?=
 =?utf-8?B?UmtweE1PUm9FcjRkbUFwUGw5VEgwQUlnb2tzblovVW9KdE81R0VKZFoyTHZQ?=
 =?utf-8?B?VUsrTXFYRmdoU2l2bjVmblBndHZxSEptWVI4SGFhSDBhSzU2SmZ5ZFNMdHg5?=
 =?utf-8?B?dWlzVUJZUDQxTnlIK21PYnB0VUx6YnMxS2tPem1XcWZtT04yOUMyRWRja2E2?=
 =?utf-8?B?cXhJMjFCeTA5dVRKbExOTjAyMXNodGFxQjd3dlJwSW5KY3JRRVNSN0IyMnhr?=
 =?utf-8?B?Q2twR0J0eDcrUEdzMzBXaWZva1A0Qmh3Tzl1MXRqZkpoQUR4MWlYc0NBVGVz?=
 =?utf-8?Q?vFBiYqMR+cS7LC5giMB/6NA01?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbb1e37-27a4-491b-6cbf-08db890b20e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 10:21:49.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwVUf88ErLOElH7HXhkfwvdbP8/x2ygwaAKvXe4LvztLDigMRKbfM2AwPXswCCd6q1Lb7nR4g9xkG0JFiFUnxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8833

On 19.07.2023 14:28, Jan Beulich wrote:
> On 19.07.2023 12:04, Andrew Cooper wrote:
>> On 19/07/2023 10:44 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -118,6 +118,36 @@ config HVM
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> +choice
>>> +	prompt "base psABI level"
>>> +	default X86_64_BASELINE
>>> +	help
>>> +	  The psABI defines 4 levels of ISA extension sets as a coarse granular
>>> +	  way of identifying advanced functionality that would be uniformly
>>> +	  available in respectively newer hardware.  While v4 is not really of
>>> +	  interest for Xen, the others can be selected here, making the
>>> +	  resulting Xen no longer work on older hardware.  This option won't
>>> +	  have any effect if the toolchain doesn't support the distinction.
>>> +
>>> +	  If unsure, stick to the default.
>>> +
>>> +config X86_64_BASELINE
>>> +	bool "baseline"
>>> +
>>> +config X86_64_V2
>>> +	bool "v2"
>>> +	help
>>> +	  This enables POPCNT and CX16, besides other extensions which are of
>>> +	  no interest here.
>>> +
>>> +config X86_64_V3
>>> +	bool "v3"
>>> +	help
>>> +	  This enables BMI, BMI2, LZCNT, MOVBE, and XSAVE, besides other
>>> +	  extensions which are of no interest here.
>>> +
>>> +endchoice
>>> +
>>>  config XEN_SHSTK
>>>  	bool "Supervisor Shadow Stacks"
>>>  	depends on HAS_AS_CET_SS
>>> --- a/xen/arch/x86/arch.mk
>>> +++ b/xen/arch/x86/arch.mk
>>> @@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
>>>  # the SSE setup for variadic function calls.
>>>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>>>  
>>> +# Enable the selected baseline ABI, if supported by the compiler.
>>> +CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
>>> +CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)
>>
>> I know we're having severe disagreements over Kconfig compiler checking,
>> but this patch cannot cannot go in in this form.
>>
>> You're asking the user unconditionally for the psABI level, then
>> ignoring the answer on toolchains which don't understand it.
>>
>> The makefile needs to be unconditional, and the Kconfig options need to
>> depend on suitable toolchain support.  This is the only way we don't get
>> a false statement written into the .config, and embedded in hypfs.
> 
> I was tempted to base this on "x86: convert CET tool chain feature checks
> to mixed Kconfig/Makefile model", but then it likely wouldn't have stood
> a chance to go in either. The technical issues aside that need solving in
> that other patch, I still haven't had any feedback on the conceptual
> aspects. Yet as said in other contexts, without having the conceptual
> side (largely) settled, there's no incentive for me to invest time in
> dealing with the technical issues (which surely are solvable).
> 
> When raising this aspect, did you pay attention to the first of the TBDs
> in the patch? If we were to force build errors (for no real reason, see
> below), we should first try those fallbacks, to limit the possible
> damage. As mentioned there, support for these -march= forms isn't all
> that old.
> 
> As to forcing build errors in the first place, that goes against the
> intentions with the mixed Kconfig / Makefile checking model. There we
> would only issue warnings. Albeit as mentioned in that patch, that's up
> for discussion, and a majority may view things differently than I do.
> Especially here there's no reason to outright fail builds, though:
> .config / hypfs wouldn't really state anything wrong - the binary merely
> wouldn't make use of newer insns despite being permitted to.

In an attempt to fit both your and my expectations, what about another
prereq patch along the lines of the below one, of course then accompanied
by adjustments to this patch (to first try the fallback mentioned, and
then complain - as configured - if that's also not successful)?

Cc-ing other people as well which would be Cc-ed on an eventual proper
submission.

Jan

build: permit Kconfig control over how to deal with unsatisfiable choices

Some options we allow the build admin to select may require new enough
tool chain components to fulfill (partly or entirely). Provide yet
another control to pick what action to take at the end of the build
process - be silent about this, warn, or fail the build.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This may not be fine grained enough: Optimization settings (like added
by "x86: allow Kconfig control over psABI level") may want dealing with
differently than security relevant ones (like XEN_SHSTK or XEN_IBT).

Whether to do this uniformly at the end of the build is up for
discussion: In the "warn" case we will want the resulting output late,
so it is more likely to be noticed. In the "fail build" case though we
may want the failure to occur early.

--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -64,6 +64,25 @@ config UNSUPPORTED
 	  preview features as defined by SUPPORT.md. (Note that if an option
 	  doesn't depend on UNSUPPORTED it doesn't imply that is supported.)
 
+choice
+	prompt "How to deal with settings which cannot be satisified"
+	default UNSATISFIED_WARNING
+	help
+	  Some selectable options may depend on e.g. tool chain functionality.
+	  Select here how to deal with such when actually building a such
+	  configured hypervisor.
+
+config UNSATISFIED_SILENT
+	bool "silent"
+
+config UNSATISFIED_WARNING
+	bool "emit warnings"
+
+config UNSATISFIED_ERROR
+	bool "fail the build"
+
+endchoice
+
 config LTO
 	bool "Link Time Optimisation"
 	depends on BROKEN
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -588,6 +588,10 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) include
 	$(Q)$(MAKE) $(build)=. arch/$(SRCARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
+ifneq ($(CONFIG_UNSATISFIED_SILENT),y)
+	$(Q)$(if $(strip $(XEN_CONFIG_UNSATISFIED)),$(MAKE),:) \
+	    $(build)=. 'XEN_CONFIG_UNSATISFIED=$(XEN_CONFIG_UNSATISFIED)' check_unsatisfied
+endif
 
 SUBDIRS = xsm arch common crypto drivers lib test
 define all_sources
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -88,3 +88,11 @@ targets += prelink.o
 
 $(TARGET): prelink.o FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH) $@
+
+PHONY += check_unsatisfied
+check_unsatisfied:
+	$(Q): $(if $(filter y,$(CONFIG_UNSATISFIED_WARNING)), \
+	           $(warning The following selections could not be satisfied:), \
+	           $(shell echo 'The following selections could not be satisfied:' >&2)) \
+	      $(foreach c,$(sort $(XEN_CONFIG_UNSATISFIED)),$(shell echo ' - CONFIG_$c' >&2)) \
+	      $(if $(filter y,$(CONFIG_UNSATISFIED_ERROR)),$(error Failing build))


