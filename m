Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2AF26D6D4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 10:37:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIpPi-0005e8-8N; Thu, 17 Sep 2020 08:37:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIpPg-0005e2-O7
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 08:37:08 +0000
X-Inumbo-ID: f1780e0c-89e8-4ea7-9cc1-8dd7977a8151
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1780e0c-89e8-4ea7-9cc1-8dd7977a8151;
 Thu, 17 Sep 2020 08:37:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600331827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKzmMAi9IcYt85Xy+Xiy9ERa9laDn0lVFtPTLLoRcHo=;
 b=DAWaHKK2xX37SGEAuIegZUJu3mUJxLkem4Azk2guKUvueTldblt/Iy31u32jXOjen1zm93
 gG9ZUb22ydLmsE1LzlZdMQ9bpfYdieRmF1KaYwjou70aYno9ekYMAwUD0CupMgvZQhmETj
 HFOnxb+wkquKlrQ5anlech7QNEKPlf4wSaQ8pNGD+0z86UEh/dmUZ7Hr2mivORBlmCuSyO
 wnhrjkt016TY8w9/vnJwMj2/BF3I321erL0MrubfJbbL95Qg6iKcQk5BoqSAzq1ZrnOqOH
 NB8qEnfMFBPNCY9a8QbtFI0bUqaj+EkH3IMlKg2xO1cQ4RYOFXhRXMCP3oE5Xw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 044CEACC6;
 Thu, 17 Sep 2020 08:37:41 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: ignore accesses to EX_CFG
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200916105426.6663-1-roger.pau@citrix.com>
 <0a55eeb7-a5bf-8c9c-80e3-d697d029e7ce@suse.com>
 <20200916130439.GV753@Air-de-Roger>
 <33778785-830b-af08-ec64-4a08db92e693@suse.com>
 <20200916135343.GW753@Air-de-Roger> <20200917083345.GA19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5062091-ccbc-3c07-e132-13c67c21f285@suse.com>
Date: Thu, 17 Sep 2020 10:37:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917083345.GA19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 10:33, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 03:53:43PM +0200, Roger Pau Monné wrote:
>> On Wed, Sep 16, 2020 at 03:28:28PM +0200, Jan Beulich wrote:
>>> On 16.09.2020 15:04, Roger Pau Monné wrote:
>>>> On Wed, Sep 16, 2020 at 02:55:52PM +0200, Jan Beulich wrote:
>>>>> On 16.09.2020 12:54, Roger Pau Monne wrote:
>>>>>> Windows 10 will try to unconditionally read EX_CFG on AMD hadrware,
>>>>>> and injecting a #GP fault will result in a panic:
>>>>>>
>>>>>> svm.c:1964:d5v0 RDMSR 0xc001102c unimplemented
>>>>>> d5v0 VIRIDIAN CRASH: 7e ffffffffc0000096 fffff8054cbe5ffe fffffa0837a066e8 fffffa0837a05f30
>>>>>>
>>>>>> Return 0 when trying to read the MSR and drop writes.
>>>>>
>>>>> So I've gone through a bunch of BKDGs and PPRs, without finding
>>>>> this MSR mentioned in any of them. Could you point out on which
>>>>> model(s) it actually exists? You must have found it somewhere,
>>>>> or else you wouldn't know a name for it...
>>>>
>>>> Yes, sorry it took me a while to find it also, and I should have added
>>>> a reference here. It's in "BIOS and Kernel Developer’s Guide (BKDG)
>>>> for AMD Family 15h Models 00h-0Fh Processors", albeit Windows will try
>>>> to access it on Family 17h also.
>>>
>>> Ah, and it's exclusively this one as it seems. The models 1xh one
>>> again doesn't have it.
>>>
>>>>>> @@ -2108,6 +2109,7 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
>>>>>>      case MSR_K8_TOP_MEM2:
>>>>>>      case MSR_K8_SYSCFG:
>>>>>>      case MSR_K8_VM_CR:
>>>>>> +    case MSR_AMD64_EX_CFG:
>>>>>>          /* ignore write. handle all bits as read-only. */
>>>>>>          break;
>>>>>
>>>>> Is this necessary, rather than having writes fault?
>>>>
>>>> Hm, I'm not sure about that. This is the same that KVM did to handle
>>>> the MSR, see Linux commit 0e1b869fff60c81b510c2d00602d778f8f59dd9a.
>>>
>>> Looking at the sole bit that's defined there, I agree the main reason
>>> for Win10 to read it would look to be to potentially also write it if
>>> it finds certain bits unset. If so, perhaps we want to consider to
>>> report a value with this/these bit(s) set?
>>
>> So the manual only reports the meaning of bit 54, yet my EPYC system
>> reports 0x0168000000000000.
>>
>>>> I can try to return #GP for writes, but I don't see much issue in just
>>>> ignoring writes.
>>>
>>> The reason for me asking is that I'd prefer if we didn't grow an
>>> endless list of exceptions for no reason. In fact I wonder whether
>>> some MSRs that we currently ignore writes for couldn't be dropped.
>>
>> Let me see if I can make Windows happy by returning either bit 54 as 0
>> or 1, but given the value on bare metal I'm worried that Windows has
>> more insight on this value than just bit 54.
> 
> So I've tried reporting bit 54 set on rdmsr, and #GP on writes, and
> Windows 10 will try to write to the MSR to set additional bits:
> 
> (XEN) svm.c:2155:d1v0 WRMSR 0xc001102c val 0x0048000000000000 unimplemented
> 
> So without knowing why Windows is trying to set some hidden bits there
> I think the best option ATM is to return 0 from reads and ignore
> writes (like the current patch).
> 
> Trying to report a value that would make Windows happy seems fragile,
> as information about the meaning of bits on the MSR isn't public, so
> it's likely to get out of sync.

Agreed:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

We will want to figure out why Windows is doing what they do, and if
we perhaps ought to do the same for the benefit of all guests.

Jan

