Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AA1D8BFB
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 02:04:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1japib-0006v3-8w; Tue, 19 May 2020 00:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Je38=7B=gmail.com=tcminyard@srs-us1.protection.inumbo.net>)
 id 1japiZ-0006uy-4K
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 00:02:47 +0000
X-Inumbo-ID: 11daf2d2-9964-11ea-b9cf-bc764e2007e4
Received: from mail-ot1-x342.google.com (unknown [2607:f8b0:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11daf2d2-9964-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 00:02:46 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id c3so9700423otr.12
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 17:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iYjOqrFGOmpbtD9yt96lQwWe0nWJADjGyH8dgI2UBJs=;
 b=vXG4Ea4qYNxaFsDjBV0PwUYxg/DGm6x2IWVvNPEMF9gSc9b36/aRdgohW8Pe1eq/M4
 N645SKh7DUAwIragn3CGxNF7txZZ8D3Mam4XhwDYkZ0NkqicUgpA7TzIRB7Cm65e3/G8
 xvEST1V/i/9C1Y2UOoPfveaguN1K6nL5C61iQlxJq/Bmz95VPphOWqnuqb4VmT2sRn/k
 bFBE0eRq9VGPjorXtiRHErquV5Zn874cLSkzDN+xICXLewjfKbe68/8W8JCZzvlTbNdG
 T5tC/lvGfkRb4HCBGtNDJpwL06Sba+qneRNPy4oWq39j7BBMMndd3hsahurPEBbuBg/6
 Nlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to
 :user-agent;
 bh=iYjOqrFGOmpbtD9yt96lQwWe0nWJADjGyH8dgI2UBJs=;
 b=npi8czN11/EClf+08/G2KFCEDkEbyfkrC49sSBT9/AdF9FuU85tD0GK3qfbD48kcla
 rK4K9ZKMydGcxO6jvS4wWbpQtuMDvGgrlrjbI+0L1OdOYEtvTKrklQO40Y9PozLtGOWm
 I8MokzKE1uuImRfooMfPKcvty66eoMc9Evmb4FdybLIHP1hROA4GydG4ZKbpzpo40A9b
 R6vQVDxMOQM26Nl6vSW8f4ETb/rqKnsT7qrE3hQuG4ZIQDj0ouJHczzSzv1NkZaovY3G
 AVYbkQ74V7WQPExSv2ZH1rsfdOAf0tVoh2wqA8TMn+2TXrY+kXumzC+5/pnC7NqBra2l
 UF9A==
X-Gm-Message-State: AOAM530t+8tEZYmvRG+TihMXKTvCfyiuOmqb+bhirBAD9aDWqvuuHWJ+
 ZCo5pYN5WEWsggrHENezvA==
X-Google-Smtp-Source: ABdhPJxj1gl61nfGlDjfEwABJRLHTww6pg7TG615C4W2TfrFeaxVYUBIwfoo+vmi4hqoBWECYKUp+Q==
X-Received: by 2002:a9d:1a7:: with SMTP id e36mr13383074ote.215.1589846565860; 
 Mon, 18 May 2020 17:02:45 -0700 (PDT)
Received: from serve.minyard.net ([47.184.146.204])
 by smtp.gmail.com with ESMTPSA id y89sm712062ota.16.2020.05.18.17.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 17:02:44 -0700 (PDT)
Received: from minyard.net (unknown [192.168.27.193])
 by serve.minyard.net (Postfix) with ESMTPSA id B2B83180042;
 Tue, 19 May 2020 00:02:43 +0000 (UTC)
Date: Mon, 18 May 2020 19:02:42 -0500
From: Corey Minyard <minyard@acm.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.14 3/3] xen/arm: plat: Allocate as much as possible
 memory below 1GB for dom0 for RPI
Message-ID: <20200519000242.GA3948@minyard.net>
References: <20200518113008.15422-1-julien@xen.org>
 <20200518113008.15422-4-julien@xen.org>
 <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc9a1121a7484ef484c30869793698f912987d23.camel@epam.com>
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
Reply-To: minyard@acm.org
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "jgrall@amazon.com" <jgrall@amazon.com>,
 "roman@zededa.com" <roman@zededa.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 08:36:08PM +0000, Volodymyr Babchuk wrote:
> Hi Julien,
> 
> On Mon, 2020-05-18 at 12:30 +0100, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> > 
> > The raspberry PI 4 has devices that can only DMA into the first GB of
> > the RAM. Therefore we want allocate as much as possible memory below 1GB
> > for dom0.
> > 
> > Use the recently introduced dma_bitsize field to specify the DMA width
> > supported.
> > 
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > Reported-by: Corey Minyard <minyard@acm.org>
> > ---
> >  xen/arch/arm/platforms/brcm-raspberry-pi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> > index b697fa2c6c0e..ad5483437b31 100644
> > --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> > +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> > @@ -43,6 +43,7 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
> >  PLATFORM_START(rpi4, "Raspberry Pi 4")
> >      .compatible     = rpi4_dt_compat,
> >      .blacklist_dev  = rpi4_blacklist_dev,
> > +    .dma_bitsize    = 10,
> 
> I'm confused. Should it be 30?

Indeed it should.  I just tested this series, and Linux fails to boot
with this set to 10.  With it set to 30 it works.

With this set to 30, you can have a:

Tested-by: Corey Minyard <cminyard@mvista.com>

for all three patches.

-corey

> 
> >  PLATFORM_END
> >  
> >  /*

