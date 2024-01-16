Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD182EB95
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 10:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667683.1039184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfp5-0001RU-B1; Tue, 16 Jan 2024 09:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667683.1039184; Tue, 16 Jan 2024 09:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfp5-0001PO-8Q; Tue, 16 Jan 2024 09:33:31 +0000
Received: by outflank-mailman (input) for mailman id 667683;
 Tue, 16 Jan 2024 09:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MjSB=I2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPfp3-0001PI-TV
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 09:33:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd71a0f-b452-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 10:33:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so117396545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 01:33:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d6641000000b0033609584b9dsm14166031wrw.74.2024.01.16.01.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 01:33:27 -0800 (PST)
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
X-Inumbo-ID: 4dd71a0f-b452-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705397608; x=1706002408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ayKqvM2X3si6GXuxV4ohoDRNIupE1BWknrfPh0PWMf0=;
        b=WqIWN2GCf+AH2HicMXBqji24olM2eXjA7doePIThPXKdTyqNrr3csmehW2D3lrl7SR
         DVO7GLqiIMOxcgzmz/DI2cxzaKR8EanMLdyijPXGrjNxcy1Ko1aRcCObeGJoDPd4zpq3
         i5w4/C8iF6Qgc3XPx9lS9kvev992to2cAbzfVnQvjFvLtVcm7c2vw9SWSG07hCcoJwiC
         X1DJJBUerDy/ZXNKK3c00G9osnFzD9bA14mP0xwthNfA+nr9Rd8l29/JNcBtO85rG1BV
         it9PnyURyeJf/jFrMI5N23Ld3M2GHs6iuAKH4EMlNzblLAKoFFK7Jnkrae3wd9lgq7DN
         PA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705397608; x=1706002408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ayKqvM2X3si6GXuxV4ohoDRNIupE1BWknrfPh0PWMf0=;
        b=ti4k6ZP5XDM5psUcwMJhlloiCFwYg8tXTkTQ/k6ft5TBFz66RVq7KtQEFwPBnRBGO7
         pz7l++Wv5IxDKviFajN7iAlZ11PW8zv0HpwuZIbRUvoIwUM/KDmx6cSG3MdC7+h1RTCW
         BMRQG5l9YWz57YfVp2+Bgc22m4mgSdPT+sibsBWXal4v8vBG2eyVQMqTYhwbV5I/rM3e
         3fY7WjZ+j9YJ40nHCoNIqleOn8Ki5QNT49S1czT7fwnQXM+aFOmCbL2dvGn3NiYV69zu
         D3F+6GXzpFRqgmP95KOCfeLDREW0DYsuPwvw1zP8XzFtAE5+2dUq5gKR2gi54rsQ9G8D
         PWsg==
X-Gm-Message-State: AOJu0YwFrbA6UT4DgaYv6aekTFDVio6NmWJw9ysSBGNhy2WAEWbTp7e9
	nsN/dS1XG6/6KiY1Y/nmwe2dstcy3W8n
X-Google-Smtp-Source: AGHT+IH5zC4iG+sR7vkB90PqHsIgd8ysI5U1kUcxwHyGDuBf8c12Jp1O+jvGw0qdhthzsGEqhQxZkA==
X-Received: by 2002:a05:600c:1381:b0:40e:4b48:57d4 with SMTP id u1-20020a05600c138100b0040e4b4857d4mr3527981wmf.180.1705397607694;
        Tue, 16 Jan 2024 01:33:27 -0800 (PST)
Message-ID: <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
Date: Tue, 16 Jan 2024 10:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
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
In-Reply-To: <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2024 01:22, Patrick Plenefisch wrote:
> I managed to set up serial access and saved the output with the requested
> flags as the attached logs

Thanks. While you didn't ...

> On Thu, Jan 11, 2024 at 5:13 AM Juergen Gross <jgross@suse.com> wrote:
>> On 11.01.24 09:37, Jan Beulich wrote:
>>> On 11.01.2024 03:29, Patrick Plenefisch wrote:
>>>> I ran into a memory allocation issue, I think. It is the same as
>>>> https://github.com/QubesOS/qubes-issues/issues/8791 and I saw at the
>> end it
>>>> was recommended (by marmarek) that the issue reporter forward the issue
>> to
>>>> this list. I searched the list, but as I didn't see it in the list
>> already,
>>>> I'm doing that now.
>>>>
>>>> Hardware:
>>>> I have an AMD Threadripper 7960X on a ASRock TRX50 WS motherboard. The
>>>> Qubes reporter had a Threadripper 3970X on an ASUS Prime TRX40-Pro
>>>> Motherboard. I saw a 3rd issue report of a similar issue on another
>>>> Threadripper, so I think this may be Threadripper-specific.
>>>>
>>>> Setup:
>>>> The QuebesOS reporter was using Qubes Installer.
>>>> My install was that I had a fresh install of Debian 12 (no gui), and
>> then
>>>> did `apt install xen-system-amd64` and rebooted.
>>>>
>>>> The issue:
>>>> Any boot of Xen on the hardware results in a halted machine. When
>>>> monitoring the logs with `vga=,keep`, we get:
>>>>
>>>> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch
>> input)
>>>> (XEN) Freed 644kB init memory
>>>> mapping kernel into physical memory
>>>> about to get started…
>>>> xen hypervisor allocated kernel memory conflicts with E820
>>>
>>> So first of all (the title doesn't say it) this is a Linux Dom0 issue.
>>> Whether or not needing addressing in Xen is unknown at this point.
>>>
>>>> (XEN) Hardware Dom0 halted: halting machine
>>>>
>>>> None of the settings I or the Qubes reporter have tried have been able
>> to
>>>> get past this failure.
>>>>
>>>> I am happy to provide debugging support.
>>>
>>> Well, the crucial piece of data initially is going to be: What's the
>>> E820 map Xen gets to see, what's the E820 map Dom0 gets to see, and
>>> what address range is the conflict detected for? The first question
>>> is possible to answer by supplying a serial log. The second question
>>> likely means adding some debugging code to either Xen or Linux. The
>>> answer to third question may be possible to infer from the other
>>> data, but would likely be better to obtain explicitly by adjusting /
>>> amending the message Linux emits.

... fiddle with the Linux message,  ...

>> The needed information should all be in the hypervisor messages.
>> 
>> The hypervisor is initially presenting a memory map to dom0 which is not
>> the
>> same as the native memory map. Dom0 tries to rearrange its memory layout to
>> be compatible with the native memory map.
>>
>> The seen message ("xen hypervisor allocated kernel memory conflicts with
>> E820")
>> tells us that the kernel position is conflicting with the native memory map
>> (at least one guest pfn occupied by the kernel would be at a non-RAM
>> populated
>> location after rearrangement of memory).
>>
>> In theory it would be possible to cover this case, too, but it would be
>> quite
>> cumbersome. Right now only the initrd is allowed to conflict with the
>> memory map
>> (it will be moved in this case), kernel and initial page table conflicts
>> are not
>> handled.
>>
>> When I added the conflict handling nearly 10 years ago, there was no
>> hardware
>> known to have memory holes at addresses which would conflict with Xen's
>> initial
>> idea of dom0 memory layout.

... as per

(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000

there's an overlap with not exactly a hole, but with an
EfiACPIMemoryNVS region:

(XEN)  0000000100000-0000003159fff type=2 attr=000000000000000f
(XEN)  000000315a000-0000003ffffff type=7 attr=000000000000000f
(XEN)  0000004000000-0000004045fff type=10 attr=000000000000000f
(XEN)  0000004046000-0000009afefff type=7 attr=000000000000000f

(the 3rd of the 4 lines). Considering there's another region higher
up:

(XEN)  00000a747f000-00000a947efff type=10 attr=000000000000000f

I'm inclined to say it is poor firmware (or, far less likely, boot
loader) behavior to clobber a rather low and entirely arbitrary RAM
range, rather than consolidating all such regions near the top of
RAM below 4Gb. There are further such odd regions, btw:

(XEN)  0000009aff000-0000009ffffff type=0 attr=000000000000000f
...
(XEN)  000000b000000-000000b020fff type=0 attr=000000000000000f

If the kernel image was sufficiently much larger, these could become
a problem as well. Otoh if the kernel wasn't built with
CONFIG_PHYSICAL_START=0x1000000, i.e. to start at 16Mb, but at, say,
2Mb, things should apparently work even with this unusual memory
layout (until the kernel would grow enough to again run into that
very region).

It remains to be seen in how far it is reasonably possible to work
around this in the kernel. While (sadly) still unsupported, in the
meantime you may want to consider running Dom0 in PVH mode.

Jan

