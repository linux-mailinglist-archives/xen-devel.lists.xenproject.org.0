Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A770F8D48C9
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732600.1138599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcHl-0005kK-Va; Thu, 30 May 2024 09:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732600.1138599; Thu, 30 May 2024 09:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcHl-0005iW-Qt; Thu, 30 May 2024 09:41:25 +0000
Received: by outflank-mailman (input) for mailman id 732600;
 Thu, 30 May 2024 09:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MghO=NB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCcHk-0005TW-AF
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 09:41:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5f44948-1e68-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 11:41:22 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-354fb2d9026so749330f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 02:41:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dbf0b2a93sm1683419f8f.22.2024.05.30.02.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 02:41:20 -0700 (PDT)
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
X-Inumbo-ID: c5f44948-1e68-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717062081; x=1717666881; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9n3bIz0tcEFlZ832RlwXwEdMi2z/RMwB8j9S8/acoRU=;
        b=jBLHSQgoBl4JWX9dDXCI2abT1X3hcbGlc2uKkZDlyD7Be94vcvrSDPK8AEGJgWVzk7
         t0JWtA/IjhRaTOSDHO7PCJvfiutH+c4e4CXoTcnLGiX71V6KabunB2TyxpCqImtEKs+H
         YYB1tsIB6zRGffyhtVVeanUXnl03C2xpjUKr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062081; x=1717666881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n3bIz0tcEFlZ832RlwXwEdMi2z/RMwB8j9S8/acoRU=;
        b=rBLhEOU9pyEzEZ51dgcuTzrnbBJRry7VPpvd7GauMafPDFGJPeKvAoxsNcTHvxg3cY
         YFs2S40tt9awea+9Vpm/ZoxKfZE+EIPcv5vB+G6GOerJKB04U3gGUZvEVi9DzRqUv2Sw
         F9RGy3S6+wrIeVZjOmoAdFz7XvPm1nRAplpiNMEDWo16VaDxwJCrG6aEcQdcVHOxUdUm
         /V0qp3p1FSFSm6JcHXKtWj+h3hA/3JDVZJcUHDsIAtRg6/glaF8u3EOQIipmSt2YvEt0
         ghNPi4XmiD7vC7snG3LzlgRGFin7LI1kg571WvaYNfp/v5OOnlvRYJo+/GnE+lllnuGU
         /MSA==
X-Gm-Message-State: AOJu0YxSdafb4OivkqDsVI3Oktz1xRQn0DMBauEwWQmRUbYMpjgeElpf
	2kYJmscZH3FQspaPQT4o9ldZnNWkJ/cyFIO9Ea6indqyazB8bYQtTou6M3vBiII=
X-Google-Smtp-Source: AGHT+IGLHnVDII//Q3Ehl4zvoK+vnH/GyuSHrQuR2RfVzh45Uyno3MJzxqkz6LALn6RU5sAkQ0skSQ==
X-Received: by 2002:adf:ec0c:0:b0:354:f724:641d with SMTP id ffacd0b85a97d-35dc009a9dfmr850784f8f.42.1717062081195;
        Thu, 30 May 2024 02:41:21 -0700 (PDT)
Date: Thu, 30 May 2024 11:41:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] tools/xg: Clean up xend-style overrides for CPU
 policies
Message-ID: <ZlhJwB3ke5HN2VKL@macbook>
References: <cover.1716992707.git.alejandro.vallejo@cloud.com>
 <ce6dc0221bbab353b6f47cf4bbbbcdf3aacc0cb8.1716992707.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce6dc0221bbab353b6f47cf4bbbbcdf3aacc0cb8.1716992707.git.alejandro.vallejo@cloud.com>

On Wed, May 29, 2024 at 03:30:38PM +0100, Alejandro Vallejo wrote:
> Factor out policy getters/setters from both (CPUID and MSR) policy override
> functions. Additionally, use host policy rather than featureset when
> preparing the cur policy, saving one hypercall and several lines of
> boilerplate.
> 
> No functional change intended.

One change that's worth mentioning is that now the policy gets set
only once per domain, as the whole policy is prepared and uploaded to
the hypervisor, rather than uploading a partial policy which is then
further adjusted by xc_{cpuid_xend,msr}_policy() calls.

> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v4:
>   * Indentation adjustment.
>   * Fix unhandled corner case using bsearch() with MSR and leaf buffers
> ---
>  tools/libs/guest/xg_cpuid_x86.c | 437 ++++++++++----------------------
>  1 file changed, 130 insertions(+), 307 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 6cab5c60bb41..552ec2ab7312 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -36,6 +36,34 @@ enum {
>  #define bitmaskof(idx)      (1u << ((idx) & 31))
>  #define featureword_of(idx) ((idx) >> 5)
>  
> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t *policy)
> +{
> +    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> +    int rc;
> +
> +    rc = x86_cpuid_copy_from_buffer(&policy->policy, policy->leaves,
> +                                    policy->nr_leaves, &err_leaf, &err_subleaf);
> +    if ( rc )
> +    {
> +        if ( err_leaf != -1 )
> +            ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
> +                  err_leaf, err_subleaf, -rc, strerror(-rc));
> +        return rc;
> +    }
> +
> +    rc = x86_msr_copy_from_buffer(&policy->policy, policy->msrs,
> +                                  policy->nr_msrs, &err_msr);
> +    if ( rc )
> +    {
> +        if ( err_msr != -1 )
> +            ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
> +                  err_msr, -rc, strerror(-rc));
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
>  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
>  {
>      struct xen_sysctl sysctl = {};
> @@ -260,102 +288,37 @@ static int compare_leaves(const void *l, const void *r)
>      return 0;
>  }
>  
> -static xen_cpuid_leaf_t *find_leaf(
> -    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
> -    const struct xc_xend_cpuid *xend)
> +static xen_cpuid_leaf_t *find_leaf(xc_cpu_policy_t *p,
> +                                   const struct xc_xend_cpuid *xend)
>  {
>      const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
>  
> -    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
> +    return bsearch(&key, p->leaves, p->nr_leaves,
> +                   sizeof(*p->leaves), compare_leaves);
>  }
>  
> -static int xc_cpuid_xend_policy(
> -    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
> +static int xc_cpuid_xend_policy(xc_interface *xch, uint32_t domid,
> +                                const struct xc_xend_cpuid *xend,
> +                                xc_cpu_policy_t *host,
> +                                xc_cpu_policy_t *def,
> +                                xc_cpu_policy_t *cur)
>  {
> -    int rc;
> -    bool hvm;
> -    xc_domaininfo_t di;
> -    unsigned int nr_leaves, nr_msrs;
> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    /*
> -     * Three full policies.  The host, default for the domain type,
> -     * and domain current.
> -     */
> -    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
> -    unsigned int nr_host, nr_def, nr_cur;
> -
> -    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
> -    {
> -        PERROR("Failed to obtain d%d info", domid);
> -        rc = -errno;
> -        goto fail;
> -    }
> -    hvm = di.flags & XEN_DOMINF_hvm_guest;
> -
> -    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain policy info size");
> -        rc = -errno;
> -        goto fail;
> -    }
> -
> -    rc = -ENOMEM;
> -    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
> -         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
> -         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
> -    {
> -        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
> -        goto fail;
> -    }
> -
> -    /* Get the domain's current policy. */
> -    nr_msrs = 0;
> -    nr_cur = nr_leaves;
> -    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain d%d current policy", domid);
> -        rc = -errno;
> -        goto fail;
> -    }
> +    if ( !xend )
> +        return 0;
>  
> -    /* Get the domain type's default policy. */
> -    nr_msrs = 0;
> -    nr_def = nr_leaves;
> -    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> -                                        : XEN_SYSCTL_cpu_policy_pv_default,
> -                               &nr_def, def, &nr_msrs, NULL);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
> -        rc = -errno;
> -        goto fail;
> -    }
> +    if ( !host || !def || !cur )
> +        return -EINVAL;
>  
> -    /* Get the host policy. */
> -    nr_msrs = 0;
> -    nr_host = nr_leaves;
> -    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
> -                               &nr_host, host, &nr_msrs, NULL);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain host policy");
> -        rc = -errno;
> -        goto fail;
> -    }
> -
> -    rc = -EINVAL;
>      for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
>      {
> -        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
> -        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
> -        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
> +        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, xend);
> +        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, xend);
> +        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, xend);
>  
>          if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
>          {
>              ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
> -            goto fail;
> +            return -EINVAL;
>          }
>  
>          for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
> @@ -384,7 +347,7 @@ static int xc_cpuid_xend_policy(
>                  {
>                      ERROR("Bad character '%c' in policy[%d] string '%s'",
>                            xend->policy[i][j], i, xend->policy[i]);
> -                    goto fail;
> +                    return -EINVAL;
>                  }
>  
>                  clear_bit(31 - j, cur_reg);
> @@ -394,25 +357,7 @@ static int xc_cpuid_xend_policy(
>          }
>      }
>  
> -    /* Feed the transformed currrent policy back up to Xen. */
> -    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
> -                                  &err_leaf, &err_subleaf, &err_msr);
> -    if ( rc )
> -    {
> -        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
> -               domid, err_leaf, err_subleaf, err_msr);
> -        rc = -errno;
> -        goto fail;
> -    }
> -
> -    /* Success! */
> -
> - fail:
> -    free(cur);
> -    free(def);
> -    free(host);
> -
> -    return rc;
> +    return 0;
>  }
>  
>  static int compare_msr(const void *l, const void *r)
> @@ -426,104 +371,37 @@ static int compare_msr(const void *l, const void *r)
>      return lhs->idx < rhs->idx ? -1 : 1;
>  }
>  
> -static xen_msr_entry_t *find_msr(
> -    xen_msr_entry_t *msrs, unsigned int nr_msrs,
> -    uint32_t index)
> +static xen_msr_entry_t *find_msr(xc_cpu_policy_t *p,
> +                                 uint32_t index)
>  {
>      const xen_msr_entry_t key = { .idx = index };
>  
> -    return bsearch(&key, msrs, nr_msrs, sizeof(*msrs), compare_msr);
> +    return bsearch(&key, p->msrs, p->nr_msrs, sizeof(*p->msrs), compare_msr);
>  }
>  
> -
>  static int xc_msr_policy(xc_interface *xch, domid_t domid,
> -                         const struct xc_msr *msr)
> +                         const struct xc_msr *msr,
> +                         xc_cpu_policy_t *host,
> +                         xc_cpu_policy_t *def,
> +                         xc_cpu_policy_t *cur)
>  {
> -    int rc;
> -    bool hvm;
> -    xc_domaininfo_t di;
> -    unsigned int nr_leaves, nr_msrs;
> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    /*
> -     * Three full policies.  The host, default for the domain type,
> -     * and domain current.
> -     */
> -    xen_msr_entry_t *host = NULL, *def = NULL, *cur = NULL;
> -    unsigned int nr_host, nr_def, nr_cur;
> -
> -    if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
> -    {
> -        PERROR("Failed to obtain d%d info", domid);
> -        rc = -errno;
> -        goto out;
> -    }
> -    hvm = di.flags & XEN_DOMINF_hvm_guest;
> -
> -    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain policy info size");
> -        rc = -errno;
> -        goto out;
> -    }
> -
> -    if ( (host = calloc(nr_msrs, sizeof(*host))) == NULL ||
> -         (def  = calloc(nr_msrs, sizeof(*def)))  == NULL ||
> -         (cur  = calloc(nr_msrs, sizeof(*cur)))  == NULL )
> -    {
> -        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
> -        rc = -ENOMEM;
> -        goto out;
> -    }
> -
> -    /* Get the domain's current policy. */
> -    nr_leaves = 0;
> -    nr_cur = nr_msrs;
> -    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, NULL, &nr_cur, cur);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain d%d current policy", domid);
> -        rc = -errno;
> -        goto out;
> -    }
> -
> -    /* Get the domain type's default policy. */
> -    nr_leaves = 0;
> -    nr_def = nr_msrs;
> -    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> -                                        : XEN_SYSCTL_cpu_policy_pv_default,
> -                               &nr_leaves, NULL, &nr_def, def);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
> -        rc = -errno;
> -        goto out;
> -    }
> +    if ( !msr )
> +        return 0;
>  
> -    /* Get the host policy. */
> -    nr_leaves = 0;
> -    nr_host = nr_msrs;
> -    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
> -                               &nr_leaves, NULL, &nr_host, host);
> -    if ( rc )
> -    {
> -        PERROR("Failed to obtain host policy");
> -        rc = -errno;
> -        goto out;
> -    }
> +    if ( !host || !def || !cur )
> +        return -EINVAL;
>  
>      for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
>      {
> -        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
> -        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
> -        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
>          unsigned int i;
> +        xen_msr_entry_t *cur_msr = find_msr(cur, msr->index);
> +        const xen_msr_entry_t *def_msr = find_msr(def, msr->index);
> +        const xen_msr_entry_t *host_msr = find_msr(host, msr->index);
>  
>          if ( cur_msr == NULL || def_msr == NULL || host_msr == NULL )
>          {
>              ERROR("Missing MSR %#x", msr->index);
> -            rc = -ENOENT;
> -            goto out;
> +            return -ENOENT;
>          }
>  
>          for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
> @@ -542,8 +420,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
>              {
>                  ERROR("MSR index %#x: bad character '%c' in policy string '%s'",
>                        msr->index, msr->policy[i], msr->policy);
> -                rc = -EINVAL;
> -                goto out;
> +                return -EINVAL;
>              }
>  
>              if ( val )
> @@ -553,25 +430,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
>          }
>      }
>  
> -    /* Feed the transformed policy back up to Xen. */
> -    rc = xc_set_domain_cpu_policy(xch, domid, 0, NULL, nr_cur, cur,
> -                                  &err_leaf, &err_subleaf, &err_msr);
> -    if ( rc )
> -    {
> -        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
> -               domid, err_leaf, err_subleaf, err_msr);
> -        rc = -errno;
> -        goto out;
> -    }
> -
> -    /* Success! */
> -
> - out:
> -    free(cur);
> -    free(def);
> -    free(host);
> -
> -    return rc;
> +    return 0;
>  }
>  
>  int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
> @@ -583,14 +442,17 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      int rc;
>      bool hvm;
>      xc_domaininfo_t di;
> -    struct xc_cpu_policy *p = xc_cpu_policy_init();
> -    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
> -    uint32_t len = ARRAY_SIZE(host_featureset);
> +    unsigned int i;
>  
> -    if ( !p )
> -        return -ENOMEM;
> +    struct xc_cpu_policy *host = xc_cpu_policy_init();
> +    struct xc_cpu_policy *def = xc_cpu_policy_init();
> +    struct xc_cpu_policy *cur = xc_cpu_policy_init();
> +
> +    if ( !host || !def || !cur )
> +    {
> +        rc = -ENOMEM;
> +        goto out;
> +    }
>  
>      if ( (rc = xc_domain_getinfo_single(xch, domid, &di)) < 0 )
>      {
> @@ -600,21 +462,19 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      }
>      hvm = di.flags & XEN_DOMINF_hvm_guest;
>  
> -    /* Get the host policy. */
> -    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
> -                               &len, host_featureset);
> -    /* Tolerate "buffer too small", as we've got the bits we need. */
> -    if ( rc && errno != ENOBUFS )
> +    /* Get the raw host policy */
> +    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
> +    if ( rc )
>      {
> -        PERROR("Failed to obtain host featureset");
> +        PERROR("Failed to obtain host policy");
>          rc = -errno;
>          goto out;
>      }
>  
>      /* Get the domain's default policy. */
> -    rc = get_system_cpu_policy(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> -                                        : XEN_SYSCTL_cpu_policy_pv_default,
> -                               &nr_leaves, p->leaves, &nr_msrs, NULL);
> +    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> +                                           : XEN_SYSCTL_cpu_policy_pv_default,
> +                                  def);
>      if ( rc )
>      {
>          PERROR("Failed to obtain %s default policy", hvm ? "hvm" : "pv");
> @@ -622,14 +482,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>          goto out;
>      }
>  
> -    rc = x86_cpuid_copy_from_buffer(&p->policy, p->leaves, nr_leaves,
> -                                    &err_leaf, &err_subleaf);
> -    if ( rc )
> -    {
> -        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
> -              err_leaf, err_subleaf, -rc, strerror(-rc));
> -        goto out;
> -    }
> +    /* Copy the deserialised default policy to modify it */
> +    memcpy(cur, def, sizeof(*cur));

That memcpy() worries me a bit if in the future we have dynamically
allocated fields inside the policy.  I guess we will remember to
modify this.

Thanks, Roger.

