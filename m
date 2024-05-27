Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C258CFBE0
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730638.1135778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVxg-0002Vt-MF; Mon, 27 May 2024 08:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730638.1135778; Mon, 27 May 2024 08:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVxg-0002Sm-JQ; Mon, 27 May 2024 08:44:08 +0000
Received: by outflank-mailman (input) for mailman id 730638;
 Mon, 27 May 2024 08:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBVxf-0002Sg-Tt
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:44:07 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 466a72a3-1c05-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 10:44:05 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52965199234so3262682e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:44:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524b5898sm5531726a12.82.2024.05.27.01.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 01:44:04 -0700 (PDT)
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
X-Inumbo-ID: 466a72a3-1c05-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716799445; x=1717404245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fhmiO0NEDD4yqRoUXsKlv3IeX5bLl/f6Z453pOqPyE=;
        b=E6SUAvhm35qFpRd0VzVjCtYPhhNPf3tCTPreo8Zbp0VyBzPh7YqRESlLWdcsXUQL2t
         SN0/UK+U/qvxdDrw3shWwEqSuaGi2Z59DjGNsvSZZ64ZHPXmApe5H/hd8JMAXN1MSB9s
         M94AoXcWbKoAmG34RdDi42KUned7QYSoYDOu2ukjVshQAM5kEuR2A0MooQNpXNUVIHWq
         IEUoY8KBwMWGa1tQBsgmolOAvIcYtmowwDPsDZSw2T5GYgksIkN0p64vtr3ad3QgqzXs
         dGvGYxMTm5knY+ixD//d9z+twoIp26aE7tRbrpeRguo1EvshSsRX8S1rTwHtXIo4S9mL
         fR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799445; x=1717404245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fhmiO0NEDD4yqRoUXsKlv3IeX5bLl/f6Z453pOqPyE=;
        b=wfHVoOBCJcYHF2H94SYz+Pk7SRysU3PQ+ElxA75H+ZlkSE+ipgcG7VVJ3okX7wdtWU
         iqJo7HuW6yH6PovMEzXVztxIwpOSz64nG3wRGGRep/P93xuQbu8OXh8v4etATi7Js3FU
         2ZCswa/+CPs+LxyDfqRdXVZ509P+GAvaXCgUdnhI4VQ6MRTzQy9VzdNWobfiNPtX8l98
         RTTXFY758AJOWaOYsWzswZ9bLJ9BoH0VNvXa/hSn9zo5QOyG5z8hLAp1WEzeb2h9qcBg
         mj/z6/LokuBT3pv5+vau0asCwh2A5lbs/xnSroYZTWjetUabHkuf38Ore4ZoAOrAtD4L
         okjw==
X-Forwarded-Encrypted: i=1; AJvYcCXnsjN/7pb6E/3CdIZ1RBsEDs7gsjcr20MDJt/jtsAJaZJydM6sa+cOGT+hIS/2JNt5VjdxhIMGlQ3DyK0PgiXhen5vWLZCqq36TZlOOnA=
X-Gm-Message-State: AOJu0YwKohQMcvvT2zI4Vypw7UboDY9b/rTIyAeZJePb0RiFadr/u0y0
	19SsNzlh9JEkiaW9F+l06xkkEdOde7LwtF1WVTfa2idERUQ84DsVLLl8DNPhlw==
X-Google-Smtp-Source: AGHT+IH+nnLt1sRnNaTWLZ1/9FmTTIN1KqF58OD6bQp7YgaCJuthf9zdpVTjWqJGXRNFSjOCdt/lzQ==
X-Received: by 2002:a05:6512:21e:b0:51a:d5d3:ee52 with SMTP id 2adb3069b0e04-529649c5eb2mr5492525e87.17.1716799444791;
        Mon, 27 May 2024 01:44:04 -0700 (PDT)
Message-ID: <7305a8b9-5f43-47e4-987b-c5ca76bcc312@suse.com>
Date: Mon, 27 May 2024 10:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] xen/bitops: Implement generic_f?sl() in lib/
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> generic_f?s() being static inline is the cause of lots of the complexity
> between the common and arch-specific bitops.h
> 
> They appear to be static inline for constant-folding reasons (ARM uses them
> for this), but there are better ways to achieve the same effect.
> 
> It is presumptuous that an unrolled binary search is the right algorithm to
> use on all microarchitectures.  Indeed, it's not for the eventual users, but
> that can be addressed at a later point.
> 
> It is also nonsense to implement the int form as the base primitive and
> construct the long form from 2x int in 64-bit builds, when it's just one extra
> step to operate at the native register width.
> 
> Therefore, implement generic_f?sl() in lib/.  They're not actually needed in
> x86/ARM/PPC by the end of the cleanup (i.e. the functions will be dropped by
> the linker), and they're only expected be needed by RISC-V on hardware which
> lacks the Zbb extension.
> 
> Implement generic_fls() in terms of generic_flsl() for now, but this will be
> cleaned up in due course.
> 
> Provide basic runtime testing using __constructor inside the lib/ file.  This
> is important, as it means testing runs if and only if generic_f?sl() are used
> elsewhere in Xen.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a suggestion and a question.

> I suspect we want to swap CONFIG_DEBUG for CONFIG_BOOT_UNIT_TESTS in due
> course.  These ought to be able to be used in a release build too.

+1

> --- /dev/null
> +++ b/xen/lib/generic-ffsl.c
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/bitops.h>
> +#include <xen/boot-check.h>
> +#include <xen/init.h>
> +
> +unsigned int generic_ffsl(unsigned long x)
> +{
> +    unsigned int r = 1;
> +
> +    if ( !x )
> +        return 0;
> +
> +#if BITS_PER_LONG > 32

To be future-proof, perhaps ahead of this

#if BITS_PER_LONG > 64
# error "..."
#endif

or a functionally similar BUILD_BUG_ON()?

> --- /dev/null
> +++ b/xen/lib/generic-flsl.c
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/bitops.h>
> +#include <xen/boot-check.h>
> +#include <xen/init.h>
> +
> +/* Mask of type UL with the upper x bits set. */
> +#define UPPER_MASK(x) (~0UL << (BITS_PER_LONG - (x)))
> +
> +unsigned int generic_flsl(unsigned long x)
> +{
> +    unsigned int r = BITS_PER_LONG;
> +
> +    if ( !x )
> +        return 0;
> +
> +#if BITS_PER_LONG > 32
> +    if ( !(x & UPPER_MASK(32)) )
> +    {
> +        x <<= 32;
> +        r -= 32;
> +    }
> +#endif
> +    if ( !(x & UPPER_MASK(16)) )
> +    {
> +        x <<= 16;
> +        r -= 16;
> +    }
> +    if ( !(x & UPPER_MASK(8)) )
> +    {
> +        x <<= 8;
> +        r -= 8;
> +    }
> +    if ( !(x & UPPER_MASK(4)) )
> +    {
> +        x <<= 4;
> +        r -= 4;
> +    }
> +    if ( !(x & UPPER_MASK(2)) )
> +    {
> +        x <<= 2;
> +        r -= 2;
> +    }
> +    if ( !(x & UPPER_MASK(1)) )
> +    {
> +        x <<= 1;
> +        r -= 1;
> +    }
> +
> +    return r;
> +}

While, as you say, the expectation is for this code to not commonly come
into actual use, I still find the algorithm a little inefficient in terms
of the constants used, specifically considering how they would need
instantiating in resulting assembly. It may be that Arm's fancy constant-
move insns can actually efficiently synthesize them, but I think on most
other architectures it would be more efficient (and presumably no less
efficient on Arm) to shift the "remaining" value right, thus allowing for
successively smaller (and hence easier to instantiate) constants to be
used.

Jan

