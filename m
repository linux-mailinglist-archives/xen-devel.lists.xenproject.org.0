Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gl9EkIwzmnIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:00:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D6386677
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271368.1559561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DuX-0004ti-Dd; Thu, 02 Apr 2026 09:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271368.1559561; Thu, 02 Apr 2026 09:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8DuX-0004rT-Ao; Thu, 02 Apr 2026 09:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1271368;
 Thu, 02 Apr 2026 09:00:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8DuW-0004rM-8A
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:00:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8DuV-004H3w-9x
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:00:19 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce3018-2eae-0a2a0a5409dd-0a2a45079790-32
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:00:19 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce301f-ba2d-0a2a45070019-d155dd2ec5a5-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:00:15 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43cfa33a983so403459f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 02:00:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d29bbsm6563011f8f.21.2026.04.02.02.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 02:00:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775120415; x=1775725215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLOc/JW8ZMw+OFh6xrKpF1PhXLvQuUzOtlqad9fG2lc=;
        b=Tcbd+aq7tTejc8uKubmtpjcp3iCIp193ssSayVGwZaKyk7d8RinnjOFmdHaFVv5i7D
         cdlkpznmbpCSRiJoGO8mzxtsEoqiZzh6w/5PnSdSeEkpcVRSoTSwJ7mmykUycux9+pks
         9Nh29VrGrJhNgb9QJVawtZj3UOAWgscTvZaGq+Lwowigs2w8PlY1Q4K8//CIPNGWHK5l
         Mi3ZwP8o1NxegaFEhntv3OqYzttQs7q6eVZF/nixYc8HO3UHsH2isfhxbz3BkjRqbATt
         oCYELvZN2htxmT5fplrKbwQ+DxcCx6T5byzuA+c12ip5hq2tudYJeWnpNFxC2T8q2Doo
         a0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120415; x=1775725215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLOc/JW8ZMw+OFh6xrKpF1PhXLvQuUzOtlqad9fG2lc=;
        b=awgKEieHRIq3vfVi6/7ngN6uVnQ2YEgAkar6eKSwKEYQNeDUKFxgwBFMeXiiWG39iQ
         hONawE3frW5LIjQ9Lg0UKkXxjLpSdueA3cnShxnnAZ/5fIIAJrJQ8hHDA6PN97WwJa26
         ueMH/ew3JDTdc4kYu2u6bZImg9NO4cmQ7huxGzQ2oEc7Of5geUHeAInEsLjVQOGwOJVl
         /knuIYujpUN2WVD6K5x+uWwrSXZAI3Rojg/l8q1FJFCJ9oSAs+/0J9cFQO38B0DDEaN7
         OEjB6tuoKc0k2au+AFHz/YkKbFGdf02bmXEhdNGXz2T9JOjrVu1oxUcnCk/YahE0kwuC
         W0sw==
X-Forwarded-Encrypted: i=1; AJvYcCVXolr+NYTG3fUjelhLzgJ6z/ibe4AFivTTQuMjY45qitvQDjuIPdAKgX1AAzv7KIZfiC5KdS4NxWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwR2QRLOfi0JCC+S/gmAfLHzfY51+l8yHwAkZdJtvKcJUeLLtxm
	2OxzJI+oZJVqgpwVv1t31W131CHPr3Bq7e+TksM5sT07biP6GkrCUXq9Io8uKVet2A==
X-Gm-Gg: ATEYQzy1Y7HQ+a6o0QxM/HwO9uCwQUPnjHpctZFxi8lK3fY7rizg4IhTQF2/nUWBsX0
	v4h1CsYS9miaBDD+5341cABvUxlJx6bqb5+4Dk02JAtaGVDYlSt+s1fRsOcS7SfBgE7qX0GSPD9
	055jHAc5HQipG08LUA5tXknFztC9+pYYwD2IT2eNK5yXZxx5lygb5D08vEvNFSML6vayNqqig2u
	OGK3QEMffz2PrVBmm654/koZGcfTnxuajYj0M0zF5mwU6z3RqqySNVG9j1QYpQ8qKwmIFIaqPHN
	fl4B2U4HiVuttMQ+Rcqh3Gmsnq5ptOmQKnLeaCH3G/P7Z01eZ7jfGd9MUPhj7aKUNZn12cni5ba
	TqDHbECukIzJClTcz3dRLAQB/2EYYl/G1tTW4lavSrxZpSUlEsdMhsVs0i1JcNOZcmiWSk1my6d
	1Z5Hwb/GImDyPpXdbtSCnrkCtuSLab75zGnVI+fRuHAQMMuRn7nIi/9pfLRouBRbgJedq9hRaQA
	0uigJfg1CebjGg=
X-Received: by 2002:a05:6000:2909:b0:43d:29a:e42a with SMTP id ffacd0b85a97d-43d150c211dmr12433330f8f.29.1775120414796;
        Thu, 02 Apr 2026 02:00:14 -0700 (PDT)
Message-ID: <8393b8fe-6ba9-439c-ae15-a84409d0976d@suse.com>
Date: Thu, 2 Apr 2026 11:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/27] xen/riscv: introduce aia_init() and
 aia_available()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <74f15b1db86139b36b721ef9d12b998fe4f0f348.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <74f15b1db86139b36b721ef9d12b998fe4f0f348.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775120415-1334C41E-922DAA10/0/0
X-purgate-type: clean
X-purgate-size: 1521
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: A91D6386677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> aia_init() is going to contain all the stuff related to AIA initialization.
> At the moment, it is just Check if SSAIA extension is available and if yes
> set is_aia_available to true.

And (future) users of aia_available() can't directly call
riscv_isa_extension_available()? Nor can aia_available() be a convenience
wrapper around that call? It's only ...

> --- /dev/null
> +++ b/xen/arch/riscv/aia.c
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/types.h>
> +
> +#include <asm/cpufeature.h>
> +
> +static bool __ro_after_init is_aia_available;

... a boolean, yes, but still.

> +bool aia_available(void)
> +{
> +    return is_aia_available;
> +}
> +
> +int __init aia_init(void)
> +{
> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
> +        return -ENODEV;
> +
> +    is_aia_available = true;
> +
> +    return 0;
> +}

Why the return value, when ...

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -8,6 +8,7 @@
>  #include <xen/lib.h>
>  #include <xen/spinlock.h>
>  
> +#include <asm/aia.h>
>  #include <asm/intc.h>
>  
>  static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
> @@ -27,6 +28,8 @@ void __init intc_preinit(void)
>  
>  void __init intc_init(void)
>  {
> +    aia_init();

... the sole caller doesn't care?

Jan

