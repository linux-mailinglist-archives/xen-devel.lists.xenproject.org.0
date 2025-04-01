Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD152A77D7A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934445.1336142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcQV-0008BH-65; Tue, 01 Apr 2025 14:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934445.1336142; Tue, 01 Apr 2025 14:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcQV-00089n-2R; Tue, 01 Apr 2025 14:17:15 +0000
Received: by outflank-mailman (input) for mailman id 934445;
 Tue, 01 Apr 2025 14:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzcQT-00089h-II
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:17:13 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00ab7c0e-0f04-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 16:17:11 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso4965340f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:17:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662bf9sm13830075f8f.29.2025.04.01.07.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:17:10 -0700 (PDT)
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
X-Inumbo-ID: 00ab7c0e-0f04-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743517031; x=1744121831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1DaFncNjduLvUQEYj7vtELOfXESl1xsFj/fU9zDzYbY=;
        b=MpCwKxH7IEv5TrEU+k4xDg0aGROsU0dwLH6qkDwW6soTnOxYVufCZAMebvrw4ZbgYw
         CpuGuDEawL4fdVU6ELKhQwoWiTBRg/fPZJ3Sti3ZOtwIaN6lm5yv2mXMt56yySoCIiFl
         X8iFnB/iCXKfW663tIa451z8m15JRjtv6r5ZmWsMu3bxIXvYx+Qjy75IpYpHUBiy+uCu
         gczSYo6aP140mNgYe55n55NK6sPHj/3d1BbwqxKND54CvdKO1KABKoK47nucMFvo5FRI
         Vone94Y6A0w1VUQfYsVZt21TsratGPBZAT7SpJG71GXnxy6LTkO/nv0XlLv35jpr7Ovz
         A8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517031; x=1744121831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DaFncNjduLvUQEYj7vtELOfXESl1xsFj/fU9zDzYbY=;
        b=YIvoz3vGgrcfb2eAcSHJwZf/BqpreTKXMqEGxXm53zbeUPuQ88hD1qI1bc0MgPXSSr
         mQJI+IS2KkijX0gcpFo+tpOmkg1kt7Hzmo+7/7Zz9X7pzKrGWtpw2lu0t9N2gmSMXmM7
         KdPul3jXtcWs5Z8lPyrsyQJY0xguHDQU/qZqQJn8mXlUtG/oXy0srOs7x3bCBHfoZDEF
         s3AZoMeuvYmomSVjLpfdAZygLxO8dop7MTJZJyBFOoKAcZRkNxMbq4Ocmk1RfUDU1Nbp
         08laE5acNTlMGqqowYNUjmIVolzfNn3/CV87vq0+ES+EFWEhovOx84rZEeymidi7FoaF
         btUA==
X-Forwarded-Encrypted: i=1; AJvYcCW7GvbXPfk6y21Zm2GmAT9m5CfdYNjWi+spRRO97zdbaPoNJNeL0MqUceCBbZ8SagjuIxKN8mKChTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr6UjASSq8QaHMsUl8NZwA3as03R2D0RAy7iEH33t5DZYKaGB3
	fSOYotEwcWh0JdIyEZpZ7TXBG1UfN2UqL3d/DbUx64+lmcNkUbOnRuLmYL+CxA==
X-Gm-Gg: ASbGncv7JdTbtOHfLqxg8XQwGsvZ8K0x0vsoE48zUbtatQtnOYsgpmjQonw+qDXM28v
	8iJjLF7B8ANK8cKaYAMci0mhOfoELmDvrXIWUBpcmrt1HgRMWOB5vPdXCsGKennzVr8wEa3HfY6
	cdwJfmUkJk70ghApteg4HzPUpKAQ8q7BXujbUcnuLX5nXX4R2YzPFZzicmJ0cH6D5oTCBP9SAC0
	hsvuCaLwxE3GRIKZwJg/4UT61Sj3xJb6AaPiyJf+BA5jmQ4EuyXH5K69osuUHIYFpgZ9c+ntF0J
	lGGeYiXdPzHrp6AOY+ggWxUXSjZjKaCu9wMLoU0P/2zq0+lwycM+RVL8lL9biqPREyuz+yze5vZ
	L/RGya2HD4wpQl9FUP1j3UKjf7PfMew==
X-Google-Smtp-Source: AGHT+IEByqOqnYGQ0VGXsFZX7UB6dZQFONIUFPkfTl18Z3eZpG0XgCzHRCDfpn8qG8liHq441ZABHA==
X-Received: by 2002:a05:6000:401f:b0:391:2dea:c9a5 with SMTP id ffacd0b85a97d-39c120de319mr11607390f8f.20.1743517030945;
        Tue, 01 Apr 2025 07:17:10 -0700 (PDT)
Message-ID: <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
Date: Tue, 1 Apr 2025 16:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> The base address is in the pe32_opt_hdr, not after it.
> 
> Previous to commit f7f42accbbbb the base was read standalone (as the first
> field of pe32_opt_hdr).  However with the addition of reading the full
> contents of pe32_opt_hdr, such read will also fetch the base.  The current
> attempt to read the base after pe32_opt_hdr is bogus, and could only work
> if the file cursor is repositioned using lseek(), but there's no need for
> that as the data is already fetched in pe32_opt_hdr.

Yes, but: How did things work at all then with this bug? Plus ...

> --- a/xen/arch/x86/efi/mkreloc.c
> +++ b/xen/arch/x86/efi/mkreloc.c
> @@ -35,7 +35,6 @@ static unsigned int load(const char *name, int *handle,
>      struct mz_hdr mz_hdr;
>      struct pe_hdr pe_hdr;
>      struct pe32_opt_hdr pe32_opt_hdr;
> -    uint32_t base;
>  
>      if ( in < 0 ||
>           read(in, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
> @@ -55,7 +54,6 @@ static unsigned int load(const char *name, int *handle,
>      if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
>           read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
>           read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
> -         read(in, &base, sizeof(base)) != sizeof(base) ||
>           /*
>            * Luckily the image size field lives at the
>            * same offset for both formats.

... the code right below here has the same issue then, hasn't it? It's a
SEEK_CUR that's being done, which I'm sure isn't going to land us at the
image size field (which again we did read already).

Using the full structure also renders questionable why it's (only)
pe32_opt_hdr that we use here, and not (also) pe32plus_opt_hdr.

I think this is a pretty clear indication that said earlier change
better wouldn't have gone in without a proper R-b.

Jan

