Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29083C874
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:46:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671662.1045133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2rk-0006nQ-OM; Thu, 25 Jan 2024 16:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671662.1045133; Thu, 25 Jan 2024 16:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2rk-0006ko-LY; Thu, 25 Jan 2024 16:46:12 +0000
Received: by outflank-mailman (input) for mailman id 671662;
 Thu, 25 Jan 2024 16:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2rj-0006Nc-3H
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:46:11 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1a6ab1-bba1-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 17:46:08 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cf205dc075so24520841fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:46:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5-20020a6b1505000000b007bf2c9bbdd6sm7616710iov.50.2024.01.25.08.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:46:07 -0800 (PST)
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
X-Inumbo-ID: 3d1a6ab1-bba1-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706201168; x=1706805968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2zNLH228gIijs1yWo5a80VfczrzNbWVli54+hLosIs=;
        b=R7+wgcJQNz6HwgnzuMgmxVCXuMaqFQuKE3V8EsSoVrhWECiFEckWXRQKN6l0leqUHG
         qrGaQr5gTkHs1f8Z74xmX77qyTPd2ZWiO2DenrY3proD7q7bDHlJrBVKcOehXeINGuCc
         6rNqVBUg6okgPJaNWAUczhS0OJI4SnukgI8vH2iVfqDwxvtZawm3tD6+063T8VxSBsvq
         pV1gTZMiLnmETrWf24JT6Yof18Qk1UaHO6h3Ak7VSbdD9BDrmfuUOUoW5glyy4EY6G/2
         N+yfJGTeJZl4JMZiABNqVZdyajHeltkXIZ6fFo7IUAlGU93l33d1OC/ATaa0nALRKBPA
         CCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706201168; x=1706805968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2zNLH228gIijs1yWo5a80VfczrzNbWVli54+hLosIs=;
        b=AWKZ7UAdwwxxG0IML60V/ahasF5TW4jLFitxZ6SxCWCQnNylwOuPwJnvlw9gaP72u9
         KQPtYr1e/tIZNLMeP7YC5ZZVpHJ6MGJfER30htYXlgotMsPdTyx0FwLkqqQWuGgY7xML
         5RceGb3wFHs66W4PLw6FvTiT/54QWh+GyFBADSz6dYe8q0i2Rj06ns47mX/2PwbtTeL2
         9t9Sdbpxx4D3Bf7zVAj0iVmmtW6+5KJ7WssUHMbB+YqyP4rD/izn+yp6TYreCTkAUQhF
         95ZyHDkZeJnhWA3if9aixMaZbKNyNRangW4FE3VWbNS2BzXvsU6hYdd+hW6K5F5R16yN
         BDNQ==
X-Gm-Message-State: AOJu0YwyFHhetX2z4gvSurPE6Xro4XZiJg+MwWESikfzjBKa1bxf+ldc
	IlmNvvXe+4JuOexi2fb+4wiLQ4icQUnrwnaVaRE4gyDaEhvwqEHvMjcIf1YpBQ==
X-Google-Smtp-Source: AGHT+IHWdPur9nNqDN1s5T+7s7ULD6UTGdc4aj6G8KXAuSGl/4q6QjscWQMEm9tA6b8bcN9vgP9COA==
X-Received: by 2002:a05:651c:cc:b0:2cb:2d48:334 with SMTP id 12-20020a05651c00cc00b002cb2d480334mr659742ljr.60.1706201167993;
        Thu, 25 Jan 2024 08:46:07 -0800 (PST)
Message-ID: <8bfc95ea-9d0b-4ef5-8179-5e345a318af4@suse.com>
Date: Thu, 25 Jan 2024 17:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240124172953.29814-2-roger.pau@citrix.com>
 <20240125132626.34553-1-roger.pau@citrix.com>
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
In-Reply-To: <20240125132626.34553-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.01.2024 14:26, Roger Pau Monne wrote:
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
>      return 0;
>  }
>  
> +int __hwdom_init remove_xen_ranges(struct rangeset *r)
> +{
> +    paddr_t start, end;
> +    int rc;
> +
> +    /* S3 resume code (and other real mode trampoline code) */
> +    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
> +                               PFN_DOWN(bootsym_phys(trampoline_end) - 1));

With the understanding that we've settled on us not quite being at the
point where only one page of the trampoline is kept mapped:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

