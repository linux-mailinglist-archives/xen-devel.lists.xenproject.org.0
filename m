Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403BA5EE0E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911469.1317885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdxe-0006b4-Ee; Thu, 13 Mar 2025 08:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911469.1317885; Thu, 13 Mar 2025 08:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdxe-0006aD-BV; Thu, 13 Mar 2025 08:30:38 +0000
Received: by outflank-mailman (input) for mailman id 911469;
 Thu, 13 Mar 2025 08:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdxd-0006a7-6n
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:30:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eec5c32-ffe5-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:30:34 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso5691145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:30:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0ca2sm45040765e9.37.2025.03.13.01.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:30:32 -0700 (PDT)
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
X-Inumbo-ID: 6eec5c32-ffe5-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741854634; x=1742459434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sqgjLRA9ZHEZgsOnJcAtKDnI3OcwFX4OqnrLwoIU3VU=;
        b=cESRGF6jSC0LzukGoEBFrhhYyxuNJwz5sugzdu9gK25n8k/QM4BsPQMBKPXkkiBMgL
         gcB/asJHPDBWPv/fkGFIowpYnbhLJPsT5CbjhN5jxfLIShlUxQDewr5FpeL0LPLGvCXp
         w2qx+V2K9ceh0QvKfttuOdcfbkr0MUoFsDH5TacCHO0wuu3sJARNf9xMqPGKgPSWK2FI
         2P/TTPkXVA/qmDuv5f4XgL6ev1Y+69RZKfIcUU+GoO434OOoUxx3ai/Ln53eTME98xxS
         T+0dCDj6vTD9srhR98gihKeX5yIic2Od/liwM9xUGIiOnvWI00uKUbUwqUUs4UXcrILN
         AqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854634; x=1742459434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqgjLRA9ZHEZgsOnJcAtKDnI3OcwFX4OqnrLwoIU3VU=;
        b=DLM6EbfwdlqPPEEEq6cQjYx8Oqomg+SIx7C/mdpW+pf9swmzUZofQfb0sajpGA8Js6
         XdvPYFwDbmn6ygwG9d15JkbJdpNZ3+HXL8iOxNtvWfH3vC1bGz0dsmGf79sZN1E6rm2S
         SnOADQ6KGgS6tWBo2euU98jMEJn8mWiH5OpU8o6w7SHTMHyvT7dApDK7ACBuoNieF6IN
         j8nQ2mzfZAiiV/TcPv4fi3hw2IffzPk9tA7S8zOGA6JFgs4B30jmRpZgJCeZyYK/X49d
         OQG/11R8eUYSiOYqWPEIn8ZLIC/IVsrfJTdX0Z1ctF/k24kfBlIs2VrzLtwD0KvHDK2G
         8D/g==
X-Forwarded-Encrypted: i=1; AJvYcCUoQy0PyRERDOHrwcMowMcBycap3PavtmqerELf4/qPYOuzsFxlN9WJ8+erhGOdIKcWSYx0JxOFuQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1LDvstVwqhsUmXlubc3vmWFK5VBLj5S7wl8kY/M0f6eHK6pn4
	hG0UWcy2LNS2FA6Smmz1jplTryknAuLlDnmSZ8tdXAUEBY1LrMKcESffnMmqEg==
X-Gm-Gg: ASbGncu7D+JJ+TLa5+VgOJ5dTKfScqV51lFV6EgXoEFzVWZSxRmmttYgKlkPb/MGtWL
	Kz9J8M3SayQ4NayCaUbbi8cQj8wNdcIoQqwlb6ZqWOfxfAgGk55of7KbAZM3iIjvfINKoKByeyW
	Awtslr0Z+qaFCvQOVntCSCU5zBF6wBpzs3Y9IJwVXmmYP0McvnLLbPSRsyNXYnHw+8LcNlwVhP9
	/9kHvVtxOyh3Lx95OBmKsexSM53fKq7hFHLq/MTGv8uGV/9fX8RKu4rMubgpL+VdbaFrJR/keDX
	AuzHcsHNFJu0w2pmsXgqIua8zm7MnRcVQujPzGSBv87BKZ4hN43f3CIVN67Uso+iQHR3tvPE8Bg
	IjZI4tuycd6Q8wI1DDYBSNRs7iugYSQ==
X-Google-Smtp-Source: AGHT+IEJkh1Dx0cxl5c9RuenmfzyuvyaW0vxn6xLir84pKRUHslYxQSSfMN9HPOq+B2VMB0UHHZCdw==
X-Received: by 2002:a05:600c:4ed1:b0:43c:eb63:415d with SMTP id 5b1f17b1804b1-43ceb63440bmr185429855e9.14.1741854633267;
        Thu, 13 Mar 2025 01:30:33 -0700 (PDT)
Message-ID: <9f75fb88-c050-48ec-881f-b963607e89f5@suse.com>
Date: Thu, 13 Mar 2025 09:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/19] xen/page: fix return type of online_page()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> This commit fixes return type of online_page(), which shall be int
> to include correct error value.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

While the patch can certainly be taken as-is, ...

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1764,7 +1764,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
>   *   The caller should make sure end_pfn <= max_page,
>   *   if not, expand_pages() should be called prior to online_page().
>   */
> -unsigned int online_page(mfn_t mfn, uint32_t *status)
> +int online_page(mfn_t mfn, uint32_t *status)
>  {
>      unsigned long x, nx, y;
>      struct page_info *pg;

... below here we have

        ret = *status = 0;

which aiui will need splitting for Misra anyway. Perhaps a good opportunity
to do so right here? (I wouldn't mind doing the extra change while committing.
Yet I can also see that this may be deemed too orthogonal to the main purpose
of the change here.)

Jan

