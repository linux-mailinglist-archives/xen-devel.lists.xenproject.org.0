Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B445BA77193
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933254.1335250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOzY-0002kS-JO; Mon, 31 Mar 2025 23:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933254.1335250; Mon, 31 Mar 2025 23:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOzY-0002hm-Fs; Mon, 31 Mar 2025 23:56:32 +0000
Received: by outflank-mailman (input) for mailman id 933254;
 Mon, 31 Mar 2025 23:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzOzW-0002he-VE
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:56:30 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3036042-0e8b-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:56:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43A8561161;
 Mon, 31 Mar 2025 23:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C171C4CEE3;
 Mon, 31 Mar 2025 23:56:26 +0000 (UTC)
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
X-Inumbo-ID: c3036042-0e8b-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743465387;
	bh=/PT4CScjMTzjF20rM8VreHABVZnX/Sw61nigYjSrUcI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nm5EnslJ1FdxlVNbndIPW673O8vgLZmyH+JSbBRLJO9OB97G5CTnLcvsxOZMVoXTL
	 dHtomgNqx82jP90qXrT32gF9cCdZCLqTHXXpXQIMNjrZ8pH00BbktOKwtmAlPBhBMP
	 809Yo3c7NuB8N91kJah34LulTiVG9DXVzfZTNTpGQSNatfHbe0UE9mM4UBYa0kqXfK
	 oJBGDVX2UkASBspVG1cQE1xLcA3Dr7qUPStPl+8CwkdIlB//+9wGI6xT8NidbWk2kH
	 M1ODOGJebouW9/gQSpmplvZjn4e/pqCMybXa5KPBsjIHdrb9wpeMvNi9XYWC76ygPe
	 y1epQGgIwMspg==
Date: Mon, 31 Mar 2025 16:56:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, bertrand.marquis@arm.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <217ed304-ca5d-4422-a187-da5493cecb5e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503311656190.563920@ubuntu-linux-20-04-desktop>
References: <20250327233419.1119763-1-stefano.stabellini@amd.com> <217ed304-ca5d-4422-a187-da5493cecb5e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 31 Mar 2025, Jan Beulich wrote:

> On 28.03.2025 00:34, Stefano Stabellini wrote:
> > --- a/xen/common/bitmap.c
> > +++ b/xen/common/bitmap.c
> > @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
> >  	unsigned int remainder = nbits % 8;
> >  
> >  	if (remainder)
> > -		bp[nbits/8] &= (1U << remainder) - 1;
> > +		*bp &= (1U << remainder) - 1;
> >  }
> 
> Technically there's nothing wrong with dropping the if(), I think. Even more
> so then than now, ...
> 
> > @@ -338,7 +338,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
> >  			nbits -= 8;
> >  		}
> >  	}
> > -	clamp_last_byte(bp, nbits);
> >  }
> >  
> >  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> > @@ -363,7 +362,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
> >  				unsigned int nbits)
> >  {
> >  	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
> > -	clamp_last_byte(bp, nbits);
> >  }
> 
> ... with the two prior call sites now shrunk to ...
> 
> > @@ -384,21 +382,41 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
> >      uint8_t zero = 0;
> >      int err = 0;
> >      unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
> > -    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> > -
> > -    if ( !bytemap )
> > -        return -ENOMEM;
> > +    uint8_t last;
> >  
> >      guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
> >      copy_bytes  = min(guest_bytes, xen_bytes);
> >  
> > -    bitmap_long_to_byte(bytemap, bitmap, nbits);
> > +    if ( IS_ENABLED(__BIG_ENDIAN) )
> > +    {
> > +        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
> >  
> > -    if ( copy_bytes &&
> > -         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
> > -        err = -EFAULT;
> > +        if ( !bytemap )
> > +            return -ENOMEM;
> >  
> > -    xfree(bytemap);
> > +        bitmap_long_to_byte(bytemap, bitmap, nbits);
> > +        last = bytemap[nbits / 8];
> > +
> > +        if ( copy_bytes > 1 &&
> > +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> > +            err = -EFAULT;
> > +
> > +        xfree(bytemap);
> > +    }
> > +    else
> > +    {
> > +        const uint8_t *bytemap = (const uint8_t *)bitmap;
> > +        last = bytemap[nbits / 8];
> > +
> > +        if ( copy_bytes > 1 &&
> > +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> > +            err = -EFAULT;
> > +    }
> > +
> > +    clamp_last_byte(&last, nbits);
> 
> ... just one, I wonder if that being a separate function is actually still
> necessary.
> 
> As indicated before, I think it would be nice if the two identical copy-out
> operations could also be folded.
 
Please see: https://marc.info/?l=xen-devel&m=174319650100975

Other than that, I addressed all the other points

