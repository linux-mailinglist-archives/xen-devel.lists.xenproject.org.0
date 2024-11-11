Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549FD9C3AC8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:23:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833418.1248564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQdX-0000DC-ON; Mon, 11 Nov 2024 09:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833418.1248564; Mon, 11 Nov 2024 09:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQdX-0000Ai-Lj; Mon, 11 Nov 2024 09:23:07 +0000
Received: by outflank-mailman (input) for mailman id 833418;
 Mon, 11 Nov 2024 09:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQdW-0000Ac-El
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:23:06 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0847fb-a00e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:23:01 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d70df0b1aso2651858f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:23:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381edc1104asm12585185f8f.88.2024.11.11.01.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:23:00 -0800 (PST)
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
X-Inumbo-ID: 8c0847fb-a00e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhjMDg0N2ZiLWEwMGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE2OTgxLjMyODE0NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731316981; x=1731921781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HWLnYUCttsC6XlffBNQz7o6QOiQ8yovhcb9yUdyZx8g=;
        b=Wkonvy4NR6s2YPUccMeqKEwBgX3ylW8MPnTfumuHBpzS5Is4x9PTN0vcGu/omiBRWC
         OWoX6YQ2ZWiRetoHnUyxsE3NAgRpTDTa2Wr/m75KeZixBbxbm4Ptvypf41xpU6NEO+YL
         o31FobM3sfYgfe84TBSD3fPiYI3uoHFD04AAkiqjvch0qafBgx0MvFqv6ABrJ1dVKzme
         WkV5/fFzYWFWYQyUaZ03i/w6ajvO9A9duSiu9dwnx2UmkhKpV2QPFVBCK1E4xxB2DSN3
         gYWw6c8h80AGKMTO7qVqRrV7ayPG8fqCDIBYCCaxz6KEa31e+NgRuTWku9DlctGDqzaE
         SFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316981; x=1731921781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWLnYUCttsC6XlffBNQz7o6QOiQ8yovhcb9yUdyZx8g=;
        b=Y3GFZsIDDdIPmqkQ3a+BSXYxJjkTh+k3CHhhKkDlHnhiNriTeWTZ22trzLaLtLRC9b
         Kkkjh9ZsDaxkpsS8EctAYx7O23VmGPiTyVLLZpEriZTWBUJIgh5fYOFNQIt9Jyb1a+SY
         Yw966umleR68VRqMPDZ6EhZ6NUaO6RmE/wCz6cv9QP6y7GoVpjAnB5bxugSEpspWpCTv
         6giuDLrvnqQ7n3DmwqcKRRXSFOMun9j6gyJkW/cqGM6Cxk9aUfb/3vuo5Fh9rfFg42r8
         QaOJVlZ+t8V/fdXivW0HSbzm02Zdatvz/QAjk6YVh0UXbwH9JB7/gqxQlbsUGq7UHuCP
         rCvw==
X-Forwarded-Encrypted: i=1; AJvYcCVmnq1QHmmWwBPoqvzw7AYJ8xwd7VLF6H3bA5QINU95mNmhLytgZjdRbMeKSw+9u+4brQkLFwsG90o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvPRseUg4SrDoQ4bci+Af397RVGFthhHDdNZUmMc3nnb8AIU/G
	1ovQY+Ga5Gt6hrv4oROJrIN47nopIy8Vzrj6cDgiphuOPD6ERaoEGnhhpazRU8QPwr2R74k9kGE
	=
X-Google-Smtp-Source: AGHT+IEZ2ppU+lDu1+H2GgxGLTMoG/OwqeRknrVab6k5RLRHhTM1jL0bIA4a8A7QYv5/avsNEZax2g==
X-Received: by 2002:a05:6000:18a7:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-381f18672fdmr9022375f8f.10.1731316980656;
        Mon, 11 Nov 2024 01:23:00 -0800 (PST)
Message-ID: <f7515b69-f92b-4508-8859-e23c28b735ba@suse.com>
Date: Mon, 11 Nov 2024 10:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: Drop mach_mpspec.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
 <20241108201147.812036-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108201147.812036-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 21:11, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/mach-default/mach_mpspec.h
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#ifndef __ASM_MACH_MPSPEC_H
> -#define __ASM_MACH_MPSPEC_H
> -
> -#define MAX_IRQ_SOURCES 256
> -
> -/* Generic (i.e. installer) kernels need lots of bus entries. */
> -/* Maximum 256 PCI busses, plus 1 ISA bus in each of 4 cabinets. */

This (presumably obsolete, but still) reasoning is entirely lost ...

> -#define MAX_MP_BUSSES 260
> -
> -#endif /* __ASM_MACH_MPSPEC_H */
> --- a/xen/arch/x86/include/asm/mpspec.h
> +++ b/xen/arch/x86/include/asm/mpspec.h
> @@ -3,7 +3,9 @@
>  
>  #include <xen/cpumask.h>
>  #include <asm/mpspec_def.h>
> -#include <mach_mpspec.h>
> +
> +#define MAX_IRQ_SOURCES 256
> +#define MAX_MP_BUSSES 260

... for why it's 260 here. Imo the value either wants lowering to 256
(for there hardly being anything ISAish in 64-bit systems), or at least
that half of the comment retaining.

Jan

