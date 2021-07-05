Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E227D3BB9B1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149939.277310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KPA-00051t-Bo; Mon, 05 Jul 2021 08:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149939.277310; Mon, 05 Jul 2021 08:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0KPA-0004zq-87; Mon, 05 Jul 2021 08:56:40 +0000
Received: by outflank-mailman (input) for mailman id 149939;
 Mon, 05 Jul 2021 08:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0KP9-0004zk-81
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:56:39 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7d65991-dd6e-11eb-8440-12813bfff9fa;
 Mon, 05 Jul 2021 08:56:37 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-avi9yhP5MEWRDkxYy2pj0w-1; Mon, 05 Jul 2021 10:56:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 08:56:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:56:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:56:33 +0000
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
X-Inumbo-ID: e7d65991-dd6e-11eb-8440-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625475396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0sX9UpPBwTe/WeXStrn0hiBmxMPQ2Y9eVf+kywyPpQ=;
	b=dDgOqpDtd8i1Kyld3vGYKlefHBXfBX1wLLa67qIC/ngYpyYiF9LzgGrotWNalnka8Pk00x
	A97nyPho0pJXeKr6AAwUpqFwvjzBZEoatfWpuEZZIG3HdpDAZ1gcqaFATeIOcjBk4MErwf
	57CkiVGozcBoNd9NJq0b/Qoft4qyK2I=
X-MC-Unique: avi9yhP5MEWRDkxYy2pj0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRYHgJEusGCctAee6pxQtMWmJwy1B34921t/gHVTi7PifZfwVzX4AMaHgGB5mdBx9mv0xmNkDaXyb8g42GFrVPtHVAtFMHJ0/FQeRWrcYbPUOVk0AJCfrvwE0d8ti+nlAtQ/cqQ9GzifLnjYE7zUDMlM0VVqhSzNRxbVzd5oOMyIRwdw5tVhaehHUDhPTvvqJLC6+1UBfxj0S7YIzCszJJBqpdiLdYL70I9+qDSVhsT3z9Bo8PFKpBbmQmFL3YsvWsDFcUBHiOZXqhQZk0wc6qrm5wJXNvTNjDto91pWKEXdVRAbXF/eSkf0xRUHFHxpQ22/bKLcD8gGlYBwOobmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0sX9UpPBwTe/WeXStrn0hiBmxMPQ2Y9eVf+kywyPpQ=;
 b=j/Pp5yGScaOqJrlauDCAB6BfMiySh0TifiiOFa25k/0WbJ1wxQeQX7QSLVeWNeeXRS61V3M7InZ2OUSV3U4S2JOhSWuwobyGswsaZk066Jltt2xh4RO/wlCrvzYNRG8ZH+HIrnMUIggv7ezjhv5cvBAMr/ykgOxTeWibxybsMFgKgikwGFogWFvsLjTW/5yQivWwQNXrnY8llkNFlZNCKrPKNRmlT4R6em85QQsFUbVy2KJefLnBfl8Vo2DANQ5dNH6vijKY9VDAPAMfzWAm4SlLHuqvp10hlp4YOLie+C6Ev087YOaAdgS1Jzsub8AhyLatrkXCnw+saZ7t92ZgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 2/4] xen: arm: Stop returning a bogus GFN for the
 shared info
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210703171152.15874-1-julien@xen.org>
 <20210703171152.15874-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33b32da4-2b25-1dd2-27d3-16ea73ebab48@suse.com>
Date: Mon, 5 Jul 2021 10:56:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210703171152.15874-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0d766b4-fdc9-4ac4-4243-08d93f92ca62
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445C4D33492CE761C2BEDC5B31C9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UV8wZYisAEptIfxF0NAMu1z482W16N8grrMoIrFgbJ3CoJL0QwwROWwTuW9xg8EXRyvD/GnWKpkPZScvOetZyh5mXwDqJYDAtv4nog2cZP4rhm2ygEzzr2HNtTLIWVnTgvtuN2enrTC1Crq6x5/OtjdJW0Wds695VjZMmZcsSUvgds435Wz3bOsxjZEmkIdc+Nn6pUYrVZVtWc3/3DXMZUdSUkgZB7IuwxBLN/i46l4FH3HWZD3LsuAceks9h1GE5KOfmFiasVh6AIxlD/jparQm1QG4J1RK99NchJH5+uPWXzozDAkpV08Jzl14Ey1deP2E7ojRT/bj8I8WshwoIvA0nWWH+vnCEzFUex/b80W12XXXMkmfO/Ptt5pMwv+bWtyQSiJl9ZEDqQOAiGvnCjxZeD8v7ciTHDE+M2T5LY4o89J1LeZoeXPiq96LERpz2fZUnuncYvo13AiBC9X+D81CVisFvlqIY27bcR9ah1SQ+mxkXMsh2qtmzEZ6a2K7SEQF+uk8Et5sTEKrpouDKn7aHkmNFGLu1t0nlufROlF50EyP/UcruUy375fb1n8RB048TW0sYl1oex3HMcj8uSQu2Q7/NCfkdUaRySodWwXii4II7LLTpBHOmSSWB37b+DbRFrVTVYcnUib+27S+z1ooVZ9p700Aq+ssSQ+58Frd/ykxCztY7c+XHol5qDJj3pnG1OqTAEOmJ1yur+hrWX2W2YvpH2IWaSfxl6zIB9M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(39860400002)(376002)(38100700002)(956004)(31696002)(2616005)(16576012)(2906002)(316002)(186003)(4326008)(54906003)(16526019)(478600001)(66946007)(36756003)(83380400001)(66476007)(66556008)(31686004)(8936002)(26005)(8676002)(6486002)(86362001)(53546011)(5660300002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em84R3JFeFlDZ3NMc3Qvc2FCK3RmMk1INmRrM3NZV21rVVZTQTROVk5PTVpV?=
 =?utf-8?B?azZTUVRSeHJOaVJyUjJHZXNTeTY2SXZWTEdDUW84bFNaMU1nQk5jVXM4ZFJY?=
 =?utf-8?B?MHJ0dSsrKzk3MDlMbzFyWS9VUFR6RXc4RWswN0MzMDB3cWFSS3QzVGhFZGZh?=
 =?utf-8?B?ekt4N1BVZnBveFMyYmM2MXNsYmc2eDdMR1RJdy81L0pveE9SaXpmQmxjbjc2?=
 =?utf-8?B?cVJKcVByWVNHbjFDa0prQWVvdHVmVExYVkRlaVRXbkRZa1puK3R5V1QrM21w?=
 =?utf-8?B?aVdYb3NTTFdUQ3dkZmhoWDA4dGlWdnRLLzVYdjNWU2NXY2o2UnlzRy9KeHhL?=
 =?utf-8?B?TUQrdnBiY1V1bGl6TjN4ZnNnMkp0ckkzaU9ua1FDSTRkRWIyM0I4YmtYNEFE?=
 =?utf-8?B?UnBSMWRwM01PeHpNVTFyWTJBc1B2dXVUZy9vRC8rZ0tQZ1hHWm1CWWJHREtJ?=
 =?utf-8?B?QXBTZGxZRUszZkNKZzF3azZKTUlUTEJIWUdLcHJrYVVHUHZSWi9ydjFkcEhp?=
 =?utf-8?B?U0x5cUhJSDFkWVlSMWhoN0VaYm1oTEw3bE93WTRTRkxHeCtaQU94Z3I5ZTA1?=
 =?utf-8?B?WkVCVEdBeXVpdDZKWWFpbTBLWkhiVm9UWUQxZ2c3WUhyT3dVWG9pci9HU3hu?=
 =?utf-8?B?cms4M1p5UmVWVHBLTzB1YVUrT3pLbnF4VncwYjFDZXJyYUZ1bzluVDVWMnk2?=
 =?utf-8?B?bldPOFovZkdtVlJCWDE2SGN0c21pTCtDZ2I3WFR4Y2ZIMmZnR25lTWVOQTRj?=
 =?utf-8?B?SVQ3bS9TYnk5aUwrMG1DUzBGTWJOZ09tRlFwbkgvMjN3ZEFEMnZUQmM0b0tR?=
 =?utf-8?B?cFFoRGNoVVg4K2xtV2x5bHlZY2FOWE5qWGlFKzMrYnpIblJ4ODNBcmlsN0pK?=
 =?utf-8?B?TXJOeDB1dG1jVEFjWTJ4ZkZXRVJOZSs2QWpYUExxa21NYmE4Z2FFK3QvZEMw?=
 =?utf-8?B?TkJJY3ppbGNYWWJoaVNzd2ZyTzB4UDByS25mWEpUc3cwK211VmNESjBhdkk1?=
 =?utf-8?B?UU1SUnR0MUNvN1dreDU0NEZpaU1uWWNSMmRZNUZRVmVXUk9SV3Z4em1TZ3RD?=
 =?utf-8?B?VU9xN2xKRXNzOGMyVEs4TWsvUEl1OEUwZDNWWnc2QWprS2E3bVlLV2RPaUI4?=
 =?utf-8?B?bjhsMzR2N3ZsRS9oRnBpT3d2UGRaR1lYVTFIOTAxUXlJTi9XQlRtN2NnWGRt?=
 =?utf-8?B?LzhLZE5ySUtRUzRVMFJqdHhOK3ljOUhyMXo0Yytyc3czbkRiZ2RPRkdpcy9M?=
 =?utf-8?B?YVptZll3NFNBU0oxQzg5bURRVlJCY2J6ci9pSGpmbW9Jb3BnRnVtbFpTdncr?=
 =?utf-8?B?eWFNT1A1UlRDMGZ3b2tBdlB6Qk1DRU9wZGdTUmdzY2JSMUdwK09JTVhucnBS?=
 =?utf-8?B?R1RHTENIRFI2RmsyWmN0VTg1SzcwVTdNNEtjdlNYN01uRXo1eGlkRWFaMVkw?=
 =?utf-8?B?cTY2cHByeGxDWmh4VTcwWk5OSnJHcms0KzNZcy9QbEMzS0FHNjlRZXVtaWVT?=
 =?utf-8?B?UkVKNXkweCthTzdWZlZMam1mM25GTzEra09wMjgvNkttcEFUTkFkWko3RkZo?=
 =?utf-8?B?VHVBbUZ0RFFHYTNZaU5XQjlubnVUVGg5VjlnZlpWcFpVd3lYRWwrSlVFT2JR?=
 =?utf-8?B?TDk5Q0NFb3VuekgranUybUxFTFFxaElhRWg0ZWVuSU5OVDl3N2NsSCtpejdN?=
 =?utf-8?B?TmFDeDhXQkFkNmsvd05uTzcvZ1pGVFk0S0twUm9SWjFjKzhPeGZyaEhSUm01?=
 =?utf-8?Q?pVLShz2haJ+RezAksX8OvGYTVHEE5BtKe8E+M29?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d766b4-fdc9-4ac4-4243-08d93f92ca62
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:56:34.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc4lZzJ2VVkgqQoObsxFLuDMjS3S5T5Axl3bbwCFIl8vcBNgjmjWqKaUMpl0X1JjzZj9ngGQjLQBYb1NmVReLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 03.07.2021 19:11, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> While Arm never had a M2P, the implementation of mfn_to_gfn() is pretty
> bogus as we directly return the MFN passed in parameter.
> 
> The last use of mfn_to_gfn() on Arm is in getdomaininfo(). It looks
> like this is mostly used for mapping the P2M Of PV guest. Furthermore,
> the structure on Arm doesn't seem to contain a lot of useful
> information. Therefore it is unclear whether we want to allow the
> toolstack to map it.
> 
> As there is a high change that RISC-V will not implement an M2P,
> provide a new wrapper that will by default return an invalid GFN and
> move the code to find the GFN in an x86 specific helper.
> 
> If in the future we want to map the shared info, then we should
> consider to do it using the acquire hypercall.
> 
> Note that as INVALID_GFN is unsigned long, we can't return directly
> because the value would differ between 64-bit and 32-bit. Instead,
> a fixed value needs to be introduced.
> 
> While the fixed value could be shared with other field storing a
> GFN, we unfortunately use a mix of type (unsigned long, uint64_t)
> for exposing it externally. So to avoid any misuse, it is better to
> define a fixed value for just the shared_info_gfn field.
> 
> Signed-off-by Julien Grall <julien.grall@arm.com>
> 
> ---
>     I am not comfortable with introduce a generic invalid GFN fixed
>     value because we don't use a common type. I also didn't get any
>     feedback on whether it would be acceptable to focus on one type.

It's been quite a while since the prior discussion, so "I am not
comfortable" may refer to something you do here but that you'd
prefer not to do, or something that you elected not to do because
you dislike it. Unfortunately "because we don't use a common type"
is insufficient context to tell, and hence I can't very well
support your view or object to it.

>     So the fixed value has not been changed. I think this is acceptable
>     because this a DOMCTL and therefore not stable. If someone still
>     disagree, then please provide concrete steps how to solve
>     the mixing of type.

Mixing of which types? You have explicit translation between
internal and external representation in getdomaininfo() - this
looks okay to me, fwiw.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2553,6 +2553,15 @@ void domain_pause_for_debugger(void)
>  #endif
>  }
>  
> +gfn_t arch_shared_info_gfn(const struct domain *d)
> +{
> +    gfn_t gfn = mfn_to_gfn(d, _mfn(__virt_to_mfn(d->shared_info)));

In order to be able to easily and immediately spot these once
virt_to_mfn() finally becomes a global type-safe wrapper around
__virt_to_mfn(), please retain the prior use of the not-
underscore-prefixed variant.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -64,6 +64,9 @@ config MEM_ACCESS
>  	  Framework to configure memory access types for guests and receive
>  	  related events in userspace.
>  
> +config HAS_M2P
> +	bool
> +
>  config NEEDS_LIBELF
>  	bool
>  

Stale change?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -141,6 +141,12 @@ struct xen_domctl_getdomaininfo {
>      uint64_aligned_t outstanding_pages;
>      uint64_aligned_t shr_pages;
>      uint64_aligned_t paged_pages;
> +#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
> +    /*
> +     * GFN of shared_info struct. Some architectures (e.g Arm) may not
> +     * provide a mappable address in the field. In that case, the field
> +     * will be set to XEN_INVALID_SHARED_INFO_FRAME.
> +     */
>      uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */

Since you repeat it anyway in the new comment, may I ask that you drop
the old one, thus getting rid of one more instance of "GMFN"?

> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -133,4 +133,11 @@ static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
>  
>  extern bool vmtrace_available;
>  
> +#ifndef arch_shared_info_gfn
> +static inline gfn_t arch_shared_info_gfn(const struct domain *d)
> +{
> +    return INVALID_GFN;
> +}
> +#endif

This doesn't need to live in a header, does it? I don't think there's
any remote expectation that a 2nd caller may surface.

Jan


