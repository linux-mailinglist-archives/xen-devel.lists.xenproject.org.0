Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE6B16382
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 17:20:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064130.1429872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8b4-0007Tc-7t; Wed, 30 Jul 2025 15:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064130.1429872; Wed, 30 Jul 2025 15:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh8b4-0007PI-47; Wed, 30 Jul 2025 15:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1064130;
 Wed, 30 Jul 2025 15:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh8b2-0007P6-R6
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 15:20:00 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b1fdc9-6d58-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 17:19:58 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7910123a0so1986333f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 08:19:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76a167c678esm4180914b3a.5.2025.07.30.08.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 08:19:57 -0700 (PDT)
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
X-Inumbo-ID: a7b1fdc9-6d58-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753888798; x=1754493598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UivvbNn5sedDEexyfvr+ZQ4Db1aCreNb3Y2VkRUUWBg=;
        b=EcRtra3R3llw3mXSX2GpRWKCULrs5FqiVwam557ej3vdBzStNZAAQ2jOg+gV3jVqyj
         gwdRcMpY7TukckxOqk/JX5MYg76g1S4mCJXClnRdw8J6Y4t2bWx4Htf1ZSokBDhnD+VP
         hMws/ToO1J8ayG/KdbplizIOZoIrxZPr9jIVpuZhFsz/+vsi45OZiF8GYMlSLVZ6aqPF
         BPuAuuvGoAvLrJuV9Gq/idnnCn+iq1zQiS8zAYzyz3cWsd/V4lzbL9L4pVQV+nAFGCw6
         mbY7cPiT3pei6sbwwmSn/IABM5LX6s5BmPnqkjIokvvPOeApTJwHl0KvCyVCq271J/mu
         6yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753888798; x=1754493598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UivvbNn5sedDEexyfvr+ZQ4Db1aCreNb3Y2VkRUUWBg=;
        b=HRW3ia7QNIhYq/bnRb9izx9bgMjLCTNt85DJ4nTyQF3hv/xqBiheD942caWSFfzkib
         Z3FZKKfhlVpSsSB87Nd7gBYaJ93XfyjHC0N4jb7wrx9uMkJocfGJAa1luOAOjC1snurV
         AmjTdxFPLG2+Y7z1aFuHKqj/F5UxqAEqbTUGVvjBqEqNSJiVLo44PX6c/1tLOPqMpuho
         vMQUI+Niw3OYXqsv7BKcVYsKDth+iZXMnD6L80sOtTAezBsDPT3MUmJXrT4mP1Ez7QG+
         h47+ph0M/TC7/RI8ujX8bKJI2x0180ugft1dSEVKmMm4SlHkwdDSOoruC3mxJ7NAVcvB
         3oWA==
X-Forwarded-Encrypted: i=1; AJvYcCXCjQP2sj3qgRlrx8CQr9HjX2WMg78TN6LBpYvetv+NXiZMb+2P1SWefzO4x+Hc+IXkhr2JZsfW92Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvIeuvyD8+HcFV2/YUPcEouYTooseKtyhiz880aISIeYcs2NLO
	5Tsr2NvEbm6mM4Q/6tgsFdeQGDpoz6FPqMCYq6UGXSO2UnWJj/DOTRSlALYYPZm1YA==
X-Gm-Gg: ASbGncsKUwSQNdka/8DZlTnyo8zTCysEd3nt0VV2uMMzFgKrEzK89GujvSgqc2hWDPg
	S/Mfg9atzyAiU7+WtmhXnDLv1cE135WKjusnzZMWvGtBBZBH5j3zBYPSxf6IsyQgYd9k3cMS7hQ
	6nAAIVFPPO0qCwAFb1sq+8L2pvFDOrbgXNsSWvEZcDShQMi3DLnslpxwqFzgRkMaJr3DdrDVF0F
	/BqrGj3BCe/LfDrlM2hufpWpJNTYAZ9M0MG8BFACYkuJ7S91yWv8KoSeOGhzFHbEzgiPX3xTQsP
	qG6SRQ/70f01U31sh7TN7QJDgIMBlpDcqfUryPiwXyfWEKUB7AuIlk6kvdxLIpxoYylzwdenMx5
	sKi6E0ioKiebBogy+tPkojk+4vbA/hCQtaUNo+GgD8K56SXM61vkt7QjA/6y4S8p6UzZd6qwCjp
	6ZTrRelV4=
X-Google-Smtp-Source: AGHT+IGENp2P4WiiFC1YOFaJ1LhFNgPa18TPCi3qMmlicfNjs4eJR3TwZq1YUyUIsHqXW0Ox8hsdNA==
X-Received: by 2002:a05:6000:2386:b0:3b7:8af8:b90f with SMTP id ffacd0b85a97d-3b79502a250mr3060713f8f.40.1753888798037;
        Wed, 30 Jul 2025 08:19:58 -0700 (PDT)
Message-ID: <c8e89f88-3626-45eb-b34b-2ab4f2e8eccc@suse.com>
Date: Wed, 30 Jul 2025 17:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/xsm: Expand XSM_XS_PRIV for untargetable
 domains
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-7-jason.andryuk@amd.com>
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
In-Reply-To: <20250716211504.291104-7-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 23:14, Jason Andryuk wrote:
> Untargetable domains are currently hidden from the control domain -
> e.g. xl list will not show them.  getdomaininfo fails on the
> !is_hypercall_target() check in XSM_TARGET.  Add control domain to the
> XSM_XS_PRIV check so it can pass.

This feels like a pretty gross abuse of XS_PRIV. It once again supports
my take that the level of granularity you want will require Flask. Or of
course you could also come up with a new access control mechanism, much
lighter-weight than Flask, but still not dummy nor SILO.

As per my reply to an earlier patch - whether it is okay to prevent e.g.
"xl list" to see all domains is questionable as well. I'm not seeing
"interference" there.

> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -87,7 +87,8 @@ static always_inline int xsm_default_action(
>          fallthrough;
>      case XSM_XS_PRIV:
>          if ( action == XSM_XS_PRIV &&
> -             evaluate_nospec(is_xenstore_domain(src)) )
> +             (evaluate_nospec(is_xenstore_domain(src)) ||
> +              is_control_domain(src)) )

Like in patch 2 (in is_priv_domain()), I think this wants collapsing the
two evaluate_nospec() into a single one.

Jan

