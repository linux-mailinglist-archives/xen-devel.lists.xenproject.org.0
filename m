Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8CEAD2F60
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010564.1388688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtvE-0004EL-Is; Tue, 10 Jun 2025 08:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010564.1388688; Tue, 10 Jun 2025 08:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOtvE-0004Bq-FY; Tue, 10 Jun 2025 08:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1010564;
 Tue, 10 Jun 2025 08:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOtvD-0004Bk-1p
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:01:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b7fc16-45d1-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 10:01:18 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so27504445e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:01:24 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452ec06d9aesm127741865e9.15.2025.06.10.01.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:01:23 -0700 (PDT)
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
X-Inumbo-ID: 16b7fc16-45d1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749542484; x=1750147284; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZk9paXdDCd27tnOfR27Ep0WF1h8iUcDD+Ad36raOo0=;
        b=MRe4d4rZ08xmqVVZgq9HY3iVXjxZAOMgd4OCIkcT4JYLI6CIjXGRjY+Kpx7WcB6276
         iUgG8WrW6PH5q5ynhj2wezitzQs1oFo/YJTfWS0DBrVU0g6fmytEJ79lUYTCeeUnoav0
         8D2L0AtywL/fwGGhIjktVSvhVKcRoNQHVU5SN6inqEENtd2UnDOakopTeHSAlECbzIvs
         BI+o8Ouy/CDh9p0qmJJCFqP8qOJog9sZbvybpF8hoeMQNMcjzLi1i7HOeI4Nh2140ULa
         apc3NIOptggJys1hD0lHTp27+6WCS4uT4B0syh5KCSEdRtjXm+8A/CHcpn+hyYCAPMF9
         YxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542484; x=1750147284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZk9paXdDCd27tnOfR27Ep0WF1h8iUcDD+Ad36raOo0=;
        b=R27OfdD6D7307PkwD7qFO0D0Y0w84quDxSZjmVea+X+HL82TqAX8KLNt78GSBTsxpn
         llegGFvxiUJR+qlKN7jS/n9nR6ooO2FShW3GhB6Xc+UIumywhD5nSTLiRNwYBi5/TvfM
         9NYOr+36fpO9rE9bSlsuum7wn5N1VWXbP1o78Rsc4s+Uc62j8ldJFKxbP60spGYuwShJ
         XPB17qB7bLQ2+9QOokiWjwX15d2TX8SbRMQYDQF0LwA1aNzymB/jK3O9e2FfMlFhFElE
         Lqkx+fDpI+7VtRt9l/HckDjJOX8IgA9oXE7TQZhis7xtPWZuvoi6sLCCY/aRnSoR6xZd
         KrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvGPOIQHOhMoUAW0oNPlbkfRhgz1wVfSj7S6084zZOFrDrVCSnAAenUgPtLmKjqrtWFzPJ5F1LSAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmZOtvF7p399N3RKaTLtt5JyuSG27pgxRrOmwso78ER4vkd7Ly
	a4bA+48XiqIirwfFdN+9VnapMAuhJ0ei8Y2Mxoig9XziI/Np4/zx+U6NlsKpifI80g==
X-Gm-Gg: ASbGncsCbhfMGH39ka6b5C1iA50FssIUNF/YeOTNelsiD4H9vgEkPwW0ahcqRE/nAe+
	K+sDOPAbeX599JvQDS7oYZVGQ55O3BsRgIQcM9dKpvJ9IR2R9fBTiJ7u+cSwgWTq0xuS7JVa1nS
	wRFo91WtS3JX8J/qIMSBi96xKcSdyTpBtQTdf2jAISiiOqowKvkgFHQgwlUsSiXa+lRJgMoH468
	w5fJBhFQ8M11FJ3PeDOKCkP4VsBAvIFFqOGiJrKqMt1aQ8Sdqj2c1t1yqLazog7tvbhGysKhFe0
	5IUoT4MN2I/EdsR5J2wjW+NcJI/mJmpn3Ydymjil0ZvAdNoQzgWupfu9mryhNSyYeoiWvQOhNsg
	DSzSSvRRZI2VCOI2pNvlizQTl12A7S7EYDFSsEUJk67pE55kU4uKXhoI7CbAbQ/uDmbtkzYLVLf
	j43IYafZS5DOjXewkoyxyE
X-Google-Smtp-Source: AGHT+IG+CtceMc5LT1PiMUiPq6ExPTO416qqDhd9Oiplj/HZc2qKyaTC85mtuRoNX7Op9k5fUBwiyQ==
X-Received: by 2002:a05:600c:1d0c:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-4531ceb6109mr19686285e9.2.1749542484166;
        Tue, 10 Jun 2025 01:01:24 -0700 (PDT)
Message-ID: <ab3ad5c1-fd4c-4fa4-abfd-89641173a862@suse.com>
Date: Tue, 10 Jun 2025 10:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/EFI: Fix detection of buildid
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
 <20250605111638.2869914-2-andrew.cooper3@citrix.com>
 <0a314400-126a-4c2a-b36c-dda61bb0b751@suse.com>
 <a477369d-77d0-48fa-8ac4-120d49e32d11@citrix.com>
 <4d1f1b70-e309-453b-bae6-e066d49a417a@suse.com>
 <9200277c-aa8e-4fd9-ab6a-f9e106114f54@citrix.com>
 <6eaf2b27-969a-4326-9726-8b6e0994e006@suse.com>
 <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
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
In-Reply-To: <3f9c5a18-2ea1-4e2d-80a0-773abc3598ae@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.06.2025 17:01, Andrew Cooper wrote:
> On 06/06/2025 8:22 am, Jan Beulich wrote:
>> On 05.06.2025 19:01, Andrew Cooper wrote:
>>> On 05/06/2025 2:24 pm, Jan Beulich wrote:
>>>> On 05.06.2025 14:14, Andrew Cooper wrote:
>>>>> On 05/06/2025 1:02 pm, Jan Beulich wrote:
>>>>>> On 05.06.2025 13:16, Andrew Cooper wrote:
>>>>> This really is a property of being a PE32+ binary, and nothing to do
>>>>> with EFI.
>>>> Which still can be checked for without having this code path being taken
>>>> for xen.gz, too: You could e.g. check for &efi > &_end. That's firmly an
>>>> image property (yet I expect you're going to sigh about yet another hack).
>>> It's all hacks, but no.
>>>
>>> I'm amazed MISRA hasn't spotted that we've got a global `struct efi
>>> efi;` and a label named efi, creating an alias for the object with it
>>> out of bounds in the compiled image.  But even then, it's based on
>>> XEN_BUILD_EFI not XEN_BUILD_PE and does not distinguish the property
>>> that matters.
>> The use of XEN_BUILD_EFI in the linker script should have been switched
>> to XEN_BUILD_PE when the split was introduced.
> 
> That doesn't build.  As I already explained, the stubs aren't split in a
> way that allows that.

Which then is a pretty clear indication that the split was wrong to do in
the first place, don't you agree?

>>> But the argument I'm going to make this this:  Why do you want a check,
>>> even if you can find a correct one (and as said before, I cannot)?
>>>
>>> This function is run exactly once.  We've excluded "nothing given by the
>>> toolchain", and excluded "what the toolchain gave us was not the
>>> expected ELF note".  The only thing left (modulo toolchain bugs) is the
>>> CodeView region, and if it's not a valid CodeView region then we've
>>> wasted a handful of cycles.
>> Two reasons: Having code which cannot possibly do anything useful isn't
>> good. Misra calls the latest the body of the inner if() "unreachable code"
>> and objects to the presence of such in a build.
> 
> It's not unreachable code, not even theoretically.

How is it not? If we build without this CodeView record, it very much is
unreachable.

> *If* there was a suitable check, I'd be using it, but everything you've
> proposed has been buggy or doesn't even compile.

Okay, but we draw different conclusions: You want to do it in a way that,
as per above, imo introduces unreachable code. Whereas I keep wanting to
find a suitable check (or if necessary introduce whatever is needed to
have one).

>> And then, based on your reasoning above, why don't you also drop the
>> #ifdef CONFIG_X86?
> 
> Because that's the one non-buggy way of excluding an impossible case.
> 
> x86 is the only architecture possibly linking with pep emulation, and
> therefore the only architecture to possibly have a CodeView record.

And how's the, say, Arm case different from the x86 case with no such
record built in? Either it's unreachable code in both cases, or it's
not.

Jan

