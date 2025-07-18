Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B5B0A5D8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048816.1418998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucljF-0000x9-7k; Fri, 18 Jul 2025 14:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048816.1418998; Fri, 18 Jul 2025 14:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucljF-0000vJ-4E; Fri, 18 Jul 2025 14:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1048816;
 Fri, 18 Jul 2025 14:06:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucljD-0000vD-4x
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:06:23 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 616e766e-63e0-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 16:06:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so1521396f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:06:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e2506sm1347053b3a.26.2025.07.18.07.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:06:19 -0700 (PDT)
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
X-Inumbo-ID: 616e766e-63e0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752847580; x=1753452380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vt0vGEt6H1gEYF+EXpXPRhePk8Q3KqI9XUZZeWKMNE0=;
        b=PTCz1rzCzM1yQvjrb2N2VKBZccj/fC7bgj1w3LwKdLSf31Lyh+0pAEyjK3oogoPDyO
         ctpwg4QqwSlws2xSMWdIAr4W704AOXMgHf3NL7uO2SW2phuuIvZNsP/wSxTILpCWyAWm
         ml9kBV+vh1bcuA6s7/Uhlp4ntwIsgr9pGqc5hnuGKaO4aL/Ir4QIu8T5lVZSszZ6NSgQ
         VbkGImJgkiUxR++5dVNsqCb6WoURzjaO6G1D3jhCOqs/hvsnevXWtKJAZDUjtFDzDUBW
         m+NyKVBjcaDC6UwSfzjkOrp/GkyqIGnVm7GqrNrtV1j4qjbah/NiGhvQE6hGJXGDZMFX
         2YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752847580; x=1753452380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt0vGEt6H1gEYF+EXpXPRhePk8Q3KqI9XUZZeWKMNE0=;
        b=rFy0c+2eJGcR/oPlUbKBv2o+a0pJ2QSPOC+p1bFbCm0b8eIaIdQUpabkRfRRzaBvx4
         G5Zbhy2tBbovpsFyUWGh84zWg8d/l3l4pMwlQ+BKSwNURlSY0EfHDbFOpJ9lYYxPyw1T
         KjLK6npegdj7jI7PChP3fmdvMTZMiN6dtMP6hXt2mDM6Nw4m71ZjyypnBG9KvSr5XGu+
         kgHN9te5br6DXVOf8Scy0S8layBYICqPiovbthvShfF4/WWIZePAC7eZFvHnhNJhoyBX
         EMhSawdz7lXdfbPsmdgOUJyJ7pstbBa8K8qVtmiV6PVi5vPeSESyS+wItlUXEViQKnKo
         yKcg==
X-Forwarded-Encrypted: i=1; AJvYcCUdxsjsDzMTL9Ip9ow0xXhMK1BqetnlYIRI2m8eRNiccS0cIuJxmWz6ZR0Racp9gMRmYpJjF8jj4A0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuGUJHj2Lg4UWmSVWSNeghoBefKeFd2Yk5a5F2wHVu8TPYHsQa
	snsbtnBW7ghSwhwNmNRn23JNNB0LkkjSrPaiKPYRplb+rnUOY53xzlEwvN1WRUld8g==
X-Gm-Gg: ASbGncvnMvGUA+g4yRloOiQULPb9Qhfjfer9fGLND24vtsxnZ4WgcVbfsRoOx9itbES
	fC7ElUuDsP4qBvDXkhT2lf8O+tq8WZqgfRFEmkr0omaaG0F08XEdvfzP+rev1Pj+6DsRvB2c4N8
	ZEAp3xFblPlLQncA2ln+djIWKiEbPcC82hH39S5Zciotn1rrZJE2lMk5xOGvIet6YWtz92T0qoR
	tP49BAsTDxQ6lgbusTfS9417q54MIrRGMaD+dCpUX0X0pg3PdJVMypcqCjByod5KPaRJRjRPPKO
	4R98E8abUhQcr1ZuJeJf7RPvTioV+QFhUfXQdEe8I5c39Tg9bd8CaxQHROKQerBzY1jf2YrtjDR
	Z78yCYQfeOCOtOCSnju3BrF43l56Xus9tG/2B7E1KGTwIhrN4SyxU0CRBLd8ihwpXH7gdsUZh4s
	ZuhXIlGQmlEmdZ+J11/Q==
X-Google-Smtp-Source: AGHT+IE7aA8xMZBTTYAkTYVvGyWfK9qW2z7zNdbcx2gU2NX+sool4RSIocscBFp3OM9JbMXox8SALQ==
X-Received: by 2002:a05:6000:2c11:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3b60e4b80a6mr9893334f8f.10.1752847580094;
        Fri, 18 Jul 2025 07:06:20 -0700 (PDT)
Message-ID: <44b890e3-56a4-48da-a5b0-2aae87dc2f77@suse.com>
Date: Fri, 18 Jul 2025 16:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 6/6] x86/apic: Convert the TSC deadline errata table
 to X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <20250718100739.2369750-1-andrew.cooper3@citrix.com>
 <4de09b8d-d71d-439e-be1c-78044a3cad31@suse.com>
 <9c820057-3e36-45dc-b71a-95c9d2dc4398@citrix.com>
 <772fd747-199c-4635-9f35-91468b0d12e9@citrix.com>
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
In-Reply-To: <772fd747-199c-4635-9f35-91468b0d12e9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.07.2025 12:55, Andrew Cooper wrote:
> On 18/07/2025 11:23 am, Andrew Cooper wrote:
>> On 18/07/2025 11:19 am, Jan Beulich wrote:
>>> On 18.07.2025 12:07, Andrew Cooper wrote:
>>>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>>>> helper to match a specific stepping, and use it to rework deadline_match[].
>>>>
>>>> Notably this removes the overloading of driver_data possibly being a function
>>>> pointer, and removes the latent bug where the target functions are missing
>>>> ENDBR instructions owing to the lack of the cf_check attribute.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
> 
> Actually, this isn't as no-functional-change as I thought.
> 
> X86_FEATURE_TSC_DEADLINE has been swapped for X86_FEATURE_ANY in the table.
> 
> check_deadline_errata() is called unconditionally, without checking for
> TSC_DEADLINE, yet the rows in the table are the CPUs for which an
> erratum is known, so they all have the feature.
> 
> It does make a difference if e.g. one were to boot with
> cpuid=no-tsc-deadline.  Previously we'd have exited early, while now
> we'll emit the warning.
> 
> We could switch back to using TSC_DEADLINE (requiring a more complicated
> X86_MATCH_*() wrapper), although a better option would be to predicate
> the call to check_deadline_errata() with a feature check, because it's a
> much more recent addition to AMD CPUs, and there's no point searching
> the errata list on CPUs which lack the feature.

To be honest in this case I'd be fine with either adjustment. Switching the
feature back is more consistent with the overall purpose of X86_MATCH_*(),
but as you say a table with every entry having the same feature named isn't
very useful to go through when the feature isn't there.

One option to keep things table based, yet still avoiding to run through
the entire table, would be to allow for a "negative" entry (which here
would simply be placed first in the table).

Jan

