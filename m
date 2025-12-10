Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBFFCB26C8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 09:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182656.1505505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFcK-0003zl-0g; Wed, 10 Dec 2025 08:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182656.1505505; Wed, 10 Dec 2025 08:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTFcJ-0003xa-Ti; Wed, 10 Dec 2025 08:32:11 +0000
Received: by outflank-mailman (input) for mailman id 1182656;
 Wed, 10 Dec 2025 08:32:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K7qh=6Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTFcI-0003xS-T8
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 08:32:10 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f922bd-d5a2-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 09:32:09 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779a637712so48303675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 00:32:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a82d218b4sm33647145e9.6.2025.12.10.00.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:32:08 -0800 (PST)
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
X-Inumbo-ID: b7f922bd-d5a2-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765355529; x=1765960329; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6fL+85cJs7+Vfpapkn7MO/VXPFgojYSiXhZrD45GAOI=;
        b=bVRGklcypnLCpdaYELT0pwedofs3WTlAfaSW8eiVhJs9rv4YVx+zeUOVjL2pibuSsM
         u3YheqUYAwr+Sd9KtlYcNlh61qj/MYGEvf/N8LT8KT7lLapcdCrbL8ISj3yUi6S8NRUT
         mKK4sTCETBhrjpTlCPXnySZ9nOEqSxWIixdo1SRIV0JSzIwZLof1Ai5rjPysx5CtcmPX
         ndXpqN/g+sesZ5amJpfJfoaxLlexxOv4GHRwh5Q71VkFlgvob0L7jCIJxrrCoibw8r6Y
         4GsyFudfFmsf1pFzeQM2WoxS+e3rQ2jECltky7Y9Wi1L+FpTDXfnNdKi3ODuPRpPCi5Z
         e6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355529; x=1765960329;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fL+85cJs7+Vfpapkn7MO/VXPFgojYSiXhZrD45GAOI=;
        b=ZGlbYDJ+S0ctvwGPv+g9c33zRjxSv93I4TFzIu2lBXLTVQtaxxUTcJcXPVY0dEcbrp
         2S8ipG1zaAZOJpGqz9mR1D+OXOZ2mlhnm8PCW6Efr58CcfvOb7w2+k0gT4DWIcfvIJ7I
         C9DIvYmwdy7tQud6KBTl7/VUG7z180J291i0cZZDsyxOfmtcUmBP+ql+Zip8K9vIzv+C
         Yv2fxLyEAFdH8ZoUAla/q6skQ8wP/WTybzfOe6CMM8RvCJXvmw2ZhopCmCJiXo6sfdu3
         Df/vU46Gj3rRTOgCgtem4M6CEzGjBi/UyaXPTTL0f9AmXNgY0SoHmJkpLB+7L/efDoFb
         3APQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDOCA7+fqSeRNCbRgDLCShqON2T87KasztvRKFI+pPjwdTE7oAN1RZ1e1EMftaVw59/1hdOkXUxvo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywq/+2TW4Xu4FR3l+nv9NRUKoyDwoV1B9mn5lVBn190NjG/MiFx
	MPDMj4UOH6Xi8L6fF9SfzAH7j9LoAZD94yTovtDIRqNj+63eROiKmi6NHbDuAFvAZQ==
X-Gm-Gg: ASbGncu6XhoNGoe6yn2D6wmCyYYS2icBzaaAcAPpavWFtJbNZmscv123xLd6/QC/faq
	RN9zWI4QBwzgwuesI1YdfQpqidsqVieqx/QUV2lUgadmJglaqG10JX/7axbX1MdtB4DqbtNETLh
	zlzn2yRXcs6xgNnAYOAy4tSk7cBW46i/+2ju7GhNUiasqa0umUcHEPEgYTL/RUt82zH+ZycN70x
	z3LS/JPVmqmpNILj4vvd9LLjUC5XOUwGHDergctQJW1nXVjPhpU+Qzeb+B58IaErh1vyLXhqxlD
	SN40ElJrWdjdQpzqp+3282XiqucPRIy/x1w/Zb2LztyDjPaAud2JVQeXlnQoU/b1W1PDaLshdJd
	6TyfRqkdxIxYyXCl5B+CCSG2v8nk56mTTdtOiCgaptsw5bgx+3U5VJrz14AiFWtWPD7jdHAx5FY
	0IlZwkWm95zP+8VCDJk4dAdhQjyzMjV9VAuUiLRjGyCeyR7z1Lh/QTiE/Jef74NBriGFvboocti
	uAXMq9Mv3ehXA==
X-Google-Smtp-Source: AGHT+IHT9y0fafOSJdK1ptYhdvP1Djd3ijQJTO7Qq+RpJ4TJR5UfuGi6Ep5LS2+fG8b2WOM2dsl3hg==
X-Received: by 2002:a05:600c:3e8d:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47a8379ba35mr13603315e9.30.1765355529215;
        Wed, 10 Dec 2025 00:32:09 -0800 (PST)
Message-ID: <f4855e72-4898-487e-8240-a45c0c845b4c@suse.com>
Date: Wed, 10 Dec 2025 09:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] x86/platform: Expose DTS sensors MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1765300623.git.teddy.astie@vates.tech>
 <5ae285cb5c494651c1f4842f36891eaf6dc28355.1765300623.git.teddy.astie@vates.tech>
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
In-Reply-To: <5ae285cb5c494651c1f4842f36891eaf6dc28355.1765300623.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 18:19, Teddy Astie wrote:
> Intel provide CPU sensors through "DTS" MSRs. As there MSR are core-specific

Nit: s/there MSR/these MSRs/ ?

> @@ -86,6 +87,11 @@ static bool msr_read_allowed(unsigned int msr)
>  
>      case MSR_MCU_OPT_CTRL:
>          return cpu_has_srbds_ctrl;
> +    
> +    case MSR_IA32_THERM_STATUS:
> +    case MSR_TEMPERATURE_TARGET:
> +    case MSR_PACKAGE_THERM_STATUS:
> +        return raw_cpu_policy.basic.pm.dts;

I'm pretty sure it was indicated before that the raw policy is likely wrong to
use for anything like this. The host policy wants using instead, or else specific
justification should be provided.

Jan

