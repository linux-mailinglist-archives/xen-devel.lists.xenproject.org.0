Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E602E8B5DF0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:42:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714263.1115415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T9O-00033z-B4; Mon, 29 Apr 2024 15:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714263.1115415; Mon, 29 Apr 2024 15:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1T9O-00031u-6g; Mon, 29 Apr 2024 15:42:42 +0000
Received: by outflank-mailman (input) for mailman id 714263;
 Mon, 29 Apr 2024 15:42:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1T9M-0002X3-Bv
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:42:40 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1beeb114-063f-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:42:39 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41a72f3a20dso32974215e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:42:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b0041a9fc2a6b5sm25341286wmo.20.2024.04.29.08.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:42:38 -0700 (PDT)
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
X-Inumbo-ID: 1beeb114-063f-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714405359; x=1715010159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PavaluY3655TtVb7X3QA40FkqjcFVs0fgbfp5bv+XlI=;
        b=AGPVzE2+YMyR8MK4lBbHkCIEb5/072ymJXeLsWDu3d4YrLQPTHCPlw0gSkZts5qfwg
         kFG/1XfN4PLuUJwMdqS7oLD+dbjVHaOFLDmDxWbja5Kd1w5438Lpib5ssZv7YRahmjnb
         4/oItOCdFkoULjl6/uVzYtX1bqF34GzzP+xSFog2z8jj7i4+HjCqPPa4RRSzD95+eu01
         D0is8NA81fFKyZ6Nx9P1USXvx0V3eCyrX5UfcJ+vvtVWzWMoBuzHzeK87cW9KFyHkJim
         /8oTAZR4atPCOeVsYdP1qOjuODhHhfvPOvfRX011ddbbd0pT+SgLJEMb0yV5XxuALM15
         tH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714405359; x=1715010159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PavaluY3655TtVb7X3QA40FkqjcFVs0fgbfp5bv+XlI=;
        b=bWKD86feI3LeuDCFJoFdDLXZfXc5fjuaZIXofw0CnU0khClbObin0CHPQBEKYxbDEt
         JNcFlxOe+d5nzGkkSSFnhpv+S5l0qVMhTGd1IG22uQEqBJAjDPnhjToyVj+yiHPIrCbx
         dcm7EyR3UU/Y8s+YrEcY1gMQX3X16fH6g7RKIgkAMcEazaEkncL22mlqdrwnMJF3MyB7
         pi/dFhWHGNQDlb/kgV80TJU8ipcQWcgCdakg0ONPal66NTDqXUNMUTbAgbwcwBqH7LFT
         m/5rbR3wHLVJ/G7/YgD5Mv8vMHjqBAYe5lsfVEPJQlPB4seZrUWtcj8SRnaJpyodJIGw
         Zjqw==
X-Forwarded-Encrypted: i=1; AJvYcCWnVPvX82AMfay0oZFUvb0B1AaODOPmgYM051otdXRrT9RyUdE8tgXhuQSkYjyZvvF9m4FDyMhmCsETNd8djMuDxPKbXHdNdtox4xUs7tg=
X-Gm-Message-State: AOJu0Yz/85exGFRGGq/LgM6pH1ItMNV+6u0S1ATV1L7oJpMjZwkzAtpZ
	vKJ4sBIqSPVFgd5Xb+w9TStVzd0DvEYecU+1KleJqDkTngcivDfzLBTeYRjHow==
X-Google-Smtp-Source: AGHT+IHWzoxxAawcV0X4Got3obQTd+5my0P0ZpKP+GEQwYT+HEsy0Vi7f4BJ5LhbQCjnSNctl0jrPQ==
X-Received: by 2002:a05:600c:1387:b0:41b:d8ef:8dcd with SMTP id u7-20020a05600c138700b0041bd8ef8dcdmr4543139wmf.28.1714405359006;
        Mon, 29 Apr 2024 08:42:39 -0700 (PDT)
Message-ID: <79834875-d26e-42c7-9ffa-868a84a07dfb@suse.com>
Date: Mon, 29 Apr 2024 17:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 4/7] x86/MCE: guard lmce_support/cmci_support
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d5fa50b3056b96f3046be39ed682a8b347f1b425.1713860310.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 10:54, Sergiy Kibrik wrote:
> Guard access to Intel-specific lmce_support & cmci_support variables in
> common MCE/VMCE code. These are set in Intel-specific parts of mcheck code
> and can potentially be skipped if building for non-intel platform by
> disabling CONFIG_INTEL option.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

See comments given for patch 2.

Jan

