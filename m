Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8988F7D9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698783.1090896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjCG-0003D3-1f; Thu, 28 Mar 2024 06:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698783.1090896; Thu, 28 Mar 2024 06:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjCF-0003AP-VK; Thu, 28 Mar 2024 06:25:07 +0000
Received: by outflank-mailman (input) for mailman id 698783;
 Thu, 28 Mar 2024 06:25:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpjCF-0003AI-Ef
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:25:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea6350f0-eccb-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 07:25:05 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-341e3682c78so280707f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 23:25:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b738:601a:1073:a6:6f09:9d9a?
 (p200300cab738601a107300a66f099d9a.dip0.t-ipconnect.de.
 [2003:ca:b738:601a:1073:a6:6f09:9d9a])
 by smtp.gmail.com with ESMTPSA id
 l14-20020adfa38e000000b0033e93e00f68sm837764wrb.61.2024.03.27.23.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 23:25:04 -0700 (PDT)
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
X-Inumbo-ID: ea6350f0-eccb-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711607104; x=1712211904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVn77RP6DE4g6drhl0zx5cLmjDm/qQpN4xlwgp7Pt88=;
        b=YjMQbmQSgJCEVAgs3R2gLeXcxiT6V691kgvebnmU3V9yCfGaDqMIGfAf3+zvCmocOo
         UYFUR91i8uCvJu6uAzRAmARn4JssHGAt51ASeGDXJC0I4QucyVQ98t3xdfXooJbz4kjb
         po6aREH+fareIH8gNCfymIqVOtW14MPBxgrogl4OhljJxLFKjrUh9ftTzaFJbgVGIO8h
         5Zf+FiCLAV/OP/VpeKSLzsePf1Qr6O3jgXfUt/C9TmVOZK78qiteOa6X6OuB6SaZn4kB
         llgTfrdkCkfTmVX3CUqhoQ1Xr3WJiRJVENMkv2bg35jM7HQ5o16/+iFQbHTJLggiKEOU
         iDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711607104; x=1712211904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVn77RP6DE4g6drhl0zx5cLmjDm/qQpN4xlwgp7Pt88=;
        b=N+Gk/i3enap/U0zJmj0La6WQO30bvOVWvTQVW9sFqQy2s6Q6POeG1c+VTjMdGH6icg
         w8nR2p9dpvFkXbY2fOcPWdK5kfNJSM18H74TigCTjrY9iPng2f6zMHVbAcp5EMw4dDMO
         u3BeneQQpjN1WD1hF/nUUqqrh72/G0DwJ9ncKiWNKnlmZjXJcSe+oXThFCweLiXxvl6l
         PPdIEzNTBidE0l+aH6L1H1kN2cmi8xKXSZ3QBWMiZRTF9nOHgzfa4hA1YgFz7vMmVhlX
         H62CaoTszEVaXLWBAaJibSdcj3iWnlEiq0r+ydW7B/yZsU64YpINUTgOW7kKefghfqLL
         60kA==
X-Gm-Message-State: AOJu0YybTuVkQSdDVsbfruUNNGihookdF30u98Vy3S5OlnysXP8tnZ3e
	vn2P1TlniiSMdlhggjN+++HB18/f6j1T2Kf+dM/u1E5tUJoDaOFmVGzY/VSRZA==
X-Google-Smtp-Source: AGHT+IFGv9SYg8LhaAMn2UxpygNhIPirTpgzJo/McI1bKyBy52k/3Lkq06sua9RTPPUzUm97l8iF0g==
X-Received: by 2002:a5d:6dc9:0:b0:342:cd1c:a6aa with SMTP id d9-20020a5d6dc9000000b00342cd1ca6aamr937305wrz.55.1711607104511;
        Wed, 27 Mar 2024 23:25:04 -0700 (PDT)
Message-ID: <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
Date: Thu, 28 Mar 2024 07:25:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com> <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com> <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
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
In-Reply-To: <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 18:27, Elliott Mitchell wrote:
> On Mon, Mar 25, 2024 at 02:43:44PM -0700, Elliott Mitchell wrote:
>> On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
>>> On 22.03.2024 20:22, Elliott Mitchell wrote:
>>>> On Fri, Mar 22, 2024 at 04:41:45PM +0000, Kelly Choi wrote:
>>>>>
>>>>> I can see you've recently engaged with our community with some issues you'd
>>>>> like help with.
>>>>> We love the fact you are participating in our project, however, our
>>>>> developers aren't able to help if you do not provide the specific details.
>>>>
>>>> Please point to specific details which have been omitted.  Fairly little
>>>> data has been provided as fairly little data is available.  The primary
>>>> observation is large numbers of:
>>>>
>>>> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
>>>>
>>>> Lines in Xen's ring buffer.
>>>
>>> Yet this is (part of) the problem: By providing only the messages that appear
>>> relevant to you, you imply that you know that no other message is in any way
>>> relevant. That's judgement you'd better leave to people actually trying to
>>> investigate. Unless of course you were proposing an actual code change, with
>>> suitable justification.
>>
>> Honestly, I forgot about the very small number of messages from the SATA
>> subsystem.  The question of whether the current mitigation actions are
>> effective right now was a bigger issue.  As such monitoring `xl dmesg`
>> was a priority to looking at SATA messages which failed to reliably
>> indicate status.
>>
>> I *thought* I would be able to retrieve those via other slow means, but a
>> different and possibly overlapping issue has shown up.  Unfortunately
>> this means those are no longer retrievable.   :-(
> 
> With some persistence I was able to retrieve them.  There are other
> pieces of software with worse UIs than Xen.
> 
>>> In fact when running into trouble, the usual course of action would be to
>>> increase verbosity in both hypervisor and kernel, just to make sure no
>>> potentially relevant message is missed.
>>
>> More/better information might have been obtained if I'd been engaged
>> earlier.
> 
> This is still true, things are in full mitigation mode and I'll be
> quite unhappy to go back with experiments at this point.

Well, it very likely won't work without further experimenting by someone
able to observe the bad behavior. Recall we're on xen-devel here; it is
kind of expected that without clear (and practical) repro instructions
experimenting as well as info collection will remain with the reporter.

> I now see why I left those out.  The messages from the SATA subsystem
> were from a kernel which a bad patch had leaked into a LTS branch.  Looks
> like the SATA subsystem was significantly broken and I'm unsure whether
> any useful information could be retrieved.  Notably there is quite a bit
> of noise from SATA devices not effected by this issue.
> 
> Some of the messages /might/ be useful, but the amount of noise is quite
> high.  Do messages from a broken kernel interest you?

If this was a less vague (in terms of possible root causes) issue, I'd
probably have answered "yes". But in the case here I'm afraid such might
further confuse things rather than clarifying them.

Jan

