Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BEFB35661
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 10:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094050.1449392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoi1-0008AE-Ky; Tue, 26 Aug 2025 08:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094050.1449392; Tue, 26 Aug 2025 08:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqoi1-00088H-Hw; Tue, 26 Aug 2025 08:07:13 +0000
Received: by outflank-mailman (input) for mailman id 1094050;
 Tue, 26 Aug 2025 08:07:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqohz-00088B-VP
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 08:07:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a850a95d-8253-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 10:07:06 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61c3360bbaeso3590209a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 01:07:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c8f03ba0dsm1141769a12.37.2025.08.26.01.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 01:07:05 -0700 (PDT)
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
X-Inumbo-ID: a850a95d-8253-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756195626; x=1756800426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Dsge3N2ds9TjHCwT0kd5qwMLF0Hup7hBxmuNzHOM2U=;
        b=g9iNg+YSgNmQcAtjaDIBg3rfVRzzWxZOpJtSNbCosgffXbnOxdmdl3gGQxLeUJsS3A
         ahM4H6pZeqlL80hpevyvkgvGkxdHbtTMQa5zQqlia8sDBsWcjZY5W3FfygArFoAB5MRD
         Drd6l2rffeEHthGywKig7ZuQFJuaX6hOJcW9w1FLkr6BrSqra3LFfjgP/IDTP1HiFZZd
         mmZokmPsOutHYgLj6IPp3cym4bixo6RBpfsWJAZDWNAXv4MWBG/4xDj+NYBXS/pB5b+l
         xz2TCs1b0Cu7HODUcpRnSDB0v/OvWIDFcj1gkTM+RTF7p6NTmXTAChQ/FrG4U4vnjJvS
         gflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756195626; x=1756800426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Dsge3N2ds9TjHCwT0kd5qwMLF0Hup7hBxmuNzHOM2U=;
        b=wq4LI+nAIoFHPhGj8vK/iBhv/mmKiQgA7t2hd+ShixgWUmtSGFIhzTj1U1tFzdqON7
         S41dyVpRwhtWKUPJY0B/FpD7g9OmTYDOYg1pGFVq5SxHO7W19W/6vlwRvqFTSbkw98Pw
         vi3mP4ai86QSJQlb31Ihk1qKUc2CchrU3g5jMZcyEPW7N9Y7vBcv9t46CcZAuGUqfPZA
         A18Ztk+DHxCbkD3teljNdxV4pu+ziOc+ZpQH3KwI5pZKdwaLOv9lDAwvtOegS57jrPRJ
         mLqtkfSza1NgWAkSYmr7yKgdsWJNefLzYgaFvivR0gWqZjb+kRb7e0ArVY5RDCXFe3EY
         kmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUOPWF81EtZfa6MEZetg1/yQHRuz0RELKw3vBGDt31zR+ULyXFCts37O1sS3DG8+3/U6sAFnhdJPY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1Va9DnlI1vxeseTFGIHS1CVjXJk2pyixXXH/DZi0AQUzGr7b5
	FcdgDH0w2U2W7vyqja4hz6wkk+3xYwasu9NeNLMsZSZK/6W7ZODibMCGpXzlxp/Vqw==
X-Gm-Gg: ASbGncsj0EVYKZZLtIkofTzYumBVRlAQ2i98iZaf5scWV8hsWa6xYwn+p9gbsDIizF7
	xDe6oViDCto/fO0E4/LMKxmpLHynXITiDk9M4Dthhc8Zf+uFZ6cECJwL/Xo6uG0C4FSikJtdBgc
	wf3KzJwWloXCg30F73j3XsAgMjHx2pDZtMsEe0OqD1SOHQWiR7XPhpaBHJDNsrmZFa7I+MMDnEl
	VbTJg1D6/v99Ca+jYQYAuU5yJGuUcdqxbn2LthPhnl5nJI5nzRta6e35neYDl2g76Rp5fcknYqi
	6L/AYt4VT9Lwt5Ebm2xHjxHXFb23ROD0cJ1Rqglmx1gZuqL1YtcbjCy/yl524IFgoJHIIFB2tgm
	f6ajtuF7EsHs7o6RiB4ax+JSWLxcc99ZivEfsrQVLcTSCfUhKV4/T8RYufIJJGfpNh8dal30V7P
	UA0LmI1JA=
X-Google-Smtp-Source: AGHT+IHMxOPAXxxlta1KwBGmAglRO26Jo3mZX16mQwnZIpeiAJCI4Ws754gLZxr6SCrCvzVZaei41Q==
X-Received: by 2002:a05:6402:2791:b0:61c:5a8c:9a4e with SMTP id 4fb4d7f45d1cf-61c5a8ca251mr6056817a12.4.1756195626016;
        Tue, 26 Aug 2025 01:07:06 -0700 (PDT)
Message-ID: <0dfd8cc0-7c70-4ceb-9f48-f1bce16459aa@suse.com>
Date: Tue, 26 Aug 2025 10:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] xen/page_alloc: Add NUMA-node specific memory
 claims
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1755341947.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <cover.1755341947.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2025 13:19, Bernhard Kaindl wrote:
> Xen supports claiming an amount of memory ahead of allocating it to
> ensure that the memory for the domain is available for allocation.
> 
> On NUMA hosts, the same assurance is needed on a per-NUMA-node basis
> to ensure optimal placement of domain memory on the correct NUMA node:
> 
> Add per-NUMA-node claims and add a new Hypercall to claim memory for
> a domain using XEN_DOMCTL_claim_memory and xc_domain_claim_memory().
> 
> As we will implement multi-node claims as well, we updated the design
> to be flexible for multi-node claims, so that a 2nd series can build
> upon it without changing the hypercall API.
> 
> Bernhard Kaindl (6):
>   xen/page_alloc: Simplify domain_adjust_tot_pages for future changes
>   xen: New API to claim memory for a domain using XEN_DOMCTL_claim_memory
> 
> Alejandro Vallejo (1):
>   xen/page_alloc: Remove `claim` from domain_set_outstanding_pages()
> 
> Alejandro Vallejo and Bernhard Kaindl (5):
>   xen/page_alloc: Add static per-NUMA-node counts of free pages
>   xen: Add node argument to
>     domain_{adjust_tot_pages,set_outstanding_pages}()
>   xen/page_alloc.c: Create per-node outstanding claims
>   xen/page_alloc: Check per-node claims in alloc_heap_pages()
> 
>  tools/flask/policy/modules/dom0.te  |   1 +
>  tools/flask/policy/modules/xen.if   |   1 +
>  tools/include/xenctrl.h             |   4 +
>  tools/libs/ctrl/xc_domain.c         |  42 ++++++++
>  tools/ocaml/libs/xc/xenctrl.ml      |   9 ++
>  tools/ocaml/libs/xc/xenctrl.mli     |   9 ++
>  tools/ocaml/libs/xc/xenctrl_stubs.c |  21 ++++
>  xen/arch/x86/mm.c                   |   3 +-
>  xen/arch/x86/mm/mem_sharing.c       |   4 +-
>  xen/common/domain.c                 |  32 +++++-
>  xen/common/domctl.c                 |   8 ++
>  xen/common/grant_table.c            |   4 +-
>  xen/common/memory.c                 |   6 +-
>  xen/common/page_alloc.c             | 154 ++++++++++++++++++++++------
>  xen/include/public/domctl.h         |  17 +++
>  xen/include/xen/domain.h            |   2 +
>  xen/include/xen/mm.h                |   6 +-
>  xen/include/xen/sched.h             |   1 +
>  xen/xsm/flask/hooks.c               |   3 +
>  xen/xsm/flask/policy/access_vectors |   2 +
>  20 files changed, 285 insertions(+), 44 deletions(-)

Having looked at only patch 1 so far, it already becomes clear that revision
information is lacking here. This is more important than usual for this series
because (a) a patch with a pretty similar title as patch 1 here has was
submitted by (and meanwhile committed for) Alejandro and (b) you picked up
earlier work by him. In fact I first thought you lost his S-o-b on patch 1.
That would have been easily clarified by indicating in the patch that it is
new in v2.

Jan

