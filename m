Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2BDB96C29
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 18:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128560.1468886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15aH-00042o-8q; Tue, 23 Sep 2025 16:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128560.1468886; Tue, 23 Sep 2025 16:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v15aH-000413-4H; Tue, 23 Sep 2025 16:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1128560;
 Tue, 23 Sep 2025 16:09:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v15aG-0003gK-Hp
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 16:09:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1098616-9897-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 18:09:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso29417775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 09:09:32 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-42585a701eesm6905255ab.7.2025.09.23.09.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 09:09:31 -0700 (PDT)
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
X-Inumbo-ID: b1098616-9897-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758643772; x=1759248572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=md3OcWKWFoeMzSQmVx17gVX0YatX4wCX8y/G7Y7g2f4=;
        b=VnXAhRGRYJtQyGiZ+CsZXPPNndmsFhLI5gAJjgGfFA0ppqTlimmlP/z2LjRroXJ+SG
         b+qa7sklHT2jzIGHkJwWdJ71348O1gZvr+8cVuiJ3BqNWksRiA/BlAxxHvq8zXQjk6HG
         nvjSHzNVIoA/k87c4z9Df3kK1iTM/0uSlSgpSg0NJRmtPm4XaaknsK/mjJ7RCTjXT85V
         xqlFvwcgeIrLumKeA/tR8BWE4lPqAlAH6OQb7krC0zcQ1ZsDovgwwnx36TjLBU9aLI4A
         BAuR6DMU6TTj+sFd8XgkvW1agJKBWf6pF74q0egaO0v/VxRB4HAJiUYgQ1GsiWaxM075
         IfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643772; x=1759248572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md3OcWKWFoeMzSQmVx17gVX0YatX4wCX8y/G7Y7g2f4=;
        b=H2Dpla3Jl14DmR6myJmQlDgQaHSBkWhoo4eFiZnk6aYm67QdEwuaWfMmKl/oa1jNha
         +KVoY1Fqx+0jNCHdLSIBLPUq2neZIM3ZmS4Y4WkRq/L67e1K4uwDixnD6CawkHqnCP0A
         i0RG2/DsFxFT+NImqnJ15L0RqdbOSgHortMjjnjrZ7kRmSCfUqMwiXgag4eHv4diQH+S
         6hNgSnhnOoRP4lq6reu641otA7CkCM1sjKE4V68OccmO0DPwAcnetoyxyjd1EcjDogZa
         x3/a5m0Mrm6GUE100irnN3upJeShxKPxcyjuLZnZ4xeV4mRGSry8bv7aTanQnKo1kiah
         crtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6NnZIDrkmo22K5DONPaw+vaExE0W9iwD9QDUsOdfpx29j0frXneB6bqcxrp8F15LYnSBDSGQlRPs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweelVQHeVwUx7qmnmMR0QXXh5W+SdBH3GWlEKIRUUEF6ctogyP
	wfdMkgalSMWa9BUTCV2piDGViJH4Xjv+0dRMuJ0gGZ2lngIU/PvmfHZzto/YpwOHEQ==
X-Gm-Gg: ASbGncsQgAjHVnoXKWCQ3b8UPdos1EtHN8Hjh1cXoh8t46vtHg7d9wBxn6jxuuneKgD
	S/j3X+M0nip5ANE2CNbQs38WBI+RMn17cjOmx+QCbQk0m9qyeLpMu1TJ3+3zRPW1adRg8cLTVYU
	6LcwbewDwTd6fuh0Arn/f/GUWsx2Qs+5g8i4F/o+PeQ33Dcr0yX1cjiSIq4LFhI85RJdarCploC
	f2uRTHVqNm3cbsBkDj6/jVW7Ac58g7wcJKhslU9nsy00JnxUlsdVvIEezPk9+WKwhBOmUv0FF9U
	M3F5K9HLz/HGpGuS8JbBYerB/yOlkTpfGChkKNm3cKuahVloMAnUjlyLkSzHU7VxNMCrpBxQsa3
	WNHxGP+wgbhKL9dW2DhdsmYzWVaCIRLuY
X-Google-Smtp-Source: AGHT+IEf9YumDmq+JfMP17oEAdNSk7b2T8g3BXcZjNkiik0z2n0utEBoRZoFQ4x84AdWKaSiFXkaJQ==
X-Received: by 2002:a5d:5703:0:b0:3ed:e1d8:bd73 with SMTP id ffacd0b85a97d-405ccbd7134mr2141266f8f.57.1758643772085;
        Tue, 23 Sep 2025 09:09:32 -0700 (PDT)
Message-ID: <d3dedc8f-48d7-4ccb-b62c-50378687da8d@suse.com>
Date: Tue, 23 Sep 2025 18:09:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen/page_alloc: Add staking a NUMA node claim for
 a domain
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1757261045.git.bernhard.kaindl@cloud.com>
 <a16fa2042c30183fc9a16bcaf400021661ae5b0b.1757261045.git.bernhard.kaindl@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a16fa2042c30183fc9a16bcaf400021661ae5b0b.1757261045.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.09.2025 18:15, Bernhard Kaindl wrote:
> Update domain_set_outstanding_pages() to domain_claim_pages() for
> staking claims for domains on NUMA nodes:
> 
> domain_claim_pages() is a handler for claiming pages, where its former
> name suggested that it just sets the domain's outstanding claims.
> 
> Actually, three different code locations do perform just this task:
> 
> Fix this using a helper to avoid repeating yourself (an anti-pattern)
> for just only updating the domain's outstanding pages is added as well:
> 
> It removes the need to repeat the same sequence of operations at three
> diffent places and helps to have a single location for adding multi-node
> claims. It also makes the code much shorter and easier to follow.
> 
> Fix the meaning of the claims argument of domain_claim_pages()
> for NUMA-node claims:
> 
> - For NUMA-node claims, we need to claim defined amounts of memory
>   on different NUMA nodes. Previously, the argument was a "reservation"
>   and the claim was made on the difference between d->tot_pages and
>   the reservations. Of course, the argument needed to be > d->tot_pages.
> 
>   This interacs badly with NUMA claims:
>   NUMA node claims are not related to potentially already allocated
>   memory and reducing the claim by already allocated memory would
>   not work in case d->tot_pages already has some amount of pages.
> 
> - Fix this by simply claiming the given amount of pages.
> 
> - Update the legacy caller of domain_claim_pages() accordingly by
>   moving the reduction of the claim by d->tot_pages to it:
> 
>   No change for the users of the legacy hypercall, and a usable
>   interface for staking NUMA claims.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

This looks the wrong way round, and then I expect a From: is also missing.

> ---
> Changes in v3:
> 
> - Renamed domain_set_outstanding_pages() and add check from review.
> - Reorganized v3, v4 and v5 as per review to avoid non-functional
>   changes:

What's v3, v4, and v5 here (when we're only at v3)?

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1682,7 +1682,20 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = xsm_claim_pages(XSM_PRIV, d);
>  
>          if ( !rc )
> -            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
> +        {
> +            unsigned long new_claim = reservation.nr_extents;
> +
> +            /*
> +             * For backwards compatibility, keep the meaning of nr_extents:
> +             * it is the target number of pages for the domain.
> +             * In case memory for the domain was allocated before, we must
> +             * substract the already allocated pages from the reservation.
> +             */
> +            if ( new_claim )
> +                new_claim -= domain_tot_pages(d);

This is now racy (and hence a functional change): Without holding the heap
lock, a domain's total pages can change behind you back.

> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -492,6 +492,30 @@ DEFINE_PER_NODE(unsigned long, avail_pages);
>  
>  static DEFINE_SPINLOCK(heap_lock);
>  static long outstanding_claims; /* total outstanding claims by all domains */
> +DECLARE_PER_NODE(long, outstanding_claims);
> +DEFINE_PER_NODE(long, outstanding_claims);

See comment on the earlier patch.

> +#define domain_has_node_claim(d) (d->claim_node != NUMA_NO_NODE)
> +
> +static inline bool insufficient_memory(unsigned long request, nodeid_t node)

Except in special cases, no inline please for static functions in .c files.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -405,6 +405,7 @@ struct domain
>      unsigned int     outstanding_pages; /* pages claimed but not possessed */
>      unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
>      unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
> +    nodeid_t         claim_node;        /* NUMA_NO_NODE for host-wide claims */

I don't quite understand the purpose of this field: It looks to be a
hidden parameter to domain_adjust_outstanding_claim(), yet then why isn't
is a real one?

As I'm also having a hard time following the description, I fear I have to
stay away from making further comments (on the main part of the code
changes), until I understand better what's (intended to be) going on here.

Jan

