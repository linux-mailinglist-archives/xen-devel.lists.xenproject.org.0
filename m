Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C207813410
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654621.1021754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnK7-0007tX-Fp; Thu, 14 Dec 2023 15:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654621.1021754; Thu, 14 Dec 2023 15:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnK7-0007r9-CW; Thu, 14 Dec 2023 15:08:27 +0000
Received: by outflank-mailman (input) for mailman id 654621;
 Thu, 14 Dec 2023 15:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDnK6-0007r3-5f
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:08:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02ea5cc-9a92-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 16:08:24 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a1f8f470903so659749166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:08:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vc12-20020a170907d08c00b00a1d4a920dffsm9411358ejc.88.2023.12.14.07.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:08:23 -0800 (PST)
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
X-Inumbo-ID: a02ea5cc-9a92-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702566503; x=1703171303; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SNQsVP6pxPj/+aujCEPQBO1mZgAKraFllw3rLOws8gQ=;
        b=G9sclT3HYocBuTmLL/CTveEo3SPqB7nI6i7sHjieexD0R32zX4vJx3o4/7pBPCyhbI
         clRTPyTfIz1dQ1Lyx0PXuddfJXSheePRrd2bH1wFIEExxI8jZJtNWsOJXO3J4AmQQC1I
         LaXDvgU+PgiNt1zz8C1HYXRVAN1b98xi9CsZjSiLDC7yk0zvFhErm3Wyw08yAA0CSeQo
         USZwPnST7y6RU7fiNPF+fEZDVRaIvoZwu8vwlR5n3hCAEZ3KaKMJqmQnckSu/eicbw1l
         qRBdMNVeR3xIn14XE4USFgIF60P0sh7upj97uZ1Fet/WsbXpdRcTCl8iIdu8d3d/Mka5
         Fjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566503; x=1703171303;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNQsVP6pxPj/+aujCEPQBO1mZgAKraFllw3rLOws8gQ=;
        b=nVrpc7JJ+kfzQmtxyb5x7rW3GB3Deh0eyLzSboirG4paoLxPMb3DoTv4euGbjxLJ9G
         tiH/JNRetozln91yban6M9rVMolNcGFmWHnyg0qmkFgSFURfosAGLxXEEhXGVSkqOaMr
         ws5mkZ4t+nRYhq2QLaag7RYf2+QKlJ77oXbiEyUVush465Hri1VeDr4QewCN26j2jRID
         HeSLBAajdzkgkQ2x2Y4ecxF6VNxp8DzaRQ+Wp6En+sSssXhU/02OrLFHB/cxXqQGlZSh
         Yr2uiI3teW3R4aBqd/Az3WQIuilE5qUyZnAKo9OZ6/07g8TWauqkxty5/0ydLCr32rWF
         300g==
X-Gm-Message-State: AOJu0YxQWpMJTuX8G/3vCZ1gfsp489CeS7EC4TfGf21O6tqz0wnOuOnW
	3hZL6NZX4kxTMwvZIN1HS8Gb
X-Google-Smtp-Source: AGHT+IGrOC+1nTnjUpaehxubetRQGBPx94WroB/zqU9Mpm+3uRg8DC+VFIVq/xBf+7uW310Q9AtB9A==
X-Received: by 2002:a17:907:904d:b0:a1c:d54f:9f19 with SMTP id az13-20020a170907904d00b00a1cd54f9f19mr4355832ejc.53.1702566503545;
        Thu, 14 Dec 2023 07:08:23 -0800 (PST)
Message-ID: <483a3c56-14df-4130-9b05-506a19333afc@suse.com>
Date: Thu, 14 Dec 2023 16:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/39] xen/riscv: introduce asm/event.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <492c6183a8248046f0b6fdb186ad5b33953c3b24.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <492c6183a8248046f0b6fdb186ad5b33953c3b24.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/event.h
> @@ -0,0 +1,34 @@
> +#ifndef __ASM_RISCV_EVENT_H__
> +#define __ASM_RISCV_EVENT_H__
> +
> +void vcpu_mark_events_pending(struct vcpu *v);
> +
> +static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
> +{
> +    return 0;
> +}
> +
> +static inline int local_events_need_delivery(void)
> +{
> +    return 0;
> +}
> +
> +static inline void local_event_delivery_enable(void)
> +{
> +}

These are stubs aiui, and hence would better have BUG() in them?

> +/* No arch specific virq definition now. Default to global. */
> +static inline bool arch_virq_is_global(unsigned int virq)
> +{
> +    return true;
> +}

This otoh may well remain as is for the foreseeable future.

Jan

