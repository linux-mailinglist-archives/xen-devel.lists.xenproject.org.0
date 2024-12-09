Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BD9E9BEF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851718.1265746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgnQ-0000fw-6I; Mon, 09 Dec 2024 16:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851718.1265746; Mon, 09 Dec 2024 16:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgnQ-0000dK-3G; Mon, 09 Dec 2024 16:39:44 +0000
Received: by outflank-mailman (input) for mailman id 851718;
 Mon, 09 Dec 2024 16:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgnP-0000cv-AL
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:39:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bab094f-b64c-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 17:39:07 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e06af753so2031205f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:39:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd41a128ebsm3353887a12.85.2024.12.09.08.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:39:06 -0800 (PST)
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
X-Inumbo-ID: 1bab094f-b64c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733762346; x=1734367146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IRym/k5ihUH0BNJ6NqNMOufR94ioOhx+BhzE3219cIs=;
        b=EdQvcTgTCazWTakUlgss4dmSmWwGJRzolyrXnb1t3J9rRuxYrCGkC9eQ1SxBoOhui8
         GivItVxJGarpLZbe9b4aO8Unw8NlzxNzP16PTaVp4L66txr0fuHuqw+1I/OLbJtDqZ3h
         bNk2SHUB2KTaDv6Ub6OxfHqriWnEeaFThHhqmCx0+DNaxkmo0A6JD4r0uDmhq+T18OZk
         ZO/HRNFYt61Gh5wk1EqW+mlpMTuA1BsGEvBsYMoaTypCmal+uICDjgE9kBFC8pZPIdP5
         TWZl0IbF+OHp4pkHeyonZ17c36wfpDhlFe1rt+W3A/M2cbp/WbCh4+t1oq/zCDRc526f
         +pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733762346; x=1734367146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRym/k5ihUH0BNJ6NqNMOufR94ioOhx+BhzE3219cIs=;
        b=jKXhZ6cXmLsc8mK2doiSSusfsdvdSZJZ+lXfx2FrqDAaJNcpbqYSIFWGSE4rFmuVbk
         6bzen+UMwBLfCJ0DM1gVHUHmVJt2J0uZnrg8aqx350LZ5r+FvCrvhrtS2ceHGk7tpG5c
         stC/QWT3VYmjhq9kAhMy2l/TJTYcvjFaeGb5xZpQqX5DRZsLvVahqCf6nu44tzmSUvTH
         5f3M1Wp4mFjm4w2a/Prtm7MGEoqNmDt8C++BpFTaK+R6KkabIOa0ss4ZE+U0COy7QAYu
         lZEgRPGpempF6OHgArOwerWYsdq2h8pljHGvSjaChZQasUErzBWANEMVIJC0GxeVHy5M
         z/zg==
X-Forwarded-Encrypted: i=1; AJvYcCWdC+SVNkH1wp4uqpXLU/93S3yyTwUdzOIMEZ7ew68Y/2uZmpwwvtia6KgEmIMJ8pvmen8Z4PnZQtA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxS990z4owTAWRgheM6bnLwmOKGY199/V3e1BoHs7rju+jMEmwU
	zZJDXvVW5oEszbu2eCznS/Guu6Xgr4Mjxz5VAOAx78bS3M4VBdTLA7T6/D3QFQ==
X-Gm-Gg: ASbGnctniSKRcYc8o8UJROSpKfYkbhuyk7V3emiW2dcLUig0Eu1eJhMCDK6K5l2lztp
	EWYIMoKjffUqPodkupo2+ddgFyhLYSCh+YrCsmdyeORu8HmS+2e46JNVDA9CcoVopKv0On13g++
	oEGD7NAzLXUgygpEqch8qihrMWJfGqaAaLbtQCgQHYjmqu6cHQGN2TKWvO6NMTOvsFby+wgXZ3s
	glvX5fmmPMUPVnNLfHfhXvNlzgCzetyGXoT+xu7sq7vbFWG0N9p7uUUS6LkziW1LnO/QnPhmucb
	rQrxfew8tcpt8/heeOK73NuVfnR5iyYeXi8=
X-Google-Smtp-Source: AGHT+IHaEJET1nBz5d0IFS/lbZC8mbFLtjmjPrnrvzrEHiVsckh1ruVKSi1kCtSWirZDXObHxAQGVw==
X-Received: by 2002:a05:6000:1f8b:b0:385:df4e:3691 with SMTP id ffacd0b85a97d-386453fe984mr938731f8f.42.1733762346558;
        Mon, 09 Dec 2024 08:39:06 -0800 (PST)
Message-ID: <8ae8a465-4f15-4ec9-b902-54a8d9448616@suse.com>
Date: Mon, 9 Dec 2024 17:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xrstor()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-13-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-13-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * const-ified v in fpu_xrstor()

Yet what about fpu_fxrstor()?

Jan

