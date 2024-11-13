Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AA9C6C2D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835232.1251080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBA7w-0007nw-K3; Wed, 13 Nov 2024 09:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835232.1251080; Wed, 13 Nov 2024 09:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBA7w-0007kp-GL; Wed, 13 Nov 2024 09:57:32 +0000
Received: by outflank-mailman (input) for mailman id 835232;
 Wed, 13 Nov 2024 09:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBA7v-0007kh-ES
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:57:31 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b117ffe5-a1a5-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:57:28 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so57293735e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:57:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381edc1104asm18189442f8f.88.2024.11.13.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 01:57:27 -0800 (PST)
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
X-Inumbo-ID: b117ffe5-a1a5-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzAiLCJoZWxvIjoibWFpbC13bTEteDMzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImIxMTdmZmU1LWExYTUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkxODQ4LjcxNTE0NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731491848; x=1732096648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B4yA3WAckbrae0zRpCXLMgdsh5evfosnQnPssYVwpOM=;
        b=A6lap5NE4ZUFywpBWt/zfkJLhvaRWMm5mD4871hJ0iksnMh4+BvNIywFbKfY6C3mjn
         94q8MszladW2mU3ppO6c2fdQ8Rdnu1pkgpRRlyELYOuEfuK1VAGyZlBEQpWVZ9hGgvJi
         jnLgCYxrQ84SkrgCDzrsm6mvPoYp3IjnwnBpj/u2VDFVU/hmrGAKO1c6Sb6UwPk86FSO
         T6/C6hS7zsC2ZJcJny4fF8vmbGnaGYjofWnozykfewA9rpqpci0TXRHqdY/ZvVs3ljW5
         +KJr3dfDJhTVMU2+TVh9J74TF064AgBrigUo9m41yag8YnSzm5dX3pPpxcC2Xq7be/+7
         eTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731491848; x=1732096648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4yA3WAckbrae0zRpCXLMgdsh5evfosnQnPssYVwpOM=;
        b=PvVs4neuM2LwtPjmLv3p8imB/qKznn7UEyrcVarHK7Vs4y6Ng+9qjfEXiPOuTyudyH
         TS0JfOW3te8vPVnLPv5P0abM8+t1pJjHZ8LpvI9KeML5TiIaZaniMFuvWha7ndUjgDEK
         0N0xAJBYV9PW0BtwfT2SU85z7XRsqP6Its+C+Fk8R5asY5pfVBGWf0P93dkhzziHS4sL
         Tq+EI2RuQKvYz8nCiJ7NhDn1qFE6pSYWDG+VzBCqs0F1Fd4ebyPRb1hFQ8kTd9Wrw7dr
         LYPh9CB2CNN20jGjcygiWHY85a4Nx/L5czkgEAUe11XZNAt9FqegYhhIz3q5ZnF3gijy
         jHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCDdHjzAReQX8cF1QYfUaM7HdVpEdR61LnhAm2h0WYyDb86cubp3DYwv25VsXQ5bo2lU/83ug7i2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqj2RWGP5vA/HDMk0n+smSE1Dc5kjXqHCi5J8heEsIOKuTJVSe
	Llq2+uh6kurt1q7tH0Haxlu/K/PDzfsPCKMeqcG1Dv97KMJ3P05o5bfn3CbRJw==
X-Google-Smtp-Source: AGHT+IF7r7vkBJAb/wezQn3Pw5t8y1v5s2mwFCfejGGzKHfIq2T9GeJq6SqtaSkt4EZNkeh8vM9MfQ==
X-Received: by 2002:a05:6000:1f8c:b0:37d:2edd:b731 with SMTP id ffacd0b85a97d-381f186cce9mr15481375f8f.30.1731491847941;
        Wed, 13 Nov 2024 01:57:27 -0800 (PST)
Message-ID: <016ab4be-b6b5-4bee-be80-11579f3d8146@suse.com>
Date: Wed, 13 Nov 2024 10:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] automation/eclair: tag Rule 16.3 as clean
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1731485149.git.federico.serafini@bugseng.com>
 <30ebf4ab10923dde132f0df60bc7445dc892affe.1731485149.git.federico.serafini@bugseng.com>
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
In-Reply-To: <30ebf4ab10923dde132f0df60bc7445dc892affe.1731485149.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2024 09:17, Federico Serafini wrote:
> Tag MISRA C:2012 Rule 16.3 as clean for both architectures:
> new violations will cause a failure of the CI/CD pipeline.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> No changes from v1.
> ---
>  automation/eclair_analysis/ECLAIR/tagging.ecl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Where did Stefano's (conditional) ack go?

Jan

