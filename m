Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B699A504F8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902532.1310526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprhT-00033z-3g; Wed, 05 Mar 2025 16:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902532.1310526; Wed, 05 Mar 2025 16:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprhT-00031L-0H; Wed, 05 Mar 2025 16:34:27 +0000
Received: by outflank-mailman (input) for mailman id 902532;
 Wed, 05 Mar 2025 16:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tprhR-00031D-HE
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:34:25 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b233d128-f9df-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 17:34:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43bbc8b7c65so40969485e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:34:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd430c2e9sm22063435e9.33.2025.03.05.08.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:34:22 -0800 (PST)
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
X-Inumbo-ID: b233d128-f9df-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741192463; x=1741797263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=doGCc8HPYNtDzt6szKX2aChz4OQa85Px11FINIB913Q=;
        b=cLwK68rBkW60JDuktB8fG2dvabSgQMMfKKmLuOs36BKmzV6r6wVK8IJTtzK9W/jm9H
         J7vmg/ozfWUUq31P2FydifLsXkIOshWL3RqYDA9SxKhMDneJEdRRLX7SMy7Lchbl1rlw
         KbJoWvkISlYMoH3CjfbIueKFk4tEJXOdTcL5FEA2o1iqIBGtafRCxsihcu1PK5SresoU
         eI3knbLYzH6vxfzHZX8un3uZfypZE8RiRy/ca8KjbXmJcoQa2Z98lChSG2YeQpZ7yWiK
         V0xkD1HFl4P/7r2DmWnIQoBsESmgW9hE5covLHm1h5sP+GBvg9uoVXbvoD6UiTW5xm3n
         M6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192463; x=1741797263;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doGCc8HPYNtDzt6szKX2aChz4OQa85Px11FINIB913Q=;
        b=dJUjoE0a98zyWVVmNz0RqjxTd3uqLzibdErwdvjDr4sHrmOLt58kHfX9zfHnYRByG6
         IvVZ0ngk1/DGqT2lWng1ILGaqUbAGqdhDabE/t5vXmXS6Asam7iP7kMVol+RLDikmTYf
         hRmlu/6OaScR5ev5ZAAToeJV0Up1CBc0LIQbFnVXzHI1DZeW+r6GdPPMTC71zh/mGW11
         DZYr72NPybFP3p7xy2bEoyogSs3fyYEFkpayCk/JcoG+gL8yg7Epwwxqb3MMp4FagXt/
         oLVXMyIK9C5CZUg8qVMC2+G8Lqtjy99UouBOUSXdvtVK5pfNcBRjHrmK47fxFy7ZCssq
         /BPw==
X-Gm-Message-State: AOJu0YwmrF9tTphg9ieFa6AXEEKGuWyxcSvdiiszHiBR98EHJhoWBGCm
	3bPWsPMKmc/ee0bPT3x583C6FuYDThxYszMvWrZGBhGYDHMjZE68A9u3isJnRi3CFxn27kL8SlQ
	=
X-Gm-Gg: ASbGncv2p0g1Q57Jutu5Ya57/RmWSXBVAyW6v7vtsmZ9v+e8OnpXHG7YROnXDBw6U9+
	X4AJIyeldhMa75rqD0sz3Vp9Xmqmq7mzULb00jxxiNJ+xpp8uQjj0DNoF24R4gUEg8EqtRoEWxt
	lLwu6p5PfqqEPTxW20ECiLLQ81umda3iAkyKj/2LzPexWgKdhMnRktGM8xt9vkCZXmvqgcZv0bU
	2eOGhC8kr3npzOAivchI6StWB2HC/Zrauz7bGkMrIjAInhYGsi7x9iFf7hJEKgHFksInv3IlylK
	PgIcGS9QbugtC6sW/IKCanSw1yzxHn8Qo+8/8ezeg2GZQXth4T77tgju2Goe+QGmXuysVYPX/qv
	gTMJrHlzCB/6l1Frhs/cCdGTsJIS1dA==
X-Google-Smtp-Source: AGHT+IFxMyiLqImDziH2oxnCMVVdJLz07vVZqkfGj3PPGVg8+52jqtGAAKniJPCp/IC7yWTAkLUbEg==
X-Received: by 2002:a05:600c:4f15:b0:43b:ce36:756e with SMTP id 5b1f17b1804b1-43bd29487a8mr37427955e9.12.1741192463058;
        Wed, 05 Mar 2025 08:34:23 -0800 (PST)
Message-ID: <30d772e2-466c-4b59-b17d-973957d0112b@suse.com>
Date: Wed, 5 Mar 2025 17:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] x86/ACPI: annotate assembly data with type and size
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <26cfd90a-91f2-4bf4-9607-8ab6c7823048@suse.com>
Content-Language: en-US
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
In-Reply-To: <26cfd90a-91f2-4bf4-9607-8ab6c7823048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.10.2024 09:41, Jan Beulich wrote:
> Further use the generic framework from xen/linkage.h. While there drop
> excess alignment and move to .bss.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I please ask for an ack or otherwise?

Jan

> ---
> Of course alongside ASM_INT() we could introduce ASM_QUAD() and
> ASM_QUAD_LOCAL() (only the latter needed right here) to aid readability.
> Thoughts?
> 
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -1,3 +1,5 @@
> +#define DATA_FILL 0 /* For the .bss contributions at the bottom. */
> +
>  #include <asm/asm_defns.h>
>  #include <asm/msr-index.h>
>  #include <asm/page.h>
> @@ -134,13 +136,20 @@ LABEL(s3_resume)
>          ret
>  END(do_suspend_lowlevel)
>  
> -.data
> -        .align 16
> +        .bss
>  
> -saved_rsp:      .quad   0
> -saved_cr0:      .quad   0
> +DATA_LOCAL(saved_rsp, 8)
> +        .quad   0
> +END(saved_rsp)
> +DATA_LOCAL(saved_cr0, 8)
> +        .quad   0
> +END(saved_cr0)
>  #ifdef CONFIG_XEN_SHSTK
> -saved_ssp:      .quad   0
> +DATA_LOCAL(saved_ssp, 8)
> +        .quad   0
> +END(saved_ssp)
>  #endif
>  
> +        .data
> +
>  ASM_INT(saved_magic, 0x9abcdef0)


