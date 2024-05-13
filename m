Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09028C446F
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 17:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721036.1124164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Xms-0001pR-8z; Mon, 13 May 2024 15:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721036.1124164; Mon, 13 May 2024 15:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Xms-0001n8-6Q; Mon, 13 May 2024 15:40:26 +0000
Received: by outflank-mailman (input) for mailman id 721036;
 Mon, 13 May 2024 15:40:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6Xmq-0001n2-Or
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 15:40:24 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c2ebad9-113f-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 17:40:22 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e4b90b03a9so50924221fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 08:40:22 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc83sm11388594f8f.16.2024.05.13.08.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 08:40:21 -0700 (PDT)
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
X-Inumbo-ID: 1c2ebad9-113f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715614822; x=1716219622; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8xZGMjf01HbyNWji+ISVHSj5gl4UxwZFFpPnC9HGAc=;
        b=MQ3bRmZ7FMm6oEOLBQS7TmOWT4VnPa2ECcYTU/79oscvCsz+A+jh953KdQj/L+GCtK
         nJQz0K/we5W5rVZrSu+vWUA7oDQfwWDc1ERGid335sCX52256JXnIdTenjMhpXgNmvCI
         JKF/MRm+xkGPO0M9/p554LXRYXlcEyGj9diDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715614822; x=1716219622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8xZGMjf01HbyNWji+ISVHSj5gl4UxwZFFpPnC9HGAc=;
        b=ZtOyIE9NsYRLJxB/+VvNHryR79dDPRdpoVRPurp6JuAfAwniSvuMMkAwovlBXLER06
         Vh6bOESWRfn/P3vtFnRu3930X1Nf/xL+kyylhiD3tYtezSk7ypuW9ugH+k3vvrvojEcc
         wCJgD4g4Jb/ikN6dGIe3BTGVlMn/8iL7AmtMmcruCbHd9AuuKUComIFEzFFdfEFcNhAS
         /X5d91IxK0CqvBeqv/o8UDMgNm/+iC2rYYqxDYKgaZBBy9Hh89KFNOyfesEtHw+HY2m1
         3jd4DTzHxrP/hh0CiWgUjs9e5sKV8ZzMcPtj4CEz+YOrGh0bsQ5m0doUkZpzxGMFNJKn
         lMkg==
X-Gm-Message-State: AOJu0YweDdVBCiBuWK+m4fDXdMAh/UFkHk8148G+MW79rLbgnePUEo80
	iFgcmoR3eiJCYHED99xTbtRAYU9gEDE+Z6Sw3H7B2ePlnk60df0hsNrWI51my3g=
X-Google-Smtp-Source: AGHT+IGaIxURuvDuIXdP/6zCWBbxx91s/O3PlQJB2bvNkLYtXxQPBFYrlggYrnusZ74cC3yKrdQptQ==
X-Received: by 2002:a2e:9b8b:0:b0:2e5:59a:591d with SMTP id 38308e7fff4ca-2e51fd3fe2emr71209121fa.4.1715614821996;
        Mon, 13 May 2024 08:40:21 -0700 (PDT)
Date: Mon, 13 May 2024 17:40:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Wang <wawei@amazon.de>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 02/19] x86/pv: Domheap pages should be mapped
 while relocating initrd
Message-ID: <ZkI0ZJKq9HT465VC@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-3-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-3-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:29PM +0000, Elias El Yandouzi wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Xen shouldn't use domheap page as if they were xenheap pages. Map and
> unmap pages accordingly.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
>     Changes in V3:
>         * Rename commit title
>         * Rework the for loop copying the pages
> 
>     Changes in V2:
>         * Get rid of mfn_to_virt
>         * Don't open code copy_domain_page()
> 
>     Changes since Hongyan's version:
>         * Add missing newline after the variable declaration
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index d8043fa58a..807296c280 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -618,18 +618,24 @@ int __init dom0_construct_pv(struct domain *d,
>          if ( d->arch.physaddr_bitsize &&
>               ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
>          {
> +            unsigned int nr_pages = 1UL << order;

Shouldn't you better initialize nr_pages to 'count' instead of 'order'
here?

Also note how 'order' at this point is not yet initialized to the
'count' based value, so I'm not sure from where that 'order' is coming
from.

In v2 you had:

+            unsigned long nr_pages;
+
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
             if ( !page )
                 panic("Not enough RAM for domain 0 initrd\n");
+
+            nr_pages = 1UL << order;

nr_pages was derived from the 'order' value based on 'count'.  As said
above, I think you want to use just 'count' here, which is the rounded
up value of pages needed by initrd_len.

Thanks, Roger.

