Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C396D00F9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 12:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516572.800905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpMw-0000Ue-9T; Thu, 30 Mar 2023 10:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516572.800905; Thu, 30 Mar 2023 10:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phpMw-0000Rh-6K; Thu, 30 Mar 2023 10:18:58 +0000
Received: by outflank-mailman (input) for mailman id 516572;
 Thu, 30 Mar 2023 10:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phpMv-0000RZ-K4
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 10:18:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45c038ff-cee4-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 12:18:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7739.eurprd04.prod.outlook.com (2603:10a6:10:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 10:18:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 10:18:52 +0000
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
X-Inumbo-ID: 45c038ff-cee4-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOt9mHtuNcW/Oq+49aKOkaud4FMs5EvHi/XrcMrGboWT1+HtymlVuUD7t12bQEVx00UcvOyBTeWRSmnkw+TnlAGGr4N9QaAA9ve7dQZC7u2bFzE2xnzix+TE6Zs81S4yHEj8U36B5U/0VUUxKMc5Gh1G6DJodLgjb96fS+f0QsDgTmUAeryDckg1vPD6HNMd7YHFeG3AfYNPQxAynfY8xrWELCv6wp14Vww15YhwRhiR7E28amW9dIWPRiCusMcizIZeztDEaq7GUSi2sqEcNx8MjLS/VDZPv658SsSSS065fA2WOgGX3P1znwFmUPS47WERxW/Zso+NS37TGWUILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk+pDXofJvBMym7BUDCWXAN4ID8AtZJVus9f7/ZFRF4=;
 b=Ix8+Pa64EN8dEozmFQLQY4eGPpl1Qp8sE0En6u5OGHJA4zrLxkL5BYECJVoL0DvAgWy+q1RXUa0mfeApvU4vQCzF3QgHT7isp85dsaj5eTeY+5hKfKeSS+YVTacCYkIRm6xhZndFcCuRORem9hvoa3RErEreFvjzrnNq/LPPc0NGccP/M3xHiZ5B/ibkE5rQHtcGo9eBD29Dis75Z+D0MdDGezeXEL4ixVysi3d/W90xaUXG/hzA1owfKYPxo6+BbByvxjb9D44mn+pZhzyFVMRpUb+eDKXo12slGGx1E0uzzwIxO0fsuD3c6fid8Bk0JhpRyyafi2qg6/IG6JBSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk+pDXofJvBMym7BUDCWXAN4ID8AtZJVus9f7/ZFRF4=;
 b=2dZDXqjaZ5GjVbM3MhHCs8so7HFJIvvBXV0lY3t5XDkk6YK5DmZire0hqGSHeGOvuBwP7xj+RTNKRFlRNxsr/GSVgSyIxLqb8293zvdgtzDFJFQMbpfdJ7VfSTJnxA5vnTUdHtVPrfFc4Py5h2x+1UgCttzVZ3faMwrd5u4ee1KIMoZBY65702jBq6hpwj7OEOSdr+jhZBSoGQ1CNi6B69xIC+xawm6QL9T/KZuZQT9cxOHq7R+2eq5zkGVLDR4cxQfnWK+I8xMoPBIE34pIBnhi89S2kPms+NgpOObVV3VqZB3+yERH7VTIykwij1oXk+jGcs7s02l+rqfb7VToJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75fe2fea-1ffc-b23c-373f-10dd21fe53ff@suse.com>
Date: Thu, 30 Mar 2023 12:18:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a49408-297b-449b-a4c8-08db3108292d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1qLAAh3rNxRIDYdwiMauqKbI2J5nFrGaxXmm1lwr4kY//Ek/V/fqj9WchbeNxcVL2qSpmYWYLZSj8gWTAW4+JZT3JGqdh6SDu+rYMnU1NhWwGAbP894UaOsyesETIjWq+84sUrNtIFL/RmYQwaU7rLSdjo3mfc32KIdYDd7HMDYWcanrMYeGOrrMEwcK9xajDwJ20LRxNHD4LK1Hdw4h2nKfUMFFgYJYS4sPY7rPS7fAxiovO3zm+zaMDxfKsHOYicQYd0MP1UUVjLwRx4t/DfVkxXCuPIIfWppKsJYc5U0wWf/Mt2fSN+aeoZydu+g6/apxV+K0Lzq2rbnLrRZu7ig7xe4typUGdXow6Laf1aMeQq94kzloyx+HwGRa+N7/IGcjBodZ0ljLWfQ9y0nCILHEPU9T3UPzMeFqyt3rXGnwFbIMzTH+z1t+a3AKQYW4RTL/nQi8JP1kRfFf1MxbDgHrNRYbofbiFfq2OJr1DPJu5NS8PR0V+QWs74+VPsV6Q/CT2cvH4VRLMlouRmloGLnBC+QfNo4V15yBO3hQqJC8IManetNLeSPQrHqPgE2iZxPZzUyY3npT3czIjXdybQLstrClQoKbLC0EtgbeUOpWahgp4FRNpL/ygvwHd05Dj7RNV+YegP48EAcubCVr5Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(5660300002)(31686004)(2906002)(8676002)(4326008)(66556008)(66946007)(6512007)(66476007)(6916009)(54906003)(316002)(36756003)(6486002)(2616005)(478600001)(6506007)(26005)(53546011)(186003)(8936002)(41300700001)(86362001)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGQ5WEJXT3BLS25Gd2RscnB6VHNJZHBGYTI1S0hiTGd6VS8yRGszaW00SjNw?=
 =?utf-8?B?ZGFQSjlOTS9kYzMrdGVuWWpHMVNHVHY3OGVzd3JGWUI3SC9tSlhpUU4weEho?=
 =?utf-8?B?a2dVdHkvYXlVMWRVS2N3K3Z2dDdiY1FRK0lQTVhEWE9BMHVnZElzS0t5UFcy?=
 =?utf-8?B?MzIzcmlRVjBsalJGQ2RXTjVRa0ZJYVVUQWMyOG9LRURxd0lwaDRManN2VUkr?=
 =?utf-8?B?UUNmdW1yOG9uRXNwVlhuOGJRcnA3aVJuNFM5SnlPYkpZbzg3T0RDUFJ3eDFr?=
 =?utf-8?B?dW1FRFJTUEkxNEtETTRBTXpwNDRvdkZURG1TbEZWQ3hOcmtqMnBzVkZnendC?=
 =?utf-8?B?d2RicGlqYmd0QnF6eE5IS1dBN2VxYWxWZmFuSVJNWHk4NCt1LzV3SUM1N1pp?=
 =?utf-8?B?NmJKS2k2U0w2QWdDb2k3QTlJVkUvUE9Ddm0vTGh3ZUJPR2Uxb1JCSDI2L0o0?=
 =?utf-8?B?Qk90eVhxdFNpYm0yQnRWVGdTQ2NpbXk0RG1tVlpONlRIOTdKbmNkbm1ld0tk?=
 =?utf-8?B?RERqMlRpa3NHZVZJN1RQL0MzVFZzMHhmSmF6YlIwTDZiUHUxZ3BlOWZPVnRS?=
 =?utf-8?B?dW9zNlQxT0NNaE9MZTh0Wk9Rc0NoekJIaFBtR09waGI5eUlOWlE2d09rTWNk?=
 =?utf-8?B?RS9vS0FzWEpBV3FBQW5MNXpWOGovdWNYeldOQUFyc2JiS0xNVFc3MktOOTFq?=
 =?utf-8?B?VGtKSC9TTXZBeUtBekc3YkdyQjJaSmhhSWRIMjlraDNEOElSR1NxZk9QZGJw?=
 =?utf-8?B?RmVHVGZKdjQ1RWtkaXlyWjdKMHg4SGl5Y2dvMCs2eCtmYVFZajZGcmRSbHNo?=
 =?utf-8?B?UlRBb2VTc3QxSWRwM2hhdmJMT0tjZytkd3FsRnZ2WW5IVXljYWlZYlQ1R1l2?=
 =?utf-8?B?aEZyaWVveFhsTnNwUHg0Uk9haFA1c1lZQzAxTHIvWkRiMFV1azU5NTUra0VB?=
 =?utf-8?B?V3EwKzBKTTVOMjBBN0JxUWtqTVA3WHpGd3pGeTcwS1lMeGhBRVJROUxNRmRh?=
 =?utf-8?B?cm9ldTViMlBmQm1mWndid20xbG5QVWRNSXpWelRBYXgzR3pJSlp0NytHM2o4?=
 =?utf-8?B?ZG1kMlE5VXJCV3ptcVNzRmVKQ2JJMi9WanZKMTNhb3VucVRYZ2FxcUplS3Bj?=
 =?utf-8?B?UUdlM2pNY0Vyc3U3cm1oZEZHMEdqdDlMMHUvMU1QbmVMQjdIYVl0ck1yclNS?=
 =?utf-8?B?cmIrK2hQdmJGMy9kME5Wd1VFaDlIQjlSV1V4ay9RSDlKeVdsbmVOT3Rac0pU?=
 =?utf-8?B?VWZjajJtSDk0Um1rUWV3OE5OSmlqNEIxbXQzM1RKTy9PZmI0cnpXVEMvRTVZ?=
 =?utf-8?B?YmFuU0s3NzhydEVIajUrQ3dveEpjTEY0QkdiRzYvVnNmSmh0YUdZdk03TVNO?=
 =?utf-8?B?anhzYnFyd0s4bkFZUUZNQzNzQksrRHF4ZkhsR2VBUVNDVWQ2UU94eXFiRGsz?=
 =?utf-8?B?Y0grNGZNeEEvbTBpVzFJMmxHakZGN0VxWXhoREt3aUpXZGFWWVBmSjRFQWQ1?=
 =?utf-8?B?QnFjRklaczVab2R4MTZIMllwZTVBdk91S2lDWEZ6R2Ywb0ZMWEd0dmpIWWlk?=
 =?utf-8?B?VEV3SVlMcS9wUE0rN1JnNEMzUkFJQlhiSGUrdnZBMnBWVlNRYjBYU1grM0Qv?=
 =?utf-8?B?V0svWEViMk5NUmxGRGJOMEV2eGRqbnBIM2Zjak4zTGpLNFY3UitpaG5VcjNo?=
 =?utf-8?B?cmJkV01KU1VkNmoxbHdGbytCTi8wNWpMZUxNOG44QUpxRUFoZzRCQ0JudWpZ?=
 =?utf-8?B?aEhOeTRYVjFDTktZZVNHOUxweUJTc2VJUzhTMkVFZXd3UTZqQkJkVkp4NmFF?=
 =?utf-8?B?aDRlT3lmbFhUUHlYWTY0TGJPQXJPNU5xTDVRenIxa29Tc1pOR2JoSTdIODZn?=
 =?utf-8?B?R2psQ0MxNFVZTEFYME9BOEZTWThKSFQ5di9sTWlsMWd6dEo3Nkw5MkxlNWpV?=
 =?utf-8?B?a3VrUGQzbWNNcG4xdGVUSlZTQS9YaFNiZHJHOEhFdVJ0dkNHNGVuYzBOakJ4?=
 =?utf-8?B?OTNFZUZxZmNtdDNuVlJFOHpHK0NnOXBacnppekxsOHJGV0tQWGd0UGpLMGc2?=
 =?utf-8?B?ZG1GMW9vSXM2S0RKdjVQQUd5dlo5Z3I5dHpGY282WTVRb2FVM0MyUmFtNW90?=
 =?utf-8?Q?VlW9jQWWtnm6TmhLsdy4jufSB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a49408-297b-449b-a4c8-08db3108292d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:18:52.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pyH8DVQQ/TtR88BAq8OThIDCrZxLzctNLdp56G159KaXBX2I0Y7aFbpgjR9BHdCe/Sx8WrmbwAOPgMCHFo0KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7739

On 29.03.2023 22:51, Andrew Cooper wrote:
> tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
> to not operate on objects of differing lifetimes, so structs
> {cpuid,msr}_policy need merging and cpu_policy is the obvious name.
> 
> But this does mean that we now have
> 
>   cpu_policy->basic.$X
>   cpu_policy->feat.$Y
>   cpu_policy->arch_caps.$Z
> 
> and plenty of code now reads
> 
>   d->arch.cpu_policy->feat.$Y
> 
> instead of
> 
>   d->arch.cpuid->feat.$Y
> 
> The latter can be half-fixed with some union magic (see patch 9 commit
> message).  The former can be fixed by putting cpuid/msr infixes in cpu_policy,
> which is doable but very invasive, and would make plenty of code read
> 
>   d->arch.cpu_policy->cpuid.feat.$Y
> 
> and the two obviously shouldn't be done together.
> 
> So, RFC.  Does this code layout look ok?  If we want to make changes with
> naming, now is very much the right time to get them sorted.
> 
> Patches 1-8 are pretty ready to go.  Patch 9 is the remainder to take out the
> temporary hacks, and I'm still in the process of merging the system policy
> derivation.
> 
> Andrew Cooper (9):
>   x86: Rename struct cpu_policy to struct old_cpuid_policy
>   x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr_policy} fields

Nit: I guess the last closing brace wants moving forward a little.

>   x86: Rename struct cpuid_policy to struct cpu_policy
>   x86: Merge struct msr_policy into struct cpu_policy
>   x86: Merge the system {cpuid,msr} policy objects
>   x86: Merge a domain's {cpuid,msr} policy objects
>   x86: Merge xc_cpu_policy's cpuid and msr objects
>   x86: Drop struct old_cpu_policy

With the small comments on individual patches taken care of one way or
another, up to here:

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

>   RFC: Everything else
> 
>  tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  15 +-
>  .../fuzz/x86_instruction_emulator/fuzz-emul.c |   2 +-
>  tools/libs/guest/xg_cpuid_x86.c               |  48 +-
>  tools/libs/guest/xg_private.h                 |   5 +-
>  tools/tests/cpu-policy/test-cpu-policy.c      |  50 +-
>  tools/tests/tsx/test-tsx.c                    |  58 +-
>  tools/tests/x86_emulator/Makefile             |   2 +-
>  tools/tests/x86_emulator/test_x86_emulator.c  |   2 +-
>  tools/tests/x86_emulator/x86-emulate.c        |   2 +-
>  tools/tests/x86_emulator/x86-emulate.h        |   2 +-
>  xen/arch/x86/Makefile                         |   1 +
>  xen/arch/x86/cpu-policy.c                     |  67 +++
>  xen/arch/x86/cpu/common.c                     |   4 +-
>  xen/arch/x86/cpu/mcheck/mce_intel.c           |   2 +-
>  xen/arch/x86/cpu/vpmu_intel.c                 |   4 +-
>  xen/arch/x86/cpuid.c                          | 101 ++--
>  xen/arch/x86/domain.c                         |  18 +-
>  xen/arch/x86/domctl.c                         |  51 +-
>  xen/arch/x86/hvm/emulate.c                    |   2 +-
>  xen/arch/x86/hvm/hvm.c                        |  38 +-
>  xen/arch/x86/hvm/ioreq.c                      |   4 +-
>  xen/arch/x86/hvm/mtrr.c                       |   2 +-
>  xen/arch/x86/hvm/svm/svm.c                    |  18 +-
>  xen/arch/x86/hvm/svm/svmdebug.c               |   2 +-
>  xen/arch/x86/hvm/vlapic.c                     |   2 +-
>  xen/arch/x86/hvm/vmx/vmx.c                    |  12 +-
>  xen/arch/x86/hvm/vmx/vvmx.c                   |   2 +-
>  xen/arch/x86/include/asm/cpu-policy.h         |  18 +
>  xen/arch/x86/include/asm/cpuid.h              |  10 -
>  xen/arch/x86/include/asm/domain.h             |   4 +-
>  xen/arch/x86/include/asm/guest_pt.h           |   4 +-
>  xen/arch/x86/include/asm/msr.h                |  13 +-
>  xen/arch/x86/include/asm/paging.h             |   2 +-
>  xen/arch/x86/mm/mem_sharing.c                 |   3 +-
>  xen/arch/x86/mm/shadow/hvm.c                  |   2 +-
>  xen/arch/x86/msr.c                            |  98 +---
>  xen/arch/x86/pv/domain.c                      |   2 +-
>  xen/arch/x86/pv/emul-priv-op.c                |   6 +-
>  xen/arch/x86/pv/ro-page-fault.c               |   2 +-
>  xen/arch/x86/sysctl.c                         |  77 +--
>  xen/arch/x86/traps.c                          |   2 +-
>  xen/arch/x86/x86_emulate.c                    |   2 +-
>  xen/arch/x86/x86_emulate/x86_emulate.c        | 166 +++---
>  xen/arch/x86/x86_emulate/x86_emulate.h        |   6 +-
>  xen/arch/x86/xstate.c                         |   4 +-
>  xen/include/public/domctl.h                   |   4 +-
>  xen/include/public/sysctl.h                   |   4 +-
>  xen/include/xen/lib/x86/cpu-policy.h          | 540 +++++++++++++++++-
>  xen/include/xen/lib/x86/cpuid.h               | 475 ---------------
>  xen/include/xen/lib/x86/msr.h                 | 104 ----
>  xen/lib/x86/cpuid.c                           |  12 +-
>  xen/lib/x86/msr.c                             |   6 +-
>  xen/lib/x86/policy.c                          |   8 +-
>  53 files changed, 986 insertions(+), 1104 deletions(-)
>  create mode 100644 xen/arch/x86/cpu-policy.c
>  create mode 100644 xen/arch/x86/include/asm/cpu-policy.h
>  delete mode 100644 xen/include/xen/lib/x86/cpuid.h
>  delete mode 100644 xen/include/xen/lib/x86/msr.h
> 


