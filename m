Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64502C88E72
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 10:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172393.1497468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBho-0007wF-Lr; Wed, 26 Nov 2025 09:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172393.1497468; Wed, 26 Nov 2025 09:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOBho-0007u2-JE; Wed, 26 Nov 2025 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1172393;
 Wed, 26 Nov 2025 09:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOBhn-0007tw-RP
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 09:20:55 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34d01750-caa9-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 10:20:53 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b3b29153fso3540420f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 01:20:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb8a29sm39871609f8f.30.2025.11.26.01.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:20:52 -0800 (PST)
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
X-Inumbo-ID: 34d01750-caa9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764148853; x=1764753653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PexXMoi329RzGdhcW0xJ8ILoj2E+UH1x0iYNyq8oxZU=;
        b=OTyuJ8TXz1VjDBdkTCcU7N3lDALBtyLNtl4ZeXIYOTcLxEVMe+AghyVZvIe0fhwuoN
         R3peiKK2uIky5leZLsV2X73rorJnf8w+FEJwYFvkbeWicpF3ixd5KAqv+KLwhgPHYI81
         us6Y+frpgB6nWqGgxnj6FEVoE/ehnRwgbY/KbKWednvswI5n3sj2AR7o7tub25t14cYm
         h6bEMpXbPPnyk6OBJbcOWdWYDeRHHB2y2aO/1Il5RqlKhIIcfRp9e4cPtAVddgjyIj+m
         BWTL1gVckDwht8DgfCAKmpdSXt3lWctfGO93m/lSDxw6NaHCFcnggGc+lUMf7gKpJKqz
         z4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764148853; x=1764753653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PexXMoi329RzGdhcW0xJ8ILoj2E+UH1x0iYNyq8oxZU=;
        b=vGVAT3NP1ls/HhOwolcAHFc+kAdFi6XhXav8ILaJ03lhKfxT5paZYCTDEmzGrZDQJ2
         eCfmnf8lJwJcmMn4is3RnsCdZbDtmN1Luj/LGfv8Hkw3AYlO5D/ohjKbEX8lKaSP5B6/
         CBsOixpcBy1ZbeNIZwJXS7s1W/PDVKEoNZU/Iy5jmV5qPlsYWGD/xvn317oRqyq+SPe+
         NeG46AJXUU3paUW6vdGnTc0kRb84sxY9dseaH4zjpYmEQB626QELHxTacwCo1+KCEKIB
         ImWZCgug84g26VehZmc5F/d3Su1s2uwbmtU8wb2CGfWB3yrFPxBf6x8jsDVhjTWyE1eA
         B4kA==
X-Forwarded-Encrypted: i=1; AJvYcCWVrVAbiVDI5WlvqSTLwrvC1wGCgLisFgr2gybMudSaHeZOXYOVu7eanOe6w9GHqPtbTBNJ8K0tVG0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6Lu61QtzojZp2w0mccm29JA56qRujXAXCOjBg/cE0Sm68anDi
	8dPaQ2Osu0BywSwWq4qpV6pJbTA9MIjyJp7jefV9dGWKXT0J1lcjliobMJM9DL5zDw==
X-Gm-Gg: ASbGnct+lodEOolGzN5YXzFZWarhoxcvbDwMCURjhEIoVgjd9y8Zx/lXIa1dgZg93Q3
	gmQa6vxaKticcvHSz/RoePmUC2O5ROSrlhYAyVPVaP197skMPYIATMA+0WvS+RMnOgGK25FPIdP
	UEouRl1z07Cal1hLQLChquPTTGoLVRQS88ktnBEfG5NZu6gx57hcIJ6NdFzLHrbVqy6/me+Knhu
	0Dxg8faCNltxOhVcr9VI00HQ2MGQM2NP54P9AN5duR1qHL/pSKQ0TfTBZLVCZcER+XxCXDjiyDS
	4NMX+0iyNa9O0Zfz+Aj4wn58PAVe0n2uKesfU/M0ew7cgMnB09yYMgd8Gl7syoLsXe3xPSX9Saq
	uul2Ijb7o2xz6T+uLqPjcxdvs9KUT/o09LJ41Nsj4cWNevNsiBQThnljoXnQpOpPJEY3Kz28rPn
	nyhWJkAtBTVJRLGdGGf5HVN8MZBaGdHfmVHounu4aN7B3GPt/VXAJCuBNiv7ZUgd/pX/hvOOYBa
	5LQpBn2LhfbLg==
X-Google-Smtp-Source: AGHT+IGOvPgeLU92P4GytFZhn66JKH755enwLSliVvARh9R7iZIzchNDGXNnr83jP/5dfTFZxhgrqQ==
X-Received: by 2002:a05:6000:4028:b0:429:c4bb:fbd6 with SMTP id ffacd0b85a97d-42cc1d2dc3amr20519428f8f.31.1764148852703;
        Wed, 26 Nov 2025 01:20:52 -0800 (PST)
Message-ID: <6f9d00c7-8304-4d80-92c8-f134cceb01c1@suse.com>
Date: Wed, 26 Nov 2025 10:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/24] xen/domctl: domctl_lock synchronization only
 when MGMT_HYPERCALLS=y
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-23-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-23-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> Helper domctl_lock_{acquire,release} is domctl_lock, which HVM_PARAM_IDENT_PT
> uses to ensure synchronization on potential domctl-op altering guest state.
> So it is only needed when MGMT_HYPERCALLS=y.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd like to note though that ...

> ---
> v3 -> v4:
> - new commit
> ---
>  xen/arch/x86/hvm/hvm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

... with this diffstat the subject prefix is pretty misleading once again. I may
take the liberty and convert it to x86/hvm: (and then also add parentheses to
domctl_lock()).

Jan

