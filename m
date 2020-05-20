Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83FA1DC1BB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 00:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbWlw-0007qr-1V; Wed, 20 May 2020 22:01:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbWlu-0007qm-Kn
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 22:01:06 +0000
X-Inumbo-ID: 671bfd04-9ae5-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 671bfd04-9ae5-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 22:01:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4E1B2084C;
 Wed, 20 May 2020 22:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590012065;
 bh=fHxDw7+31cIHIoMoLe56plFoMHEmT+hzv9jPnj7sg34=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1D8ds4X1XZguhQAlA0bQy6ElmSDOZqmeaDfhuy8WcHRm8MDzkNP7qo4JLj4n9wIa8
 r2y0HbAXtE2mwwUmLn0GqrVScm6XzeITWWZtbJAGwR9uBeo2Rsj4zAkypOOZMypdld
 +bvkJJD2JiwBacp8dqSEEwZge0g8UzWYHenqCkdw=
Date: Wed, 20 May 2020 15:01:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.14 1/3] xen/arm: Allow a platform to override the
 DMA width
In-Reply-To: <8e8afff48273589fd06192203c0452fb1e69cd1f.camel@epam.com>
Message-ID: <alpine.DEB.2.21.2005201500560.27502@sstabellini-ThinkPad-T480s>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-2-julien@xen.org>
 <8e8afff48273589fd06192203c0452fb1e69cd1f.camel@epam.com>
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "minyard@acm.org" <minyard@acm.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jgrall@amazon.com" <jgrall@amazon.com>, "roman@zededa.com" <roman@zededa.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 18 May 2020, Volodymyr Babchuk wrote:
> Hi Julien,
> 
> On Mon, 2020-05-18 at 12:30 +0100, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > At the moment, Xen is assuming that all the devices are at least 32-bit
> > DMA capable. However, some SoC have devices that may be able to access
> > a much restricted range. For instance, the RPI has devices that can
> > only access the first 1GB of RAM.
> > 
> > The structure platform_desc is now extended to allow a platform to
> > override the DMA width. The new is used to implement
> > arch_get_dma_bit_size().
> > 
> > The prototype is now moved in asm-arm/mm.h as the function is not NUMA
> > specific. The implementation is done in platform.c so we don't have to
> > include platform.h everywhere. This should be fine as the function is
> > not expected to be called in hotpath.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > 
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > 
> > I noticed that arch_get_dma_bit_size() is only called when there is more
> > than one NUMA node. I am a bit unsure what is the reason behind it.
> > 
> > The goal for Arm is to use arch_get_dma_bit_size() when deciding how low
> > the first Dom0 bank should be allocated.
> > ---
> >  xen/arch/arm/platform.c        | 5 +++++
> >  xen/include/asm-arm/mm.h       | 2 ++
> >  xen/include/asm-arm/numa.h     | 5 -----
> >  xen/include/asm-arm/platform.h | 2 ++
> >  4 files changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/xen/arch/arm/platform.c b/xen/arch/arm/platform.c
> > index 8eb0b6e57a5a..4db5bbb4c51d 100644
> > --- a/xen/arch/arm/platform.c
> > +++ b/xen/arch/arm/platform.c
> > @@ -155,6 +155,11 @@ bool platform_device_is_blacklisted(const struct dt_device_node *node)
> >      return (dt_match_node(blacklist, node) != NULL);
> >  }
> >  
> > +unsigned int arch_get_dma_bitsize(void)
> > +{
> > +    return ( platform && platform->dma_bitsize ) ? platform->dma_bitsize : 32;
> > +}
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> > index 7df91280bc77..f8ba49b1188f 100644
> > --- a/xen/include/asm-arm/mm.h
> > +++ b/xen/include/asm-arm/mm.h
> > @@ -366,6 +366,8 @@ int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
> >      return -EOPNOTSUPP;
> >  }
> >  
> > +unsigned int arch_get_dma_bitsize(void);
> > +
> >  #endif /*  __ARCH_ARM_MM__ */
> >  /*
> >   * Local variables:
> > diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> > index 490d1f31aa14..31a6de4e2346 100644
> > --- a/xen/include/asm-arm/numa.h
> > +++ b/xen/include/asm-arm/numa.h
> > @@ -25,11 +25,6 @@ extern mfn_t first_valid_mfn;
> >  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> >  #define __node_distance(a, b) (20)
> >  
> > -static inline unsigned int arch_get_dma_bitsize(void)
> > -{
> > -    return 32;
> > -}
> > -
> >  #endif /* __ARCH_ARM_NUMA_H */
> >  /*
> >   * Local variables:
> > diff --git a/xen/include/asm-arm/platform.h b/xen/include/asm-arm/platform.h
> > index ed4d30a1be7c..997eb2521631 100644
> > --- a/xen/include/asm-arm/platform.h
> > +++ b/xen/include/asm-arm/platform.h
> > @@ -38,6 +38,8 @@ struct platform_desc {
> >       * List of devices which must not pass-through to a guest
> >       */
> >      const struct dt_device_match *blacklist_dev;
> > +    /* Override the DMA width (32-bit by default). */
> > +    unsigned int dma_bitsize;
> >  };
> >  
> >  /*
> 

