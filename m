Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A761B345FE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093510.1448994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZFd-00037j-Sd; Mon, 25 Aug 2025 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093510.1448994; Mon, 25 Aug 2025 15:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZFd-00034b-PX; Mon, 25 Aug 2025 15:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1093510;
 Mon, 25 Aug 2025 15:36:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZFc-00034V-Al
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:36:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511a0bf2-81c9-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 17:36:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso653490666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:36:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe87c2a0cesm169734366b.2.2025.08.25.08.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:36:49 -0700 (PDT)
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
X-Inumbo-ID: 511a0bf2-81c9-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756136209; x=1756741009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jEopt1Wpmkv1721yqfoYuZJ84BGTG4cTo2nGH31YnVI=;
        b=WigKNdNVWR1AxrrVcL3mlIwux69ax+/4cyZ7Q2LF051wuGa+0gYoYxOeA3uWmjVbhR
         4e2VANopL/CpDnrXsl2nlHoSqMj7KJuqeekhGUpeUBDAFt5VTeJ2bZVk2PYT5olX6tBs
         oxPSnEZGPOSWa4zmrm5cOpq+jFgsZvfRmLLT0ZZJC6y6zJJhwZCOh6fQrVnzjOTwzqtN
         szF36B0YnIcUAW22LlhQK4gTLeDZ2AYXEqDnr45hB8o+lCyFrTFFpGwqS2jbEBV467jC
         uA6L6V5Gt2T1irvwsd2+xaFwwmwrfNK3dzYNHsoEBKnP3udgFev8MIXSeJvpJ5ao77BX
         w0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136209; x=1756741009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEopt1Wpmkv1721yqfoYuZJ84BGTG4cTo2nGH31YnVI=;
        b=Fad4dfhQNuzGfoOZAxIrUF7F6GPQ4xZkpmOuFoJwUoLMwuz6AN8Q1HfJ5au+dirGWa
         fYp+alccfRznecVCi9/Y9YBQdrfVgInkCYsVBQbKqTYzeM4MqEnLfaJSAEDpQ51yZYic
         47xnHCm9KOrFG/DULliwCWF+qdFXLbSpE/RVhBt3/vwpjehJ6/ijTITXssP33Hw6KrUe
         c+DeLITdnPkjQXT98ZF3aEzBmtz8i2bakRUK8tkRWJqiteYBUNhmYei+4XHlrHzGj02b
         4sy3I9tq7+sH2OyvzE0JopBBt/7UwfrjgPNnoBBDljgsusb+ClpnMupWN8dBm9bU8sc4
         XFBg==
X-Forwarded-Encrypted: i=1; AJvYcCVwFw2eVYz9Nv2/y3pMhOiQ/pFjtDQeJYOQeHOc4DvjWsUY0WKx5r2/6xcZzaiFa+JXMoY8sXym+5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyl23Ljots3D+r71mYIXdZokw2WZEM7V+nCfxHyzIut2aOcjV+b
	Hx5PnKmxeruW/1SquREowkWgg1jXe4y2988iVzYkM+gg4QDc4uKoEWGMR8v+1W65pg==
X-Gm-Gg: ASbGnctBGjvPrihtTTbroWsC6/Krl4W7l3MA0t6C3Yrqy3NFArCevKfMdtUkFgCHy6V
	t8d+dVmKe8B8nNRV6p37AYj1kM+05z35J6aVUvSM1dKuccsafrl0cK0FHWdJZeW50C3B/HNAHkU
	2xPBzS1BVF0//dmVKoP+cnM0z2pVZAC+2uVFATjJkxydrj/46U+sFNIdmUXi7WPHlGYnsV1FW37
	XIaze07qpQJMIOdeuFKGGKg9Uhqu46ORGT89hHO4DgzcfJmb3jnkqPva4cH40QDBB938pg1Pv2X
	QiuqT9Wb2qS62PySBsAdCeLboLsOUQ5GVjbJYVp+CAu/PLO9LJyn0OSC1cijSsMCZF5WI6HYdIY
	bZi5PdOwq/HUi78rQH2HepnV2ON7q4UxusGyL8JfEfqSIBre2BtglvZ83EdotgTebDicObGh/zj
	dxRtVTe50=
X-Google-Smtp-Source: AGHT+IFzGPOSuFX2OfzXY0icOmeYnGGVMZ2dCuyEFQmcDroND9sUa4kjYie1kf0+/LDg2Q3XrHRs7A==
X-Received: by 2002:a17:906:f5a3:b0:ae6:e0a7:234c with SMTP id a640c23a62f3a-afe29538142mr1259387966b.33.1756136209282;
        Mon, 25 Aug 2025 08:36:49 -0700 (PDT)
Message-ID: <b54e3460-380b-41e4-b9e9-75ba5c6129fd@suse.com>
Date: Mon, 25 Aug 2025 17:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq
 para
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> We extract cppc info from "struct xen_get_cpufreq_para", where it acts as
> a member of union, and share the space with governor info.
> However, it may fail in amd-cppc passive mode, in which governor info and
> CPPC info could co-exist, and both need to be printed together via xenpm tool.
> If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
> out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
> make xen_sysctl.u exceed 128 bytes.
> 
> So we introduce a new sub-field GET_CPUFREQ_CPPC to dedicatedly acquire
> CPPC-related para, and make get-cpufreq-para invoke GET_CPUFREQ_CPPC
> if available.
> New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to
> extract CPPC-related parameters process from cpufreq para.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # hypervisor

> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -288,7 +288,6 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>          CHK_FIELD(s.scaling_min_freq);
>          CHK_FIELD(s.u.userspace);
>          CHK_FIELD(s.u.ondemand);
> -        CHK_FIELD(cppc_para);
>  
>  #undef CHK_FIELD

What is done here is already less than what could be done; I think ...

> @@ -366,6 +365,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
>      return ret;
>  }
>  
> +int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
> +                     xc_cppc_para_t *cppc_para)
> +{
> +    int ret;
> +    struct xen_sysctl sysctl = {};
> +    struct xen_get_cppc_para *sys_cppc_para = &sysctl.u.pm_op.u.get_cppc;
> +
> +    if ( !xch  || !cppc_para )
> +    {
> +        errno = EINVAL;
> +        return -1;
> +    }
> +
> +    sysctl.cmd = XEN_SYSCTL_pm_op;
> +    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
> +    sysctl.u.pm_op.cpuid = cpuid;
> +
> +    ret = xc_sysctl(xch, &sysctl);
> +    if ( ret )
> +        return ret;
> +
> +    BUILD_BUG_ON(sizeof(*cppc_para) != sizeof(*sys_cppc_para));
> +    memcpy(cppc_para, sys_cppc_para, sizeof(*sys_cppc_para));

... you minimally want to apply as much checking here.

Jan

