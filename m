Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFzSN4bBjWlt6gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:03:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726F12D3F6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 13:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228856.1534955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVPS-0001w4-JI; Thu, 12 Feb 2026 12:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228856.1534955; Thu, 12 Feb 2026 12:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqVPS-0001t1-GH; Thu, 12 Feb 2026 12:03:02 +0000
Received: by outflank-mailman (input) for mailman id 1228856;
 Thu, 12 Feb 2026 12:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqVPR-0001sv-0z
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 12:03:01 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5bbbfe3-080a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 13:02:58 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so61517665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 04:02:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4c4sm340949365e9.10.2026.02.12.04.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 04:02:57 -0800 (PST)
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
X-Inumbo-ID: c5bbbfe3-080a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770897778; x=1771502578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iajob/+tfoDiEKMChXYK7m57uKeGQVz0mx/ongfv1Xc=;
        b=H38V49A9isskTNKOh+4pIn8qfbjJEcot3OLoGI/2kiHEcjuQ2abP2UfMtTWgxOdi0+
         MQOWzgOt4hD7Z8+iLKaB6//NhrXpd93l1+4k7bjWF6WU7cn5UFbvk0Z6XtV+iGkMQJej
         Mu4+TpPorLH4Tmxm2lK6NBv5UHaRmIyyEIUGWQHd9MVVj83mdNZocFQu9xVejNimakrb
         c/SLDmjcZGeaJSDG/0mXiGfMimCE7v7kmHlJM0Brdpj2j7GzBuAh2yHg2CeYdNgxI6pL
         6+XOUCivSqkRooLF9Q3XS7xbrQDj+4D9XI+rA82YE2D+KRKf7yPBhFiNRfJbpEqevC9r
         im/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770897778; x=1771502578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iajob/+tfoDiEKMChXYK7m57uKeGQVz0mx/ongfv1Xc=;
        b=umi6S/uRAu1ik11tVHxjw2uZX+mphtU/J1al9AoRqHByQLGm9Rn5pFcL1Kvg4O5RIv
         15d+NEpMg6V6GoUnbmEWh0J3jvzsIltv1pKjJSwoXAyGeFm266orpz4+yA+D+KTO8rMv
         BpPpJ7+wO9agHS8rrQUq59LZsGFGNLJK5J9CeX/iJvYogb5mUk5JnqCRU5m8j3QBHv7Z
         gE96enFqpRh0arDnEK+cZ+tARa8pZ80k1/D6+7azgDALaF7xW9LuNcWLZbaEKvePcZQ3
         rNxDXjFTbJYztPlSoTpxPlV9MrEmq5BvpCRlUuXyUl8Gck71Qz4QT9VKwLHO+sZ+2Zx4
         qJZw==
X-Forwarded-Encrypted: i=1; AJvYcCUPDrHF8ccHgofqp3qp/jKlzP1TWyEGwjfrMyOaxxv1A/jw1bqQumb1K2PJwCR3BaO2VkMsYFZoBmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFwEFtoVAJAMmG4AH+8PEv6mOhm2gzCRcgq85HEtcTVSb9AQpK
	Mx95xjxtl7VcTErUa8HAwib0mmPBWMlw8APmOX3pamwaGYGya4PFS1h7zbPPTPBfCg==
X-Gm-Gg: AZuq6aJbi4x64NXfx+8VQErXblFIdJ5H7fBxBetu9G7Gs+OD7/50yz/cpahY3Kz3ZQW
	yJc1jEr/Nmc4BCQQVEaL2wkT6QKlhtc2lIvWob0lRqugJ0VU2/9iw6psS7RwSfKMSViG6YJDUNm
	GnuV2Nuyjh20M4+3Fpc0y2dJV/by12mKT8Oivbq4ugCsn5E4e/7swpZh2cd22S4AZPexoAaIYyJ
	9K+/euoCKhkoTYYgqBJrocT/1fFVXMFGVt3fKV2jKc5DyyQ8hKAkTn/5b8w94myGLdaSBzy138p
	G/PsFpehWgV0KjKFSU5naYilhLuEEJ2/joXW6fnWuv3ZFcmpFB9rtpApIFmwZPaQFgjvw3aWI48
	p803KF8QuROaPwuMdhD1anj9YpO0JYh507r/EZvslKbw9zVVqAh0d+iR8Z9QLOcsb4yjyyOIHgu
	kzptbmxDzcjhcqrsRecxP4G55FVoVJGmpMoi3BYZgy58fXTMEna2kXiz9Oh2GXfdrxXR81saGZR
	kDwdvLcD6bBEfw=
X-Received: by 2002:a05:600c:4e91:b0:483:ea6:8767 with SMTP id 5b1f17b1804b1-4836571fe86mr38921825e9.36.1770897778012;
        Thu, 12 Feb 2026 04:02:58 -0800 (PST)
Message-ID: <18795ddc-c558-4a51-9b61-717e96bf5150@suse.com>
Date: Thu, 12 Feb 2026 13:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] x86/mcheck: Migrate vendor checks to use
 cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-12-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-12-alejandro.garciavallejo@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 5726F12D3F6
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> @@ -862,7 +861,7 @@ static void x86_mcinfo_apei_save(
>      memset(&m, 0, sizeof(struct mce));
>  
>      m.cpu = mc_global->mc_coreid;
> -    m.cpuvendor = boot_cpu_data.x86_vendor;
> +    m.cpuvendor = cpu_vendor();
>      m.cpuid = cpuid_eax(1);
>      m.socketid = mc_global->mc_socketid;
>      m.apicid = mc_global->mc_apicid;
> @@ -964,7 +963,7 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
>                          &xcp->mc_ncores_active, &xcp->mc_nthreads);
>      xcp->mc_cpuid_level = c->cpuid_level;
>      xcp->mc_family = c->x86;
> -    xcp->mc_vendor = c->x86_vendor;
> +    xcp->mc_vendor = cpu_vendor();
>      xcp->mc_model = c->x86_model;
>      xcp->mc_step = c->x86_mask;
>      xcp->mc_cache_size = c->x86_cache_size;

What we do internally is one thing. But what we report to the outside shouldn't
be inaccurate, imo.

> @@ -1122,7 +1121,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
>  
>          if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
>          {
> -            if ( c->x86_vendor == X86_VENDOR_AMD )
> +            if ( (cpu_vendor() & X86_VENDOR_AMD) )

Nit: No need for the extra parentheses here.

> --- a/xen/arch/x86/cpu/mcheck/mce_amd.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
> @@ -160,7 +160,7 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
>  {
>      unsigned int i;
>  
> -    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
> +    BUG_ON(!(cpu_vendor() & X86_VENDOR_AMD));
>  
>      for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
>      {
> @@ -291,7 +291,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
>      uint32_t i;
>      enum mcequirk_amd_flags quirkflag = 0;
>  
> -    if ( c->x86_vendor != X86_VENDOR_HYGON )
> +    if ( !(cpu_vendor() & X86_VENDOR_HYGON) )
>          quirkflag = mcequirk_lookup_amd_quirkdata(c);

I wonder if this wasn't better switched to the positive for (checking for AMD).
This would the render the BUG_ON() above useless.

> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -711,8 +711,8 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>       * a MCA signal is broadcast to all logical processors in the system
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
> -         c->x86_model >= 0xe )
> +    if ( (cpu_vendor() & X86_VENDOR_INTEL) &&
> +         c->x86 == 6 && c->x86_model >= 0xe )

Nit: Why the re-wrapping of lines?

Jan

