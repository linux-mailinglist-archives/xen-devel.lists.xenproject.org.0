Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CA87C1C3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 18:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693410.1081448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoTK-00033m-Bf; Thu, 14 Mar 2024 17:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693410.1081448; Thu, 14 Mar 2024 17:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoTK-00030Z-8R; Thu, 14 Mar 2024 17:02:26 +0000
Received: by outflank-mailman (input) for mailman id 693410;
 Thu, 14 Mar 2024 17:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkoTI-00030O-JH
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 17:02:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0906b16-e224-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 18:02:23 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1524414a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 10:02:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e27-20020a170906375b00b00a45bda3cbb8sm868006ejc.134.2024.03.14.10.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 10:02:22 -0700 (PDT)
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
X-Inumbo-ID: a0906b16-e224-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710435743; x=1711040543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqjKQL8SYfkmK/oQBy9DE2rDPUqNAWN3XDkBt8J5gVg=;
        b=K6yKhS/SuepAZbfVHEC9V+vjIzaO8AfymT6OAZJSaMiQ9kKT3r0xcrPClZsBYcZi/Y
         l1WZsjs49Jaom7zsO6NLE2STXzVSkd3FeeRaZBw84Ure5szTZW7GqtTqZN+jT2OzWVSW
         G7tqMwVzsUKXAmRq8vJFUjU04di05vHQFFgc1iJsFuFa+buawDAa4VljnxvVNeqK41MR
         CNxrYTGFpBJd6sy3jhXCcRZkb3kjA9k6QNWx7bstU/+pNTfS3lHtDDQSBmz/+uzBADeD
         Ippk3fbVH42MtuNkDskJndbe/lmzYnVxOhCLlzLsj8QT8P0JJjNqWoopqrpqFFG9Ft4V
         JFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710435743; x=1711040543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqjKQL8SYfkmK/oQBy9DE2rDPUqNAWN3XDkBt8J5gVg=;
        b=vBL/1yaxW6ZcEh+iqxIb6Qby19cLi+3LT6hnyGx8SLoDqv1o8ab6sqAD+cqcGrOtYo
         /TV+OWb1XtcmO9B1RAMXVA8kVo0+oPZifKqLSeXSRf0BM9fJwDLnnJPQyPWgXYSysDXh
         I/3/rOOuBz72Mdmk4rPtOcaCdW6qmpmChQ66K9YGmZfSUWgRXqYuBVUcRRFqPyoKVONl
         3h90PrN3iMx9CPFbngeQQRFpZWWhk9VFbR8RjQ3oVilHOCPGy6y2EPMukBML+ChgydkV
         6YKG+r481HKDdRddK9VblnplE76ngjDXxLp+IfQvra92FXv3l+Y5WkyMjxSQ3NiE35wJ
         9VZg==
X-Gm-Message-State: AOJu0YyOKqa2Wowecac2TYdWhV72IY2E5AT8o+W7IcRWd3RspXPReoHm
	DKsfDZBiNqpSDltBspKJX1twhbkS64K5RHrOwJgEl/gmnLCO7ds6nWyiiqnr8g==
X-Google-Smtp-Source: AGHT+IEJY+ImUxiXs6nu5po1hEJJtZq7HAqyiVZZCXHziIsz2v4r2Q5jmqRAv6gDWZnGQEAuAsK/Hw==
X-Received: by 2002:a17:906:169b:b0:a43:b472:9a57 with SMTP id s27-20020a170906169b00b00a43b4729a57mr1323008ejd.62.1710435743052;
        Thu, 14 Mar 2024 10:02:23 -0700 (PDT)
Message-ID: <f578c165-ffe2-4d49-a753-9322b9915ff6@suse.com>
Date: Thu, 14 Mar 2024 18:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com> <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com> <ZfMKuUqopaj-Gubu@macbook>
 <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
 <ae43789c-37e9-42a9-b570-d073c4fd4cf5@amd.com>
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
In-Reply-To: <ae43789c-37e9-42a9-b570-d073c4fd4cf5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 17:59, Jason Andryuk wrote:
> On 2024-03-14 11:30, Jan Beulich wrote:
>> On 14.03.2024 15:33, Roger Pau Monné wrote:
>>> On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
>>>> On 2024-03-14 05:48, Roger Pau Monné wrote:
>>>>> On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
>>>>>> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>>>>>                    elf_note_numeric_array(elf, note, 8, 0),
>>>>>>                    elf_note_numeric_array(elf, note, 8, 1));
>>>>>>            break;
>>>>>> +
>>>>>> +    case XEN_ELFNOTE_PVH_RELOCATION:
>>>>>> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
>>>>>> +            return -1;
>>>>>> +
>>>>>> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
>>>>>> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
>>>>>> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
>>>>>
>>>>> Size for those needs to be 4 (32bits) as the entry point is in 32bit
>>>>> mode?  I don't see how we can start past the 4GB boundary.
>>>>
>>>> I specified the note as 3x 64bit values.  It seemed simpler than trying to
>>>> support both 32bit and 64bit depending on the kernel arch.  Also, just using
>>>> 64bit provides room in case it is needed in the future.
>>>
>>> Why do you say depending on the kernel arch?
>>>
>>> PVH doesn't know the bitness of the kernel, as the kernel entry point
>>> is always started in protected 32bit mode.  We should just support
>>> 32bit values, regardless of the kernel bitness, because that's the
>>> only range that's suitable in order to jump into the entry point.
>>>
>>> Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
>>> integer.
> 
> Linux defines PHYS32_ENTRY with _ASM_PTR, so it's 32 or 64 bit to match 
> how the kernel is compiled.  The Xen code parses the integer according 
> to the size of the note.
> 
>>>> Do you want the note to be changed to 3x 32bit values?
>>>
>>> Unless anyone objects, yes, that's would be my preference.
>>
>> As mentioned elsewhere, unless the entire note is meant to be x86-specific,
>> this fixed-32-bit property then would want limiting to x86.
> 
> PVH is only implemented for x86 today.  Are you saying that the comment 
> should just specify the values are 32bit for x86?  If the note is reused 
> for other arches, then they can specify their usage?

Along these lines. But looks like Roger isn't concerned and would be
happy to leave that to the future.

> If this note is to be a variably sized array of values, then the 
> elements should be of fixed size.  Otherwise parsing is ambiguous 
> without, say, another field specifying element size.
> 
> Maybe XEN_ELFNOTE_PHYS32_RELOC would be a better name to complement the 
> PHYS32_ENTRY?

Perhaps, yes.

Jan

