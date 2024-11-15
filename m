Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D039CF270
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837895.1253812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzpR-0001W1-R3; Fri, 15 Nov 2024 17:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837895.1253812; Fri, 15 Nov 2024 17:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzpR-0001Tv-Nb; Fri, 15 Nov 2024 17:09:53 +0000
Received: by outflank-mailman (input) for mailman id 837895;
 Fri, 15 Nov 2024 17:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBzpQ-0001SB-3p
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:09:52 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a699274-a374-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 18:09:47 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so375513566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 09:09:47 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046d76sm196348966b.165.2024.11.15.09.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 09:09:45 -0800 (PST)
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
X-Inumbo-ID: 6a699274-a374-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZhNjk5Mjc0LWEzNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjkwNTg3LjA0ODU4NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731690586; x=1732295386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GeDEs4H7mM9MVVv42M9CoGHfr21h65tza1Lh073Q8h0=;
        b=KxgTMP0wGCeGIglCsGKQtdpu8SHiKGC6/BmuoIn5tULlwEWL2PFRIlkK2pS1CihhNg
         aLl8u8biA8Bp2z+shp9cA8bJS9Ub2CyL+iTFf4N8z9JREi10jzxKz5x4thGFN8j/9NaH
         w+Z9azHFxbLC4bwvn29xkHDHJ0Hx43bzicjcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731690586; x=1732295386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GeDEs4H7mM9MVVv42M9CoGHfr21h65tza1Lh073Q8h0=;
        b=ur1GgbLpXX+DZPA6mrlvwDmxq8DMIprX3V29QzPCXCHpz082tBnwqx29klwHwWvTOE
         V+8zwyaKLtFrkf7UgZ1jzLs53ODNDsgsJa+xtJ6GGh8a8npAHxV2GMmajYOej8nkFIaA
         0ut9GeZhZiw7z+shxfRpVQAHo2x4BNonql55Q2aqRW9+9OBmXlrxUhMo4Qja1QgZX6v+
         OlsiBEA1JBV4mQnlNaXG2q5JG0XdQeohMWRzQTYQFMQUsE1UfccNrmVmj8c1fqQY1Kll
         Gmtf2sgP2cJuCHXgi6BNQWmw+S70/uMPqSiFeYQKidvLUUkgmShd7zDUbK3eMdx5cyhL
         H5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSr9+ytfaos4pTxWXPf6kUTMhpu4ZznFR+2fKpMN7EK8m5VAiSI0goIFITWqDYASInQOhNcjNpwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydgYG4UHDBpghCP5PWmG1LQ4SEZNwSaJesXQ5aiJodZjl5uIY1
	ZIRm/VdBH8qjp0pPyxL+FNoGK8dka+OGAx0mKVE4zyJYLsEILJ7jGbUELdWXwzs=
X-Google-Smtp-Source: AGHT+IHItsHAXyD/qCVz13yW924W/qh8YHv8qxMBX+FQjXVcTyKA9KUN1oQPts7dOmi88CVK7sEVvw==
X-Received: by 2002:a17:907:928a:b0:a9e:6e77:3ecd with SMTP id a640c23a62f3a-aa483552936mr272303266b.54.1731690586286;
        Fri, 15 Nov 2024 09:09:46 -0800 (PST)
Message-ID: <a178bb81-c1a7-4daf-872b-9b474f62bd3b@citrix.com>
Date: Fri, 15 Nov 2024 17:09:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] x86/boot: introduce module release
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-3-dpsmith@apertussolutions.com>
 <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 4:50 pm, Jason Andryuk wrote:
> On 2024-11-15 08:12, Daniel P. Smith wrote:
>> A precarious approach was used to release the pages used to hold a
>> boot module.
>> The precariousness stemmed from the fact that in the case of PV dom0,
>> the
>> initrd module pages may be either mapped or copied into the dom0
>> address space.
>> In the former case, the PV dom0 construction code will set the size
>> of the
>> module to zero, relying on discard_initial_images() to skip any
>> modules with a
>> size of zero. In the latter case, the pages are freed by the PV dom0
>> construction code. This freeing of pages is done so that in either
>> case, the
>> initrd variable can be reused for tracking the initrd location in
>> dom0 memory
>> through the remaining dom0 construction code.
>>
>> To encapsulate the logical action of releasing a boot module, the
>> function
>> release_boot_module() is introduced along with the `released` flag
>> added to
>> boot module. The boot module flag `released` allows the tracking of
>> when a boot
>> module has been released by release_boot_module().
>>
>> As part of adopting release_boot_module() the function
>> discard_initial_images()
>> is renamed to free_boot_modules(), a name that better reflects the
>> functions
>> actions.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v8:
>> - completely reworked the commit
>>    - switch backed to a releasing all but pv initrd approach
>>    - renamed discard_initial_images to free_boot_modules
>> ---
>>   xen/arch/x86/hvm/dom0_build.c       |  2 +-
>>   xen/arch/x86/include/asm/bootinfo.h |  2 ++
>>   xen/arch/x86/include/asm/setup.h    |  4 +++-
>>   xen/arch/x86/pv/dom0_build.c        | 27 +++++++++++++--------------
>>   xen/arch/x86/setup.c                | 27 +++++++++++++++------------
>>   5 files changed, 34 insertions(+), 28 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>> b/xen/arch/x86/hvm/dom0_build.c
>> index d1bdf1b14601..d1410e1a02b0 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -755,7 +755,7 @@ static int __init pvh_load_kernel(
>>       }
>>         /* Free temporary buffers. */
>> -    discard_initial_images();
>> +    free_boot_modules();
>
> This...
>
>>       if ( cmdline != NULL )
>>       {
>
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index 6be3d7745fab..2580162f3df4 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>
>> @@ -875,7 +874,7 @@ static int __init dom0_construct(struct boot_info
>> *bi, struct domain *d)
>>       }
>>         /* Free temporary buffers. */
>> -    discard_initial_images();
>> +    free_boot_modules();
>
> ...and this.  I think Andrew requested/suggested moving to a single
> free_boot_modules call:
>     They're both right at the end of construction, so it would
>     make far more sense for __start_xen() to do this after
>     create_dom0().   That also avoids needing to export the function.

Yeah...  It turns out that also breaks PVH Boot in Gitlab, for reasons
we still don't understand.

I'd still like to clean it up, but it wants to be detached from the
mechanics of changing the data-structures.

>
>>         /* Set up start info area. */
>>       si = (start_info_t *)vstartinfo_start;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 495e90a7e132..0bda1326a485 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>
>> +void __init free_boot_modules(void)
>>   {
>>       struct boot_info *bi = &xen_boot_info;
>>       unsigned int i;
>>         for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
>> -        uint64_t size  = bi->mods[i].mod->mod_end;
>> -
>> -        /*
>> -         * Sometimes the initrd is mapped, rather than copied, into
>> dom0.
>> -         * Size being 0 is how we're instructed to leave the module
>> alone.
>> -         */
>> -        if ( size == 0 )
>> +        if ( bi->mods[i].released )
>>               continue;
>>   -        init_domheap_pages(start, start + PAGE_ALIGN(size));
>> +        release_boot_module(&bi->mods[i]);
>>       }
>> -
>> -    bi->nr_modules = 0;
>
> IIUC, zero-ing here was a safety feature to ensure boot modules could
> not be used after this point.  Should it be retained?

Clobbering this prevents the loop constructs from working.

Safety is now based on the .released field, which is better IMO.

~Andrew

