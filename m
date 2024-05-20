Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A656A8C9F36
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 17:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726198.1130458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94Wr-0001Ct-Tz; Mon, 20 May 2024 15:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726198.1130458; Mon, 20 May 2024 15:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94Wr-0001AH-Qt; Mon, 20 May 2024 15:02:21 +0000
Received: by outflank-mailman (input) for mailman id 726198;
 Mon, 20 May 2024 15:02:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ccuw=MX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s94Wp-0001A7-PI
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 15:02:19 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1ea07f8-16b9-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 17:02:16 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-792b8c9046bso280073485a.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 08:02:16 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf3106cfsm1188444485a.108.2024.05.20.08.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 08:02:13 -0700 (PDT)
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
X-Inumbo-ID: f1ea07f8-16b9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716217335; x=1716822135; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPjE5Qnnk/P6B3pQj3ASZ+iZi+YzWQO3+vJ709b2zt4=;
        b=WbrBhKFNKyEKmLgZjMkmqP1ju4jk29Xdh4R0ciIPpgcqLG3seHcQ7A4+m5+kdd+Iea
         M+BDzF2BaXwq4pUkAr+cwloN7IBqcA5aciddw7cClSIderrsgLrkeu7zbxRDucWGxUkw
         fY09aA8c0N4GMT2Yg0E8bXEl5so/1sBG8eY3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716217335; x=1716822135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPjE5Qnnk/P6B3pQj3ASZ+iZi+YzWQO3+vJ709b2zt4=;
        b=ZM0vheHv2lOY+QnklcjzIfON/pHL5cmfTyF/vSVX2wE8vzWza/jQCOkahMflUhHFw7
         23s9+1V5ga0cvE7hdxMItG8hjNKXkp1sIX4rTJ90MyhptQfBMO1kVUd3r7k8+1n0OuFp
         Vmcj2XGG7x2hhL9RxkOi2y3xh3Uu/cgqLSY2OUrj8ZoPrEE7JTxjcyq2eAUoZaaeGliM
         MebIfoX2OIe+YDQM4sDVJ+7ikimqNnv5m/VyrykQwRNSu5oBS29lI3FKlmdn0QBuKGVu
         CHoL7JEJOSgpxCJlDSDTrDMyTst1I9lzjpLnUud3nSTel7KY71PxkxPM33SrwHOpp4N4
         FVzQ==
X-Gm-Message-State: AOJu0YzJx1g4/ey2FzTzant8D8wJhOd6XzoMg2Pq7aebJYI8RBnenvZl
	tOyQG86OArsOQVR7meUNNPHBnFlBuvg8xwqqj38lqibD5NJKRIDKq4VNxgJOcVU=
X-Google-Smtp-Source: AGHT+IEjty7b6dbecHwPLHZurTqtJ1GT77VDpv90pkW89EfqrlwikV4DJ04MxJ+sDD9qTUcoqgrPxA==
X-Received: by 2002:ae9:e014:0:b0:792:8c06:cd8 with SMTP id af79cd13be357-792c7610199mr3075354185a.71.1716217334352;
        Mon, 20 May 2024 08:02:14 -0700 (PDT)
Date: Mon, 20 May 2024 17:02:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] tools/xg: Clean up xend-style overrides for CPU
 policies
Message-ID: <Zktl8zRt1kue5vA6@macbook>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
 <d397ec0de4138e32feeb910f3401a6568a75035e.1715954111.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d397ec0de4138e32feeb910f3401a6568a75035e.1715954111.git.alejandro.vallejo@cloud.com>

On Fri, May 17, 2024 at 05:08:35PM +0100, Alejandro Vallejo wrote:
> Factor out policy getters/setters from both (CPUID and MSR) policy override
> functions. Additionally, use host policy rather than featureset when
> preparing the cur policy, saving one hypercall and several lines of
> boilerplate.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * Cosmetic change to comment (// into /**/).
>   * Added missing null pointer check to MSR override function.
> ---
>  tools/libs/guest/xg_cpuid_x86.c | 445 ++++++++++----------------------
>  1 file changed, 130 insertions(+), 315 deletions(-)
> 
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 4f4b86b59470..74bca0e65b69 100644
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
> @@ -260,102 +288,34 @@ static int compare_leaves(const void *l, const void *r)
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
> +    return bsearch(&key, p->leaves, ARRAY_SIZE(p->leaves),
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
> -
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
> -
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
> +    if ( !xend )
> +        return 0;
>  
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
> @@ -384,7 +344,7 @@ static int xc_cpuid_xend_policy(
>                  {
>                      ERROR("Bad character '%c' in policy[%d] string '%s'",
>                            xend->policy[i][j], i, xend->policy[i]);
> -                    goto fail;
> +                    return -EINVAL;
>                  }
>  
>                  clear_bit(31 - j, cur_reg);
> @@ -394,25 +354,7 @@ static int xc_cpuid_xend_policy(
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
> @@ -426,107 +368,37 @@ static int compare_msr(const void *l, const void *r)
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
> +    return bsearch(&key, p->msrs, ARRAY_SIZE(p->msrs),
> +                   sizeof(*p->msrs), compare_msr);
>  }
>  
> -
>  static int xc_msr_policy(xc_interface *xch, domid_t domid,
> -                         const struct xc_msr *msr)
> +                         const struct xc_msr *msr,
> +                         xc_cpu_policy_t *host,
> +                         xc_cpu_policy_t *def,

host and def should likely be const?

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
> -
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
> +    if ( !msrs )

Does this build?  Where is 'msrs' defined in this context?  The
function parameter is 'msr' AFAICT.

> +        return 0;

Should we also check for host, def, cur != NULL also?

>  
>      for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
>      {
> -        xen_msr_entry_t *cur_msr = find_msr(cur, nr_cur, msr->index);
> -        const xen_msr_entry_t *def_msr = find_msr(def, nr_def, msr->index);
> -        const xen_msr_entry_t *host_msr = find_msr(host, nr_host, msr->index);
> -        unsigned int i;
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
> -        for ( i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
> +        for ( size_t i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )
>          {
>              bool val;
>  
> @@ -542,8 +414,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
>              {
>                  ERROR("MSR index %#x: bad character '%c' in policy string '%s'",
>                        msr->index, msr->policy[i], msr->policy);
> -                rc = -EINVAL;
> -                goto out;
> +                return -EINVAL;
>              }
>  
>              if ( val )
> @@ -553,25 +424,7 @@ static int xc_msr_policy(xc_interface *xch, domid_t domid,
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
> @@ -583,14 +436,16 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      int rc;
>      bool hvm;
>      xc_domaininfo_t di;
> -    struct xc_cpu_policy *p = xc_cpu_policy_init();
> -    unsigned int i, nr_leaves = ARRAY_SIZE(p->leaves), nr_msrs = 0;
> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
> -    uint32_t len = ARRAY_SIZE(host_featureset);
>  
> -    if ( !p )
> -        return -ENOMEM;
> +    struct xc_cpu_policy *host = xc_cpu_policy_init();
> +    struct xc_cpu_policy *def = xc_cpu_policy_init();

I would be helpful to have some kind of mechanism to allocate + init a
policy at the same time, so that the resulting object could be made
const here.  (Not that you need to do it in this patch).

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
> @@ -600,21 +455,19 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
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
> @@ -622,14 +475,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
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
>  
>      if ( restore )
>      {
> @@ -647,18 +494,18 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>           * - Re-enable features which have become (possibly) off by default.
>           */
>  
> -        p->policy.basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
> -        p->policy.feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
> -        p->policy.feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
> +        cur->policy.basic.rdrand = host->policy.basic.rdrand;
> +        cur->policy.feat.hle = host->policy.feat.hle;
> +        cur->policy.feat.rtm = host->policy.feat.rtm;
>  
>          if ( hvm )
>          {
> -            p->policy.feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
> +            cur->policy.feat.mpx = host->policy.feat.mpx;
>          }
>  
> -        p->policy.basic.max_leaf = min(p->policy.basic.max_leaf, 0xdu);
> -        p->policy.feat.max_subleaf = 0;
> -        p->policy.extd.max_leaf = min(p->policy.extd.max_leaf, 0x8000001c);
> +        cur->policy.basic.max_leaf = min(cur->policy.basic.max_leaf, 0xdu);
> +        cur->policy.feat.max_subleaf = 0;
> +        cur->policy.extd.max_leaf = min(cur->policy.extd.max_leaf, 0x8000001c);
>      }
>  
>      if ( featureset )
> @@ -666,7 +513,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>          uint32_t disabled_features[FEATURESET_NR_ENTRIES],
>              feat[FEATURESET_NR_ENTRIES] = {};
>          static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
> -        unsigned int i, b;
> +        unsigned int b;
>  
>          /*
>           * The user supplied featureset may be shorter or longer than
> @@ -677,14 +524,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>  
>          /* Check for truncated set bits. */
>          rc = -EOPNOTSUPP;
> -        for ( i = user_len; i < nr_features; ++i )
> +        for ( size_t i = user_len; i < nr_features; ++i )
>              if ( featureset[i] != 0 )
>                  goto out;
>  
>          memcpy(feat, featureset, sizeof(*featureset) * user_len);
>  
>          /* Disable deep dependencies of disabled features. */
> -        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
> +        for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )
>              disabled_features[i] = ~feat[i] & deep_features[i];
>  
>          for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
> @@ -695,24 +542,24 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>                   !(dfs = x86_cpu_policy_lookup_deep_deps(b)) )
>                  continue;
>  
> -            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
> +            for ( size_t i = 0; i < ARRAY_SIZE(disabled_features); ++i )

All this loop index type changes could be done as a separate patch,
you are not even touching the surrounding lines.  It adds a lot of
churn to this patch for no reason IMO.

>              {
>                  feat[i] &= ~dfs[i];
>                  disabled_features[i] &= ~dfs[i];
>              }
>          }
>  
> -        x86_cpu_featureset_to_policy(feat, &p->policy);
> +        x86_cpu_featureset_to_policy(feat, &cur->policy);
>      }
>      else
>      {
> -        p->policy.extd.itsc = itsc;
> +        cur->policy.extd.itsc = itsc;
>  
>          if ( hvm )
>          {
> -            p->policy.basic.pae = pae;
> -            p->policy.basic.vmx = nested_virt;
> -            p->policy.extd.svm = nested_virt;
> +            cur->policy.basic.pae = pae;
> +            cur->policy.basic.vmx = nested_virt;
> +            cur->policy.extd.svm = nested_virt;
>          }
>      }
>  
> @@ -722,8 +569,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>           * On hardware without CPUID Faulting, PV guests see real topology.
>           * As a consequence, they also need to see the host htt/cmp fields.
>           */
> -        p->policy.basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
> -        p->policy.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
> +        cur->policy.basic.htt       = host->policy.basic.htt;
> +        cur->policy.extd.cmp_legacy = host->policy.extd.cmp_legacy;
>      }
>      else
>      {
> @@ -731,28 +578,28 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>           * Topology for HVM guests is entirely controlled by Xen.  For now, we
>           * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
>           */
> -        p->policy.basic.htt = true;
> -        p->policy.extd.cmp_legacy = false;
> +        cur->policy.basic.htt = true;
> +        cur->policy.extd.cmp_legacy = false;
>  
>          /*
>           * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
>           * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
>           * overflow.
>           */
> -        if ( !p->policy.basic.lppp )
> -            p->policy.basic.lppp = 2;
> -        else if ( !(p->policy.basic.lppp & 0x80) )
> -            p->policy.basic.lppp *= 2;
> +        if ( !cur->policy.basic.lppp )
> +            cur->policy.basic.lppp = 2;
> +        else if ( !(cur->policy.basic.lppp & 0x80) )
> +            cur->policy.basic.lppp *= 2;
>  
> -        switch ( p->policy.x86_vendor )
> +        switch ( cur->policy.x86_vendor )
>          {
>          case X86_VENDOR_INTEL:
> -            for ( i = 0; (p->policy.cache.subleaf[i].type &&
> -                          i < ARRAY_SIZE(p->policy.cache.raw)); ++i )
> +            for ( size_t i = 0; (cur->policy.cache.subleaf[i].type &&
> +                                i < ARRAY_SIZE(cur->policy.cache.raw)); ++i )
>              {
> -                p->policy.cache.subleaf[i].cores_per_package =
> -                    (p->policy.cache.subleaf[i].cores_per_package << 1) | 1;
> -                p->policy.cache.subleaf[i].threads_per_cache = 0;
> +                cur->policy.cache.subleaf[i].cores_per_package =
> +                    (cur->policy.cache.subleaf[i].cores_per_package << 1) | 1;
> +                cur->policy.cache.subleaf[i].threads_per_cache = 0;
>              }
>              break;
>  
> @@ -772,49 +619,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>               * apic_id_size values greater than 7.  Limit the value to
>               * 7 for now.
>               */
> -            if ( p->policy.extd.nc < 0x7f )
> +            if ( cur->policy.extd.nc < 0x7f )
>              {
> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
> -                    p->policy.extd.apic_id_size++;
> +                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )

I would split the line while there, it's overly long.

Thanks, Roger.

