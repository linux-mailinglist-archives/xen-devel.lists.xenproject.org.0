Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08AA5BADF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 09:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907380.1314611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trv0k-0000FL-QF; Tue, 11 Mar 2025 08:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907380.1314611; Tue, 11 Mar 2025 08:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trv0k-0000CL-NT; Tue, 11 Mar 2025 08:30:50 +0000
Received: by outflank-mailman (input) for mailman id 907380;
 Tue, 11 Mar 2025 08:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trv0j-0000CF-13
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 08:30:49 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21b3b449-fe53-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 09:30:47 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43bdf0cbb6bso29753195e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 01:30:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf85f2359sm62639795e9.27.2025.03.11.01.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:30:46 -0700 (PDT)
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
X-Inumbo-ID: 21b3b449-fe53-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741681847; x=1742286647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NeOT9yjFW4+lu7zXuk2xv6YrS4zcSxuum+KE267DlGQ=;
        b=dq65JGmpPminiVz/ZPnYRCBeDe/9Tu9GQAFEmPSnfsjChwT/oyX5elr8sDiChgpdpr
         PMZZLUCqBmoWgmmc5bbyezBg90iGz4bB2vuG8R5FfxhKBoebqfQU4zDPxrWiUgQpNleM
         xyXiOWoOtTW/d9cv34Q88foxU8es78ZviUksMg7p3X2FOVUgkTc+yjRaB29n7YVIlacU
         h0wGN2VdX4o3KNsl7G64VP+WkuIKmsXCyOfhL3j0CUQvWZTbfduj9lbf3RhspBiomTr7
         k0AgV17jWZnYOGqdHuUfCQHNTJVxgVYqmFonYGBkWGyOY+SXaTcUhD4Jbv7ivQmjnnO6
         RZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741681847; x=1742286647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeOT9yjFW4+lu7zXuk2xv6YrS4zcSxuum+KE267DlGQ=;
        b=oVNOFdxb0mjA+r6ZDGaCQBebBGGJRZvyWbAG0EpKCAKt45puvC7wgjOTIOHqHbTr1E
         LRrCh9zUyMkABrbKvuy7khRSiPrnY619aZPKUZcNkB0sUDzd9xAiDVtTtpHiEwudtxUR
         zEM+0m64KbMo64xcbaPn+tiesfhqZsMALZ2p6UIbaOFjBXg12M6oANyUouGStao4dS7T
         yknz9ggjv0iddcys7H33bml6exkTuColwwOXny0RFaXYj6IwvJkAnvQoFzpOuy+KW7An
         zkU27L2GmDEeCE9z28QAh8bO2JWVq686/OSlgR0e3rNGKYttXhGamQqP62V+Nba3ie8+
         ayaA==
X-Forwarded-Encrypted: i=1; AJvYcCV44Z2FQ4YoqncE+BzIXvTlvDmWjOkE4hJAow8TUX/sV8mjFLek7Lye1+f+fDVbjCLJ3ihtbnJZJfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZepstQyAUa+nL3HLyqEpd88uxvZfYIeACqSLjAYJ9zbBnVoSX
	zVKSLiPuyPg7QusAlpDTHkLS9NNGyrmE19m9Dlaxee1b30XnoyKK6wNvkutpAA==
X-Gm-Gg: ASbGncsmylWOh1aUbEjg2LjCxWr1si6CtgRbpT/jCXvXKBNJ5NxdhBCgHeBv93gZhc4
	8kKv7KPGBWshOjgNFZXsrWy+LRY1hIDOSQ5kamJvxghiLlOYOBrzu9co/MZbsO/bH0S4N9oisED
	SeTr/D0LLyRNAYnt/L9b3597gMcN06RKvY+C61Xk5oSYlsmSOhtRIl9JVtOBlExTVAdNRMlIx/e
	EheOP4BFU23/qCaFTN5GMUXWzzZlxk6s3F0Rqw5qXq0HH+XL0wPIOD2BTd8ijZ2MCyGgERIZtGB
	GHU4mUUK0977IA35tpmXYs06oEMJtdkGQAmSU5lQiRsi/7SFKaep0rZpzvLIm8SKGSSv/XRBXcH
	UFUqf+nIwxAOfQ9cui7mKF9w0RQmoPQ==
X-Google-Smtp-Source: AGHT+IErXzIowSpxHG0L9rzRinB1cNH8dX6hf11a6MDkXTC+SuQlTIUNhhDNU7p58wbW5ukUvB95Yg==
X-Received: by 2002:a05:600c:3b1d:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43cfe15436emr54371565e9.18.1741681846738;
        Tue, 11 Mar 2025 01:30:46 -0700 (PDT)
Message-ID: <5f207284-d206-417a-b963-c922119abe33@suse.com>
Date: Tue, 11 Mar 2025 09:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Mark ACPI SDTs as NVS in the PVH build path
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250310152523.81181-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250310152523.81181-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.03.2025 16:25, Alejandro Vallejo wrote:
> Commit cefeffc7e583 marked ACPI tables as NVS in the hvmloader path
> because SeaBIOS may otherwise just mark it as RAM. There is, however,
> yet another reason to do it even in the PVH path. Xen's incarnation of
> AML relies on having access to some ACPI tables (e.g: _STA of Processor
> objects relies on reading the processor online bit in its MADT entry)
> 
> This is problematic if the OS tries to reclaim ACPI memory for page
> tables as it's needed for runtime and can't be reclaimed after the OSPM
> is up and running.
> 
> Fixes: de6d188a519f("hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region)"
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I really, really, really dislike this idea of accessing the MADT from
> AML.

I think this isn't Xen's invention, but something I've seen in various
systems' AML.

> In time I'll try to implement something to stop doing it, but for
> the time being I find it preferable to align libxl to hvmloader rather
> than trying to restrict what's reclaimable and what isn't.
> ---
>  tools/firmware/hvmloader/e820.c | 4 ++++
>  tools/libs/light/libxl_x86.c    | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
> index c490a0bc790c..86d39544e887 100644
> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -210,6 +210,10 @@ int build_e820_table(struct e820entry *e820,
>       * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
>       * before an ACPI OS takes control. This is possible due to the fact that
>       * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
> +     *
> +     * Furthermore, Xen relies on accessing ACPI tables from within the AML
> +     * code exposed to guests. So Xen's ACPI tables are not, in general,
> +     * reclaimable.
>       */
>  
>      if ( acpi_enabled )
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index a3164a3077fe..265da8072a59 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -742,7 +742,7 @@ static int domain_construct_memmap(libxl__gc *gc,
>              e820[nr].addr = dom->acpi_modules[i].guest_addr_out & ~(page_size - 1);
>              e820[nr].size = dom->acpi_modules[i].length +
>                  (dom->acpi_modules[i].guest_addr_out & (page_size - 1));
> -            e820[nr].type = E820_ACPI;
> +            e820[nr].type = E820_NVS;

This likely needs a comment then, too.

Jan

