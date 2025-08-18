Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB4B29B5A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085516.1443834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unui2-0007Nx-T7; Mon, 18 Aug 2025 07:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085516.1443834; Mon, 18 Aug 2025 07:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unui2-0007LX-Px; Mon, 18 Aug 2025 07:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1085516;
 Mon, 18 Aug 2025 07:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unui1-0007LR-Vi
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:55:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a804b608-7c08-11f0-a329-13f23c93f187;
 Mon, 18 Aug 2025 09:55:07 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso609480666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:55:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce54021sm740800866b.10.2025.08.18.00.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:55:06 -0700 (PDT)
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
X-Inumbo-ID: a804b608-7c08-11f0-a329-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755503706; x=1756108506; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xPBLMJl2+Rpmi0b+Id6ZGuXhPVF+pZ48s/pokx1Sd44=;
        b=e8tIFtwAwGL4nYMoNfzN1XAoiCSDhCuttvHy0h46gPS1cgExfcbSzd9Wsqpz3GKQUT
         TxvDv2P4qrvRV3ZPbvqkg2b4dk81SltJ5k23J8i+vD99mTWybcOuopgRETdxQzE52Wvj
         J3Bz/1ENCxEcei54opLOo4iY8BxQ51WfpwjPsypE9A+GfS6w4wqZWCdIchb/71M3VLuy
         PmXHRQ2pj3afcYLPpFPL6mUnnq8og8/ithX+6KTdCgreWTulEtN86bnI2iQ0u6MwB6aY
         vp7dCSt0hhSoxTcGAqH/5uQXdhzLAXWXGuVQ2SIX3NSH8naefgAghajRGB7v9CC7BhFB
         MUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503706; x=1756108506;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPBLMJl2+Rpmi0b+Id6ZGuXhPVF+pZ48s/pokx1Sd44=;
        b=UPsMNyccLwO2ybMSfyKao71WH2m7tQjOPeX+WuDOtmHrJzBvFETw9o2JUqOZ05bEga
         /Bc2dpfGmv2F+Ftk8AHB8ygbX/po5ZAtNwZrwKbbgOjrjCkTxVRjbXreX2AMNB8Z7viM
         ovMzuLGVo6ZwEZ4IffbPLEsrqWIjewaM862uhibYbKcRMFPBHElmBhJKtgQerOCkuxgW
         NYaZGztc/ILp+Zo3Vdh2eyRyuwuqDQ+YFe5IHeN+LvVePLSSderjjAo837vek5FIwh0+
         FzuEMQDF/lky8YfIBqB4qsQUOybIM3Rq8IRkgrEEYhQOXQ53xtii0QyMIqxHFnlBuVTJ
         c6+A==
X-Gm-Message-State: AOJu0Yx8BlB+fNvGXsuwxE66OvzbNKTNgwHELdr3F2zghLkhiot1teHF
	pfVQkeuoS8K/JGYBG1j70AbZ6CWnTPe4oLVfXerKyBXXhtwxK9FeNeEXk69VtOVrNdN08n36tY+
	7eMQ=
X-Gm-Gg: ASbGncsImVOfd/VmZmjVFrF5/GlXuouLuHvXUq3EE3ytmztmnb+ZwtIQGlZcni8H3Q7
	X+EsDhu8s7ke62+eVwxjEjYLsgRPgxs5izfBy7nf/HRip8VScPqGK4vCVwCMB/DWhPCwHEFuKHC
	8sjnrf689xWqYrINOIHwWyVrrLcrZSTNEVinPp5KhsSlRnvwnknHIe3V+iW52Kwm4ooIRwHQHcp
	iDgNXYxbHvhBv4dtTWlDNYR9xdKTad+DyAF/2KgLy8Utigriq0T3qNoWReuQRaG7SQaSu42TWa6
	2cOyqOsGmZHP7ZLQUP/6AQVig44YmSqmjpAOTx4UnaKnDz94znPbui33TkehoMEqUuFH2Iv1qx0
	xVl4iDx5S9UpJIFsnLI+jIxBreoeqWk6VnUeDldn1FCDNCKeWQ8TcBuVdhxCUo5prUAv3/Adc61
	QjwQ1y53ZJIOAv9BIhCw==
X-Google-Smtp-Source: AGHT+IH3UcLfcKzpZ8NpiShKHvw1R1yo9Nt8cDQ0yzOwmxSog7PRk63QVljFGSdw2aloAfytm5fNOQ==
X-Received: by 2002:a17:907:6d1d:b0:af9:5e9a:b6a with SMTP id a640c23a62f3a-afcdc363b98mr911599166b.42.1755503706375;
        Mon, 18 Aug 2025 00:55:06 -0700 (PDT)
Message-ID: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
Date: Mon, 18 Aug 2025 09:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] constrain page_is_ram_type() to x86
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Re-worked the plain dropping of an assertion to a function rename, and then
isolating of the original function to just x86.

1: Arm: drop assertion from page_is_ram_type()
2: common: make page_{is,get}_ram_type() x86-only

Jan

