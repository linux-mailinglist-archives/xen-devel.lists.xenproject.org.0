Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4C143FD4F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 15:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218548.379036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgRsu-00040C-LL; Fri, 29 Oct 2021 13:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218548.379036; Fri, 29 Oct 2021 13:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgRsu-0003xY-IO; Fri, 29 Oct 2021 13:25:28 +0000
Received: by outflank-mailman (input) for mailman id 218548;
 Fri, 29 Oct 2021 13:25:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mgRst-0003xS-PY
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 13:25:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mgRsr-0003V6-PL; Fri, 29 Oct 2021 13:25:25 +0000
Received: from [54.239.6.188] (helo=[192.168.17.171])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mgRsr-0002sS-IQ; Fri, 29 Oct 2021 13:25:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=rTlCGHc8T5rt0QqFTbh9/k1ciodDLFsbwlS2hgNRauA=; b=fkeAMRxNuo3fao6Fnf7e0JIGNM
	gkpqG1R+hV4e5aynbyejoRlNUOdpIf2LOviRHqaGtOsA2g+4+g0KzHw4CQi9IH5KYN7wAv4cFvcyp
	yL71IY+Z7NwLdL/GufV5v0ZROLi+N3TqwwKU2ZODzQbmfoEgCQb5/7xiIIVbIHkFTI84=;
Message-ID: <4531cc8e-e7d4-2803-b4e4-06d438b98089@xen.org>
Date: Fri, 29 Oct 2021 14:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <2e198e53-e3fb-4ea6-0c44-f326b5e5f5fc@xen.org>
 <YXvBz4OdpcmVRAGM@Air-de-Roger>
 <09995bd2-0924-74bf-508f-5692b3250532@xen.org>
 <YXvVN0cecMMPdgmh@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YXvVN0cecMMPdgmh@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/10/2021 12:04, Roger Pau Monné wrote:
> Hello,

Hi Roger,

> On Fri, Oct 29, 2021 at 11:01:29AM +0100, Julien Grall wrote:
>>
>>
>> On 29/10/2021 10:41, Roger Pau Monné wrote:
>>> On Fri, Oct 29, 2021 at 09:58:55AM +0100, Julien Grall wrote:
>>>> On 29/10/2021 08:59, Roger Pau Monne wrote:
>>>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>>>> index e510395d08..f94f0f272c 100644
>>>>> --- a/xen/common/grant_table.c
>>>>> +++ b/xen/common/grant_table.c
>>>>> @@ -53,6 +53,7 @@ struct grant_table {
>>>>>         percpu_rwlock_t       lock;
>>>>>         /* Lock protecting the maptrack limit */
>>>>>         spinlock_t            maptrack_lock;
>>>>> +    unsigned int          max_version;
>>>>>         /*
>>>>>          * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
>>>>>          * values are invalid.
>>>>> @@ -1917,11 +1918,33 @@ active_alloc_failed:
>>>>>     }
>>>>>     int grant_table_init(struct domain *d, int max_grant_frames,
>>>>> -                     int max_maptrack_frames)
>>>>> +                     int max_maptrack_frames, unsigned int options)
>>>>>     {
>>>>>         struct grant_table *gt;
>>>>> +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
>>>>>         int ret = -ENOMEM;
>>>>> +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
>>>>> +        max_grant_version = opt_gnttab_max_version;
>>>>> +    if ( !max_grant_version )
>>>>> +    {
>>>>> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
>>>>> +                d);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +    if ( max_grant_version > opt_gnttab_max_version )
>>>>> +    {
>>>>> +        dprintk(XENLOG_INFO,
>>>>> +                "%pd: requested grant version (%u) greater than supported (%u)\n",
>>>>> +                d, max_grant_version, opt_gnttab_max_version);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
>>>>
>>>>   From my understanding, the limit for the grant table v1 is based on the page
>>>> granularity used and the size of the fields.
>>>>
>>>> So the limit you add is valid for 4KB but not 16KB/64KB. Therefore, I think
>>>> it would be better to use:
>>>>
>>>> 'max_page >= (1U << 32)'
>>>
>>> I'm slightly confused. Isn't Xen always using a 4KB page granularity,
>>
>> Yes. We only support 4KB today. But most of Xen is agnostic to the page
>> granularity. I have actually started to look to allow 64KB/16KB page
>> granularity for Xen on Arm in my spare time.
>>
>>> and that also applies to the grant table entries?
>> The page granularity for the hypercall interface is whatever the page
>> granularity Xen is using. So...
> 
> I've somehow assumed that the current hypercall ABI was strictly tied
> to 4KB pages, as that's for example already hardcoded in Linux
> as XEN_PAGE_SIZE.

It is a mess. Before, XEN_PAGE_SIZE was introduced, we were assuming 
that Linux and Xen were using the same page granularity.

When I introduced the support to run guest with 16KB and 64KB, then we 
decided to introduce the define. Looking back at the decision, this was 
a mistake and we should have introduced an hypercall to fetch the ABI 
granularity instead.

> 
>>>
>>> I don't think it's possible to use correctly use a 16KB or 64KB page
>>> as an entry for the grant table, as Xen assumes those to always be 4KB
>>> based.
>>
>> ... if you build Xen with 16KB, then the grant table entries will be using
>> 16KB.
>>
>> So I would like to avoid making the assumption that we are always using 4KB.
>> That said, the worse that can happen is a spurious message. So this is more
>> to get an accurate check.
> 
> I don't have strong objections to using max_page >> 32, it might even
> be clearer than checking against TB(16).
> 
> It's just that the check would be wrong if we allow Xen itself to use
> a different page size than the one used by the grant table interface
> to the guest.

With the current interface, I don't see how we can untie the hypervisor 
page granularity from the ABI.

At least on Arm, if we were going to build Xen with 64KB page size, then 
we will not be able to do mapping less than 64KB in the stage-2 
page-tables (aka HAP on x86).

This is going to require some overhaul in the ABI to untie the page 
granularity from the hypervisor one.

For now, if we were going to introduce page granularity 64KB, then we 
will automatically change the ABI to use 64KB page granularity. 
Therefore, I think the check would be suitable with the current code.

[...]

> Hm, possibly. It seems like debian-unstable arm32 gcc is building OK,
> but I've got no idea if different compiler versions could complain.

Thanks for the testing. It should be fine then. This would be a build 
failure, so it can be easily fixed afterwards if needed.

Cheers,

-- 
Julien Grall

