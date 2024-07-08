Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B0929C98
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 08:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755031.1163300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiJ9-0004Ii-M2; Mon, 08 Jul 2024 06:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755031.1163300; Mon, 08 Jul 2024 06:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQiJ9-0004Gu-Iy; Mon, 08 Jul 2024 06:57:07 +0000
Received: by outflank-mailman (input) for mailman id 755031;
 Mon, 08 Jul 2024 06:57:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQiJ8-0004Go-CO
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 06:57:06 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 473bf97a-3cf7-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 08:57:02 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee90f56e02so33575501fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jul 2024 23:57:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fafc2353e4sm110839635ad.90.2024.07.07.23.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jul 2024 23:57:03 -0700 (PDT)
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
X-Inumbo-ID: 473bf97a-3cf7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720421824; x=1721026624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vBr4ThZvOElEUa0dtWhn+hVORetqDRXffZCJYYCCeac=;
        b=XBCqH2Qjzfn16LVv3qRuVIhmEBCaDui5rXn5rpEuYr4sncUSB1Ix3VvbSqQ9mXmUG5
         n5nu+60KdzU2LWyb0zIrC9bP/EklL24d7KSP4gviFcIA0USIc1fwfEhzhweWZ1sJGzN4
         EQyM/wNgHYFBY/5JFRSOlxCQTGQOcGM8BtZZZEP8s7KCOvjq1KivJE4RPQPEZXjhv0Pm
         wRi4Yf9EcqAKvh/981xQ6xUUj+QrxdcoJcdQnULeu/JoxpMyT2xZmBJKa9zAKUoCrbQL
         Il70YHbjbpKya8ilDObLITZvSfpadzr+IEfXzt70J1gJTnWMbSzxd3aHAG5RVCvzyGEW
         DTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720421824; x=1721026624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBr4ThZvOElEUa0dtWhn+hVORetqDRXffZCJYYCCeac=;
        b=IDx9DnPDs8x1qW3xb/0yf3er9+ggK9FNk9bv8L1uNvp/agL8IU6zjkKK3XxxfyCdgt
         QttAfqUYiomqpt32AuBQkWi2LoArcwJfpmtPydFowrQhl+pIRWNihbNSnmbffK6bY4IX
         +7mq1NNriRLL4J+fxTF/oTnoJXWVToccqyxuP9wKIxpqB9MYw2Okr1W+1eX9rcjwcOE0
         Sxmue2Y5H/YVGd8RS4lCFdn5a6cben+1c78PlJ9Bt+/v3mDZ19PboUFOlk6jj1vGppJW
         PP85g23t1XIghPh6MD9x45Uy999WM6HqHxdJfxQRE3tU7n0c7JK9G2Em5vAiBXyUkAvO
         7f6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8mCky877mXip9XZ9B6GUEb64y2etmdr1eyEom0wFFAMK23J9k0VN6AtHFELsIWgu0Y8SVa+BfIc6YhVGwl8r4a4wCXQjUZPAlJfINpuI=
X-Gm-Message-State: AOJu0YxDbJZIE2O422IgcqhW1MMNo6suwyKvbSrUA1AtbQIDp89Mwvls
	qAe75UkNLwW2zrigDIzgue7Tpa/zQmW3NrR2RhLAetSBUiCiQ7enCFDL3QCa9HX9h4uEjylVQMw
	=
X-Google-Smtp-Source: AGHT+IHUTadvH9mTG8gBWaCr2Hf3zwlkEBvazLtWJnZJIRMS3ZP4KqzSKy0SWyiSKzFOZEuGe7yNnA==
X-Received: by 2002:a2e:891a:0:b0:2ee:4c2e:3d35 with SMTP id 38308e7fff4ca-2ee8eda6a90mr73286491fa.23.1720421823916;
        Sun, 07 Jul 2024 23:57:03 -0700 (PDT)
Message-ID: <ccf289e2-be86-4601-9bf0-cdde3fc3df37@suse.com>
Date: Mon, 8 Jul 2024 08:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/physdev: Return pirq that irq was already
 mapped to
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Huang Rui
 <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240708062554.399784-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240708062554.399784-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 08:25, Jiqian Chen wrote:
> Fix bug imported by 0762e2502f1f ("x86/physdev: factor out the code to allocate and

Nit: Perhaps s/imported/introduced/ ?

> map a pirq"). After that re-factoring, when pirq<0 and current_pirq>0, it means
> caller want to allocate a free pirq for irq but irq already has a mapped pirq, then
> it returns the negative pirq, so it fails. However, the logic before that
> re-factoring is different, it should return the current_pirq that irq was already
> mapped to and make the call success.
> 
> Fixes: 0762e2502f1f ("x86/physdev: factor out the code to allocate and map a pirq")
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



