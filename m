Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E29260DA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 14:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753008.1161263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzQs-0002oP-AB; Wed, 03 Jul 2024 12:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753008.1161263; Wed, 03 Jul 2024 12:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOzQs-0002lM-6r; Wed, 03 Jul 2024 12:49:58 +0000
Received: by outflank-mailman (input) for mailman id 753008;
 Wed, 03 Jul 2024 12:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOzQq-0002lG-D3
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 12:49:56 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id becfc5eb-393a-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 14:49:54 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so60780091fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 05:49:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91ce43303sm10639293a91.17.2024.07.03.05.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 05:49:52 -0700 (PDT)
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
X-Inumbo-ID: becfc5eb-393a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720010994; x=1720615794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yd5C9Xr32LXKl0cflASgwZpvQP4LBEFfFgrl2/EHUY=;
        b=ThlW4buDGMqcnLF9bhBhLTZVDtPivipSqK6xYarm/YvYM7NXpQ3blN3VW5du9rS8eq
         oveNmZ9l3BKYChVXFR7TbLlN01akJ2LolOSKK6Y2oAoBc4Tw2pKvE8ehaVpU/U+MN7Ms
         BTvwbAZKcNglTVuSjCzXib4gxVrRvGExlxibYeLpjm1A0bcBcmG/+A0GnEQ9JqrngrLy
         D6O3c4R3T6DFTkrqkP+wEeeXXbuA0mdeuoX1SO8h6e/g5S0U+dwH5zfhTLI4ury7iRY1
         eeruPQrAHdFZYWuPVU4lyLSuRIZ0Ku5k/xvw+Xs1VTJW/L4FXxNJoum7rkg7pBV8WVar
         zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010994; x=1720615794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yd5C9Xr32LXKl0cflASgwZpvQP4LBEFfFgrl2/EHUY=;
        b=gnc5/VWxzZ9gkqIfDX8JAEtn0nShg1Zk1LbBB1aYtG/h+TnHSYyAIku7fR3y+dK2fE
         Z5Ifzb1ZczEEM38LIASKvJvcpJqR27JDrNVjiITaC1sEOCHt8ylidYFL04Tn41kWjMU4
         Px3RwYgjuQcJDFKcFbqwB/PG3dRAP+8fdSJ7gNrB2502pJFBdN0FxMED0oEgSU6IHENy
         bZ86r1WM6b5nR9stJSZsy4y+AnaCyKbm/c+MPq8OqsSa6M79cbkKk3pORSdk9FcZdE68
         y9fxQtbIgq+lS3r5xjmIpmLRBOaR3YpusRlMIt06aBtu7xgBYA65yaGxk1a8WufOj1lB
         97aA==
X-Forwarded-Encrypted: i=1; AJvYcCV6fVynXhK7KVe4T+8VFTJVQX6pPijNABVgAwvisuKX2CsZRkn7GcT+1E9qWtPYRVV+un5wqYi28M35yhcuGPGAbuzOuKkfps8a1jrB8sk=
X-Gm-Message-State: AOJu0Yw1pC7vVKyqIpkonXTNpdYmkLO/koGzNDWNz3fna/O2Q1kq2zpE
	v+v2T0+9RIwzE0BYRxLbjv8hcU3mVz3Vc0GbTUu/Pp4LuubU7y0ndUpTpXe4eQ==
X-Google-Smtp-Source: AGHT+IGxsNEXcCpTuwFPPtdwYIWmf1FliweBaJR1t6KPozXApI+rpdx25tBggVnkeuc7PwmjF3St3A==
X-Received: by 2002:a05:651c:1308:b0:2ee:8407:2f58 with SMTP id 38308e7fff4ca-2ee84073000mr9646441fa.17.1720010992898;
        Wed, 03 Jul 2024 05:49:52 -0700 (PDT)
Message-ID: <8a0c0cec-c168-471f-88ad-228ddcdd4f0a@suse.com>
Date: Wed, 3 Jul 2024 14:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] x86/asm: address violations of MISRA C:2012
 Directive 4.10
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: nicola.vetrini@bugseng.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <efb272c9eaad24875f34b396a75fed9577dedbda.1719829101.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <efb272c9eaad24875f34b396a75fed9577dedbda.1719829101.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 15:36, Alessandro Zucchelli wrote:
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -90,6 +90,14 @@
>              "name": "Dir 4.10: direct inclusion guard before",
>              "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
>          },
> +        {
> +            "id": "SAF-11-safe",
> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: file intended for multiple inclusion",
> +            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
> +        },
>          {
>              "id": "SAF-11-safe",

This can't be right; the sentinel must have its number changed.

> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -104,10 +104,17 @@ $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
>  xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
>  xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>  
> +ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)

Why is this being added here? It's not used ...

>  quiet_cmd_xlat_h = GEN     $@
> -cmd_xlat_h = \
> -	cat $(filter %.h,$^) >$@.new; \
> +define cmd_xlat_h
> +	guard=$$(echo ASM_${SRCARCH}_COMPAT_XLAT_H | tr a-z A-Z); \
> +	echo "#ifndef $$guard" > $@.new; \
> +	echo "#define $$guard" >> $@.new; \
> +	cat $(filter %.h,$^) >> $@.new; \
> +	echo "#endif /* $$guard */" >> $@.new; \
>  	mv -f $@.new $@
> +endef
>  
>  $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
>  	$(call if_changed,xlat_h)

... anywhere. Did you mean to use it in place of ${SRCARCH}?

Jan

