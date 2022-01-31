Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DBD4A4F27
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 20:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263271.455940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbxX-0006wW-KN; Mon, 31 Jan 2022 19:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263271.455940; Mon, 31 Jan 2022 19:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEbxX-0006uV-HI; Mon, 31 Jan 2022 19:03:27 +0000
Received: by outflank-mailman (input) for mailman id 263271;
 Mon, 31 Jan 2022 19:03:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nEbxW-0006uP-8r
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 19:03:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbxS-0001NZ-Ls; Mon, 31 Jan 2022 19:03:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[10.95.141.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nEbxS-0001Az-FX; Mon, 31 Jan 2022 19:03:22 +0000
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
	bh=kww/5U+siM2skOKPUMWbZZ4Lk0cz4BzU3DwFzwYF6QA=; b=pJhNq0fLRqXvgMww40V1QmAVBW
	wTXb6Ef2S1jsmuHeicWPSYBiFA2JfogEeySiLjE4vIdOeN3PAzkE4g5RDlVtAHqkKgUILvx7rED1D
	t/P/yH06CC0UcqnuRIc1EQv3DkDD77sB1qecJHJ3k+7nGCr+M5v7+AmHBcmotnUpY6k8=;
Message-ID: <c4c3c23f-01b9-d7da-bfa3-6063a44a486d@xen.org>
Date: Mon, 31 Jan 2022 19:03:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4] EFI: always map EfiRuntimeServices{Code,Data}
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
 <f5e38653-aa2a-c843-39c8-f8c69fc9fbde@xen.org>
 <2860d074-ecfb-273a-88c7-391e3297ccba@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2860d074-ecfb-273a-88c7-391e3297ccba@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/01/2022 12:25, Jan Beulich wrote:
> On 27.01.2022 11:45, Julien Grall wrote:
>> On 12/01/2022 08:45, Jan Beulich wrote:
>>> From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
>>>
>>> This helps overcome problems observed with some UEFI implementations
>>
>> Would it be possible to provide some details about the platform? This is
>> helpful to track why a workaround is present.
> 
> I cannot provide any details. I took over the patch after pinging
> Sergey more than once, without any reaction. It was him to actually
> run into the problem in the wild.

This is a quite unfortunate.

> 
>>> which don't set the Attributes field in memery descriptors properly.
>>
>> typo: s/memery/memory/
>>
>>>
>>> Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v4: Drop EFI_MEMORY_CACHEABILITY_MASK. Fold with pre-existing if() (into
>>>       switch()). Style.
>>> ---
>>> I guess "map_bs" would also want honoring in efi_exit_boot(), but that's
>>> yet another patch then I suppose.
>>
>> IIUC, we would need to invalidate the mapping when map_bs was used. Is
>> it correct? If so, then I agree this sounds separate to the issue you
>> are describing here.
> 
> No, the other way around: We'd also need to put in a valid virtual
> address there for EfiBootServices{Code,Data}. I expect this wasn't
> done when map_bs was introduced because iirc at that time the code
> fragment in efi_exit_boot() was entirely dead, present merely for
> documentation purposes.
> 
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -1094,7 +1094,13 @@ static void __init efi_exit_boot(EFI_HAN
>>>        {
>>>            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>>    
>>> -        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
>>> +        /*
>>> +         * Runtime services regions are always mapped here.
>>> +         * Attributes may be adjusted in efi_init_memory().
>>> +         */
>>> +        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>>> +             desc->Type == EfiRuntimeServicesCode ||
>>> +             desc->Type == EfiRuntimeServicesData )
>>
>> My knowledge with the stub is limited. Would you be able to explain why
>> we need to map the runtime services even with !efi_enabled(EFI_RS)?
> 
> In principle we wouldn't need to, but the final setting of this bit
> isn't known yet at this point - it'll be known only after parsing
> the command line (see parse_efi_param()).

Oh. I thought efi_exit_boot() was called *after* efi_init_memory(). Your 
answer about 'map_bs' also make more sense.

Thanks for the explanation!

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

