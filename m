Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35C2CECF2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:21:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44471.79681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl99n-00017u-98; Fri, 04 Dec 2020 11:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44471.79681; Fri, 04 Dec 2020 11:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl99n-00017T-54; Fri, 04 Dec 2020 11:21:47 +0000
Received: by outflank-mailman (input) for mailman id 44471;
 Fri, 04 Dec 2020 11:21:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl99l-00017O-0D
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:21:45 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde73c38-93d2-492a-ab1b-618c2df2e427;
 Fri, 04 Dec 2020 11:21:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v14so5234195wml.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:21:44 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h83sm3055345wmf.9.2020.12.04.03.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:21:42 -0800 (PST)
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
X-Inumbo-ID: cde73c38-93d2-492a-ab1b-618c2df2e427
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KETAunvqR8TYIMllC4o7XH06Nc/jgVHMbN1L0eP8PUQ=;
        b=O5xbdIymffR/adYpXpc4u2/zx+y5Hjx3VzyxdqyoBYxRICf++cOYcRcFWqkke8t01b
         UWPzdZPRrFbGYaeIzii98RP+ijBuK6e6FWV7D7OTb2Yz8ym4At/FVm5mWQya4ZSll7GE
         KlI2wcveviyVdl3seGuhYbF/se7otso0IGXx7Zx08S46QkacE7iEkEYdv8x6kur8z1uE
         0xzAOdvO9FI5J+lh6sXGXuZAKBOVRSS7ca5Osn3vxGjJg4Z/n8GbTH4qIxzE3BVstDoX
         o7SmA/vrvNUkM/X5dGSttcUE3e9xwBibRMokMNzE7f8LQ1q+iY86fs8cP8SiAnXl/PzN
         XFhA==
X-Gm-Message-State: AOAM531e/7LxYChu8dxm7BytzNDmKO3nIrgjFpiU0/aWkx/ZiP6t+jQS
	IDWq9IWkjvvOHAmK7fhyB8DRoi8wilc=
X-Google-Smtp-Source: ABdhPJxC2wWfqmRn44ejnkzW4ytzjZRgfN8cXTI0sSt2H0uClchFnj1iF/itOK0qELPFLzQNF9t3cg==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr3720982wmd.6.1607080903476;
        Fri, 04 Dec 2020 03:21:43 -0800 (PST)
Date: Fri, 4 Dec 2020 11:21:41 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Cc: 'Wei Liu' <wl@xen.org>, xen-devel@lists.xenproject.org,
	'Paul Durrant' <pdurrant@amazon.com>,
	'Oleksandr Andrushchenko' <oleksandr_andrushchenko@epam.com>,
	'Ian Jackson' <iwj@xenproject.org>,
	'Anthony PERARD' <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove
 DEFINE_DEVICE_TYPE_STRUCT_X
Message-ID: <20201204112141.wdwb54brb23x2bgs@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-2-paul@xen.org>
 <20201204111326.5pxgqertdm3tk7y2@liuwe-devbox-debian-v2>
 <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013d01d6ca2f$605fe7e0$211fb7a0$@xen.org>
User-Agent: NeoMutt/20180716

On Fri, Dec 04, 2020 at 11:19:47AM -0000, Paul Durrant wrote:
> > -----Original Message-----
> > From: Wei Liu <wl@xen.org>
> > Sent: 04 December 2020 11:13
> > To: Paul Durrant <paul@xen.org>
> > Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Oleksandr Andrushchenko
> > <oleksandr_andrushchenko@epam.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Anthony
> > PERARD <anthony.perard@citrix.com>
> > Subject: Re: [PATCH v5 01/23] xl / libxl: s/pcidev/pci and remove DEFINE_DEVICE_TYPE_STRUCT_X
> > 
> > On Thu, Dec 03, 2020 at 02:25:12PM +0000, Paul Durrant wrote:
> > > From: Paul Durrant <pdurrant@amazon.com>
> > >
> > > The seemingly arbitrary use of 'pci' and 'pcidev' in the code in libxl_pci.c
> > > is confusing and also compromises use of some macros used for other device
> > > types. Indeed it seems that DEFINE_DEVICE_TYPE_STRUCT_X exists solely because
> > > of this duality.
> > >
> > > This patch purges use of 'pcidev' from the libxl code, allowing evaluation of
> > > DEFINE_DEVICE_TYPE_STRUCT_X to be replaced with DEFINE_DEVICE_TYPE_STRUCT,
> > > hence allowing removal of the former.
> > >
> > > For consistency the xl and libs/util code is also modified, but in this case
> > > it is purely cosmetic.
> > >
> > > NOTE: Some of the more gross formatting errors (such as lack of spaces after
> > >       keywords) that came into context have been fixed in libxl_pci.c.
> > >
> > > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > ---
> > > Cc: Ian Jackson <iwj@xenproject.org>
> > > Cc: Wei Liu <wl@xen.org>
> > > Cc: Anthony PERARD <anthony.perard@citrix.com>
> > >
> > 
> > This is going to break libxl callers because the name "pcidev" is
> > visible from the public header.
> > 
> > I agree this is confusing and inconsistent, but we didn't go extra
> > length to maintain the inconsistency for no reason.
> > 
> > If you really want to change it, I won't stand in the way. In fact, I'm
> > all for consistency. I think the flag you added should help alleviate
> > the fallout.
> 
> Yes, I thought that was the idea... we can make API changes if we add a flag. I could see about adding shims to translate the names
> and keep the internal code clean.

Yes if you can add some internal shims to handle it that would be
great. Otherwise you will need to at least fix libvirt.

Wei.

