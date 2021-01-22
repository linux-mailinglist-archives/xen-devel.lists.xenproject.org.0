Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977AB300F7F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 23:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73132.131857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l34Tp-0002lF-Nh; Fri, 22 Jan 2021 22:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73132.131857; Fri, 22 Jan 2021 22:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l34Tp-0002kq-KU; Fri, 22 Jan 2021 22:00:33 +0000
Received: by outflank-mailman (input) for mailman id 73132;
 Fri, 22 Jan 2021 22:00:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l34To-0002kl-Ai
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 22:00:32 +0000
Received: from mail-pj1-x102a.google.com (unknown [2607:f8b0:4864:20::102a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a90c183-8c38-41fa-b6bc-e57fb037a092;
 Fri, 22 Jan 2021 22:00:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id e6so4759486pjj.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 14:00:31 -0800 (PST)
Received: from piano ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id n2sm9891614pfu.129.2021.01.22.14.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 14:00:29 -0800 (PST)
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
X-Inumbo-ID: 4a90c183-8c38-41fa-b6bc-e57fb037a092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zPaqQvgSnFUeWxSLsjPodaEcfWkfP+yU8MEEA26LpnE=;
        b=F7J185sv88lcM22QhUKZs+WgRWVF97LLuEFoCrGWS+czOXv/+MFpi4eEw8/nyRXwJy
         tZ217ftvr0umuuizA4Gtdl2GXPOCnbSUx58pgueJK2NumfqEmKqQc3EVmbYKpdq60wNx
         RBr3c6Pc/yvFnJWO68+Cbi0Rv5jJqlpbMX5t1k5wTTp3k14yvlvnKpS7B+ym2NuSx0UF
         8b6671yz3Ijs0txmzmryDVC5A2UMS4f+sCvbFtqlYNWYkavOIEgdhbudbeddlXMvpcF3
         ar3FOS7BlgEBWB6IQAVnc3Wzzb1JkXYbQ/iZSsO5sgclUYd5gt59KXUMYHzK590RZ8zd
         IPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zPaqQvgSnFUeWxSLsjPodaEcfWkfP+yU8MEEA26LpnE=;
        b=E/Ac8v5kDGuD9BP/3RHg8yt3PGdKvl39KkcVSyHdXg9fjvAoF903Y2bDSNJwbWbkZd
         WO7s7ZCDODEBmKtRIGQ3qtExPaDPuBd6J4wHYrcSFU9wBgQAGQak1Qp2Zgk/eIm2ngGR
         kBzJ1gYgIR9vFkE9pZy1qQZBLBEVk7H1fTe5XLptA1vb54bd5+O7BycnMC6bS89/lFFH
         BUXXugGG1fSfq+IY83e4bjPyZFGsUTu4/S11ru/knO8QeRWGqw4fesB470eYnxiOOW4n
         lyqcwrND3xx0RbwYr4rh1H2w+xLGpJATvOFZJ3wLN+6SQ8MKjDd30lRHr0w2UkEcp0Oz
         O1pw==
X-Gm-Message-State: AOAM5328Yw6mGdgBys2MRdeF+nbeecjjoNInsch+BysI98N7zjwtFqQW
	wjg4w7TRJPaLmiTnutTW12w=
X-Google-Smtp-Source: ABdhPJxOGwOMslHj4Du9KwiXwtZpkRHZ4+yAMo8NQXsWQbCtNj6eutssGD0+9d1tpthhisXyz10IOQ==
X-Received: by 2002:a17:90a:5d8d:: with SMTP id t13mr7710569pji.39.1611352830366;
        Fri, 22 Jan 2021 14:00:30 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
X-Google-Original-From: Bobby Eshleman <bobbye@piano>
Date: Fri, 22 Jan 2021 13:57:59 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Daniel Kiper <daniel.kiper@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/5] xen: add XEN_BUILD_POSIX_TIME
Message-ID: <YAtKZ3QiE8ZNdNif@piano>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <e8c57268455291bad0bbcdf0013b0d5aa349be1b.1611273359.git.bobbyeshleman@gmail.com>
 <52e85ee7-b980-ece1-50d4-7deac182bca0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e85ee7-b980-ece1-50d4-7deac182bca0@suse.com>

On Fri, Jan 22, 2021 at 12:27:29PM +0100, Jan Beulich wrote:
> On 22.01.2021 01:51, Bobby Eshleman wrote:
> >  export XEN_BUILD_DATE	?= $(shell LC_ALL=C date)
> >  export XEN_BUILD_TIME	?= $(shell LC_ALL=C date +%T)
> >  export XEN_BUILD_HOST	?= $(shell hostname)
> > +export XEN_BUILD_POSIX_TIME	?= $(shell echo $${SOURCE_DATE_EPOCH:-$(shell date +%s)})
> 
> ... the use of SOURCE_DATE_EPOCH here when it's not used for
> XEN_BUILD_TIME (the two could also do with living side by
> side) and ...
> 

XEN_BUILD_TIME is of the form "HH:MM:SS" and SOURCE_DATE_EPOCH / date
+%s are unix timestamps (seconds since epoch).  On Linux, `date -d`
could be used to equalize the two timestamps... I'm not sure about
FreeBSD, as -d is not required by POSIX.

I could place them side-by-side if that's preferred.  I placed it
afterwards here so that there wasn't one oddly aligned "?=" assignment
in the middle of the others, as in rev2 it was requested their alignment
be retained here.

> > --- a/xen/include/xen/compile.h.in
> > +++ b/xen/include/xen/compile.h.in
> > @@ -1,5 +1,6 @@
> >  #define XEN_COMPILE_DATE	"@@date@@"
> >  #define XEN_COMPILE_TIME	"@@time@@"
> > +#define XEN_COMPILE_POSIX_TIME	@@posix_time@@
> >  #define XEN_COMPILE_BY		"@@whoami@@"
> >  #define XEN_COMPILE_DOMAIN	"@@domain@@"
> >  #define XEN_COMPILE_HOST	"@@hostname@@"
> 
> ... the lack of quotes here when all neighboring items have
> them.
> 

XEN_COMPILE_POSIX_TIME is used as a long, while the others are used as
strings.  Should this be commented?

Thank you for the feedback.

Best,
Bobby

