Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B31962C2
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 02:04:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHzpb-0007yc-WE; Sat, 28 Mar 2020 01:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i753=5N=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jHzpa-0007Zp-QV
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 01:00:10 +0000
X-Inumbo-ID: 78c236a2-708f-11ea-a6c1-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78c236a2-708f-11ea-a6c1-bc764e2007e4;
 Sat, 28 Mar 2020 01:00:09 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v38so5895208qvf.6
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2020 18:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4KNFSLe+4YCZxKPxxf9xm0I1H8cJOnoIiozNgRukEsA=;
 b=Ims8Xmw9EfrZBkL4QmtMmeIIn7sID/cFkPl1cSNCm2x0VfUm7Mc7KPjPXU5Oi3O/Ig
 AmdNl2M8KlsyWTo33PGGhEf9nBG0a/8M0KlLmbpNfGCXBy10Hz8UmCm6YZnzDDSXDi4L
 x1uJPONV/KubpcDBDyzaXv5X45QmnBz8bOeZjB2WMR72pGMOGNCLhgY6mqo502aM/5fS
 oIqDXQaJqGYfinVHXWo5AHZkL2k8bVGZVX7dPPThF/SA4aKOhN+wJpHUm+FlUWL3nkBu
 PzRGnBQIn7fCfker6TucerPe8YZq/N2NHdVEuqQVjzEbNqSxdN3jOq01GRkfQQUq8YXX
 X2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4KNFSLe+4YCZxKPxxf9xm0I1H8cJOnoIiozNgRukEsA=;
 b=tmFqEtIp0qqUBm642M7XWMDHIcbj2ryYyV6GYwYKqXvd+LLsXWutJCV9FPu2zb5EPx
 Ld7ZqBTd347i5UmsTwBMBOUyg/7qfGyxPbPjeN0Rb/13SqCWcqYBIxBYnnUBJOxNSoC5
 1rV9wFJcHzDyTyxZjj8o62cbRk6CbWjCAWnUaAKFs1X6CnMu+FfDoU2FKxqs4D5RRsVo
 uLrIngUrSEJARX11V0a62zPTQnNpzBJyMSZzmjy/F3/jtB0738vuyizTF+ybrd1lF6zP
 QxpbwLeWgADeL2sexiAOwxiBgEmblt3a7go63mRsuk3+E9EhjRIEgwVvuuLTeOU23C7X
 RgMQ==
X-Gm-Message-State: ANhLgQ0RrBybqfi1BXdCKL+jGHXknVMOsl+eJkLik5gxJo4KEcUpqt05
 7FPhMlSJ4BSM3Iegt+egHOBjqAAcsbmrxyGPktBS0w==
X-Google-Smtp-Source: ADFU+vvq8y3vX2Rs0miHfHjwdyhExQKefTwG+QQJ59Tj3hBOtqN7Uhwd5WQ1Lk32aHTpP7xRkohhiitU3DyGmy+hH+Y=
X-Received: by 2002:ad4:4364:: with SMTP id u4mr1947480qvt.58.1585357209313;
 Fri, 27 Mar 2020 18:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
 <20200325110533.GC28601@Air-de-Roger>
 <CAMmSBy_oX34t5388xYUxUE_jE56bpy=wKAfujZvR1-zaehDs3g@mail.gmail.com>
 <000c01d60417$d3cacad0$7b606070$@xen.org>
In-Reply-To: <000c01d60417$d3cacad0$7b606070$@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 27 Mar 2020 17:59:58 -0700
Message-ID: <CAMmSBy_3WK5bB=S4VC0ciH7yQWOJgJQ0xn3ntw2amrMZZyHRkw@mail.gmail.com>
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] PCIe IOMMU ACS support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 2:12 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Roman Shaposhnik <roman@zededa.com>
> > Sent: 26 March 2020 22:03
> > To: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Cc: xen-devel@lists.xenproject.org; Jan Beulich <jbeulich@suse.com>; Pa=
ul Durrant <paul@xen.org>;
> > Kevin Tian <kevin.tian@intel.com>; Andrew Cooper <andrew.cooper3@citrix=
.com>
> > Subject: Re: [Xen-devel] PCIe IOMMU ACS support
> >
> > On Wed, Mar 25, 2020 at 4:05 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > Adding the PCI and IOMMU maintainers.
> > >
> > > On Mon, Mar 23, 2020 at 01:55:01PM -0700, Roman Shaposhnik wrote:
> > > > Hi!
> > > >
> > > > I was going through how Xen support PCIe IOMMU ACS and
> > > > all I could find is this:
> > > >     https://github.com/xen-project/xen/blob/master/xen/drivers/pass=
through/pci.c#L608
> > > > which looks to me as an attempt of enabling ACS opportunistically,
> > > > but still proceeding forward even if it fails.
> > >
> > > That's correct AFAICT. Xen will try to enable some features, but will
> > > proceed normally if ACS is not available, or if some of the features
> > > are not implemented.
> > >
> > > Are you looking to ensure that all devices on the system have a
> > > certain feature enabled?
> >
> > My primary objective was to get some visibility into how Xen would
> > prevent two PCIe devices behind a common bridge from doing p2p
> > transactions (thus violating VM boundaries if those devices are
> > assigned to different domains).
> >
> > It looks like Xen simply trusts the hardware.
> >
> > > Can you provide some more details about what you expect of ACS
> > > handling?
> >
> > I was actually surprised not to see IOMMU groups in the style of what
> > VFIO https://www.kernel.org/doc/Documentation/vfio.txt
> >
>
> I did write a doc some time ago to present the issues facing Xen w.r.t. I=
OMMU and device pass-through. Hopefully you can see it at https://docs.goog=
le.com/document/d/12-z6JD41J_oNrCg_c0yAxGWg5ADBQ8_bSiP_NH6Hqwo/edit?usp=3Ds=
haring

Paul, this is *exactly* what I was asking about -- thanks for the link.

I guess the only question I have left is whether there was any follow up
regarding what you sketched out in the "IOMMU drivers" section?

Thanks,
Roman.

