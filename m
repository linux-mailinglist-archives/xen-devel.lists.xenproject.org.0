Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB14ED9A5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296927.505612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtvv-00049W-Lk; Thu, 31 Mar 2022 12:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296927.505612; Thu, 31 Mar 2022 12:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtvv-000470-I3; Thu, 31 Mar 2022 12:29:47 +0000
Received: by outflank-mailman (input) for mailman id 296927;
 Thu, 31 Mar 2022 12:29:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR9h=UK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZtvu-00046u-8L
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:29:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f48b1ec-b0ee-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 14:29:45 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id w7so41215965lfd.6
 for <xen-devel@lists.xenproject.org>; Thu, 31 Mar 2022 05:29:45 -0700 (PDT)
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
X-Inumbo-ID: 3f48b1ec-b0ee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxuvaGq3+iBZe0xxrylfTY+iD67IJs3TfT41GrlrbmU=;
        b=KeDOsiw9bp1b6BQ/siwXjCYDqybFZTu4NN8IxvAQ4snztv517SzXXL23fQr+KIphij
         +of9N91YpZKu4oPBm454x+hpBrHsdm/hZA1EH86EGPj7BKU2oDqcka0aHh/IrmPiTzSj
         c8On5g/i040Ft4474rCZLLy7oxQqhC2n0zJCi+gAySO3dA/o0jufNmVX2y0X4zq8SiV8
         d7zkCtIXuVW3KO3rN0TkB/SBGr5urOLm4J+46VgM2N/Uhiilebh0w2Ab/T9M1YlaqTfa
         2iNNgikYidYxJ4CNNBn+dOb/7BVzbeEQpWqsty5L77kYdrCVapCGZ2i4cTS5PxHGf7mz
         OOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxuvaGq3+iBZe0xxrylfTY+iD67IJs3TfT41GrlrbmU=;
        b=f894X/jUuEZMhycTTbq7poxgFOQ2jNEsQPtnOwK2efYm1VAZyYslFL34+Wipq/FC3C
         2Wp/QA9HRvJPCr6kPq9wqAzqQcngekGbNuKMdVC1UDcaHurOTWostV8pVPl6t9DIdkWo
         6wvqGCRem4BXlUQvY/AcHJHnwCOuBk42ZM7vMBQi8OqJ1AHOvzM2nTYmro6T6lSa6YTD
         CMBAslceON8CWHvuQSm676L9tzvkN07yJqyHoxBoD4Ju3vZFpw+E8I26GORa1QiL6mcm
         XrcP+SoeOVx/i5gCnvyx1FBjxzm2VE/ZRRW/6RJBuPempD6LvJt4Vm288WrtAM8YvlzS
         7sNQ==
X-Gm-Message-State: AOAM5335Z+xZp12C2fWZxk5s0tgvhjq1Mh/YW0cSERqdQngEUsF3hiRq
	2MBR+UQH+Kwpf3hoko7XTawduqRUc/fsnJaIIuo=
X-Google-Smtp-Source: ABdhPJycSj2Y8xGAmmvUMnc1pxEgwP8kS84ETZul5dYZsEUGlG/Vi/rrAxw7TwI5z/8ckUutEsdo+T9qtS5R2bs6st4=
X-Received: by 2002:ac2:5504:0:b0:44a:2117:e6bb with SMTP id
 j4-20020ac25504000000b0044a2117e6bbmr10598930lfk.388.1648729784837; Thu, 31
 Mar 2022 05:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com> <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
 <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
In-Reply-To: <46a8585e-2a2a-4d12-f221-e57bd157dec6@netscape.net>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 31 Mar 2022 08:29:33 -0400
Message-ID: <CAKf6xpths4SX4wq-j4VhnXZnx0DW=468z3=9FYHso=Wy1i_Rsg@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Andrew Cooper <amc96@srcf.net>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 11:54 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>
> On 3/30/22 1:27 PM, Andrew Cooper wrote:
> > On 30/03/2022 18:15, Anthony PERARD wrote:
> >>
> >> Some more though on that, looking at QEMU, it seems that there's already
> >> a call to xc_domain_iomem_permission(), in igd_write_opregion().
> > This has been discussed before, but noone's done anything about it.
> > It's a massive layering violation for QEMU to issue
> > xc_domain_iomem_permission()/etc hypercalls.
> >
> > It should be the toolstack, and only the toolstack, which makes
> > permissions hypercalls, which in turn will fix a slew of "QEMU doesn't
> > work when it doesn't have dom0 superpowers" bugs with stubdomains.
>
> How much say does the Xen project have over the code
> in Qemu under hw/xen? I would not be against having libxl
> do the permissions hypercalls in this case instead of Qemu
> doing it. My test with Qemu traditional and this patch proves
> the permission can be granted by libxl instead of the device
> model.

Qubes patches libxl and QEMU, and they move the hypercalls to the
toolstack.  They are using linux stubdoms, and I think it works for
them.

QEMU:
https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/blob/master/qemu/patches/0015-IGD-fix-undefined-behaviour.patch
https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/blob/master/qemu/patches/0016-IGD-improve-legacy-vbios-handling.patch
https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/blob/master/qemu/patches/0017-IGD-move-enabling-opregion-access-to-libxl.patch
libxl:
https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.14/patch-fix-igd-passthrough-with-linux-stubdomain.patch
maybe this one, too:
https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.14/patch-libxl-automatically-enable-gfx_passthru-if-IGD-is-as.patch

Regards,
Jason

