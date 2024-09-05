Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624A196DE76
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791190.1200994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEWX-00028s-Sf; Thu, 05 Sep 2024 15:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791190.1200994; Thu, 05 Sep 2024 15:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEWX-000275-Ph; Thu, 05 Sep 2024 15:35:53 +0000
Received: by outflank-mailman (input) for mailman id 791190;
 Thu, 05 Sep 2024 15:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEWW-00026z-VI
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:35:52 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f32840-6b9c-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 17:35:49 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso66630466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:35:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62081fecsm149379866b.91.2024.09.05.08.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:35:48 -0700 (PDT)
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
X-Inumbo-ID: 86f32840-6b9c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725550549; x=1726155349; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TtNkpJx59BsFYjf5eah5BzTuaa+e5KnQM/YS7Bh2CtY=;
        b=S4G6CaISGMzzMkxROv3jIjfuMrg7uyapnvfrOOqfLlrw7v5ATXD/3CNchVFjSgU85N
         3E+42kr5GY+isAEArjUJOQvaSOBfdgDMrYsCmBEhmupeqCpCzfjEFJgocsxdh5uLBmTK
         I1RcIh7F17OAvzFNUBJzE1/0b5B0TUo9iiqipVCNnvHBo+vKIaY4HZc02ogzqXtN7L07
         7M+3p42d/HZcxe8bndRUc99bt4IM71Qqeggwi+NSP5EeXGC4R9agzBRjuo1ChdPYsVZN
         pitA048ZqwXgW6wPYf7WiXc8cC23I2JpbkSd/uXdO3L6eDRzvOKzi0W9kEx5qIchgSTb
         Kb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550549; x=1726155349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtNkpJx59BsFYjf5eah5BzTuaa+e5KnQM/YS7Bh2CtY=;
        b=dKZexEte83glQi0gaJ9aj5IFCFAPMbBOtc5X+IzfGs9dhdOjuLTtylDZJBWqFTB6vm
         HdaKGYE5gY7hPlDr1fOyEmJ+81nUmvZCidM/0/jLcQO3jzDz9EH+thVm05cyDiWMRi6w
         SYFA3TPSwlNDO9vxnzXKHMjhM/L1VynONL9PH3Ft3TcTaKp4mz51UX16yn3vOhxh8JvO
         sJWcQ8fgSu6wUC0rzV+xnsMrqdG6RjmtFu87xD68Eq26MxyRRbvMlgw/q0SrsXspkuqU
         CKbDBdlvj6uWChbiRJabmMgqtTVUsNKXjlOjYPhz0dO/y455bag9CglX54JsoVh2vgD0
         NFbg==
X-Forwarded-Encrypted: i=1; AJvYcCU0vcH3o5y7TdYNEfs+ez4VIONfocK2w2sDf+M3T6IqooD7lUhhIfxoXouMo9Y+GHf4moilM7mg2zk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzQtwx4XQYhU3z+koBKTjmsTwMeLvUYWkknV3Eym94rbQwxMR5
	dBVwEUoi/eK3f2hKu2S7tsCtKFIA7elDb5ViiR4x01VbgOjJ+xVQCYP8ljmmrA==
X-Google-Smtp-Source: AGHT+IEwIjiBj2VdJ8p2x4c78KVor6cMhcUyltBNKLmF5L4a4qxVkQS6/aRU7IzDPmYnLP6T1VMwVw==
X-Received: by 2002:a17:907:2cc7:b0:a86:9ac9:f3ff with SMTP id a640c23a62f3a-a8a1d2c989amr956237866b.26.1725550548901;
        Thu, 05 Sep 2024 08:35:48 -0700 (PDT)
Message-ID: <e54436a9-10a9-4a43-a9aa-72e5e5ceb17e@suse.com>
Date: Thu, 5 Sep 2024 17:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/trampoline: Move the trampoline declarations out
 of <asm/config.h>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905130657.4075906-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 15:06, Andrew Cooper wrote:
> asm/config.h is included in every translation unit (via xen/config.h), while
> only a handful of functions actually interact with the trampoline.
> 
> Move the infrastructure into its own header, and take the opportunity to
> document everything.
> 
> Also change trampoline_realmode_entry() and wakeup_start() to be nocall
> functions, rather than char arrays.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/trampoline.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef XEN_ASM_TRAMPOLINE_H
> +#define XEN_ASM_TRAMPOLINE_H

Not exactly usual a guard name, but once the new naming scheme is finalized
most will need renaming anyway.

> +/*
> + * Calculate the physical address of a symbol in the trampoline.
> + *
> + * Should only be used on symbols declared later in this header.  Specifying
> + * other symbols will compile but malfunction when used, as will using this
> + * helper before the trampoline is placed.
> + */

As to the last point made - we could of course overcome this by setting
trampoline_phys to a suitable value initially, and only to its low-mem
value once the trampoline was moved there.

As to compiling but malfunctioning - I'd kind of expect relocation
overflows to be flagged by the linker.

Jan

