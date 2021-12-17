Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C7478DD5
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 15:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248681.428936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEHT-0002bs-7W; Fri, 17 Dec 2021 14:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248681.428936; Fri, 17 Dec 2021 14:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEHT-0002ZN-4T; Fri, 17 Dec 2021 14:32:19 +0000
Received: by outflank-mailman (input) for mailman id 248681;
 Fri, 17 Dec 2021 14:32:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myEHR-0002ZF-1g
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 14:32:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEHQ-0004pK-1Y; Fri, 17 Dec 2021 14:32:16 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myEHP-0006ul-Qb; Fri, 17 Dec 2021 14:32:15 +0000
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
	bh=9VH/9nmlB4Q+cyXAeg+bYjc0+mIFUQZWDLjdYR2MDvM=; b=YYT2ca54LMSXk2kNMVcfSn3tZU
	VdoXaCqktMf6RUnCWp1Xk26cCupIKvFVYK8RTZzjXT422ebzdC0L4lWGr9UeqD6RpCjKhjEKfh9Ck
	cQw+g0ZQ1c4q4+pwBvmayqLD/1qrMtp00Nqk/+8RRCa0KgxhIT4z9tvL7mocpNE6ldQ8=;
Message-ID: <5270d46a-a1ce-e361-dfeb-54408e9ba6f0@xen.org>
Date: Fri, 17 Dec 2021 14:32:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
 <YbiP7YlpY22llB5Y@Air-de-Roger>
 <621259B5-E5EB-4ED9-A836-B6E17C0D6E36@arm.com>
 <YbscoZG/NRP6lMof@Air-de-Roger>
 <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3488523-489e-abb7-59f1-74c86e842060@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 16/12/2021 13:37, Jan Beulich wrote:
> On 16.12.2021 12:01, Roger Pau Monné wrote:
>> On Thu, Dec 16, 2021 at 10:18:32AM +0000, Rahul Singh wrote:
>>> Hi Roger,
>>>
>>> Thanks for reviewing the code.
>>>
>>>> On 14 Dec 2021, at 12:37 pm, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>
>>>> On Tue, Dec 14, 2021 at 10:45:17AM +0000, Rahul Singh wrote:
>>>>> +              unsigned long *data)
>>>>> {
>>>>> -    const struct domain *d = v->domain;
>>>>> -    struct vpci_msix *msix = msix_find(d, addr);
>>>>>      const struct vpci_msix_entry *entry;
>>>>>      unsigned int offset;
>>>>>
>>>>>      *data = ~0ul;
>>>>>
>>>>>      if ( !msix )
>>>>> -        return X86EMUL_RETRY;
>>>>> +        return VPCI_EMUL_RETRY;
>>>>>
>>>>>      if ( !access_allowed(msix->pdev, addr, len) )
>>>>> -        return X86EMUL_OKAY;
>>>>> +        return VPCI_EMUL_OKAY;
>>>>>
>>>>>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>>>>>      {
>>>>> @@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>>>>>          switch ( len )
>>>>>          {
>>>>>          case 4:
>>>>> -            *data = readl(addr);
>>>>> +            *data = vpci_arch_readl(addr);
>>>>
>>>> Why do you need a vpci wrapper around the read/write handlers? AFAICT
>>>> arm64 also has {read,write}{l,q}. And you likely want to protect the
>>>> 64bit read with CONFIG_64BIT if this code is to be made available to
>>>> arm32.
>>>
>>> I need the wrapper because {read,write}{l,q} function argument is different for ARM and x86.
>>> ARM {read,wrie}(l,q}  function argument is pointer to the address whereas X86  {read,wrie}(l,q}
>>> function argument is address itself.
>>
>> Oh, that's a shame. I don't think there's a need to tag those helpers
>> with the vpci_ prefix though. Could we maybe introduce
>> bus_{read,write}{b,w,l,q} helpers that take the same parameters on all
>> arches?
>>
>> It would be even better to fix the current ones so they take the same
>> parameters on x86 and Arm, but that would mean changing all the call
>> places in one of the arches.
> 
> Yet still: +1 for removing the extra level of indirection. Imo these
> trivial helpers should never have diverged between arches; I have
> always been under the impression that on Linux they can be used by
> arch-independent code (or else drivers would be quite hard to write).

So technically both helpers are able to cope with pointer. The x86 one 
is also allowing to pass an address.

 From a brief look at the x86, it looks like most of the users are using 
a pointer. However, the vPCI msix code is one example where addresses 
are passed.

AFAICT, the read*/write* helpers on Linux only works with pointers. So I 
think the actions should be:
    1) Modify the vPCI MSIx code to use pointer
    2) Modify the x86 read*/write* helpers to forbid any access other 
than pointer.

Cheers,

-- 
Julien Grall

