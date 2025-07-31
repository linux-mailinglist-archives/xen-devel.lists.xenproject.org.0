Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08DB17037
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:13:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065462.1430837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRE5-0004XB-Qs; Thu, 31 Jul 2025 11:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065462.1430837; Thu, 31 Jul 2025 11:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhRE5-0004V6-MQ; Thu, 31 Jul 2025 11:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1065462;
 Thu, 31 Jul 2025 11:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhRE4-0004Hv-Il
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:13:32 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64561aa8-6dff-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 13:13:31 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7746135acso187626f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:13:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3209a84d115sm1708304a91.36.2025.07.31.04.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 04:13:30 -0700 (PDT)
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
X-Inumbo-ID: 64561aa8-6dff-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753960411; x=1754565211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5F2gDJ16A2szIkXOtTrX3+Y9lf29WIqo2T09W31WiYk=;
        b=EKaJ/NZgul4wahXNOvBhVq5CifGI4EGdtnb9yzeTbqPdg+b9A8mwqFJmF7YtRkb/AX
         SPSE2G7jbMpR6c4YfpD0fLjtGTP7Rakzlne8s1vQvZW4v6qbWAkntNJVALHF+b8eW2kM
         iAwuI7AFWSR2OmzYiZiJhofw7whwyWactIoIdGW9KXV3X0R9suGyi5/JJ90nKdqlGiXG
         M6XLe1LWVeMTAT7n+rlbKwqNCnhsNe2cRAg62WLl887pNKe1ZaolM22e0U53rEbnl/D0
         PDczGj1ncwHskCBxfq0Kx7m2lA7qPlPfx4sbp0MSJ4zudpox9nGGdtiWGlJD6a4wLXO9
         qIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753960411; x=1754565211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F2gDJ16A2szIkXOtTrX3+Y9lf29WIqo2T09W31WiYk=;
        b=t5EMGoLxxHRHjX4nK1JNt9N4PH3OsVy/Yr4esjEFdnQbk8OdnxQgVfNQE+166ix9CM
         G3ZOSN1LZP4ASi2dh0NZJkidcVK7Wg8CuY8/PBLnCU0lDwqTsEGPrHh3o3FR4GsDKium
         yxsBXGT6EPTLhR0Ce1mWV1WSL1/MwYbI2cGo/HV860av3n/9jD5lYzbR31dWm0MjQ6aa
         MSMxUwPFIQ4Ir/F3nEh3A4NbglPVexhHWOhhTsQEwjXjJQ/cl3DXh5vxdHFzrmzhngcn
         cU+xE3zJ9LzLpuI8UAAgGY+TkNxu5oOL/o9I0L+GI6B2vqysco2FO/q5woTI/YDRbdg9
         6kyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXENXTcnnSBzqZlBS7lsOhiEZARnfxKDR9j2Ibb3ZYqsVm1GdPswnbX1pWSM9CXlGuUyuwRdAy829U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgZL8vk0qapBClGjCzxeZK3eGNofwI/nvASn2HCwk8c9Bjshyi
	SXaAXueyPs6M1h5TDxeRwTDAvrZhtGqYYs0q89GMsokud8OU/veee1YeJcdyPyJ5Iw==
X-Gm-Gg: ASbGncslnYWy1Infjo0iZh4JC1wuIQpyq77C+ZSH3yIQCZR1xF1bJ0lbVjnQx8qWgOU
	9fseH7+qHnfMuu42j/r7qCr87vSzdKZrQH7lNaVVE3o+OQJEr2DvBzC7ComErY0daYTUuaTAJqA
	FAPNL8tz3O1UrZTBuaKAaBkgBEWJSgJFJTNPjErfDiwKD5hoP3jXTWaCnr312bcsXUsJGsBqOTV
	o3I798Y0IH3emZGRKpyRCTSUtzqJipHbR4Cn/fwnxU7zFrKy8lknPlSXB10fWZtIX5VmZKSk4cG
	JDNu51XEdNlqQbisdPtbmI9IdMyndpPxf6/mBkQmSFVS1xyOWDnVR94m432vPXvJRXVrKXeuKGE
	zVtBf4FnW9e/AirBYU/Yf2ZhTcKQm55+q+WGguLcN9ujtsJlM/JWEhA8BEbXEtFsK14mXyMyfSY
	k2NTXN3Eo=
X-Google-Smtp-Source: AGHT+IHznc18z90YEQx5aIcf2nrc8edFM9aVmZ1U/SdNRUv0uoIGHeLAE4UswGhdl0wwKkbFZUW9lA==
X-Received: by 2002:a05:6000:401e:b0:3b8:12a6:36b8 with SMTP id ffacd0b85a97d-3b812a637f1mr1119998f8f.46.1753960411270;
        Thu, 31 Jul 2025 04:13:31 -0700 (PDT)
Message-ID: <a5515c08-76af-4c83-9c02-7654c944b25e@suse.com>
Date: Thu, 31 Jul 2025 13:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] common: Make livepatch dependent on HAS_VMAP
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250731080522.810468-1-michal.orzel@amd.com>
 <20250731080522.810468-3-michal.orzel@amd.com>
 <8d2d444c-29cb-45da-9bf0-03dac4d01cb8@suse.com>
 <b5801413-f077-445f-a665-e9e8e4858dd1@amd.com>
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
In-Reply-To: <b5801413-f077-445f-a665-e9e8e4858dd1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 13:10, Orzel, Michal wrote:
> On 31/07/2025 10:22, Jan Beulich wrote:
>> On 31.07.2025 10:05, Michal Orzel wrote:
>>> It should not be possible to select and build livepatch if HAS_VMAP is
>>> not selected. This is the case on MPU systems.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> I agree this is necessary for now, so
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> But in principle live-patching ought to be possible without MMU as well,
>> just that the code will need suitably enabling? If so, it would be nice
>> if the description could somehow express this.
> Yes, I agree that it can be enabled in the future with some additional changes.
> I can tweak commit msg when committing:
> "While technically possible to support live-patching on MPU systems, today the
> code depends on vmap. However, this relationship is not reflected in Kconfig
> and allows to enable live-patching on MPU, where HAS_VMAP is not selected."

Fine with me, thanks.

Jan

