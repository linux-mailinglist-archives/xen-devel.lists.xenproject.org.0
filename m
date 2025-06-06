Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5BACFEAC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008237.1387482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSxp-0003jh-8p; Fri, 06 Jun 2025 09:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008237.1387482; Fri, 06 Jun 2025 09:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSxp-0003i1-6I; Fri, 06 Jun 2025 09:02:13 +0000
Received: by outflank-mailman (input) for mailman id 1008237;
 Fri, 06 Jun 2025 09:02:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNSxn-0003hr-49
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:02:11 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed5338f2-42b4-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 11:02:09 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-450cf0025c0so12438035e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:02:09 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451f8fb57b1sm26298255e9.1.2025.06.06.02.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:02:08 -0700 (PDT)
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
X-Inumbo-ID: ed5338f2-42b4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749200529; x=1749805329; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1fq8LjeXC0AbfZfiFKAbz1qtQjwey0NB6K9CmJxqWU=;
        b=o13mpexGzmu5kk3zrhwU9jE0nvElXGQsrZaBBl8zBKj9Vcn3bgb9cxkjYbFgaXbIio
         lkONwQyL4Z/468zFr0CyFvMRrA0uHCGotupGj5BkMRD7HXcBBtXixtJ8vfOzsFCvx8ae
         tLzcWDOskGDqXh7U23rBwWGeOQ0uYRox2PUrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200529; x=1749805329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1fq8LjeXC0AbfZfiFKAbz1qtQjwey0NB6K9CmJxqWU=;
        b=XEk0kplEfHRlJgRveDuXUbzZdXwGhoOh8ymqeI1g+e1aKHtJiqJCm9COuho36GsUqA
         Qag43MRYwk1nyqCjnBvBg7GXtt4v+tiHdDmzYQxwWGCXCvLJInQOjGqW/Z1ciOmwTPfo
         W7P5V0HdnAqd61NZjuMrYiwFbFUeYpU5HleENhYE/3GW7n4WFZGS5du3xOFYD17LCM5X
         ylhGSgleQm4L8g1TNfGm+miLsw7uL6JlRr6fxeo0NoWlCA5LoXiN5KyLii37mfFzBxrK
         1B24/ENRhaBsMYnKUpgtLftP2hPHPU+q3eyNGTbqdl4at3kksndopPhBYtf037Fi5W00
         xf/w==
X-Gm-Message-State: AOJu0Yx6ZRV5Un+OorlV7suc7mAGEoBxWurSvGLwbg5WOmW30nYj+80f
	SDCfXQjqYs5HAugnq7/EVBMjT3oVCBiBCbddIru8CN050IDnyMepARVIJZuN9DJlTY0=
X-Gm-Gg: ASbGncvaZwuwtujgbXxBu67Nz1u5tgYpCIp/MUsQdLW2Qti2eZ/yyYyKS6sgY1ZBdu4
	9q1XS8gFB7kAJAltSEVXtLBjouzvvRxNlfZHhG9vi9yArAX0RGZxIIlxszRuhmiUXwkENXeuRGS
	OaivvNIRhgT58khi1csXKB3VcR16zPK1sH/Xlbi1gZGBAUXH5A9zylT2YavRZTThVfjMoL7XEHR
	dVScDlnLVypq4BifiHqdUHeFWMgMRpwBDBGSPHuSwUC8CVlfYA2AbbWOZ9pb7B8hJbbDPVwTDuh
	avvuM9qor1lVsAEElA/Ajl0h24tSSZ1GouoLk3xpFGVxKuJplx9SCzrpJF9fhdAhihqBiLsIcmf
	kYvUsRQ4jiXTq1jrTI/XHV0y7
X-Google-Smtp-Source: AGHT+IEr0hSgJEC5/sNM6RD1PQ8oDaQhE8v9Eg60kOE0aLNHqVNuD7eTGb0tn+QQD86YQgVfsi/oaw==
X-Received: by 2002:a05:600c:1da8:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-452fcaf0aa4mr2264275e9.26.1749200528668;
        Fri, 06 Jun 2025 02:02:08 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:02:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 09/11] tools/xc: Add `node` argument to
 xc_domain_claim_pages()
Message-ID: <aEKuj_e8W_fcNW_9@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-10-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-10-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:25:00PM +0000, Alejandro Vallejo wrote:
> Add a node argument to make an exact-node claim. NUMA_NO_NODE means to
> make a regular any-node claim.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  tools/include/xenctrl.h       |  1 +
>  tools/libs/ctrl/xc_domain.c   | 13 ++++++++++++-
>  tools/libs/guest/xg_dom_x86.c |  8 +++++---
>  3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 495598123133..2b63992e1246 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1322,6 +1322,7 @@ int xc_domain_populate_physmap_exact(xc_interface *xch,
>  
>  int xc_domain_claim_pages(xc_interface *xch,
>                                 uint32_t domid,
> +                               unsigned int node,
>                                 unsigned long nr_pages);
>  
>  int xc_domain_memory_exchange_pages(xc_interface *xch,
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 2ddc3f4f426d..f2c6eda875dc 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -20,6 +20,7 @@
>   */
>  
>  #include "xc_private.h"
> +#include "xenguest.h"
>  #include <xen/memory.h>
>  #include <xen/hvm/hvm_op.h>
>  
> @@ -1072,13 +1073,23 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
>  
>  int xc_domain_claim_pages(xc_interface *xch,
>                                 uint32_t domid,
> +                               unsigned int node,
>                                 unsigned long nr_pages)
>  {
>      int err;
> +    unsigned int mem_flags = 0;
> +
> +    if ( node != XC_NUMA_NO_NODE )
> +    {
> +        if ( node >= 0xFF )

You should have XENMEMF_node_mask available here which is better than
open-coding 0xff.

Thanks, Roger.

