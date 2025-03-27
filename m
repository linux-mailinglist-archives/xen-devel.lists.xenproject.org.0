Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A62A74189
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930040.1332778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwkJ-0000qH-P6; Thu, 27 Mar 2025 23:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930040.1332778; Thu, 27 Mar 2025 23:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwkJ-0000n6-LV; Thu, 27 Mar 2025 23:34:47 +0000
Received: by outflank-mailman (input) for mailman id 930040;
 Thu, 27 Mar 2025 23:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txwkJ-0000SW-0E
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:34:47 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0993cdfc-0b64-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:34:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2DF7AA42F7E;
 Thu, 27 Mar 2025 23:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61D8C4CEDD;
 Thu, 27 Mar 2025 23:33:56 +0000 (UTC)
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
X-Inumbo-ID: 0993cdfc-0b64-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743118437;
	bh=p2UYJl/vjGo5mu2MwVNL1dBqWBWtWBVkqJMB6OGxAf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kIpYiZdOAnBHPe3Aj/QjRXR2CCK9HFQ3XwFCUrtkkruNIbCejHO3oqcQCMNd0WP0X
	 uFCXDjV+khZ/q2wwv3OVN8XgKIN6fjVAWGKQ9UsUuSaUlsgpXxRiAlz4FNxJZRrimI
	 7/OO7IchXwMR4mkX/aaWvu4X7MIpXqbvOZ0mvauMoZjuwnpQFcPzTFsfA62nkY1UVr
	 GGY3kRM8AGVqbVdB9X1zRHzOqyuzE5IcIWJ21mkfM7XINq7Eqv77X5ISPtSb94d3s5
	 DDdziCXdenSQveRTSzrH4w9zM/3e7kb6hCHQDModox8SkWL9Uv4qqaTKlM/lUhhjCP
	 1hPf5nZmrpbeQ==
Date: Thu, 27 Mar 2025 16:33:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    michal.orzel@amd.com, julien@xen.org, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
In-Reply-To: <59cdc84c-6e5a-4752-b09a-945d05badd91@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503271628460.563920@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2503182002160.2000798@ubuntu-linux-20-04-desktop> <ad1bd470-1efa-4019-89ac-386bb05dd44d@suse.com> <alpine.DEB.2.22.394.2503191754480.2325679@ubuntu-linux-20-04-desktop> <8297406e-b281-4783-9238-d6326db3fa15@suse.com>
 <alpine.DEB.2.22.394.2503211607200.2325679@ubuntu-linux-20-04-desktop> <59cdc84c-6e5a-4752-b09a-945d05badd91@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Jan Beulich wrote:
> On 22.03.2025 00:09, Stefano Stabellini wrote:
> > On Thu, 20 Mar 2025, Jan Beulich wrote:
> >> On 20.03.2025 01:57, Stefano Stabellini wrote:
> >>> On Wed, 19 Mar 2025, Jan Beulich wrote:
> >>>> What about xenctl_bitmap_to_bitmap()?
> >>>  
> >>> Let me see first if I managed to handle bitmap_to_xenctl_bitmap well.
> >>
> >> Well, the code looks correct to me, but the description now has gone
> >> stale. I also wonder whether with that extra restriction the optimization
> >> is then actually worth it. Just one further nit:
> > 
> > Hi Jan, you make a good point. I tried to come up with a better
> > approach. What do you think of this?
> > 
> > 
> > diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
> > index 3da63a32a6..2f448693c3 100644
> > --- a/xen/common/bitmap.c
> > +++ b/xen/common/bitmap.c
> > @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
> >  	unsigned int remainder = nbits % 8;
> >  
> >  	if (remainder)
> > -		bp[nbits/8] &= (1U << remainder) - 1;
> > +		*bp &= (1U << remainder) - 1;
> >  }
> >  
> >  int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
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
> >  
> >  static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
> > @@ -384,21 +382,40 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
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
> > +        last = bytemap[nbits/8];
> 
> Same style nit as before.
> 
> > +        if ( copy_bytes &&
> 
> copy_bytes > 1
> 
> > +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> > +            err = -EFAULT;
> > +
> > +        xfree(bytemap);
> > +    }
> > +    else
> > +    {
> > +        const uint8_t *bytemap = (const uint8_t *)bitmap;
> > +        last = bytemap[nbits/8];
> > +
> > +        if ( copy_bytes &&
> > +             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
> > +            err = -EFAULT;
> 
> The two identical instances would imo better stay common, even if this may
> require another function-scope variable (to invoke xfree() on after the
> copy-out).

That's not possible because bytemap is defined differently in the two
cases so it has to be defined within the if block.

I addressed everything else, I'll send v3 as a separate patch


> > +    }
> > +
> > +    clamp_last_byte(&last, nbits);
> > +    if ( copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
> > +        err = -EFAULT;
> 
> Careful here in particular when copy_bytes == 0.
> 
> Jan
> 

