Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C596FAF590F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 15:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031149.1404884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxXZ-0005uW-VL; Wed, 02 Jul 2025 13:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031149.1404884; Wed, 02 Jul 2025 13:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWxXZ-0005sC-RV; Wed, 02 Jul 2025 13:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1031149;
 Wed, 02 Jul 2025 13:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWxXX-0005ry-PB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 13:30:19 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b09cd59a-5748-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 15:30:16 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3879606f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 06:30:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e301f704sm12911795a12.18.2025.07.02.06.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 06:30:15 -0700 (PDT)
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
X-Inumbo-ID: b09cd59a-5748-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751463016; x=1752067816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zRW1oq9x1Gowug9U+4ScVkIksBGwzlai+tysLwiHgIc=;
        b=f+8oLKcUyQMS11/5JD45V84zf5tJGvGNP6IGlSa4rRUbKR9jpeQwA0oMI3bjCfyMSx
         KYz4bnSiMuIVjj81mE6sGB/b9lDK1kMXh1Pw63Jc0ze7dLlR1DDzPcLhHLRvnwJ7cwwx
         WYV+opJ3gzcPxehhdD4j4+ALu4SYz0daDgzCyK8N0XaoDwMyr/o/bW9h3mCwGieLph1N
         oU6SWnq3qM6UXtYmhawhzUbzNN+iq/2anOlktSmi55F9T/pU4fWFCtmTNUBcIfgOiV7T
         sDFbaYpyLieclsg1EJOcWPndPQdYTzCNCNGMMXodA5HDVlpQKrcgxsaddoxTAXP3V3to
         0jYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463016; x=1752067816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRW1oq9x1Gowug9U+4ScVkIksBGwzlai+tysLwiHgIc=;
        b=OMiSQ9SFZIFpb9o2zko7Nl621wd4qQ/BsyocvlHrjqCJJjAsmWydrJgVY+8QsnXwmM
         ubE6L385UWK7qr9hG7Rr1hthEG6KvQ5YwABECtF00FUAW1IWAsboTjak/Tby4qAn1Yal
         3YLIURT8ZsIYhTC78+wj9hfK5BFrYmsuM828tTRfEV++Xt8OtNfMLPXDgh9tnf1oD0Lg
         0QyC5D5ERKBICimh2+rGIZKOMKidhBJqaoe/zANRxL9zui/SSOG3U4CXK5YxqIrXeQna
         0C9+MN7kHeQKRIi3QX7QVxLlLqUWenpBjq8+fcK/UKzIGoanoLtlLxWB2afeucPMT5mM
         fQPw==
X-Forwarded-Encrypted: i=1; AJvYcCXJg229mBCYF7HF3Srr0cemNWIl9cJglyy9dB2J1jbOB7xQ7GA0sIj5/b+Z7uuH4fAknxGCTKVIjck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKkpnCXEhmrWGs80Jo6xeMmb7JB+kRe0z6i4V0DN4x1L3bA+6l
	+EprOWfrOPSLOjI2NUGmN+rF3fL+0OlvVyoBMuEHtp1qBc4Uor/DiqNOWTHkxN0I8A==
X-Gm-Gg: ASbGncsvJjQ2L4rS2FcGFzDBo/irn2gA7IU6D8HfAwNltwm1usVoM9A5+a2gp/gTlC9
	bTE48iKxqNX72N7PIGS7bEyEpYHYkD8XpU59S3zwybUaxQIVY+uVs4V3CNv/LqzKwplTcVIQrre
	NgiV7ATrjkfKdSVctf0NcMYRhiWMyg4MBJnUHTZgZ/NqR9+gA6O/M1pW8Mr+/Xg8N9LzGD+62OS
	smQ0t8aVXJuCoAJfYOD1PAg/nA9Dcpa0z0qyHuV5T5ziaiI8MfCgm6vhcVKuSq1JHkvBJuXImeh
	+pIjihkJMJc3SN08BwEdl9VDAxJKrBVg4PocA/XTfYqOzPrzXYN1jgGaL5C7thbnFn84IIKSkif
	gP7f5hsgAaOkYhHImKq7uOh+3lUNWuflnjyp80Qwo8UxO0xk=
X-Google-Smtp-Source: AGHT+IHTHQJNrF4YoS4cy7aQwDozmnAqSbraGF438axAAL9u/fQHEEnWp6T9Jdz6mkJx7CUWOD5bLg==
X-Received: by 2002:a05:6000:26cb:b0:3a5:1471:d89b with SMTP id ffacd0b85a97d-3b2019b6a21mr2170259f8f.53.1751463015950;
        Wed, 02 Jul 2025 06:30:15 -0700 (PDT)
Message-ID: <ffba326b-6fa4-449d-8db3-66fb145a61a4@suse.com>
Date: Wed, 2 Jul 2025 15:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] xen: Split HAS_DEVICE_TREE in two
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-9-agarciav@amd.com>
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
In-Reply-To: <20250701105706.86133-9-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2025 12:57, Alejandro Vallejo wrote:
> @@ -85,7 +86,11 @@ config HAS_ALTERNATIVE
>  config HAS_COMPAT
>  	bool
>  
> -config HAS_DEVICE_TREE
> +config HAS_DEVICE_TREE_DISCOVERY
> +	bool
> +	select DEVICE_TREE_PARSE
> +
> +config DEVICE_TREE_PARSE
>  	bool
>  	select LIBFDT
>  

We're in the middle of various ([almost] alphabetically sorted) HAS_* here.
Thus DEVICE_TREE_PARSE wants to move elsewhere. Or we want to move back to
naming it HAS_DEVICE_TREE_PARSE, but I think there was a reason why we didn't
want it like that? Just that I don't recall what that reason was ...

> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -67,7 +67,7 @@ endmenu
>  
>  config BOOT_TIME_CPUPOOLS
>  	bool "Create cpupools at boot time"
> -	depends on HAS_DEVICE_TREE
> +	depends on HAS_DEVICE_TREE_DISCOVERY

Is this correct? CPU pool creation isn't driven by DT discovery, I thought,
but is a software-only thing much like dom0less?

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
>  
>  #endif /* HAS_PASSTHROUGH && HAS_PCI */
>  
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_DISCOVERY)
>  static XSM_INLINE int cf_check xsm_assign_dtdevice(
>      XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
>  {
> @@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice(
>      return xsm_default_action(action, current->domain, d);
>  }
>  
> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */

Here I'm similarly unsure: Pass-through again isn't a platform thing, is it?

> @@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
>      struct boot_info *bi, void **policy_buffer, size_t *policy_size);
>  #endif
>  
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>  /*
>   * Initialize XSM
>   *
> @@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_info *bi)
>  }
>  #endif
>  
> -#ifdef CONFIG_HAS_DEVICE_TREE
> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>  static inline int xsm_dt_init(void)
>  {
>      return 0;
> @@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
>  {
>      return false;
>  }
> -#endif /* CONFIG_HAS_DEVICE_TREE */
> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */

The situation is yet less clear to me here.

Jan

