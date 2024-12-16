Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA09F3410
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858260.1270510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCiN-0007Pj-0m; Mon, 16 Dec 2024 15:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858260.1270510; Mon, 16 Dec 2024 15:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCiM-0007NZ-Sh; Mon, 16 Dec 2024 15:08:54 +0000
Received: by outflank-mailman (input) for mailman id 858260;
 Mon, 16 Dec 2024 15:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNCiM-0007NT-9r
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:08:54 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a91ef824-bbbf-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 16:08:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361a50e337so29282375e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:08:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801ad9asm8300655f8f.58.2024.12.16.07.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 07:08:50 -0800 (PST)
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
X-Inumbo-ID: a91ef824-bbbf-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734361732; x=1734966532; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oqMLKF6H5hfqx3MHJ7JN/4O+uWS/OoCWqsxL5O+4iHw=;
        b=bqw0jJ4IjyBrXtZe9tg8iQvtkn9DjHPkVI4i1Ux4boRFLsTGk0rV/ZKwGDRhZlmlHQ
         OgqB9DqWCqPh0Qv+8AJuFhYKXWJ64mQfS6FrYvnCTZstlnNQ7D41aoDDk4P0hhYzvxIY
         OfURjT7Ldh6qgFLYU6ZNSv9Ksu33AN63fjTxdN0+99zf57G/wi9ZFLnBau68xdbJuLK8
         ck/LN758/FoPcj+bf3Cy3ZlJJy5sAJXoCt8DupPvrrCXFwQojsGnCSAi4DFofz0aGpp3
         RveEx2v3tAg67N7tKuDmYPHkNtvvWSu3axewBPjKDZ27yJ2U1PiBDD2w8kfrMb13b6Vp
         CAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361732; x=1734966532;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqMLKF6H5hfqx3MHJ7JN/4O+uWS/OoCWqsxL5O+4iHw=;
        b=UNqkbLjatBq2/TtxM3htYcq3TTckL9pHKqyUxbmTWfZNPNB3jdyvfaq6vv311Y5pan
         FW+wbyop91iwi0XsKsH3QjPAKwAhdqyXxo1W3xn9VQvEclwYcOBwsm2jLoCAIPkGvEgs
         y7wFvimhEXbnA+nMYKxJ8yXALNEF4JufuojuSODQap08Ltvjg1yotkYQh0fdNuqMOks5
         QwEZVgxnDoZMx82xvXMDxGVIfCZZl60oi1Sj0zurzpCTNyP0PakN4cJKcOZS65R7bQ9X
         k4vEYsU7wC38lMarBYpiSqBJv5mEPTNaRaJUExgyut1BtOep/atWRFLPYIt9b2Fwefj6
         JCFA==
X-Forwarded-Encrypted: i=1; AJvYcCVdhmbm2Eehwvw9HCcWoJgv8HpLnNEoZIFWtMfW/8ZJK4v7EVemF7AjC+cX1bzjOgp5a7r21XPqnvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCq2tzjEgG+qG4CmPdLgTJwS0rvN8VhXJrBqPpbVxrYjcXlo2i
	4BVtm4xvDZreVOA6IcM0E6lW+ojCodCHmWAuSGSiCzilci1z9J1VCbpz7Ji7pQ==
X-Gm-Gg: ASbGncvVo4la0hRZ7P/RJQ97Ihgom5SaTZw4KACqx7/XLCk0DbPCbBQMJ10Z4sEiijN
	Xgk7bYr9KRsC3kXGUxvgnesuAwWTc+0vtpJzZAyc2OcDVfe+pRxUroJtq9gYkA5l5id6Fx9Azw8
	IL34ymPI6ufGp2DDH3qTwUzpsNANyFB8Oz7w69dqm/vk1Us4aUV4t+I7I6vkiQB0GwRtVSgri8S
	uGrpPMPHlmjUpOCHZZnB99b7nDiGg1VRpG9HJ5a3NFBYf0AiKxKFiyFUFYFGm5XPdXt4ihuj7f0
	j3mmj4tMtcSl5XOBN0PUAhCwQm3q1x3wa8xPCj08DA==
X-Google-Smtp-Source: AGHT+IHahP/FOSc9ewyKNmQFjGhManZ9NK/p5YRzgZ4YgLWUoPDh8VvyuThq/fSOg1f3LIV04fHlvQ==
X-Received: by 2002:a05:600c:83c9:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-4362aaa9625mr99934555e9.24.1734361730368;
        Mon, 16 Dec 2024 07:08:50 -0800 (PST)
Message-ID: <d6ffc431-34f4-46b9-b0ad-0071439ed3c6@suse.com>
Date: Mon, 16 Dec 2024 16:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/35] x86/hvm: add debugging facility to NS8250 UART
 emulator
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-32-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
> +static void ns8250_keyhandler_init(void)
> +{
> +    register_keyhandler('1', ns8250_keyhandler_show,
> +                        "dump virtual NS8250 state", 0);
> +    register_keyhandler('2', ns8250_keyhandler_irq,
> +                        "trigger IRQ from virtual NS8250", 0);

Characters for key handlers are a pretty scarce resource. I'm afraid I
wouldn't want to see this committed, even if it may be helpful during
(initial) debugging. Even more so when both handlers only ever act on
a single domain. Imo both want to be domctl-s instead.

Jan

