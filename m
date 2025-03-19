Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7B9A689D1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 11:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920233.1324459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqq7-0005My-Es; Wed, 19 Mar 2025 10:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920233.1324459; Wed, 19 Mar 2025 10:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuqq7-0005Kl-Bk; Wed, 19 Mar 2025 10:39:59 +0000
Received: by outflank-mailman (input) for mailman id 920233;
 Wed, 19 Mar 2025 10:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuqq6-0005Kf-0E
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 10:39:58 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f337492-04ae-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 11:39:56 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso6055639f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 03:39:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3996d998545sm4496675f8f.34.2025.03.19.03.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 03:39:54 -0700 (PDT)
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
X-Inumbo-ID: 7f337492-04ae-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742380795; x=1742985595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6o8eMnNEU91mAqF3t/D+u0YZYgwW08FFjsMXlU+9VPo=;
        b=eMi/mKmOORlCLUL/+NQAFc/j5rnq3Akc2h8ADUTWzQlShLTOcEIb2NUg92f5hW8wzi
         hgkbMakrSIJfIiNqbg4Y5w8PH7xMeQfEqDGybN52h6sFXilZsR16dhprYsNOkJr+VBm5
         0f0S3KfMmrJeypfH50ctLN+66lRZ1I3OwiEdPSkxIEwLeQXyv9K00yUxIhNm/A7/eBSV
         Llo97qbmlKqb/s34Kq2k7pLUp4H8+0nBihBMeP2Vkfy5kUE20wRygwBD1+Pl2kWO70B2
         9jVZpTzuveMUEmv8jK1pP03c12Kv535yqa7L6y4l7qFN6ajCyLlEgCp3TTFVpVOh4BER
         mGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380795; x=1742985595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o8eMnNEU91mAqF3t/D+u0YZYgwW08FFjsMXlU+9VPo=;
        b=Swxa2MiSWjYyhYUsoqVM1r32E4+Wa00/QdVTDSJ4QW5/T9qLn87EwXrgGVyehvzHmU
         TEoe3tREiMJI+Iz08VjPttujkcTppseA76r7wemt6R0eVlDNr/y3CjKt2mkmu1LFJQc3
         o8tciYUWh1d+nRWqLmD1bHSrm5sx5Is9HHw4dVwO04BWSA6p7poYgxRa7qwju7aTGOPX
         a28eZxozs9Vno5x4S0P7w9m3pTVG7Emmi39mM1MWZg2gp3RjARXjBBmHNoesMGfM5nyU
         2CoZen+uxXmlpZSZ44ko5TnY2SQ8l69Z+Q66Yx2erwPSGKdL95oFdGhQ5oCvsC0REGzX
         X2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWpWzW0CggjEa9s/admJpMDl6gOo/TweJt527wRZ0/Iw/eOmWA0mtAEUph5hXJuVShyms0XruUY7aA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6ZCQOWrj3L+vVQgflJV4xPVOFBhmpO2uM09iFeTfpf3iW7uZ0
	aZlED7D56Pv8mbLekvHhqs3sLmI83xm/MiFE9kB8+dDyYsJxjEXTQI4oN7IVRg==
X-Gm-Gg: ASbGnctu2kURnEuJxfEBBJOlqmpW99xCbJ2WitxQM2aFZJpR6RklBOag2JVlHZNlW5a
	hj20OFbmtZ4YdoqXctZX5Xo8ZCe5aZwO1Cruo+eqSvHyf0yZXcGbcEhnQAxwRedtfLsw5knuozE
	fMrFuCAWqvp+0Rt9l8PNHJqnQkl9HpVAyk2gZtVmFylMnP4Ql/KFtVnWh1sU152+inXQ9OqPIMD
	WUsnD8zq3n1vUpJEK5BUkoTSa99JKSD4Fz6vGoDWgfqtbwTpFqX5dQla/uxftdB48Vv8wx+1qvz
	CFIb7ZxjDt5OEi81X6Io4r174uHjjrdZS4pgcqRZ+rlso0qeEPLwjppRfERwjYwJe94szrhfTgF
	GJzMoF0nlkWoDuOgnxOol7TUFC6dHXLevLWROaZaV
X-Google-Smtp-Source: AGHT+IG9i51GlTb942C5ihsmogIc9jwtGqVhW1nvYyc1zEeQFwX7HwO+FHBl026kMNQgLvBQXIrZnw==
X-Received: by 2002:a05:6000:2b03:b0:390:fe4b:70b9 with SMTP id ffacd0b85a97d-399739d482fmr1705354f8f.21.1742380794749;
        Wed, 19 Mar 2025 03:39:54 -0700 (PDT)
Message-ID: <388596f8-02fa-4d95-a35d-4e0c44a70c16@suse.com>
Date: Wed, 19 Mar 2025 11:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] x86/efi: do not merge all .init sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-7-roger.pau@citrix.com>
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
In-Reply-To: <20250318173547.59475-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 18:35, Roger Pau Monne wrote:
> As a result of relocations now being applied after the trampoline has been
> copied into the low 1MB region, there's no need for a single .init section
> that's writable, as .init.text is no longer modified.

This builds on the confusion of the two different types of relocations that
started in the previous patch. The change here may be okay once that other
aspect was clarified; the description would need extending then, though, to
cover both kinds or relocations.

> Remove the bodge and fallback to the layout used by ELF images with an
> .init.text and .init.data section.
> 
> The resulting PE sections are:
> 
> Sections:
> Idx Name          Size      VMA               LMA               File off  Algn
>   0 .text         0019072c  ffff82d040200000  ffff82d040200000  00000440  2**4
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   1 .rodata       000884c8  ffff82d040400000  ffff82d040400000  00190b80  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>   2 .buildid      00000035  ffff82d0404884c8  ffff82d0404884c8  00219060  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   3 .init.text    00052866  ffff82d040600000  ffff82d040600000  002190a0  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   4 .init.data    00059730  ffff82d040658000  ffff82d040658000  0026b920  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
> [...]

Just to mention it, also because Demi raised concern: This will leave us
with yet more sections with long names. We may want to consider to e.g. use
.init.t and .init.d instead. (Of course there's nothing we can really do
about the various .debug_* sections, as those can only be identified by
name. The only option I see there is to strip the binary.)

Jan

