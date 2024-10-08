Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA500994260
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 10:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812832.1225607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5oQ-00060t-5I; Tue, 08 Oct 2024 08:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812832.1225607; Tue, 08 Oct 2024 08:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5oQ-0005zF-2g; Tue, 08 Oct 2024 08:43:22 +0000
Received: by outflank-mailman (input) for mailman id 812832;
 Tue, 08 Oct 2024 08:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vy9o=RE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sy5oO-0005z3-Pu
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:43:20 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eaf4579-8551-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 10:43:19 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so79054041fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 01:43:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994cea5a6fsm306886766b.224.2024.10.08.01.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 01:43:19 -0700 (PDT)
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
X-Inumbo-ID: 5eaf4579-8551-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728376999; x=1728981799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRkMXWzx8WVYIbynDLk0om8TiVsnT5FyHke2/Vuz8qE=;
        b=Cb+fNF1NdkArYhL3Jap+DAQnRJ00DYvCNsQVLG5DaWy8xrtXVvffq+PTdT96G0wrvF
         2GRApDiMdcHLdXZ1AFp90VhRTZ0ZKY2oa6sY6BwESdGOP0UpCjJX/RECm5S3J6FZFOVT
         +29cmk7ftsmb0mfVGfy6TJIntXHOq/ABObNvjrhFHGPw4NbyoiQThsBV0x8NgE6FXLti
         ZxOZWnmho8mI6pVJSc4rv3I4B91KYbMNVMMuMhwvVSiRo+w227z8jfE9WhqD+WmXDsuC
         fLrddfjyDUCbno/vBbGyOZJKALm8Ssiwx27dd7ZFwiH1tt69Z9bHdEHEChVwNq45FYsS
         iUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376999; x=1728981799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRkMXWzx8WVYIbynDLk0om8TiVsnT5FyHke2/Vuz8qE=;
        b=o97qNaftqhVFGf/t0iJV+23mjdlf3dOY4jaon9IpjWsYV9GU5srq4gOsyzNyrYVcO6
         Ys4YUDORmXU7rew+OVWJikum1HvpaTEkS3NZmus4wT+ukjE01ZtNpqNYYNw0zA25pqSz
         YavszQPmBY5YJIGAzfeua++Zm2N6+T7adNK+jdrUeXPQjQmGpDafV4iukbaClBXaVrKP
         CrNPPVo2oLrpd27Y4jjMMspYiZmphtNPrQeF84n1A0mLQ+Hee6cvkBhBaz/LPIRjBRRr
         YUmgU6BE6gcIVF6auxlqpGP14VziYRyWVXcFplxicwOvf30SXlD4h1wqrk3+X7nbC5gF
         DqKw==
X-Forwarded-Encrypted: i=1; AJvYcCW/GuvIfzBouZhPvCO1S/BO8h6+yoVq2mvPQ0SShBwLPNT4gqfU1i2R3EnqQqKHjQL+2WYbbzp9gOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvl0bvPoLV9PvGJB20XD1uhv+w4tQXvuuelmTxMZ5q1UzQCvwX
	ky6vpiMO6aBUvwFzbtS76IHkyUixKu542sn6AzWzlcHSdKfLMB2S80ZPMRfzaw==
X-Google-Smtp-Source: AGHT+IEQAJmdaC2rPkT+9g8bVlzz84hdx5B29D1nmR2bNqvZhEdl7M5jd2yE/Pjp9bl+TVjY6jBhpg==
X-Received: by 2002:a2e:be85:0:b0:2fa:d7ea:a219 with SMTP id 38308e7fff4ca-2faf3d79182mr96385981fa.37.1728376999382;
        Tue, 08 Oct 2024 01:43:19 -0700 (PDT)
Message-ID: <34143892-d278-403b-98e5-127b52f1c446@suse.com>
Date: Tue, 8 Oct 2024 10:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Use standard C types in multiboot2.h header
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241008084157.35652-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241008084157.35652-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.10.2024 10:41, Frediano Ziglio wrote:
> The header already uses standard types for many fields, extend
> their usage.
> No functional change.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



