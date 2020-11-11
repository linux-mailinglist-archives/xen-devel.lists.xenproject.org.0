Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271312AE6B6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 04:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24162.51275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcgMj-0005Im-CJ; Wed, 11 Nov 2020 03:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24162.51275; Wed, 11 Nov 2020 03:00:09 +0000
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
	id 1kcgMj-0005IP-46; Wed, 11 Nov 2020 03:00:09 +0000
Received: by outflank-mailman (input) for mailman id 24162;
 Wed, 11 Nov 2020 03:00:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFwf=ER=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1kcgMh-0005IK-47
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 03:00:07 +0000
Received: from mail-oi1-x234.google.com (unknown [2607:f8b0:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ab605cd-4c71-4ab4-a227-ac092ff6790c;
 Wed, 11 Nov 2020 03:00:05 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id d9so555624oib.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 19:00:05 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qFwf=ER=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
	id 1kcgMh-0005IK-47
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 03:00:07 +0000
X-Inumbo-ID: 7ab605cd-4c71-4ab4-a227-ac092ff6790c
Received: from mail-oi1-x234.google.com (unknown [2607:f8b0:4864:20::234])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7ab605cd-4c71-4ab4-a227-ac092ff6790c;
	Wed, 11 Nov 2020 03:00:05 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id d9so555624oib.3
        for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2020 19:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=beEpBTWagLBOc/O+uVfh7++man2OBoWOZC896ZVA0ZQ=;
        b=pHl011s1kqxQ4UQY/epoecoMeoxXwARF14NhVxLqOHiLSa8zBUo/Z84FUKwy91Dcx1
         UsJfq2q1sXnqoMtz3/QV9o+9hpkXWM6rjlgkbMCUUf/GmhHcG6N/S+5qTPX2z2ALzPfu
         otxYJsDaKvBmI2McDSaayk/RQ0Bwor09M/kdLyxJg7AeT3wyNV5hOn3vgfCKLsw/tyc4
         GBXkkOuOn0o/Xq42hzeiNfutAkLIfE/f0RClIyctmCeBYCaeCrcFrnG4ZrgiF9qLKz5j
         yDc9RTZCKk95AHl1V9I5lMUXN+p+ldatDwVXofdLSZ9DdYh4MdRncJrzhhZXoplsUtjz
         aS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=beEpBTWagLBOc/O+uVfh7++man2OBoWOZC896ZVA0ZQ=;
        b=q5G2KsUacttEyjnNz0s68hM4N/pII4GuzYVqYBEpXb1YqkrEX7QvSOIKPyxIqpbQSr
         gg1ujPbIGRF4Bk0dBu2M+CftGWRMhSnF6iWelqbWvGWYTW7hkYdDbFpNDhtyv08Epuko
         WDf0zth3y/m952RMYgtRJdrOEb34OZ34eUhQeqHcXSbheRdtbd5rcxH3g7rwV1FvYeNh
         6PWCv+KRDRrHyvWv5qRfUYJc/OYuavwD7wKWkDNZZ/oCErvdSEPdmw1XOyK4zItzkkil
         iAy0aoyBxe4E37wXnagcu/WNEEzdPjhAm8O1nYqDOxwfGqKhghhM6uNJSuyqcnDloCOg
         dZCQ==
X-Gm-Message-State: AOAM532O6iH4y9O2AvRGuz9SrwBed++izFlQ5RaAVmH9+MlMHffYVaym
	RIhGKZtDBse1PbAc8cT/YMvHkHSTUdBABPgnO/eRFIhG8aZEBA==
X-Google-Smtp-Source: ABdhPJxovtd3/lcT+kwqCBUQ1hvE1nmjWnP6LQrdvfLuhTvqvKS3vzVGQm4sIONRRYiA9oxY/0CNVpo88hJjoBdwb1Y=
X-Received: by 2002:aca:d941:: with SMTP id q62mr844936oig.33.1605063605402;
 Tue, 10 Nov 2020 19:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20201022021655.GA74011@mattapan.m5p.com> <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com> <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com> <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com> <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com> <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
 <20201028015423.GA33407@mattapan.m5p.com> <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
 <e885b2a9-f6ea-e224-b906-125936cfe550@suse.com> <alpine.DEB.2.21.2010291255070.12247@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010291255070.12247@sstabellini-ThinkPad-T480s>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 10 Nov 2020 18:59:53 -0800
Message-ID: <CACMJ4GZfXkJhGi5uGhA=Ke4y5d4ukfoaAh9r-BSOs84QBX-Ztw@mail.gmail.com>
Subject: Re: Xen on RP4
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Julien Grall <julien@xen.org>, 
	Roman Shaposhnik <roman@zededa.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Rich Persaud <persaur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 12:58 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 29 Oct 2020, J=C3=BCrgen Gro=C3=9F wrote:
> > On 29.10.20 01:37, Stefano Stabellini wrote:
> > > On Tue, 27 Oct 2020, Elliott Mitchell wrote:
> > > > On Mon, Oct 26, 2020 at 06:44:27PM +0000, Julien Grall wrote:
> > > > > On 26/10/2020 16:03, Elliott Mitchell wrote:
> > > > > > On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
> > > > > > > On 24/10/2020 06:35, Elliott Mitchell wrote:
> > > > > > > > ACPI has a distinct
> > > > > > > > means of specifying a limited DMA-width; the above fails, b=
ecause
> > > > > > > > it
> > > > > > > > assumes a *device-tree*.
> > > > > > >
> > > > > > > Do you know if it would be possible to infer from the ACPI st=
atic
> > > > > > > table
> > > > > > > the DMA-width?
> > > > > >
> > > > > > Yes, and it is.  Due to not knowing much about ACPI tables I do=
n't
> > > > > > know
> > > > > > what the C code would look like though (problem is which docume=
ntation
> > > > > > should I be looking at first?).
> > > > >
> > > > > What you provided below is an excerpt of the DSDT. AFAIK, DSDT co=
ntent
> > > > > is written in AML. So far the shortest implementation I have seen=
 for
> > > > > the AML parser is around 5000 lines (see [1]). It might be possib=
le to
> > > > > strip some the code, although I think this will still probably to=
o big
> > > > > for a single workaround.
> > > > >
> > > > > What I meant by "static table" is a table that looks like a struc=
ture
> > > > > and can be parsed in a few lines. If we can't find on contain the=
 DMA
> > > > > window, then the next best solution is to find a way to identity =
the
> > > > > platform.
> > > > >
> > > > > I don't know enough ACPI to know if this solution is possible. A =
good
> > > > > starter would probably be the ACPI spec [2].
> > > >
> > > > Okay, that is worse than I had thought (okay, ACPI is impressively
> > > > complex for something nominally firmware-level).
> > > >
> > > > There are strings in the present Tianocore implementation for Raspb=
erry
> > > > PI 4B which could be targeted.  Notably included in the output duri=
ng
> > > > boot listing the tables, "RPIFDN", "RPIFDN RPI" and "RPIFDN RPI4" (=
I'm
> > > > unsure how kosher these are as this wsn't implemented nor blessed b=
y the
> > > > Raspberry PI Foundation).
> > > >
> > > > I strongly dislike this approach as you soon turn the Xen project i=
nto a
> > > > database of hardware.  This is already occurring with
> > > > xen/arch/arm/platforms and I would love to do something about this.=
  On
> > > > that thought, how about utilizing Xen's command-line for this purpo=
se?
> > >
> > > I don't think that a command line option is a good idea: basically it=
 is
> > > punting to users the task of platform detection. Also, it means that
> > > users will be necessarily forced to edit the uboot script or grub
> > > configuration file to boot.
> > >
> > > Note that even if we introduced a new command line, we wouldn't take
> > > away the need for xen/arch/arm/platforms anyway.
> > >
> > > It would be far better for Xen to autodetect the platform if we can.
> > >
> > >
> > > > Have a procedure of during installation/updates retrieve DMA limita=
tion
> > > > information from the running OS and the following boot Xen will fol=
low
> > > > the appropriate setup.  By its nature, Domain 0 will have the infor=
mation
> > > > needed, just becomes an issue of how hard that is to retrieve...
> > >
> > > Historically that is what we used to do for many things related to AC=
PI,
> > > but unfortunately it leads to a pretty bad architecture where Xen
> > > depends on Dom0 for booting rather than the other way around. (Dom0
> > > should be the one requiring Xen for booting, given that Xen is higher
> > > privilege and boots first.)
> > >
> > >
> > > I think the best compromise is still to use an ACPI string to detect =
the
> > > platform. For instance, would it be possible to use the OEMID fields =
in
> > > RSDT, XSDT, FADT?  Possibly even a combination of them?
> > >
> > > Another option might be to get the platform name from UEFI somehow.
> >
> > What about having a small domain parsing the ACPI booting first and use
> > that information for booting dom0?
> >
> > That dom would be part of the Xen build and the hypervisor wouldn't nee=
d
> > to gain all the ACPI AML logic.
>
> That could work, but in practice we don't have such a domain today --
> the infrastructure is missing. I wonder whether the bootloader (uboot or
> grub) would know about the platform and might be able to pass that
> information to Xen somehow.

This is one of the functions envisioned for the Boot Domain in the
proposal to add DomB mode to dom0less[1], in the work developed by
Daniel Smith and I.

With DomB as much or as little of platform detection and initial
domain configuration will be possible from the Boot Domain. ACPI was
specifically discussed in the second DomB Design Session at this
year's Xen Summit[2].

Further information on this is available on the Xen wiki[3], thanks to
Rich Persaud, including links to the Summit presentation on DomB for
Xen System Boot, and the following discussion of that in the Design
Session[4], and specific questions can be raised in this thread.

thanks,

Christopher

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg00233.h=
tml
[2] https://www.youtube.com/watch?v=3DjlyWfdW6D-E&t=3D15m26s
[3] https://wiki.xenproject.org/wiki/DomB_mode_of_dom0less
[4] https://lists.archive.carbon60.com/xen/devel/592140

