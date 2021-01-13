Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991602F4F1F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 16:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66592.118340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziO2-0000ER-PV; Wed, 13 Jan 2021 15:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66592.118340; Wed, 13 Jan 2021 15:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kziO2-0000Dw-MU; Wed, 13 Jan 2021 15:48:42 +0000
Received: by outflank-mailman (input) for mailman id 66592;
 Wed, 13 Jan 2021 15:48:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgOw=GQ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kziO1-0000Dp-Qg
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 15:48:41 +0000
Received: from MTA-05-4.privateemail.com (unknown [68.65.122.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8b35ade-7421-4a4e-b270-d066f8cf9ec5;
 Wed, 13 Jan 2021 15:48:40 +0000 (UTC)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 3192E60093
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 10:48:39 -0500 (EST)
Received: from mail-wr1-f45.google.com (unknown [10.20.151.243])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id F05AF60078
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 15:48:38 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t16so2630556wra.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jan 2021 07:48:39 -0800 (PST)
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
X-Inumbo-ID: b8b35ade-7421-4a4e-b270-d066f8cf9ec5
X-Gm-Message-State: AOAM531JxhgBzElwYJchxa30fdHNAcjHfhyC2ANw5nHChp59E3lyznQj
	1X4/5fMmL1j75njNwc5QSJT8SgMOgmwQecjZb/U=
X-Google-Smtp-Source: ABdhPJwjWjo5jHXG0RxcBLsp1PYAn4LIPbvBWGLG44gxGeQys8yGzCRiIjQoRBcFe63IrS9GF6hnokR96LEEVjIyhZc=
X-Received: by 2002:adf:f845:: with SMTP id d5mr3244215wrq.182.1610552918171;
 Wed, 13 Jan 2021 07:48:38 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhkNt+rvUZXtcc9BT4Rtf+kt-dR-LPfSt+Aj1o7ACWnfHg@mail.gmail.com>
 <20210113131809.nawfnyhrncojhfpo@Air-de-Roger>
In-Reply-To: <20210113131809.nawfnyhrncojhfpo@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 13 Jan 2021 10:48:02 -0500
X-Gmail-Original-Message-ID: <CABfawhkPNs=yV999rSPOgSvpi6OKSzUs3GsFEvT=iVxYKFBVOQ@mail.gmail.com>
Message-ID: <CABfawhkPNs=yV999rSPOgSvpi6OKSzUs3GsFEvT=iVxYKFBVOQ@mail.gmail.com>
Subject: Re: Inconsistent console behavior during HVM direct boot
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, amc96@cam.ac.uk, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Jan 13, 2021 at 8:18 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Tue, Jan 12, 2021 at 09:54:18PM -0500, Tamas K Lengyel wrote:
> > While direct booting a Linux kernel into an HVM VM no console output
> > is received if serial=3D"pty" is set in the VM config but the kernel
> > command line specifies "console=3Dhvc0". If "console=3DttyS0" is specif=
ied
> > then the console output is received as expected. Conversely, if the
> > serial line is commented out in the VM config but hvc0 is set on the
> > kernel command line then it also works. It's unclear whether this
> > behavior is expected or not, after some discussion it sounds like all
> > kernels ought to understand hvc0 irrespective of the serial=3D"pty" lin=
e
> > being set or not. Reporting this in case someone has more insight
> > and/or inclination digging into this.
>
> So I think this is (as confusing as it might seem) the intended
> behavior.
>
> Using serial=3D'pty' exposes an emulated serial device to the guest and
> 'xl console' will fetch the output from that device by default. So on
> the Linux kernel command line you need to use console=3DttyS0 in order
> to point Linux to use the emulated serial device.
>
> however if serial=3D'pty' is not used, there will be no emulated serial
> device exposed to the guest, only the PV console, and that's what 'xl
> console' will attach to in that case. You then need to point the Linux
> kernel to use the PV serial console, by adding the console=3Dhvc0
> command line.
>
> I'm unsure how to clarify this, maybe some additions could be made to
> the xl.cfg man page to note that using serial=3D'pty' will add an
> emulated serial device to the guest, and that by default 'xl console'
> will fetch the output from that device instead of the paravirtualized
> console?

Hi Roger,
that explanation makes sense, I wasn't aware that there would be two
different console's available to the guest if serial=3D"pty" is set and
that xl would pick on over the other. So adding that to the
documentation would be helpful. Perhaps also pointing out under what
scenario is the emulated console vs the pv console is useful. I assume
the point of the emulated console would be to get console output from
software that's not Xen-aware (like GRUB)?

Thanks,
Tamas

