Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498EA252472
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 01:50:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAigP-0003ih-4j; Tue, 25 Aug 2020 23:48:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kAigN-0003ic-3k
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 23:48:51 +0000
X-Inumbo-ID: 48707881-ef3d-455b-bd54-d1cb87277559
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48707881-ef3d-455b-bd54-d1cb87277559;
 Tue, 25 Aug 2020 23:48:50 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 384FD20706;
 Tue, 25 Aug 2020 23:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598399329;
 bh=F4GmSFhPKAOygHSEgZGaanhII/ZD98v4kYsWG2SCLDQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=cGEo9octLS2pHB/SR2fjOIM/mYY1+TB1kolaIv5Uu9+9e/1F2u2FjZwRV5o99liS6
 ZMYiZpfgbXel3Vj0yel0rY/ubBOmkszBXHXzjPgyv9PkdazmhHoodU6Gw5/pmQfxRc
 weldZ5UbcLcLiAUxVVXP8fBM6yIrLWg3JcJ9Bg/o=
Date: Tue, 25 Aug 2020 16:48:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Simon Leiner <simon@leiner.me>, xen-devel@lists.xenproject.org, 
 sstabellini@kernel.org, jgross@suse.com, julien@xen.org
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
In-Reply-To: <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
Message-ID: <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 25 Aug 2020, Jan Beulich wrote:
> On 25.08.2020 11:31, Simon Leiner wrote:
> > --- a/include/xen/arm/page.h
> > +++ b/include/xen/arm/page.h
> > @@ -76,7 +76,11 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
> >  #define bfn_to_local_pfn(bfn)	bfn_to_pfn(bfn)
> >  
> >  /* VIRT <-> GUEST conversion */
> > -#define virt_to_gfn(v)		(pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT))
> > +#define virt_to_gfn(v)                                                         \
> > +	({                                                                     \
> > +		WARN_ON_ONCE(is_vmalloc_addr(v));                              \
> > +		pfn_to_gfn(virt_to_phys(v) >> XEN_PAGE_SHIFT);                 \
> > +	})
> 
> Shouldn't such a check cover more than just the vmalloc range,
> i.e. everything outside of what __va() can validly return?

Keep in mind that this patch is meant as sister patch to
https://marc.info/?l=xen-devel&m=159834800203817
so it makes sense to check for vmalloc addresses specifically.

That said, I am not aware of a good way to implement the __va test you
are suggesting.

