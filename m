Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11E25F312
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 08:16:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFARr-0003DF-B9; Mon, 07 Sep 2020 06:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFARq-0003Co-2c
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 06:16:14 +0000
X-Inumbo-ID: c4ea99b2-2682-485c-8938-a84d77747679
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4ea99b2-2682-485c-8938-a84d77747679;
 Mon, 07 Sep 2020 06:16:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D4BDAB8B;
 Mon,  7 Sep 2020 06:16:08 +0000 (UTC)
Subject: Re: [PATCH] efi: Always map EfiRuntimeServicesCode and
 EfiRuntimeServicesData
To: Sergei Temerkhanov <s.temerkhanov@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <20200903232458.16551-1-s.temerkhanov@gmail.com>
 <98c44a05-00c8-948f-e3a9-e64d468dd36d@suse.com>
 <CAPEA6db-gNWhMU=Ex4OLFEB0HcFAy5GFs6Cjc6a4wupEpBReKw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3af10c84-8e97-8932-02fc-4bc654e31a39@suse.com>
Date: Mon, 7 Sep 2020 08:16:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPEA6db-gNWhMU=Ex4OLFEB0HcFAy5GFs6Cjc6a4wupEpBReKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 04.09.2020 23:03, Sergei Temerkhanov wrote:
> On Fri, Sep 4, 2020 at 12:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.09.2020 01:24, Sergey Temerkhanov wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -1521,7 +1521,9 @@ void __init efi_init_memory(void)
>>
>> Looking at the line numbers - is this patch against the master
>> or staging branch? I ask because about as far away from the line
>> number above as the chunk of cose you mean to change there's a
>> very similar conditional, which has caused some slight confusion
>> over here.
> 
> it was the latest tag, AFAIR.

That's definitely not sufficient for a patch submission, or - if
you absolutely can't work with master / staging for some reason -
should be explicitly pointed out in the submission.

>>
>>>          }
>>>
>>>          if ( !efi_enabled(EFI_RS) ||
>>> -             (!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
>>> +             ((!(desc->Attribute & EFI_MEMORY_RUNTIME) &&
>>> +                (desc->Type != EfiRuntimeServicesCode &&
>>> +                 desc->Type != EfiRuntimeServicesData)) &&
>>>                (!map_bs ||
>>>                 (desc->Type != EfiBootServicesCode &&
>>>                  desc->Type != EfiBootServicesData))) )
>>
>> I'm in principle okay with a workaround like this, but I don't
>> think it should go silently. I'd therefore like to suggest you
>> add a new if() ahead of this one and then set
>> EFI_MEMORY_RUNTIME in affected descriptors (to keep things
>> consistent with other consumers of the memory map without
>> having to update every one of those checking for the flag)
>> alongside issuing a log message.
>>
>> There's nevertheless another piece of code you need to adjust,
>> inside a CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP conditional in
>> efi_exit_boot(). But you shouldn't adjust the descriptor
>> there, yet - this should happen only after its logging in
>> efi_init_memory().
>>
>> Additionally I'd like it to be at least considered to also
>> check that EFI_MEMORY_WB (or at the very least one of the
>> cachability flags) is set, so that we won't run into the
>> path further down complaining about a lack thereof in this
>> case.
> 
> Makes sense. I'm making it set the UC for data and WP for code as the most
> conservative option in such a case.

Please don't: I intentionally said "check", not "correct".
Unless of course you have proof of both aspects being got wrong
on a single piece of firmware at the same time.

Jan

