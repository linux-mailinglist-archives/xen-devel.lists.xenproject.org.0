Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70B3AE5C12
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023086.1398987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwaj-0006qu-K8; Tue, 24 Jun 2025 05:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023086.1398987; Tue, 24 Jun 2025 05:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwaj-0006oK-H2; Tue, 24 Jun 2025 05:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1023086;
 Tue, 24 Jun 2025 05:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwai-0006oE-3y
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:53:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa6683d-50bf-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 07:53:06 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso8914f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:53:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535e9844a9sm165777755e9.12.2025.06.23.22.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:53:05 -0700 (PDT)
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
X-Inumbo-ID: 7fa6683d-50bf-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750744385; x=1751349185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GByEpZ7h9aA9Uz+2nf0djki6A3F5D/O/zjRClaIujIE=;
        b=ec85ok+fvucrUwae0TsqiZxlv1nscKAzLmtxbuaseMN3F5ye3xZ5Q38zOqFrZE5j9u
         Q4tBFPzxYagmNny6RK063BYhz+Ypt8oNjyrwhYbEhDcH+yEv5gS5rEuRZZ1fThm8240X
         +tGt7X/0ZemqmGkql+3DD5MrjnT8bB8U2Qj8mlkAOCNXQ/ixsCiVW7P/sO7/h62fOn6G
         bCQR/u5ALoWZjNtUGnEJ7ucFMKZMAql2ULb1yQXa7dWhh54C7ct1IY7hl0GlmUkF5Sl4
         n7GczkckBzkCgguvCenyUuzeO/P5d0rKeYd6OLQDRZz8JOA4O9NbjGYLW/DlkOaAnc8+
         /5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750744385; x=1751349185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GByEpZ7h9aA9Uz+2nf0djki6A3F5D/O/zjRClaIujIE=;
        b=Bah5Fg3atlNrUHLsIlt+QLdRkVdfTjKEwOI2ueyh7+/MlT/9EbP/vzjdMoLfwkE3BW
         qE2gj8wIEyNFuhTMfDPwDRZTBjz0WbCW5BBW9gvZTbAseHzH6rEX3tciCNbE6X8Zj12A
         ZgB10XevVn8ErIN/mdBEMwVDv+tPebGxKvW4x6Vby8XFrIjJYLv/FwBy65hHCuQlP7mP
         LnbNSwYIkBDH3QZmA4rOkcniId2wd5f67DqGfE36YBBooAojxvmKEA7BgfpEJcsDiU/J
         3zOtY3iaXOzrlL6bTkfby6A+HsFDMa308WR5B/uZf7TBEVkHLMD+tjQJNM78AoIAh+X2
         3VrA==
X-Forwarded-Encrypted: i=1; AJvYcCXgWpiDK7qzRFd8cbukdtx1yBHFRmJJhb8jPt0XFqKxWHv5S24AwERZ0viMmj85CqL/bFJs+QHWZrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytxn2vwZE0EjnkfbhyKC/etP/7Nh0s4DqK6E1PCZnql+l/tpIo
	eOcG/s1SAeZccXqyGruVW3GTMDMIM1OoD15STV0Z1IhanD6cdR2kuWC1dxoeDfee1Q==
X-Gm-Gg: ASbGnctvMMSbPIRCfNd3D58fVBD8h8+2cZ23cKDkRcATWSbxUpEE/23zRmvl4+l6880
	qjI51H6sk4ZQS5+TRZUiagxGLK2YIyO0Bf0+WZpbv2tMItIDiIYY+rAThHZx1Lgy6sQcWf+g7k4
	HY3MhugaCeS7qFJS6rUL6ug0+DkX5ja607EDg2njBlFM5YEXxMW42xluRyOf5XgIYZABua2zxEQ
	bXtDWvdFWOwQisDcm9wSCzFlfhB+cetSWQ8xU89OJpYfwwh0TEgXoAGLMhhLugK1yyy/0l/Kh0l
	EBU3Am5zUO8LlTmY8GXF0Nv84kFxeBsv1gV8/5koDl77Blz3JP6cycppchMTOtmwy5P+GUAccGh
	R1MtHw/pFwDbBDHeGx7/IO6jcmHZHZxmzoXO9STMopfuEJYSf9h2SwmIFITWERY2zORrAJ25ZZ9
	WQOfLRNhQSphLIdAROuA==
X-Google-Smtp-Source: AGHT+IHqLUP1YAhCSKk9yznJRi8SBcYoZiSeRnXJI6JTA/JSFqighhMNjXJnpc4TdPi0aSzr11LUTw==
X-Received: by 2002:a05:6000:2307:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3a6d1322b53mr14027852f8f.35.1750744385526;
        Mon, 23 Jun 2025 22:53:05 -0700 (PDT)
Message-ID: <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com>
Date: Tue, 24 Jun 2025 07:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART
 emulator
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-15-dmukhin@ford.com>
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
In-Reply-To: <20250624035443.344099-15-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 05:57, dmkhn@proton.me wrote:
> --- a/xen/drivers/vuart/Kconfig
> +++ b/xen/drivers/vuart/Kconfig
> @@ -3,6 +3,15 @@ config HAS_VUART
>  
>  if (ARM_32 || ARM_64)
>  
> +config HAS_VUART_MMIO
> +	bool "Simple MMIO-based emulated UART support"

Perhaps in a separate change this should be renamed. HAS_* should never
have prompts.

> +	default y
> +	select HAS_VUART

This is questionable too (for still being controlled by a prompt), but
may need to remain as is.

Jan

