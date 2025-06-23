Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31395AE37EB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022139.1397864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcFh-0003QO-LG; Mon, 23 Jun 2025 08:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022139.1397864; Mon, 23 Jun 2025 08:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcFh-0003Ne-Hn; Mon, 23 Jun 2025 08:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1022139;
 Mon, 23 Jun 2025 08:10:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTcFg-0003Cp-Nt
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:10:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c7fdbb-5009-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 10:10:02 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso2093590f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 01:10:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a23e5a0sm9972089a91.17.2025.06.23.01.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 01:10:01 -0700 (PDT)
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
X-Inumbo-ID: 76c7fdbb-5009-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750666202; x=1751271002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wIvth/LkYASs0SP2vzU6Ex55Ua7kWIEVPCg6pSuBGes=;
        b=SrZE2uhMDAWCB5otCrQxA67jbG6XrOMZe1YNrqBHz3gfYMyK7+KoM95EapNE2rHVco
         H7qaz3AfDPTdPHO/ihxeb27fFmQK/MV17byTOKvZkLXTcb85YNgHkkRejXyf1aPReBvo
         ixP/nbqDZcL4VxgFY+bN3z9yfd1t9WWXAUCsH5Ss+sMNkBa7jiusFis0uSRBmr2Bm+8I
         0YASdPiZ3SgHpEm8X4uC341eCTDnS2uRetQsafgt41n4q/MjsBK7VWKczKiL9+PGPlvG
         qSpAclQGWMe6uyHq3PTqFyOQyKpIV74TGy6/vZX6wf5l3KCBbYAmpglAaTrL+2/CnBvd
         /SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666202; x=1751271002;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIvth/LkYASs0SP2vzU6Ex55Ua7kWIEVPCg6pSuBGes=;
        b=DqB/6DnbqRYg7ZutZeHFuBLYGJy08IwtW0QgHIVjmoQfWngAg4XP3/ZV8kJ6/Xtw13
         bMm++0S927YLGxabgHmCMOJUYgp4gM/McZ3ZzoaEL4m3Fcpk4GGQAyygAjqZBu832Kh7
         EStthHsdQ51+6nL6mv4Xei3s88uSMk1tyNrBxuWnGV/SF73XKxe2ykj5etXqr11GSPv5
         WsyTEheqxJsGVs8QqOAPqvHWD+VOtDXvEI3llgdrdv9O8QfwxzyDLsBkUqjKAW1XmbeU
         qauWoEHZ29Mwse/w0aYSlPo+xFQoUZ/xedww42SgFKnsOlm7VnMuXweAI45iIXbtGOGI
         7b4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSsObiSUubksMfc4eeZ8aBwOskHmU3jXrofVW0AN5E9nUJZ8SNWSI47Iw4OAfUVqUMteGoiEiNBaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJwImI97J8rRDAZGX6tEeWRx6Fdj5Kzp4ff+t+i9bx3g/wbGFX
	pzq49RUZ06w/EUHl5dxcxl1jBXXCfLg8AfQOjWpqUQvCyAd+FOG586dLBsqOVTsC/g==
X-Gm-Gg: ASbGncsbWOMx+JXfDou187oU4RXm4FGgAkHAOc5Nbprd5BgIBGSugt8PyaG6bNzNlwu
	u+mX+FIyrXNjqM9kfr38rLI3p7+v6IntTooiRcm+jbnElFPdwCbQygSZKOTL9Yz4MMptd+s7tP7
	DbqvGDCw43cJIbTJTMYyiaVDYHdg924cV5krf5okdHe/WlLQ3+P4r/5ASkA8SRshgE99WO7lTzs
	jJ+z2oTadZW0oZITvtRF2W3uhGeDsVILnF9vhB2KJZeg+QekMtgwLtRJ6b3M9REtkgQYXhmhy2w
	o7eAcgC0WFHaM8/QWvENgN306zOkz/OO0WEtBeYmLRq19Gmb0meN5f95rVw7JzIirBLxP+VS849
	qOa7T76Oabxt3vejN4spNLnmIpnbf98IkwMnC2RucDmWzRDmZVfBJupcVEA==
X-Google-Smtp-Source: AGHT+IH/Sc+Q5z7sDiHNCD5/p8I7yNoP4hSQeKajRwUxWupQNUS6x8akf9qAqgY1/gd+NV2V9M7/Xg==
X-Received: by 2002:a05:6000:25ca:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a6d1329a17mr9394561f8f.39.1750666202128;
        Mon, 23 Jun 2025 01:10:02 -0700 (PDT)
Message-ID: <f4b2c2b1-c7af-44d8-878b-ef5a0facbebd@suse.com>
Date: Mon, 23 Jun 2025 10:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/domain: fix memory leak in domain_create()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250623011514.173367-1-dmukhin@ford.com>
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
In-Reply-To: <20250623011514.173367-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2025 03:16, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Fix potential memory leak in domain_create() in late hardware domain case.
> 
> Fixes: b959f3b820f5 ("xen: introduce hardware domain create flag")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

It may be relevant to mention that we still can't very well use "goto fail"
on this error path, as insufficient struct initialization was done just yet.

What we may want to consider is to move down the get_unique_id() invocation.
It's not the end of the world to lose one, but that may better be avoided
when we easily can.

> ---
> I think that no memory allocation is required before performing late hwdom
> checks (ID range and hwdom existance).
> 
> Looks like sanitise_domain_config() could better fit for performing such
> configuration checks.
> 
> Alternatively, hardware_domid range could be checked via custom parser
> instead of code in domain_create() and then hwdom existance can be moved
> before alloc_domain_struct().
> 
> Thoughts?

Keeping related things together is the other desire we commonly have.

Jan

