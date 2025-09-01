Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87121B3E213
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 13:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104573.1455601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut35d-0006kc-QJ; Mon, 01 Sep 2025 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104573.1455601; Mon, 01 Sep 2025 11:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut35d-0006hU-NU; Mon, 01 Sep 2025 11:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1104573;
 Mon, 01 Sep 2025 11:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut35c-0006hO-8n
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 11:52:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cf04710-872a-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 13:52:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0439098469so86373966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 04:52:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040f1cf4b9sm447428466b.29.2025.09.01.04.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 04:52:44 -0700 (PDT)
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
X-Inumbo-ID: 2cf04710-872a-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756727566; x=1757332366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qmV104QBEjNpqw2Ys6Gsfd+M4EUQ+4vG2xNg/PcZzUo=;
        b=OYl2g/lOtzjBIvhWe3gXSa0mUd+IA7HeHH+kCXsHkbHlYK8/Z3NUwESx8cmXz5DzFS
         3yHMdGoScFCSWTR5mq5sgVThCLvZ0W2Bh22OnpjVBi9FDY2HLzZQYp87y81DxFyIoIro
         v7TRYdJOBDvQrK9ZcNnOKmIyHCNZMhlC5st5nCWTIX1o0v3K3k1YPRsnj26dXOxA+p4n
         5/1PjFUQovTI+3kPKPpGQC0q3Bjf2gi4g3OQp5jTQz7/1pLoyNSxBOTvW1Rl9Rz6xQB+
         UCjITLQblsfloUUvOaJu8b0C1h/R231vMPR2Rz10XDhdATPaDtoOeY3FreLS8ZsCO5xO
         aSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727566; x=1757332366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmV104QBEjNpqw2Ys6Gsfd+M4EUQ+4vG2xNg/PcZzUo=;
        b=DCLxcIzeeUBYnXzzZjUS6x/GxWJF4XG4HpigUjXk6N2Xny4RvNc2KX6xcIcVYJU1TW
         bEgx8sNynH6xggSI1MrYS6uBKS3UXlmZ+R+6PMMWQZXfVhYvMTnGTnWA9YuOtmX9Np+m
         iav2/cRL8vS+F2MD+8mQpSZUDR7honx5VTaO3e/aSCSuiCsUurxT3h765OFHm71lJonB
         BQEpSNParl3im9faBIT3kGXKHllK/hVGIA5teqnIk+WlhxtlgKfrBUNO7h/+r1BGJqg2
         m1Wxh/tmp36Tso1xykFsTG7a57/ZGTjasXR7j39eMoO4pwcYxEJebs4BiLk93soGYNwp
         U2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUXaZlL7sLxm1VwFkzD5hvYgzf+J0oTgjqjZqKxa3ZL51krlCx7fhq91coHU5tb0APnbiRvikWroZo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOR70tv4JF01lsqJsISbcLN749TtIi0gim/hbXHyJsR61nGYlF
	MvJHddowXDdteiAkmfGRD0AP5ntVeWg0u0Nf/plaNFx275OAOBS3bfPeiFn2iFuETw==
X-Gm-Gg: ASbGncsWy1HD2aQ+UJUCzY34pf3LevppWgiuh1a+S3x1L4GME3jzau2lbXPGvTjDVzx
	4Hs4DZRKXDEfYq61wrhCHzb8RINP7/cWuoNHq4zrNg0JkgSgm6dC1T3+MJlyr2ulf47G2w9Njoa
	sqfFO1FapFgGXuRLlNTdFmgUwdcN6/6GTpcgQKpmO7JWZQ6+TFJr1IVaFlWof0qwCcR+kVnHwZy
	VqpkGRO5psDINYtrUk6T+Wf/AiW86WUhBeBJtdaGqCj89iSfpM38HyxDCZpYKuOaWsBN27mgVWl
	4TnbJFYcdfo9PT3y1kbKrliuAy9k5QgsJ8U2Fmdzig9U1+Vqbyqk6mo05PbEnoQQxTE/HA9WIHe
	hid/Wg8i04A802u0cz8oTi5dzh72lA5YKF/NjzYnAU0azFHADa/n2RPfAFZlj1/EgqSuLwLAU+N
	cpo8Gl7jEuDv1A+sRUYg==
X-Google-Smtp-Source: AGHT+IHidb1/bgEztXlrecNbEfIoFcZsaFfK4vrTi5lLMoEobHp94F7X2nndyt05PkocqnNyd688cg==
X-Received: by 2002:a17:906:6a1a:b0:ae8:4776:fbb1 with SMTP id a640c23a62f3a-b01d8a30b9dmr676952666b.11.1756727565617;
        Mon, 01 Sep 2025 04:52:45 -0700 (PDT)
Message-ID: <b979e1e4-b6bf-494c-8bce-fe269fd48701@suse.com>
Date: Mon, 1 Sep 2025 13:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/23] x86/entry: Rework the comment about SYSCALL and
 DF
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-19-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-19-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> It's soon going to be needed in a second location.
> 
> Right now it's misleading saying that nothing else would be cleared.  It's
> missing the more important point that SYSCALLs are treated like all other
> interrupts and exceptions, and undergo normal flags handling there.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


