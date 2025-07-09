Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8770CAFE422
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037979.1410514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRBV-0006Zk-Ed; Wed, 09 Jul 2025 09:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037979.1410514; Wed, 09 Jul 2025 09:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZRBV-0006XX-BZ; Wed, 09 Jul 2025 09:33:49 +0000
Received: by outflank-mailman (input) for mailman id 1037979;
 Wed, 09 Jul 2025 09:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLDI=ZW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uZRBU-0006XR-1X
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:33:48 +0000
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd66150-5ca7-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 11:33:47 +0200 (CEST)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-72c14138668so1916955a34.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 02:33:47 -0700 (PDT)
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
X-Inumbo-ID: cfd66150-5ca7-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752053626; x=1752658426; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFxnx0/Il4AeI26OwdPLiKXf/AZF6nwaENs91IFY1nk=;
        b=lmoOjImGy0LGj9e5W5Uf2KF83CvzPNDjBVGFdyQARTdLcy76ouxalx86FesnGDMv7l
         B3ggY41lO36LUZ2se9Mc4W7LhjjpX4Q9/J5plm3wcpY1Kqr4Gi2FWrMXMj/h+hbtMfQI
         Yb/7XxV3ul+u4RnhTUzZDDplL5HDaLZS9W59w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053626; x=1752658426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFxnx0/Il4AeI26OwdPLiKXf/AZF6nwaENs91IFY1nk=;
        b=syFd2tTYH3qT0wNwpr5tvhWdjTEPMQzztNphDSJz/d1xWMfH/JZ6zfQTmRccyK1Esx
         ZecE8XZwdW+uU5vTpHIJmjN+fPvMxAPq7iXiH6NIPtaGx4IlKCoEMvn6N19K3v7/kNm4
         M486lhvpvmV16WhQzd6leuzCQvcD7BjIbeF7JmgXZ7A7tVAcBWDAtp1oegLL0O9sTnuM
         KQ/I26Z+fGVzSPFKvWGeAVcw6gTNrRpzQhrMirQMB8D85KWioiKieES131GidNErMn8T
         +5WEZue82VC9Is1P+5AZbjW8szO50cahG5Tixp/WLVrd3WGprLaqK+MSUtLlYYm7e7T9
         zQ4w==
X-Gm-Message-State: AOJu0YxVH/+iw5so3lnFk64kIG194bLml3Mk/RZx8+FhVT+U+iXmSx+t
	030Zp3ajTGcVqVcFt9ujA7PXqku6hm5myPgAZKuoHLZiWEuhR2RKXBz/s4dJ2xJg4tkULwFmS7j
	a2ULCsHy64Dqgej4FizmZ46Bed1k3027Bv7l7UFkF6Q==
X-Gm-Gg: ASbGnct3tsjld/lQsNc8G6eSY0GHtH1YbB4Op0e5UJJqzPxNQ+hOPgbSQuuvwXq1xV8
	cdNyB0CUgk+CWEKPczz9HAIuN/Tzdw8FIwWflCUAO0xHCPI0NriscPK/zuVMaDYiQo3HF68v1uv
	UjVaF1at6vdUC+54EiTcl9nCIrr3GCRGSLfEhvroCD3g==
X-Google-Smtp-Source: AGHT+IHwm4MVpmMPiYZwpF8D0NQMIC+MW/irf3Gn5U0uJTDNGjoeRMQwzaxtx+4b40ZBV0EgQqh6UlsNh03VDD22w6A=
X-Received: by 2002:a05:6808:1794:b0:40b:441e:3603 with SMTP id
 5614622812f47-412bab9b330mr1201422b6e.14.1752053625737; Wed, 09 Jul 2025
 02:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl> <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl> <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
 <aF6onqQMlms2svXT@mail-itl> <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>
 <aF7EsHeJ1GAwvrDz@mail-itl> <CACHz=Zhqj2q2hqj4cees22OWmiNrXiGSkJPFJT96WWFpLY31Xw@mail.gmail.com>
 <aGP8WpJf6pKfTZbK@mail-itl>
In-Reply-To: <aGP8WpJf6pKfTZbK@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Jul 2025 10:33:34 +0100
X-Gm-Features: Ac12FXzNbAnvSDg61REbaWTcT6FCW4AHlXklAQMCLKWnVjE499cb-jgKYyg2hFY
Message-ID: <CACHz=Zit+kTYj_KJH6Lx8tBo09jwWSwQctjct9F2tLO8tFCAgQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 4:18=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Jul 01, 2025 at 03:31:19PM +0100, Frediano Ziglio wrote:
> > On Fri, Jun 27, 2025 at 5:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Fri, Jun 27, 2025 at 04:58:43PM +0100, Frediano Ziglio wrote:
> > > > On Fri, Jun 27, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3r=
ecki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > > So, it looks like major distributions use a patched grub version =
that
> > > > > changes behavior of "linux" command. IIUC many of those patches a=
re
> > > > > about hardening SecureBoot, and shim-review kinda suggest using p=
atched
> > > > > version (many of the submissions explicitly mention the at least =
patch
> > > > > grub for NX). So, I think this needs figuring out how to make you=
r
> > > > > approach working with grub flavor that is actually used by SB-ena=
bled
> > > > > distributions...
> > > > >
> > > >
> > > > We (xenserver) would like to provide booting using separate
> > > > hypervisor, kernel and initrd.
> > > > Using "linux" was an old discussed option which had a nice usage.
> > > > The merged patches allow to have a fully UKI file bundling kernel a=
nd
> > > > initrd loaded from no-ESP partition which is nice to have.
> > > > For the final solution I was thinking about using "xen_hypervisor" =
and
> > > > "xen_module" already present for ARM. From the user perspective is
> > > > surely less confusing than using "linux" to pass something which is
> > > > not Linux.
> > >
> > > In which case, loading initrd using Linux-specific grub part doesn't
> > > make sense, no? Or is that xen_module going to use similar mechanism?
> > >
> >
> > Yes, the idea is to reuse this mechanism instead of reinventing the whe=
el.
> >
> > You can see the problem from 2 perspectives:
> > - User usage;
> > - Boot protocol.
> >
> > From the user usage the user (possibly human, but at least the
> > configuration should be user understandable) the usage of "linux" to
> > load something which is not Linux is confusing although in the past
> > the "kernel" command was abused to load lot of things, and a lot of
> > things presented themselves as Linux kernels to be loaded by different
> > boot loaders (even Syslinux had this habits).
> >
> > From the boot protocol perspective. A boot loader loads some binaries
> > and uses some boot protocol to pass the control and different
> > information to the "next" binary. Information can include
> > - command line
> > - modules
> > - memory information
> > - video information
> > - ...
> > EFI supports by itself memory and video information, can carry a
> > string (so the command line) but lacks module information. Here came
> > all a set of way to pass modules, specifically:
> > - multiboot 1 and 2
> > - GRUB LoadFile2
> > - device tree (ARM)
> > Multiboot does not work very well with PE (the protocol is designed
> > for ELF or binary/raw loading) so we are trying to move away from it.
> > Device tree (used by xen_hypervisor and xen_module GRUB commands) is
> > ARM specific.
> > What is left (without adding a new method) is LoadFile2. So we are
> > using this way to pass additional modules. Just added a new media GUID
> > to pass also the kernel, not only initrd (at the moment the GRUB
> > changes are very hacky but the protocol is the same).
>
> Ok, so the plan is to use GRUB LoadFile2 as a mechanism to load initrd
> (and maybe kernel too?) for EFI boot on x86. This in itself sounds fine
> for me.
> The part that is worrying for me is interaction of the context in which
> this is introduced, with various downstream GRUB forks (IMO a
> "distribution package" that applies 200+ patches should be called this
> way, it isn't just a "package" anymore). A large part of those patches,
> both in Fedora and in Debian is related to SecureBoot support. Using
> patched GRUB is also kinda recommended as part of getting Microsoft to
> sign the shim package (the shim-review process). Now, if the LoadFile2
> approach is introduced as part of making Xen SecureBoot-ready, but it
> does not work with a GRUB version that is supposed to be used with
> SecureBoot I see a problem. I'm not sure exactly where the issue is
> (could be something about how our xen.efi looks like, but could be also
> a downstream GRUB issue), but IMO it's worth at least figuring out where
> the issue is (and whether it's just a bug, or some intentional
> behavior - possibly to comply with some SB requirements). To avoid
> situation where the version that is made to be SecureBoot-ready won't
> actually be bootable by any SecureBoot-ready bootloader...
>

Posted patches for Xen upstream, see
https://lists.gnu.org/archive/html/grub-devel/2025-07/msg00051.html.
LoadFile2 at the moment (master branch GRUB version) has nothing to do
with Xen but loading Linux PE kernel using standard EFI entry point
(which is wanted in case of secure boot). LoadFile2 seems supported
both by official GRUB and by patched distro versions.
About why Fedora "linux" command is not able to load our xen.efi it
appears there are more checks on kernel binary. That's why I prefer to
use the "xen_hypervisor" command, even from the user perspective it is
more clear we want Xen hypervisor.

Frediano

