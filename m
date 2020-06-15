Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC751F9E28
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 19:11:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jksdZ-0001ox-G3; Mon, 15 Jun 2020 17:11:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jksdY-0001os-0M
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 17:11:08 +0000
X-Inumbo-ID: 33218fb4-af2b-11ea-bca7-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33218fb4-af2b-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 17:11:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d15so12075773edm.10
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=NQyNmeeYlzA3FqZTPsLGUbnEixa7Hg3xx8TpRJdFhgc=;
 b=IwsbgP1H1QIRpHl4gWXsKhniiGu1c5PzSANpCCEPENENzjh767LU9Y60re6DC/8cMf
 fQUAhWRPR2baFtUy8sv+aEe2LT++NOgGRmfsjue5O16uweBQPC2z/LWfSefqPvtebtzg
 MjIe4NajQGBK72K7T76QzpOjfhNTmmqCAM1lCesq5VlRa+MMUdre5fFkc9pazpSolUCk
 nTlC0V5AfcBRIoIE/ovOyNrobK8z3NYrfyUBKUMpzg2tB4fKRA4MhalSfXBXMfv6H+Zs
 NnypYmyFhD+BrmG3PpwJCqjMH61h9wa3Hn8XPgbYCg2XRqnofM7cUFcpsskhxjSxwkFb
 iKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=NQyNmeeYlzA3FqZTPsLGUbnEixa7Hg3xx8TpRJdFhgc=;
 b=I1D46PPDY/tcpPAu8EHI5nQbPXdchc7it8SlywYfo8FiNkIH1q3xwBNA6mPUDfYoh0
 vnQCDp8HsjMh41H7mCmRqpLxvLr+bnvZWBuY86M05hVKgOvyV+YfK5Enhy/Q8MdQ9VQI
 +xKA6qr4tdB4YDQCWwn3ASmU6UzczM28A9CBK9Jwp/pu8K/8cj2S3uxNXntuVlwgA5l2
 mqiVtOOHohxcY+xuzwwW+aXgReXMu6/1MxMG5p58PbnDDQehm3gH84XF7F5Hwu58udsr
 3rXuI/+MxtymXuOhGRBqRtXfO94La3FzT1VqZP7b57ezxmONaH3dgyUXvmQIIabtz/j9
 CFUQ==
X-Gm-Message-State: AOAM533v6wcLo/zaMW024QL9B1LT3Nwjg3BNlAsq0kTtFUwnbCZ6ma62
 ufDCvwpPrOgtzJr0Itk4+z4=
X-Google-Smtp-Source: ABdhPJyswca8Z6EvpzKtchFMaquA7fTSD1Ambul3SxVQ7HLBTPokSCBW25uIg7H0BQsHuSzEoh+A6Q==
X-Received: by 2002:a50:934e:: with SMTP id n14mr24809333eda.88.1592241066054; 
 Mon, 15 Jun 2020 10:11:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id t9sm9472520ejy.43.2020.06.15.10.11.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 10:11:05 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Roger Pau Monne'" <roger.pau@citrix.com>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>	<24295.36070.945693.791220@mariner.uk.xensource.com>	<20200615155646.GI735@Air-de-Roger>
 <24295.41945.883230.966002@mariner.uk.xensource.com>
In-Reply-To: <24295.41945.883230.966002@mariner.uk.xensource.com>
Subject: RE: [PATCH] libxl: tooling expects wrong errno
Date: Mon, 15 Jun 2020 18:11:04 +0100
Message-ID: <003401d64337$f43c1990$dcb44cb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJRrVmR5Atw2cuOlpDTe0mFV6HHUQIpYa7PAtS50FEBvgZ2vaetM+7Q
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
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 jakub@bartmin.ski, 'Andrew Cooper' <Andrew.Cooper3@citrix.com>,
 marmarek@invisiblethingslab.com, 'Grzegorz Uriasz' <gorbak25@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Ian Jackson <ian.jackson@citrix.com>
> Sent: 15 June 2020 17:38
> To: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; Jan Beulich <jbeulich@suse.com>; Andrew Cooper
> <Andrew.Cooper3@citrix.com>; Kevin Tian <kevin.tian@intel.com>; Paul Durrant <paul@xen.org>; Wei Liu
> <wl@xen.org>; jakub@bartmin.ski; marmarek@invisiblethingslab.com; j.nowak26@student.uw.edu.pl; Anthony
> Perard <anthony.perard@citrix.com>; xen-devel@lists.xenproject.org; contact@puzio.waw.pl
> Subject: Re: [PATCH] libxl: tooling expects wrong errno
> 
> Roger Pau Monne writes ("Re: [PATCH] libxl: tooling expects wrong errno"):
> > On Mon, Jun 15, 2020 at 03:59:50PM +0100, Ian Jackson wrote:
> > > Grzegorz Uriasz writes ("[PATCH] libxl: tooling expects wrong errno"):
> > > > When iommu is not enabled for a given domain then pci passthrough
> > > > hypercalls such as xc_test_assign_device return EOPNOTSUPP.
> > > > The code responsible for this is in "iommu_do_domctl" inside
> > > > xen/drivers/passthrough/iommu.c
> > > > This patch fixes the error message reported by libxl when assigning
> > > > pci devices to domains without iommu.
> > > >
> > > > Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > > Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > > ---
> > > >  tools/libxl/libxl_pci.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > > > index 957ff5c8e9..bc5843b137 100644
> > > > --- a/tools/libxl/libxl_pci.c
> > > > +++ b/tools/libxl/libxl_pci.c
> > > > @@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
> > > >              LOGD(ERROR, domid,
> > > >                   "PCI device %04x:%02x:%02x.%u %s?",
> > > >                   pcidev->domain, pcidev->bus, pcidev->dev, pcidev->func,
> > > > -                 errno == ENOSYS ? "cannot be assigned - no IOMMU"
> > > > +                 errno == EOPNOTSUPP ? "cannot be assigned - no IOMMU"
> > > >                   : "already assigned to a different guest");
> > > >              goto out;
> > > >          }
> > >
> > > Thanks.  I have addressed some Xen IOMMU maintainers.  Can you confirm
> > > whether this is right ?
> >
> > Not an IOMMU maintainer myself, but I've taken a look at the code and
> > I think Grzegorz is right. iommu_do_domctl will return -EOPNOTSUPP if
> > the IOMMU is not enabled for the domain. Another option would be to
> > check for EBUSY (which will certainly be returned when the device is
> > busy) and log the error code with a message when it's different than
> > EBUSY?
> >
> > There are many possible error here, for example the device itself
> > might not be behind an IOMMU, in which case Xen will return -ENODEV at
> > least on the Intel case.
> 
> Thanks for the analysis.  So:
> 
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> This would seem to be a backport candidate.  AFAICT check has been
> there, looking for ENOSYS, since this code was introduced in
>    826eb17271d3c647516d9944c47b0779afedea25
>    libxl: suppress device assignment to HVM guest when there is no IOMMU
> ?
> 
> But that commit has a Tested-by.  Maybe Xen changed its error return
> at some point ?
> 

Yes, it happened in 71e617a6b8f69849c70eda1b3c58f1ff6b244e5a
use is_iommu_enabled() where appropriate...

  Paul

> Ian.


