Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBEA5BFE0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 12:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907993.1315167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryGd-0002y7-JU; Tue, 11 Mar 2025 11:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907993.1315167; Tue, 11 Mar 2025 11:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryGd-0002wf-Gl; Tue, 11 Mar 2025 11:59:27 +0000
Received: by outflank-mailman (input) for mailman id 907993;
 Tue, 11 Mar 2025 11:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tryGc-0002wZ-F4
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 11:59:26 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4657556d-fe70-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 12:59:24 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso2930745f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 04:59:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01cd31sm18004294f8f.52.2025.03.11.04.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 04:59:23 -0700 (PDT)
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
X-Inumbo-ID: 4657556d-fe70-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741694364; x=1742299164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hERjAomuy6L7tseKyGREGYCTqyHWIvjuFAPqa/xMCh4=;
        b=QdKAwQxx2Yz4Vgu+nHDnuhpRRl7yZZr9Y6avtw5Zii/ILqbGN27aBNJM94KOwaVejZ
         pUTgx+M4vwwd+GvHd3LSSV7nDY6mtfGsac+D0COyqCkCYb+ONnJNZfvq56og4UcnkB96
         jesbOBW7i4aaV875q7jZcAxf/q8l0BJi4ZQLau3MMwxi7VcBRaeruoxkmfdnysFbI0vz
         /di662gw7JjB7vCTzScPlLz+L8pkXU/xJjsRXK2b1r0bfKPdYtgJ8ep7duyY15f+1luu
         EAQ08UroXb9C/kHc+cw0iRz83h6xcgErXdSydH851WoUkAMlwMPilYGH/kwckcrd+7td
         S2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694364; x=1742299164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hERjAomuy6L7tseKyGREGYCTqyHWIvjuFAPqa/xMCh4=;
        b=lMoYsvMuxteen/QvvZ7fwzNerRD0tFPslNJe2KSrgmGjGpRl3BWsb9SR9RZExvI0av
         qBxhq2KShR5GvbK2XKTfixeTwrIyMN6FljYqe1SQT/4jTQTlgCqKebRCmKS+tjJbo2LB
         //kGwIadANxicy8FH5FL1K+XZvM79fCIHlgCpWLeumEXusYk0aoTi4BVgfFadj1FEu/h
         p+6uXazaBYByCCc/hzEDFu9UwnUaB5pUiNxHL2ugO7Y1JvPXdgrc9Bl0F9N+7fwXEKcp
         Sq0lhuQsEkplLlGm644uhw6rQXzzOOZ+Tki2IXm+IODjnG6jtXGqPZcWpxl/dz4gYnXJ
         gKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiPvmmeL4bHCQkWcxE9ff/L53I30ZrRmvQr0K1MaHMQeIFn2D4xXolYxxEpOyKQZ/Dlhyvk2DgssE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcHeuLfttclQqi5fQ5RcR/PmFKglQZ2zRlbKHhZ7GpWs8fcLsn
	/iE8jP7vhVntBDC3qZoRo1lybIM3EKG+up5s0wosiblmZpJKtGjQONajB4Kmlw==
X-Gm-Gg: ASbGnctmmr3EO5drAlctR4TSte+dJ57u+9cOPGX9NOwMyP3rYE0gQVGhmo+fli9Oun5
	2sV9Wpp7OHUN581H1kLOCwjGD8KvzsHAjFhgWIUwVjymA0/sGOAg2e8q7awyXkBZcftVfsxaoFQ
	8GOMeNnPDEU6Kk3LIsCXQcSm/TloKk9D3Ulw+48PNtTlRsFA7CcOfSRM1+j+RqhD1Ug6czeeQ+Z
	zt0WkFvh367tsUOh51QVgDiRRU7qw3SsTK8H35GVEDWTouxta3r/hjshcpdIfaGHzVzKaYdE/fh
	6/SPMVDGiuere+oULKRCJtqFN2Fx+D5jmC915DWkSNQA7YP/ks6flEDccRe3M19x4j5tNsSCGZB
	kJpfAfj0kUBGIFL8QWb6gvSPcBJdFBw==
X-Google-Smtp-Source: AGHT+IF/+zvCgqnz54MKha9rjmWTbzhz7I+uiHmK9RnlJizGEWHlGU5FUJEMNKwCgNAD9dFNBaWh/g==
X-Received: by 2002:a5d:6d8a:0:b0:390:e655:f998 with SMTP id ffacd0b85a97d-39132d6f17bmr13936800f8f.26.1741694363716;
        Tue, 11 Mar 2025 04:59:23 -0700 (PDT)
Message-ID: <ebef450c-280e-43a4-9a48-e4d1f754ba03@suse.com>
Date: Tue, 11 Mar 2025 12:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com>
 <e37da57b94fd3bd4f314e6fbd7b6b94aee4b4607.1741687645.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <e37da57b94fd3bd4f314e6fbd7b6b94aee4b4607.1741687645.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 11:27, Sergiy Kibrik wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
> and monitoring support optional. Also make MEM_PAGING option depend on VM_EVENT
> to document that mem_paging is relying on vm_event.
> This is to reduce code size on Arm when this option isn't enabled.
> 
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Please can tags be kept in chronological order? It's impossible to review
a patch that wasn't first signed-off on by the author(s).

> ---
> changes in v3:
>  - add dependency MEM_PAGING -> VM_EVENT
>  - monitor_domctl() stub returns -EOPNOTSUPP

Seeing this, i.e. ...

> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -27,8 +27,17 @@
>  struct domain;
>  struct xen_domctl_monitor_op;
>  
> +#ifdef CONFIG_VM_EVENT
>  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
> +#else
> +static inline int monitor_domctl(struct domain *d,
> +                                 struct xen_domctl_monitor_op *mop)
> +{
> +    return -EOPNOTSUPP;

... this, why ...

> @@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
>  void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
>                            vm_event_request_t *req);
>  
> +#ifdef CONFIG_VM_EVENT
> +/* Clean up on domain destruction */
> +void vm_event_cleanup(struct domain *d);
>  int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
> +#else
> +static inline void vm_event_cleanup(struct domain *d) {}
> +static inline int vm_event_domctl(struct domain *d,
> +                                  struct xen_domctl_vm_event_op *vec)
> +{
> +    return -EINVAL;

... is it EINVAL here?

Jan

