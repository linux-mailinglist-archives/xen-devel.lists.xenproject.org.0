Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A012ADEF12
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 16:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019218.1396021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtdw-0005tc-I9; Wed, 18 Jun 2025 14:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019218.1396021; Wed, 18 Jun 2025 14:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRtdw-0005qr-FM; Wed, 18 Jun 2025 14:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1019218;
 Wed, 18 Jun 2025 14:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRtdv-0005ql-Lf
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 14:19:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc71f10-4c4f-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 16:19:57 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a589d99963so1699458f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 07:19:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0d0bc4sm100182125ad.243.2025.06.18.07.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 07:19:56 -0700 (PDT)
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
X-Inumbo-ID: 4fc71f10-4c4f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750256397; x=1750861197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jKA04hkWg40rxWLiApHLAhbT/IQ7ZTsGV2yPqcRpqTE=;
        b=B7WNl/a70980PL8a2hVhbFJazLC5oqjjHGWu6btrpu0WXDOwD88jDzPJHh2L2xHcRR
         VXnEVjd2PLOFjrUQAxv8kTg9DkzjSN8FgwGl2UCJ4gb+/YmKjWjTCxEAtVFzi30UG+vF
         pPmoV/oCNknX5E+R47N+u/BxSQi98zGaiWPIvv+1xiwyXA8Aw5Ndu3PWT2X5MQDFwy20
         rtYuSFVmFmtn40gwaKOqcMtdnVSL1wFQLE9qjQ3JKHJ/KC8YkSvf1LB87gFhaJIKqwPv
         8FNedKe9zZrwj8d93eBYWcRD+ruiPRGFjnZMOxoFOwyMRx5qcHXgcD34Ih8Aj5kiPK69
         9QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256397; x=1750861197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKA04hkWg40rxWLiApHLAhbT/IQ7ZTsGV2yPqcRpqTE=;
        b=gRMTiXl89j87z/eBg46ZyM2CxVyij/+oeXe3RmgaLZ6FF3f4INJvEoDVSx9GaQy8el
         JOlW0/c9Q7zoepiZ8XlKvguytzev3XHBfLufRxi7bXJHAgBFwsIpCsmJTXoch5qoNjqt
         L3loW7Vz99gG31kA4eYafkb6z1vyNCNDW4XK7QYwaDQ/D2l6ACo/7fN6qm/r2qSOQj3i
         Ybbxz3z3rHAxj85MoTGynoghiNwyiVJhu8c2uwSz3aspD1dhlOf0x3X/1WGepLODUwLD
         unmOGOvFrtTnmnrHHaFNjNhccpjmTpheeMCr+gWQsh0Qn01h9260eYbjA+AD+Bchblef
         2jlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUxotMq/dZy9qgGgNcjk47lcker4CBoLMdOjCDqOJnhIl4TmZ+9mFrPPqx470G5c9NyJfmOZI/na8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbl6brB/5+Ckzlq1kMFTQX4gChnA5qHwswSuF3sBFYcPZuqJa6
	qgeeIdFwTZdj4ICeyEbiVq6QkraH6jpQ/oaj5gtTuCyNaDju6WkZ9VPNxvhwcPgKpQ==
X-Gm-Gg: ASbGncuT/Azhf7rRpISEP3GzOFjK0i5092yEcjTrxo8IGdi1AUBPiliLiukCPKEeaDw
	zlq+OvUixZ5xYo9ArnkNxlk/gOSNsLz+mTZIpBbTGvtPFZKIl9XMyhgYYa0ZLFxyW73HPT/SMfz
	+oFqiyfqY5l1V2qG5Gy7ZoFo594Nxl3qHtdn5l/CLoP2PFxSBcCTnMhQtyn7cd/ib6H1/OqhKqt
	g2fZ0xTscQ08MxVMn3GL7uwqI40jo7RBtUp4X+9U1+jTpRF/SN5uh9uGS4xG87COoLs9Ddsv5hk
	bTtCgO+BHuqBCo9Ss1EpCZtnWVNTkbHAHcDGSHWl199uKpDaOCs8iykgnshIGbLquJ6Jv9TKCe7
	QkXmhM9K9YnO9vM4hb07oNYrPHxqG9bwm1oMfTu0JNuci9ts=
X-Google-Smtp-Source: AGHT+IGcg0W3NgZhAG14HkcKQ9nR2SvYsoXWHEYpLXyFV7obKihCegH3BKaUw24S2Xu1Cu0TsdvxUA==
X-Received: by 2002:a5d:64cb:0:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3a572e2dc2fmr14693628f8f.47.1750256396832;
        Wed, 18 Jun 2025 07:19:56 -0700 (PDT)
Message-ID: <b5774f20-c333-4ecb-85e9-8ff5e8b15307@suse.com>
Date: Wed, 18 Jun 2025 16:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] vpci: Hide legacy capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-4-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250612092942.1450344-4-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 11:29, Jiqian Chen wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static struct vpci_register *vpci_get_register(struct vpci *vpci,

Actually, even here (and then in all callers) the question arises why this
isn't pointer-to-const. I realize ...

> +                                               unsigned int offset,
> +                                               unsigned int size)
> +{
> +    struct vpci_register *r;

... this one may not want to be, as long as the function is required to
return pointer-to-non-const (assuming that property is actually required
anywhere).

Jan

