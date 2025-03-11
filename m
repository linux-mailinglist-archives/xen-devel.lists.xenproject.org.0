Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3DA5BAE6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 09:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907390.1314622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trv57-0000pX-Aw; Tue, 11 Mar 2025 08:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907390.1314622; Tue, 11 Mar 2025 08:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trv57-0000mz-7u; Tue, 11 Mar 2025 08:35:21 +0000
Received: by outflank-mailman (input) for mailman id 907390;
 Tue, 11 Mar 2025 08:35:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trv55-0000mt-7e
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 08:35:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c259f518-fe53-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 09:35:17 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso2533246f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 01:35:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01d81csm17614697f8f.58.2025.03.11.01.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:35:16 -0700 (PDT)
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
X-Inumbo-ID: c259f518-fe53-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741682116; x=1742286916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9gcX1TXYCg6ntY8ksYwFPbVpOrg3Qrl+xl8TA5paZNE=;
        b=f6EHM3E2qiNpjKZqjXEHm+vUNA87AhR5nz9VPMnofY4WUGkeVk4afdmiwYkFlLZY1Q
         cNFqRCDezxZo+LhjW8TP+0D3pHZ0BQMnNo8sihh2WyBBMyG45QTOZWf7N67w8zvhnAti
         46PUorvOBT3JdTAoJmqcz4e7PQ+P/pcXSWq8iRMmP4T56flBFP6VN6hWH5N2n2hXpaMb
         EKL9K47U91dD84vb9MzFmspkmEwohL9BFeS6UohwNZ/F+VuGMSg7UWcz5Kk4alY2uqwj
         Ld5618CQjZ6BNJQl4FWhaLak6JvlFY9+m6IZHXb/zmf9fSRzvF91VK+eFtlDP788IUGu
         Owng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741682116; x=1742286916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gcX1TXYCg6ntY8ksYwFPbVpOrg3Qrl+xl8TA5paZNE=;
        b=TVZ8mhm2ne/XBP4I8TJH8CwpMs7pgw25BRXQNCAz8+6YezLrlkdxNIe8J8sSe1uNjP
         V8Z+ig1tBtx2AgEMMhbJ3M+xFUBXDP3DjwJxIBZQhO7IOF+KeIHLWDvZM6LPwrLOll83
         NqyQTnDbiZGgf67RsmSs8XUPlL3Ncoh+wVh9NZOK64Krv2/kRwzitUz4Fu31sq+YcOvR
         wKpH0b5WSVtfY3M8IYfMKcF4J6iK0CgC4NpG04Kyy9mkeyogsOBlHWX6uIsB2IwFvFYU
         JgrJuEkx4DCm2atWOZzobmEKKYkDO8BHeVafjrkHzcPi0AtzckvUYdA9pDWrMuYlhEir
         eh/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGIa2J/G6c0FtoummOo80fXSocGmQsuITfLtbvXg2gSmehXMJvgAHGjxWpdSDdRjgHRSUMQNg4T2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypy09gUF+rwxSFwnd9qO8nLLWtyd9yFhFMqwdcnAcVMwuYXPJB
	rGo3h/XS/slU0i1bWtjQFVh6xtma2RQryO9q6UPK4nW9qB9yh7EulCn+xKiFWw==
X-Gm-Gg: ASbGncts6SIpgvq5wKshNS4cRZ7EzAvTOQ5U3mDYmNJTa2W/RNgI6/VW90YrqWBYWp9
	YMKv/9Bm93U1Vf10+Hy0+e3kM4UUyDca08Qy+rkBXeP9V+ZPy2irbpopFsDfmJhUTwSGUH0XpsE
	8cbkuIGRcf7KL0nrC1matPWCnvopDWudFAHjIyfE06l6HOLPzAe1uMFp59dVcJ/noaJ3yVmNlS2
	bkS5lxfvksuHnTxkaym9NXv1yBtIaEqHdXFaBAJ2dDVNDKfjxJS+/l9vL/vSG9DhITPg5hj0dqZ
	YdORsgU5OQB307heRbLE4zMdwcr6qHvIdBQgmXivUcrrwfA2XPSfc/btBWgvxTMcmABYXnuce3R
	kEm/ShqVUT+2k5/vK4hMnTd/6/JbhnQ==
X-Google-Smtp-Source: AGHT+IEhyAST5rhVuek4aVwecZSOvF5fQ+vCnY/Iqgg4bF2Z0bOvERO7vKt6OVthSEUWKa0YIGcrQA==
X-Received: by 2002:a5d:588f:0:b0:391:1806:e23d with SMTP id ffacd0b85a97d-39132d7a3b6mr10788909f8f.6.1741682116598;
        Tue, 11 Mar 2025 01:35:16 -0700 (PDT)
Message-ID: <83f0a115-1a14-4992-91ea-df354c5176fd@suse.com>
Date: Tue, 11 Mar 2025 09:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen/arm: Create tee command line parameter
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: jens.wiklander@linaro.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <9313ffc0cf2e8be7e39ba24e8849a27b6bae2526.1741617888.git.bertrand.marquis@arm.com>
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
In-Reply-To: <9313ffc0cf2e8be7e39ba24e8849a27b6bae2526.1741617888.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.03.2025 15:50, Bertrand Marquis wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
>  
>  Flag to enable TSC deadline as the APIC timer mode.
>  
> +### tee
> +> `= <string>`

This wants an arch restriction, like we have for other command line options
supported only by one arch.

Jan

> +Specify the TEE mediator to be probed and use.
> +
> +The default behaviour is to probe all supported TEEs supported by Xen and use
> +the first one successfully probed. When this parameter is passed, Xen will
> +probe only the TEE mediator passed as argument and boot will fail if this
> +mediator is not properly probed or if the requested TEE is not supported by
> +Xen.
> +
> +This parameter can be set to `optee` of `ffa` if the corresponding mediators
> +are compiled in.
> +
>  ### tevt_mask
>  > `= <integer>`
>  


