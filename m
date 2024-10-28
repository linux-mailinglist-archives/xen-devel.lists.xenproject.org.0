Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD349B31F7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826570.1240871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Q1r-0006WE-UV; Mon, 28 Oct 2024 13:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826570.1240871; Mon, 28 Oct 2024 13:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Q1r-0006TW-RV; Mon, 28 Oct 2024 13:43:31 +0000
Received: by outflank-mailman (input) for mailman id 826570;
 Mon, 28 Oct 2024 13:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Q1q-0006TQ-IA
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:43:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d91afe8-9532-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 14:43:29 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d4ba20075so2997583f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:43:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b71479sm9449804f8f.69.2024.10.28.06.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:43:28 -0700 (PDT)
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
X-Inumbo-ID: 9d91afe8-9532-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730123009; x=1730727809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cRyYDfblkK21fL1M8JVb7mqC8c6IP0fxorq7TOnB/Qo=;
        b=EjQCyfy2kXv3pggOZJ8fWSNGrJoLMdxoQzIheSuTCGP6Womccu9fVK6a+n16KUItYY
         JfniJCMZE8zrLoVAy9YBYQo7dQ6h/ANxAT5Psc7+p/d0p3URFydlECnwLNFLgrbBDulu
         OzZ9b1tQbPD9yjvM2nXufHKiVOqwr5N/xsCaeH8LnfXxYTgNNCBE5BrEODvxLsAxiG54
         Uy5it0xj0z+rKA8jnSDymdG1cNtOVWOo0uCXG9l3o4ieXI3L9PCouGHPDahdhVdL0rgG
         2w0/iWSAEXCTq50eUAEPJY5ISWKMyaZ0m1SVsnB22Myze8d2/aGcbkdn0AP5O9a5Ttu4
         lcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123009; x=1730727809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRyYDfblkK21fL1M8JVb7mqC8c6IP0fxorq7TOnB/Qo=;
        b=ZGB0SOR9agT+sNA0XPruGn00xovvFLWkzOO/aRiNcj1JYFHT8fC9gwg1slWWXaUuFa
         CZIWAwcZfCQ8W6Hi6is4oS9y6giQmd8dU70DGEaLAvWTBJWDnTUJdmCc6EFs3shVIUGF
         tzTwchI/ZSZODlZ0fgG+aquwdpPeGyL8mIjgyGsGN3Zl/KVnzNa6zy6GtyzDWYPTQdV7
         5zWWqeADU4yteRXW4JwozxfuZvv/DVtZ1lI4D30lospiOXTZg1M8etV26+h0NB5BEerR
         AQt4p+3IcIl2AknHRGkwOfN6TTPSGKAsn60y1b2KSrftlK95CHrwcT9JF+mTTT4NJ+bD
         zVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWajfrY6hv4NtWerN8ok1YL4SuWI9vC/vzfnaThHIhIRCg+Jui/ET6wF5cjz6LX0o4hYTsVZKFVgWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGQkhG4KQjMXeDlio8H/fA6XtzIfE+rbIE/uP2M+rIEBkosUqo
	mF2FxhhOSU0cx2w/EFljdCwObIYBHWVXNtPAIpYsxmF2jk09E/p9EFIC6rYurw==
X-Google-Smtp-Source: AGHT+IF54Z6dsZ4HpCS94LMjfgsDLdqh54zx98L8Ehui1V9OUY+JgDgyOGS5eEmBPhaTWV4pzFJ9Ew==
X-Received: by 2002:adf:a317:0:b0:37d:4e74:67f with SMTP id ffacd0b85a97d-38061200a76mr5096130f8f.37.1730123009189;
        Mon, 28 Oct 2024 06:43:29 -0700 (PDT)
Message-ID: <912eb34e-90bf-4ec6-91b6-33119a77735c@suse.com>
Date: Mon, 28 Oct 2024 14:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] x86/ucode: Fold early_microcode_update_cpu() into
 it's single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> Diff-wise, as early_microcode_update_cpu() is the larger function, this more
> closely resembles "merge early_microcode_load() into it's single callee", but
> the end result is the same.
> 
> At the same time, rename the len variable to size.  This is for better
> consistency with existing logic, and to reduce churn later.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

As a nit - in the title isn't it "its", i.e. without the apostrophe?

Jan

