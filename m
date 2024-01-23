Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1C83885D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 08:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670277.1042928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBdP-0000CK-KO; Tue, 23 Jan 2024 07:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670277.1042928; Tue, 23 Jan 2024 07:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSBdP-00009d-Hb; Tue, 23 Jan 2024 07:55:51 +0000
Received: by outflank-mailman (input) for mailman id 670277;
 Tue, 23 Jan 2024 07:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSBdO-00009V-RR
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 07:55:50 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d25e6468-b9c4-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 08:55:49 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso3016271fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 23:55:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a8-20020a029408000000b0046edc723291sm1426989jai.78.2024.01.22.23.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 23:55:48 -0800 (PST)
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
X-Inumbo-ID: d25e6468-b9c4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705996548; x=1706601348; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TcDZ9mN+FRhUYNa88zGuloBXNab4ChQevtTM4gkLaHM=;
        b=ZwvngqLAgJeYTHhBbNudAgSCyh5mBmGA6DGMxsSIUr338bNsfDTAv1B5YQAI1zZ+Uv
         opYyNCGf+oMXQ9somCsnJHmEM9qDuXx1XvftC1/kHS3JiFYfRGphMNAKhrq0TA2wvhx9
         ZNzHCUSpBGAUE7FE7n8xqpZw6MUdrynhTgXwhialxnNRhnq85qU6tTyx+1k3npXkLUN/
         fNodjs71G7mGFjuwBJXuXpT3pHqeA3EBmx0aJIXugXnj9vtG9gHOUMiQmXTqPHH9pXfQ
         /f5u+Pkq05ZUh8v9xutE4izEGDAqF6nAodzgQjtwn2kLmdu5ZpCqA0AIBwIMzwYvzk5H
         rhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705996548; x=1706601348;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TcDZ9mN+FRhUYNa88zGuloBXNab4ChQevtTM4gkLaHM=;
        b=t/SipWx6XpkE0+ERJO6eAx/TfGCFWTilfbSiUTqLOZW82AWXbgAJop8+oC8ORLlWha
         qxgR+qmXdw791CKBb/zUKczsAJwkx/Imk/GIhWAR79u3CUFujSnKOsLhofBU1UGtAyCC
         9HnOLfn+nYii/xoMXFzBwOS98hKjmMnLRuKc5zNOSRiFoFPbD/hQ/3UuW6BzVREfHfJL
         2rkWgNN47eEt63CZiASWW++EWLfMwnrOsv8XlhKOqVeTVpe506Wpa6dLcjLJoRlDLmSw
         aeAiMyPuhtmg5T8vlGHeG/sxAgfS6SNuIBhoSbPzw+1DIwqjRWRYxFrjmJj1pdEZ53SJ
         zTnw==
X-Gm-Message-State: AOJu0Yw4DAJyfbA42dM9WIlTJEoN349FSdCzTUJ5LjFQUqZ/l65sIK40
	6QoaU2LT3MAc+Isi1Tu3PgCPwzvFzi0SQPGnqhRO7IpXqlp9VQkyxu3Y2zYFww==
X-Google-Smtp-Source: AGHT+IGOFZkXrAicjcWyVjNqJjubZsBeK8Mb6x8RXvRNYGfYb5g2wOo5JsA3FPRz9L6sUcwYs42zyg==
X-Received: by 2002:a05:651c:b0c:b0:2cf:124b:a2aa with SMTP id b12-20020a05651c0b0c00b002cf124ba2aamr266588ljr.2.1705996548598;
        Mon, 22 Jan 2024 23:55:48 -0800 (PST)
Message-ID: <35ff4947-7863-40da-b0e7-3b84e17c6163@suse.com>
Date: Tue, 23 Jan 2024 08:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 80/82] xen-netback: Refactor intentional wrap-around test
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul@xen.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240122235208.work.748-kees@kernel.org>
 <20240123002814.1396804-80-keescook@chromium.org>
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
In-Reply-To: <20240123002814.1396804-80-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.2024 01:27, Kees Cook wrote:
> --- a/drivers/net/xen-netback/hash.c
> +++ b/drivers/net/xen-netback/hash.c
> @@ -345,7 +345,7 @@ u32 xenvif_set_hash_mapping(struct xenvif *vif, u32 gref, u32 len,
>  		.flags = GNTCOPY_source_gref
>  	}};
>  
> -	if ((off + len < off) || (off + len > vif->hash.size) ||
> +	if ((add_would_overflow(off, len)) || (off + len > vif->hash.size) ||

I'm not maintainer of this code, but if I was I would ask that the
excess parentheses be removed, to improve readability.

Jan

