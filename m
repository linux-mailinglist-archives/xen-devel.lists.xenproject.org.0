Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28661ADA4B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNYS-0007xF-HD; Fri, 17 Apr 2020 09:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPNYQ-0007xA-QQ
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:44:58 +0000
X-Inumbo-ID: 1954cc96-8090-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1954cc96-8090-11ea-b58d-bc764e2007e4;
 Fri, 17 Apr 2020 09:44:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A21BAD45;
 Fri, 17 Apr 2020 09:44:56 +0000 (UTC)
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Julien Grall <julien@xen.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
 <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e1dc7fd-f780-31bc-670d-4736061f46af@suse.com>
Date: Fri, 17 Apr 2020 11:44:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
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

On 17.04.2020 10:37, Julien Grall wrote:
> On 16/04/2020 16:46, Jan Beulich wrote:
>> While it should have been this way from the beginning, not doing so will
>> become an actual problem with PVH Dom0.
> 
> I think the current code is also buggy on PV dom0 because the buffer
> is not locked in memory. So you have no promise the buffer will be
> present when calling the hypercall.

Quite possibly; I didn't looks at that aspect at all.

>> --- a/tools/libxc/xc_mem_paging.c
>> +++ b/tools/libxc/xc_mem_paging.c
>> @@ -26,15 +26,33 @@ static int xc_mem_paging_memop(xc_interf
>>                                  unsigned int op, uint64_t gfn, void *buffer)
> 
> NIT: As you switch the handle to use const, would it make to also
> make the buffer const?

A separate change, I would say, but if the tool stack maintainers
agree with doing so at the same time, I certainly can.

>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
>>    * mfn if populate was called for  gfn which was nominated but not evicted. In
>>    * this case only the p2mt needs to be forwarded.
>>    */
>> -int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
>> +int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
>> +                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
> 
> Shouldn't this technically be XEN_GUEST_HANDLE_64() to match the field?

I think an argument can be made for going either way - as a function
parameter it should have the type chosen. Do you see any (possibly
just latent) breakage from using _PARAM() rather than _64()?

Jan

