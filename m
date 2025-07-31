Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9EDB16D44
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065005.1430344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOPx-0008GI-4G; Thu, 31 Jul 2025 08:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065005.1430344; Thu, 31 Jul 2025 08:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOPx-0008DB-1A; Thu, 31 Jul 2025 08:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1065005;
 Thu, 31 Jul 2025 08:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhOPv-0008D5-D6
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:13:35 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ad31b0-6de6-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:13:34 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so521864f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:13:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976a06sm11219495ad.81.2025.07.31.01.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:13:33 -0700 (PDT)
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
X-Inumbo-ID: 40ad31b0-6de6-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753949614; x=1754554414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oPqkq7dhWhYpM3wWJ1B4j0IizVrA1foHRWdm8grjYz8=;
        b=PJ4CRdVWFGmVVhgH/OAvcCJq7KJJnPvhLqNVL9/3TdYAfi0uBvDJ7+SOlXC1S9qoAf
         SJLNeQoMwLlIcOCh9V5oi/kuy0DqIj58iSLMrbfwOFrFHKZFHW3flNvIrwEx0nudxJx9
         VgV/yL85V6JQ/tGdXQUt5ta9Utdmc3YbDl1V0nh+0ith92SjzB/1dJejYaJSdymm+oFV
         +QeLzP6382ICGEvXFjuvVGy1H6XbUfGjmkkiBGWzzUmwa4ROuIxd0I7mCH7lv8TeYJV0
         PYXUF8jwbsHBupRVmhypjVkjTC4y6ZVdbEFUKyZDcxp2zHXX4QVotXCtNhFFJJkHDd5P
         GPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949614; x=1754554414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPqkq7dhWhYpM3wWJ1B4j0IizVrA1foHRWdm8grjYz8=;
        b=sCqJ1QUht5GwuS1ChglsMIZxqzpZ10tcFK4gVqUn5XI8H2/Jq0sFzCM65GGk8flTZB
         LIH6RxMsZ4ZmFNq0Ay7MLUMJ9ePPu+tlgvwgDKMDjseGMqL9jbtfT7z9JmLtoExabti9
         AeZPWXlKrKmW/yAgtNPS2zEtsoKM/4lM+uP23wb7JGZvvPtGPUbjs3WnIgUgs7mGOGf9
         ZhT9rYuGII0RAMMOnO3LApe7rOl6UrMsv1kIHyXEbYSc5kpa6/RFtEOSbLRNsZm2Zt+J
         6FvvpgDN2kguWVD6zVDWIQUTdZIubW2KpZtOdJSfx+jhHJ0PhQ1j3gsNGNi3f1umhbJh
         fcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBaGugEE5/HC0gGhsjzOhkX23rQr75v3kRbtUGy8Au6S4VEi1mvdgEkd0NNiW2J63VQHTfxwUnRlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOFmB3gcGs00Fh4iKyOYLW+tkErZAeWJxZwW7yxSmGXlGIce/r
	8MsSyd/vVIzr2S6N3ryROfme4BYPDXfpK0u4mJ9EtIVHckcyOP+KnwfjeeeBrrHKHw==
X-Gm-Gg: ASbGncto5ws2p3arxUeYHhaJbxBpaRG5GJKqnGxxeDdfA3gBg5uxL+9piAcoSp4v14T
	tK5rN/Jqg1n3t3d9y13Tl1HwcJIIeTyJuQan+GxVDX3LOE+n9v8X77d+O0VSQ1Y6P8EUQsFuObP
	weV9o68nXQfQjTbf6yYoZD4Og0pGrbQJSeR1bMqD1Sc/YONI37XKWPe7bGj3uOEFpWo9ERBqzcD
	D+IETmbanu4qd2FTikyY/5Dlwv1RfrCBkr9bW/pPk60feu2E/XcWBXChTZu4QGAHnpWCPpbaDGw
	q76zk/mqdFSBrp8uYARagueZ5bZE6iutzn7KiTbKWDlybula1DsakCCWUeAt3NKi/qp0mgmv0Qz
	u1wslhJ2pCTUA70ctTiS2apfEaz0khb3yzSGCSh4xTBUxlA//+P9krPw/LrzS7rIAByNWq9hyq0
	XRo4ypj1Y=
X-Google-Smtp-Source: AGHT+IE1o5DILGphlYvTqfiew9T09vTFyEkQCi4nbxG5a1s76ZTIfeImRhPrzboPApdtYArdiBMc5w==
X-Received: by 2002:a05:6000:4305:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3b794ffe750mr4478552f8f.37.1753949613793;
        Thu, 31 Jul 2025 01:13:33 -0700 (PDT)
Message-ID: <06d79f28-9710-4def-9a87-1dc478f7902d@suse.com>
Date: Thu, 31 Jul 2025 10:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Fix HAS_PASSTHROUGH selection
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250731080522.810468-1-michal.orzel@amd.com>
 <20250731080522.810468-2-michal.orzel@amd.com>
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
In-Reply-To: <20250731080522.810468-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 10:05, Michal Orzel wrote:
> HAS_PASSTHROUGH should only be selected on MMU systems. It's been like
> that until commit 163c6b589879 added possibility to select HAS_PASSTHROUGH
> if PCI_PASSTHROUGH is enabled on Arm64. This is incorrect as it may result
> in enabling passthrough/ build on MPU systems. PCI_PASSTHROUGH should
> depend on HAS_PASSTHROUGH instead.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

May want a Fixes: tag, based on the description?

Jan

