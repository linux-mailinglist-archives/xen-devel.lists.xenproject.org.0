Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31F2469C6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 17:26:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7h1X-0003nF-1y; Mon, 17 Aug 2020 15:26:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gW6M=B3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k7h1V-0003n9-GD
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 15:26:09 +0000
X-Inumbo-ID: 072ebe8f-1bbf-4a75-b547-90d8285f74a8
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 072ebe8f-1bbf-4a75-b547-90d8285f74a8;
 Mon, 17 Aug 2020 15:26:08 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id cs12so7962335qvb.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2020 08:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xHM3aMczrtxEGiBnoEaBfsbBuzD5kJs1HBfhKOSpU34=;
 b=RUAtOcNWvYbl07SIFU75BKfAiO78oHIkX4P8tZjPRzsrhCWVZROvVDVccUckRRQ1Rn
 rZ69qgzKuQvwwu6+2SEJTAsGCEXMhRs+YI6B7RjIS8vPjAKgz83uuDt3hI7MPIR87d0v
 BLCc+MyxYZHmylHZJM4QXQMnD+kb7MBM98P9d6Ug6gyvJxOtYLTsG6osnDVB5BqevdBp
 gCKuckElzcLNRaQQ5RW4Mq48Agg7ZqrmPB6Mmri4zWEiGuN4HpxOlvOJhLHzsZw5qxw3
 hPnBONVeHecrB8x8fLu5yrZTEkH/V17uagOAqH+hgxQDw4Ypifqtk3Cb2CqnVAwIoYYo
 k0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xHM3aMczrtxEGiBnoEaBfsbBuzD5kJs1HBfhKOSpU34=;
 b=VN+0+A0dI2NuzmUTIZdWtQ/KTda4nb6HtaLvjhj2FBAV2e1oObrE5RBlJ2m5JMrMRu
 ycw9dIJ6y6Ula4pYXy/ttfOMYJalsKqrxKskX1KCYPFtQklw2dT8AWOlJJ8EULJ+XDyu
 sxPrpxdS6IRvgtyoUlFGl+OSEkp1Q4bxN0DG57l5wRRqlEzRQ4aUhfNvMMknDJUNY0Ij
 GC+iIeaXe+755cOEG91gqD64edqlLmk/IW3/MXqOsbUOjs2AAQIXjoWrCRF08W1s+Z8X
 +pW1E7xLKWPaJhTWl9n4JdirKmJTjdFM4axvWtctocTrOYtv0a3B1uqvIxmTLilIo9i3
 aRaw==
X-Gm-Message-State: AOAM530ST2PVVn6qM1PkuOF3CvjwnsKCxephURwnwjn9+qZrF+HaNWpj
 T+wd94Yrv+nfqK1DownCllc=
X-Google-Smtp-Source: ABdhPJw1an/NsgmTM6Pi6ls3gS8oTJmEm1/LqA/wn1vHA/87x2ocxQoig39pjY30TDSg7wFjcKS0lQ==
X-Received: by 2002:ad4:560f:: with SMTP id
 ca15mr15225946qvb.144.1597677968122; 
 Mon, 17 Aug 2020 08:26:08 -0700 (PDT)
Received: from four (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id b131sm17623318qkc.121.2020.08.17.08.26.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 08:26:07 -0700 (PDT)
Date: Mon, 17 Aug 2020 11:26:04 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 1/2] libxl: add Function class to IDL
Message-ID: <20200817152604.GA6441@four>
References: <cover.1595854292.git.rosbrookn@ainfosec.com>
 <7e1774dffe69c702f738566abeb04a3a9d29e21b.1595854292.git.rosbrookn@ainfosec.com>
 <20200814105233.GD2024@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814105233.GD2024@perard.uk.xensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Fri, Aug 14, 2020 at 11:52:33AM +0100, Anthony PERARD wrote:
> On Mon, Jul 27, 2020 at 09:26:32AM -0400, Nick Rosbrook wrote:
> > Add a Function and CtxFunction classes to idl.py to allow generator
> > scripts to generate wrappers which are repetitive and straight forward
> > when doing so by hand. Examples of such functions are the
> > device_add/remove functions.
> > 
> > To start, a Function has attributes for namespace, name, parameters,
> > return type, and an indication if the return value should be interpreted as
> > a status code. The CtxFunction class extends this by indicating that a
> > libxl_ctx is a required parmeter, and can optionally be an async
> > function.
> > 
> > Also, add logic to idl.parse to return the list of functions found in an
> > IDL file. For now, have users of idl.py -- i.e. libxl/gentypes.py and
> > golang/xenlight/gengotypes.py -- ignore the list of functions returned.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> >  
> > +class Function(object):
> > +    """
> > +    A general description of a function signature.
> > +
> > +    Attributes:
> > +      name (str): name of the function, excluding namespace.
> > +      params (list of (str,Type)): list of function parameters.
> > +      return_type (Type): the Type (if any), returned by the function.
> > +      return_is_status (bool): Indicates that the return value should be
> > +                               interpreted as an error/status code.
> 
> Can we get away without `return_is_status`? Couldn't we try to have
> return_type=libxl_error to indicate that return is a kind of status?
> 
Yes, I think that is much better.

> > +    """
> > +class CtxFunction(Function):
> > +    """
> > +    A function that requires a libxl_ctx.
> > +
> > +    Attributes:
> > +      is_asyncop (bool): indicates that the function accepts a
> > +                         libxl_asyncop_how parameter.
> 
> While CtxFunction can be a function that takes `libxl_ctx` as first
> parameter, I don't think `is_asyncop` can be used. We can't know if
> `ao_how` will be last or not. For some function, `ao_how` is second to
> last. So, I guess `ao_how` might need to be listed in `params`
> 
> What do you think?
That's a good point. Do you think it would make sense to add `Builtin`
definitions to libxl_types.idl for `libxl_asyncop_how`,
`libxl_asyncprogress_how`, etc.? That way the generation scripts could
work with those types more easily. But, I guess since those definitions
aren't known until parse time we couldn't use them in the
`DeviceFunction` class definition (but maybe that's not a big deal).

Thank you for the feedback.

-NR

