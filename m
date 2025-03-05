Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21CA50594
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 17:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902564.1310557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprvW-0000rJ-ST; Wed, 05 Mar 2025 16:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902564.1310557; Wed, 05 Mar 2025 16:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tprvW-0000pB-Os; Wed, 05 Mar 2025 16:48:58 +0000
Received: by outflank-mailman (input) for mailman id 902564;
 Wed, 05 Mar 2025 16:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tprvV-0000p5-1I
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 16:48:57 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b99483f8-f9e1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 17:48:55 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390edaee0cfso4257900f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 08:48:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a5esm21905712f8f.35.2025.03.05.08.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:48:54 -0800 (PST)
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
X-Inumbo-ID: b99483f8-f9e1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741193334; x=1741798134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2Mx6rcaSjNCqldN4rPHe5uowYEKg8TaFdemJazLLwYU=;
        b=eIZezxcVrHsEctUo0HWEe+3rJL7iCD8X2SM2AO8fbpiFFC6c7cOrxfg1J8DHa1bBAU
         eiW5mj1q3IaoOzJd+Pl2EUNGNUYzNVRcrBLdQhmFVt2QyE+ySspvdlTK0xZSxoJBgyur
         B1FuGS6FN0HmH8tWu3xcyaUzEaL3+fKRUcZ+pkcu7/uBruBWutjg/gMSRMslDMWmGatS
         ZJrEgWUI/hQGOo+HIuligtNAjEvB5PlLUsXGi1NpDqC6i0NDyqTJJCEHqAXLNAQr3Ed2
         7j/HaqpsPbUcj/115JTtZLPfDQ2lzCwurssQddUL4gYdU0mJPeb/Me/Mll+g2Gx95xVO
         T4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193334; x=1741798134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mx6rcaSjNCqldN4rPHe5uowYEKg8TaFdemJazLLwYU=;
        b=o/cvOXB+gVw8xleMMI/l6V+16rG074r9amdsa8XjxVYYR2VksttxjLmOhRTkvPevRi
         gSD46mY40BzR3VpD3WN26mPNtM3SmXIaEv62WM4xpkHimX11qOn7Losr0nfjZWEvnabW
         z7P5uQamFkQBaYM015kBTv8Xaq3L7o9NOzxS/KzUfoaktfxYWjosHVloYwBcbRiRLWYT
         5h8GKrfPqVymP4uW+2kneGHJcH56xEUJqr10mWTyD+jJYFE6gzRBDAlf6V9A5RCGCqMi
         4t/Xv/FW4YAy1OcaYJkDO46MS6wHrkwLfG8M9WvcFk+5586mUIT9KM8zExtW3zeeFZSZ
         yV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkHze1IzhScG57JhzncbXJkvuhiOkeX8eV7kfO1I5w0B6Ydf4OtqhXYeoARDD+DKi8XROlSU1VS9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3BnIJkfHBQo9V+bDyVjqCd52xXgkVextRFzUVsywIDGoc0vaR
	hEp+z29mfDaPWTinJdWe3MEjypZLq5RYxpoOTjKmNx1OmQMc1/uAfZ4pczsFIw==
X-Gm-Gg: ASbGncs9nA6AxXJiEwDmYs78wWvlnG05mcLi1+He/YlLqAFglfhWlzrSM/hcjkN6TyL
	f+c99TyCBTSiC8/+fpZxIxC+A9GxSVxKB8hped3qIMPKnx0eZ34V1GfSJutvzEGU2n3nuj//QWl
	p0KPWWM9TUNctg7lqyIi3ldco6bXOPg/PMjf0pDcs7ZqALpbkerBRNHZiPQUIVbowTuWX3sCoXd
	VYIygVtbrYpv4VrF0+WekpEpWSGU4HQ8n5d2xzsuP8KEnVd0Zae/NhXigHdOIgherQOR/4CVKmx
	Q7+f/CPP6bmfpy0mhl/9G7DKN7HSdFWqU4EpkPAFdTGmKs+kyDdv5ypnu2e26zATXqpDKTDP3uJ
	vcuefRqXKLVMOIR8J85RWxTwmqnQfAg==
X-Google-Smtp-Source: AGHT+IFY5W0LcGfXPMnE15YLTNqZuuLZoh2f1nlfSM5PHZg2DB/04Frn8nkoRSHmqLGkKSpDEyQlEw==
X-Received: by 2002:a05:6000:1acf:b0:391:126e:8ac1 with SMTP id ffacd0b85a97d-3911f7c315bmr3108731f8f.49.1741193334444;
        Wed, 05 Mar 2025 08:48:54 -0800 (PST)
Message-ID: <9a958cb6-d9f3-4bc3-9305-db954902f897@suse.com>
Date: Wed, 5 Mar 2025 17:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] xen/x86: Move freeze/thaw_domains into common files
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
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
In-Reply-To: <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 10:11, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> These functions will be reused by suspend/resume support for ARM.

And until then they are going to violate the Misra rule requiring there
to not be unreachable code.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2259,6 +2259,36 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +
> +void freeze_domains(void)

Nit: No double blank lines please.

> +{
> +    struct domain *d;
> +
> +    rcu_read_lock(&domlist_read_lock);
> +    /*
> +     * Note that we iterate in order of domain-id. Hence we will pause dom0
> +     * first which is required for correctness (as only dom0 can add domains to
> +     * the domain list). Otherwise we could miss concurrently-created domains.
> +     */
> +    for_each_domain ( d )
> +        domain_pause(d);
> +    rcu_read_unlock(&domlist_read_lock);
> +
> +    scheduler_disable();

When made generally available I'm unsure having this and ...

> +}
> +
> +void thaw_domains(void)
> +{
> +    struct domain *d;
> +
> +    scheduler_enable();

... this here is a good idea. Both scheduler operations aren't related
to what the function names say is being done here.

Jan

