Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D242A64CEE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:38:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916582.1321652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8nU-0005Vx-J4; Mon, 17 Mar 2025 11:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916582.1321652; Mon, 17 Mar 2025 11:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8nU-0005TW-G5; Mon, 17 Mar 2025 11:38:20 +0000
Received: by outflank-mailman (input) for mailman id 916582;
 Mon, 17 Mar 2025 11:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu8nT-0005T8-48
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:38:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 515e45a3-0324-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:38:16 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913cf69784so3657446f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:38:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b37sm14937865f8f.37.2025.03.17.04.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:38:16 -0700 (PDT)
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
X-Inumbo-ID: 515e45a3-0324-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742211496; x=1742816296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1qcrCvKZ3DFoQMksi7T9egVtF2dgZzfgXW4ot9a0/D0=;
        b=U0uhSx5LzcBSRs+zS/PjN1akW7FYqDW5aKeFToyj4Dhsy/D++zCzsUjOaLzswuqGJJ
         DiLWof5AWxtDrPDhsw0PLyAQjeMHDgdRKhUxQdtCLY/sqrLRRIlGPdvMzqZyz1RoGIuF
         mjl0WGsvHcL8LX5dqNn/pik7nlBn/9yI5lZeICrYtSxEAd17pvRbeKwmDc9JRh11Ktpi
         jW/IYsAgz05jSBHWM+iQFuCHhm7p0CLwAMokMwSeDtzITI9cn8YhqwUpxyBcUDl/biX4
         /ZeJszpeehFVZYvATgk+A2tZ8mjomPt4ioY02oV20qvYAgOB1I+n1TxUauJhWTQXprPe
         2HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211496; x=1742816296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qcrCvKZ3DFoQMksi7T9egVtF2dgZzfgXW4ot9a0/D0=;
        b=h3nYKYJos6apEkbE2QdtVmKoTWnR7qoi8SVJCH9srb2nILDoXATuoCR/Twl+oR0O32
         h4m8pNgIso9GGusHxeWLMBUSHiKBYUuChIyWTT8gNKmic8u2pL73YHOX77NGVdO35ypa
         J99tcMWzno7QbwEbKcADiACVJMsNBNbWa5M3/bpLaFOefIMb7GEn55q5uxCSt06MDsD4
         SCdIPcgkqTYxqTjrwARjDBv3xsrsYQrZxup5bUoSO4m4269d8b1clD2l4ta8HL2qaIHL
         93UdSLGXDlHwIriWnfcqULQE/R2bmXxh1W7sliFO/fazoVBaFnYAkAxBxfYGrX9IjQ2N
         mx+g==
X-Forwarded-Encrypted: i=1; AJvYcCUonjd7SQCdwWWptIYaM1SxM44MUjACA2O/CS9vOHJyH0oPVKN775KCB8ej/MpisBAx0K7R0VWno6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAAIUV9ttVG54kebFBeUJadrRgfqtkVypTxQwC0KO9OuceKFKD
	4pjKUfkqNYlWVz3Ms+3b8NTWNnU3wflY0eetM0E7nsJAp0QRI1+P2BqFos1lHw==
X-Gm-Gg: ASbGncsG58sM6073CghUv6vyOajIwcSxDo9SH04/FOX6qnV5Ep1OmTZlMhA8QbhinBh
	lEnv5HYGyzH9phXQ5HvBx0hc01trd0G5VZNrnN8uPCbPFHQHSjYzNKgMd+57oTlhr0cjppGYocl
	HVE7v3N2LLokclW7V7P+Y2bkK3cRMgvZVpwuQ3a7DOXqSN4UZiQOggjwWzPhx7l7fH3JT0sm+0d
	ol14CFoD4LbS/lqbrjjSA6Vd4I+CJ3714OdgjJbZFw/XanSYEHwSfb2z29lmEYsdEbN/o0pR8qX
	polDvy53S3bt9EHOsR5cicaNYoInFDkVI0zx8IDCISl8oFDMnMDZSUpJHN7/xZrmiscECvKpEbD
	BGdvJirxZlQwQBS6yLmRFkh+993OmTcCijLaf2m6D
X-Google-Smtp-Source: AGHT+IHTr1FInE4s04gEnaH2xWr7HMWZTnaYhptuFerPUlji+DXrCF//UlA0UZEtL+y1uX9m5LcYbA==
X-Received: by 2002:a05:6000:4011:b0:391:3124:f287 with SMTP id ffacd0b85a97d-3971e2add48mr12084898f8f.16.1742211496312;
        Mon, 17 Mar 2025 04:38:16 -0700 (PDT)
Message-ID: <703471bf-d5e7-4f97-b17e-61dffdcb828d@suse.com>
Date: Mon, 17 Mar 2025 12:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> In order to support FRED, we're going to have to remove the {ds..gs} fields
> from struct cpu_user_regs, meaning that it is going to have to become a
> different type to the structure embedded in vcpu_guest_context_u.
> 
> In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
> to copy the fields individually.  This will allow us to eventually make them
> different types.
> 
> No practical change.  The compat cases are identical, while the non-compat
> cases no longer copy _pad fields.

That's fine for "set", but potentially not for "get": Someone simply doing
memcmp() on two pieces of output might then break.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Should we really be copying error_code/entry_vector?  They're already listed
> as explicitly private fields, and I don't think anything good can come of
> providing/consuming them.

I don't see a reason why we'd need to copy them in arch_set_info_guest();
arch_set_info_hvm_guest() doesn't copy them either. For
arch_get_info_guest() it's less clear - toolstack components may have
grown a dependency on them (e.g. introspection?), so I'd err on the side
of retaining prior behavior. (Of course there's then the corner case of
someone calling "get" right after "set", expecting the two fields to come
back unchanged.)

> @@ -1204,7 +1223,26 @@ int arch_set_info_guest(
>  #ifdef CONFIG_COMPAT
>      else
>      {
> -        XLAT_cpu_user_regs(&v->arch.user_regs, &c.cmp->user_regs);
> +        v->arch.user_regs.ebx               = c.cmp->user_regs.ebx;
> +        v->arch.user_regs.ecx               = c.cmp->user_regs.ecx;
> +        v->arch.user_regs.edx               = c.cmp->user_regs.edx;
> +        v->arch.user_regs.esi               = c.cmp->user_regs.esi;
> +        v->arch.user_regs.edi               = c.cmp->user_regs.edi;
> +        v->arch.user_regs.ebp               = c.cmp->user_regs.ebp;
> +        v->arch.user_regs.eax               = c.cmp->user_regs.eax;
> +        v->arch.user_regs.error_code        = c.cmp->user_regs.error_code;
> +        v->arch.user_regs.entry_vector      = c.cmp->user_regs.entry_vector;
> +        v->arch.user_regs.eip               = c.cmp->user_regs.eip;
> +        v->arch.user_regs.cs                = c.cmp->user_regs.cs;
> +        v->arch.user_regs.saved_upcall_mask = c.cmp->user_regs.saved_upcall_mask;
> +        v->arch.user_regs.eflags            = c.cmp->user_regs.eflags;
> +        v->arch.user_regs.esp               = c.cmp->user_regs.esp;
> +        v->arch.user_regs.ss                = c.cmp->user_regs.ss;
> +        v->arch.user_regs.es                = c.cmp->user_regs.es;
> +        v->arch.user_regs.ds                = c.cmp->user_regs.ds;
> +        v->arch.user_regs.fs                = c.cmp->user_regs.fs;
> +        v->arch.user_regs.gs                = c.cmp->user_regs.gs;

Just to mention it (there's no change in behavior here afaict): Us writing
only half of the register fields looks like a latent (but perhaps only
theoretical) problem to me. A dis-aggregated toolstack may set 64-bit PV
context, then toggle address size, then set 32-bit context. That'll leave
the high halves of respective fields non-zero. I didn't check whether any
badness could result from that, as for the time being
XEN_DOMCTL_set_address_size isn't marked dis-aggregation-safe, and hence
this at least isn't of immediate concern.

Jan

