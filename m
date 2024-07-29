Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A14E393EEFA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766317.1176802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYL7s-0004HQ-B1; Mon, 29 Jul 2024 07:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766317.1176802; Mon, 29 Jul 2024 07:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYL7s-0004Fv-8H; Mon, 29 Jul 2024 07:49:00 +0000
Received: by outflank-mailman (input) for mailman id 766317;
 Mon, 29 Jul 2024 07:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYL7q-0004Fn-S7
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:48:58 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0240a686-4d7f-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 09:48:56 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so353912066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:48:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad92fd8sm467852066b.159.2024.07.29.00.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 00:48:55 -0700 (PDT)
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
X-Inumbo-ID: 0240a686-4d7f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722239336; x=1722844136; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yRZECdnepxKr8OdvtClTHDTPSPKU+zpa9QLJ01Ubr9Q=;
        b=Jl+QvbwrJegz8OoDhcXo6dL0ZvJuCw7iFjAEZ5c7iXDU4CAIbJ+Ag3ZqGehK15Z/GF
         u3+3D+PhSlT25JKx0HO0Rjzdg2DAqmYwviM3S0TvzKnABuOWNEQcq6BuoLHg2/UuGi4W
         6RgqO7o9YnjBU7yerkL+JAO1zOo+pD8Q8SxY/pd8iu4kx/hZx17Sb3qHpk1TnSBZDYAE
         CgxxVkFFrAuBUEgLuvlx6Rm3usFMt4QiJZ/3zL+3lsOkRBLAQIJUo8G0db7Y8zTvhuD4
         XuP5c92S0JEETO/a+N2zc0DeDrjiKiNl5X5IfZMkJKwf0+5HOYJSOLj8l9XI9MHUbUeE
         OmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239336; x=1722844136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRZECdnepxKr8OdvtClTHDTPSPKU+zpa9QLJ01Ubr9Q=;
        b=uvS5ACs4HVVX7m3RmjUHcuN1DHI6xuNiuRVONal8YoXK+mDCD74H+0FUOb9MNu7LQ1
         hFv2SfrOZ6Yh//v0wfwIHjpg86J7nGxcq2Rklu06w1QwnN4B5zY9dHZpGcjIOmuIkKKj
         PT5ooTjNYv2fIiwDadPvMt3lb8j+8PJHEsbmPguukVmmgOJPzTx/jrt0YkePabpNEs0W
         DewyUrwY9c07/ucn4m1dqP1tPYadCUdNInM774dDykdLXBPDHqd+fwbJlW3mM8n2Qtx7
         M6ongLkMjNjBp2EJ8ZL4BPGt5yPxWJlHIEkZPsnEo4I1LUCAbFOgIipKBMChPLiHrda1
         13hA==
X-Forwarded-Encrypted: i=1; AJvYcCUco7urE0H+1/sb4CrxkdFzjRGJLUG3OjMLz1bfUrgiLtTVrYvL93p1M+Q/Pzhn2zIGmmyKu0KyFqZZhUOSxwjFMkVZ6wu4VsoN/TE2//c=
X-Gm-Message-State: AOJu0Yy/EbUvTy0/sL0oX9sqzPAJTOlIXGqUFpT2VmsKMqMwfvJstP16
	p0SdbSMI0cAlwH5Q9iTjehhHk6PDy4R8MhUMkBmXhC4YWOSCear1x4rr6p3bIA==
X-Google-Smtp-Source: AGHT+IE+L5hIKbjbH4HS746ObXwB0Amz0zqp/EpZIVoklQ0+3mXnUDKYQ6WvnDMi9ZwoyrZeZQJ9vw==
X-Received: by 2002:a17:907:d8e:b0:a77:c314:d621 with SMTP id a640c23a62f3a-a7d3ff557c0mr567180566b.13.1722239335985;
        Mon, 29 Jul 2024 00:48:55 -0700 (PDT)
Message-ID: <9add0cfe-e5e9-41fa-9845-4921f53f479c@suse.com>
Date: Mon, 29 Jul 2024 09:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/viridian: Clarify some viridian logging strings
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240726145200.1991-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.07.2024 16:52, Alejandro Vallejo wrote:
> It's sadically misleading to show an error without letters and expect
> the dmesg reader to understand it's in hex. The patch adds a 0x prefix
> to all hex numbers that don't already have it.

Just a few remarks: First I agree with Paul here. Imo ...

> --- a/xen/arch/x86/hvm/viridian/synic.c
> +++ b/xen/arch/x86/hvm/viridian/synic.c
> @@ -172,7 +172,7 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          vector = new.vector;
>          vv->vector_to_sintx[vector] = sintx;
>  
> -        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, sintx,
> +        printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %#x\n", v, sintx,
>                 vector);

... vectors should simply never be logged decimal, and then there's no
need for any disambiguating 0x.

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -253,7 +253,7 @@ static void dump_guest_os_id(const struct domain *d)
>      goi = &d->arch.hvm.viridian->guest_os_id;
>  
>      printk(XENLOG_G_INFO
> -           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %x os: %x major: %x minor: %x sp: %x build: %x\n",
> +           "d%d: VIRIDIAN GUEST_OS_ID: vendor: %#x os: %#x major: %#x minor: %#x sp: %#x build: %#x\n",
>             d->domain_id, goi->vendor, goi->os, goi->major, goi->minor,
>             goi->service_pack, goi->build_number);

Here otoh I agree, to some degree at least: Generally I'd expect version
numbers to be logged decimal.

What would have been nice both here and ...

> @@ -264,7 +264,7 @@ static void dump_hypercall(const struct domain *d)
>  
>      hg = &d->arch.hvm.viridian->hypercall_gpa;
>  
> -    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %x pfn: %lx\n",
> +    printk(XENLOG_G_INFO "d%d: VIRIDIAN HYPERCALL: enabled: %u pfn: %#lx\n",
>             d->domain_id,
>             hg->enabled, (unsigned long)hg->pfn);

... here would be to take the opportunity and switch to %pd.

> @@ -372,7 +372,8 @@ int guest_wrmsr_viridian(struct vcpu *v, uint32_t idx, uint64_t val)
>          d->shutdown_code = SHUTDOWN_crash;
>          spin_unlock(&d->shutdown_lock);
>  
> -        gprintk(XENLOG_WARNING, "VIRIDIAN CRASH: %lx %lx %lx %lx %lx\n",
> +        gprintk(XENLOG_WARNING,
> +                "VIRIDIAN GUEST_CRASH: %#lx %#lx %#lx %#lx %#lx\n",
>                  vv->crash_param[0], vv->crash_param[1], vv->crash_param[2],
>                  vv->crash_param[3], vv->crash_param[4]);

Here I wonder what good the underscore does that you add.

Jan

