Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC9A645F4
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 09:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916282.1321392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu62O-00056g-L0; Mon, 17 Mar 2025 08:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916282.1321392; Mon, 17 Mar 2025 08:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu62O-00055E-Hp; Mon, 17 Mar 2025 08:41:32 +0000
Received: by outflank-mailman (input) for mailman id 916282;
 Mon, 17 Mar 2025 08:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu62N-000556-8o
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 08:41:31 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9903e717-030b-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 09:41:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso12306175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 01:41:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8e43244sm14568690f8f.60.2025.03.17.01.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 01:41:18 -0700 (PDT)
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
X-Inumbo-ID: 9903e717-030b-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742200879; x=1742805679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DRx4++XsF28BgBALvKQcfDnGxthTnKODHAdd4sZOmoc=;
        b=YOSyatpBokQig+PSKJjp3PTMdnLg48DNR7qPvs6w1zUpDRHRkq5zySg9GDCLVMCoXi
         cHje/rjSvLKOUCY8RTKeE7e7Vb4ew/ZzonN/3k2nVAeDPg5MGBBfkTxVgClP2DXAgQ/c
         GX1MnABG+KmElcf2AGuneHBanEa2yMm284ohkxuqCyFeTwwkcNLiSQGpFEySKcvFMSFu
         y44rRXLig4Kki9zHNcRThYjQ7V/jmIX7uqax6IKG2edrMMz8fRpx8u6pCYUKHOPnT6nn
         UAy6xXcx9Z+SieAUiqFUYYuBJJ2fDCTtj7qgfh2DlHABgPZJx1/9YEYtFi6ObncOb70t
         pJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742200879; x=1742805679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRx4++XsF28BgBALvKQcfDnGxthTnKODHAdd4sZOmoc=;
        b=ghWOpcQPYiVrW/uyjXstKnFlIjaHd2UzAz6erYYi7VoAGXyQHpEMWI2Afzz4KomnSc
         c1Ulvy85ZHX/evzCqMojXE+HR7QJG1gzx/KMZVnKb6cG2y8rX2gZJ+0pGV6Yr3EzXJB0
         A10ee6gKaAcGS89b9QRtu4creygjWil6G92avK35ER+Lhm+RFJ1AFSqcIEIDGeWJ9v1c
         PXgrnBAys71vChYs56ikYlTT6HRTOJYAE/AIdYqBlI7DX8w+OyemvrooChpPlhHzvMqf
         3CAW0kiM5hp443YjGvxUro4t8UJxvddUgPMldK60NaqODFVegSE/qmP62U1oqafBzgxv
         b9JA==
X-Forwarded-Encrypted: i=1; AJvYcCXLuOb8pjO1fKb8aV9ccQGdgrPDUaWYDxHPjaC88Y1tu9l8Jeoz9Gth25kywh3LVhelgoclKlZ6pmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzkz6tiEaqAXav55Mgu8rtecQGlf8+SwyxWzlKh2MGgUJZBBmA+
	Arvcf9QGsDCAvMK6nfNRmHRHI/ejxBheaJIuRHh0kS/qjxWViIWnl4AT04gfDQ==
X-Gm-Gg: ASbGncuPdkAjIn5WVFy/g/rAWPQktRW7AIL0Me/6E7iByYXWyR5G9AP3dxW92BV75CU
	x7xHQa1wPCMCvQRWGVHtIo1n0uATtqZB45im9CcC2ebAKt8gv0A/uOYfULJxhB5wn2KPuc/i2Jz
	xZ1RivTnWdBkDHPTBGylRJOdmOJmN1ja7kZcG8/c9NITsiPREOeDGxsJYDJj2oJKstS6RpWuWSl
	Lhy7K/TlasGkTpagAM+lNdJRBNqX981D+KH43sZ3FzZ22nN/4FlWMxbffjPOmLxTbettwWF7eBM
	8+Iko1SuSq/pFm4GkNGvJAs6BnuKv2pzx5k7eDSDy6V+rthQ6WMWOPAyO4LN+5BjzLd2dabFMdk
	fTluPT4fx6AnJcW7OxWKCGA/46dQDOg==
X-Google-Smtp-Source: AGHT+IHK56m/UHpLqBaFDokfcwCq9mA8ierxVHC2FxAC/mxb5YHSqqv4qKTYhRbfIttNzUMvfKvSOg==
X-Received: by 2002:a05:600c:511c:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43d1ecd60c1mr110347245e9.28.1742200879118;
        Mon, 17 Mar 2025 01:41:19 -0700 (PDT)
Message-ID: <763a55dc-79ff-4176-9286-17a144bd8da7@suse.com>
Date: Mon, 17 Mar 2025 09:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] xen: introduce Kconfig HAS_PAGING_MEMPOOL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-7-luca.fancellu@arm.com>
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
In-Reply-To: <20250316192445.2376484-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.03.2025 20:24, Luca Fancellu wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -74,6 +74,9 @@ config HAS_KEXEC
>  config HAS_LLC_COLORING
>  	bool
>  
> +config HAS_PAGING_MEMPOOL
> +	bool

Imo this is too little of a change outside of Arm-specific code here. Just
go grep for "paging_mempool" to see what pretty obviously wants to fall
under that new control. There may be more stuff. The stubs for
arch_{get,set}_paging_mempool_size() likely also want to live in a header,
perhaps even one in asm-generic/.

Jan

