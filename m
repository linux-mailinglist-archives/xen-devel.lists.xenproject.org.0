Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808AABD356
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 11:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990580.1374528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJGk-0000Pu-1I; Tue, 20 May 2025 09:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990580.1374528; Tue, 20 May 2025 09:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHJGj-0000Nx-Tu; Tue, 20 May 2025 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 990580;
 Tue, 20 May 2025 09:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8eI0=YE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHJGi-0000Nr-Vo
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 09:28:16 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c21932cf-355c-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 11:28:16 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad1f6aa2f84so1046183466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 02:28:15 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ad52d498544sm711567666b.143.2025.05.20.02.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 02:28:14 -0700 (PDT)
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
X-Inumbo-ID: c21932cf-355c-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747733295; x=1748338095; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYmRLBQK2RYEVwfkMPhUt0J2xhRYGrFwsjIM1ROK/Qk=;
        b=FPYb5Jw06JAIGQl3PQAT6GBEEHSp0LRwWiUl1KdirriA3Bll3DuNV02y61u6JS8jOq
         liAPxdYIC56Clr3EE4Ya1rdIn/CewddfC+/plB3C8xBUNBTQ+RyFkK0RwS+3Fk9bRtN+
         CgqZUcIvod2jitC3pM9RGEwUX6orbDkLMG7No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747733295; x=1748338095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYmRLBQK2RYEVwfkMPhUt0J2xhRYGrFwsjIM1ROK/Qk=;
        b=DikMCgGw4EJB5zsFHYoKZPsqDITBH4TGDLIdSf4tECrxe4lTfVMNLkMo/Eixg1Q4k5
         sxXCj2lE83E6DDNagUtLjql8Ds6ZH9Yr+SNN7ViAoa6Xy6LQeB/DE287LErnD/Cft/jq
         eRu/KBdWmR/qK2iTi+A0yElLTd4v3rOE96lg97nmOJxXiMuAqYbjuf8IN5rlVonflDvo
         hwRSr4NDzYxEDZp+hPHs4mxyZqlfOKkq+6YL3attQIQ4e0Ut+j2lt2rQOBiaNNcF57iY
         OKRMRbUCioGeTVjx7Y0TTV8MRWiJaaIT6Tbx1bST8Sa0fCxaerY1ra/43+qgOgv56XeE
         lMBQ==
X-Gm-Message-State: AOJu0Yx2T3Mioo/NpFkweVCAlo/XYytO0hijk8CCtqkZqSbQ/gr8sfzS
	6jwPl07xZFTCVRoswJPv1DfNGAxU4YPxkeZhAn1x+8+y1lU7gX9mkjvqYb2ceAGjqbEkANyLSyZ
	6GFQr
X-Gm-Gg: ASbGncsZBvFhQZFGNdhAxGLIjFv2IN1ULgAbXKba+DCCY6rkZ8AV84GehWaRnEPEqn/
	1h6Glr5YPzUuJGoRcbkcFQ5CMx991eFVr60iLkpNgSwO1fbe1ummJ1Xqb/pw6aVPiTohpsOYMsl
	WCRqpqxEMFn6rmv28XHZ20kq9EWJwmQMalLv38n278o5gMOj+OBplUhUqDDuPX7dWyJZ5xI4wA4
	tcbBmq3qltnPEJWHbWuIxJ6EsaEe0TJzjMR9bqmWXBFkZP9SAyA1VgHkwq4RLrM3U8IYs7mdZm2
	V4ZfuU8GN27vbzVTuBKQ6VznJscMYFTx8eV1QV6dCY0nh9zeyZgqr6VrmKYyit6rRPCfao/okfY
	0uttydr+nrVg67jd1E0s=
X-Google-Smtp-Source: AGHT+IHRu26nyc2HicfS233TojwPKQ+G0s8hUy2LcVt9H/x1hjwvS3ADWuw6lEBrGrWbB7KfcjZVZA==
X-Received: by 2002:a17:907:8dc3:b0:ad2:2d75:d7fc with SMTP id a640c23a62f3a-ad52f324fc3mr1287925166b.10.1747733295152;
        Tue, 20 May 2025 02:28:15 -0700 (PDT)
Date: Tue, 20 May 2025 11:28:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen: Introduce extra IRQ count domain creation
 parameter
Message-ID: <aCxLLlk-yLQZHZ1R@Mac.lan>
References: <9a746a8b2e9ee68a398795ecb5dcb53697aeece4.1747403245.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a746a8b2e9ee68a398795ecb5dcb53697aeece4.1747403245.git.teddy.astie@vates.tech>

On Fri, May 16, 2025 at 01:50:25PM +0000, Teddy Astie wrote:
> When doing PCI Passthrough with high-IRQ devices (e.g NVMe drives),
> the default limit may be unefficient as not all domains requires
> more IRQs.
> 
> Introduce a new parameter to allow the toolstack to tune the IRQ
> count if more is required.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> 0 extra_irqs is meaningful, though I am not sure how to expose this
> special case.

You could introduce a new CDF flag to signal the contents of
extra_irqs is valid, or maybe use the top bit of the `extra_irqs`
field to signal the value is set?

> This of course wants libxl support next.

It would be nice if this could come together in a patch series.

> ---
>  xen/common/domain.c         | 8 +++++---
>  xen/include/public/domctl.h | 3 +++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index abf1969e60..5c628962fc 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -912,10 +912,12 @@ struct domain *domain_create(domid_t domid,
>  
>  #ifdef CONFIG_HAS_PIRQ
>      if ( !is_hardware_domain(d) )
> -        d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
> +        d->nr_pirqs = nr_static_irqs + config->extra_irqs ?: extra_domU_irqs;
>      else
> -        d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
> -                                       : arch_hwdom_irqs(d);
> +    {
> +        unsigned int extra_irqs = config->extra_irqs ?: extra_hwdom_irqs;

Newline.

> +        d->nr_pirqs = extra_irqs ? nr_static_irqs + extra_irqs : arch_hwdom_irqs(d);

I think the above line is > 80 characters?

> +    }
>      d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
>  
>      radix_tree_init(&d->pirq_tree);
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 5b2063eed9..e4bb366c78 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -121,6 +121,9 @@ struct xen_domctl_createdomain {
>      /* CPU pool to use; specify 0 or a specific existing pool */
>      uint32_t cpupool_id;
>  
> +    /* Additional IRQ for this guest. 0 to use Xen default value. */
> +    uint32_t extra_irqs;

I think you need a domctl version bump, as the last one was done for
4.19.

Regards, Roger.

