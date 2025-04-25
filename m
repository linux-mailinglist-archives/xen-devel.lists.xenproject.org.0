Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC0A9C94E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967968.1357685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IVr-0002Rh-09; Fri, 25 Apr 2025 12:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967968.1357685; Fri, 25 Apr 2025 12:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IVq-0002Pg-TY; Fri, 25 Apr 2025 12:50:38 +0000
Received: by outflank-mailman (input) for mailman id 967968;
 Fri, 25 Apr 2025 12:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8IQp-00075e-NR
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:45:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d7fb3c-21d3-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 14:45:25 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so20737655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 05:45:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46869sm2264657f8f.72.2025.04.25.05.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 05:45:24 -0700 (PDT)
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
X-Inumbo-ID: 28d7fb3c-21d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745585125; x=1746189925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AMZ6tvhAj+0ImqwVAWsI1V/AEI5FFCfECVf92tFjQHE=;
        b=E7ByUjll/T9b2/IyTItRIfJD0oZMdVYbEHNNK5BMmM7OlQys1YjN4WiQihtO57ZNfH
         iG41MMSYy/tQzyOiUxwql78herZXTCD0sjbEeU7B7z0M0+XhhLDBAEYwzaj6Z5LsCpzN
         AwbOYpxu8KRMweOItcq9DcmL4ClTWZ2Z0XtxsNpgwsMdqP0c+dp4OAQBAOlWZjzxzsxj
         Q0V6ExHnC4/+nYVfAXgI+qLxRvz4xt2M8NXapE+qGnQmeERnGRqHirtPCY0bDhHQRkYC
         cigWiRtclcU4Q2pCAiEICW+2xgUosX5dKPG5K+zSe6TM+JAAoffJh2+2d0X83eh1hibF
         0IMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585125; x=1746189925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMZ6tvhAj+0ImqwVAWsI1V/AEI5FFCfECVf92tFjQHE=;
        b=l55XL59FAokDCRtzVew7tzouz5u/RIYcjWCLFV7V/p+2Eirt9QzDq5NQIabt7nY9Jm
         WPmhWD93+ibQniXx5bMmAJPpijLbAl/wU4khEc9cdcnpMjGJyBNlxzr8jGxfX07dncGw
         rMvCu4Efz8KyLUD2HE0U8UBhRMwuhmLVlsL6Vk1smBUQEVDhD+KuAhuFUL1ncf1se8q9
         pWtpFXkBqo7qIDg8CRGLygqNV3GllI1lZlZpB9yYsLPivsuDbNE8R34ZXWt2GcufroRa
         vkHrr5iq2ZDmc5+cOnHA9LKZFH3kyfVtWZPOwOXT23o2HxfDJ712ZAQij2CpLlqXiL3G
         J/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCW/AvMqUUbEZv7z0aGqdtKnpZ7xd8ZZgxrPByFzBpNuNwT9MdnA39qDe3Jy780XC/AWo9xikLaMGrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjN13oTBhxC3zHaFcqEhqty69ukg2vElbTGq3jD0d/t04vjtEI
	rC8mDsl8YFpTczua+4IQN1GTQcaUcIXetTFGTZVLzqCPpy1PYZye9hKhtrzazA==
X-Gm-Gg: ASbGncsbUUDbD3ndrFHtfrbodxAiCh44Sd66wPSG5AneRF0hHRpAskYMp0ZWUbyPsGg
	OialjPPJgbrH8jpFDraCM4R4ZKAfPuUiw/kJn1c8EAxNIjv/prhvW9FDpPKnliM9FzzMg4Ethd0
	MwCTNZJpTzKkdTMoqqgrMHchB9pWjz15bm+g2vG57nAO2JBvnpigFu0Zo7uf1UGx3R807iumjfi
	fFwKAsQXBHqXu/3V4bu/OYuKBh3pBnRcsX18oI2MwJyNWs/EtOV+ocpq9NCkJsmpMb/uCFXI/Tj
	jdCz2cKhXdOdW6Op5jiEdepzMI7yffSv9M6J1VqmzcwJciVLEJsnZuD3Oo/DybjEMVGeC+ihWoq
	uEbLlH6At7vBNm3gy9IjhQNnM4kR5N3LaK72Y
X-Google-Smtp-Source: AGHT+IEV5UEXkgcjRjeSBSy17KiMifU6kh+kuqHUMRSsPBH/uCDCqR9ljhOzQw4OiMhm5u0BLT6bcQ==
X-Received: by 2002:a05:600c:3d17:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-440a65ec991mr21395355e9.13.1745585125229;
        Fri, 25 Apr 2025 05:45:25 -0700 (PDT)
Message-ID: <f278eec0-2627-4598-bcdd-ee2bed4b71a3@suse.com>
Date: Fri, 25 Apr 2025 14:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
 <b2883538-8cea-4fde-b42b-55455fa810ca@gmail.com>
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
In-Reply-To: <b2883538-8cea-4fde-b42b-55455fa810ca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2025 13:29, Oleksii Kurochko wrote:
> 
> On 4/25/25 1:24 PM, Andrew Cooper wrote:
>> The type used for pagetable attributes/permissions is currently unsigned int,
>> but needs to become architecture dependent as PPC needs unsigned long.
> 
> Not only PPC, RISC-V needs it too.
> 
>>
>> Introduce mm-types.h to house pte_attr_t.
> 
> Do we really want a separate mm-types.h?

I think so, yes. It'll (hopefully) allow to avoid including xen/mm.h in a few
places, in the longer run.

Jan

