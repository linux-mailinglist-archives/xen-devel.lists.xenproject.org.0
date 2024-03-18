Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7725287E467
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 08:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694509.1083316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7os-0007or-Lt; Mon, 18 Mar 2024 07:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694509.1083316; Mon, 18 Mar 2024 07:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm7os-0007nK-J5; Mon, 18 Mar 2024 07:54:06 +0000
Received: by outflank-mailman (input) for mailman id 694509;
 Mon, 18 Mar 2024 07:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rm7oq-0007nE-RY
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 07:54:04 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afad461b-e4fc-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 08:54:02 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a4675aaa2e8so452128366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 00:54:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 js22-20020a170906ca9600b00a46b8cd9b51sm1226767ejb.185.2024.03.18.00.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 00:54:02 -0700 (PDT)
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
X-Inumbo-ID: afad461b-e4fc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710748442; x=1711353242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtSNiJ5JxZs/szM2xlAaB3/oeh0bAZWDXhtNPyZ1dq0=;
        b=Y9+rhZ92m+KdfhiUL0AZilSf7lwGpzEqN6wtrSRTLBCeFqofVGnb7Xx55QC1o/QHfH
         V4peBI1jl+SkJyR0hlN7rRDtCT9B16VhYn1w57B5ZYJ7OSOM1a9YLh1e9GAf9iwHHsGh
         eJiFd53a3eZlAMVGsctvV7Aqjye4+m45GeT6TsM956sY6Hyq6b4hA7nKyuaJU6L8D9S6
         2TOsEb0cF70S9rEHA/zP9oFq/bp3e4jRO86H6QEvNHcaJZpqzfpiEHthkKV1IxsANEJA
         Y8+6bxRfoaJ30BqcNzKfTkM1w+wdat2jDsvKTE2PLZ4INiHsurwsWzKiF3iTh93GoBS0
         L9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710748442; x=1711353242;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtSNiJ5JxZs/szM2xlAaB3/oeh0bAZWDXhtNPyZ1dq0=;
        b=PN4FrkYpXQfbIXlU5HZYahlZnzOabCVJL4GlcQNQJTt05gCr5vt8fHnMK7MK1K10qM
         UYsGj8S9LICoDxRSFQmxhqNZkmvTW9ZKaHoarAizDZm3dMhxPlpCJ0pgrgijjsRv5pl6
         cDB1ulHWBm3U+ARQMX6HAqGC8fqOzvQ3W4QWQGrJwSJBB3mJv6AAv23mzddKKLFhfOUK
         KrOP6au2uqo3vQRyVshqUfZCLh3FjKQ9I7jxgNCw98fwX7t5cPtIgQfIJJ4ggDdB+n3Y
         jZVgdpmUbDyOqKuDRUVUBET4BYsH47ir/0sgiDGfKzriGGz/einj2DYU59hbE/TtpZsX
         dDRA==
X-Forwarded-Encrypted: i=1; AJvYcCWgh2iFerdVERZYc0B9T6AKIC1AeLnWmgPxTiZ8SS73KwTGYGew641RQLuEvP9Ki7F3RWz6B9W98DReRP1BUHshUP8eP/FJGv+sZrUbtyc=
X-Gm-Message-State: AOJu0Yz70n9u6Y56k0eSK3whffL26VpgeL3j/cfyej/p0zpXYRcuWVKJ
	3uMox2ckoDHthxmg5MjBFRiqWHilPOJHFVAQoBIH+GSrxCErEE/s2/iu04IkLg==
X-Google-Smtp-Source: AGHT+IEchGSfqvlM0BpIeOtls7X44UfwIfZDBarIntrDZP6eGDoS2U3Dv/24fiphDw+7/qtsaXh/lQ==
X-Received: by 2002:a17:906:3586:b0:a46:c386:bfb0 with SMTP id o6-20020a170906358600b00a46c386bfb0mr826967ejb.4.1710748442255;
        Mon, 18 Mar 2024 00:54:02 -0700 (PDT)
Message-ID: <9ec42fc6-efc3-499b-b066-e582563cfc9c@suse.com>
Date: Mon, 18 Mar 2024 08:54:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/20] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <5a1b905601db481a1a625dafbbf9b28dbe12876c.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5a1b905601db481a1a625dafbbf9b28dbe12876c.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:05, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/configs/tiny64_defconfig
> +++ b/xen/arch/riscv/configs/tiny64_defconfig
> @@ -7,6 +7,23 @@
>  # CONFIG_GRANT_TABLE is not set
>  # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>  # CONFIG_MEM_ACCESS is not set
> +# CONFIG_ARGO is not set
> +# CONFIG_HYPFS_CONFIG is not set

What exactly is wrong with permitting this?

> +# CONFIG_CORE_PARKING is not set

At the example of this: It cannot be enabled by a user (or randconfig),
it needs to be selected by an arch. Which RISC-V doesn't. Hence why
specify (and not really override) the value here? This may apply to
others as well, at the very least ...

> +# CONFIG_DEBUG_TRACE is not set
> +# CONFIG_IOREQ_SERVER is not set
> +# CONFIG_CRASH_DEBUG is not setz
> +# CONFIG_KEXEC is not set
> +# CONFIG_LIVEPATCH is not set
> +# CONFIG_NUMA is not set
> +# CONFIG_PERF_COUNTERS is not set
> +# CONFIG_HAS_PMAP is not set

... anything CONFIG_HAS_*.

In summary - please limit overrides to what is minimally necessary.

Jan

> +# CONFIG_TRACEBUFFER is not set
> +# CONFIG_XENOPROF is not set
> +# CONFIG_COMPAT is not set
> +# CONFIG_COVERAGE is not set
> +# CONFIG_UBSAN is not set
> +# CONFIG_NEEDS_LIBELF is not set
>  
>  CONFIG_RISCV_64=y
>  CONFIG_DEBUG=y


