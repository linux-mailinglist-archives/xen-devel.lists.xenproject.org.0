Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18A34EC9F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 17:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103602.197599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGOw-0004rr-Vx; Tue, 30 Mar 2021 15:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103602.197599; Tue, 30 Mar 2021 15:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGOw-0004rR-Sy; Tue, 30 Mar 2021 15:35:30 +0000
Received: by outflank-mailman (input) for mailman id 103602;
 Tue, 30 Mar 2021 15:35:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRGOu-0004rG-RA
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:35:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70576b5a-b9cb-4ff8-a586-6789dd8ba031;
 Tue, 30 Mar 2021 15:35:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70D5DB329;
 Tue, 30 Mar 2021 15:35:26 +0000 (UTC)
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
X-Inumbo-ID: 70576b5a-b9cb-4ff8-a586-6789dd8ba031
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617118526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eusa7b7NQGkJAejeA4HgrTPPbzeMN+HzITjEZXFV8Ug=;
	b=rNCMnPYKGyDfz22u0VvxnlVWgieFv+3fTftB+TitZPzcBzlyJC0CySqQsstRqbaIUsIJqE
	qjugo6OfGzXx1eQwack6tKB8lzJ/VUlK0qlkNr56WIC+LT8NS1QDmmPSlhPmgpS/9/FKmy
	g8iI7kZWm4L+FUksRhHc7WKCHwbIHlc=
Subject: Re: [PATCH 04/21] libs/guest: introduce helper to fetch a system cpu
 policy
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d30e100-3321-a8bd-26bf-38d78d522637@suse.com>
Date: Tue, 30 Mar 2021 17:35:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> Such helper is based on the existing functions to fetch a CPUID and
> MSR policies, but uses the xc_cpu_policy_t type to return the data to
> the caller.
> 
> Note some helper functions are introduced, those are split from
> xc_cpu_policy_get_system because they will be used by other functions
> also.
> 
> No user of the interface introduced on the patch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with just one minor remark below:

> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2596,6 +2596,10 @@ typedef struct cpu_policy *xc_cpu_policy_t;
>  xc_cpu_policy_t xc_cpu_policy_init(void);
>  void xc_cpu_policy_destroy(xc_cpu_policy_t policy);
>  
> +/* Retrieve a system policy, or get/set a domains policy. */
> +int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
> +                             xc_cpu_policy_t policy);
> +
>  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
>  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
>                            uint32_t *nr_features, uint32_t *featureset);
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index ade5281c178..3710fb63839 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -687,3 +687,93 @@ void xc_cpu_policy_destroy(xc_cpu_policy_t policy)
>      free(policy->msr);
>      free(policy);
>  }
> +
> +static int allocate_buffers(xc_interface *xch,
> +                            unsigned int *nr_leaves, xen_cpuid_leaf_t **leaves,
> +                            unsigned int *nr_msrs, xen_msr_entry_t **msrs)
> +{
> +    int rc;
> +
> +    *leaves = NULL;
> +    *msrs = NULL;
> +
> +    rc = xc_cpu_policy_get_size(xch, nr_leaves, nr_msrs);
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain policy info size");
> +        return -errno;
> +    }
> +
> +    *leaves = calloc(*nr_leaves, sizeof(**leaves));
> +    *msrs = calloc(*nr_msrs, sizeof(**msrs));
> +    if ( !*leaves || !*msrs )
> +    {
> +        PERROR("Failed to allocate resources");
> +        free(*leaves);
> +        free(*msrs);
> +        return -ENOMEM;
> +    }
> +
> +    return 0;
> +}
> +
> +static int deserialize_policy(xc_interface *xch, xc_cpu_policy_t policy,
> +                              unsigned int nr_leaves,
> +                              const xen_cpuid_leaf_t *leaves,
> +                              unsigned int nr_msrs, const xen_msr_entry_t *msrs)
> +{
> +    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
> +    int rc;
> +
> +    rc = x86_cpuid_copy_from_buffer(policy->cpuid, leaves, nr_leaves,
> +                                    &err_leaf, &err_subleaf);
> +    if ( rc )
> +    {
> +        ERROR("Failed to deserialise CPUID (err leaf %#x, subleaf %#x) (%d = %s)",
> +              err_leaf, err_subleaf, -rc, strerror(-rc));
> +        return rc;
> +    }
> +
> +    rc = x86_msr_copy_from_buffer(policy->msr, msrs, nr_msrs, &err_msr);
> +    if ( rc )
> +    {
> +        ERROR("Failed to deserialise MSR (err MSR %#x) (%d = %s)",
> +              err_msr, -rc, strerror(-rc));
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
> +                             xc_cpu_policy_t policy)
> +{
> +    unsigned int nr_leaves, nr_msrs;
> +    xen_cpuid_leaf_t *leaves = NULL;
> +    xen_msr_entry_t *msrs = NULL;
> +    int rc;
> +
> +    rc = allocate_buffers(xch, &nr_leaves, &leaves, &nr_msrs, &msrs);
> +    if ( rc )
> +    {
> +        errno = -rc;
> +        return -1;
> +    }
> +
> +    rc = xc_get_system_cpu_policy(xch, idx, &nr_leaves, leaves, &nr_msrs, msrs);
> +    if ( rc )
> +    {
> +        PERROR("Failed to obtain %u policy", idx);
> +        rc = -1;
> +        goto out;
> +    }
> +
> +    rc = deserialize_policy(xch, policy, nr_leaves, leaves, nr_msrs, msrs);
> +    if ( rc )
> +        errno = -rc;

Perhaps also set rc to -1 here for consistency?

Jan

