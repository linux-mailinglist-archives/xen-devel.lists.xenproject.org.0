Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C5C88DFF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172383.1497458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBXC-00057F-Oz; Wed, 26 Nov 2025 09:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172383.1497458; Wed, 26 Nov 2025 09:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBXC-00055i-Lx; Wed, 26 Nov 2025 09:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1172383;
 Wed, 26 Nov 2025 09:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBXB-00055Z-9M
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:09:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab41b8c9-caa7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 10:09:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477632b0621so43047755e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:09:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0c3a28sm31432535e9.9.2025.11.26.01.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:09:52 -0800 (PST)
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
X-Inumbo-ID: ab41b8c9-caa7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764148192; x=1764752992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bWMDEQBe7EkF+9UMsX3KM5vptmQ1aIFjIW0LkpAV4eY=;
        b=bBQ14cfgoYvIWuNrv6GT/tv1Pm5v35SqLQi1Qv0UzXsbKEqPgEe+Q8a3cUyTPSc+Lb
         uvnCAXRSd4xhvnfn6JjIAzUFX5+w3lLtkwPgmnDng+i1MZh6heteNrPXdIXXQK6+BBEZ
         m5hfQKti2W+W9AbkcetUx9Xi9R89HyIlhSUV9gwPFkjnRAjU19Gori9Z9imeePWuenWi
         +v9v/CXnWSfz5C8xk8W7iwQMRE5SHsxnu1rUjd+t/YWtL5lCeYtvyyacAIy0RU6OhTa2
         ogcVybT2yopNo8NcwSmI39OVojshodYk27zhLUetsKfnI9NNMMBMZKDr/EkEun67P0yl
         16IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148192; x=1764752992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWMDEQBe7EkF+9UMsX3KM5vptmQ1aIFjIW0LkpAV4eY=;
        b=LsY+3WwDTVf7ayIHbDxoe1S3S7gyASCt9up5/dmZAlmS4ziKKfTbTp1+Ggtw/Z6fJN
         h3BOX6h3bApVa4GDgPJdVinK2QG1jOshU3x+SVx49f5ElM1/w/sd2K/hLGPwjr1s8pPi
         EYBpt7ZijPopQQX2NnE9DrDdswMOrU3ynid1/iyrTg/3HzeQLtlLUmBAlL0DIdaCo98z
         Q7lJ8ZrV5koeT0fr/eToXrcfBQEABTkepXKeKm4J0CRyrzJedmN+Ubd8acGEj0myKAks
         Y0S5buS5qBKIyAMXkq2zOq5iDi/VtaWDyouJjf+rA9/dXkThq/kdPKAwKNQ+K8O5KSdS
         2VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYdkNgGuKKSpVgXJcsSUsiY38nq456qIxI82lrTTSuLUlw0DV0pz+2YS7bzdKIu4nw3q68ZGsCvws=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy7ZYFVzmzq/y2F98MlYKh1nKIFiDHSXlllwmylGKdUm6aVX5f
	VlS0TAa5INCZSvd7kco8kwjjMjxOce6pvtJSqnhahBWsGNlERSQ59O5582yGkCJuJw==
X-Gm-Gg: ASbGncuOZHsx/M/1YY2XHvWsVIdUVUIpyX0SXlogEQZmr420Z5pUXopZdv4SeTqX5If
	0XKmug8MZMGfrirAQyavWPqH1/oUA5V8aDGaRSmL1zx231JM/5ft58h2DI6K/YN1KbVUGCnKwP3
	GUTcXfr8MnR+NF85J3kjsJ024m/GGnWL5u/frhb2Ha9VxmdU8jGLlRcLh2SHj5G8kiSG3kyiSlR
	sY4pFekt1XqPWtikIJWJhBZClIeCL16Uh4cgKXU4gyhupecfQifbBE/vumFSmjw+zP/cYqQ1Zfg
	iCO1qQLF3Knp0QAvXBcxE9sI55fsRAOnlu2tYc2MlIQqN+d8U9EhT6udo+osXFtfBd/lzIUXCm3
	PQB5DtY+mJsP89pDB8BvPbr3oYWDuQnvVGQJuFbgRAuGvKLD2jGTYka1g15ieDVCLQ+W6liHM1p
	lCyjo8Jz8IB1dN42MRs/WiQ2m3mqAwEudEmOQJkcTc4OZnbp8VkzDtvY0eKIy12FlZUTW0AhOh5
	xp3fPold1ILOA==
X-Google-Smtp-Source: AGHT+IG2E21puXEaO9QO8m24WvkiAFjUqdOFinoIgvDpetd36EldzKWTWIS4mT2eL0xaxD/3Of5VpQ==
X-Received: by 2002:a05:600c:19cd:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-477c1115febmr138445875e9.21.1764148192521;
        Wed, 26 Nov 2025 01:09:52 -0800 (PST)
Message-ID: <f60b3572-42bc-4507-be32-6a03f7fafe75@suse.com>
Date: Wed, 26 Nov 2025 10:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/linker: be more selective about defining LLVM_COV_*
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
References: <20251126081617.45401-1-roger.pau@citrix.com>
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
In-Reply-To: <20251126081617.45401-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 09:16, Roger Pau Monne wrote:
> There's no need to place the LLVM coverage sections in the linker script if
> not building with clang, or if code coverage is not enabled.
> 
> No functional change intended.
> 
> Fixes: 186c02e85961 ('xen: Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


