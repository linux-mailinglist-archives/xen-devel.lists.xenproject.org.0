Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D7B3DE22
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104235.1455332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0kp-0006vi-IC; Mon, 01 Sep 2025 09:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104235.1455332; Mon, 01 Sep 2025 09:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut0kp-0006uE-Fa; Mon, 01 Sep 2025 09:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1104235;
 Mon, 01 Sep 2025 09:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut0ko-0006dF-1S
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:23:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4628383b-8715-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 11:23:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so635875966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:23:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b043fd772bcsm26952666b.14.2025.09.01.02.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:23:08 -0700 (PDT)
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
X-Inumbo-ID: 4628383b-8715-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756718588; x=1757323388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rm0yRkOu7F19gNlA4SI+/jJ7K1ooBbhgF7qek1U8JXs=;
        b=eUPMNfM9/KXuQb5E97BCFyESNhoEWfsY37RKJ2NwAoiJfGGYAWRD8nJ+her1+QKn2m
         WmOl1VBWpVcUldLNr0IBfiYtdXTz8BQEMnCp52OZIJDJAj3FRL3RfWKCCG9pjyFfifEm
         217E8cLrkUSMdRw3XFkk4cu+3flZ7pP5ou1HhSz7Nz5Wbcw3x8XtHqMMdUR5iu2dpJNT
         yQTDshEkIX0EvpYLWXHxhEB4PIGbcmqlEKiKcOnx5NRLhrFRWxKW1XmY4D+q8WVr5i5z
         K4hQHYloJBSWetU230rAvEYRkoKoChb/TPliviHvNPi19FmhHQ+KbvH898DIr1L9oMN3
         gilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756718588; x=1757323388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm0yRkOu7F19gNlA4SI+/jJ7K1ooBbhgF7qek1U8JXs=;
        b=h0BaQETJW4Jus38IWKoAXL1+5jU0Jn48OpruqQ6tJc4z/GubVb7JzsFgEX2EbfFVLA
         Kk6yAQBRTsa1FVytYu6nTpBeIx11XmGmHHc3aXlgrzycfkRedezXa9lZ3AWnSrECvTYN
         PJiGItOZJ+k+ERpVzCcaSaSsRYMuj+Yqirmp55SOdeQ1leu0K7rJNDo2BlWnSn4SlhCz
         X60Xb502Hsw6d/c9ofu5E8hhwCYAxdJSayvvy/YD+YLTQLNjLF3AfLSekhrA3C4u4Tmi
         28xhDhLHn1hMJT6twpwy4QfvUq2HQjCmuVpsJCgbkcZ5vKu9N34flPvVt7ijiVbUh7SM
         gj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgvBGRey09wr4onRxSFKH1lwsqCrCACqgUGmAHPaGA5PX7PxvfeAU+ZhWqmfnnj3XG4zv9I1znfxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvXV073vkVRtnbSMTW9QPY9XwK+KSm/b6VOGL/a2ejiouMbdhQ
	Ip/Jd0981cSQz0sjh8lVlnwXtJSZ5iyOzrKJfLL2kcknc7YoW32z607txyXDFhR2OA==
X-Gm-Gg: ASbGncti4mn/X34Elj9WtnvrI/4BJ6c9QkAXrpdXYwgKKUf8w1sP4HL3zXKSaHUVtb3
	R7HpR0iSYLiqd7tY5XRS8RoSlPIIST/Q21Cq+xBF0RC7veb/OvpqIKWh5+A0w/UR1L76E2sluWc
	bgq+L5t1lPGn+9mgcZcJ0up0r9z0AaViyvx6XlAjc4DSQMP/5k5C4bHXExP9QhcVX75+UtvkkTV
	EoSkYj4VeUyPEZfsUyd3r4UCK5X1FQQtafAPvPUZW5NQk8BNFaTyBkNYaMkt5m8pkO66mu4cX+M
	VTi8qIdzj9+e3EVOkS2rTyZYMs1v73xEElf+EQf3MZaE9S4HmxowJhvMFLlt/vftp3nepVJ11g3
	jlny/plzbuhZ4dI24IK922HAmHeTqWmtO0H4vwl6nIg+C8tRenDqp5fmI4vz03q6VqyaZ+fUvee
	z36B7vsg0=
X-Google-Smtp-Source: AGHT+IEg7K2iFBsU1Ou05wLpiyhA1jEp9yRxo034LDIm+RtYNGyqKEWnPrA3ntu013LFJ9xpMD66Mg==
X-Received: by 2002:a17:907:3f28:b0:afc:cc64:86da with SMTP id a640c23a62f3a-b01d8c9073amr628813766b.26.1756718588462;
        Mon, 01 Sep 2025 02:23:08 -0700 (PDT)
Message-ID: <2ae92f1c-da23-42d0-a1cc-70dff04310cd@suse.com>
Date: Mon, 1 Sep 2025 11:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/23] x86/traps: Set MSR_PL0_SSP in
 load_system_tables()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
> means that the value they load into MSR_PL0_SSP differs by 8.
> 
> s3_resume() in particular has logic which is otherwise invariant of FRED mode,
> and must not clobber a FRED MSR_PL0_SSP with an IDT one.
> 
> This also simplifies the AP path too.  Updating reinit_bsp_stack() is deferred
> until later.

This last sentence looks to be ...

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * Extend comment about clearing the busy bit.
>  * Move reinit_bsp_stack() hunk into this patch.

... stale, according to this. Other than that:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

