Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9E1B02E2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 09:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQQoq-0000iX-NF; Mon, 20 Apr 2020 07:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/8R=6E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQQop-0000iS-Dt
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 07:26:15 +0000
X-Inumbo-ID: 34a9cb28-82d8-11ea-9038-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34a9cb28-82d8-11ea-9038-12813bfff9fa;
 Mon, 20 Apr 2020 07:26:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4295FAEF9;
 Mon, 20 Apr 2020 07:26:08 +0000 (UTC)
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Julien Grall <julien@xen.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
 <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
 <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <802bfbad-a0d7-8d7a-716d-76f0b83c5707@suse.com>
Date: Mon, 20 Apr 2020 09:26:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 19:13, Julien Grall wrote:
> On 17/04/2020 10:44, Jan Beulich wrote:
>> On 17.04.2020 10:37, Julien Grall wrote:
>>> On 16/04/2020 16:46, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/mm/p2m.c
>>>> +++ b/xen/arch/x86/mm/p2m.c
>>>> @@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
>>>>     * mfn if populate was called for  gfn which was nominated but not evicted. In
>>>>     * this case only the p2mt needs to be forwarded.
>>>>     */
>>>> -int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
>>>> +int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
>>>> +                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
>>>
>>> Shouldn't this technically be XEN_GUEST_HANDLE_64() to match the field?
>>
>> I think an argument can be made for going either way - as a function
>> parameter it should have the type chosen. Do you see any (possibly
>> just latent) breakage from using _PARAM() rather than _64()?
> I know they are the same on x86, but from an abstract PoV they are fundamentally different.
> 
> XEN_GUEST_HANDLE_PARAM() represents a guest pointer, when pased as an
> hypercall argument.
> 
> XEN_GUEST_HANDLE() represents a guest pointer, when passed as a field
> in a struct in memory.
> 
> In this case, the guest pointer was part of a structure. So I think
> you want to use XEN_GUEST_HANDLE().

Hmm, looks like I was confused about what the two mean. So far I was
under the impression that _PARAM() was to be used for function
parameters in general, not just hypercall ones. While the text near
the macro definitions is quite clear in this regard, I'm afraid
Stefano's original series (first and foremost commit abf06ea91d12's
playing with e.g. handle_iomem_range()) was rather confusing than
helpful - it looks to me as if quite a bit of the "casting" could
actually be dropped (I'll see about doing some cleanup there). Plus
I'm afraid other mixing of plain vs param has been introduced on
x86, at least for dm.c:track_dirty_vram()'s calls to
{hap,shadow}_track_dirty_vram(); this is just the first instance
I've found - there may be more.

> FWIW, the different matters on Arm. Although, it looks like the
> compiler will not warn you if you are using the wrong handler :(.

I find this highly suspicious, but can't check myself until back
in the office - these are distinct compound types after all, so
this shouldn't just be a warning, but an error. Or did you merely
mean there's no warning on x86?

Jan

