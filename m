Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9110ACAC2B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003116.1382581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1wi-0002lR-PT; Mon, 02 Jun 2025 09:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003116.1382581; Mon, 02 Jun 2025 09:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1wi-0002jD-Md; Mon, 02 Jun 2025 09:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1003116;
 Mon, 02 Jun 2025 09:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM1wh-0002j5-5q
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:59:07 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3867ecf4-3f98-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:59:06 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a5058d46ceso594209f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:59:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf53a9sm67146545ad.196.2025.06.02.02.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:59:05 -0700 (PDT)
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
X-Inumbo-ID: 3867ecf4-3f98-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748858346; x=1749463146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59uJKcR3b8YdfDVosBS568wBuugaBMdtBQd/BTjVOAk=;
        b=TGv6nnjDHGeQ1HvCWqiyv14KIze0ar9p/QdK8l5FYPfRgLpk0GLioAd6d0fh4WPmVe
         aEkWAg5HTtLPGEeUFwjMkNgM3ySh3DqnFK85jhJMrVyJoxIs87wsf0kbisT1dIag2lwZ
         qmjOiXB0I9s2G3t5I/1uxC4mtq+8ULgCwXt0vSHFI0kgyjSz25HMm8TzCmGYM211bZSy
         z516RNhawjPN4dSI4lGXXh+RhBT54VzP6GavoKYNUuFJUVAJyJr9aOrWu29r2QroAh6d
         f7dTvIR/R42P2uGHrKLZo3msrzmjDy6F1D7UHEfOKT38YNhbQk563YcZsO4aUvOKGD1+
         Y4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748858346; x=1749463146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59uJKcR3b8YdfDVosBS568wBuugaBMdtBQd/BTjVOAk=;
        b=CZVMsxolNpk3XZJ7owF0G9KJSwPkpkXYk5MSu8cgbdp/Y5MybNo5icpKjQeowqXlwr
         CdIG7v/APb82wsibL+Vb/HinLxSKIbJTk2WFKsudFpPXLdegW+YkQ8e/sWjAhcf7xdHQ
         YTL1jwbP5G47yWlqUjhrpwF4VUxkQGYdMCsgP5MurwYI+KazP9YZM9a2oEgEcxb+L20c
         F85N4KVo9+O8a1CMWtxze4MX0UbuxaXCdZAfoZ5r3Y+bz6yaimf9x16ylY3udB8e8+8Q
         o5IaxvmWlPtVWnxo2uDOzt7tQxbkDibF69ucfu+wqHE0DJMiANacwjuCui6Xz21lBBY9
         nT9A==
X-Forwarded-Encrypted: i=1; AJvYcCUpattCBm1utOKJEaOT5Z51J+UXXxTNFjOe5cWl/MdOdgCukOu4+mE95TTNoP7jl/mF60dgfBB3exQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGYVBuqPuHZSNImBn4JbgcgOJm5lU5TlvCCRJ6ho6CDlr4cMqa
	GTSXHHvhDJNs6vKlSzGZVg9VJarsT8s809+Zo5Xo8Wlf83NKPvs+Ng98N+6Mx/BISA==
X-Gm-Gg: ASbGncscvEcqMiU7FmNRL3t1TPKElqLu2nzqqppmIauD1bQpOOhUlgnLhUu0Cuh35qB
	phWMIr4lHzYpLm3UHTG/luBGakqCVNgO82WgXaHVK0EVwnlEde+szuZgYWdUwv+8IcApMUyM+V2
	aTc05fqE3f/W3B8HRujrXc/SzA3Y6YIEYmJBD46Xxu+4tKjN2zPN4n+USXzHptcQLiw+qZm37+R
	kGB6wEjAx+RRy844MW1yCO/mZHLM1krtBd4EZGHq2nEB1/o/mRaAfsN92W05CZByjdmyq9zaKDr
	JNz8xdMSg97RvXhxIT1tz3PN0FWh73xR6S3uGdXVrgA7D/sapf9JZ7ushWRK6fk+jXJ2q0wvPNH
	urz9ekaOhGdd0TBPuFhlgemrzy5ZsCA3ZpxqW
X-Google-Smtp-Source: AGHT+IGnsgeMxARjYDP3AiU3CSfmJcV6qrz0VEBbaJTeeZnby3QUM00rbz9Ut6pi2208XKxc9baqCg==
X-Received: by 2002:a05:6000:178e:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a4f89dee77mr9360115f8f.36.1748858345765;
        Mon, 02 Jun 2025 02:59:05 -0700 (PDT)
Message-ID: <0eb77cb2-0208-4fba-8663-6015dee3e015@suse.com>
Date: Mon, 2 Jun 2025 11:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/alternatives: Introduce
 init_or_livepatch_ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250522150015.555492-1-andrew.cooper3@citrix.com>
 <20250522150015.555492-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250522150015.555492-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.05.2025 17:00, Andrew Cooper wrote:
> ... and use it for ideal_nops and toolchain_nops_are_ideal; both of which are
> invariant after arch_init_ideal_nops() has run.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/alternative.c
> +++ b/xen/arch/x86/alternative.c
> @@ -47,7 +47,7 @@ static const unsigned char p6_nops[] init_or_livepatch_const = {
>  };
>  #endif
>  
> -static const unsigned char *ideal_nops init_or_livepatch_data = p6_nops;
> +static const unsigned char *ideal_nops init_or_livepatch_ro_after_init = p6_nops;

... the attribute moved to between type and identifier, as we generally have it
elsewhere.

Jan

