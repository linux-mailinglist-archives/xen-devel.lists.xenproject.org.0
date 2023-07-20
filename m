Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8775B34D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566675.885823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVpa-0003c1-82; Thu, 20 Jul 2023 15:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566675.885823; Thu, 20 Jul 2023 15:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVpa-0003Zp-53; Thu, 20 Jul 2023 15:44:42 +0000
Received: by outflank-mailman (input) for mailman id 566675;
 Thu, 20 Jul 2023 15:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BeWc=DG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMVpY-0003Zh-4G
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:44:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 559bf02e-2714-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 17:44:38 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 95C4E4EE0C89;
 Thu, 20 Jul 2023 17:44:36 +0200 (CEST)
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
X-Inumbo-ID: 559bf02e-2714-11ee-b23a-6b7b168915f2
Message-ID: <a2e1fb20-ed2c-8ac1-0bc7-716e162ed582@bugseng.com>
Date: Thu, 20 Jul 2023 17:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally
 uninitialized variables
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
 <97d8a796-f790-8efc-1d89-def1f1193e61@xen.org>
 <5da7ae40-35c7-7f93-824f-42a0712cdcf1@bugseng.com>
 <9cac9bc5-ad55-3bcd-b645-a30a5b863b3f@xen.org>
 <26008624-b00c-ecd2-77e0-3f1cad63db66@bugseng.com>
 <520e15bf-05d0-5808-e318-14524ed78ab3@bugseng.com>
 <d35d95fb-f211-3d54-f26a-b57e805e4dfe@xen.org>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <d35d95fb-f211-3d54-f26a-b57e805e4dfe@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/07/23 17:39, Julien Grall wrote:
> Hi,
> 
> The e-mail is getting quite long. Can you trim the unnecessary bits when 
> replying?
>

Ok.

> On 20/07/2023 15:23, Nicola Vetrini wrote:
>>>>> The problem is that _t may be uninitialized, hence assigning its 
>>>>> address to t could be problematic.
>>>>
>>>> But the value is set right after. IOW, there is no read between. So 
>>>> how is this prob
>>>>
>>>>> Another way to address this is to initialize _t to a bad value and 
>>>>> use this variable in the body, then assign to t based on the value 
>>>>> just before returning.
>>>>
>>>> IHMO, neither solution are ideal. I think we should investigate 
>>>> whether Eclair can be improved.
>>>>
>>>> [...]
>>>>
>>>
>>> I'll see what can be done about it, I'll reply when I have an answer.
>>>
>>
>> What about this:
>>
>> -    p2m_type_t _t;
>> +    p2m_type_t _t = p2m_invalid;
>> [...]
>>       t = t ?: &_t;
>> -    *t = p2m_invalid;
>> +    *t = _t;
> 
> The resulting code is still quite confusing. I am still not quite sure 
> why ECLAIR can't understand the construct. Apologies if this was already 
> said, but this thread is getting quite long with many different issues. 
> So it is a bit difficult to navigate (which is why I suggested to split 
> and have a commit message explaining the rationale for each).
> 
> Anyway, if we can't improve Eclair, then my preference would be the 
> following:
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index de32a2d638ba..05d65db01b0c 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -496,16 +496,13 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t 
> gfn,
>       lpae_t entry, *table;
>       int rc;
>       mfn_t mfn = INVALID_MFN;
> -    p2m_type_t _t;
>       DECLARE_OFFSETS(offsets, addr);
> 
>       ASSERT(p2m_is_locked(p2m));
>       BUILD_BUG_ON(THIRD_MASK != PAGE_MASK);
> 
> -    /* Allow t to be NULL */
> -    t = t ?: &_t;
> -
> -    *t = p2m_invalid;
> +    if ( t )
> +        *t = p2m_invalid;
> 
>       if ( valid )
>           *valid = false;
> @@ -549,7 +546,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
> 
>       if ( p2m_is_valid(entry) )
>       {
> -        *t = entry.p2m.type;
> +        if ( t )
> +            *t = entry.p2m.type;
> 
>           if ( a )
>               *a = p2m_mem_access_radix_get(p2m, gfn);
> 

Ok, I'll make a separate patch.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

