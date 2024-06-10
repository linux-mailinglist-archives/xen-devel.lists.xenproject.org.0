Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2E9020AE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737226.1143433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdVi-0004re-EW; Mon, 10 Jun 2024 11:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737226.1143433; Mon, 10 Jun 2024 11:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdVi-0004pK-Aq; Mon, 10 Jun 2024 11:48:26 +0000
Received: by outflank-mailman (input) for mailman id 737226;
 Mon, 10 Jun 2024 11:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdVh-0004Hp-7z
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:48:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 576c5dbb-271f-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 13:48:23 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6269885572so937277866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:48:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f13e08c89sm226356766b.88.2024.06.10.04.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:48:22 -0700 (PDT)
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
X-Inumbo-ID: 576c5dbb-271f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718020103; x=1718624903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kJrhT4z/+SEXmZZQ9t1aIgmTTofzN0MQlnz75vfH5XU=;
        b=d2B+XSavQVSjeMozbHF/+R0lkshJkNQguHZLFFn7PDITOp3SzCqDVT+/XC1OOFjgVk
         UAw9P0KBpeunK7fxaM4Z0zPEl+rMOnoEEVKQ0SfZ4IQMs7aF8ZnBM79G0d7TiKjEI+t7
         wy/vahYyQdt+HDdUu5Tx+wtyh90hrGiZqOWc/X3yEFLiIt5LcdQHIZLabgcJEQaeST2n
         8mKqpAPPKsJVmTmeGyiA22PDvPQdDgNeGFapCcLXE9/Wq6AX7V8TLRYxC1yUbsedjf2m
         vvmZgV3wdf9pnSPaQFHTd27yw0U5Ft/vw4/PP/qlhAC6gfOzXeQI/h1Vsw2rt282YYo9
         h9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020103; x=1718624903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJrhT4z/+SEXmZZQ9t1aIgmTTofzN0MQlnz75vfH5XU=;
        b=OLlCWDNvjowqmiT4m/Kgc+YtzODzCmSLCWX+2ELoT+Ba6ZasT+XTawSUawrfFYfWsw
         U2LL8271jXFCXOAb3avS7tQVOa+0cHPtoofU47SQdJQ3FH/v6N+H3AZ62GEzb63g1l5A
         cFjgi/9OKFseNGO8rBLJD/HUyj3LMw3RId9RC1R3BwOoc2A9JR/y3rhhMEpqoSt1sslT
         N5utJVj6vvWXh4BOHjJW5pYfo5ylaltysPpC+i5alD2WNskTIYwF2cq8QIReFWVIoNM6
         IYuCr8N1+56asbEgSEFT+Mr1BkqahUSSwQtqRDjOivdPZ7XJkUY2EZ1M449fpir1TkSq
         PWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvuZLA2toEZB48mucrwRyH4VzF407TTx+ISVXCZG2f0/jbtRFUPRMMfeglcO5kScy9rLBeeLu/tNUlxJJhXMumpJmlrxEmeUZFGAyVHx4=
X-Gm-Message-State: AOJu0YxWuXGedqsEuAtFCOMCt+6cuK1pN5ot97O0wOx4HZrfa/5c4/i9
	HLYmMVn+nghkmj0JYXc3xJYmzlgHJmm0xQH4tEopL4K3CCGyyzyjqN0rnqSS6g==
X-Google-Smtp-Source: AGHT+IFKyOjlVdZEmvu/S0b1lQUYM7ukMFhSo287rIk4v1Z7axronyTecLutUNmD0nMcwp39tLHBUQ==
X-Received: by 2002:a17:906:3592:b0:a6e:f8c1:8395 with SMTP id a640c23a62f3a-a6ef8c18434mr455730466b.9.1718020103045;
        Mon, 10 Jun 2024 04:48:23 -0700 (PDT)
Message-ID: <eee43358-b8b8-495d-94b7-0e1bb9c1cc1f@suse.com>
Date: Mon, 10 Jun 2024 13:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 05/16] x86: introduce using_{svm,vmx} macros
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <9860c4b497038abda71084ea3bce698eab3b277c.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <9860c4b497038abda71084ea3bce698eab3b277c.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:16, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,9 @@ extern bool opt_hvm_fep;
>  #define opt_hvm_fep 0
>  #endif
>  
> +#define using_vmx ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx )
> +#define using_svm ( IS_ENABLED(CONFIG_SVM) && cpu_has_svm )

Btw, having seen a number of uses by now: Can we consider making these at
least function-like macros (with no arguments), if not inline functions?
Imo that'll make use sites look more "natural".

Jan

