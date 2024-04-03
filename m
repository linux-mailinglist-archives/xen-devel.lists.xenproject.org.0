Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A8896C86
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700448.1093648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxv3-0003Ag-0B; Wed, 03 Apr 2024 10:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700448.1093648; Wed, 03 Apr 2024 10:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxv2-00038k-TB; Wed, 03 Apr 2024 10:32:36 +0000
Received: by outflank-mailman (input) for mailman id 700448;
 Wed, 03 Apr 2024 10:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrxv2-0002ML-0q
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:32:36 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba9982b-f1a5-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:32:34 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d68c6a4630so64355741fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:32:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay15-20020a5d6f0f000000b003434c764f01sm8470589wrb.107.2024.04.03.03.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 03:32:33 -0700 (PDT)
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
X-Inumbo-ID: 7ba9982b-f1a5-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712140354; x=1712745154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnG6JXgzmUiHuTzyCN5BwALIGxGYJ6ND+KL5cUC8M64=;
        b=OjY5KOP0KRBa9a2CyM9OTXbaO2oZtZGA7Giqz1+9a719ODgTRPKs8W+eU9tXWFffCr
         EghbymX0wmKt7zWUG6zGxJEQOGtyckyhvIFBQZjLOuV6yFxV49/ENLiEwz/nxPNFzuDi
         /+yMG93P0dG6DvSCaAIdbSoYhjefsmxvzlI0BlqkvgZePv0MHuCETnFhjKcgFGHNpwST
         gAjxpRDZ5jKT30vu918v8ZyUuDig/fQMjC+bhG6fWDUy3S2GLO4nPTCvxiTmKoQttP7c
         FNnDz82h/7N/u0UOMJm9eXH1yugFKVROY5Yon9rZW9vibwrkQPU6eL/0ViF3HRyXS12P
         A0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712140354; x=1712745154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnG6JXgzmUiHuTzyCN5BwALIGxGYJ6ND+KL5cUC8M64=;
        b=OS55vSMLpmSO2D7y5D38jsVBR8k+Fo/mOH3sLGd7iOhR3GdwVP46JOj7Kqh88fMqSu
         oBfpu/GZscidKKabW53s/lh1a+HZFZJ3WBIpiMskIi8SPI7MB3lCDIaPLrmuO9nt0ruG
         ONBSU9wziz9AvgVu/HmUASJfNBNtNyOcrJbilpBpkBnYt28+ThxbLo+yRSSUcjaeKheq
         A4nVoG5nhyS/bGImvh98NQ1KhE6T9tWYB8ZoIM5QnQBG2vetmaNFYTBHX9mzApnpPsI2
         jE4mHXfIdMmXU9oAeseEneDp5BQUtDjppX2Bu/I6LdPwOmGGc1t017D/WZiQcs2u87PP
         pvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXboH0YcJopOAK1xu/Wg5WJAcdxZPCrTVe2T27nsAubt8Cmg2yBXqTdzsK9/++u9wInxLPHx9TSsU5XjDGE1AhmK80a2+eT0gfBoplXc0o=
X-Gm-Message-State: AOJu0YxXtqBJ6moKRjxUGu4FbSTIap2hlET9TyB/ZgVnkmno9LI6rPL9
	qHFr0zCFFJ5pCbK8meZwjKUXiwCbbXOcrlfHxGnBsO0MaT14ON7XTNWpUPsRUA==
X-Google-Smtp-Source: AGHT+IH5zFvVp9DD+mZjdUWw7ZiktALKcb8oZB75WhO3Xy7luy1mKRHTVHxkLpjCWrjF18pqJB5WAw==
X-Received: by 2002:a2e:a592:0:b0:2d4:668f:baac with SMTP id m18-20020a2ea592000000b002d4668fbaacmr12573545ljp.28.1712140353692;
        Wed, 03 Apr 2024 03:32:33 -0700 (PDT)
Message-ID: <68375b35-c611-411d-99f0-c71b48cc5ba2@suse.com>
Date: Wed, 3 Apr 2024 12:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check by
 compiler
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> Currently, RISC-V requires two extensions: _zbb and _zihintpause.
> 
> This patch introduces a compiler check to check if these extensions
> are supported.
> Additionally, it introduces the riscv/booting.txt file, which contains
> information about the extensions that should be supported by the platform.
> 
> In the future, a feature will be introduced to check whether an extension
> is supported at runtime.
> However, this feature requires functionality for parsing device tree
> source (DTS), which is not yet available.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -3,16 +3,27 @@
>  
>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> -CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
> +riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
> +riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>  
>  riscv-march-$(CONFIG_RISCV_ISA_RV64G) := rv64g
>  riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  
> +riscv-generic-flags := $(riscv-abi-y) -march=$(riscv-march-y)
> +
> +zbb := $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> +zihintpause := $(call as-insn,\
> +               $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)

... this would better be indented thus

zihintpause := $(call as-insn, \
                      $(CC) $(riscv-generic-flags)_zihintpause,"pause",_zihintpause)

to make nesting entirely obvious. I guess I'll table the liberty to adjust
while committing.

I'd also like to note that this is specifically not what I had suggested.
But it at least improves readability.

Jan

