Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F299D8A10
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 17:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842912.1258577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbjZ-0000Iy-BA; Mon, 25 Nov 2024 16:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842912.1258577; Mon, 25 Nov 2024 16:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFbjZ-0000HC-85; Mon, 25 Nov 2024 16:14:45 +0000
Received: by outflank-mailman (input) for mailman id 842912;
 Mon, 25 Nov 2024 16:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFbjX-0000H1-Tn
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 16:14:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8b5e7c-ab48-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 17:14:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a45f05feso1899815e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 08:14:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc4173sm11136631f8f.72.2024.11.25.08.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 08:14:39 -0800 (PST)
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
X-Inumbo-ID: 5f8b5e7c-ab48-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmOGI1ZTdjLWFiNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTUxMjgwLjI5MTU4OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732551279; x=1733156079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Wyno8rPphA47VwZWsDgvpOflEOQIPKyxvAA9fVLgyk=;
        b=EGnw4gGUp5BYH07JYE1mHH64iY8/rgQIQtPdb7Q7ERQp2ObfWfYpfoASzNVYXonZBo
         zNL/7HKT+ke9bXTPhO/5Jt0OGIpdarZJ3cQGCBAIqUfiZs+NC9gcKvd/VFW+SSbfsIXx
         eE8cXZqvzrRtQxBNgczobVmiQgpsMQLjw1XjXjd/NLnTqZNu8V+yIDPUXhcjxdOrblL4
         GpdwQdQKnh4/cuBZiBRF/hk8Z1GaYKydYrVGk9mZ9GDmbjiztKW3L55Jy0c1SUvIlbjV
         4+1sVv3ZxZhKF8jvMNxU7l0gtWxiSDwUEWS7C5DiNGg16i/iN2f6OKwFjhXH5nk9id8i
         +2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551279; x=1733156079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Wyno8rPphA47VwZWsDgvpOflEOQIPKyxvAA9fVLgyk=;
        b=LfS2Y+OW+MKVZfLZSJfb6GqzANPRNYBzPl5WPblChL9p8JicMwJxsQ/ppqPBhMoO2t
         kfDdH5tTM09TmA2kesZixx24En95f++3GgZwJ1ewS6qijSlmUvra/IdVEBs6KlqizKQz
         HHOU3AM78AxkIywpAGtFUBQmXjiOPpldCHXUpI/Rw8/U2GcPKlwPK6KQR2SD4tXJMb1/
         CVw2JWBRnWUKNlthGF1K/VHeDjijRt17ms4x+AILYEFDUgQoknK2SVlZlRO1o45jY5u5
         jzJn2TsZitAFGDl2Vl+SW+2cUm9Cqha+dAk7gbq781ffDcnWqDMmmqLYb1cHpA1rpQ7d
         XPWA==
X-Forwarded-Encrypted: i=1; AJvYcCXG4iD/Q8jbfvZTmdzhmsFVAhkuiLYets8hc6jELuYyu6yG6Ljcba/E8Qp6WwvS+M7fTpVVRNtM0aU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD81O+tkKE7USXqfTr1q2eCGNVjh3ZPCy4lo6RK8m9BvvdB0o3
	GhHc02c9k5JJqLmf0MwXEAMY66Su4W++5q8r5vsFazFK72m/5lnjIqZ9zua/LA==
X-Gm-Gg: ASbGncslT202a7nwCUVUmgnRA0iak6sNVbjWTL1mJQ2X+OAvYBmLjvto9QaL6UpHNa4
	QVOEB3enr/05aqlJ3MRyFfpiBSZ0BZlI5jWWO6wkrUvGr+uJACV7P8k6iu8B4phE3N7s+gw8plE
	oDeNzjxP5auM4eMqhlEfbigvjqkKUknVK0X7Zwa8BCjlj+aobM3FTmTzRxw+oH1kMmdXphfqBtz
	ym3WY9ov2BOqabNC+Pf0DpnUUw67a33FoV9rKytR+Oav0FjXIr+lm6d3A5UVauwPHgvqtg4dCK4
	wKm+rbs0TcBSv8RkVmxSklJgwwD1gpJJDSw=
X-Google-Smtp-Source: AGHT+IGyydkoOndetPELQHO73VSuO0/OZh7bCS0VHvKSDSYncf2ElQPgLgwlwEUkdIyVUaixOBZjLQ==
X-Received: by 2002:a5d:59ae:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-38260b813ecmr11140229f8f.30.1732551279657;
        Mon, 25 Nov 2024 08:14:39 -0800 (PST)
Message-ID: <7a0ee883-8542-4e17-adeb-9c1d83f58657@suse.com>
Date: Mon, 25 Nov 2024 17:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 0/2] configurable stdvga & pmtimer emulation
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <cover.1731961652.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2024 21:34, Sergiy Kibrik wrote:
> Introduce build options for stdvga and ACPI PM timer emulation drivers to make
> them configurable with possibility to be disabled for finer-tuned setups that
> don't need this code.
> 
> New config options reside in separate sub-menu, checks of emulation flags are
> added so that domain can't be created if it requires devices that had been
> disabled.
> Minor changes since previous series, details provided in per-patch changelogs.
> 
> v2 series here:
> https://lore.kernel.org/xen-devel/cover.1730887415.git.Sergiy_Kibrik@epam.com/
> 
>   -Sergiy
> 
> Sergiy Kibrik (2):
>   x86/hvm: introduce config option for ACPI PM timer
>   x86/hvm: introduce config option for stdvga emulation

From how things are done I'm okay with these two changes now. Yet I'm still
unconvinced as to whether we actually want to move in this direction. I'd
like to ask for the other x86 maintainers' input - Andrew, Roger?

Jan

