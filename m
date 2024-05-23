Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A58CD03E
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 12:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728314.1133187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5a3-0003cR-Tr; Thu, 23 May 2024 10:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728314.1133187; Thu, 23 May 2024 10:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5a3-0003Zy-Pw; Thu, 23 May 2024 10:21:51 +0000
Received: by outflank-mailman (input) for mailman id 728314;
 Thu, 23 May 2024 10:21:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA5a2-0003Zg-9G
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 10:21:50 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 436b6238-18ee-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 12:21:49 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3c9b94951d5so2997122b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 03:21:49 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79484010bcdsm392777085a.133.2024.05.23.03.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 03:21:47 -0700 (PDT)
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
X-Inumbo-ID: 436b6238-18ee-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716459708; x=1717064508; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VxFEt76Z8/U7ETN/vJNgM1sjQaSyKSjkXHjl9SQVCDo=;
        b=HN9s2Y5ud5E9epKQKz0AikoG9Sczw477IrzG5Ld+hDK1Mf4oEF4EGuOGiO68QK8paq
         Dhgvzzwsh9LnTWHYdoKaOqfC1+W7P14mCvM88VR5GOSkQXKNhitWLbgEGHMNjqw2jYLi
         ECvjD7C9L5rdsJVr6cCl81dZ5VS8FX9r7A+BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459708; x=1717064508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxFEt76Z8/U7ETN/vJNgM1sjQaSyKSjkXHjl9SQVCDo=;
        b=T5iIF5cgsQnNsrVp6s9GolSzBjwNSKYCVsmA/plnTWUcpuHy7Wf+qeOkX1C/YgQv7h
         13rLaOfotqXX7h7OXmDA8NWuJgiRooI5fPBYLmAvjxRu7Ui63KN65rBHrzC2iKsM8ZiI
         /HEamOf4mTPH+0aUC71eH69ehla+bnfLUDbaok5QlnmCM6YP53Uwwrj59isx+fKPS9SC
         eu0ahnBEsxX2lnVa/HDMxbD4IiUI1Tr+TMwuFhyUvQHlxeWSTodtEyFtS241jpAX34V5
         NO3vArJMDaf8QsxE0w4CJ5G7r1hRhr6PFE6qCn1MRSnPPrIciPc6Mr7IkHKWv4D1XzzV
         2M0g==
X-Gm-Message-State: AOJu0Ywpwf4zx4N69uiBTzVfyrufzDpFp2OzrPNhlswfIL650Tgu7sEy
	cO7g8UU/1S4fi9bc91lNZLRo2IfzQdn0ZqCAT39y7oi2TGPQeOs4B18+W6Oz/6Q=
X-Google-Smtp-Source: AGHT+IHrp2K1n78aysbceZHypu7Rwm4s7kvfWgzqy55Uj5/riRKkFkig0ub6m3wSYWDCQiKQFxo/Uw==
X-Received: by 2002:aca:915:0:b0:3c9:6bd5:44aa with SMTP id 5614622812f47-3cdb67a680emr4187187b6e.34.1716459707711;
        Thu, 23 May 2024 03:21:47 -0700 (PDT)
Date: Thu, 23 May 2024 12:21:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] tools/xg: Streamline cpu policy
 serialise/deserialise calls
Message-ID: <Zk8YucyA1ZwGU4Y-@macbook>
References: <cover.1716457040.git.alejandro.vallejo@cloud.com>
 <5c6ee74b60bad4eb9cc8e17dbfcf7158d38bd32c.1716457040.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c6ee74b60bad4eb9cc8e17dbfcf7158d38bd32c.1716457040.git.alejandro.vallejo@cloud.com>

On Thu, May 23, 2024 at 10:41:29AM +0100, Alejandro Vallejo wrote:
> The idea is to use xc_cpu_policy_t as a single object containing both the
> serialised and deserialised forms of the policy. Note that we need lengths
> for the arrays, as the serialised policies may be shorter than the array
> capacities.
> 
> * Add the serialised lengths to the struct so we can distinguish
>   between length and capacity of the serialisation buffers.
> * Remove explicit buffer+lengths in serialise/deserialise calls
>   and use the internal buffer inside xc_cpu_policy_t instead.
> * Refactor everything to use the new serialisation functions.
> * Remove redundant serialization calls and avoid allocating dynamic
>   memory aside from the policy objects in xen-cpuid. Also minor cleanup
>   in the policy print call sites.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just two comments.

> ---
> v3:
>   * Better context scoping in xg_sr_common_x86.
>     * Can't be const because write_record() takes non-const.
>   * Adjusted line length of xen-cpuid's print_policy.
>   * Adjusted error messages in xen-cpuid's print_policy.
>   * Reverted removal of overscoped loop indices.
> ---
>  tools/include/xenguest.h            |  8 ++-
>  tools/libs/guest/xg_cpuid_x86.c     | 98 ++++++++++++++++++++---------
>  tools/libs/guest/xg_private.h       |  2 +
>  tools/libs/guest/xg_sr_common_x86.c | 56 ++++++-----------
>  tools/misc/xen-cpuid.c              | 41 ++++--------
>  5 files changed, 106 insertions(+), 99 deletions(-)
> 
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index e01f494b772a..563811cd8dde 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -799,14 +799,16 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>                               xc_cpu_policy_t *policy);
>  
>  /* Manipulate a policy via architectural representations. */
> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *policy,
> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs);
> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *policy);
>  int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
>                                 const xen_cpuid_leaf_t *leaves,
>                                 uint32_t nr);
>  int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
>                                const xen_msr_entry_t *msrs, uint32_t nr);
> +int xc_cpu_policy_get_leaves(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                             const xen_cpuid_leaf_t **leaves, uint32_t *nr);
> +int xc_cpu_policy_get_msrs(xc_interface *xch, const xc_cpu_policy_t *policy,
> +                           const xen_msr_entry_t **msrs, uint32_t *nr);

Maybe it would be helpful to have a comment clarifying that the return
of xc_cpu_policy_get_{leaves,msrs}() is a reference to the content of
the policy, not a copy of it (and hence is tied to the lifetime of
policy, and doesn't require explicit freeing).

>  
>  /* Compatibility calculations. */
>  bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4453178100ad..4f4b86b59470 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -834,14 +834,13 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t *policy)
>      }
>  }
>  
> -static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
> -                              unsigned int nr_leaves, unsigned int nr_entries)
> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
>  {
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      int rc;
>  
>      rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
> -                                    nr_leaves, &err_leaf, &err_subleaf);
> +                                    policy->nr_leaves, &err_leaf, &err_subleaf);
>      if ( rc )
>      {
>          if ( err_leaf != -1 )
> @@ -851,7 +850,7 @@ static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy,
>      }
>  
>      rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
> -                                  nr_entries, &err_msr);
> +                                  policy->nr_msrs, &err_msr);
>      if ( rc )
>      {
>          if ( err_msr != -1 )
> @@ -878,7 +877,10 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int policy_idx,
>          return rc;
>      }
>  
> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
> +    policy->nr_leaves = nr_leaves;
> +    policy->nr_msrs = nr_msrs;
> +
> +    rc = deserialize_policy(xch, policy);
>      if ( rc )
>      {
>          errno = -rc;
> @@ -903,7 +905,10 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
>          return rc;
>      }
>  
> -    rc = deserialize_policy(xch, policy, nr_leaves, nr_msrs);
> +    policy->nr_leaves = nr_leaves;
> +    policy->nr_msrs = nr_msrs;
> +
> +    rc = deserialize_policy(xch, policy);
>      if ( rc )
>      {
>          errno = -rc;
> @@ -917,17 +922,14 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>                               xc_cpu_policy_t *policy)
>  {
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    unsigned int nr_leaves = ARRAY_SIZE(policy->leaves);
> -    unsigned int nr_msrs = ARRAY_SIZE(policy->msrs);
>      int rc;
>  
> -    rc = xc_cpu_policy_serialise(xch, policy, policy->leaves, &nr_leaves,
> -                                 policy->msrs, &nr_msrs);
> +    rc = xc_cpu_policy_serialise(xch, policy);
>      if ( rc )
>          return rc;
>  
> -    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, policy->leaves,
> -                                  nr_msrs, policy->msrs,
> +    rc = xc_set_domain_cpu_policy(xch, domid, policy->nr_leaves, policy->leaves,
> +                                  policy->nr_msrs, policy->msrs,
>                                    &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
> @@ -942,34 +944,32 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint32_t domid,
>      return rc;
>  }
>  
> -int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t *p,
> -                            xen_cpuid_leaf_t *leaves, uint32_t *nr_leaves,
> -                            xen_msr_entry_t *msrs, uint32_t *nr_msrs)
> +int xc_cpu_policy_serialise(xc_interface *xch, xc_cpu_policy_t *p)
>  {
> +    unsigned int nr_leaves = ARRAY_SIZE(p->leaves);
> +    unsigned int nr_msrs = ARRAY_SIZE(p->msrs);
>      int rc;
>  
> -    if ( leaves )
> +    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
> +    if ( rc )
>      {
> -        rc = x86_cpuid_copy_to_buffer(&p->policy, leaves, nr_leaves);
> -        if ( rc )
> -        {
> -            ERROR("Failed to serialize CPUID policy");
> -            errno = -rc;
> -            return -1;
> -        }
> +        ERROR("Failed to serialize CPUID policy");
> +        errno = -rc;
> +        return -1;
>      }
>  
> -    if ( msrs )
> +    p->nr_leaves = nr_leaves;

Nit: FWIW, I think you could avoid having to introduce local
nr_{leaves,msrs} variables and just use p->nr_{leaves,msrs}?  By
setting them to ARRAY_SIZE() at the top of the function and then
letting x86_{cpuid,msr}_copy_to_buffer() adjust as necessary.

Thanks, Roger.

