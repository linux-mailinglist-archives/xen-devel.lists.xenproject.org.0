Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A185E8C6A22
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 18:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722550.1126632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7H5O-0002YS-Jg; Wed, 15 May 2024 16:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722550.1126632; Wed, 15 May 2024 16:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7H5O-0002VJ-GK; Wed, 15 May 2024 16:02:34 +0000
Received: by outflank-mailman (input) for mailman id 722550;
 Wed, 15 May 2024 16:02:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7H5N-0002P9-5S
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 16:02:33 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860324cb-12d4-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 18:02:26 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so197292966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 09:02:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cd627e681sm93257066b.150.2024.05.15.09.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 09:02:25 -0700 (PDT)
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
X-Inumbo-ID: 860324cb-12d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715788946; x=1716393746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wtYr/WbH2LhECipyaU9Fs3pn4IHaginS0y/0imMygQc=;
        b=Q3UXiIq1YRqjqqR4rH2/fzqf85pCKAEMybMO35aVvmXpzNL5EufLW37jOnM39drI8g
         Do6ZQ2l914Su1Ua8estta/+MGuEBVJ1xY8XJRvxlK7Nv6QPLev8tF54SXTN5gqG/Inj4
         n/pYWgqZhYfeUjjLuuPKLlZ1MaARK1OgElNSvoTGGsU1JcyO9RkpjEaXLpbRCspBnbmq
         q89ZUA/JuJHP7wNBCpT0CF0l/bbwfqdS9t5gB3fUsviNLBW8sYMa7CjF7XLVAouJY4JW
         efbs9OwIgPAUiAi39rRq19r77cm9I2w2Kb+Oyz04oOBdjCZBdLBCts14NNhzKb5gQmsf
         13WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715788946; x=1716393746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtYr/WbH2LhECipyaU9Fs3pn4IHaginS0y/0imMygQc=;
        b=rbt9it00focNIl6kpiQ29YDpgjCUQY8EoMLOBdihZ4t7/OGI92TSkUoFTvmxkvfA07
         6p+U+RXeVWT2SfqEaLPlQFutB2M9UIEjnlPJ1MmDdx4JU4BZr89fU2BKv07hNMG3bbdD
         CHOM0UlGsptkXKgEsp850P4uj8wL9OXf0DsG5ggpLgJvkVx1RU4IRqGEwd1h9l6SJlRu
         ctoYqmGHynOBb/mepYpdo2wLRA9OnPxFMvePhdbuGV2xkcxh2xdTNSuQgcaOe54SFXf0
         w3kcvYyV3MUPpvq9kaNtQw4gVnTzGDmtX6E+YIXT/FEpkvAbPxK1Ak7rPznJNtakm5Qb
         Y5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXc9CPRleS3V3dVAjEwcOjrcV5UAGxc5tWQqMkW2pGihy8/CXMUaHXqg8d5IqSeiHSstv8IzZ5Aib84T2n9hsnE4HZSJuKzdHyFrwn0eeg=
X-Gm-Message-State: AOJu0YxA9tPa6IJIg6/Q61vliGQujyiHcXZ2mSZeTuXE0uxSusYKeyo+
	Ry+VF/wHwwajqFNJ5YpqGbK0sYhQs5aFNgQIEE93jvMfkIe+JYJsRvFJCsrLEw==
X-Google-Smtp-Source: AGHT+IHVeKhFzP79Ov6cJnYYB+OT4guvdNKwuLbsnCwBuhvHflzmRk/2bWqwvw/9oVEfUnEdVuUUbg==
X-Received: by 2002:a17:906:4f15:b0:a5a:89a3:323d with SMTP id a640c23a62f3a-a5a89a333a9mr373828166b.72.1715788945858;
        Wed, 15 May 2024 09:02:25 -0700 (PDT)
Message-ID: <03813fe4-39e6-4ac1-a6bf-eeda0eb6e034@suse.com>
Date: Wed, 15 May 2024 18:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 06/19] x86: Add a boot option to enable and
 disable the direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-7-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-7-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -799,6 +799,18 @@ that enabling this option cannot guarantee anything beyond what underlying
>  hardware guarantees (with, where available and known to Xen, respective
>  tweaks applied).
>  
> +### directmap (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Enable or disable the directmap region in Xen.
> +
> +By default, Xen creates the directmap region which maps physical memory
> +in that region. Setting this to no will sparsely populate the directmap,
> +blocking exploits that leak secrets via speculative memory access in the
> +directmap.

Along the lines of remarks on comments and descriptions: I think we ought to
reserve "directmap=no" to a future where there really is the option of not
having anything direct-mapped. Right now imo that option form ought to be
invalid, and only "directmap=sparse" should be recognized (alongside
"directmap=yes" of course).

Jan

