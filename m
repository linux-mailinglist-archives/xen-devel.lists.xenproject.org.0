Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC320B061
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 13:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jomU4-0008Df-AN; Fri, 26 Jun 2020 11:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azve=AH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jomU2-0008Cv-Qo
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 11:25:26 +0000
X-Inumbo-ID: bb577b6a-b79f-11ea-829d-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb577b6a-b79f-11ea-829d-12813bfff9fa;
 Fri, 26 Jun 2020 11:25:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so9118403wrs.11
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 04:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5RoWnMEQoBsQtGSmLTmDOSjXffsN41Q/8Po4tZ9y+rY=;
 b=UunrN0KXeXsGeykAvDCRoJn6AsWwPdmn5Ev6v4BnMJjC8e/CEoOL2ulkMBjI5/RgHE
 JdgInuRQGcQDzpUKrx8hIG/vUWcFznUzW4bTBzzkEv8vsd9cAN6mIuG3VrT/kunGi/yG
 SpcVGZeCBsxvUOdSK+vd1jZlp3KUm7Htv6kRgG/VrtmnDfAKm8cSmwP6Rp9c2RXDnW2Z
 g89/8tHIxmOIRKxNJVQjfkxbAZTepEH2TcyD7l+stIBM9C8s7vI4VGTJtZojgX1qFp1k
 BuDQsI6SUHMFPemdpGj5ea7L+c46K5x4JrA7H3yVLfx4jWmEqO2SSdfW7tPRTeQ25i+B
 /GlQ==
X-Gm-Message-State: AOAM532PmEZcbLJdNJL4XuVrLhp1/WEoxJwDUHOpFqq4X7/h4Sdrpki9
 yzFFjP7sL8SKgIMRCZ27nrQ=
X-Google-Smtp-Source: ABdhPJzE7sapxi+Pv4GO7PCG+FtBVNWb4w29lKTwJXMeKjH7ma8+14DWyO9ChgNifMSDi0Nxf7zZNg==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr3141167wrp.315.1593170725600; 
 Fri, 26 Jun 2020 04:25:25 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 138sm18124773wma.23.2020.06.26.04.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 04:25:25 -0700 (PDT)
Date: Fri, 26 Jun 2020 11:25:23 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: tooling expects wrong errno
Message-ID: <20200626112523.eh6lpm5hudkjmg4l@liuwe-devbox-debian-v2>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
 <20200615155646.GI735@Air-de-Roger>
 <24295.41945.883230.966002@mariner.uk.xensource.com>
 <003401d64337$f43c1990$dcb44cb0$@xen.org>
 <24295.45650.388910.186169@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24295.45650.388910.186169@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
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
Cc: Kevin Tian <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, "jakub@bartmin.ski" <jakub@bartmin.ski>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 'Grzegorz Uriasz' <gorbak25@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 "j.nowak26@student.uw.edu.pl" <j.nowak26@student.uw.edu.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "contact@puzio.waw.pl" <contact@puzio.waw.pl>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 06:39:30PM +0100, Ian Jackson wrote:
> Paul Durrant writes ("RE: [PATCH] libxl: tooling expects wrong errno"):
> > > -----Original Message-----
> > > From: Ian Jackson <ian.jackson@citrix.com>
> > > Thanks for the analysis.  So:
> > > 
> > > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> > > 
> > > This would seem to be a backport candidate.  AFAICT check has been
> > > there, looking for ENOSYS, since this code was introduced in
> > >    826eb17271d3c647516d9944c47b0779afedea25
> > >    libxl: suppress device assignment to HVM guest when there is no IOMMU
> > > ?
> > > 
> > > But that commit has a Tested-by.  Maybe Xen changed its error return
> > > at some point ?
> > > 
> > 
> > Yes, it happened in 71e617a6b8f69849c70eda1b3c58f1ff6b244e5a
> > use is_iommu_enabled() where appropriate...
> 
> So,
> 
> Backport: 4.13
> 
> Thanks!

This is not yet committed. Paul, can I get a release ack from you?

Wei.

> 
> Ian.

