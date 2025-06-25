Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A12AE7E3A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 11:58:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024581.1400411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMtS-0005tD-At; Wed, 25 Jun 2025 09:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024581.1400411; Wed, 25 Jun 2025 09:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUMtS-0005qT-7x; Wed, 25 Jun 2025 09:58:14 +0000
Received: by outflank-mailman (input) for mailman id 1024581;
 Wed, 25 Jun 2025 09:58:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUMtR-0005qN-5t
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 09:58:13 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6c01763-51aa-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 11:58:10 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a528243636so911475f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 02:58:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d87305d3sm125830065ad.241.2025.06.25.02.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 02:58:09 -0700 (PDT)
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
X-Inumbo-ID: e6c01763-51aa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750845490; x=1751450290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c9QNUAb7NIahs2+pIVDI5v13ldUKxcCQSaK0r6cL9qA=;
        b=IvcE/Q37KQw3qoHYMQlvanZQpvW/D9zKQK15AJpUbJV5eM3rMTmLZEsoht2Gw0+8IU
         WAJuG6D83+vcN+tiUA61/EjTbzSVWdQIEemUdEkRQPvxWe0F+cK5riZf7igrjyo+A4if
         DI9QwPJzQCPVdecvWxwKC/LbFNt1/L0w6dc34+NEMLMoE2h1/9P/iQe85VaTWZEAOIQq
         5qCmKsqeor/wOX45jU8MDH6YoWp8tNuHuOya0wS3ZWEyhY3ZXD3zxIeHjH6o5X0qgfcK
         5cn8Zc0E+N9G8Y6SVlsNX3/pwEvp8wFJ3OU/voUVBdWmD40nxFUWI2qNHma7HR4JXr9E
         Bydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845490; x=1751450290;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9QNUAb7NIahs2+pIVDI5v13ldUKxcCQSaK0r6cL9qA=;
        b=usTeM4sje4hTut4yxZT9j+TSV9YtgDs9+GzMDWhBTo8q+vA1CUvswzb9frQJF48vQM
         qMLdokDnbBpFmOpqoP625N7H3xYz0lM3Wdd5WwkvIzEROMcAeTvvINXmSx/9GJ6qETMM
         d0/LBJzri7oFn86AfJ4LozsxYw1xk9MaPcgrQbIygcARbEJjq0wk57f8aAz8089z0heD
         eVKCo8iQihlLV4EVug76f9m2MgVqVMRwGAJmiBhmeSAJtjmJlTNdz9Ru70e+8Eyjn7cT
         0D9/eG1i2nAdP7QZyiqr7harhhUoOAJYozKW9DwJfUCixR36ZfJDFtP8yIUyeSDk+eEF
         qknw==
X-Forwarded-Encrypted: i=1; AJvYcCUCGJgkTAsfU5t+RUgDZjcSLgIIMoWRV7Pep7pTcCLIq2CYKA6XXFGx5qbJ8UWC8t5qIGAIDDO9NBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGEzl7f2AbFpBELcJtt+P9pgo+TxDGn8iJngQ9oj1yJFJCGZPc
	JyOqBYOzBqUWu3vS4ey9ZWhzW0F73apYdIerafTvew1tKrcQ6HiDdPL8y0tpi6XLNg==
X-Gm-Gg: ASbGncvN0kWDq6e6L4vfa3/wfiK12ToxayXbntQpeWgDq+BABuQuQUpCJl2n6Z0o6WS
	0ZI7b2Aco+3+4tmUwmJFxIcqdMmPTHYqLdlHqknAy4/LMGboSBQu85TsPpWrn/3HumEcScAU1CS
	yq8oHZjVpTJj8VRrPlK1ujPLqoQbwrXnrh4wid1qK6Lb6YrY6kJ6zXvYHZ2XL6GZXnxg7oIC1M9
	hcQ6u2EJ7DIVhbc4zKEUQrOemeIMeiuRPNlewR1tHrbbC4q2O6/YjRKjy5R+n7v/aNJsbjqtyP0
	WRHrkJYyXmFO4n0jDk14tB2z9cBU3tfepAV0o0EQG6RJstmfGQUL5VeJCwB9/8hz4CvWkhdJAh4
	3U2OTVY7r9f12oJbNA1clg08k2nG4pRkpBrxUsYBOArL26e92RHg1360ujA==
X-Google-Smtp-Source: AGHT+IHiW0lttO1ElT6QXLEDXQOC8JGWMnX+2j0WCIhnP4Xyt1G/A9AYz6TLqy0xsIetQtMT3NZL+A==
X-Received: by 2002:a05:6000:4028:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a6ed6644dbmr1710737f8f.31.1750845489979;
        Wed, 25 Jun 2025 02:58:09 -0700 (PDT)
Message-ID: <86841b35-119a-4265-8ff0-9b8549e8ca52@suse.com>
Date: Wed, 25 Jun 2025 11:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Revert part of "x86/mwait-idle: disable IBRS during
 long idle"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250624163951.301743-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 18:39, Andrew Cooper wrote:
> Most of the patch (handling of CPUIDLE_FLAG_IBRS) is fine, but the
> adjustements to mwait_idle() are not.
> 
> spec_ctrl_{enter,exit}_idle() do more than just alter MSR_SPEC_CTRL.IBRS.  The
> VERW and RSB stuff are **unsafe** to omit.
> 
> The only reason this doesn't need an XSA is because no changes were made to
> the lower level mwait_idle_with_hints(), and thus it remained properly
> protected.
> 
> I.e. This change only served to double the expensive operations in the case it
> was trying to optimise.
> 
> I have an idea of how to plumb this more nicely, but it requires larger
> changes to legacy IBRS handling to not make spec_ctrl_enter_idle() vulnerable
> in other ways.

What are the concerns here? As it looks skipping the MSR write would look
to require checking some (per-CPU) conditional. Conditional branches can't
really be of concern, or the "if (cx->ibrs_disable)" that you're now
removing again would have been of concern, too. Hence simply a new SCF_
flag would look to be sufficient, for mwait_idle() to convey the necessary
info to spec_ctrl_enter_idle()?

>  In the short term, simply take out the perf hit.
> 
> Fixes: 08acdf9a2615 ("x86/mwait-idle: disable IBRS during long idle")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


