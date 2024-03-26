Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27988BEFD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 11:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697986.1089277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3o0-0003i3-HP; Tue, 26 Mar 2024 10:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697986.1089277; Tue, 26 Mar 2024 10:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3o0-0003es-Dq; Tue, 26 Mar 2024 10:13:20 +0000
Received: by outflank-mailman (input) for mailman id 697986;
 Tue, 26 Mar 2024 10:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp3nz-0003ek-Eg
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 10:13:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7762b915-eb59-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 11:13:18 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a4715991c32so636630866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 03:13:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u6-20020a1709063b8600b00a48f5845a7esm2390130ejf.150.2024.03.26.03.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 03:13:17 -0700 (PDT)
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
X-Inumbo-ID: 7762b915-eb59-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711447998; x=1712052798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVo68FUrf3uH8D+4OGDxHtWdjPBnMPaOX7NViIqKKH4=;
        b=XESdNFxj3zElL1hQmEiFQtq4HrkbKWv/Bq82RxSA2H3nb/KpSED8FpuWAvOnPPajoC
         jKAowK3YvBrGlx71myYfKt/uLlH3OUU35pzRhfbU0GySojnOMPYxDCbkfP76+Nlw5tmB
         Lri6+JPUNQ74sbQ7P/BYFskaub5LVgj+3hWElbXWJ5oP8jQEsfuTheo0fSZu9ghgMIEc
         Ha5gfxZC8V1zGcJoYTy/diL14lEmBRTdeI8rnvU6szX8U2BqbEsgtWo4kzdLCnA4LaPt
         VczsU2f5ioSNEp17RxYIEW+/tqOo25nXCTHyg8qmDkeh+S2hSSXQ7uJpCRhyaWJchu0K
         +mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711447998; x=1712052798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVo68FUrf3uH8D+4OGDxHtWdjPBnMPaOX7NViIqKKH4=;
        b=TDNmlBK0YT3VxDj9hSmvHKMAmHrfunphF8U8OSfSf2xBDU/7ZvNlR+qTzm40NNT46L
         6npP04YKtHN5PzGL6Sr9XA8eV3Q1uliUQphrdemmfFsZfHf66f+E4MOQHH/zaZkGR+DK
         qJ8BSMkVsxmzmc5ItL2mb5Ic6FIJvGpbWJLio8jaOkDm3WXuI57x733l/zvbOQBXw3ts
         r805c3gmJXyo8Eo2g8hCHnjtWO9qyDQViY7BfT2NkbqklJ/3htu7q7nNejNyX37YkumT
         1sZju+KibVEgXzxJHb6sYmmzAQfV2c87wIhcwgaakunPRlmQjSP4Or58V389b8fGXbfP
         TPyw==
X-Forwarded-Encrypted: i=1; AJvYcCVbC31PsLreooqwoqWnlmPhBgzMY/RSYOgnkt5VnxM6sbqco/SqB5+TCFXPwViehzBwY+/jNP6k4A2ggq6zJt7SjAyt+9WtV7lpMAiMiwg=
X-Gm-Message-State: AOJu0YxjtkD9W7W2rDoLl3x97UaWHAAR5GIWK9PKnANdN0uqlikruz/N
	OICQrFZPnCe4OFVKnpTGrbHORMusMlcs5xG6ciO0aJDYUiGoWByZCYPhoiwqog==
X-Google-Smtp-Source: AGHT+IEqH3uUIY/JxHqswfMwO7Pi6ILNPrd+SIG/seYqnfKciSB+IFxO4wGDsFTGfrONZ/WVeLMyPA==
X-Received: by 2002:a17:907:944f:b0:a49:56d4:d643 with SMTP id dl15-20020a170907944f00b00a4956d4d643mr4703530ejc.36.1711447997919;
        Tue, 26 Mar 2024 03:13:17 -0700 (PDT)
Message-ID: <1c7475d7-b4ac-492f-8abd-2ab3b60c2a29@suse.com>
Date: Tue, 26 Mar 2024 11:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/11] x86/hvm: address violations of Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <ba509584faf3e8c95bc39e0a68a52380330412f3.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <ba509584faf3e8c95bc39e0a68a52380330412f3.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit preferably with ...

> --- a/xen/arch/x86/include/asm/hvm/save.h
> +++ b/xen/arch/x86/include/asm/hvm/save.h
> @@ -128,9 +128,9 @@ static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
>  {                                                                         \
>      hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
>                          #_x,                                              \
> -                        &_save,                                           \
> +                        &(_save),                                         \
>                          check,                                            \
> -                        &_load,                                           \
> +                        &(_load),                                         \

... the &s dropped rather than parentheses added, as we already have it
for (the recently added) "check".

Jan

