Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AA9C3AA1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:14:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833393.1248534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQUk-0005b9-E6; Mon, 11 Nov 2024 09:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833393.1248534; Mon, 11 Nov 2024 09:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQUk-0005ZJ-BJ; Mon, 11 Nov 2024 09:14:02 +0000
Received: by outflank-mailman (input) for mailman id 833393;
 Mon, 11 Nov 2024 09:14:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQUj-0005ZD-8H
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:14:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 480326ef-a00d-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:13:57 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d4fd00574so2315363f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:13:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05302e1sm167290405e9.9.2024.11.11.01.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:13:56 -0800 (PST)
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
X-Inumbo-ID: 480326ef-a00d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ4MDMyNmVmLWEwMGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE2NDM3LjczMzU0Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731316437; x=1731921237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=38DWQL5wqxlyLSmjlt3lXIFA8dqTrjHt8Hc5DcGqq1k=;
        b=D8IKWZ8fK8Y8FJIIFQYeF0ALSBgBuZmhQgzCjG+zw4O8ZY8zZPkO6bm0G/GMLGdGve
         Sl8vJtOXrwP22HADckRZx8h++W4p/wuCjcFjS5wixZKEJI9itotC9KMRMyMfX7lBiKGx
         PdT3vkbs7eikSOx+IQxuHIvmR2kJJbk+V3f5h3pBVNcWifdUcQpSjfOJiGgZU6io/Q87
         23talBII+xVarolHYUPdQvY10JtYMcLNfeqe/SODgGdCkAf5vegriLrUUpIWnXueHEqv
         ZOIokwU631hkKemWQFM3nKlD9SMcGo1nCVSomYdwSh6ZAU5KwId4V6laDWKlYRmU4NwH
         xhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316437; x=1731921237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38DWQL5wqxlyLSmjlt3lXIFA8dqTrjHt8Hc5DcGqq1k=;
        b=QIUtLaHU/htlQDcXJKS0Wc4sqM4ZTX2cLOn5vI3STjdcTpNUveV2U2FvKH3vf7gKmP
         Vg3OIInqcpXBaaO53yMSzPaR4QcHgJZz0Ltv/omrLqcfK6QvfG9uNb14g2UklGtUDKh8
         RZrt1/0tc/kcsxjmMQq93aE8jASyCRSMFQekRDlSCBUDiXvBoaz8uTfdsSF484yow73I
         OJUS1K5T5g3AnZkWqz3b1GV1gwonScyuVEIerhf6jxyC3Y4/8bbBHgxt4ACuqZveQFTd
         85IqEIKAOha2iabfSibHuzh4olo2T8aK3FLUdAx6F1fl6jnCm9W1MQ4QFtDuT9muL+ti
         PrtA==
X-Forwarded-Encrypted: i=1; AJvYcCUcS7hhRQaV8toqQ4IKFWiH8xJrjqPQJ/zpN9kvBdlhx07s1bNYXqg1e0Tm6jBcx4F5dSn7rOQrw88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwA67lzSmEeWq/ZuwnyMMRaOgbl/NRvCNTl3qSTg3BS1gF75GDZ
	ngAMOvyDHMGjKP72IybpDw+dvRBs+6oFyFr+fdAFObhK1BOP4vKrSkcn4VrX3dcnNGMAcH/U1CA
	=
X-Google-Smtp-Source: AGHT+IFYStWMMNsvsIzb44GqovH7VaAfKPsVWzfW9lEjzLAEy/iihNadEjYn7NCiX2llfpkeisqzqA==
X-Received: by 2002:a05:6000:402c:b0:374:c1ea:2d40 with SMTP id ffacd0b85a97d-381f0f40d9cmr9954928f8f.1.1731316437132;
        Mon, 11 Nov 2024 01:13:57 -0800 (PST)
Message-ID: <aab4e7e6-1dce-4f6d-a135-f79dc5a3f2b9@suse.com>
Date: Mon, 11 Nov 2024 10:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] x86: Delete mach_apic.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
 <20241108195820.789716-11-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108195820.789716-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 20:58, Andrew Cooper wrote:
> All useful content has been moved elsewhere.
> 
> Clean up the dregs, and remove the entire mach-generic include path.

What's "dregs" here?

> --- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -#ifndef __ASM_MACH_APIC_H
> -#define __ASM_MACH_APIC_H
> -
> -#include <asm/apic.h>
> -#include <asm/io_apic.h>
> -#include <asm/genapic.h>
> -#include <asm/smp.h>
> -
> -static inline void enable_apic_mode(void)
> -{
> -	/* Not needed for modern ES7000 which boot in Virtual Wire mode. */
> -	/*es7000_sw_apic();*/
> -}
> -
> -#define apicid_to_node(apicid) ((int)apicid_to_node[(u32)apicid])
> -
> -extern u32 bios_cpu_apicid[];

For these two, isn't there some Misra aspect? They're both unused, and Misra
generally dislikes unused stuff. Whereas ...

> -static inline int multi_timer_check(int apic, int irq)
> -{
> -	return 0;
> -}

... this and the other inline function further up clearly have their sole
users removed here, so are fine without any further text in the description.

Preferably with the description amended / clarified:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

