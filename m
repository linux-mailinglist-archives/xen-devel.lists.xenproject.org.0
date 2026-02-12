Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Tmy/M+rVjWme7wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 14:30:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258512DD17
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 14:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228977.1535043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWlL-0005zu-NE; Thu, 12 Feb 2026 13:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228977.1535043; Thu, 12 Feb 2026 13:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqWlL-0005xK-JM; Thu, 12 Feb 2026 13:29:43 +0000
Received: by outflank-mailman (input) for mailman id 1228977;
 Thu, 12 Feb 2026 13:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqWlK-0005xE-3Y
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 13:29:42 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1bd2900-0816-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 14:29:39 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so5167934f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 05:29:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e59c19sm11645137f8f.34.2026.02.12.05.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 05:29:38 -0800 (PST)
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
X-Inumbo-ID: e1bd2900-0816-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770902979; x=1771507779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fz93Y3WSiu8unf0rKniKSu90JpiEdagtnmKOkaOfPo=;
        b=Hzjdm0JmOM4xCUmiTWrN3iBkYGMz/hUm5MLCN8GikPVYIE6Qv6O0ncK3p0stgkMgd5
         NCQXWH0wwR6ZMSvSPQC5Iwlwioo42iySNFqmSXPgwdFhY96tBfLBYIgV2pFppX7sw12P
         Yk/wPRT36HFy0jDqsSZqT9kMPmTbCzn2+zD1l3DR8Qj9gnEKg0ZDzmW4Nlfe1jdfE3lZ
         vGONVWUKJFVet7eA05ZIkCLlgnq/URj/H2V39PAWwi0gB6VBaqP7jql58DI7SH5yDvkF
         J//qkfTwI7dnBYOpwRUzwsW1buEnYYR4TnhEHU7wauV0iMjPy8yYRCdPNI1rybWsLqpu
         GAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770902979; x=1771507779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fz93Y3WSiu8unf0rKniKSu90JpiEdagtnmKOkaOfPo=;
        b=Odn9LVFcUDaTRPnUIeKnjLNh4OESlxC3mWIycyN+klTrxkIPyLRn/tTFqjA0tuW5qr
         g7/ToB7+HIMXTrU2c62+zfp/UOy0Ru4ff+0nX9ub3vegkPUAdMsBaZt4xxVTgAFe4Euu
         8UPZhout7hnXRk5CmQDAOAdjiMRrzSjtOOaTkkjeOpu+fNDw2gN35P5eyaBpQNJpYAEU
         wMxa85VHlZyA0J0Nev/KhXha3xOP8ypjKljPXYViL6i/dfB6SGXzwp+w9BkZiYl6d5sD
         2IU9JjPU6jeJVw1b3SvcqR1Tkb+1Mrd6gVJ+PQUPWkHxKb3zKnipUxAjupOd253yqrXl
         fCHw==
X-Forwarded-Encrypted: i=1; AJvYcCWClnKVwEdzuP3oR7bsLNDcvk9XAnuFiJRB5Q3m2DYixaQzjjd8Kg1bJ/k90BLWX8bmqSedlq9TBrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+msPr2yKHA7yx1SI//7qO4pX/DbbeuzpD7xQPW1lplyfsqv4E
	MZEqF6zDDaCrvm/ec0fvWknmmPaCTGSCIHbuH4zE7XVRW5fE+Elxx50CtTTO+fmx8A==
X-Gm-Gg: AZuq6aJiVROXIqi5hq+CinY/B8jFk5eGUSr6ste15o25gxQJQ/lVePZPaGr6TR/arSO
	+QZglStEoapoSBPM2z2yAv9o5Lc6FWoVZEUqYXRDVl8KQbWtj0wnA1AB2lOzA8ZKuQANyhsH2U4
	73SBp3e6SrYGELm3tuBzc5WTnPacW5WktWZBX1DGR8+euz0nEwWHdO/mjQeQPZsI7vgjmLmDwBf
	UQ3yiyh+J6KN0FdKhDzUqeNtFlz39x9qEwKDKDzeJrRFlgyqf6NkpgSFMqqGqF11cYoWdhedo5d
	kv701h2pFlrJ0eYBz6i56gPExlP65xOw10nHwYM6swqq/TzvD+BteX2fOZNcSqSmK+AutNYbP36
	lXrCxUTYlGZC8M9DbV1C8+BzOMhST4DEYAKLjvs8sngGlOuHMooqL2C8HSHgkI4qMc3hcU0iCUK
	N0I5tk7EcK2dXfu+DuzfjOEiKqsFUNjqnCoO4luoXBXs3SBFbCfnGygnu6eT09BCtBKSPd5D84y
	/eIE04b9zkSZ8kgsNBUnT2A+Q==
X-Received: by 2002:a05:6000:1acb:b0:437:6fcc:f648 with SMTP id ffacd0b85a97d-4378ac891f6mr5867271f8f.53.1770902978993;
        Thu, 12 Feb 2026 05:29:38 -0800 (PST)
Message-ID: <c723c1d7-264b-4fcc-ab38-922f8ede3c4f@suse.com>
Date: Thu, 12 Feb 2026 14:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] x86: Migrate every remaining raw vendor check to
 cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-14-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-14-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3258512DD17
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> @@ -424,7 +423,7 @@ void domain_cpu_policy_changed(struct domain *d)
>               * If not emulating AMD or Hygon, clear the duplicated features
>               * in e1d.
>               */
> -            if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +            if ( cpu_vendor() & ~(X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>                  edx &= ~CPUID_COMMON_1D_FEATURES;

The usual transformation here would have been to simply replace p->x86_vendor
by cpu_vendor(). Such an unusual pattern, if indeed necessary, imo wants
explaining in the description.

As this is entirely unexpected, I now wonder whether I overlooked any other
unmentioned unusual transformations.

> --- a/xen/arch/x86/e820.c
> +++ b/xen/arch/x86/e820.c
> @@ -426,7 +426,7 @@ static uint64_t __init mtrr_top_of_ram(void)
>  
>      /* By default we check only Intel systems. */
>      if ( e820_mtrr_clip == -1 )
> -        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
> +        e820_mtrr_clip = cpu_vendor() == X86_VENDOR_INTEL;

Unexpectedly retaining == here?

> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -419,9 +419,8 @@ void __init init_IRQ(void)
>           * the interrupt.
>           */
>          cpumask_copy(desc->arch.cpu_mask,
> -                     (boot_cpu_data.x86_vendor &
> -                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
> -                                                          : cpumask_of(cpu)));
> +                     ((cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
> +                          ? &cpumask_all : cpumask_of(cpu)));

Nit: Indentation again, and apparently also excess parentheses.

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2011,8 +2011,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>                       * interrupts have been delivered to CPUs
>                       * different than the BSP.
>                       */
> -                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
> -                                                 X86_VENDOR_HYGON))) &&
> +                    cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&

Whereas here parentheses look to be missing (to isolate from the || not visible
in context).

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1406,8 +1406,7 @@ void asmlinkage __init noreturn __start_xen(void)
>           * CPUs with this addressed enumerate CET-SSS to indicate that
>           * supervisor shadow stacks are now safe to use.
>           */
> -        bool cpu_has_bug_shstk_fracture =
> -            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
> +        bool cpu_has_bug_shstk_fracture = (cpu_vendor() & X86_VENDOR_INTEL) &&
>              !boot_cpu_has(X86_FEATURE_CET_SSS);

I think retaining the prior wrapping would be better here. When done like you
do, really it should become

        bool cpu_has_bug_shstk_fracture = (cpu_vendor() & X86_VENDOR_INTEL) &&
                                          !boot_cpu_has(X86_FEATURE_CET_SSS);

Jan

