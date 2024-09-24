Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99449847E8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803021.1213412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6kL-0001ix-2N; Tue, 24 Sep 2024 14:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803021.1213412; Tue, 24 Sep 2024 14:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6kK-0001hS-Uu; Tue, 24 Sep 2024 14:42:32 +0000
Received: by outflank-mailman (input) for mailman id 803021;
 Tue, 24 Sep 2024 14:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st6kJ-0001ga-O1
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:42:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39788c3b-7a83-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 16:42:29 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c718af3354so787662a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:42:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930d0d65sm92466266b.141.2024.09.24.07.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 07:42:28 -0700 (PDT)
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
X-Inumbo-ID: 39788c3b-7a83-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727188949; x=1727793749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7BDsMqa7pyb17Zeb5tY5wFvDZPVq769OK0ygnb2ULlY=;
        b=WvYqDuFEn/E3hHWxQ7U7E+bKnifu1O6mJaEGq4R+Y2F/IsOtpDXxdPvoohY5v6UhXX
         mdXRineQ9+KlE9gk28OIpAXlrA0xR8KmQhoX0D4I1Kz438tF6HUCjz4Z2jQg2X85uFDw
         1/WJ9IrMAIoAPrGCWDATk6YdIPPcPJxhBS25kG/4zJqmeYeYWn0sNKUe877ArzJaS0UW
         c9ZzH9YeimII+xDHY81mmmZUYsxEXh0CQwOcAteYJ9RH0QEmyrO39A9N2V5lMxutA17s
         Sa0AIpq92jbM5nE4TngDM3yWH9rW4OZBNfEn6jLCtTMqrT70SMeCvXL+6t0ZKjKF2oa+
         dQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188949; x=1727793749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BDsMqa7pyb17Zeb5tY5wFvDZPVq769OK0ygnb2ULlY=;
        b=WjGkH7S3Dkw3m5O9b13OFdjawSpFBGsjVSmJ0ohT8zRhVS8YS/Q5MdP8uufut45BzP
         1FJCr7CmwgD6qzOTQdLKPi+okMLQx1qJYGlWehhGIk9xqRGTcAPfRXCEB8qzJciFAWVr
         T/EdKADz2cvWOTbwAbZ7ErMMUVmmCkVJwbEFMlMOFpvwX5nqA12scWrfp5BmujAONYnP
         5mdUtLtF4AZWq3rnATRPeecUrWsKHy0tJ8bYNVpVTcAVF9ULtre7ZHJQKGdm4cuX5Ibx
         n2O2NCVGGEgbPRbz0TcMFZTEOhWaCmZW/MR86cmXNJh+GLW1H4pjLxuU7vqy3pPmcYCJ
         LpcA==
X-Forwarded-Encrypted: i=1; AJvYcCW2qxPy8ugPAffAbWT6loqkRDTyyHittiYFYfnWMxR3eF//Qac913Jis/zwtS99EdOwzWkN72/B2Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1qqk2zySg0BjKz0WIBqe+D3qaTGHdMDU85VpHLZU2f/KROYAl
	qrMqkQpzNqhbmUtl1c57qwuMw9AIKjq4OsNdw2nvmlu7tIbFQBc9tGOWNXykrA==
X-Google-Smtp-Source: AGHT+IEp8hjDJk/9LYleO4Mh6Jlk1yAst/LwjZXWI/aIi2d6Q7qUrCiB0ts3BZxtpR6bxtk+ezan/g==
X-Received: by 2002:a17:907:1c19:b0:a8a:86f8:4eed with SMTP id a640c23a62f3a-a90d4fbc65cmr1658955866b.10.1727188948958;
        Tue, 24 Sep 2024 07:42:28 -0700 (PDT)
Message-ID: <917c5b68-0149-4bcc-91df-3da7ed9119ef@suse.com>
Date: Tue, 24 Sep 2024 16:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-4-frediano.ziglio@cloud.com>
 <7b684c1a-0e3b-412a-ae44-995463510fa9@suse.com>
 <CACHz=ZhhV2bwaCJBOb2_zpe3-Z0wF7FXXMB2_WfYgOwr=3R_SA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZhhV2bwaCJBOb2_zpe3-Z0wF7FXXMB2_WfYgOwr=3R_SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 16:28, Frediano Ziglio wrote:
> On Tue, Sep 24, 2024 at 3:17 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.09.2024 12:28, Frediano Ziglio wrote:
>>> No need to have it coded in assembly.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>>> ---
>>> Changes since v1:
>>> - update some comments;
>>> - explain why %ebx is saved before calling efi_parse_mbi2;
>>> - move lea before test instruction;
>>> - removed asmlinkage from efi_multiboot2 and add to efi_parse_mbi2;
>>> - fix line length;
>>> - update an error message specifying "Multiboot2" instead of "Multiboot";
>>> - use obj-bin-X instead of obj-X in Makefile;
>>> - avoid restoring %eax (MBI magic).
>>
>> Despite this long list of changes earlier comments were left unaddressed.
>> The new function is still named as if it did only parsing, the stub change
>> is still in here and (if already not separated out) not mentioned at all
>> in the description, and (as Andrew has now also pointed out) the
>> declaration of efi_multiboot2() didn't move to a header. Maybe I forgot
>> some more. Please make sure you address earlier comments before sending a
>> new version.
> 
> What about renaming efi_parse_mbi2 to "efi_multiboot2_entry_common"
> and renaming "efi_multiboot2" as "efi_multiboot2_entry".

I don't see a need to rename efi_multiboot2() as well. In
"efi_multiboot2_entry_common" I'm having trouble seeing what "common"
stands for. Imo a small improvement would already be efi_process_mbi2(),
as "process" covers parsing and the handing on of the result of the
parsing. However, if already the new code can't be folded into
efi_multiboot2(), how about naming the new function
efi_multiboot2_prelude()?

> I remember I replied to the stub change and nobody get back, so I
> thought it was fine as it was.
> I also replied to the header asking for a location to put it, and I
> don't remember any reply.

I'm sure I gave you a reply, but that was only yesterday, after I was
back from travelling / PTO.

Jan

