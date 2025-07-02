Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD15AF5B81
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:46:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031296.1405103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyil-00034q-W4; Wed, 02 Jul 2025 14:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031296.1405103; Wed, 02 Jul 2025 14:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyil-00032J-T3; Wed, 02 Jul 2025 14:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1031296;
 Wed, 02 Jul 2025 14:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWyik-00032D-E4
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:45:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 421592f7-5753-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:45:55 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3363969f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:45:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f1c40sm133395235ad.67.2025.07.02.07.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:45:54 -0700 (PDT)
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
X-Inumbo-ID: 421592f7-5753-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751467555; x=1752072355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lbvJxBTWTxJWwOTcpiT97kTKrJ0t2iwHiijlYMeEEzk=;
        b=DTFro3DddMS0H1/8rpEcdIqgiBt3U1e351tXQYFQlI2zWGGf2H+Wa1Y7/eqnTRjHvu
         g97NYWLUjf16RwZDvq1hCDFJ18wMe5ekW+lQ4+Nzh3wCW6JLL/sIk9vFe6jDNvncEBW4
         bqDFIOxaSCuVT1JRQePcYHwt1CCp6fBhIKcJMHw89VSDr0r+XcoE4T8TJvUOywoon1Si
         lGoZ9/T/J2nN6EapAMGi0JJVVo5Ca6d4es6wQztK27eu6znooC1uXSJFSg/D5H8zuY94
         b0dEFdpao7KUOrC5mD/1OBJ6myq2/yiPeUgsxzCb71fY2oWZ4PSFMLoMHbCwOO6stDJH
         RGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467555; x=1752072355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbvJxBTWTxJWwOTcpiT97kTKrJ0t2iwHiijlYMeEEzk=;
        b=EqRIMhdcLHlATiRthRQ8QKCC03MAgbZ6JV1UYMi0tmkKeaTz5izow/co2f+pkhjFW0
         j9asR3pzsTiaI4i87k/WIsQUEgSr70Nd2TxPCLvXFRVooNXkBLHpo3owxUSXZq5dvGiC
         nADbIoD4QG4f8xLSbt5H3LyRIaIY0ZPZ2H4UKhu7OE1NLYjxb+TO/hq9y4Ikc3PfKFiL
         bEh9Qhq5naavR+k04W90aVcMsYeJvx5MEWvwUZk1DSJxMwrNWbVmpSxon5wj7D0OVqzR
         y9vkrZyfunsRhKzS5lnbxxdCxLKo8TMUekhdjEvLHR0CisgvTvGkis3pOmpL0eIquyI1
         5ubw==
X-Forwarded-Encrypted: i=1; AJvYcCUj4hk2iWdYejMYXy5GD/PfiEC/ZWbrzBDO1UGa7wh0xpWV4IHdhfWQ4GnBpvdvh0KX1IsPhh3MjpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ18uD4l6QtY392oIWhqbDu5aMoiWMqdiUo67q9Sq5KbvshsBE
	xfndIA2zeoiQT6qHtI4c9dR3yZ33ixudwmoIKgrFc9sX0e7kS5U6pxVtd/2b8tBoYw==
X-Gm-Gg: ASbGncslISVZq+/MzyxjLekPAIbj4WfmcJCRVTKKcYEB3sfQIZCgPE4nZxYoZgCQRAZ
	yDEbNmfjygf2EHv9M3ShXEDAxm+wrYH7WLG25NZPYp3lpv7Nnm3hv1TW/VXXwdLofYrVAhZewY1
	cdiTUJAynb5j3QPkNEC0O0QmTN9zus9m/uVU6Ij1LHMd333FoLzBPDr0/PymiUz+KttMSzZgYau
	RxK3WYw0XmTPMC1pZIS20RcUZzjngVU3T2s15/LG8jFc3znedO44XOq2rYALuqPRbHE8oOKIuSw
	j2LQ2VlfEiGMi3SIX19i64cC54U+XH5cXWoA/qpHTSzGJUKAipsL2vLUhebxQpNenqF59iDxr0O
	xEPqpG2tU24NXC8xi8dzKrm4bhbYgqahmqEvL6p06zhiGum4=
X-Google-Smtp-Source: AGHT+IFxYrh90fzWazw8hru55Y8f2EHobGU7ifLXxJG7BRhvnbA+gI2+K8jnurwZr8dQSoiVreLrSA==
X-Received: by 2002:a5d:64e3:0:b0:3a5:2e59:833a with SMTP id ffacd0b85a97d-3b1fe1e7cc0mr2706395f8f.1.1751467554567;
        Wed, 02 Jul 2025 07:45:54 -0700 (PDT)
Message-ID: <06dd48a5-f9f8-4504-b580-e9609dedab27@suse.com>
Date: Wed, 2 Jul 2025 16:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/22] xen/lib: add implementation of SHA-1
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a63da5121827a25189db4704326addd8dc10aad6.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <a63da5121827a25189db4704326addd8dc10aad6.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> +static void sha1_init(struct sha1_state *sctx)
> +{
> +    sctx->state[0] = 0x67452301UL;
> +    sctx->state[1] = 0xefcdab89UL;
> +    sctx->state[2] = 0x98badcfeUL;
> +    sctx->state[3] = 0x10325476UL;
> +    sctx->state[4] = 0xc3d2e1f0UL;

->state[] is an array of uint32_t, to the L-s here look inapplicable.

> +static void sha1_final(struct sha1_state *sctx, uint8_t out[SHA1_DIGEST_SIZE])
> +{
> +    const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
> +    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
> +
> +    __be32 *digest = (__be32 *)out;
> +    unsigned int i;

Please can you omit the blank line in the middle of this (not overly large)
block of declarations?

With the two adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

