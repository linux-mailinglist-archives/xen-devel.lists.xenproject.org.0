Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60F830179
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 09:46:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668277.1040326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1ZC-0005ga-W9; Wed, 17 Jan 2024 08:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668277.1040326; Wed, 17 Jan 2024 08:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ1ZC-0005eB-TU; Wed, 17 Jan 2024 08:46:34 +0000
Received: by outflank-mailman (input) for mailman id 668277;
 Wed, 17 Jan 2024 08:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ1ZB-0005e5-Ji
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 08:46:33 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91baa5c-b514-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 09:46:31 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so118541211fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 00:46:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t29-20020a02b19d000000b0046ea3aea39csm299376jah.100.2024.01.17.00.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 00:46:30 -0800 (PST)
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
X-Inumbo-ID: e91baa5c-b514-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705481190; x=1706085990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Np57fW2Bhi2x3xAxytZojcxeDVk9duFP9A0OVsVwUM=;
        b=Z2NMOy2w8m8ik0zTW7GbuJ0AAzANd/uBtm2RnePjyMuBYd6bDFYtVW7EejE7msnFRj
         lI2F1rKCQmga27OpT9oB5IMWiT8jGyvgi8Jp3qM16vJglhj/uEExftYH39aqDXw37BtL
         JqEEgOL8RXxrm/Nx8jn5ke4p1GPtWbZEZTNGQSEwgxYalobdPdxGniIhy9iz/fKwkQ4T
         1zUXJUBboQLVPvx4zYVHOqSs+1GU3A8UW4C5unUJmNNIex183c11WqXgNZOTkWRuIdhp
         snKTlmjhLiwzzu5kIFV9Z7wlurb2nFdutp2zawbPcE7WQ5ZlKKCz/9i3PkuCBjc7Akca
         DUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481190; x=1706085990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Np57fW2Bhi2x3xAxytZojcxeDVk9duFP9A0OVsVwUM=;
        b=RkAbAG+97bBaekhHN407n5BTsPRrbSdLgLAcC8Q8/fiQc1s/qQW3ftLPpiRRsWZmFP
         KsknvqrBOZP0YZCJBMX/a2QHOoRCwX4IlGTCOUJ6mDdLjgDfceIMOkSXYHwpC7hQA6Vv
         6BQZOseUiKEHX0OY08n6Vo3KnEjS3UdKF1nbv59OihLAX0oatiN88H0NZzrXVRV24RcA
         7CZ+9Y22kVIrN9Xg+Cy892ZvTNNKH2262mxNfgXvemPQIK29sMx5N2/Fg2f/ZLTXvpKW
         YMhp5dpjUohUQ8GBTL+oEVZheRot3d3QQcrfhzXBtYBpgx9EVOgJdajlo45/uKP4UM7Y
         2Xcg==
X-Gm-Message-State: AOJu0Yykmrme98mXuqaW8W0+v6kOp8D/mZqkzEvRbJ5OjF6fH/k9YsdX
	uAu3a2grCg2ZhEexTmyV2dpszqpac5Hp
X-Google-Smtp-Source: AGHT+IHpQMN83NTfg4ZuKM4YwxWRQa+ir+bQUSg+LiW6bzlDDYWofBueWJpni+zehcIic2TEXY40rA==
X-Received: by 2002:a2e:150f:0:b0:2cb:5b8a:7013 with SMTP id s15-20020a2e150f000000b002cb5b8a7013mr3748879ljd.75.1705481190566;
        Wed, 17 Jan 2024 00:46:30 -0800 (PST)
Message-ID: <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
Date: Wed, 17 Jan 2024 09:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
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
In-Reply-To: <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.01.2024 07:12, Patrick Plenefisch wrote:
> On Tue, Jan 16, 2024 at 4:33 AM Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 16.01.2024 01:22, Patrick Plenefisch wrote:
>>> I managed to set up serial access and saved the output with the requested
>>> flags as the attached logs
>>
>> Thanks. While you didn't ...
>>
>>
>> ... fiddle with the Linux message,  ...
>>
> 
> I last built the kernel over a decade ago, and so was hoping to not have to
> look up how to do that again, but I can research how to go about that again
> if it would help?
> 
> 
>>
>> ... as per
>>
>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4a00000
>>
>> there's an overlap with not exactly a hole, but with an
>> EfiACPIMemoryNVS region:
>>
>> (XEN)  0000000100000-0000003159fff type=2 attr=000000000000000f
>> (XEN)  000000315a000-0000003ffffff type=7 attr=000000000000000f
>> (XEN)  0000004000000-0000004045fff type=10 attr=000000000000000f
>> (XEN)  0000004046000-0000009afefff type=7 attr=000000000000000f
>>
>> (the 3rd of the 4 lines). Considering there's another region higher
>> up:
>>
>> (XEN)  00000a747f000-00000a947efff type=10 attr=000000000000000f
>>
>> I'm inclined to say it is poor firmware (or, far less likely, boot
>> loader) behavior to clobber a rather low and entirely arbitrary RAM
>>
> 
> Bootloader is Grub 2.06 EFI platform as packaged by Debian 12
> 
> 
> 
>> range, rather than consolidating all such regions near the top of
>> RAM below 4Gb. There are further such odd regions, btw:
>>
>> (XEN)  0000009aff000-0000009ffffff type=0 attr=000000000000000f
>> ...
>> (XEN)  000000b000000-000000b020fff type=0 attr=000000000000000f
>>
>> If the kernel image was sufficiently much larger, these could become
>> a problem as well. Otoh if the kernel wasn't built with
>> CONFIG_PHYSICAL_START=0x1000000, i.e. to start at 16Mb, but at, say,
>> 2Mb, things should apparently work even with this unusual memory
>> layout (until the kernel would grow enough to again run into that
>> very region).
> 
> I'm currently talking to the vendor's support team and testing a beta BIOS
> for unrelated reasons, is there something specific I should forward to
> them, either as a question or as a request for a fix?

Well, first it would need figuring whether the "interesting" regions
are being put in place by firmware of the boot loader. If it's firmware
(pretty likely at least for the region you're having trouble with), you
may want to ask them to re-do where they place that specific data.

> As someone who hasn't built a kernel in over a decade, should I figure out
> how to do a kernel build with CONFIG_PHYSICAL_START=0x2000000 and report
> back?

That was largely a suggestion to perhaps allow you to gain some
workable setup. It would be of interest to us largely for completeness.

>> It remains to be seen in how far it is reasonably possible to work
>> around this in the kernel. While (sadly) still unsupported, in the
>> meantime you may want to consider running Dom0 in PVH mode.
>>
> 
> I tried this by adding dom0=pvh, and instead got this boot error:
> 
> (XEN) xenoprof: Initialization failed. AMD processor family 25 is not
> supported
> (XEN) NX (Execute Disable) protection active
> (XEN) Dom0 has maximum 1400 PIRQs
> (XEN) *** Building a PVH Dom0 ***
> (XEN) Failed to load kernel: -1
> (XEN) Xen dom0 kernel broken ELF: <NULL>
> (XEN) Failed to load Dom0 kernel
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Could not construct domain 0
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...

Hmm, that's sad. The more that the error messages aren't really
informative. You did check though that your kernel is PVH-capable?
(With a debug build of Xen, and with suitably high logging level,
various of the ELF properties would be logged. Such output may or
may not give further hints towards what's actually wrong. Albeit
you using 4.17 this would further require you to pull in commit
ea3dabfb80d7 ["x86/PVH: allow Dom0 ELF parsing to be verbose"].)

But wait - aren't you running into the same collision there with
that memory region? I think that explains the unhelpful output.
Whereas I assume the native kernel can deal with that as long as
it's built with CONFIG_RELOCATABLE=y. I don't think we want to
get into the business of interpreting the kernel's internal
representation of the relocations needed, so it's not really
clear to me what we might do in such a case. Perhaps the only way
is to signal to the kernel that it needs to apply relocations
itself (which in turn would require the kernel to signal to us
that it's capable of doing so). Cc-ing Roger in case he has any
neat idea.

Jan

