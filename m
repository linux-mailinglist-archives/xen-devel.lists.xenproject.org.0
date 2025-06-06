Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80756ACFD42
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007987.1387193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNREM-00069e-Ms; Fri, 06 Jun 2025 07:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007987.1387193; Fri, 06 Jun 2025 07:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNREM-00066p-Jf; Fri, 06 Jun 2025 07:11:10 +0000
Received: by outflank-mailman (input) for mailman id 1007987;
 Fri, 06 Jun 2025 07:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uNREL-00066f-2l
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:11:09 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 698dbd2f-42a5-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:11:05 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so1393066f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:11:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236032fccd6sm6400785ad.134.2025.06.06.00.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 00:11:05 -0700 (PDT)
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
X-Inumbo-ID: 698dbd2f-42a5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749193865; x=1749798665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XLz9ZFSK9NlzDWp/ZMK6ZIDBrWw+SmS1Bo2uzbLLy+8=;
        b=Wi+IdzljW91jzgD83cbWQDRrRJzV0qspo1enbysEo9BqpvpOcyqpqBmJuQFhHUwcpQ
         xufAZyZ9AakYWeVFzahwkHLa5Ai3RjPE6XfFyC1mOHi7y9mrRZxoaWBh7J3IX92uxEKo
         LXriOcU+cuiBjDncAtNOKTGLlpUkEGy3EC2pBIQyLOFkcEjBSH2rurPXeotEUyAx3W0/
         j1bWQYalO4POKAnpE6iOyP2j8lQYcjvIRWgoJ+vi9udZA+1PCdDy5TFZE1IFzxLZTwxg
         3jQ/AiGKTLNhaJ4d8uL7l+giEXOKf8K9mdrVk+c6RAVqNnTA6t1KSpDtBH4Secs63fLC
         9siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749193865; x=1749798665;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLz9ZFSK9NlzDWp/ZMK6ZIDBrWw+SmS1Bo2uzbLLy+8=;
        b=iEvT2hmV6zzVq3K2Ju6PbddOMbHAzpPox3oZfR/vV/JE8FP56NVU6Y4TiimIF43PyV
         ezFDgf68OHHoXql6X3N4IwSRCCjgYGpKGUAqd/aJXNvcOt85CAYMTjOyYxbwVSPX713y
         ws1a0UJwwbh0beNcou0yJGhb1XkRyOEZr8umTJfi8nm2edMaEJKDrrE6NW3U+fa5dn6R
         0VKeXOIKJPM+9C94JkTh+vkrCcjHLObpobLh+w8iZ8SwuUciUbCo7WRYGU+o4UoUB9F3
         wenJqK3wFR585Up6IMwDhkAJnJ5YoR8oOELwEMkOP1kB8rn9ZG05jBjiFDxmgYdVashK
         b0kw==
X-Forwarded-Encrypted: i=1; AJvYcCWkSxMXuReFSGY+HkkV+v3cIfATlvMgdhlO68ygpROaMR0mUb41fHO6MOJ9Ik3rVxAI78LSQfmpw8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziuQBows2sSmzSHyDfOtCBtjdHBdpllwl4fTK/hB1fxnWE6o1q
	QxgwQ4w4kcKX9Aby2P09bQtooTyL0AZIUMMkroKGOGvDeMxhmhFMzizId1DmYjPcFg==
X-Gm-Gg: ASbGncsZ8iT62DG89mjmx/f6kyZc9NbWZEtRaFMiGmTkxHeSbP8bTBF8/W8UWFFvi4z
	YUY5LXkvqTx8n20TikLTzhC4fSgxicAgQ91jLXun4sj5cWsPvMrOKKBEgiStVKfwZmJSpaQyw6v
	tCxG0lNMfrEEiqOQ7XDYo7f8UNeZSU2Eff5fE4VQdVXvQsxykDQxqVRd9r87wQxUr5y4XODihOD
	6fhSafG8/dZYMwsDlQWU8j1deaqMuKK3tY7AZeQTzgL1coPDeEyBlmZVBYUrPcNyNVStKxjhOWw
	TG30xtdTFzVfNCbo+luHdLn6w8MgvhnkyMpUGe08lRvMn/IktEfpJlThzaK+2Uu92YqQjEudL61
	AZRG6qvVKCCG1+QmA33HOZ8wSBY3MVaW03E18
X-Google-Smtp-Source: AGHT+IFA5Bsb3yQaWX91X+X3j17QthABBwaBUxjr0ZPHXIqvLoWbgVly3JN5LWLUCCWKu6S02IyXZQ==
X-Received: by 2002:a5d:4e85:0:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a53517ded1mr525184f8f.35.1749193865517;
        Fri, 06 Jun 2025 00:11:05 -0700 (PDT)
Message-ID: <fdb16e59-83d1-421b-813a-9747f6c1e4f8@suse.com>
Date: Fri, 6 Jun 2025 09:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: add header guards to generated asm generic
 headers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2506051708100.2495561@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506051708100.2495561@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 02:08, Stefano Stabellini wrote:
> MISRA D4.10 requires to have proper header guards in place in all header
> files. Add header guards for generated asm generic headers as well.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit, as mentioned elsewhere, preferably with ...

> --- a/xen/scripts/Makefile.asm-generic
> +++ b/xen/scripts/Makefile.asm-generic
> @@ -32,7 +32,14 @@ old-headers := $(wildcard $(obj)/*.h)
>  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
>  
>  quiet_cmd_wrap = WRAP    $@
> -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> +      cmd_wrap = \
> +	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z A-Z); \
> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
> +	printf "\#ifndef $${arch}_GENERIC_$${upper}\n" > $@.new; \
> +	printf "\#define $${arch}_GENERIC_$${upper}\n" >> $@.new; \
> +	printf "\#include <asm-generic/$*.h>\n" >> $@.new; \
> +	printf "\#endif /* $${arch}_GENERIC_$${upper} */\n" >> $@.new; \
> +	mv -f $@.new $@
>  
>  quiet_cmd_remove = REMOVE  $(unwanted)
>        cmd_remove = rm -f $(unwanted)

... echo instead of printf (and then respective adjustments to the strings), if
that's technically possible.

Jan

