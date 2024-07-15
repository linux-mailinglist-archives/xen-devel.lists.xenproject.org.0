Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D0F931018
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758741.1168197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHFu-0001SW-FI; Mon, 15 Jul 2024 08:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758741.1168197; Mon, 15 Jul 2024 08:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTHFu-0001Pl-CT; Mon, 15 Jul 2024 08:40:22 +0000
Received: by outflank-mailman (input) for mailman id 758741;
 Mon, 15 Jul 2024 08:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTHFs-0001Pf-CV
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:40:20 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de147de5-4285-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 10:40:19 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so50751631fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:40:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc274f8sm35580575ad.171.2024.07.15.01.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:40:17 -0700 (PDT)
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
X-Inumbo-ID: de147de5-4285-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721032819; x=1721637619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kFEtVMNZ/oVx6FNuevfVHmDDH6vhf1JvsPGPChekxGM=;
        b=Ag7Hx0DBl/MYszOzcMpD7sQmENdgckVnZRKNrub/HT+7XZYb2Yi8uzDVYdDBPCNmuU
         XJetxCd3smkI7vLt2eYW0XTzioMk9B1V4UfwcGveMAWUqhCFd+Q/Ym80fFCwra6lTO15
         uEH7Yf5GuuXnUUhC4mmQJbv4zl99g7T8V08kHV2c/dLlLl7+haJobJaiajaaPHLXIT8B
         vzftAVP3XP+SdzqToBKfMg3NxmmC4zEb9133YxUuCAosCbfoYjjmbDljv0VDUppBmQiO
         qWM+cufXZ9hWcY8jTHm+LFUZ3jQMYsusPH9kEnYY2GxumK3az4XtBiiqJGZMPI3qF/Po
         rjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721032819; x=1721637619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFEtVMNZ/oVx6FNuevfVHmDDH6vhf1JvsPGPChekxGM=;
        b=cDGxbExbAAmRAteOhzgPWOJqiRuRPRCCnMOBoF3PGA+PtFvczKGTZviZ/3WDX7N6Yz
         mVkE8RldrmAydax1xAg7OZAsUHi26sHjoWwXjdcHTqbIQ9z7g+vkruJ4s724V0W6y6nt
         TaU+PlzY7iBG7dpGRLumnOCLjJreqddX1CL9LA1E0BhA3Gcp7nEavbXJezDcMdMnl3Y6
         DGvwWo/5uBCPX/o0uLWDJO+Qht4ZiMIXxPCSx0TWHmjWuu/W3Tp8zkk9rWkYTLHDZUyO
         vq6tonheGaoSMoHn3PM97/b1BZAD1QplhTFeQyBaO+j9Dh4YFOn+X6S6Dq2xx68bdjp8
         FIYA==
X-Forwarded-Encrypted: i=1; AJvYcCVeuIxciSVzaP74syubH1mf7gNKcaJwmi5bH75xD84973D+kw1Xvg7B9ZEvFNzd5invL7u96Lb9acPWq9/BrShSNr312S/GqdFe7hsJqO8=
X-Gm-Message-State: AOJu0YylwHYMHkrUPXJtmo8Yl+of++zF4rcsDpp5z5OUhNkiQW4zNeb/
	BNiPKSQQgrPxxqeSseLbO9Cb23WDxsT0A9f+khxw6sBQXxvxuoWX0cQ1hk923w==
X-Google-Smtp-Source: AGHT+IEmu2e/dTmOi0vYyC3rQ+FmcV5aCEgBhXENF9viRTBXtczU7BiwRNJM6Twb5jRjW8Eu1c/BjA==
X-Received: by 2002:a2e:b178:0:b0:2ee:44f7:cc74 with SMTP id 38308e7fff4ca-2eeb30b9a36mr120980421fa.6.1721032818214;
        Mon, 15 Jul 2024 01:40:18 -0700 (PDT)
Message-ID: <17bdf7bf-6e13-4f58-93c6-5412276e2798@suse.com>
Date: Mon, 15 Jul 2024 10:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/riscv: enable CONFIG_HAS_DEVICE_TREE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <5229417cbee0aace3b9dccdac8c0157b4facf948.1720799926.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <5229417cbee0aace3b9dccdac8c0157b4facf948.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 18:22, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Albeit a little reluctantly, seeing the once again entirely missing
description. Please can you get used to not leaving that out, unless
the title really says _all_ that's wanted / needed?

Jan

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -2,6 +2,7 @@ config RISCV
>  	def_bool y
>  	select FUNCTION_ALIGNMENT_16B
>  	select GENERIC_BUG_FRAME
> +	select HAS_DEVICE_TREE
>  
>  config RISCV_64
>  	def_bool y


