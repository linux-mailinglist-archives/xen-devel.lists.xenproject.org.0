Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78943AED737
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:24:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028928.1402640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9ok-0006ft-8J; Mon, 30 Jun 2025 08:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028928.1402640; Mon, 30 Jun 2025 08:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW9ok-0006dQ-5H; Mon, 30 Jun 2025 08:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1028928;
 Mon, 30 Jun 2025 08:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uW9oj-0006dK-2c
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:24:45 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acca3d59-558b-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 10:24:44 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso2121543f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 01:24:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b7d97sm76252805ad.172.2025.06.30.01.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:24:42 -0700 (PDT)
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
X-Inumbo-ID: acca3d59-558b-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751271883; x=1751876683; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X0BY9KYfXbvQrrOP5eezoSXtnhbg/TtP1duKZ9GbXus=;
        b=GR8OlixkBbjYr3tHM4sH8UnqSZ4GIsm5da7bCRFlVFiaJzLYJUkwxtKqaocfu9Ibox
         KKan7dE0anjIiCBD69pFFw3mxQSdMm6n6ZFw5+3xD1PglPQiNfysC2JmrtyohMhX0iQv
         RT6ZrbaYgkflu4RQ4QHU66y5cOzhfe+ucvuTZIRid8QXZcNuY4dJoyaFFyauYXmjHcqb
         rOAcAeYySG/2N5zUUOEHJFDT9jvjf46hZpGZxeyRjobCAZB1vjqJv0fHCtLygWO0d3Kt
         O4oGyA2OG0nk4PTUbtnmY2Bg1bQSDMMdxcgjLZd0rt6GWKxbk950aLymSFDKMpjxMp1M
         DgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271883; x=1751876683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0BY9KYfXbvQrrOP5eezoSXtnhbg/TtP1duKZ9GbXus=;
        b=lj0O9WcjgHWmCHjJf9yWbUUvo+54Uae+Lek393Yz279R049jzKkQagNyrgHyQUb2Vq
         YFjARYyjbPjzAbS5uZ1JpxmenKOTfs9IyDi/aClNMM5q9jez7gQkbO1wWUib4DewNzb4
         RYxToa3zZazRuVPjUo7mq0SHzQUC7txP+NwF16rGu9JKBgLrNHY4vQohYHFXBR8RW8gO
         nA8T6L0nuczXPXMqMK65R26hWjDu2i2x3JqJgFBpgAepDp/UZbktJ6jlGANwjHZfY3N1
         SJK73B40w8hNJHZn72WHq61MgMLv2Dp1OE8xAbNqvc15Truia9al8LKUtfJBmVleurMk
         jeKw==
X-Forwarded-Encrypted: i=1; AJvYcCUUB30UGT+7UK8XSg5rDUKnrIO9rhYl9tMIMXzpJWLSNQTF8SH2rnFmrHgy2lrOxuVUJ1pL/hA7Mbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHXHLs2yFuoOHvKqPGhvo0r0w5Dw9dmEnfzowBcP2+WYCo2v6T
	UFEh4qokMSert6R088pkgzWG3JdzQJ3cYlDQr6QU/RBB0267PNUVfvNfkaEBRPis6A==
X-Gm-Gg: ASbGncsdPWk8mH5+h/2EcrwrKrYddAkp+yCoKdmoYrL+0+I+1dF+LBMVX5vUgZhbRyC
	sLmpI/Ut4cZxjRd5AMImvzfv8j4PEjOvbdxxWsR7P3C7t2zoCVj0Bo5/fxTdQ7z8dvyobC0nnKq
	JHpPIOxMGnv3Ms20h6QmQsZ8CzdoVGpFOyS0tXVKHyZSO/ulynEohaUwM3CJDXD2hvixwfirw40
	SNkxTcLDJP6vyR80yOWzTP4v4FW8Dm/QEcqX/bLAuF7t6/f7cfimqbKx0sAugML8gKWW4Eyg8A2
	lZuKSAhMSq6d/D2BGhqfefr+thsDqnylxN6EtLgy9rYMBTZ0ZjhfGYjqsNrpnJDPAT1UeIfjoQT
	xoLcmNAMAo3f6xtPRSzMmGGLCnBQh3XVe8YhPyM49b85S/10=
X-Google-Smtp-Source: AGHT+IHH6MTbV58ZPZXZC8dmUQw06rT88YuPOWvlWp2fH0EgJABv6CqD3zUTvjtIhCC4Y1IpgyybsQ==
X-Received: by 2002:a05:6000:646:b0:3a5:8600:7cff with SMTP id ffacd0b85a97d-3a8fdb2a82fmr11325890f8f.1.1751271883181;
        Mon, 30 Jun 2025 01:24:43 -0700 (PDT)
Message-ID: <d24bf708-6a02-4ef0-99bb-fa642a8594a9@suse.com>
Date: Mon, 30 Jun 2025 10:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/18] xen/pmstat: introduce CONFIG_PM_OP
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250616064128.581164-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.06.2025 08:41, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -620,4 +620,12 @@ config SYSCTL
>  
>  endmenu
>  
> +config PM_OP
> +	bool "Enable Performance Management Operation"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y

Btw, doesn't this also require adding an override to pvshim_defconfig? And
the similarly for PM_STATS in the next patch?

Jan

