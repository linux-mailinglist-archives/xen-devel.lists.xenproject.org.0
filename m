Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D5996B6B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814485.1228050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWUM-0002d3-OF; Wed, 09 Oct 2024 13:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814485.1228050; Wed, 09 Oct 2024 13:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWUM-0002aS-L1; Wed, 09 Oct 2024 13:12:26 +0000
Received: by outflank-mailman (input) for mailman id 814485;
 Wed, 09 Oct 2024 13:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syWUK-0002aM-Hi
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:12:24 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f51d31f-8640-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:12:23 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so9387220a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:12:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05f3be4sm5424680a12.92.2024.10.09.06.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 06:12:22 -0700 (PDT)
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
X-Inumbo-ID: 1f51d31f-8640-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728479543; x=1729084343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b5ljwUT2SaGVNfq37cbAoJg0rB9hFbQJjg6v2nncNeY=;
        b=YYZ52XtTKi32Z0S34XwSKlaGpHBIluG++U6vW9VMYGtee8hRbZKbUnpQ5Koit3/1GB
         q3TsO4BMuiXuA/ibP2UjvP8k6TMoc9D9dV3wXgsseUXgPa0b/k6odRensze7Z80RgYy0
         pGfnrwWd1/DgtnUkq0CVWkBfXnNmb2FtI5+eVhXoiG0v9dSNER+Ykma7cvPRQbn8n/R2
         SetSulq2JqdevUIaleAw3Ni++lPsfm2XiZBXmX+lQPyxqyqf0wDLSB8DXCJoyyH/midH
         pjd70JRFCWLXKgLowEsqrzrev6C1+EvcnOVO3LiEhj5ZDtxSOo7V+bewcBZi9FS9N16l
         aPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728479543; x=1729084343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5ljwUT2SaGVNfq37cbAoJg0rB9hFbQJjg6v2nncNeY=;
        b=PmhvF7vXXEdRC10GlKSliQX8yYJ9tIz2ZGrNsEDbRY45SNtLjknZSQYzpVyrnB3OfN
         qXDH0XvYg6Mrq7kY76uGmFPNw90E3W2WXpmYXIbZambq+zDwr+78jWx4E9EeyXO60alw
         Ep6ctIUJ5GIhKiJXs6ni8UUyWgUarMAnURVGOBL09naATiN34BluScUNovIb5csoIeMm
         EaWTdTxtU9cfPr6IdUq2eOVSBG1G85ELb4H2Tj+JiTgN+K8hyRxWRTh08GeVvj8+bmf4
         avVKRsoRXSVGLnMRvjWk1dT+avdwlwErpx7bSbOrYakn5ZRZ2m1v4X2wERizcB93ECf/
         TDHw==
X-Forwarded-Encrypted: i=1; AJvYcCXiWotzPomMWvbAnPFttm7wkELna9ubmbIQImUmt0ayPK/RYV/Jgb/oJjkDl66fOvCbgZzouU2arwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlS1qQeZRGs0f8YLsRQpTRnFyCqiN5p7Kvk1ldvxHl2qkn3fAm
	An3HQH/Pc50UjCWoIeNJMyxtAXtHR28c+0K90ID/6pybyJKyAWuYdApyPi5RXw==
X-Google-Smtp-Source: AGHT+IFJ75ry0ahExTUzgABHX5bKkPUQz+rIv+3wNzE3FpvoXPh8AZe5r0YmOvtklspkXKqwLIKoCQ==
X-Received: by 2002:a05:6402:4309:b0:5c8:8626:e41 with SMTP id 4fb4d7f45d1cf-5c91d5bd3c8mr2087466a12.4.1728479542730;
        Wed, 09 Oct 2024 06:12:22 -0700 (PDT)
Message-ID: <c8b35378-d677-4c28-9304-530269178225@suse.com>
Date: Wed, 9 Oct 2024 15:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/11] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:37, Alejandro Vallejo wrote:
> @@ -311,18 +310,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>  
>      case 0xb:
>          /*
> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
> -         * to guests on AMD hardware as well.
> -         *
> -         * TODO: Rework topology logic.
> +         * Don't expose topology information to PV guests. Exposed on HVM
> +         * along with x2APIC because they are tightly coupled.
>           */
> -        if ( p->basic.x2apic )
> +        if ( is_hvm_domain(d) && p->basic.x2apic )

This change isn't mentioned at all in the description, despite it having the
potential of introducing a (perceived) regression. See the comments near the
top of calculate_pv_max_policy() and near the top of
domain_cpu_policy_changed(). What's wrong with ...

>          {
>              *(uint8_t *)&res->c = subleaf;
>  
>              /* Fix the x2APIC identifier. */
> -            res->d = v->vcpu_id * 2;
> +            res->d = vlapic_x2apic_id(vcpu_vlapic(v));

...

            res->d = is_hvm_domain(d) ? vlapic_x2apic_id(vcpu_vlapic(v))
                                      : v->vcpu_id * 2;

?

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1090,7 +1090,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
>  static void set_x2apic_id(struct vlapic *vlapic)
>  {
>      const struct vcpu *v = vlapic_vcpu(vlapic);
> -    uint32_t apic_id = v->vcpu_id * 2;
> +    uint32_t apic_id = vlapic->hw.x2apic_id;

Any reason you're open-coding vlapic_x2apic_id() here and ...

> @@ -1470,7 +1470,7 @@ void vlapic_reset(struct vlapic *vlapic)
>      if ( v->vcpu_id == 0 )
>          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
>  
> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));

... here?

Jan

