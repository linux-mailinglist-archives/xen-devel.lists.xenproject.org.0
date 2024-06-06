Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAB78FDF89
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735936.1142066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Tv-0005mM-55; Thu, 06 Jun 2024 07:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735936.1142066; Thu, 06 Jun 2024 07:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Tv-0005kq-13; Thu, 06 Jun 2024 07:24:19 +0000
Received: by outflank-mailman (input) for mailman id 735936;
 Thu, 06 Jun 2024 07:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF7Tu-0005kk-59
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:24:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c796d472-23d5-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 09:24:15 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so7145435e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jun 2024 00:24:15 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215814e91csm44959065e9.41.2024.06.06.00.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 00:24:14 -0700 (PDT)
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
X-Inumbo-ID: c796d472-23d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717658655; x=1718263455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5v86fs4bitDtehls6LSVwpbnQIgG5eQPtWXwbkfs6Q=;
        b=RNu/hK7LuZp0dhPITcHOE/VrvMiMEe9hDusLyUABW/ORZ7MX/Q4EP+uSLf/PR0sVfO
         0nsms0+sfSKmRu4ME255sVqx6WTneZAsz6vZDduJdwpBtcFVOdwq7in8SA7twnyDxkKd
         j8AdooMkqrD5S/ZQOeUnQH3qQDqwzUg/jAZQuG8MtdN2lxuK1DOvXLVqP8tOqolrLupM
         pqLKsJAyJzBchm13TUsLrm0c2ufVM+lj67EvLhSXxW5RMICh1VUVIbnX0qc/GTpk8p1b
         x/WqxShjHvV6VZ/t7MtiBU+6N47/rAUiq+vfYmsDE3NEFQkhd4qh8eSYyQLbSpL/5Tm1
         7YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658655; x=1718263455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5v86fs4bitDtehls6LSVwpbnQIgG5eQPtWXwbkfs6Q=;
        b=IIXxM0a2l5WayKaBlz7s1f+hzL71ELt4NwHHVAFcP2U/oixHG2BIq7klsysuKrWtNR
         p3q6q8AKJPZdJV4NghC5JxpbEcpeKCsxjHYg7Y09DnY8DAAgqTbQYCRiex6y6kNIIrqs
         8Z+RGHeGPsrYMj42Z5V24dZnKf0OnbMe6PSyTMRAmqitADUv9eZ4li56GM7ry+SM1gte
         KKpm1UMn0QciyMAHsc6i2V+gVejkYRwfv7cHqTfbpdCHHv0zNTxTkLBvp0lyCfdX6oca
         I1X9WsCfz1sI7IauvxejaBnH0fUYFvpjNl9IUUxXpUNKrlepeHP8ZOx6HVDaJ4A7jTVN
         MZng==
X-Forwarded-Encrypted: i=1; AJvYcCXBQoXSebN2iQpkSdcNlKrgYcLg+gzXfoGiYSwHqc8CwkVRo9Opa4gUs9ON3uf/akuKXQNe4z9cbYerM5EKiK01kjTm/UnKJ8wouqNsqoA=
X-Gm-Message-State: AOJu0YzCva9J5+sc4IxGLA+ONN+TDHebXydIOno8DueROR8W4XIGxsHt
	mqpWczjUqJV6z2YVmghS+NhhNNdOgKeeayr45yqovG/OEeTnYYwUt1wpx/6xtw==
X-Google-Smtp-Source: AGHT+IHwj53cWwJUWAIxsLU+T3YHIjl6xmq4uqPrxPfmEF/xgLpbKhSf9L2WOCAkZFCVLt5vuAT8mw==
X-Received: by 2002:a05:600c:4690:b0:421:22c4:db60 with SMTP id 5b1f17b1804b1-421562f22bbmr38912985e9.23.1717658655072;
        Thu, 06 Jun 2024 00:24:15 -0700 (PDT)
Message-ID: <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com>
Date: Thu, 6 Jun 2024 09:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2024 22:04, Petr Beneš wrote:
> @@ -5245,7 +5251,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx)
>      if ( !hvm_is_singlestep_supported() )
>          return;
> 
> -    if ( p2midx >= MAX_ALTP2M )
> +    if ( p2midx >= v->domain->nr_altp2m )
>          return;

As (iirc) indicated before, just like you don't add a d local variable
here or ...

> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -887,7 +887,7 @@ static inline struct p2m_domain *p2m_get_altp2m(struct vcpu *v)
>      if ( index == INVALID_ALTP2M )
>          return NULL;
> 
> -    BUG_ON(index >= MAX_ALTP2M);
> +    BUG_ON(index >= v->domain->nr_altp2m);
> 
>      return altp2m_get_p2m(v->domain, index);
>  }
> @@ -898,7 +898,7 @@ static inline bool p2m_set_altp2m(struct vcpu *v, unsigned int idx)
>      struct p2m_domain *orig;
>      struct p2m_domain *ap2m;
> 
> -    BUG_ON(idx >= MAX_ALTP2M);
> +    BUG_ON(idx >= v->domain->nr_altp2m);
> 
>      if ( idx == vcpu_altp2m(v).p2midx )
>          return false;

... in either of these, I see little reason to have such ...

> --- a/xen/arch/x86/mm/altp2m.c
> +++ b/xen/arch/x86/mm/altp2m.c
> @@ -15,6 +15,11 @@
>  void
>  altp2m_vcpu_initialise(struct vcpu *v)
>  {
> +    struct domain *d = v->domain;
> +
> +    if ( d->nr_altp2m == 0 )
> +        return;
> +
>      if ( v != current )
>          vcpu_pause(v);
> 
> @@ -30,8 +35,12 @@ altp2m_vcpu_initialise(struct vcpu *v)
>  void
>  altp2m_vcpu_destroy(struct vcpu *v)
>  {
> +    struct domain *d = v->domain;
>      struct p2m_domain *p2m;
> 
> +    if ( d->nr_altp2m == 0 )
> +        return;
> +
>      if ( v != current )
>          vcpu_pause(v);

... in both of these.

> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
> 
>      mm_lock_init(&d->arch.altp2m_list_lock);
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->nr_altp2m);
> +
> +    if ( !d->arch.altp2m_p2m )
> +        return -ENOMEM;

This isn't really needed, is it? Both ...

> +    for ( i = 0; i < d->nr_altp2m; i++ )

... this and ...

>      {
>          d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
>          if ( p2m == NULL )
> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
>      unsigned int i;
>      struct p2m_domain *p2m;
> 
> -    for ( i = 0; i < MAX_ALTP2M; i++ )
> +    if ( !d->arch.altp2m_p2m )
> +        return;
> +
> +    for ( i = 0; i < d->nr_altp2m; i++ )
>      {
>          if ( !d->arch.altp2m_p2m[i] )
>              continue;
> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
>          d->arch.altp2m_p2m[i] = NULL;
>          p2m_free_one(p2m);
>      }
> +
> +    XFREE(d->arch.altp2m_p2m);
>  }

... this ought to be fine without?

> @@ -538,8 +538,8 @@ void hap_final_teardown(struct domain *d)
>      unsigned int i;
> 
>      if ( hvm_altp2m_supported() )
> -        for ( i = 0; i < MAX_ALTP2M; i++ )
> -            p2m_teardown(d->arch.altp2m_p2m[i], true, NULL);
> +        for ( i = 0; i < d->nr_altp2m; i++ )
> +            p2m_teardown(altp2m_get_p2m(d, i), true, NULL);

Shouldn't the switch to altp2m_get_p2m() be part of the respective
earlier patch?

Jan

