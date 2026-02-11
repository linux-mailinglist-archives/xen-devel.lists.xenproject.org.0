Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKDeN6+ojGkusAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:05:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE96125EE9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 17:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227895.1534288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqChm-00061f-St; Wed, 11 Feb 2026 16:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227895.1534288; Wed, 11 Feb 2026 16:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqChm-0005z8-Pg; Wed, 11 Feb 2026 16:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1227895;
 Wed, 11 Feb 2026 16:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqChl-0005z2-UB
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 16:04:41 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e7eea73-0763-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 17:04:39 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so4792045f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 08:04:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e3a9acsm5278501f8f.30.2026.02.11.08.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 08:04:38 -0800 (PST)
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
X-Inumbo-ID: 5e7eea73-0763-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770825879; x=1771430679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z1rSqZoB/cFftPttMYP3X84zlgx8fMHsh0AbjHx39Fo=;
        b=cMLyrch0c3wY2g0Xht1mi08WfbXOgSYsqOiFXyfxYJqoIL2KZvqHWvxdIjIARA58nW
         T9o0X/ZQNhVP1iiAqpXx2ri7lHaCb8iTWtkCpSgmoaU9IVGh7W8WFztSwztMuWVSehfV
         z8Hn2tZxqQSYMs9hTO8DjYWg+bWJ8xcLVLYdbT2YDcFn+8VMdok7H3UWVfsI39xQEUWZ
         Ldt82KrBZN+H95vgs0UNexGMBhJ5pKaBBaT6k7AtM8e72mB7pi/2LWrYj9ZExzByEQTQ
         yzyMmG1wMtvjiVryy1bDfVeNcm0KX2IcZYYzsM7JuPYdCVG8M7RSlsaMQNOMu9jqGheI
         ko0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825879; x=1771430679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1rSqZoB/cFftPttMYP3X84zlgx8fMHsh0AbjHx39Fo=;
        b=calj7zwbj7MSecyY2Fk2xH+NrWhUVVyirO42Ek6+3JylOU63Rppmtzl+/kDUs1x8ya
         U+iONrFivDmoGBymI6KrlVj/4qCKCm43s4BX74zuUi5BIiQA1Z7tMh8t7dD/vw2qOYII
         /X6JAMRgPMo4Q2m5oluzvn+SzHu/hJ4xqEKJ8wjK3ntRQNXdZ2Zu7TaCld92dihtXnlv
         wndBe/yYzzTzGVG5A7om4VPeGe7brgPnBUCqTSx7DmbZAHPZqSze1F0x3aL5Jp/lV56y
         gIKaxHCPSfiFv8/HB9q6tWO0fhoXCl6bd73ORPHavAp0+4FzxYiAU3TiljmgoEp1gdwI
         oLKg==
X-Forwarded-Encrypted: i=1; AJvYcCU8KSggD8qwYththA8q/IoBvhq0Rvy8t+TQRU5Dyj+uY+72ny/Rb+aEwt+27kUTHOzEqcIWs1wTmco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHNffwcHFdsN+AmC8POzdQCTP4ZdSRk5lZBlevx4siPJN0IiiO
	QBQ1FXJr4ahvHPVkl1ugf4BygyeDu+m9ykAHaib73Y2vvLRCzcKoB9GjlRf9mB3KtA==
X-Gm-Gg: AZuq6aKBzZZa+M+UgeymzL0liRPsZM1MVdqEEYn0BO2ZFBgOiZcQ0AUeSt0xeeGy/dy
	HskPwy/wu7YQNy0NGZjbFDRY/AfSW+R5p8u3ho4kTqt0su4QVWGd6zSZpXZnXX0XT48lwdTiNbK
	S+vbLxThy1jds5qNO4BDdNOVRbpdKsREYZ4bS9eDMKlNeRxrAxikRBT6UrACQ1MloAr4t8VJiGf
	rk4rb9/x6djPf+NuyG1pvqfuzmyeOm17L4wzmIaAlkUBMBiCGb+66399y2KQxXumAYYnQJLl0n1
	SY/wsh+xrDNogs8q/SuKHt5U04sNmPG3Jf8+TRFH79ZgCf5ib8GmYlQQaFDwZ1VzGkjWZbnbzb8
	JuKvcdz7bbiTsJeq1Blh4G2zJsLDC3qO5dlZKBAtwt1NzBttijlAdyhTwqQx4ZdDY+g1U7HFWlt
	yPm55hYQkKeg2zatc8m9AQHPhw5qktMwmO+j0vyi5x12Uzm66Gbxh6qaJ1ECroYgxAY8oVRMysr
	l3tKThGnSy/JwQ=
X-Received: by 2002:a05:6000:2885:b0:435:9d70:f299 with SMTP id ffacd0b85a97d-43784548b6amr3717848f8f.22.1770825878866;
        Wed, 11 Feb 2026 08:04:38 -0800 (PST)
Message-ID: <7eeb369d-04a9-4c17-983c-078e45b4679d@suse.com>
Date: Wed, 11 Feb 2026 17:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 0CE96125EE9
X-Rspamd-Action: no action

On 06.02.2026 17:15, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
>  	*(u32 *)&c->x86_vendor_id[4] = edx;
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> -	switch (c->x86_vendor) {
> +	if ( c->x86_vendor != cpu_vendor() )

When we introduce new functions to Linux-style files, nowadays we take
the liberty and make them Xen-style right away. In entirely Linux-
style functions the style should remain consistently Linux'es, though.

> +		panic("CPU vendor not compiled-in: %s",
> +		      x86_cpuid_vendor_to_str(c->x86_vendor));

This will be somewhat awkward when c->x86_vendor is UNKNOWN.

There'll also be a degenerate case, but I'll comment on that on the
earlier patch causing that.

> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -14,6 +14,7 @@
>  #include <asm/cpu-policy.h>
>  #include <asm/cpuid.h>
>  #include <xen/lib/x86/cpu-policy.h>
> +#include <asm/x86-vendors.h>

Nit: Can the asm/-s please all stay together?

Jan

