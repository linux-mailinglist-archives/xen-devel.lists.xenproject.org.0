Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA0A64B65
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916536.1321611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8DL-0004jf-4E; Mon, 17 Mar 2025 11:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916536.1321611; Mon, 17 Mar 2025 11:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8DL-0004hG-1T; Mon, 17 Mar 2025 11:00:59 +0000
Received: by outflank-mailman (input) for mailman id 916536;
 Mon, 17 Mar 2025 11:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu8DJ-0004eo-GZ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:00:57 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 194023f8-031f-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:00:55 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3912e96c8e8so2719964f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 04:00:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df342fsm14851503f8f.14.2025.03.17.04.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:00:54 -0700 (PDT)
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
X-Inumbo-ID: 194023f8-031f-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742209254; x=1742814054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GOfkagbjdBmv4CLlB7soohTm9hBQbwN6y7yI/dgyOU4=;
        b=dANz/SMJ+jkC2p4iIj5dtUnw33n1mTAZ+yIaVMN837s8MKmMeJrjRtUxjjked1lF77
         LjDhCsSJEEmsg62fL7I/AhnsK7S1StPzGrs169K5OJ8JUQVLoYY01z7Fx7zdv1pKWIJu
         Ae7IeyvYexJsWlvKvP5DEZNUyIN3xPSpQQMnHJOUi7OX2CxiR548PkUTv98OwfSwN8uW
         NKgNth5PxP+sfkJYFuhjoYXHvxFV7PvAs6edVvdzB6KGoebjWW75hSTPBVO9GbPxdRw0
         n+61NTrhZuHU4LCmRem4DrNr0dDL63pmQ7IFoRmtHhNrfbElqQ7Z5Z7sIEJNedZAFQvo
         owdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209254; x=1742814054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOfkagbjdBmv4CLlB7soohTm9hBQbwN6y7yI/dgyOU4=;
        b=vffOqwd6mzix86SOxYS0BEyK+a236b0Apvb/D6H39nLutupTilNbZCnszSY4htZx+A
         gOt0hwZL+uK/oeJDhJRW0pF2FXK3+tOIRqJjtJcOyjT0C0Y+pAKO/A7cvZTxxvIrWThq
         byCTi89U2QNTjEqgHlpRLxyMTR/Hm1m5shGutO6rpywsnq7ruNu288aYCXUk2vH18t1z
         8g7Zb2VJPd7HWBH5Unk510CjBuOETYfgdq/OlKVmbSMg9WwZrXNVf1/ZzVswVg5N/SrY
         ZPsbEoGmgJiNUHqGUZFEcQy5rgK3CWL3X7eu+0yiCHZB8f1LTgULLGKsnncEVbvnfJZW
         o9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU8qr8qsl042WlpHZlN965lUaLZKggKUyjRztOUkm++svlteZBulcwl/oyiFV4NYe3M8Ro/OZl3XIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykRxH7qJclzZliykQlEnBidsbpDZvDwHEoyions6yRoZghS0Sa
	Hpn3/AhYx8yI4RDlbDMD2/bTzT9P2cmisSNo9h5CeBxmsiFH+UH/C7SzTe8DYQ==
X-Gm-Gg: ASbGncvTDahfX6Rw9otOgMfYHYO9y6etBXhD2rAh3szaAe/ObUcLp+AqUWw31MnI1dN
	X7uiLvPhcfv26Nd58ze4xmxNfjIojhs/5lZEdEUfurApYoTdNKqlYyPBzUEfdJqVXw7V+IV7+zo
	oosD5usU158zNirjl2bDJzB5UtmHzGUq+5o2a+xzu8exBPvqShRtMXkIGoM1qPUVIzCSAf7Tif/
	27ka1g9Ox5LZn5/aahWODnRXNhslcjsZbIC2YLX2QkEKZ/7YSEzps56sKgedQuBStiD/VIttRAf
	s/T8+sXWWbi2Zg81o+AiLIeA+tYBvSJkgd1vQtdjEPJsVhyX6PZKhbx+1rzq3Zkg3biEbU5eauO
	aXMsgPjMNmNlnarcZd0OItWyWcXvdYx8nz5EcNYE7
X-Google-Smtp-Source: AGHT+IHmm7bFq5Kdu6EsN6fvfo9zCXzVFxuOFI6B7BM3LyesIrfk6sHXMcN/dBm2c39L+YpGCucaKg==
X-Received: by 2002:a05:6000:184d:b0:391:47d8:de3e with SMTP id ffacd0b85a97d-3971ffb1c82mr13356790f8f.46.1742209254412;
        Mon, 17 Mar 2025 04:00:54 -0700 (PDT)
Message-ID: <b031442c-ae27-430f-8fd4-12d15ad5a164@suse.com>
Date: Mon, 17 Mar 2025 12:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/traps: Avoid OoB accesses to print the data
 selectors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> _show_registers() prints the data selectors from struct cpu_user_regs, but
> these fields are sometimes out-of-bounds.  See commit 6065a05adf15
> ("x86/traps: 'Fix' safety of read_registers() in #DF path").
> 
> There are 3 callers of _show_registers():
> 
>  1. vcpu_show_registers(), which always operates on a scheduled-out vCPU,
>     where v->arch.user_regs (or aux_regs on the stack) is always in-bounds.
> 
>  2. show_registers() where regs is always an on-stack frame.  regs is copied
>     into a local variable first (which is an OoB read for constructs such as
>     WARN()), before being modified (so no OoB write).
> 
>  3. do_double_fault(), where regs is adjacent to the stack guard page, and
>     written into directly.  This is an out of bounds read and write, with a
>     bodge to avoid the writes hitting the guard page.
> 
> Include the data segment selectors in struct extra_state, and use those fields
> instead of the fields in regs.  This resolves the OoB write on the #DF path.
> 
> Resolve the OoB read in show_registers() by doing a partial memcpy() rather
> than full structure copy.  This is temporary until we've finished untangling
> the vm86 fields fully.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -124,17 +128,23 @@ static void _show_registers(
>             state->fsb, state->gsb, state->gss);
>      printk("ds: %04x   es: %04x   fs: %04x   gs: %04x   "
>             "ss: %04x   cs: %04x\n",
> -           regs->ds, regs->es, regs->fs,
> -           regs->gs, regs->ss, regs->cs);
> +           state->ds, state->es, state->fs,
> +           state->gs, regs->ss, regs->cs);
>  }
>  
>  void show_registers(const struct cpu_user_regs *regs)
>  {
> -    struct cpu_user_regs fault_regs = *regs;
> +    struct cpu_user_regs fault_regs;
>      struct extra_state fault_state;
>      enum context context;
>      struct vcpu *v = system_state >= SYS_STATE_smp_boot ? current : NULL;
>  
> +    /*
> +     * Don't read beyond the end of the hardware frame.  It is out of bounds
> +     * for WARN()/etc.
> +     */
> +    memcpy(&fault_regs, regs, offsetof(struct cpu_user_regs, es));

I don't like this (especially the assumption on es being special, much like
e.g. get_stack_bottom() also does) very much, but I hope this is going to
disappear at some point anyway.

Jan

