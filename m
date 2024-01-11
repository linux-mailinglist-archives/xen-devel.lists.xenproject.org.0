Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65A82B240
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 16:57:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666415.1037035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxR2-0000Z7-4b; Thu, 11 Jan 2024 15:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666415.1037035; Thu, 11 Jan 2024 15:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNxR2-0000Wh-1o; Thu, 11 Jan 2024 15:57:36 +0000
Received: by outflank-mailman (input) for mailman id 666415;
 Thu, 11 Jan 2024 15:57:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNxR0-0000VL-Um
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 15:57:34 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21610df3-b09a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 16:57:32 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e629c5a42so3377445e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 07:57:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b0040e54f15d3dsm6227949wms.31.2024.01.11.07.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 07:57:32 -0800 (PST)
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
X-Inumbo-ID: 21610df3-b09a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704988652; x=1705593452; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbNngV0ZkuaWRmYFsH2qhghgwAROKKFwy8xFB4Etjmo=;
        b=H+AxrQqkxND6bEcYhXoZNEBfOYH9teTvhBjhIXZ92CYO/BglNZqbVO/L+9iXKdOcwO
         iOpQ0wEeCRHFtep2hVLER0CPplJisOvFGUrqgoDJ9WWXm7EGU3t0BNb7QOlKCSVnKZ0T
         79yCAOAx7NOtb1hbswJbuma6pdgwcDKVPe9Q9LEFz3tqjH5EQWhs1qYXfmJujUJoPEWV
         lj9VWIEYyEN5E/Y7VqkGml3C6vlUpQ6MlqhNcqnxqjNZowo3ZOCLfMKaa0Xmt+afiKGS
         yFm5zff7fynOEccyD+CJU5wXlhSEG0poWmRIEIvne5nLk+7Jtl7V4SBn3CfqaQ9384WJ
         5zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704988652; x=1705593452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbNngV0ZkuaWRmYFsH2qhghgwAROKKFwy8xFB4Etjmo=;
        b=Twp1ZYkuZwOZ5z/6dDcY5jHxHsSxEot47L53H4uoSgsKcWYqfpRim8uneRl9k2H1nP
         a+BMdkMPATvVnqJvvqR+fk9mSQnuC7+pog2XrSmH68JliPz4sCeEDSSsSbAxissA07vS
         rrY4IAHcXUUHNW66H0ZgqZC8vNroQFbHVmT+Fwltdrplj2aam/DnkrfB6AQ25R2eLB1a
         TGAvY/YM6T4wVmT/fpTBd7KAbQXoH63qB9IF6yfj4rlminZOe9AOK1VLKPoMIxCUsQOV
         oQhaZCQVC8GI/qM1OYHPjJjpxJ5E1ZDHzupRSbfr+0tAqH/LO2MKiw/h0CtIicWQ2vyq
         Fujw==
X-Gm-Message-State: AOJu0YwiMG2q+wsliL/Jat18M8XDX0MCYn1IC8TUMSvNOnreRXsTMKol
	VBFedxXBpr/D8ViUXSUcY6GK1GhGPuOw
X-Google-Smtp-Source: AGHT+IGp1aF4ad8GY2mpba0fd5l4BDt2hpoGdpcopL93LR+B2zkK3lS0kW9UdTbiZeLDNdbUYhVVOw==
X-Received: by 2002:a05:600c:a684:b0:40e:3b3f:51eb with SMTP id ip4-20020a05600ca68400b0040e3b3f51ebmr19020wmb.81.1704988652315;
        Thu, 11 Jan 2024 07:57:32 -0800 (PST)
Message-ID: <076d5ca3-90df-46ac-9309-a2a96ffc378d@suse.com>
Date: Thu, 11 Jan 2024 16:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/34] xen/riscv: introduce guest_atomics.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <fdbe7261178d057d9868aacea19c1c2b82d2da16.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <fdbe7261178d057d9868aacea19c1c2b82d2da16.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - update the commit message

There (still) is none - what is the above about?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/guest_atomics.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_RISCV_GUEST_ATOMICS_H
> +#define __ASM_RISCV_GUEST_ATOMICS_H
> +
> +#define guest_testop(name)                                                  \
> +static inline int guest_##name(struct domain *d, int nr, volatile void *p)  \
> +{                                                                           \
> +    (void) d;                                                               \
> +    (void) nr;                                                              \
> +    (void) p;                                                               \

What are these and ...

> +    ASSERT_UNREACHABLE();                                                   \
> +                                                                            \
> +    return 0;                                                               \
> +}
> +
> +#define guest_bitop(name)                                                   \
> +static inline void guest_##name(struct domain *d, int nr, volatile void *p) \
> +{                                                                           \
> +    (void) d;                                                               \
> +    (void) nr;                                                              \
> +    (void) p;                                                               \

... these about? If there's a reason for having them, then (nit) there
are stray blanks.

Jan

