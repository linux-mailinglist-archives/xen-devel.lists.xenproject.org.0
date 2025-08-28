Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57890B39A38
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098319.1452405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ura0g-0001cT-Ph; Thu, 28 Aug 2025 10:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098319.1452405; Thu, 28 Aug 2025 10:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ura0g-0001ZZ-MU; Thu, 28 Aug 2025 10:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1098319;
 Thu, 28 Aug 2025 10:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ura0f-0001ZN-3q
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:37:37 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 031e2c59-83fb-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:37:36 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7ae31caso134824566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 03:37:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7aad5d61sm882311066b.105.2025.08.28.03.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 03:37:35 -0700 (PDT)
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
X-Inumbo-ID: 031e2c59-83fb-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756377455; x=1756982255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nY/zdm4mVfn+USRj1Q9/2U0cRyYqFbRAvd04hLe4x3Q=;
        b=LCfa13gJLpPhK0hSN86DE7bsITRgB+0Rhofd9ozbuoo+iXCOn5hu+Zn0ICI7eB176u
         kBGMXyfp7V1D7fWDHnICFMNecOYNh8Bkx+brXZmrxLEUFU5//YEF4RXTRACk4RB4fwDB
         3gG6+8CzkNm9jYmL3euPFlR0qljUg6Kd6vSYuxvWhbJwiCXIGwUiv0YIUPQqxC9ZDsXw
         VxSDS0SiaQRaq6pi8yNkesc8yMAQ3lUr2A70vp1H+rIVabXkUCykPq+6i6M6Vi7EQNfw
         1KagMLLNxGWWBftTyjX3kPiCCa4Ga83wyUpWaKOma0eddfyxKMI8V1hfWMSjm1TtyzfL
         Vnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377455; x=1756982255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nY/zdm4mVfn+USRj1Q9/2U0cRyYqFbRAvd04hLe4x3Q=;
        b=euh019MW626NejxnPO4rg+tfgJskpyF3/MoAkcgtW0um9Msc5h8Y6I/14xojKEuTgU
         lSLmYGiLNQ6lszu0NWRjb7DpyT55i8kZDZ7lyE9jr9NxBY8fG0x++d0r6Nrnv7+tDoYt
         4NkYs8KphZXn05g9ZXlCNMvq1truHszjeY5kHDrmDPzfZcFf9WugCd7yY88gA1qEBu9d
         aihYKxMx0t3DpvbqKPl5HwIBCiOZjvfwDIlDl7EqWQWWC25y54R7J+MaKe8vU/UGRNGN
         OZMAoNZvlPr1x8OX5bA3ItZnv/9SrrUQGwE2/zl1awTWLwPObkr3AxHPx84n1cG983Nx
         6dtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAwKNE83fBx66KqGJwsq4jkmVh11SWzZjXkkcxoJ7cVtMnTVai7lTD6PFOmKcRk61dLWmOPEZ/fbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv4DnZ1ZsLhvLU5PCWWRS9V7RkuBwSabenlXkw7n6GqAbJ7TDs
	B3ddRJ/GFBBVwybE4mILBcvYozLAOi3JJiVCo/3KlZofS7XUcBB4O1FtXswI+VmgWA==
X-Gm-Gg: ASbGnct77UTvUB07Jrzrnx3LT2t60SnRGWZg/752FWi7AGN8gIYh5jAXJ0eWhjjBa64
	DvZ+S1R54BcEottsMaJk1voTQALV2TZdpEwVtOyaWn/SdSwduhXNE1feYRpidSr2HcajFgqFFkK
	4bXoidwEeaaXDYYIf+wJIXtwdjrgsPt8wsjPc1fB2fyO3q2YTMEPFhtsXD4WDD1N6sEB868zXOS
	O4RPwX+D8Dp3tjJGH58DgBJ+ukYfsoB4FZECzOVSP6AZ09VYvb6BMaJA6nZt0H5WnaNFCQ1YOx3
	ZBP3jbwjvpU6uw4K9bgvDUEovxFg4P1sbXfTOcmCQqxF3yoXkuLCPhb93CAFHHa0yyWvhoZRm8n
	78YfsNA68ARHMBdYI1fdwIvonmYvwxAxMZm+tHzn/3QPnsAeGkjjl30GDuiGqP/xyzrJvR8/dbv
	fuqJ8NN9I=
X-Google-Smtp-Source: AGHT+IFm/aEgD/qwq26PK3mwB+1Y5O7IqjYAG+elJMDo7zCPcb3MyZpNumI7r4RhbH8A+Dex1pVQOw==
X-Received: by 2002:a17:907:60ca:b0:aeb:3df1:2e75 with SMTP id a640c23a62f3a-afe29748f87mr2205302666b.46.1756377455494;
        Thu, 28 Aug 2025 03:37:35 -0700 (PDT)
Message-ID: <8f01edef-a766-4211-903b-e064b36ce27c@suse.com>
Date: Thu, 28 Aug 2025 12:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvmloader: Update to SMBIOS 2.6
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <b569a298a6270ae04eaf433f7de9ce1f3e248e5f.1755870287.git.teddy.astie@vates.tech>
 <6e9b7b96-a506-40ed-95b6-6ad00ba9a27a@citrix.com>
 <1901e764-9725-4e9e-895a-54c704473510@suse.com>
 <50c15166-b3b5-4e17-8bcc-cb37ad03f0ad@citrix.com>
 <e24606c1-3f54-44aa-a78c-6cb36be3d5f3@suse.com>
 <bad9ece4-a95d-4fc1-83b2-dc382f9db438@citrix.com>
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
In-Reply-To: <bad9ece4-a95d-4fc1-83b2-dc382f9db438@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 12:31, Andrew Cooper wrote:
> On 28/08/2025 11:22 am, Jan Beulich wrote:
>> On 28.08.2025 12:01, Andrew Cooper wrote:
>>> On 28/08/2025 8:07 am, Jan Beulich wrote:
>>>> On 27.08.2025 19:47, Andrew Cooper wrote:
>>>>> On 22/08/2025 2:47 pm, Teddy Astie wrote:
>>>>>> Currently, hvmloader uses SMBIOS 2.4, however, when using OVMF, the
>>>>>> SMBIOS is patched to 2.8, which has clarified the UUID format (as GUID).
>>>>>>
>>>>>> In Linux, if the SMBIOS version is >= 2.6, the GUID format is used, else
>>>>>> (undefined as per SMBIOS spec), big endian is used (used by Xen). Therefore,
>>>>>> you have a endian mismatch causing the UUIDs to mismatch in the guest.
>>>>>>
>>>>>> $ cat /sys/hypervisor/uuid
>>>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>>>> $ cat /sys/devices/virtual/dmi/id/product_uuid
>>>>>> 3fe665e8-303d-0b4f-83e0-8fdfc1e30eb7
>>>>>> $ cat /sys/devices/virtual/dmi/id/product_serial
>>>>>> e865e63f-3d30-4f0b-83e0-8fdfc1e30eb7
>>>>>>
>>>>>> This patch updates the SMBIOS version from 2.4 to 2.6 and fixup the UUID
>>>>>> written in the table; which effectively fix this endianness mismatch with
>>>>>> OVMF; while the UUID displayed by Linux is still the same for SeaBIOS.
>>>>>>
>>>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>>>> ---
>>>>>> This effectively changes the UUID seen with UEFI guests as it was
>>>>>> actually inconsistent with SeaBIOS and SMBIOS expectations.
>>>>>> ---
>>>>> I agree this is a real bug and needs fixing.
>>>> Hmm, I didn't realize this is a bug, and hence put the patch off as 4.22
>>>> material. If there is a bug being fixed: Teddy, please add a Fixes: tag.
>>> I'm not sure if this has a reasonable Fixes tag.
>>>
>>> It's a combination of an ill-specified domain handle format, and using
>>> an ill-specified version of the SMBios spec.
>> But the problem was still introduced into the code base at some point. Afaict
>> in c683914ef913 ("Add code to generate SMBIOS tables to hvmloader"), i.e. when
>> smbios.c was first added.
> 
> The thing that changed was the SMBios spec, in version 2.6.  It went
> from having an ill-defined statement of what a UUID was (and for which
> Xen's code was a valid interpretation), to stating a MSFT GUID format.

Fair enough. I'd still prefer to have the (slightly questionable) Fixes:
tag, to serve as an indication that there will be a need for backporting.
Or else at the very least a statement to the effect of there not being
any good Fixes: tag to use.

Jan

