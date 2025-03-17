Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B0EA64469
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 08:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916211.1321342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5KX-0000g3-7D; Mon, 17 Mar 2025 07:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916211.1321342; Mon, 17 Mar 2025 07:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu5KX-0000eS-4P; Mon, 17 Mar 2025 07:56:13 +0000
Received: by outflank-mailman (input) for mailman id 916211;
 Mon, 17 Mar 2025 07:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu5KW-0000e1-6Q
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 07:56:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a2b7d2d-0305-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 08:56:10 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43948021a45so18852265e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 00:56:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb629dsm97638435e9.3.2025.03.17.00.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 00:56:09 -0700 (PDT)
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
X-Inumbo-ID: 4a2b7d2d-0305-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742198170; x=1742802970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw06q73juRh5NWGHmPTU/HK49xkgtaSCXS5Al4KvMNk=;
        b=PlCt3RT37AjZOPnvK/TwvpEOZTCD1HyK0P67W2VAqZm7LVe7D3i6Lj6HN5oJfWyNWS
         L+3ITyZhyN19BdelQUtlHNR3tKoXUh5mtLs1Qv/ZTHWXRop1Gssbg3hyY2NEFiPAmKyF
         6/ChB0f5FgiX3Jo4NITErmHn7lGJpVkHnGBvMYrN/IvJ0fdUa94WL6MFUluLEwwxoS7V
         +njp9IMh7wKVl50Mgq+1hvDCDTikI/R5MmOeCpqRzoUYo8h0SnkUydmkZidzVKafuH0r
         rUNnv39+Ju2gCcXmiPqMswhhDXBxkRKH0Y7+ubvRmQNafFHNCi586JO2SwV8DEL1b0iK
         xJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742198170; x=1742802970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hw06q73juRh5NWGHmPTU/HK49xkgtaSCXS5Al4KvMNk=;
        b=JdIRsuzdP3NWZYOWacH/8kcXjccY1xOiKldFt4nKJOiR8Rt6H/xpWYYtgbsG636Qof
         VzX4OzXLgddh736puTj/cDH97/UUb0qu44MSbbI/Y9PTEMu5bNcA0TmzrS8CkHMU6FtE
         Ji4NcUgn/Eb+l5tzNzm5Hh1iUiOLKjhyKmtQ8A3oPBYXoS+ki/03GndZ4Kg8ENSRgJHA
         7wV04XGC9W8usZbwVlir/88YeL82AWCsvQEpNvYhjesk53KS7PNsK+0dQDAF3swmu2GG
         JxzGE6qH831YDj+l4p6R0WP4vb8J+girb95pwlDSre7Xs+sc0eMnA8ioSm0FwwTQBu+d
         gQjQ==
X-Gm-Message-State: AOJu0YywD+Hf8JxDjoBibsQebtS67lX5wiEQ5jwyQhTWXZjqM5CnpLwy
	Vqc9A0bFzhEHapxUt+tTA0xhGbjCtYPx9kp8nGLK/h33ls42VDYBVsMwrOr0zg==
X-Gm-Gg: ASbGncs5INmhFVadhuc1EYwuweOJwJc1E/eqIz8h0E5llaQzZrlW4qgnKQF+gkn9pId
	flncVqKv6R2TWf0l0HFtfR8Q9Nc17eqHtX4fO+Ay89aPN7nefPCk7f7NgCz450ReNeAdEXcqzAm
	A5+QfcEFynG3Ah/6TOffWwS8wLAuvCOvOA6w68VHsjXAAmYDyRcHV3M9SmDQHhmwMlYuo2/+0tP
	De+3rvtTI9QmdTAh9aRz31nqw2fGybUGF81ndjNvvhWIVcOakT1kf9TqixFz+ax9PvcQocX0lw6
	l+/PIz4y48Ku7420V5GP44j60fg8k0MAB/NKyrlV7Bm3Znl5vbyaG83pCtj7qoM3GasMIUcAKuc
	+NMnlKGHxFsWX/7PyB8EPb1slp9vfmaqxEerwxryq
X-Google-Smtp-Source: AGHT+IFMBn7lhnbc/6czO2QnHyyDJCpIx3gddWpOhkeENnYSeEhRPbBGXs2s9Kex1q8Y5pT80OQ1iQ==
X-Received: by 2002:adf:a31b:0:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-3971e0bfa2emr10160215f8f.27.1742198169790;
        Mon, 17 Mar 2025 00:56:09 -0700 (PDT)
Message-ID: <555dcea6-1359-43c3-93fd-338744099387@suse.com>
Date: Mon, 17 Mar 2025 08:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
 <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
 <4bff530c-9f96-4b59-b6cb-86349c576690@citrix.com>
 <0565db90-5734-4795-8988-efd3e72cc770@suse.com>
 <Z9FaeksA0d9Ms15m@macbook.local>
 <82348f8b-7e5e-43ab-8eab-975d84cdda46@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <82348f8b-7e5e-43ab-8eab-975d84cdda46@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 20:00, Andrew Cooper wrote:
> On 12/03/2025 9:57 am, Roger Pau Monné wrote:
>> On Wed, Mar 12, 2025 at 09:31:37AM +0100, Jan Beulich wrote:
>>> On 11.03.2025 21:47, Andrew Cooper wrote:
>>>> On 06/01/2025 11:54 am, Jan Beulich wrote:
>>>>> On 06.01.2025 12:26, Andrew Cooper wrote:
>>>>>> Regular data access into the trampoline is via the directmap.
>>>>>>
>>>>>> As now discussed quite extensively in asm/trampoline.h, the trampoline is
>>>>>> arranged so that only the AP and S3 paths need an identity mapping, and that
>>>>>> they fit within a single page.
>>>>>>
>>>>>> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
>>>>>> expected of the trampoline to be mapped.  Cut it down just the single page it
>>>>>> ought to be.
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> Thanks.  However,
>>>>
>>>>> on the basis that this improves things. However, ...
>>>>>
>>>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>>>> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
>>>>>>  {
>>>>>>      BUG_ON(num_online_cpus() != 1);
>>>>>>  
>>>>>> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
>>>>>> +    /* Stop using l?_bootmap[] mappings. */
>>>>>>      l4e_write(&idle_pg_table[0], l4e_empty());
>>>>>>      flush_local(FLUSH_TLB_GLOBAL);
>>>>>>  
>>>>>> -    /* Replace with mapping of the boot trampoline only. */
>>>>>> +    /*
>>>>>> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
>>>>>> +     * is arranged to fit in a single page.
>>>>>> +     */
>>>>>>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
>>>>>> -                     PFN_UP(trampoline_end - trampoline_start),
>>>>>> -                     __PAGE_HYPERVISOR_RX);
>>>>>> +                     1, __PAGE_HYPERVISOR_RX);
>>>>> ... literal numbers like this - however well they are commented - are
>>>>> potentially problematic to locate in case something changes significantly.
>>>>> The 1 here really would want connecting with the .equ establishing
>>>>> wakeup_stack.
>>>> how do you propose doing this?
>>>>
>>>> PFN_UP(wakeup_stack - trampoline_start) doesn't have the same obvious
>>>> connection, and it would involve partly undoing 7d73c6f196a5 which hid
>>>> the symbol recently.
>>>>
>>>> While 1 isn't ideal, it is next to a comment explaining what's going on,
>>>> and it's not going to go stale in a silent way...  (It's also not liable
>>>> to go stale either.)
>>> If in
>>>
>>>         .equ    wakeup_stack, trampoline_start + PAGE_SIZE
>>>
>>> PAGE_SIZE was replaced by a new (in asm/trampoline.h) TRAMPOLINE_PERM_SIZE,
>>> you could use PFN_UP(TRAMPOLINE_PERM_SIZE) here to establish a connection.
>>>
>>> I have to admit I also don't really see why things going stale here would
>>> (a) be unlikely and (b) be guaranteed to not go silently.
> 
> The size can't go to 0 or everything will break, and if it goes larger
> than 1 (which it almost certainly never will), then APs and/or S3 will
> break, and we've got both of these in CI.
> 
> Furthermore, the actual thing which matters is:
> 
>> /* Map the permanent trampoline page into l1_bootmap[]. */
>> mov     sym_esi(trampoline_phys), %ecx
>> lea     __PAGE_HYPERVISOR_RX(%ecx), %edx /* %edx = PTE to write  */
>> shr     $PAGE_SHIFT, %ecx                /* %ecx = Slot to write */
>> mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
> 
> which hardcodes 1 page, because there's almost certainly no chance this
> will ever change.
> 
>>>  We just don't
>>> know what we may need to add to the trampoline, sooner or later.
>> Maybe we could introduce trampoline_{ap?,runtime?}_{start,end} that
>> covers this more narrow section of the trampoline code?
> 
> We already have one of those, and a linker assertion that it stays below
> 1k, so wakeup_stack is at least 3k.
> 
> The complexity is that the wakeup_stack overlays some init-only logic in
> the placed trampoline.  It's not something that exists concretely in the
> Xen image.

Well - you've got an ack; while I'd prefer if connections were properly
made, I agree it's unlikely the size will grow enough for it to matter. So
I think you should feel free to put this in as is.

Jan

