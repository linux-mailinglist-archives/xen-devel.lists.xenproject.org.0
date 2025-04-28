Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB74A9F47D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970826.1359397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QSg-0007MQ-Oz; Mon, 28 Apr 2025 15:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970826.1359397; Mon, 28 Apr 2025 15:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QSg-0007K0-Lg; Mon, 28 Apr 2025 15:32:02 +0000
Received: by outflank-mailman (input) for mailman id 970826;
 Mon, 28 Apr 2025 15:32:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9QSg-0007Jt-7w
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:32:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed71cf34-2445-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 17:32:00 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ace98258d4bso288014466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:32:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7011fc36dsm6033481a12.4.2025.04.28.08.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 08:31:59 -0700 (PDT)
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
X-Inumbo-ID: ed71cf34-2445-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745854320; x=1746459120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/EVK4aeeAU5wketDzzKeZDkcBBqBvF7vK69nq50GIzs=;
        b=VZ5KPPPbtYV4/kWidlnSG5rCYjwSq0hi3EHNFz814iJ2M/hyuyX6kl6fTgblIfuuFk
         SC3LpdMOPRkFk4SfOEofA+x9RFmeOyenEwFzSYj43jUeufQ33xz6nD9V9iKfewdlJvwi
         O81RXJGxAQapvCOvXX5wcFp0Gf+hj63fBo2sL8oJuQs1R0CEoFrVdt4SbxwSb0Xvz8A5
         rDpIkI8JGBgBR1kFf3EVBjx+1wAOj+w1avnffk8GDlfuPPKSqCJ1F5m4E2QwW6epkW7+
         fpxcQMU+zxL/Lb9O22fdcINWKHkPfM3W506y0Fw8P9n4cQkw6PQKykpBKwxzJrHEEETP
         6m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745854320; x=1746459120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EVK4aeeAU5wketDzzKeZDkcBBqBvF7vK69nq50GIzs=;
        b=Xdee/+d4uneqStUtmCiXE7Et8pXdsdzc82wO9jQrIwpAvw22d+2/3d7tcfNw+K76jO
         4ZLSYEnOALhOk8ivZKX1QwU45YeaPYRcgG4KPl0qC3XbLK/xbWYIJNfOPGsmxzxmSel5
         PuP9xP82rnuDz2scl9ZpYn1mLDqH0FUNTkrIPEiRtGB2WnWWWF/nTSeKjq4kptjyPpEv
         B5JdwQTw5lHRiZern3n80rlgeAJbfe6UM6MKS256RW0U8mki+hco+KGOAhvyBParcmMu
         4LU72J1FgMdq/lO3bm7RN4DBGlZyE83h+ZfQBCzNEsiqzYiK5uY+0FkqxlcFf9s6fGhT
         FkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5vS3gH59Hp+U5IYFgv75K8zj64RYdBDmtXY5XcuKpF54lbujCAHcZOKKZmsrklyvnCz+a7M0NH00=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8XJceR/qso4HsyVENZbuGRMi0PuijPvzxXrIPvKGZdy4N9Bwf
	JyUkAOYP5mQlmplPbFwRSyYQRAoh8wbdU5vGvgzKqkalHtdAQMw7aOxWpMQ/FzTCUHxbdsjJJdg
	=
X-Gm-Gg: ASbGncu4xgcX8jBjVzrmAOitBH1lIcCMXefaVIUJIlacgTtZyEwF40T9ioPOJ6S0mUe
	Crb6zrEb7VLlYdcVINLDlxjUdy20pe6gCAnBo/S0cR1T9i2vRMoGRlqQSgVnigtPk7S5GdMam4i
	bMDMPsdJIqwq7rTEJg19ZlExL/FmZ1p+qldjwjnotlGQZKqUZD4poG0hoHLJVdiAvn6/DDcFkbM
	Kfp8POP2wWs+JW17wewwjMyFLxbJedLdNJJiaPUzQisr2K8fKBd3EdOvQrHXTd/Cvi36Hivog9I
	W/iDcVPl6Z1ojqy5LqSUC/d7ZvDrB9uqNbhW5hzEq9AEoqUtvPGXdKFKTehjO6GXY7ZlDXr6ZM9
	XZsUMHdCCV7I/uSWruqizOGGlpA==
X-Google-Smtp-Source: AGHT+IFF1+KeWvQtRcAKdNNxrWF+kPJC2HgYYMNoq20EzlITiOvjeWiptEa2bumAChqEMRJtYVNx4A==
X-Received: by 2002:a17:906:71c9:b0:ace:c50a:f87 with SMTP id a640c23a62f3a-acec50a0fefmr9341666b.46.1745854320016;
        Mon, 28 Apr 2025 08:32:00 -0700 (PDT)
Message-ID: <829e710d-d257-455a-b4fc-1746119609ef@suse.com>
Date: Mon, 28 Apr 2025 17:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -191,9 +191,31 @@ int cpufreq_limit_change(unsigned int cpu)
>      return __cpufreq_set_policy(data, &policy);
>  }
>  
> -int cpufreq_add_cpu(unsigned int cpu)
> +static int get_psd_info(uint32_t init, unsigned int cpu,

The 1st parameter seems unnecessary: You access processor_pminfo[cpu]
below anyway, so you could as well use ...

> +                        uint32_t *shared_type,
> +                        struct xen_psd_package *domain_info)
>  {
>      int ret = 0;
> +
> +    switch ( init )

... processor_pminfo[cpu]->init here.

> +    {
> +    case XEN_PX_INIT:
> +        if ( shared_type )
> +            *shared_type = processor_pminfo[cpu]->perf.shared_type;
> +        if ( domain_info )
> +            *domain_info = processor_pminfo[cpu]->perf.domain_info;

Does this need to be a structure copy? Can't you hand back just a pointer,
with the function parameter being const struct xen_psd_package **?

> +        break;
> +    default:

Nit: Blank line please between non-fall-through case blocks.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -440,6 +440,11 @@ struct xen_psd_package {
>      uint64_t num_processors;
>  };
>  
> +/* Coordination type value */
> +#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> +#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> +#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
> +
>  struct xen_processor_performance {
>      uint32_t flags;     /* flag for Px sub info type */
>      uint32_t platform_limit;  /* Platform limitation on freq usage */
> @@ -449,10 +454,7 @@ struct xen_processor_performance {
>      XEN_GUEST_HANDLE(xen_processor_px_t) states;
>      struct xen_psd_package domain_info;
>      /* Coordination type of this processor */
> -#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> -#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> -#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
> -    uint32_t shared_type;
> +    uint32_t shared_type; /* XEN_CPUPERF_SHARED_TYPE_xxx */
>  };
>  typedef struct xen_processor_performance xen_processor_performance_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);

What's this movement about? In the public interface nothing changes?

Jan

