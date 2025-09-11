Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F4B533C7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 15:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120286.1465303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhNO-0005Jh-HW; Thu, 11 Sep 2025 13:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120286.1465303; Thu, 11 Sep 2025 13:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwhNO-0005HR-EE; Thu, 11 Sep 2025 13:30:14 +0000
Received: by outflank-mailman (input) for mailman id 1120286;
 Thu, 11 Sep 2025 13:30:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwhNN-0004pq-Ed
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 13:30:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71556973-8f13-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 15:30:11 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b0415e03e25so94847966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 06:30:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31295c9sm137298666b.43.2025.09.11.06.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 06:30:11 -0700 (PDT)
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
X-Inumbo-ID: 71556973-8f13-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757597411; x=1758202211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5VDz3WA7cDa9FIjcLpWB/5k5debjAvF8zkERceJxvUY=;
        b=Uornn5XRRzqEgs4+UCOewta0VFu++v3zPfi6BBdfp25ts7+mh0BldCdhl88oFcBitc
         AE2EFcExoQVEeQ9h8y1Y8pKQHCIlyN5MkrU3i9bnTmsSVZFodKhtNG14oON+5hwPFq59
         0FU0glmqFrytaDaeZtIn4AfpzszqCIF4T3z6M0ZHsuVOIVmYatIl4CNhw0pNppJ96DSN
         PXn7yFW3ZQ8UqH01jZT23fE0KqzapJvrKX/MYCoy4SbtcytkYFkMZ8h+onkWoTReBfVw
         Q349v1GXrIgWDaOF4tm+Qq3cdDnJIAsHAzUSflkBi1qO2y5Sfr1GziAet2XHWSK3ODLx
         V8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597411; x=1758202211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VDz3WA7cDa9FIjcLpWB/5k5debjAvF8zkERceJxvUY=;
        b=XvyA4Lk3Ml8GLmDuR98h/GCqqd/O5X0lOTFM6G4Bgu1HhfetElw8CVzZErUgoODBf3
         Z9hE+ggywGGfw/LhJi96M5rjneg4cH4wi6MyqgQ5Fm0MCOOCPd86NKSb0v/0To2Nykgg
         +wbDJoNmd0KE32uZV+xi9Dd1OFWfcSAYtMqMipjoSdJz8fy+skA5G1+tiM0j7nrox+1s
         /beEplpobAN4yXzHh2hEh/2dFIYOqm9ug5DLZGGn7eToUoJcaowWxJ66hjTl+taAwuE6
         IrAX2uTaIbUdaZTCw8TObbUfcS7f2QfFt6FyNwoU7xWZQzPEDOii1KaKDJd8PqBWNxai
         dzSw==
X-Forwarded-Encrypted: i=1; AJvYcCULM5Dqgae6xkJ8Dqrr2oT8LKvAcSgtDViBJGi6/qA5RYNCvfknHUe3IqGVdAgJLVx7fEomGKl/IhY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAWSgAIyOjYk+jxqMDYQrtSWHHfoBDvQ9W26L6CqFSvddUE4gX
	9RVGfsxCXeX9tLEyendvNPOCYc4KV3LiUTyTPxxPhs367+BnK3iI83c2aQIRsF19yg==
X-Gm-Gg: ASbGncvwPRgKzCmtxgTjaDi+ztv2RqxXlNG6ek5IGlUcL4yirxY2llj5863/CxlB5D+
	qb56J5ynbntl0rZT9O/VkDY6hvw36tGw/28Mhn5pV6ef6qUnpUcLcA/pPglvz/WqJwH7bcg5OY3
	EiEhMxGa0uY+UBhjfoiKJ8bQE87/nAyCiCCpDqSy0Qgic2lfhO1nHW0QgB7d5DezzMWh0de2a4I
	XxgS4ggKLrP6a9Nq4JKTYcPkEQCUdoWxEEyyf+2olepVIrBpcyAvJgulozInlAT3HBboTlLFmwM
	9K6fPDNfp5AwHYZ8Mlj2mnKarIk+W9tXvqLqhP5fPCBPH5gpotUOg/6CC7coqoWud/hYo2Iytrk
	iVyNqUBkjAeWsbZVofsCWHjr35SBSRKxiqEPI+PdwdynKlwN06BHasr4StU1y2HvVoL0kWmoPeK
	3zVJ6sf5M=
X-Google-Smtp-Source: AGHT+IF/Rxn5onPTjug4vXjTkrTTpagvnrSI9fReADu97oJMeMktdOGGd9G9PrXQrqRYMvcgk1vE4Q==
X-Received: by 2002:a17:907:890d:b0:b04:9ad9:5b2c with SMTP id a640c23a62f3a-b04b140d270mr1888579666b.25.1757597411245;
        Thu, 11 Sep 2025 06:30:11 -0700 (PDT)
Message-ID: <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
Date: Thu, 11 Sep 2025 15:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -55,8 +55,8 @@ struct xsm_ops {
>      void (*security_domaininfo)(struct domain *d,
>                                  struct xen_domctl_getdomaininfo *info);
>      int (*domain_create)(struct domain *d, uint32_t ssidref);
> -    int (*getdomaininfo)(struct domain *d);
>  #ifdef CONFIG_MGMT_HYPERCALLS
> +    int (*getdomaininfo)(struct domain *d);
>      int (*domctl_scheduler_op)(struct domain *d, int op);
>      int (*sysctl_scheduler_op)(int op);
>      int (*set_target)(struct domain *d, struct domain *e);
> @@ -234,7 +234,11 @@ static inline int xsm_domain_create(
>  
>  static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
>  {
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      return alternative_call(xsm_ops.getdomaininfo, d);
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>  }

This is in use by a Xenstore sysctl and a Xenstore domctl. The sysctl is
hence already broken with the earlier series. Now the domctl is also being
screwed up. I don't think MGMT_HYPERCALLS really ought to extend to any
operations available to other than the core toolstack. That's the Xenstore
ones here, but also the ones used by qemu (whether run in Dom0 or a stubdom).
IOW I think there's a conceptual issue with this work which needs resolving
first.

Jan

