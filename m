Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FB51AE370
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:13:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUYh-00074f-0O; Fri, 17 Apr 2020 17:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygtx=6B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPUYf-00074a-VH
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:13:42 +0000
X-Inumbo-ID: c8ebe78c-80ce-11ea-8d59-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8ebe78c-80ce-11ea-8d59-12813bfff9fa;
 Fri, 17 Apr 2020 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D8VN3PW81jkZ4glUrbi6ljPgP5CasHxtokngXuueBhs=; b=y9AGmDgJl4w/qtdvWxdSyatUtG
 6QO5w4PsNYyCXyBexTt0QoPYspFrP1GxjERggjrZ7aYxgsNJUz3iMzqOA33VMrVovR1dpGhy7qux3
 AeP96Y5LGmVEpoU8ztlPh6GA+HKU4gC4a1eJgFAY9iqVHG5mK4QXw8ckcvXsd2Tt/r+I=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPUYe-0003W3-2G; Fri, 17 Apr 2020 17:13:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPUYd-00079Q-Qs; Fri, 17 Apr 2020 17:13:39 +0000
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Jan Beulich <jbeulich@suse.com>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
 <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <80621ca8-6c08-2868-ada6-bf0ef41fc699@xen.org>
Date: Fri, 17 Apr 2020 18:13:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 17/04/2020 10:44, Jan Beulich wrote:
> On 17.04.2020 10:37, Julien Grall wrote:
>> On 16/04/2020 16:46, Jan Beulich wrote:
>>> While it should have been this way from the beginning, not doing so will
>>> become an actual problem with PVH Dom0.
>>
>> I think the current code is also buggy on PV dom0 because the buffer
>> is not locked in memory. So you have no promise the buffer will be
>> present when calling the hypercall.
> 
> Quite possibly; I didn't looks at that aspect at all.
> 
>>> --- a/tools/libxc/xc_mem_paging.c
>>> +++ b/tools/libxc/xc_mem_paging.c
>>> @@ -26,15 +26,33 @@ static int xc_mem_paging_memop(xc_interf
>>>                                   unsigned int op, uint64_t gfn, void *buffer)
>>
>> NIT: As you switch the handle to use const, would it make to also
>> make the buffer const?
> 
> A separate change, I would say, but if the tool stack maintainers
> agree with doing so at the same time, I certainly can.

Ok.

> 
>>> --- a/xen/arch/x86/mm/p2m.c
>>> +++ b/xen/arch/x86/mm/p2m.c
>>> @@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
>>>     * mfn if populate was called for  gfn which was nominated but not evicted. In
>>>     * this case only the p2mt needs to be forwarded.
>>>     */
>>> -int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
>>> +int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
>>> +                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
>>
>> Shouldn't this technically be XEN_GUEST_HANDLE_64() to match the field?
> 
> I think an argument can be made for going either way - as a function
> parameter it should have the type chosen. Do you see any (possibly
> just latent) breakage from using _PARAM() rather than _64()?
I know they are the same on x86, but from an abstract PoV they are 
fundamentally different.

XEN_GUEST_HANDLE_PARAM() represents a guest pointer, when pased as an 
hypercall argument.

XEN_GUEST_HANDLE() represents a guest pointer, when passed as a field in 
a struct in memory.

In this case, the guest pointer was part of a structure. So I think you 
want to use XEN_GUEST_HANDLE().

FWIW, the different matters on Arm. Although, it looks like the compiler 
will not warn you if you are using the wrong handler :(.

Cheers,

-- 
Julien Grall

