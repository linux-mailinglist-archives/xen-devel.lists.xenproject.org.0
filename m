Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF020294DB0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 15:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10081.26571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVEII-0007uT-24; Wed, 21 Oct 2020 13:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10081.26571; Wed, 21 Oct 2020 13:36:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVEIH-0007u4-Us; Wed, 21 Oct 2020 13:36:45 +0000
Received: by outflank-mailman (input) for mailman id 10081;
 Wed, 21 Oct 2020 13:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kVEIG-0007tz-FK
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:36:44 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 638910aa-936d-4132-9e20-1a64d75b6c20;
 Wed, 21 Oct 2020 13:36:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a9so3139576lfc.7
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 06:36:43 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=286h=D4=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kVEIG-0007tz-FK
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 13:36:44 +0000
X-Inumbo-ID: 638910aa-936d-4132-9e20-1a64d75b6c20
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 638910aa-936d-4132-9e20-1a64d75b6c20;
	Wed, 21 Oct 2020 13:36:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a9so3139576lfc.7
        for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2020 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lrH3D/+6YhDxpCFWKiukOFeDa/kuA2Z9B0hdudtFyXU=;
        b=CfWtwJB9GIYMeENoIM+rvSb94AJ/unbe3PgvR1hVri27vuz5zqfvjBCKlPzqUK6vK5
         Rfk9JTBIfTvNZaEDrDSdKBOJ0I3PIkO2FHm75nbXfem6jJe5PrEvs6ViMk2zVhxgO7Qs
         6JElLj1A6/m8z1p3nNM/0Q/MX9FbLR6avS1FXkr5UIZk94RM8AXEoWKT3gA5QkQQrAsJ
         rzajGxhdtWLxG0Az6YaO9G50j1+QpSt0FwtVyXOff1Q2OOcBC/pmO5FC1fFK3A3Fyl6/
         eXbthKKY/9YghsZApbck0oVGiGt3BdJgIm4XNusp5pUWMSuCAquhzko5Yh5phlO40G6f
         DiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lrH3D/+6YhDxpCFWKiukOFeDa/kuA2Z9B0hdudtFyXU=;
        b=s66kk8/uGhDyjGczjHzvvaLtjsraGGYXGVlG9GSK3L3uOvPiPcNFSSz/I5v9NmGNH1
         +8Kwac6pbTTcFcX04CuwwXwDfSkf7ylgCgB1QaCCaLP5d/zd45ZPOpAKQg7qd2vdR81w
         yROK6rFVTW2om1ukjZ6s+SONyhp49pahXFKkY2ypOiaswPWDbdtfsecFYnqXV/pf3Gvv
         DzQYxGQl+wnHezcCs4zNFmdWRR0Zmk89PaR4okU2eWflAgAPsVdCAMd/hIF0AxgiNoDF
         4/8jALV3q+KBzToo2Le1mrAYdvrXZTMqdrqWPx9mHN0C3cnrwbUBB2LYS6iEeCCXWhA+
         lzOg==
X-Gm-Message-State: AOAM530ZG85e/MPSFFAg5V5RtW1FCNzhqKeg9AZrqHN79ajfj7lZC2Zy
	nv0Ym0di8sxYmcCAKTyWEDGyWYSOfAn+H9wyDPE=
X-Google-Smtp-Source: ABdhPJwaw0B2BxohZx2W/5ekhIK+Zik2kh8+yEatERPJMG5UG0JGyrU6+fQrIXg1TmtzU3mrOH1+BLaZsvep/tAuT6k=
X-Received: by 2002:ac2:42ce:: with SMTP id n14mr1243449lfl.412.1603287402490;
 Wed, 21 Oct 2020 06:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger> <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
 <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com>
In-Reply-To: <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 21 Oct 2020 09:36:30 -0400
Message-ID: <CAKf6xpvKiWiU5Wsv2C1EiEFr77nMZTd+VHgkdk7qcKw1OFD8Vg@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 8:53 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.10.2020 14:45, Jason Andryuk wrote:
> > On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> >> Hm, it's hard to tell what's going on. My limited experience with
> >> IOMMU faults on broken systems there's a small range that initially
> >> triggers those, and then the device goes wonky and starts accessing a
> >> whole load of invalid addresses.
> >>
> >> You could try adding those manually using the rmrr Xen command line
> >> option [0], maybe you can figure out which range(s) are missing?
> >
> > They seem to change, so it's hard to know.  Would there be harm in
> > adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
> > 0xff,ffff,ffff )?  Maybe that would just quiet the pointless faults
> > while leaving the IOMMU enabled?
>
> While they may quieten the faults, I don't think those faults are
> pointless. They indicate some problem with the software (less
> likely the hardware, possibly the firmware) that you're using.
> Also there's the question of what the overall behavior is going
> to be when devices are permitted to access unpopulated address
> ranges. I assume you did check already that no devices have their
> BARs placed in that range?

Isn't no-igfx already letting them try to read those unpopulated addresses?

Looks like all PCI BARs are below 4GB.  The graphics ones are:
00:02.0 VGA compatible controller: Intel Corporation Device 3ea0 (rev
02) (prog-if 00 [VGA controller])
    Subsystem: Dell Device 08b9
    Flags: bus master, fast devsel, latency 0, IRQ 177
    Memory at cb000000 (64-bit, non-prefetchable) [size=3D16M]
    Memory at 80000000 (64-bit, prefetchable) [size=3D256M]

Yes, I agree the faults aren't pointless.  I'm wondering if it's
something with the i915 driver or hardware having assumptions that
aren't met by Xen swiotlb.

Regards,
Jason

