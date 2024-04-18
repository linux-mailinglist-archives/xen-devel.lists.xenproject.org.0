Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276C8A93CE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:15:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707988.1106478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLz5-0005B6-HH; Thu, 18 Apr 2024 07:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707988.1106478; Thu, 18 Apr 2024 07:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLz5-00059L-DM; Thu, 18 Apr 2024 07:15:03 +0000
Received: by outflank-mailman (input) for mailman id 707988;
 Thu, 18 Apr 2024 07:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLz4-00059F-QH
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:15:02 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da46b1c-fd53-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:14:59 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-418dc00a31aso3697135e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:14:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk13-20020a05600c0ccd00b00418e2e4aa4asm1232657wmb.16.2024.04.18.00.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:14:58 -0700 (PDT)
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
X-Inumbo-ID: 5da46b1c-fd53-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713424499; x=1714029299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qN9D5yXth4XtayEWN7Tz7NSdMK+JNjlhuWENf1lVmRY=;
        b=VXCUOc5RwPGIrbS4S3acB0tGlGC5/7KillPpo0W9EQwkbWSRh+Pj4n9SCfETWCK8A/
         XFy/MPAD4SuHYvKlizEgb/bGFF75OZxK5llxCIZb8AZ5Je0Be8y/QJBl1fpuy9/IAbcU
         15mEYN2jOI4Uwfgs/WzHFJxtOvroYE4nJrgiZSkOR+0+OAV0lwcCThCGscnWcaDiuaY8
         Eul2KNSK9X0tO3E0KI02U23LKLI37bZN1M2uwshnkGy8v9I5iEwjOQrUAwFlhYzjYoCa
         kivIJsbaV7MLr9aKk5M78bm9Y/PZKR8i92xFXPtZw2l3T1x9CM5N8xb9GOGcoM9BSIVB
         nEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713424499; x=1714029299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qN9D5yXth4XtayEWN7Tz7NSdMK+JNjlhuWENf1lVmRY=;
        b=qCdg5ClrS0KItJeEjRwChQh/OcyU91PaNGpHlCoPOes1lwvZjO4n5n1J/ky7PApsvf
         fLGEpHaVwH/kzJf2EQOAijnYBpEY7/IbAxNnl/F1gTJIJ2DRHeSsI+k0iWKohtwVAspz
         XW0mv+aMehF1NpZrpHFNf+C0+d86GQw7IggXb6zkS6TkMCKqaSH9TjvFMfHX/BAMovNn
         ItIZYQ7JDsGJBMBEii5r3FBuiLLN4v6wFuYZT/CEgjGIjGgUMTF0Xar1o8Bmwv+JqG/w
         jTcWtVfrby3CO54bsMD3NjYaZBLhno/pVl4TarZRXnf4ije30Gq6ae3IiFl4jGloxF0L
         Anvw==
X-Forwarded-Encrypted: i=1; AJvYcCVhMjWKqt+D3Mcfq9T1GU4xK5GKHBcl7KSae3fiJipacztcxR9RTQkd7g1vjR5JJ/cY5240fADespo7VBfJViDcDlOtv+c/nqP6EX5kGSI=
X-Gm-Message-State: AOJu0Yz1OPGrSNSZ+peS223lDig07xPdGLOd+FaqfigLdg2dBQZZ6Yyo
	+URf9uGzCjZwCUR1yz6xkqnkOwBeFn8ATOODO5at3g5I5AgQOOBgxcWtZv6Seg==
X-Google-Smtp-Source: AGHT+IEVOAD0HRUemY5Y3g9RtPcBcjEvWfSzHR0AB9+Ojp8dCnFO0PKvtncMLcC/ybzSpWUMufYiPQ==
X-Received: by 2002:a05:600c:444e:b0:418:301e:6c60 with SMTP id v14-20020a05600c444e00b00418301e6c60mr1274819wmn.12.1713424499146;
        Thu, 18 Apr 2024 00:14:59 -0700 (PDT)
Message-ID: <9ea586eb-b9ac-441b-981d-f35ee70b9831@suse.com>
Date: Thu, 18 Apr 2024 09:14:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/17] xen/riscv: disable unnecessary configs
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <267bb71ebeeafde25284eff82408effebba4380b.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <267bb71ebeeafde25284eff82408effebba4380b.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -515,10 +515,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
>  .riscv-fixed-randconfig:
>    variables: &riscv-fixed-randconfig
>      EXTRA_FIXED_RANDCONFIG: |
> +      CONFIG_BOOT_TIME_CPUPOOLS=n
>        CONFIG_COVERAGE=n
>        CONFIG_EXPERT=y
>        CONFIG_GRANT_TABLE=n
>        CONFIG_MEM_ACCESS=n
> +      CONFIG_PERF_COUNTERS=n
> +      CONFIG_LIVEPATCH=n
> +      CONFIG_XSM=n

While XSM and BOOT_TIME_CPUPOOLS are covered in the description, I struggle
with PERF_COUNTERS: What's missing there (besides trivial asm/perfc.h and
asm/perfc_defn.h)? As to LIVEPATCH: I suppose there ought to be HAS_LIVEPATCH
allowing arch-es to indicate whether they support that.

Jan

