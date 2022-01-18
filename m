Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2086C4927FF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258531.445315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p82-00072s-3S; Tue, 18 Jan 2022 14:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258531.445315; Tue, 18 Jan 2022 14:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9p82-0006zt-08; Tue, 18 Jan 2022 14:06:30 +0000
Received: by outflank-mailman (input) for mailman id 258531;
 Tue, 18 Jan 2022 14:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1rGk=SC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n9p80-0006yT-Hs
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:06:28 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3418a54-7867-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:06:27 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:48428)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n9p7y-000z6m-6d (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 18 Jan 2022 14:06:26 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CAC871FC87;
 Tue, 18 Jan 2022 14:06:25 +0000 (GMT)
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
X-Inumbo-ID: d3418a54-7867-11ec-a115-11989b9578b4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <f20a04e6-cfc6-1099-0944-eadf8192ae6f@srcf.net>
Date: Tue, 18 Jan 2022 14:06:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-9-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v6 08/12] libs/guest: rework xc_cpuid_xend_policy
In-Reply-To: <20220117094827.16756-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2022 09:48, Roger Pau Monne wrote:
> Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid

I'm not convinced by this name.  'xend' is important because it's the
format of the data passed, which 'cpuid' is not.

It is a horribly inefficient format, and really doesn't want to survive
cleanup to the internals of libxl.

> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index e7ae133d8d..9060a2f763 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -254,144 +254,107 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
>      return ret;
>  }
>  
> -static int compare_leaves(const void *l, const void *r)
> -{
> -    const xen_cpuid_leaf_t *lhs = l;
> -    const xen_cpuid_leaf_t *rhs = r;
> -
> -    if ( lhs->leaf != rhs->leaf )
> -        return lhs->leaf < rhs->leaf ? -1 : 1;
> -
> -    if ( lhs->subleaf != rhs->subleaf )
> -        return lhs->subleaf < rhs->subleaf ? -1 : 1;
> -
> -    return 0;
> -}
> -
> -static xen_cpuid_leaf_t *find_leaf(
> -    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
> -    const struct xc_xend_cpuid *xend)
> -{
> -    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
> -
> -    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
> -}
> -
> -static int xc_cpuid_xend_policy(
> -    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
> +int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
> +                              const struct xc_xend_cpuid *cpuid, bool hvm)
>  {
>      int rc;
> -    xc_dominfo_t di;
> -    unsigned int nr_leaves, nr_msrs;
> -    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> -    /*
> -     * Three full policies.  The host, default for the domain type,
> -     * and domain current.
> -     */
> -    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
> -    unsigned int nr_host, nr_def, nr_cur;
> +    xc_cpu_policy_t *host = NULL, *def = NULL;
>  
> -    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
> -         di.domid != domid )
> -    {
> -        ERROR("Failed to obtain d%d info", domid);
> -        rc = -ESRCH;
> -        goto fail;
> -    }
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
> +    host = xc_cpu_policy_init();
> +    def = xc_cpu_policy_init();
> +    if ( !host || !def )
>      {
> -        PERROR("Failed to obtain d%d current policy", domid);
> -        rc = -errno;
> -        goto fail;
> +        PERROR("Failed to init policies");
> +        rc = -ENOMEM;
> +        goto out;
>      }
>  
>      /* Get the domain type's default policy. */
> -    nr_msrs = 0;
> -    nr_def = nr_leaves;
> -    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
> +    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
>                                             : XEN_SYSCTL_cpu_policy_pv_default,
> -                               &nr_def, def, &nr_msrs, NULL);
> +                                  def);
>      if ( rc )
>      {
> -        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
> -        rc = -errno;
> -        goto fail;
> +        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
> +        goto out;
>      }
>  
>      /* Get the host policy. */
> -    nr_msrs = 0;
> -    nr_host = nr_leaves;
> -    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
> -                               &nr_host, host, &nr_msrs, NULL);
> +    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
>      if ( rc )
>      {
>          PERROR("Failed to obtain host policy");
> -        rc = -errno;
> -        goto fail;
> +        goto out;
>      }
>  
>      rc = -EINVAL;
> -    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
> +    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
>      {
> -        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
> -        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
> -        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
> +        xen_cpuid_leaf_t cur_leaf;
> +        xen_cpuid_leaf_t def_leaf;
> +        xen_cpuid_leaf_t host_leaf;
>  
> -        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
> +        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
> +                                     &cur_leaf);

This is a crazy increase in data shuffling.

Use x86_cpuid_get_leaf() from patch 2, which *is* find_leaf() for
objects rather than lists, and removes the need to further-shuffle the
data later now that you're not modifying cur in place.

It also removes the churn introduced by changing the indirection of
these variables.

It also removes all callers of xc_cpu_policy_get_cpuid(), which don't
have an obvious purpose to begin with.  Relatedly,
xc_cpu_policy_get_msr() has no users at all, that I can see.

~Andrew

