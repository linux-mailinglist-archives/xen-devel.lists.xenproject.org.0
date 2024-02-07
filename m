Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89784CEDE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 17:28:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677817.1054686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkmM-0000Kh-8m; Wed, 07 Feb 2024 16:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677817.1054686; Wed, 07 Feb 2024 16:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkmM-0000Gx-63; Wed, 07 Feb 2024 16:28:06 +0000
Received: by outflank-mailman (input) for mailman id 677817;
 Wed, 07 Feb 2024 16:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXkmK-0000Gr-1c
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 16:28:04 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd0a295c-c5d5-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 17:28:02 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so11557945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 08:28:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b0040ef2e7041esm2634750wmq.6.2024.02.07.08.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:28:01 -0800 (PST)
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
X-Inumbo-ID: dd0a295c-c5d5-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707323282; x=1707928082; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6TdYqu32u1KRS7tNYDPZhANdGBEMh0MB5q5fR4i4VA=;
        b=LwovsdSpKhZyJz7roY2hcRKwSXtjOYXjr/GCsRk968Ifx+qrzzPd4gIOEx0eObP4S9
         KdJgXLFRXh0yAW+SqPmSlCIhEl7gd56y39Yb9rnYUWUjReE2CnU8DaGd2SrgJo5sevd5
         srVHLsf6SPeimvTB4M5lMqEgULLwlC7nC0nQndLQ0Fl6pK9Cn7QrjG4Mm19BFoIEHzsA
         mTGpO22bSBOofmlWo4nBcZmDKGRwgfjpyoIxm1Im8G6+AwzVyYZa6flP31PY6MltRquX
         iGmU0VeR/kRwPMevoi9mPuYOiRw0n2tXpyLsDNb1OcQmHnMF6Wp6S6yG+W4GSTb5uEMz
         VWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707323282; x=1707928082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6TdYqu32u1KRS7tNYDPZhANdGBEMh0MB5q5fR4i4VA=;
        b=wIdIKSnH2f1ux5klNvda3JzzsRTLY3fVExe/UJ1MVwWHCooxJavuTVg+CXq2jCxtR5
         nzyCzQ4xW2V1Am8fQscBrnPWykeo1afwIBlRBJLfq5/S1EAI3SU8F0hakVlazBVhmyqC
         G9us0tmi0JmnLe25lAFjAx+BJHvF3xEJjehqevZSsnITikRsAprDvYxpG5VtN7RDO4gg
         9cYY6Oiziw2FfuVJym4oIbwBTfRGc8shRKlzuUX0nrO9gaRsHx9x/OI7QTZ7rf/pAup+
         Qa/DZnvIJzRudO+x3vC9F/ABtb6xItaSD+Uz3bup4XiS9NWbU4xrHl3re0sjnARbsU5M
         34Mg==
X-Gm-Message-State: AOJu0Yy/IjZhdYozKJQjlDNqZ67Ua6r/nssC6TA7981VGGBefy8Iebrq
	KBtUHCcN4IcFC+dDRlWTWa3Yel+5hpQzdEY3Flg0C5SfwR9AgAwywTmWUcp2JQ==
X-Google-Smtp-Source: AGHT+IHOk3skZX8eYWutNmYm546LyurSMygvkjb1/qeQ0GpD8Y0wEKJ1tvd3lvmk4SQDG+Dxxmw8iQ==
X-Received: by 2002:a05:600c:4f96:b0:40e:fb74:c514 with SMTP id n22-20020a05600c4f9600b0040efb74c514mr5038432wmq.7.1707323281834;
        Wed, 07 Feb 2024 08:28:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhaCn/fgoo3THGyDymbFMQiNxIidILnLEP3ZjuTExNdTrcV7OG6ao1iHb3v9O5TVcVrGrtQClZrLI+s63Vv8ptYUehlkIjyYc9CpjX1Rdbr3GsWugFFN9MFgO/FslDcI0V6rCOjYn77CRwuTeKfx4P
Message-ID: <904f358b-c535-4de2-b31d-e593687af11b@suse.com>
Date: Wed, 7 Feb 2024 17:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/9] x86: don't access x86_cpu_to_apicid[] directly,
 use cpu_physical_id(cpu)
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:49, Krystian Hebel wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -950,7 +950,7 @@ __next:
>       */
>      if (boot_cpu_physical_apicid == -1U)
>          boot_cpu_physical_apicid = get_apic_id();
> -    x86_cpu_to_apicid[0] = get_apic_id();
> +    cpu_physical_id(0) = get_apic_id();

While personally I don't mind as much, I expect Andrew would not like
this: Something that looks like a function call on the lhs is against
what normal language structure would be.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1615,7 +1615,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>              break;
>  
>          cpu_id.phys_id =
> -            (uint64_t)x86_cpu_to_apicid[v->vcpu_id] |
> +            (uint64_t)cpu_physical_id(v->vcpu_id) |
>              ((uint64_t)acpi_get_processor_id(v->vcpu_id) << 32);

While the cast on the 2nd line is necessary, the one on the 2st isn't
and would be nice to be dropped while touching the line anyway.

> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -70,7 +70,7 @@ void __init init_cpu_to_node(void)
>  
>      for ( i = 0; i < nr_cpu_ids; i++ )
>      {
> -        u32 apicid = x86_cpu_to_apicid[i];
> +        u32 apicid = cpu_physical_id(i);
>          if ( apicid == BAD_APICID )
>              continue;
>          node = apicid < MAX_LOCAL_APIC ? apicid_to_node[apicid] : NUMA_NO_NODE;

We're in the process of phasing out u32 and friends, favoring uint32_t.
Would be nice if in code being touched anyway (i.e. not just here) the
conversion would be done right away. Then again fixed-width types are
preferably avoided where not really needed (see ./CODING_STYLE), so
quite likely it actually wants to be unsigned int here.

Furthermore our style demands that declaration(s) and statement(s) are
separated by a blank line. Inserting the missing one in cases like the
one here would be very desirable as well.

Jan

