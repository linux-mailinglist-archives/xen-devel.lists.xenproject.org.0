Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936BB149CE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062149.1427772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfR3-00032T-RL; Tue, 29 Jul 2025 08:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062149.1427772; Tue, 29 Jul 2025 08:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugfR3-0002zM-OE; Tue, 29 Jul 2025 08:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1062149;
 Tue, 29 Jul 2025 08:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugfR1-0002zG-TH
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:11:43 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a93b4576-6c53-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:11:42 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7746135acso2563669f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:11:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24022b8c82asm40652305ad.143.2025.07.29.01.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 01:11:41 -0700 (PDT)
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
X-Inumbo-ID: a93b4576-6c53-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753776702; x=1754381502; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b2tFUculQJgX2NC5GqqpvDtUdRUJUiJ0PtMI2aK4ZUM=;
        b=JtVHISb9IShEKpdvZCfzTOx0TLBkfbofphwN3zGdGgosbUC0fBzVEX7dew+WY/h/Pq
         T6qMs8hdwWlXWQm1o4St1xqqh/vFbK+MbmmeFaD8Vj9zSx/ABOqqI9PnFUVtk99UGV+M
         FIoXUMTf2lk4wWU+7ZKWb8/ALi8bJu25ifR9h22FUg19aqy8efB5l0YSmEF4shE17p/m
         xSqCln+/1fR7srSDnXWgIMNlNl43ykTK6SY84cgkaCtjVbZG0FkdPD9ek319tts6ljHc
         r0gOOECCPpGyo9bH76gjn+rItq423suLMnHdycSVbw20RQlUBksjt6tL3ov6qpTJ9gzX
         TviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776702; x=1754381502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2tFUculQJgX2NC5GqqpvDtUdRUJUiJ0PtMI2aK4ZUM=;
        b=sb8cocZQROi7x+Bwi0PyqQjXUCUimW/mttrwjrVAXbo37Oq/0mE4JVwfa+dXXSvNjm
         qPyHGpLDjvwd++UFhRZWWi9CJBTm34lBMdSECj2e/YaKYdqmRbePgNHEtMMzX3DB+K3V
         lX3IWbA3Ke1m95LfdZ2UV7Zlxq0d6P6i/UsWfti79YsCtt0XQyszicLJ+91oXP+21ujS
         Nu3jFuCcv1G8+JUq21WMVL7ftyqxvsaQdDb8ch0tOa+okesqk8BgLs5dV5hOucNYn8mj
         MBa9WUxPt023xVe3W2Yi756Iu/6U9MPH8sqyElmlwNpf1jdQ+FxZ953TjTqrE8AEIjcI
         A1tw==
X-Forwarded-Encrypted: i=1; AJvYcCXMERFo2ZAwZhJdnYvFFoaddzNEDvVqYZIFV18EIJ1XDleSaWR+DxqMAjIJ6QRV/zw2CygsOukz5Vk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUGTXjV5KycpuT3Mgw0FlAA6tKDSrvbiMndogkkMKMDmtU8aib
	WC5OlPozMA+xz4vS6mIt/OMv6GwWyNH/jz/Ggp2USjokcIL42vabgIQTiVA+rxW5sA==
X-Gm-Gg: ASbGncsgaV7VHti9rcS9DbEcq1ZW/tbtzni8o/VVx0P2rtKTIlyPDcbydWvNGlWDZpJ
	YjR7t+0FU3NKxmbn3FGVBiFfP0ovP28jAQE8m/a4eNmyqFcp9Mdn3BfGb+eSYi7sEUZ3LSY7dOm
	2ivU6QDqdRc572MGcFHXG20F5DCl6WuidzaNZICQhqoGtSqw/vX5jW/clDQX5Qjj6f5PsLEzSjo
	r8p20Fy92WXoxLYsJZ8xqBfHYD0LYulj/OYSlP225QdceU1ChWqnO4AU5M4zP+N5mJ34mznORqk
	5lTG+rDXoE9csFG5B7qZIRvKhEHyA6NaTliOeGwTcJHcTXT2gPe94/4P4PiqMnYQTD4nsEWulwY
	730D5ufEU2z2OOSsOu3cYuggHLLPG3FGnvZuZ8Q1pu8MFVfyJamUB9RDmeCAkKfk+vp9KnuNN4v
	CSxxPWgsI=
X-Google-Smtp-Source: AGHT+IEhhT58BEhLCThO3cXfACEhIop1A52dejpWOy7pkOoVLGzlGR1XE3lz96QPc6/+OJadBzcQ4Q==
X-Received: by 2002:a05:6000:4203:b0:3a4:f00b:69b6 with SMTP id ffacd0b85a97d-3b7766818c0mr9773338f8f.54.1753776702096;
        Tue, 29 Jul 2025 01:11:42 -0700 (PDT)
Message-ID: <7fadf942-39ff-42b7-ba32-c37ad65fa5cc@suse.com>
Date: Tue, 29 Jul 2025 10:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] xen/domain: update create_dom0() messages
To: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250728183427.1013975-1-dmukhin@ford.com>
 <20250728183427.1013975-4-dmukhin@ford.com>
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
In-Reply-To: <20250728183427.1013975-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 20:34, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use %pd for domain identification in error/panic messages in create_dom0().

Except that ...

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2081,17 +2081,17 @@ void __init create_dom0(void)
>  
>      dom0 = domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating d%d (rc = %ld)\n", domid, PTR_ERR(dom0));

... here you don't (and can't). To avoid people wondering when they later
come across a commit, I think descriptions would better be accurate. It'll
be Arm maintainers to judge whether they let you get away with this; as it
covers x86 only anyway:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

