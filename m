Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27BB084C1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046147.1416378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHzW-0001HB-QZ; Thu, 17 Jul 2025 06:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046147.1416378; Thu, 17 Jul 2025 06:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucHzW-0001Et-Nh; Thu, 17 Jul 2025 06:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1046147;
 Thu, 17 Jul 2025 06:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucHzV-0001El-7d
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:21:13 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b61ec10-62d6-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:21:10 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so379461f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:21:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1e863esm2542116a91.20.2025.07.16.23.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:21:09 -0700 (PDT)
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
X-Inumbo-ID: 3b61ec10-62d6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752733270; x=1753338070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tCxa6AD2o9yL+t5EQgh6Ms95Qqgq6Q9Lx+TQeiDxqiE=;
        b=Uoqhiuf9zrDZZzyxXqtdRXp+0lWwW4LmW9i6fpoUQxNz+YcLw+BrGcIxoBBp77YkCX
         mw//cRsAk11PxPs7ymwQjV2ecBIWrGELnzb8pxlUTpvIKUNdk7jAUKVUNKoge/rNIfkz
         JkaIRhpwwzYrt9vF54VQRIaxlCm+ttGDI+/10qUFlod1gK46BbDICU9NbaiB6+EgDY1b
         6Yo8COrHPh04vBKrwROk3wQAQEJCyl/y8hyvRCnWC5gbvUvUCQE3erZ654ND1pwgygDN
         dI+RNFupgOdgHTlWMJgQlBQSmauhGlyf2VA9lKtVk3IL/ypJLBY4zZfPzbAG3Q8gUd9U
         ofgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733270; x=1753338070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCxa6AD2o9yL+t5EQgh6Ms95Qqgq6Q9Lx+TQeiDxqiE=;
        b=JlOYmxhvO615NtdM1dHizxllRsuckPJIEuMyJVWyLXAHlJTcfwgBM2bl9NIm9Pf5QW
         fI2VpZbIhsCqhufmxFlVtbNLtP88vuG5YQrhx9ZFfBvf2lymqnXaquDtccEL85y0rJR7
         8w501ixqCe8ah+G/ew3sTGUvOfPo4IVO+diMM3rxEzcoX12JvEWyeBs5jPbEf0XYQtTp
         wWaK2Cm3EJkZnJtpl3YybZJmKZvpailp/EAVNDYpLw/IvRjUAsAZJPw+mVooLPCfxb76
         lgVkNBGRjmGa455nBPOagvW7BddnHbZPJUbemZT/Wy8aqKd+XL4fLWe+dc7OympXOk0N
         4img==
X-Forwarded-Encrypted: i=1; AJvYcCVe3w4H2KzOGmHlQxtHI/LV/uRtuyyzrjWDMAl6n1r0W5hHjaBm/pxmSTrghIoNYATAMPLLj2lB3BI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywZRAyJh1RwOmuLx2wcxakdKnXtYZJKxMyjYhT1dwakDPFEHrt
	4/CCw6E5egb+I3p9qkUMugPEcFiSJsJYQeIcPKZl0+lvJdtKQQ/NlKssy6KL+CW6cA==
X-Gm-Gg: ASbGncs12gTINH5xqTgZDQbRL8gdivpdKMCki9IiPtscKz+7rgWWvN/ShUHk5a8fxro
	+YAx+KOd10XxXZddc2gUnEm5/Ze1CvU02L+kmGaY0s4PFTuzrAYXasPAWcrdkJSLpkktpxq020E
	vKZ7dnF/5+wintyM4DoJkNxiiSuiYMgGsZTEQuqqMOh4nTaoFMtCf+naHjGVf3JzsvBvUaIAKUh
	OdZW7OVIiUygB6d5Q1XA3XjRfbJkDwDBw5gPbjjqIqL9czvxnXERz8LeW9Rzix8HnsnbAeWJPJE
	+EcSwTCJlXaayO1hv8tU0d2yID5eHHAbcofP/ZK/JJaZEX+4jSBccePPBEO9kTNvQJyeYKIqJ9G
	14R1s6aRd7rDXUdQCy+UJGAJGQA92z8clPnBFS9m6jR9iMnz+4Vr2tcqmktXSSsFD4s9l4KBY45
	B4lLDqM4I=
X-Google-Smtp-Source: AGHT+IFiJwR4ZCRiWcPyG+eNlrAQ/QjjFf1YInN7vaiygNyO7esyKfpurmoT7ImnllsVAHB77fixuw==
X-Received: by 2002:a05:6000:2285:b0:3b2:e0ad:758c with SMTP id ffacd0b85a97d-3b6139c9fffmr1434535f8f.3.1752733270351;
        Wed, 16 Jul 2025 23:21:10 -0700 (PDT)
Message-ID: <31c768ce-d014-4d79-9e39-49e551867104@suse.com>
Date: Thu, 17 Jul 2025 08:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5] misra: address violation of MISRA C Rule 10.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <c5a035e0e6b3bd69bafbd3a0397a5924d942f995.1752571686.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <c5a035e0e6b3bd69bafbd3a0397a5924d942f995.1752571686.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 11:31, Dmytro Prokopchuk1 wrote:
> Rule 10.1: Operands shall not be of an
> inappropriate essential type
> 
> The following are non-compliant:
> - boolean used as a numeric value.
> 
> The result of the '__isleap' macro is a boolean.
> Suppress analyser tool finding.
> 
> The result of 'NOW() > timeout' is a boolean,
> which is compared to a numeric value. Fix this.
> Regression was introdiced by commit:
> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)
> 
> Remove pointless cast '(const unsigned short int *)'.
> The source array and the destination pointer are both of the same type.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

I assume you put this in implicitly ...

> ---
>  docs/misra/safe.json                  | 8 ++++++++
>  xen/common/time.c                     | 3 ++-
>  xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)

... acking the Arm part? Except that it would have been Bertrand or Rahul
to ack this?

Jan

