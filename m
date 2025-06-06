Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3DACFE8E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:51:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008205.1387442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSnZ-0008OZ-Hh; Fri, 06 Jun 2025 08:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008205.1387442; Fri, 06 Jun 2025 08:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSnZ-0008Mz-EH; Fri, 06 Jun 2025 08:51:37 +0000
Received: by outflank-mailman (input) for mailman id 1008205;
 Fri, 06 Jun 2025 08:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSnX-0008La-K5
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:51:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7277c777-42b3-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:51:33 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-452f9735424so871005e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:51:33 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4521370961csm16644095e9.22.2025.06.06.01.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:51:32 -0700 (PDT)
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
X-Inumbo-ID: 7277c777-42b3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749199893; x=1749804693; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPZ6NqnXL6q+xDv3eAG4B/cDE9WJLsYSFLo93I5zeHQ=;
        b=FZqJg2TDzRznNbnuCdXJU+qo7wuGsr9NuRugerwbuF6pc5ZqGUZOEyP3HqU/4WIvjJ
         5oXxoriMPhgaGUrenQrF8fZnqd2jZwp4wZ2By24oU90bOvSaSx7GLHUcyVfwEI0QYKKa
         ve5uUJ3CpjdQNISClZBuLCpKeecPaviUOe8Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199893; x=1749804693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPZ6NqnXL6q+xDv3eAG4B/cDE9WJLsYSFLo93I5zeHQ=;
        b=ePhVCopfvuQPPEPy7NQukLJhh8BDTBMmXMEyV0IyHmxfAZvNuREyHMWgMuGBo0FUkr
         ppi0NJdS89wswOsQQ3Ac0kKcDcpWcohlE26LX9/hGuZ1p+Ycqzs7SUhob0vRWaJQKyXt
         C+2xNaWH0Neia39WU2LxQb/B6xwaH31TnyFxbAbSLPM/GlrsplMFLKVvkWrd8GeJ6gSs
         ipWTrsZV43RXErHJyl7WiWiq7z9ekjC3QeFES5D5gGy3c8ntY+1cgyd6YJBevJSiofNZ
         z5+JZPmBtUk1QDnJnDcB4hli4o8nitL4BpgoD12Y7j4P6zKdUrS9axt97i5KwLv8BMwP
         daFw==
X-Gm-Message-State: AOJu0YzOZaT6LqNXPbuoT372TQMRi28IffA0ouZfZd9zIWk6tTrwwrX9
	k2EUMFE7zmsr86X2xGhKvjgCeuMv3uSIUfnEzb6VJIfH5O65FR2w0p0Mk+ifXk7MWJU=
X-Gm-Gg: ASbGnctdkte5Wttcq89gapM/OoJmqKsbfl4uZK4A2VaihloRoiG+E9hs8Hi1Tr/RzM6
	AWqcKSo6NsMlitsdgCPYCC7nGOuqVYRb1AQBNmx5rZAleT3eecdcrNHtbpibOtu+qvj5vYYb+o5
	whPFxhn0SEaHET7blCWltxp9XeC1ly3ubBNVpyAM0qTF9R8fKz/lxL1uHlPLeV3G3uqGbiCmbSI
	S6z8lBJ2iGn3mBCZpWPSSB/esZUwGMC3Fu6Xgd74+XESevAFQB2VWEY1KouwJR7M7FBjhzS+uEO
	FvuWb5i118zptro7ufaK8dPNBDResl9tPGmuSICHLSlxMuR8t2KjfmS03vBdU9BOWJXMB++kAoN
	FoEOUJIn62Lfp6XIsadl7/v6imUucdr6zJGg=
X-Google-Smtp-Source: AGHT+IErWMbsB0wY3O+wdtNi2PpUslq4ockNbaK6je8AWwJc2Xf0c1Ec3+JGjy1W3I0xHZhwxbPwbw==
X-Received: by 2002:a05:600c:83cf:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45201417666mr27578295e9.5.1749199893054;
        Fri, 06 Jun 2025 01:51:33 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:51:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 08/11] xen/memory: Enable parsing NUMA node argument in
 XENMEM_claim_pages
Message-ID: <aEKsFEtj4ma172Sb@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-9-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-9-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:59PM +0000, Alejandro Vallejo wrote:
> Extract a NUMA node from mem_flags. This _must_ be an exact node, and
> has the semantics of making a claim on a specific node.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/common/memory.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 1ab0bac4e7da..28f9db89ba62 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1659,6 +1659,9 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>  
>      case XENMEM_claim_pages:
> +    {
> +        nodeid_t node;
> +
>          if ( unlikely(start_extent) )
>              return -EINVAL;
>  
> @@ -1671,9 +1674,23 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( reservation.extent_order != 0 )
>              return -EINVAL;
>  
> -        if ( reservation.mem_flags != 0 )
> +        /* Only allow NUMA-related memory flags to claim on exact nodes */
> +        if ( (reservation.mem_flags &
> +              !XENMEMF_exact_node(XENMEMF_node_mask - 1)) != 0 )

Are you sure the above is correct?

!XENMEMF_exact_node(XENMEMF_node_mask - 1) resolves unconditionally to
false, and hence you are doing:

(reservation.mem_flags & 0) != 0

Which can never be true?

I think you want ~ instead of !.

>              return -EINVAL;
>  
> +        node = XENMEMF_get_node(reservation.mem_flags);
> +        if ( node != NUMA_NO_NODE )
> +        {
> +            /* Disallow advisory nodes. If present, must be exact */
> +            if ( !(reservation.mem_flags & XENMEMF_exact_node_request) )
> +                return -EINVAL;
> +
> +            /* Disallow nodes that would overflow the in-hypervisor arrays */
> +            if ( node >= MAX_NUMNODES )
> +                return -EINVAL;

You can likely join all checks in a single condition.

Thanks, Roger.

