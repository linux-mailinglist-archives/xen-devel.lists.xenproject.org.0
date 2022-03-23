Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9D4E571D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 18:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293979.499617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4P4-0002Se-1U; Wed, 23 Mar 2022 17:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293979.499617; Wed, 23 Mar 2022 17:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX4P3-0002QJ-Uh; Wed, 23 Mar 2022 17:04:09 +0000
Received: by outflank-mailman (input) for mailman id 293979;
 Wed, 23 Mar 2022 17:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6JCQ=UC=ziepe.ca=jgg@srs-se1.protection.inumbo.net>)
 id 1nX4P2-0002QD-9p
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 17:04:08 +0000
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [2607:f8b0:4864:20::835])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa1781d-aacb-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 18:04:07 +0100 (CET)
Received: by mail-qt1-x835.google.com with SMTP id b18so1677717qtk.13
 for <xen-devel@lists.xenproject.org>; Wed, 23 Mar 2022 10:04:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 e7-20020ac85987000000b002e1b7fa2201sm390829qte.56.2022.03.23.10.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:04:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1nX4Oy-004y0H-9Z; Wed, 23 Mar 2022 14:04:04 -0300
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
X-Inumbo-ID: 3fa1781d-aacb-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xnq4bRc3cz88ytLQgShmjJNQac+AYZh8iK8Px2OMFPU=;
        b=kNJF0xfmaBtRkYelsVEtH2PuynVN0qClkTty/AJqdCdvjWNfq2Xk2V4TNeY1tHRasf
         CTPK60t1bo6F9GX0IylFdyy0xJliGLDWAs7nUST7tNctmZzYcpVjzH/fak4ZXsxXO+S8
         5jeejGeZpe5zVlWxy0jTumjLbwoLSDWAS28Mb2tPR983RMexa9B8B94uGt5Se317TlzA
         fU3WtHm9SV29L423AHw8spl6E8QxF+tMOI9rNhgvsxAgFQqdYolSOo6RHmtyy7VdSVHq
         kc2rJfdw5nu5tN4AsX1zAwXNsLQb3MEqwVrJye4pnhAnMx4BfdV47f/DQXRcjpQRr47j
         0b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xnq4bRc3cz88ytLQgShmjJNQac+AYZh8iK8Px2OMFPU=;
        b=tl1YKjAr1X+26GvoAPU+SSQNBF5o7bBJjrSWFVtx7xoIscDbNaKhM53sYC6AP6PUzq
         zj3lwtlJcVbCzvVx7aARv6ejbvfFj9tbdzpziuEx+hCWjON36h768f458tmgEgEEKS8M
         HVil1VmAuJ7Oji7w4wy1GBi5lAbVywQ+Slqu96VW8A5fldUV3lrDsRDBSnVpW1slZcrd
         XK8tV7WPnt9WB62Xd7r0YeXw9DP+l1yFNz3VUC/EgmGz9SlFSdiZVGmzJtKcG9Y+HgoE
         X3KnJMstWe8E+MVx3v5B1y7j6bjLIlGhWB9HSuemJTH570Mpax1Azl/XB9FGcpK95jit
         z79A==
X-Gm-Message-State: AOAM530BZT0a0oaTLu/NN+ttacbhHv1JcX3WjvfiWPuaSbhspyYep3m4
	OF2OknTf3svx2JoqWw/7sNlrqw==
X-Google-Smtp-Source: ABdhPJyYEQE0CYp6+og8QZG/WuYeFw545rz58LgI1p5Yq3Rl0fLB9/5tGE3gp9FdXtFsBCDq8JuXBA==
X-Received: by 2002:a05:622a:28f:b0:2e1:cebc:8c44 with SMTP id z15-20020a05622a028f00b002e1cebc8c44mr679876qtw.648.1648055045822;
        Wed, 23 Mar 2022 10:04:05 -0700 (PDT)
Date: Wed, 23 Mar 2022 14:04:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@suse.com>
Cc: Juergen Gross <jgross@suse.com>, linux-mm@kvack.org,
	lkml <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jerome Glisse <jglisse@redhat.com>
Subject: Re: blocking vs. non-blocking mmu notifiers
Message-ID: <20220323170404.GK64706@ziepe.ca>
References: <8e8ec786-74db-157b-a290-b1537941e91d@suse.com>
 <YjrsOnxaPYc3rbdj@dhcp22.suse.cz>
 <20220323163146.GI64706@ziepe.ca>
 <YjtPpxlE/zWwnJ0W@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjtPpxlE/zWwnJ0W@dhcp22.suse.cz>

On Wed, Mar 23, 2022 at 05:49:43PM +0100, Michal Hocko wrote:
> > The bug here is that prior to commit a81461b0546c ("xen/gntdev: update
> > to new mmu_notifier semantic") wired the mn_invl_range_start() which
> > takes a mutex to invalidate_page, which is defined to run in an atomic
> > context.
> 
> Yeah, we have already identified that but quickly realized that the
> whole mmu notifier overhaul which this fix depends on would be no no for
> backporting to our older code base. So we are trying to find our way
> around that.

IMHO you don't need everything, just commit 369ea8242c0f ("mm/rmap:
update to new mmu_notifier semantic v2") which adds the missing
start/end outside the lock for the page callbacks.

Then you can take safely a8146 into gntdev.

Jason

