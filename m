Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BBE2F549B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 22:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66771.118738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznk5-0003LW-2E; Wed, 13 Jan 2021 21:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66771.118738; Wed, 13 Jan 2021 21:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kznk4-0003L7-VR; Wed, 13 Jan 2021 21:31:48 +0000
Received: by outflank-mailman (input) for mailman id 66771;
 Wed, 13 Jan 2021 21:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kznk3-0003L2-BL
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 21:31:47 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b071c19-ceb3-4476-8b53-25670fe07b6d;
 Wed, 13 Jan 2021 21:31:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a12so4931738lfl.6
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 13:31:46 -0800 (PST)
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
X-Inumbo-ID: 9b071c19-ceb3-4476-8b53-25670fe07b6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dKH7QC73OjQJQZTsdfB5I9mTw+ZuUYuHgf27vKxzmmo=;
        b=szXHlZswN3xHfI0SrRIpIellrzuyoa7WJLoBUS51bm/b1zfUmCzj9gACXxqORRpV+V
         Xr/Q6qiOhT/OY189oGVkgHyIzhuXL+tPavxU0ifL67h+5zD6Bfj/MWkq61as4jMd3lxY
         dme1tpKXdp4Nz8lOuTFVSK7JMkNlivv1CeM936UTuzXe1tlJpDSHi46NyuoXistyU53n
         rBCSV6mkVSC6FEFzE2KX4MbDOU3yedgST8UDJJaVksd02EVSCEfXMNjtdyiBIVb8OFU9
         CQNypLqWEChPcUAdTABc6DQIR31ht/e9IiWndDRFJ/pmwmTklprq0jm0GU6sX7pgYMc5
         fuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dKH7QC73OjQJQZTsdfB5I9mTw+ZuUYuHgf27vKxzmmo=;
        b=WQWY9Njoo1cfDxT7VK2g2C/P37eBx/x5dCJUGZEQcZeX1XsG0UuOhz9+8ASGz4w4FX
         Pog1xUkZFJD8WHJakd6/9bBoUJHD/3n3fmrWPGO3/b+uXz4mR8Ep4zSj8SGvnyZyoKJG
         8haTAnA+SSejWQH1m7gGdmzQg1IIfucQczWnzerffo81biZmApzhqco6f/xtLDdqI2/n
         EaIrzqkB4oN7UnYO8Cwq8xYos5Toy9oKpzwWay5IeHYzeS5xWUCzj+QVavuH2wgZz5xi
         Lfqj7gdVZZuG9dUvSbs++zpWZndozO9xZE7yUANKxftRyCYedpxdwajaQdHZBCO83xc+
         NB7A==
X-Gm-Message-State: AOAM531FDBOajdksYlFf7PwvPPvjNJo6d5Vm5VkmNLy/Gyv3mYyM1ix4
	N4X07vfvpNPubpOF+MlRlqjYHIYpqR5003bQ8Rg=
X-Google-Smtp-Source: ABdhPJwb7MkCshyMOcpC8M1slvFhevGtERSTlInstRdWXhQGLbbw8syycPuEniFg9IdO+nRfD6k8tEcR0ZGlA3eiO+I=
X-Received: by 2002:a19:8110:: with SMTP id c16mr1662821lfd.150.1610573504973;
 Wed, 13 Jan 2021 13:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20210112173248.28646-1-roger.pau@citrix.com> <MWHPR11MB1886695BC900030C025DD09A8CA90@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210113131100.p5xiyfgtp5s5rktz@Air-de-Roger> <CAKf6xps-GOMSsYzDHf9wgyjDes0X4hnaq9vBsn02rCv-DadW8A@mail.gmail.com>
 <20210113180558.do2xq4iaur6kyuy4@Air-de-Roger> <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
In-Reply-To: <CAKf6xptFiFdh=Uwbia-6BOpB4_qO7h1PCST4WT-0BXTygssFaA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 13 Jan 2021 16:31:33 -0500
Message-ID: <CAKf6xpuTgdpqBx7AR8QUA8nJgn64X9ttZns2aSEcwjjvzqw_fA@mail.gmail.com>
Subject: Re: [PATCH] x86/dpci: remove the dpci EOI timer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Paul Durrant <paul@xen.org>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 1:34 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Wed, Jan 13, 2021 at 1:06 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
> >
> > On Wed, Jan 13, 2021 at 10:48:52AM -0500, Jason Andryuk wrote:

<snip>

> > > I have some laptops running OpenXT where the USB controller and NIC
> > > share an interrupt, and I assign them to different domains.  Qubes
> > > would hit this as well.
> >
> > Is there any chance you could try the patch and see if you can hit the
> > issue it was trying to fix?
>
> Would testing a backport to 4.12 be useful?  There were some file
> renames, but it looks to apply.  The only difference is the 4.12
> hvm_pirq_eoi hunk still has `(ent && ent->fields.mask) || `.  Maybe
> backport commit eb298f32fac5ac "x86/dpci: EOI interrupt regardless of
> its masking status" as well?

Ok, I added these two patches to OpenXT with Xen 4.12.

> Testing staging would take a little longer to make a machine available.
>
> I guess I'd also need to disable MSI for the two devices to ensure
> they are both using the GSI?

lspci in dom0 shows the USB xhci controller, iwlwifi, and e1000e
devices all with IRQ 16 and all with MSI disabled ("MSI: Enabled-").
The two linux HVMs run with (PV) linux stubdoms, and the HVM kernels
were started with pci=3Dnosmi.  Networking through the iwlwifi device
works for that VM while a mouse attached to the xhci controller is
also working in the second VM.  Is there something else I should test?

Regards,
Jason

