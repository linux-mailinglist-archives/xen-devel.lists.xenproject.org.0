Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E4297EDF6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802150.1212312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskoa-0005zC-TH; Mon, 23 Sep 2024 15:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802150.1212312; Mon, 23 Sep 2024 15:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sskoa-0005wc-Q1; Mon, 23 Sep 2024 15:17:28 +0000
Received: by outflank-mailman (input) for mailman id 802150;
 Mon, 23 Sep 2024 15:17:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sskoZ-0005wW-Qm
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:17:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f050c342-79be-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:17:25 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-378c16a4d3eso4862842f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:17:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096aa2sm1245327766b.35.2024.09.23.08.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 08:17:24 -0700 (PDT)
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
X-Inumbo-ID: f050c342-79be-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727104645; x=1727709445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pT4QaiZQssWI/mjRQvj6hOqRE18/VQw+5W4fMZfKXt0=;
        b=BMUeEPbMUH6wZA5i288f4a2TplH49SyxYCl55R+M/prZNfHxmaqU8FRt6dkNiX7vdS
         GRXU/LWqam0BJhSWhVmDlfLCr1GZh3zBKi+ASQnbSLynsUyQ8+5K0iYMaauSlGWGqt7W
         pInFr8OmBmLb1aXqVEfWnjVXf61hG1XBTnbzuFH7/HfHu1L55VOWQSkTBtHY1yd/v98M
         UJMFw7v7KDuHwM+YIBLL0ocdTjebTxzqT1sIoQIRaOZlGi53IcfqcneN0LoIO1TM/wEV
         NBFSP5Pwa4R9nkn+Co3SxdwLbMbSfQHQzaONbI+VAPhHz/GBz0k/SQCKu3GIgXzGT74R
         56xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727104645; x=1727709445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT4QaiZQssWI/mjRQvj6hOqRE18/VQw+5W4fMZfKXt0=;
        b=QqQ5hbEq3RfmoeLqKWzgqiXh037EYOwIL/5LElPytIQ7+SisRQy6NBm41PDZrKHoGd
         8giyrS+95tD1KRfE01ebFZBxZGYGgEnqmTYW3g7RIKKkKYjY+Pa5D+tq6WT5RzghWx/i
         80JkvJKrctzG96E1c1jGYuAGQnYFd433JKFsvbmeJS4gyiJfVvLbQ44BYj1lgMtpBMVV
         WGVdXxkHyyd0KVcpp4enxaL7OEyN36WUyEKstoeJddC8lroIhKlKnalN3+qmYPLlDIdI
         tRKPKXrW55/9gV3yjDqqGtzMZ42XTKPxzY8+Xh+q50boL12NG7TwQlXsn9qPjewENFwv
         LswQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSdeW9DeRD3FnKF8aKZJNoCdBLA4hiJrlu5AoEXjcmAK409hDqtfJZhRdEVuoCmsW9MbKIIvLjtns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWp4LwJTH+UXpQzg3UskWSGAHY2UTKe1XWwotEm1PQV8Hrk2pJ
	knyTBJYtrcvouybUb9tbSliH+Bfh2MiQSYU+ebILxs9UWUrJPrlKN3r22Fqrog==
X-Google-Smtp-Source: AGHT+IEuRdd//+4hwfSPaLATtF2hm2YXJQoklqjD6AvJEFR8A/ML67mp8jhtci/alOfMT1TLlN2S3g==
X-Received: by 2002:a5d:6a49:0:b0:378:81aa:2653 with SMTP id ffacd0b85a97d-37a422533a8mr10090089f8f.9.1727104644952;
        Mon, 23 Sep 2024 08:17:24 -0700 (PDT)
Message-ID: <47fc5e0d-e249-4e69-b19d-bb2c4edd1abd@suse.com>
Date: Mon, 23 Sep 2024 17:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86: Put trampoline in separate .init.trampoline
 section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240919080021.20155-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.09.2024 10:00, Frediano Ziglio wrote:
> This change put the trampoline in a separate, not executable section.
> The trampoline contains a mix of code and data (data which
> is modified from C code during early start so must be writable).
> This is in preparation for W^X patch in order to satisfy UEFI CA
> memory mitigation requirements.
> At the moment .init.text and .init.data in EFI mode are put together
> so they will be in the same final section as before this patch.
> Putting in a separate section (even in final executables) allows
> to easily disassembly that section. As we need to have a writable
> section and as we can't have code and data together to satisfy W^X
> requirement we need to have a data section. However tools like objdump
> by default do not disassemble data sections. Forcing disassembly of
> data sections would result in a very large output and possibly crash
> of tools. Putting in a separate section allows to selectively
> disassemble that part of code using a command like
> 
>     objdump -m i386 -j .init.trampoline -d xen-syms

For xen.efi it won't be quite as neat. One of the reason all .init.*
are folded into a single section there is that the longer section names
aren't properly represented, because of the linker apparently preferring
to truncate them instead of using the "long section names" extension. To
disassemble there one will need to remember to use "-j .init.tr". I'll
have to check if there's a linker option we fail to enable, but in the
absence of that we may want to consider to name the output section just
".trampoline" there, abbreviating to ".trampol" (i.e. at least a little
more descriptive).

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -882,8 +882,9 @@ cmdline_parse_early:
>  reloc:
>          .incbin "reloc.bin"
>  
> +#include "x86_64.S"
> +
> +        .section .init.trampoline, "aw", @progbits

I think the lack of x here requires a comment.

Also did I miss any reply by you to Andrew's suggestion to move the
trampoline to its own translation unit?

Jan

