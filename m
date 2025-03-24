Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B0A6DC9C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 15:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925650.1328522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiTn-0006Dx-3R; Mon, 24 Mar 2025 14:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925650.1328522; Mon, 24 Mar 2025 14:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiTn-0006Bj-0j; Mon, 24 Mar 2025 14:08:39 +0000
Received: by outflank-mailman (input) for mailman id 925650;
 Mon, 24 Mar 2025 14:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twiTl-0006Bd-Mq
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 14:08:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a8450ec-08b9-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 15:08:36 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-394780e98easo2611608f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 07:08:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9955fbsm10997544f8f.5.2025.03.24.07.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 07:08:34 -0700 (PDT)
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
X-Inumbo-ID: 7a8450ec-08b9-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742825316; x=1743430116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RgYD/+2IgXusKjq+RR1d28NFTAfCwxnvZnLYJkWekIQ=;
        b=OEhe9JU13VxYYlf/4tj7kRdZgYLpm9GsD6FHPFFhNJREVgFLW0H3dOTILszZI3sN8Z
         EQOwtJXuGmnHUSNzyDnzZuEniLViCWnoPQVAEIOSwcirtz0noMEitfzBbwd/hm52wKc0
         ZkHic6OZyAZ48/ah6ptkX3SCc3TYEBEAErTuqfQXCsUqYuOKipnIlkpqUfIcyfG+/g73
         L/+h8JqzvU5tWP6EV7MtVUpFZgV/KBnfMvRjD2r2QjoA9gg8pIqSiv1b/ZZSJXOr00pQ
         XrZV9nEB2RLSYhOzl38ql8iIqvTitCkWC9smv41YHveJrt5C6hl+zYdWNj7An1wAktHA
         WQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742825316; x=1743430116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgYD/+2IgXusKjq+RR1d28NFTAfCwxnvZnLYJkWekIQ=;
        b=ACCbZ2UthpuiMrW10VvOZCdknJHXCPlVmhPyIGLrvuzIehPe0wp3AG18yZD9Z2VA9C
         XjJEmq65SM4471qrIUTPum5M+1NwO1MQn4O+gVIx48OfISx6No3eLGCieT3CLfBynxA1
         bXJwjbqwnuLI0Lqo14pDtY6bhQFJFii/FYpZNcfhmHKrsfV8lJ4j9slqnjcHpHHYDtGJ
         26ORehspEdxksqpXwDV0MaE2DhUeMUkYADTnJMaR67B0CrWRg8zfkna7mI41CTAlAGK+
         0hVZM5bDZV3UZiIDdekqOC5FIPuFPgCREwOdya/jGqt1yLYV/ZnnBuObCS5+H7zfXKnr
         jjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqhn61u8BnqbI3+aUFqH1IOdyRGxUX+s85jkmq3s1vLSDhqvmoLBjiKXy8UDeHnI0UXiRXztTlF4A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yypz+Jc7hCzZFXZoEnR8dqctB5QuqtKbL01nTY9W2QWq3mlmuMb
	O4RkHlgboS+tVDz2JN6OF4yf9v06bSZEX5gCmj+GUc12xIF8liCzCwjZPDYUOQ==
X-Gm-Gg: ASbGncubS6wX1LihYo4OY5XlwUAnWLfs+CC33IO2yJnHlL4F88vB1pYNg98idOKLriQ
	kNrhvU2vFlO8ICZqPZuoinJLmRN56aP/T+3XzAEWvIvXmt+JLoXs51zbi7ifyjwSJtUhNFffkv8
	pZlD1LvkCtmKC1bwgR52q9/uzEb/Vm8wAXZhBK49ncj0geTHlSH6TYW2z3HeI+EEDUwy6p/HxrS
	f3y2+yX/v3b7v0sVGhlzKVyw7FJOXGaLV30kK/tLenTCVfiriYWkSN1j7QExEGBp2jz3oZALb5Q
	607VPZqcYy6f4dRIbV9hW0YkFuC0fdEq2baUPV7C4aqIrmds3/Qfu39ZIKKZZO20W17PYb81Cgg
	gGuSKfozAelhW/XTh1B+fCjDV2FJpCw==
X-Google-Smtp-Source: AGHT+IGbQi/JYVH0RFt2VSiZX3iz+6/95V9gY1q7UCj+n13icSx8sQ5Mk6HEygZxwtghzKEZ8WHCyQ==
X-Received: by 2002:a5d:64e4:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3997f8f9d24mr12545890f8f.15.1742825316070;
        Mon, 24 Mar 2025 07:08:36 -0700 (PDT)
Message-ID: <8f0efe3b-296e-4f1b-9501-8431f299e90c@suse.com>
Date: Mon, 24 Mar 2025 15:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] xen/cpufreq: introduces XEN_PM_PSD for solely
 delivery of _PSD
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -363,12 +363,12 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>  #define XEN_PM_PX   1
>  #define XEN_PM_TX   2
>  #define XEN_PM_PDC  3
> +#define XEN_PM_PSD  4
>  
>  /* Px sub info type */
>  #define XEN_PX_PCT   1
>  #define XEN_PX_PSS   2
>  #define XEN_PX_PPC   4
> -#define XEN_PX_PSD   8
>  
>  struct xen_power_register {
>      uint32_t     space_id;
> @@ -439,6 +439,7 @@ struct xen_psd_package {
>      uint64_t coord_type;
>      uint64_t num_processors;
>  };
> +typedef struct xen_psd_package xen_psd_package_t;
>  
>  struct xen_processor_performance {
>      uint32_t flags;     /* flag for Px sub info type */
> @@ -447,12 +448,6 @@ struct xen_processor_performance {
>      struct xen_pct_register status_register;
>      uint32_t state_count;     /* total available performance states */
>      XEN_GUEST_HANDLE(xen_processor_px_t) states;
> -    struct xen_psd_package domain_info;
> -    /* Coordination type of this processor */
> -#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> -#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> -#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
> -    uint32_t shared_type;
>  };
>  typedef struct xen_processor_performance xen_processor_performance_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
> @@ -463,9 +458,15 @@ struct xenpf_set_processor_pminfo {
>      uint32_t type;  /* {XEN_PM_CX, XEN_PM_PX} */
>      union {
>          struct xen_processor_power          power;/* Cx: _CST/_CSD */
> -        struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
> +        xen_psd_package_t                   domain_info; /* _PSD */
> +        struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/ */
>          XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
>      } u;
> +    /* Coordination type of this processor */
> +#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> +#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> +#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
> +    uint32_t shared_type;
>  };
>  typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
>  DEFINE_XEN_GUEST_HANDLE(xenpf_set_processor_pminfo_t);

With this change to stable hypercall structures, how is an older Dom0 kernel
going to be able to properly upload the necessary data? IOW: No, you can't
alter existing stable hypercall structures like this.

Jan

