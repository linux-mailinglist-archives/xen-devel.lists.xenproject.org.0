Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C60ADA8BC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016718.1393674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3qK-0000BL-4J; Mon, 16 Jun 2025 07:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016718.1393674; Mon, 16 Jun 2025 07:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3qK-00008s-0d; Mon, 16 Jun 2025 07:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1016718;
 Mon, 16 Jun 2025 07:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3qJ-0006Hu-51
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:01:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d8d6b7-4a7f-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 09:01:18 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ad93ff9f714so728460966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:01:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-608b4a93b03sm5531809a12.54.2025.06.16.00.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:01:17 -0700 (PDT)
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
X-Inumbo-ID: b3d8d6b7-4a7f-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057278; x=1750662078; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dY8BGe9e9TqrPHAlEJu9QoJiufRE4AOYbMuv7tR3bJ0=;
        b=EwN5uR2I7hY3dD9bFmlslx+ZKgP+M5W/G58Wbwkf4yOmx1nWSO7YN9Epim1/Q0OFmS
         ibntom3zvBH66V4Kfvh9vf509od087I+JbcOoe9La852Dv68WGVUwzKktzeoK36yZqDQ
         DTaykunUT7MjnFBzOAESqJAtXEmSDt34LpFChZAKLIQqrXruUUAQJ15elHBb+GFyI0wf
         3m/fg7r2DPch/pzahfkzqlQ8uBkDrBWxwcwW6lWhdEuolpOvRp5XL1uF3C/afiPXXTbA
         g9wa1Si/mcwIRad3EAgisFyxf6kM10vwMVC3VSxsmMqDOYzdoPMWSR4iPcp7n2WwMWgw
         NFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057278; x=1750662078;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY8BGe9e9TqrPHAlEJu9QoJiufRE4AOYbMuv7tR3bJ0=;
        b=YRgc6r5hdj+H9gPoch18NXoOdAhShI9dJ5R4bXua9ibVcQCeiE1rP0noys3Ip/SCse
         pfmlLZKzBhjF3ZhJTaJDl+7CHwN8tIeFB5+vclud4OZm7jIiu5gDEKRLOcuGIBRrFRpK
         HkcakmMKa8LpdzDLCDymoKDreuLN6TkkrC5tDeFIMrPb3eUNhvqfRLVOZXtpilzPw6lj
         ZtM+/9+pFv0YM4gf5LRR/1WeBw0VicoelRIMZBWAeHs0ROCecPp0WEzMJgGilHymxCZh
         NnXVUdbtBsZIga02HHLuT8e0GZfbqRdbvFWgO+UzoKOlPQNKFObUmG3OLmLOYA4ww8u3
         2ixg==
X-Forwarded-Encrypted: i=1; AJvYcCV6W3PfH/ymD3v3HY+5Qjd5w9dqj5ejmnxS92hWqNitpkSheI24rHUkDcPvuR4MvTEWZS4wDYO3v4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN76mKXo1rVXDgUXbBYKh81pyS4rQlnoYPK9GJ+2TvQK+dnKKI
	qc8Q9FX7MLoFVEmsW7qjfJjYBj5+PbjnOKvFI4S97eXv59P1Ow9GkHYYrz7KaLzNYQ==
X-Gm-Gg: ASbGncsKuZsFV5Vz9OQb+3nUx882nplGMo5J+jtKQloVUTEYgFMskfrjzy3sqhJ64NZ
	wcXae8eTgiedo+OcIM24U2jj60mj2/862Zee9a2bWijS7NUD3Xqvy/jVtrH05JrFZJ3VcY77qaD
	MzYYPKhvNYEGwu/8GC3I2+vrIDiobXubovPZulMxm4ziISkHWDTSYc30RtFcVyBql/LFyBGWRdf
	3UJS6oHkGe+eY3jfjPq46NVLQYL5DFmdOUcMCUi+jZn7SclyU4+onCP3zqkvql5sFP2bWPJ3Mft
	v1fap187JfyUAKV5bYCz2pvtm57eooabJoap8m+HcP5sPaKVyCMRdS9Jwq0/KWux2DqED8JpgwM
	kRZ7HMOY2dm8Vb11QoHSIVTLPoux2hRqQCSb2NMiFkjtvSuQ=
X-Google-Smtp-Source: AGHT+IFlKxIdHabl/a6Ds14tOCN/yATQW9hGL4chjm1Vrggn5+gHzMEhtQbTDNAuiSCZrcQCBAyGiw==
X-Received: by 2002:a17:907:96a8:b0:ad8:9466:3344 with SMTP id a640c23a62f3a-adfad4f38bfmr887367266b.43.1750057277650;
        Mon, 16 Jun 2025 00:01:17 -0700 (PDT)
Message-ID: <07d0b403-1fc0-4d19-beee-b6960b29c819@suse.com>
Date: Mon, 16 Jun 2025 09:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-13-agarciav@amd.com>
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
In-Reply-To: <20250613151612.754222-13-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.06.2025 17:13, Alejandro Vallejo wrote:
> ... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
> and may function without it.

See my reply to patch 14. I consider it outright wrong (as being overly
misleading) to build device tree code without HAS_DEVICE_TREE=y.

Jan

