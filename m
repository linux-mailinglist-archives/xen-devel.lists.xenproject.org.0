Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27527697A64
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 12:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495858.766291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFZm-00018N-7i; Wed, 15 Feb 2023 11:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495858.766291; Wed, 15 Feb 2023 11:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSFZm-000152-4M; Wed, 15 Feb 2023 11:03:50 +0000
Received: by outflank-mailman (input) for mailman id 495858;
 Wed, 15 Feb 2023 11:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSFZk-00014w-Ep
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 11:03:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a85644f-ad20-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 12:03:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 11:03:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 11:03:16 +0000
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
X-Inumbo-ID: 6a85644f-ad20-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFco3KyyQRLQmTi3d6OvU4plBR5V/T2ZtWc9Ssgt24M4rf4yCmIIpLgMOmLKuFq+D0lUmmkTHICb1j0oJF46ZcmHPseXHGPCkoBOcFX+LbDhPkxB0Po6i7zL35keWS8ah0uqJjLqW2O+0+BAm9tslKGwi0PzpstYxcQ5vB+WS5IRkiDPJVLzD0rhbPV5XKkpc6GnZp7V6zd0G+4CfAdflY3XfCVEyhS9bXMhOOvzee49t4Bmz4szxYuNbeoe+kHRlr1ZPI6OJZhkELyIZ27P2vNfDPXOw9mHbIpqB6Yw4kmyYYybXXyQt72U5FcIezzhX7b3AaUi6odxUEHdRIIvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af/TppUQveJ+dDVFLzwK5u9KrW5Y/LaBTHeydlg9KeM=;
 b=GbOg2ZGs3sCu30jXLK3uH9uzeWZ212YsxhvUhxTOhHcmKa8Ogk0/4GzFkVZBtJSMosBZzvbJL6r+zxaRH5ZGeVoC3tUzzlIG/MUhqzLWpxMmZalExnvgcbcwXbIWFGFnzfadwnc2xshnEoirj6+HJufizda+ev7GWxtkoXnG6KRCKgGtuG04RiVodON+Ezcw3F10scJ+BBPmOLeuiVPqGZNCqnx/k3KmNejSUonV1/CxUe9z6eUErCwHOCQoJ/cHLMGj4rnt/V/76NJ8FTYEyOFfHlSTTORIRbJ089HH/t76XsN01sBlToRYouL+Yq7ISD2FYNxkwfFV2gD9liE0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af/TppUQveJ+dDVFLzwK5u9KrW5Y/LaBTHeydlg9KeM=;
 b=3+y1dKB+p1CVDADRXOZ910bXCDthKVq0lc/GFl5YM46AKEnPQWGiSDxBi2uQ2fsTMKwDHD4Koz79Wz8l+crX0JkwNtn/z5PpAEN6t1Ey2UjgmGS7rqO6nh8+1Ku71HWGB9L/wgXbafPBJBOY6OLtRdgZFq/CAtDBwzS2HJL1DnkHmVWpKfhXda21WPdUXDNRGCWEXHPu0jnh7ITj7U2ABA75ebPltKGFAcG3Bj0DVmyum3VGOkwjHWPmgswEovOTa1SmrdPwdiqpdWEzHDn0fGYKCY+UKW6LpYkkGtDqdYcnOTPS7I71HrTXBz7UgBn9vSqTKrWpZ5AMdOoIMkZXHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06cea9ac-cafd-4437-6e3e-639651a77349@suse.com>
Date: Wed, 15 Feb 2023 12:03:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 2/2] x86/mem_sharing: Add extra variable to track fork
 progress
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
 <348063358f2ded237334b3cec7498a36296fd408.1676351034.git.tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <348063358f2ded237334b3cec7498a36296fd408.1676351034.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: ab714d98-a3e1-476d-24a3-08db0f443cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jUrJc6qgFaztVPd4RQCegXD6MBpYSr5/l+wE7LOOzO+JTDewxduczUH/2tb8Twg5xBh70qrab2teE6RD66DHAwYqbxx4jYp3fHoT5uDUKJJqDKudX7nhPc0NjsNk9T9NRmStCpr3Xda+e6JSj5Ogz7P4e4mAFF4mSEd47PL1ApvzPyDcmR8ALiG2LlS/0+UklcIvz71qOVUcotDzkz72HxyCSdDBIUfgMkjyZm6tUzUzhLqwXOTqpgvOIYXeV23pH2oxny1Wf60jN1wAj5/fAJPhVJAuc/imbO1BgLhuXOg/EmRT+JemV7tKXCA29hjAkbStWlw8g0uoZ4JcYyeS3YJN73pDH+55ET+KtAzpOFU0mDC0xOPPcNFsxjoun79EjjrsP6NnDm/UCUv/z2/11MHwiTgTgHiAR3rtJFHUMx6kUBckASecMx04B8nWdrcWYpsbOvSPUVaaMArB1LAk1Kh3DisLBB2AjXtvvTenHM+nfR9mE4qhOam3X1+h5uDHef2ZvRkPBHPG6yXeSkiHArkq2z0NUY/PQQu2D4wZBa5Ezo4MJB+dshf/K+uchyKsQy/zEkg1LvjiNd+fRoNT6ix+QiTM8mi48DTgzA39WfwyvuIt5hVn09nqTxa1ccA1gWZMlpz1kBLQIjvCwF0bEoHM1wDKGW+Fqro65Mt18bWrTYRYlznHs/56b9oEqHtiPRu2IUb/fSB1oEzBsT3zscoZZYMmNzxuZv7wlLNNhP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(86362001)(83380400001)(316002)(6506007)(6512007)(6666004)(6486002)(26005)(186003)(31686004)(53546011)(31696002)(54906003)(2906002)(478600001)(2616005)(8936002)(5660300002)(4326008)(6916009)(38100700002)(66946007)(66476007)(8676002)(41300700001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJENFlWR1pPc3FWN1A3cVpTOXNMNFRUQW8zTTlPMmVEZDd1SndDYStKZmx2?=
 =?utf-8?B?MmdPSFVUeWRMM2JTTm4vT3MvNjBBU2dCMTFISnBtMzlDSXFWejZhWVJHRTk2?=
 =?utf-8?B?N25jeWNUYkV6bElxbHdjUVVZa0JLVVpPUnJEQXZ1ZWZoYWY3ZFltMVBZNjBC?=
 =?utf-8?B?TzBQVm1KQzh2R0w4bk1rSk43Mmx3TDNjRkwwVDFBcjBWeGx1dDQvRXZ4S3pB?=
 =?utf-8?B?citBWjF6WC8ydHgyS3JXakFyRHVlMVJ2eU5PZWUyejAwQ3U3akUvYTIxSGRP?=
 =?utf-8?B?azAzNFljdGlsbEJJT0M2NVBybzNjS2NSUDc4R0xmSFVCTVFjSVJqMU1uUlNs?=
 =?utf-8?B?VHJSZzZtWDRQS2xoUFkxSktjWHNxblBEc2luZVMwV3phK1UwTFBKUjgxWmFD?=
 =?utf-8?B?ak1lK2lLbzhMVWoyTm9qRk1DcDhvQ2NkY2lYTGg0WHVYdTI2UGJvQlVLWTF2?=
 =?utf-8?B?NmtWWjFxUFdNZ0JmZ3ZvRmgydzBhbVVuNkE1VU4vWGVFdWZNZTR1Ukl1b2VI?=
 =?utf-8?B?a3EwcjBNMXh1blVQUXhQNFcrMWIrMytPUHNsM05WL1ZTYjhRaGxXanFwbFVo?=
 =?utf-8?B?cVp1M2ZaK2NadlVMemlseHlzNnZnMFc2WjQvdWkxSjlyeUZnbzMwVVhCeGJM?=
 =?utf-8?B?YytSRUliZ1VrdkprS2xWUGpBanNhNGJiQmRzUk9tL3FOa3pIWi9ocHVmcXo0?=
 =?utf-8?B?K25LLzVVN2FwdjBrczN3TkhoM09xQWJMTFhOWTFwZDdDWGg0QkVocnVKSTJw?=
 =?utf-8?B?UEVYWS9yMWtoSU9yNEtWYU9YZjlWcHhUUXlTSnV5MVNXTlZFSVFoTVBjYTc5?=
 =?utf-8?B?aDI3dkNMN1dkZWpESTcrUU9PMXE0Q3NkVzBDY2hTZWdyS05lYUlwTWJDOGho?=
 =?utf-8?B?SytZcERLeHRmbzJ3VW5kZUVLSGIwYURvc1FrOTlXcTlwU3Iza3ZENys3eXlZ?=
 =?utf-8?B?VW1NdWU5cFhnb3ZneVZHa0R2WldRcElrdHRjcUM4WVFzTVYzekxLZWVxc0xv?=
 =?utf-8?B?UmhrWHRFZWk5K0FoVktKMnZFUWVQZUN3WUhndU9jZkpXa1VZaXJyZk9wMTRG?=
 =?utf-8?B?Z1hKL3dlRkFOamlld01ETndxTUZjMzUvQ1ZhZ0lzMFlwTi9GNng0NDVhL0ZY?=
 =?utf-8?B?OERyUk5LSXNSdjR5ZHhTbi9hd25LbCtZQy9DUk9Pa2J2aU43MXlpUDhMWmFT?=
 =?utf-8?B?enRCNkJnajMxK1BqUDlrZlpRejdEa2tGMndycHdtN3VDM3BzWkFlRlhXS21z?=
 =?utf-8?B?dVRWRWZCN0IxMkgxVlIrakZVME9mRzBDT3ZZVkNka0NrVlB1aDVRa0RMOFJn?=
 =?utf-8?B?SklKTmV1dVRKWWJoN0tJdjA1c2czT1hCVENxMWFpMktwbDQ0SGpJUGJlUDg1?=
 =?utf-8?B?ZkRCSUdTWXBsL1dkRVl1VFN3TWNkQTF3cDZMU01sTExzZXdaOVJ2UUlQOHU4?=
 =?utf-8?B?eDNBUGR5YmhNMDdWbEVlRkJxV3hKZ0JML3N1cUZ6eFdYdGFtWjByelFDTjZG?=
 =?utf-8?B?Z3pkQ0JUa0I4VzNhR2RiU0dxK3NNYXU0amJzeHZoWVg1NUVhYkwvbjlZbjVU?=
 =?utf-8?B?TzZ5UThqUTlLeFRzWnFpRzBDWlRheUJ0eHVGRzhpNFhiMnFuQXF0b3ZjZTBG?=
 =?utf-8?B?NDVNUDdjd3NUeVJsdnRNRmlHd1BKUTdSZkExdzJUT1EwWnQxekVMeW83MXdV?=
 =?utf-8?B?YVN1djRpUlVkVFlDTnhyOVkvMDBMQjc5VE9JSjg1ZDFpTXFKb3hnVHRSYTJ0?=
 =?utf-8?B?NjcvdzZEV3JCR0JFdGxwb2hqMlZRbGZhaUxGL2gxMHlSTUt5OGJFWjE1VFRt?=
 =?utf-8?B?WktyUCswRldDbGVENXRDZFJCTjN6NXhMZGp3U1RPalNXV21hakJpZWp6cVpQ?=
 =?utf-8?B?MWVwR05oRDNTbmxNTy96TVlKQ2dQZ3NiQkR5dzRwNk1rUFEwZytHd0xYQlZZ?=
 =?utf-8?B?cU1xSkNlSmVDWWkwZkx0UG5iOGdvVlNvV3FuRUpablIxSXpTR3lQUGpUdmlv?=
 =?utf-8?B?dTc3blRmVFU4STRjeXpOck5mT0g3MTRuMHdpQlh2c3ZnaHhXQkpIN3l3MXVM?=
 =?utf-8?B?K3dhM2tqY1g1cVljQ1RsbkdvL3g2SFN4L00wY3B0QTNVS0d4L0ZtZTJmYSts?=
 =?utf-8?Q?2extbgj3WTkIg8Mk4sCAJoFqr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab714d98-a3e1-476d-24a3-08db0f443cf2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 11:03:15.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKSQ9rGvReMysz6WGp7RSe2ziP54GB8boLgWtRi22lJJM3t1XvAUKbD0SGY3arLztBxLvaCszDfbLAv9An2/+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7790

On 14.02.2023 06:07, Tamas K Lengyel wrote:
> When VM forking is initiated a VM is not supposed to try to perform mem_sharing
> yet as the fork process hasn't completed all required steps. However, the vCPU
> bring-up paths trigger guest memory accesses that can lead to such premature
> sharing ops. However, the gating check to see whether a VM is a fork is set
> already (ie. the domain has a parent).

I find this confusing, and I had to read the patch to understand what's
meant. Since there are a total of three VMs involved here (the one
driving the fork, the one being forked, and the new clone), "a VM" is
insufficient. The sentence further reads as if that VM is performing
sharing operations on itself, which according to my understanding is
impossible.

Furthermore "the vCPU bringup paths" is also not specific enough imo.
The forked VM as well as the new clone are both paused if I'm not
mistaken, so neither can be in the process of bringing up any vCPU-s.
I assume you refer to bring_up_vcpus(), but I'm afraid I view this
function as misnamed. vCPU-s are being _created_ there, not brought up.
Furthermore there are no guest memory accesses from underneath
bring_up_vcpus(), so with those accesses you may be referring to
copy_settings() instead? Which in turn - I'm sorry for my ignorance -
raises the question why (implicit) hypervisor side accesses to guest
memory might trigger sharing: So far I was working from the assumption
that it's only control tool requests which do. Otoh you talk of
"sharing ops", which suggests it may indeed be requests coming from
the control tool. Yet that's also what invoked the request to fork,
so shouldn't it coordinate with itself and avoid issuing sharing ops
prematurely?

> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -33,6 +33,14 @@ struct mem_sharing_domain
>  {
>      bool enabled, block_interrupts;
>  
> +    /*
> +     * We need to avoid trying to nominate pages for forking until the
> +     * fork operation is completely finished. As parts of fork creation
> +     * is restartable we mark here if the process started to skip the
> +     * non-restartable portion.
> +     */
> +    bool fork_started;

"non-restartable portion" reads incorrect to me: The issue there is with
that portion being one-time initialization. I think this should also be
said this way. Furthermore (nit) it wants to be either "parts" and "are"
or "part" and "is", and I think a comma after "started" would help
readability (or else it can be read as "the process started to skip
<whatever>"). Finally maybe better "... this flag indicates that ..."
(in particular because we definitely do not mark here, but in fork()).

> @@ -1905,7 +1906,7 @@ static int fork(struct domain *cd, struct domain *d)
>          *cd->arch.cpuid = *d->arch.cpuid;
>          *cd->arch.msr = *d->arch.msr;
>          cd->vmtrace_size = d->vmtrace_size;
> -        cd->parent = d;
> +        msd->fork_started = 1;

"true" please (and "false" below).

Jan

