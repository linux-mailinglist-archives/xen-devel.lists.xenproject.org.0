Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA8B37CF3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 10:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095686.1450599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBBq-0003HW-9w; Wed, 27 Aug 2025 08:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095686.1450599; Wed, 27 Aug 2025 08:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBBq-0003Fg-6v; Wed, 27 Aug 2025 08:07:30 +0000
Received: by outflank-mailman (input) for mailman id 1095686;
 Wed, 27 Aug 2025 08:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urBBp-0003FR-F9
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 08:07:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc80a1d-831c-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 10:07:28 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso896387366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 01:07:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe9c908414sm377451066b.97.2025.08.27.01.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 01:07:27 -0700 (PDT)
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
X-Inumbo-ID: dfc80a1d-831c-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756282048; x=1756886848; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+kla684A/tyInoa6A1iERRJr90N/NnwDl2EeOUgOAMI=;
        b=WvGDa8qjO5A1g7J4AR3cTQViQCAZXdsmDsn53GAwN1cgzdr6rukOybmW05KDySYF1c
         1+/9rp/wPyY8eJ9lgLK3Lvp5M0at4lpwQEv+uotBRkgww6DotE3q/zUIgj2o735mIyFJ
         y+djAIOku7M4OkkB77rogf0GPI3QhsAnFlfCQxASInhBsgubFdiZwbxEufL7px3jAMZ5
         +MCVyh5JQHsnCWcOgVHT3S+xuj1kLZZQv+l87nGn8SvebpjPlMCIz2yvhogoKimoha2t
         pBhUuS4I4aghr1ruk8I/jqSOLpr7kYOYbGb+fOBHf1OWZBjYKw6+8hJyOQtFsqaSkcKd
         ceJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282048; x=1756886848;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kla684A/tyInoa6A1iERRJr90N/NnwDl2EeOUgOAMI=;
        b=SVxlX2UQYV1aRA+mGgKvXCejOfUci1MiTVvTcKDphSWfbh8f/oiJCPoFZE0eh9DVC0
         PDIhWuiSYqq78boks/O3taPKcfQ+TST0WbB4p0PAYLW+Bb44ylXDYQHy++L2Uj/DALo/
         jT025jWZ1yneC5nfzgiWlaU/DKYWGqHo9Amx14GLOU403DFBdZGBsKH5ooTOGh37tw0x
         +DkW/W+V53uf/q2JzvytSYUn0iLb+DoHzLJN8wwPDisP3PQpDJroYBXnoUBP8oZVaRg5
         QKiUgXRTYpb+54gwg0zSLlPJjD6ENeFw60QZvnRAMHRpyxSOmD2i3x4ux9f5yvbCe7Ww
         R83w==
X-Forwarded-Encrypted: i=1; AJvYcCVb/3/krOLN2zlc2vO1XvHv/QN/3J5Nacubg6SzGUQN3hY+aRAlErQ338HNdSv1LKjfp635F3uLuTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAAhxXLLXzzM5ml2JqcyXJUDgzJzImyOv6/65m63elXnkQRsNp
	ASh+9YQDdq77ObWZJ1okrlKakg7OsE9qDw6moslGnOHSJCNkp8EfwbqzYWMH8bUCSA==
X-Gm-Gg: ASbGnctwXnhZkDL3RIajz9nyzIpKme+LIMH6bPRG1Zi1G8Et0SeX5oPMD2oxfjojFsx
	n5G9fSmlPdZHrAo3R6nVJnpbDQYzBeDFiCzTbWqcue0OKzeNX4ni/6XptHT2q6aSVMIxSK0xtws
	YbIkaZopIG2s5PAzAdHD1xq5nQhr31rpFosQwXKy3R2YiYM4ERFD1xnBGAiizf/HDNlyK6j9k0N
	3q7QFT+QgkNkB0tS++Fo1i29uvpim5QKwXOx0tYtSZg7hBxB/0LWyhtpxGNSxvtz++HJH6TI3e4
	B7lfCcpbNrJeoWGnwM1+BNYfMb7Q5pnH/SZzqZweFD6zBAx3uuq4DOHhVxNj71+ercl4rHRylY5
	HvVxSL60hmgZUyBhCPbVD8vwicCxYfqbEuhPgorqUCXer7/w7a8h1mp6j1siOewAoYxCY5HVGke
	k6OYCCSr2cjwYucimE8A==
X-Google-Smtp-Source: AGHT+IHydO1abMKcIYCocZjbHUK8lfaFMfocNR5yfuL5vNsdliwz/DUI3XcuSRcMpBhwxyfHpuQbbw==
X-Received: by 2002:a17:907:720f:b0:afe:b9e3:2a19 with SMTP id a640c23a62f3a-afeb9e337a9mr249184066b.19.1756282048025;
        Wed, 27 Aug 2025 01:07:28 -0700 (PDT)
Message-ID: <dadb4612-15ad-4e67-90fb-7df0067ec95e@suse.com>
Date: Wed, 27 Aug 2025 10:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/vhpet: Add option to always fire hpet timer on
 resume
To: Vyacheslav Legoshin <vyacheslav.legoshin@yandex.ru>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru>
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
In-Reply-To: <faa5eee741a772eba95415ca26f0cdf304486fc3.1756272466.git.vyacheslav.legoshin@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2025 08:01, Vyacheslav Legoshin wrote:
> The following issue was observed on Windows 10 21H2 x64+: when the domain state
> is saved while all cores are executing the 'halt' instruction, and the memory
> save takes a relatively long time (tens of seconds), the HPET counter may
> overflow as follows:
> counter  = 11243f3e4a
> comparator = 910cb70f
> 
> In such cases, the fix implemented in commit
> b144cf45d50b603c2909fc32c6abf7359f86f1aa does not work (because the 'diff' is
> not negative), resulting in the guest VM becoming unresponsive for
> approximately 30 seconds.
> 
> This patch adds an option to always adjust the HPET timer to fire immediately
> after restore.

Thanks for the patch, but issues already start here: There's no Signed-off-by:.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1461,6 +1461,15 @@ HPET can be disabled by specifying `hpet=0`.
>  
>  Deprecated alternative of `hpet=broadcast`.
>  
> +### hpet_drift_fix (x86)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Always set HPET timer to fire immediately after domain restore.
> +This option can be used to fix unresponsive snapshots with modern x64 Windows
> +systems (21H2+) which use non-periodic timers.

I'm not convinced making this a global option is appropriate. If an option is
needed, it would better be a per-domain setting. Whether an option is needed
in the first place is tbd.

And then, if a global option was used, then please with dashes in favor of
underscores in its name.

> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -11,6 +11,7 @@
>  #include <asm/current.h>
>  #include <asm/hpet.h>
>  #include <asm/mc146818rtc.h>
> +#include <xen/param.h>
>  #include <xen/sched.h>
>  #include <xen/event.h>
>  #include <xen/trace.h>
> @@ -222,6 +223,9 @@ static void cf_check hpet_timer_fired(struct vcpu *v, void *data)
>   * 1/(2^10) second, namely, 0.9765625 milliseconds */
>  #define  HPET_TINY_TIME_SPAN  ((h->stime_freq >> 10) / STIME_PER_HPET_TICK)
>  
> +bool hpet_drift_fix;

static and __ro_after_init.

> @@ -268,11 +272,18 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>       * are restoring after migrate, treat any wrap as past since the value
>       * is unlikely to be 'small'.
>       */
> -    if ( (int64_t)diff < 0 )
> -        diff = (timer_is_32bit(h, tn) &&
> -                vhpet_domain(h)->creation_finished &&
> -                (-diff > HPET_TINY_TIME_SPAN))
> -            ? (uint32_t)diff : 0;
> +    if (hpet_drift_fix && !vhpet_domain(h)->creation_finished)

Nit (style): Missing blanks (see e.g. the other if() you're altering).

> +    {
> +        diff = 0;
> +    }

No real need for figure braces here.

The comment ahead of the construct also wants amending / updating.

> +    else
> +    {
> +        if ( (int64_t)diff < 0 )

"else if()" please, reducing the diff quite a bit.

Jan

