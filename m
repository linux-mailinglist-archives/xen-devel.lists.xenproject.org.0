Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5498FD8B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 08:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810026.1222630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcBa-0005FB-NR; Fri, 04 Oct 2024 06:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810026.1222630; Fri, 04 Oct 2024 06:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swcBa-0005DW-JP; Fri, 04 Oct 2024 06:53:10 +0000
Received: by outflank-mailman (input) for mailman id 810026;
 Fri, 04 Oct 2024 06:53:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1swcBZ-0005DQ-TP
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 06:53:09 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4799b610-821d-11ef-a0ba-8be0dac302b0;
 Fri, 04 Oct 2024 08:52:54 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c5bca59416so2161937a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 23:52:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8ca3dfc4fsm1509339a12.36.2024.10.03.23.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 23:52:52 -0700 (PDT)
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
X-Inumbo-ID: 4799b610-821d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728024773; x=1728629573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dYBbTKANBB5i6Bo+WWohel/FFVYC8QWGgwiEeqc2Z+o=;
        b=cFfABN2Z3BBoQkCsLgNpKoArsGbXXgTYok7z0uxYTGlVqdr9R6Yandu+faKA8nixG/
         vlGagX4k7I84uujp0ayyEqA3KDJj6pqMwLzUih7Y9KKx7elTX8RWM3f42TfDKBvT5tSQ
         3qABifnF9vo13r45TiEr7iv9ydTgH4IAyUncxhJf9f69z4iIzYp5D1Fs3dO7O0Crjvn2
         EP1g2G1nVBt914zOZ+xkpYuuJdWIwnsVe3FGAYMaTeAxdNd5R4dobB3ZQX8f5FmRSKyB
         fTPO1bMZvH0eKLI8e9Q5RRs+iXpukCrUyO8+LNhaTLfmCgbn/oI3zP2hyGEa0yzq24BZ
         A/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024773; x=1728629573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYBbTKANBB5i6Bo+WWohel/FFVYC8QWGgwiEeqc2Z+o=;
        b=Ag4G7mOkQl54TjMUf0tjqn39C5cZafQzA0buC+kCy1F8vmnU5yx/IP5YKgA9oFqDPx
         z5r/y62oF5umYCdz6pyuQPCJDWCK0UDihsis6h9BRvWu2gTAI7G9H7T+kRMhegmCch8D
         qJ9LOUWD/Knsi/mpZ+ERnUZ05DNJTjIGDWRH9lMZjX3gu6UuBcVWHmKwH09be6XuhT5J
         0eqD4YUTEsYBJyIQWh/5v8BC7TWzH9/FI1eyw/YjZpOpmO74hPuHaTNmP0+L9GpZJR/f
         CZqLXPIOM3jccnsRCBXo3cYQBBzuIHmDzLldkEP1S3SDDxbu6LEJ+KdHHO2kr0EEJ0Jd
         DtCw==
X-Forwarded-Encrypted: i=1; AJvYcCWW/wzEjc3WsRTXDgbG5G4j5H6d2s65Vfu5xducvcwXCL8KM6NqVhNXDhiU1uPi9nNVCXpn4U6i9lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7IPq8eO1Gf17YvWzVohmpslyjhlcNgwB6oBpP+SLekZLQMuDc
	5lR+oymPfQOVu6Uqhxqcp4Q0e86qdxdjiL4+rehrNTVFIQ6c726CE/dbLcRccQ==
X-Google-Smtp-Source: AGHT+IE3UTf7W0Opp+i5sj+lNPGHwKjFn+rudBzghY0RKix6UdviZLpHmfAnBW/hrDFkQogPwDojFA==
X-Received: by 2002:a05:6402:3811:b0:5c8:9f44:8145 with SMTP id 4fb4d7f45d1cf-5c8d2e8769dmr1153763a12.26.1728024773390;
        Thu, 03 Oct 2024 23:52:53 -0700 (PDT)
Message-ID: <7dbd7fae-e2e8-4508-a012-cf9b719c68f1@suse.com>
Date: Fri, 4 Oct 2024 08:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241002232008.1988682-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.10.2024 01:20, Andrew Cooper wrote:
> The logic would be more robust disabling SMAP based on its precense in CR4,
> rather than SMAP's accociation with a synthetic feature.

It's hard to tell what's more robust without knowing what future changes
there might be. In particular ...

> @@ -1064,19 +1065,19 @@ int __init dom0_construct_pv(struct domain *d,
>       * prevents us needing to write construct_dom0() in terms of
>       * copy_{to,from}_user().
>       */
> -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +    if ( cr4 & X86_CR4_SMAP )

... with this adjustment ...

>      {
>          if ( IS_ENABLED(CONFIG_PV32) )
>              cr4_pv32_mask &= ~X86_CR4_SMAP;

... this update of a global no longer occurs. Playing games with CR4
elsewhere might run into issues with this lack of updating.

As the future is unknown, I'm really fine either way, so if you continue
to think this way is strictly better:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

