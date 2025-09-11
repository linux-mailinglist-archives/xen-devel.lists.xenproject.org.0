Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EEB533A9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 15:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120271.1465284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhJU-0003ND-R2; Thu, 11 Sep 2025 13:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120271.1465284; Thu, 11 Sep 2025 13:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhJU-0003Lg-OA; Thu, 11 Sep 2025 13:26:12 +0000
Received: by outflank-mailman (input) for mailman id 1120271;
 Thu, 11 Sep 2025 13:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwhJT-0003La-9t
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 13:26:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0c268c7-8f12-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 15:26:09 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so101799166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 06:26:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b334ed29sm131214066b.107.2025.09.11.06.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:26:08 -0700 (PDT)
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
X-Inumbo-ID: e0c268c7-8f12-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757597169; x=1758201969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sg4kGQHdbEsMsy1Uynhefotwcxa2aAEMZ9/hvyKJum0=;
        b=Cil5aiwNpPR+CQNTLaOF5S77G6AmA/Jl/f8KuCJkYufbmy+DTlC26xz4c/XI8IMM71
         1F+cLJxym5XGQXJiriw3cZOM6HHGL0rDaZU089KZfU4PCYCLkkBtJi+xMz5V7WsvZkYb
         d+RlHSPSg8piTnV+NU0IESUtdiUn1khvgtDPLYm9v0BCTpwEtHW9VfxUuLTEyi/h2LKC
         FF7FWCcYIgzwmwivT7DiP1lw8aY3UV3JWrj+cj1RtiNirX/zzyHSsdkSo1MWCd1Zafnk
         JM00jA+dHiWZNsKTzqCKek05eiiOwin67dA4fY/ic/xww4NUa5BFPgRVuzjn2GRMYizV
         tpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597169; x=1758201969;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sg4kGQHdbEsMsy1Uynhefotwcxa2aAEMZ9/hvyKJum0=;
        b=ZAN8I7gFd0MabKy9zkZhQBrwl1LbtsMg7SLTaUhgzRb63hxaxeSjejBWL01uxxWu+J
         OSfZT497eC7FoYhFKLp2nVDiflvQhgLPNXKyhtTiYk4CbOiv+EXzlUDGslJemP7WCPaK
         pwCeWsWhRKp5hvtBaXI3QFkNWBN3KAPp82Kd22XGVgPccIiE0FFYbk1y/jrZLI6Gp4vC
         E+ZmsPtCprsMvyYMx511h9HP1L93JeqlbBgdPZd9dDtApdReRtEHwAvVZ287c5ss/4B3
         HQpjl4tN8JIJF5rGNBu0gOR1uSZCln6nFJXisbHzRIhQcBJoemlvcnljNPgDAoI1pYOK
         LTfg==
X-Forwarded-Encrypted: i=1; AJvYcCXUEVY2FFIfV+VDk6q81vKRb9SLWMzBlOb1iEzsk+NTiRGEkeFFqOlmKnpHVRqAY1bfM9Zf/bsG1Do=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/YTwWE62Pn8JjtzUeuem3Yvk7QUoYHXsrNtheX7UGSLgBSprK
	IFZXC14nTcQdawlHd4LVSYej2I0xTmxJAHEVj89630zI6iZ8FfW3R86bMi54XdkGHA==
X-Gm-Gg: ASbGncvc3a7zkuvSJ5pUSbC7wtoFI9mF6Cy7epN48aNxXSs8lCjdqEH3D1o20UGsi2X
	e6G8gE1D9NLk49ihxrbdv6Vb93rReeBTn1FicrgTPCni5ykPA5P49p4Kl/ksQKvlEdhM4+mXSnL
	EdngJ7vDRmYtUR9uuDAQAntdnH1LziYVHQBA39DLklDBlXMYbp5mUExTpta7B8iYvXUvn4VYTsf
	yEkfQOPA0HElnPsK/VAW0FhdCwels0Sb+1vpEIPm4s6vzCLFFWfR3PxfeLFzMCU/9sAo6IZP2dp
	0eC41daBJ4EeOnPWA/hBLM18azlGDw4t4B65M8ufev1LZmAOnNoMWTd6b3kfOiZIaZBvIz1D9Gs
	h0cRRI3lBx1J47bfpBanjG1bBgXNCrkT71IvOEWdcp7mjUXIpp2i24kgdPs7ZU1ip8E9XXoU5JH
	9DjmA+mOrpnMM5YMdPaw==
X-Google-Smtp-Source: AGHT+IFVDiWambJBLm/XHcqeaV9jSmbF4S6s0EZAFYrlJINiXpZcl6nM/A6G0QMaEd8JDgO6TPY0dg==
X-Received: by 2002:a17:907:7e9f:b0:b04:5a74:b675 with SMTP id a640c23a62f3a-b04b1401165mr1702946466b.9.1757597168674;
        Thu, 11 Sep 2025 06:26:08 -0700 (PDT)
Message-ID: <7bed306d-ddd6-432e-802f-ee0e4e8c5cfb@suse.com>
Date: Thu, 11 Sep 2025 15:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/26] xen/domctl: wrap common/domctl.c with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-27-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-27-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -151,8 +151,17 @@ void arch_dump_domain_info(struct domain *d);
>  
>  int arch_vcpu_reset(struct vcpu *v);
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  bool domctl_lock_acquire(void);
>  void domctl_lock_release(void);
> +#else
> +static inline bool domctl_lock_acquire(void)
> +{
> +    return false;

I.e. a someone invoking hvm_set_param() with HVM_PARAM_IDENT_PT will loop
indefinitely on getting back -ERESTART? Imo you simply cannot get things
right here with a stub: Either you have the above issue, or you put some
future new user of the function at risk.

Setting HVM_PARAM_IDENT_PT being a toolstack-only operation, I think that
needs making conditional upon CONFIG_MGMT_HYPERCALLS right in this series,
such that the last caller of these lock/unlock functions disappears.

Jan

