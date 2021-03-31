Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15901350370
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 17:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104001.198437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcml-00084C-Ie; Wed, 31 Mar 2021 15:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104001.198437; Wed, 31 Mar 2021 15:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRcml-00083n-F3; Wed, 31 Mar 2021 15:29:35 +0000
Received: by outflank-mailman (input) for mailman id 104001;
 Wed, 31 Mar 2021 15:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPDw=I5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRcmk-00083i-CS
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 15:29:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dca5936-7bc4-4637-aaa3-2b7513699c98;
 Wed, 31 Mar 2021 15:29:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 755C8B166;
 Wed, 31 Mar 2021 15:29:32 +0000 (UTC)
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
X-Inumbo-ID: 4dca5936-7bc4-4637-aaa3-2b7513699c98
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617204572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJRnYcg6ZxrYQzynrDzzuX5L0oOhuYbbyxEpDSCgNf8=;
	b=CSj7Pwp4BfMEgba/kbDTrAjqH2jem7+YClxgd8uVq9wdQg5s1UPrGaZL3qbQj29/DXthwm
	TQrQQNgcW/+96E0f8U5kAqAO+kzJlfNoJmYPstwycdfuQa63AYgeqFVrCN9IWUc4AG6QVg
	s6XL57tPd5RWqYnlz8XmS44JctE1Ivk=
Subject: Re: [PATCH 16/21] libs/guest: make a cpu policy compatible with older
 Xen versions
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-17-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aecfa95f-f21a-22e2-6ae1-3cdfff973d03@suse.com>
Date: Wed, 31 Mar 2021 17:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210323095849.37858-17-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 10:58, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -436,6 +436,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>      unsigned int i, nr_leaves, nr_msrs;
>      xen_cpuid_leaf_t *leaves = NULL;
>      struct cpuid_policy *p = NULL;
> +    struct cpu_policy policy = { };
>      uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
>      uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
>      uint32_t len = ARRAY_SIZE(host_featureset);
> @@ -504,12 +505,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>       */
>      if ( restore )
>      {
> -        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
> -
> -        if ( di.hvm )
> -        {
> -            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
> -        }
> +        policy.cpuid = p;
> +        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
>      }

The comment ahead of this if() wants moving to ...

> @@ -1230,3 +1227,33 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
>  
>      return rc;
>  }
> +
> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
> +                                  bool hvm)
> +{
> +    xc_cpu_policy_t host;
> +    int rc;
> +
> +    host = xc_cpu_policy_init();
> +    if ( !host )
> +    {
> +        errno = ENOMEM;
> +        return -1;
> +    }
> +
> +    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
> +    if ( rc )
> +    {
> +        ERROR("Failed to get host policy");
> +        goto out;
> +    }
> +
> +    policy->cpuid->basic.rdrand = host->cpuid->basic.rdrand;
> +
> +    if ( hvm )
> +        policy->cpuid->feat.mpx = host->cpuid->feat.mpx;

... or cloning ahead of these two.

Jan

