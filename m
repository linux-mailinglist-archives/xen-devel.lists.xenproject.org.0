Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D74A80D48
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942293.1341502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29bx-0004Ay-QB; Tue, 08 Apr 2025 14:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942293.1341502; Tue, 08 Apr 2025 14:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29bx-00049W-Me; Tue, 08 Apr 2025 14:07:33 +0000
Received: by outflank-mailman (input) for mailman id 942293;
 Tue, 08 Apr 2025 14:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29bx-00049Q-2Z
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:07:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf63610c-1482-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 16:07:31 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c1ee0fd43so4702719f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:07:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c300968c4sm15127175f8f.9.2025.04.08.07.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:07:29 -0700 (PDT)
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
X-Inumbo-ID: cf63610c-1482-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744121250; x=1744726050; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qb48JZToc2QvsLJWoQSETQwZjXT8vZIo//0Qo2SJaaw=;
        b=YGKy/JhIx9WqtIvhXgPgsW2g0ErayQGqXp+4S+qHno0m3i2NNAMb+oqL2Tl/ts+ESC
         dO8M8i0ikMOaWxWxyYbvBIVdSgEBcyfMMJ+0YT8yhIajVikZvFx/i95sn50eO/OTRrv7
         lZDO33ha0v7JZYc4wkA49QjFD/BSWYAoPMLUS3uuQvZUB+qdppYUu8vf6z+rpL+T/oV4
         u2vDQsbhxgLrnwm8mYrt18FYIOVNQ7IpUH273g2KMiNSL6xacksOuBLXU2UBFfb6Za5C
         4Pvgmgg75PJWhi4ABRF7qwfvfHr2SY6kKeLyeX5u7xlyXQ8AzrJwn2s2pmskNifRWeMO
         2y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121250; x=1744726050;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb48JZToc2QvsLJWoQSETQwZjXT8vZIo//0Qo2SJaaw=;
        b=OPOriLyEhpfQ2+JRfUkRyZ3u+hrFjHtkZxyUq2lQ6r/tixsLIfZ2MfVND8Xl6p73Sl
         njg0g0eIsIOWy3zLf++PTp9Oatf6bz6DPc7Kntp/mkx6bC+kf408rGx0Oz/VNjs+0bh5
         wCUb3DDkX0LRICUtGwEyhtzjMHpjlLK1x31NCjjp1Tb+ejRR/xF9ES8MkoHMHUqiGOXx
         n0CRIxQ1glZV5fvdVFJSjUNzBk1XtWmKm4cH4R6rN+RWDSeyxYpzvs/XPDLMc3tPf98L
         Snug6ijpFa+r4oRM5iL3hxDx9jeMBUUCWetc6rdaMIWtd6PUh3oNwzmalxaOnifFj3dJ
         Qong==
X-Forwarded-Encrypted: i=1; AJvYcCURfvsYLoOgjqcngyqXA0qfDO9ja80mqtgeX2bfe2iykRN+wCjwl120+V+6/J3VdcTAXNDA+ZHP/BU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDrkul6i8gj5yk14Ju1RSKDPkj44YD5BK6WQSGIJV0JPuYHOci
	jwtU6x/pYrLM0GFzwovD+JYGtzGX/kw2yil8MbqLZ6QHM8L9FVt9AJTiyMzLuA==
X-Gm-Gg: ASbGncszsdagM1+asahUs0m7Wx54uN54fpgXCzBfk6Sj0l2ovHdnb9kgv4pmLbQ1Ehq
	Ok3AqiV4j4EjNBfB3viJWdQz69S67ZUozYMXc+gVwE7izxwNJz1roKa7ks2UhiRYhUuyEZz/Owr
	O1ZhREV27FTBGJEe9F+jFrhUk+GcBA8nD3VmDqwbyQ7egae6BjJ3TAmRNw+PvlKyxrfZoqnUxzq
	CaQUle/UEX7LhMtNVUx4xKUzwa+kKP5M+Kwu8m0DOcIYITkpDmHkGygXV1h5u/B7+1Ujd3ffJ0e
	qxeI5NaChB8IWPa4FfWawsF6EFVmNiD9zF+KK7776TyonMxEp9wE2Tmpi0rZq7HP54VOeHewqDA
	H9FT+kMioLpPkT2gSJuV6DCTNZE59NA==
X-Google-Smtp-Source: AGHT+IEgo9LeNvI3kkQGR6wu31JTrWRdLGRHNNOyl7vOe5vQqEQEzZkJlmrXL2F+hozKGUVwiBe60Q==
X-Received: by 2002:a5d:64e6:0:b0:39c:1efb:ec93 with SMTP id ffacd0b85a97d-39cba98b7edmr15086266f8f.48.1744121250227;
        Tue, 08 Apr 2025 07:07:30 -0700 (PDT)
Message-ID: <6a0c4357-627c-4cce-98ac-4e8c91f40429@suse.com>
Date: Tue, 8 Apr 2025 16:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl+hvmloader: extend IGD check part 2
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20250408132333.1524246-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 15:23, Marek Marczykowski-Górecki wrote:
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2575,7 +2575,8 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>  
>          if (sysfs_dev_get_class(gc, pci, &pci_device_class))
>              continue;
> -        if (pci_device_class != 0x030000) /* VGA class */
> +        if (pci_device_class != 0x030000 && /* VGA class */
> +                pci_device_class != 0x038000) /* Display class */

Nit: Indentation looks suspicious here (can likely also be adjusted
while committing).

Jan

