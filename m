Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D7AE5E5D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023242.1399187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyPV-0001hE-QE; Tue, 24 Jun 2025 07:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023242.1399187; Tue, 24 Jun 2025 07:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyPV-0001el-MU; Tue, 24 Jun 2025 07:49:41 +0000
Received: by outflank-mailman (input) for mailman id 1023242;
 Tue, 24 Jun 2025 07:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyPU-0001ec-CX
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:49:40 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7e2f062-50cf-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:49:39 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so3036201f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:49:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-238072314basm5940225ad.145.2025.06.24.00.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 00:49:36 -0700 (PDT)
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
X-Inumbo-ID: c7e2f062-50cf-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750751378; x=1751356178; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L0/IyvqH0WukLHpJxTEWtJaI8PalwrVi7HSsS2Qy+0k=;
        b=NIxNYCkf3tihIVuz+SWk89lgPVpkwxxQh22n+uI8mR2O9REdAyERb04wB+cm6aYspi
         n2oC2q5Z9OzPCFeqh4plJWczIlTkQTCCo9DCjVIDwInA983rbXcjsAbIZYhnkYTkL78Q
         mGcFfOD8ZcVc+Hl61HEnJvUxAO/uBSM7OIM9V1TGqQQd9IWjsJkyUjJp9qnWO1PILOHH
         u/BG3vThoYcewgT56KUacOLnsLjcTXUbVTgCmWfQ1DFZdowqbkctSycJE8XR++ek/nXy
         Zd+hNDmaFcrKY/QMFZy2QULeNP2YGM6g4i9V4fb1Us+4HQJk1dhw5Car1pMoo3+TEZ7Z
         NCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751378; x=1751356178;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0/IyvqH0WukLHpJxTEWtJaI8PalwrVi7HSsS2Qy+0k=;
        b=IqgfGSgTaSP1ZpboAfusL33FAQeIsVrPGZQ3HYH44a5X3yNWs5hDfOnUleUQImbYTK
         6L6AmNwy3mGl9VAEMOqKaSLNdj1LvxGWEpzBe0nP3J3BGWxY+FArHEseNPjNEuoE0gjy
         QdDPVzJKDmWK9Svo/5f3EgH+HsHMLfZF2aOXvAfVJqFpyZv8Bh1DKq/ehSoxUe27+e4N
         WZFyxRxHw3gFiclIzg3DXTfbOu2xnEY5/vUUopgaIp8+oR55aq1y3TrYY1Q+ObEyXw+5
         Nr170CsxztUKqFwtVM8maud4z71qcR4QDCVU0Ri1rGZeKzfjERkMRPeMgG+G5KySgNNR
         0V+A==
X-Forwarded-Encrypted: i=1; AJvYcCXP1b8CcHLChPXt36ygKR+goJd8i47ZtTZnS4qDDrQ+sqT3LSqOerJGuBJBpXb4nnnB9HWB30O++4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbvXX0+q3EFk975sAcoyc3e0fAnh+oZY/eElhWY+L02YGTwEKN
	rrqT5B3NShSWRlOXQppPe7iwkLuxtSGCwB2gkcg7Xoe83hDbGWxi4XwcYzp+s4lRxw==
X-Gm-Gg: ASbGncvWe/tBvXtboHxVLiCyVoAE4vcAFok08cltX9s3hzQO0iBeD197ZiGT4HGp2C+
	+8c6kjzC15hJR99ALQiZ9KqXoo81vDgWxWEbiXi8W48uul0ZH7fG6XT40Zx1on+TudZ3o3SZu49
	EOBTkaNJYz3kKqKr0ynZB4ymQRD6n9mMA30ZDCMJFvvuZqefkyAabsx4f27zVXNhDQgEntVzUgx
	0xbTdOr+oZ9w6KoMNPq6NH08nnHWBdRAJoHywj6Kz8BEcie0g5AJNZ82HMSZjuzFyPyihogNhvd
	LOHM6mGJRsKt6OVNEegifIjnd1RJH5343QEfjUOFN5tSCLoFsQ83oCmWEfVKcSCBR9pqNymZY20
	v1gyz7woYvN/NxzWpaSA0aEp8YCQfkM0gKeSpbRk7bTmlVBI=
X-Google-Smtp-Source: AGHT+IFBrJ40Gi9afffyr6Vp38z9zq7ZLAbLHomhlh1+Clo2Z8wYGeXYKPEvy2GLfrRov+eRR6/d8Q==
X-Received: by 2002:a05:6000:4b0d:b0:3a6:d579:ec21 with SMTP id ffacd0b85a97d-3a6d579eca1mr9926603f8f.12.1750751377336;
        Tue, 24 Jun 2025 00:49:37 -0700 (PDT)
Message-ID: <04837952-8d7a-48e2-9618-6bc40e933d35@suse.com>
Date: Tue, 24 Jun 2025 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Guard freeze/thaw_domains functions with
 CONFIG_SYSTEM_SUSPEND
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250624065601.197492-1-xakep.amatop@gmail.com>
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
In-Reply-To: <20250624065601.197492-1-xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 08:56, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch adds CONFIG_SYSTEM_SUSPEND guards around freeze_domains
> and thaw_domains functions.
> 
> This ensures they are only compiled into the hypervisor when the system
> suspend functionality is enabled, aligning their inclusion with their
> specific use case.

This addresses two Misra Rule 2.1 violations.

> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

With the addition (happy to add while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

