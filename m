Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BEA69654
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:24:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921046.1325067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux9R-0004mv-8m; Wed, 19 Mar 2025 17:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921046.1325067; Wed, 19 Mar 2025 17:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tux9R-0004lH-5N; Wed, 19 Mar 2025 17:24:21 +0000
Received: by outflank-mailman (input) for mailman id 921046;
 Wed, 19 Mar 2025 17:24:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx04=WG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tux9P-0004lB-Pk
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:24:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9a6ad5-04e6-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 18:24:17 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso33175145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 10:24:17 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c255bsm21091067f8f.23.2025.03.19.10.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:24:16 -0700 (PDT)
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
X-Inumbo-ID: fc9a6ad5-04e6-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742405057; x=1743009857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=23UZ3qagcxYGg6m7BZTtiiErYX7K39HvBUA/YjNiVkg=;
        b=l9ETkMlNoa++7PzdnpCOA9vv/NnCoPUzlpeIrx+IOApxIyjYxbr3l6hLXZICSK6avo
         LAnFsC0+lG2/NJErr3FtoAEHkDANsy425j3KqzOtYUDAnk1Jv72Z8l0ATwLA1s7bKoUK
         ohYTF+d1HvxXhYGyXeQf/AXlib3jcDAo7n/58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405057; x=1743009857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23UZ3qagcxYGg6m7BZTtiiErYX7K39HvBUA/YjNiVkg=;
        b=RF3eTYT96Vyw8D+sAMm2C/WfLRmr35qYinS1FFiliNllrK9fioukB0QPWqRAHfQWbp
         Nuc/J523jM/5gSaKMAyQRJBPdP+FRqHP7vdW6T5O7lzjXg3zarXhs55PieGJKnPuRBcY
         YyVRbamtQVBQ3ZaH1e59kEvHInF6e/k38KJ9Zu5j64+DwBSqo2ZS4UOmevlM82x8HDJI
         IVxpoAfSX64lfGiaxTlqHeHsJePffU/IfZEhIcuhfz5B4H2QpdD0cEsujhESlBU/Hb3a
         gGGxCZM+y8U7iO3z3SuCw3ybdniWV/N38bLG3AVC6jGx+lbgZ4sfMWCyUta9nWuW9KYJ
         kVEg==
X-Forwarded-Encrypted: i=1; AJvYcCXkNr+iBt67Xo3/dwI+mZdMNQ4/13DKXSLVWyhqh0RZImTBnZwVqQb9pT7XXhza8MKbXdRLvcLPC3U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/Zy7zZ+VFVlKMDeUAnBf6w0lIzmWgQaVgwhkKpSvixqxpmfvE
	8I2nn27nqyxPovVs134GVQzTXTTaG4fNIT65nc1kU6jsXMUBVH9R/nX0+rNwYsg=
X-Gm-Gg: ASbGncsbQ1dBbsY1z40hUT5wHkTiSKMbVyI7MCmWIBpNlloAzqwNaVA17NQE+b6pLZi
	SJ8W8XK4JbCZb0JtHwvHi5OIQdg2QyyukAaOWMoY0VmloI6N0xNp3qyCgx0QLMuZ5edxVmfZKaC
	DVGQtxsZe3PnoUOKfXS9HAw4QNPprvIVhxAgOWaDmAyPQncRkqREJA76QMmHoboYy8JsJfX/ZQz
	QLfyHHFsxXQmBkSnJEpdgMM28JUN4YV5r04Bb10M6MHafNuZ3glJpVonlfT1ipwXGR8F2+qfMdx
	jqwRkQj8AGiDWPAa2vM9uCOd4cf4aF83XvN23AFSpbTEj4Qhwvr/dAFzTfWVI4ZVq/hQ8HSLBp/
	Jv+T/Eu19Wg==
X-Google-Smtp-Source: AGHT+IEowz1CZFHEg7SFMb2oOx9tHZDRqJLU8mW+x7VeeeXnauWYqQWnjpFhRAunOesw4Fp/fuLvow==
X-Received: by 2002:a05:6000:156d:b0:391:3aaf:1d59 with SMTP id ffacd0b85a97d-399739c9c4bmr2812560f8f.24.1742405057012;
        Wed, 19 Mar 2025 10:24:17 -0700 (PDT)
Message-ID: <9a0d717a-b3f5-4432-9f03-5bc15d8545ed@citrix.com>
Date: Wed, 19 Mar 2025 17:24:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: account for module command line length
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <730d8143-8cda-49da-a48a-3b82c2b77c9d@suse.com>
 <5b959741-2e51-4576-9219-df495d0e30be@citrix.com>
 <182e6183-8a61-4c03-902c-ab75b69cdd4f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <182e6183-8a61-4c03-902c-ab75b69cdd4f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/03/2025 12:39 pm, Jan Beulich wrote:
> On 19.03.2025 13:12, Andrew Cooper wrote:
>> On 19/03/2025 11:18 am, Jan Beulich wrote:
>>> As per observation in practice, initrd->cmdline_pa is not normally zero.
>>> Hence so far we always appended at least one byte. That alone may
>>> already render insufficient the "allocation" made by find_memory().
>>> Things would be worse when there's actually a (perhaps long) command
>>> line.
>>>
>>> Skip setup when the command line is empty. Amend the "allocation" size
>>> by padding and actual size of module command line.
>>>
>>> Fixes: 0ecb8eb09f9f ("x86/pvh: pass module command line to dom0")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -712,7 +712,15 @@ static int __init pvh_load_kernel(
>>>       * simplify it.
>>>       */
>>>      last_addr = find_memory(d, &elf, sizeof(start_info) +
>>> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
>>> +                            (initrd ? ROUNDUP(ROUNDUP(initrd_len,
>>> +                                                      elf_64bit(&elf) ? 8 : 4) +
>>> +                                              (initrd->cmdline_pa &&
>>> +                                               strlen(__va(initrd->
>>> +                                                           cmdline_pa))
>>> +                                               ? strlen(__va(initrd->
>>> +                                                             cmdline_pa)) + 1
>>> +                                               : 0),
>>> +                                              PAGE_SIZE) +
>>>                                        sizeof(mod)
>>>                                      : 0) +
>>>                              (cmdline ? ROUNDUP(strlen(cmdline) + 1,
>> This piece of logic was already bad, but this is rather worse.
>>
>> One patch I made while doing the boot module work is:
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index 6a4453103a9a..7292ddd07276 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -654,6 +654,7 @@ static int __init pvh_load_kernel(
>>      const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) :
>> NULL;
>>      struct elf_binary elf;
>>      struct elf_dom_parms parms;
>> +    size_t metadata_len;
>>      paddr_t last_addr;
>>      struct hvm_start_info start_info = { 0 };
>>      struct hvm_modlist_entry mod = { 0 };
>> @@ -711,13 +712,16 @@ static int __init pvh_load_kernel(
>>       * split into smaller allocations, done as a single region in order to
>>       * simplify it.
>>       */
>> -    last_addr = find_memory(d, &elf, sizeof(start_info) +
>> -                            (initrd ? ROUNDUP(initrd_len, PAGE_SIZE) +
>> -                                      sizeof(mod)
>> -                                    : 0) +
>> -                            (cmdline ? ROUNDUP(strlen(cmdline) + 1,
>> -                                               elf_64bit(&elf) ? 8 : 4)
>> -                                     : 0));
>> +    metadata_len = sizeof(start_info);
>> +
>> +    if ( initrd )
>> +        metadata_len += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
>> +
>> +    if ( cmdline )
>> +        metadata_len += ROUNDUP(strlen(cmdline) + 1,
>> +                                elf_64bit(&elf) ? 8 : 4);
>> +
>> +    last_addr = find_memory(d, &elf, metadata_len);
>>      if ( last_addr == INVALID_PADDR )
>>      {
>>          printk("Unable to find a memory region to load initrd and
>> metadata\n");
>>
>>
>> which I think I ought to submit as a prerequisite to this, after which
>> your logic squashed on the RHS now becomes an expansion of the `if (
>> initrd )`.
> Yes please.

https://lore.kernel.org/xen-devel/20250319171346.19478-1-andrew.cooper3@citrix.com/T/#u

> Another thing I was considering to put in a local variable is the
> repeated "elf_64bit(&elf) ? 8 : 4". If that sounds okay, I can make that
> a(nother) pre-patch to mine.

Yeah, I was thinking the same.  There's a related expression in
elf_round_up(), so it might be worth having a macro in
include/xen/libelf.h for elf_ptr_size() or so.

~Andrew

