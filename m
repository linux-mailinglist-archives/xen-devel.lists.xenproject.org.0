Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DDEAEBCB8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 18:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027795.1402271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVBTe-0002fw-Is; Fri, 27 Jun 2025 15:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027795.1402271; Fri, 27 Jun 2025 15:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVBTe-0002dP-FQ; Fri, 27 Jun 2025 15:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1027795;
 Fri, 27 Jun 2025 15:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hlj0=ZK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uVBTd-0002dJ-BX
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 15:58:57 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e35821-536f-11f0-a310-13f23c93f187;
 Fri, 27 Jun 2025 17:58:56 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2eacb421554so11274fac.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 08:58:56 -0700 (PDT)
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
X-Inumbo-ID: a0e35821-536f-11f0-a310-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751039935; x=1751644735; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfhXgoSRbVGfllKxX873BxM5jQrG1yx9g1GhERgQaWc=;
        b=UCaIOy2zfdJaNXIlP5PzlP//DLiZlGC/3oY7K3VT/J/Gao9KwWYyEeIKEO9dnYbXxE
         f9OmpdIvrCYr9qrNqEnDvi/2JxjMD7OyzRSbC3F4X+9LrcoiI71YtIYJs4Cdu3k6nxFw
         3vKk1YmUPdBTsHuX5KAuenPBPNuhW9DBJvXYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039935; x=1751644735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfhXgoSRbVGfllKxX873BxM5jQrG1yx9g1GhERgQaWc=;
        b=XhM0QCt21J5ozXuvOvvu6KXRdYw6qYYH1Fxn63z85bVhEQ6jS88Px9ydrny2zkP9Kd
         Q0npRFVXcykKV1dPcJtsSlUg/VW3yJnRChcj5414ZerJvAEWaM5pJyP2v19q487qDS9x
         G7Qf338xwZGrkrNw4QjNOI4W/4JEw/PVSHMfuIcH/pqS/Ru6NeV8HIVAoiaXklaceqdr
         nrJKcSwINGWimNJyZ7YJaOcAt3c29WuZvpWU0aEj3lY/N69ekTkY2UPo7p6rSA7GHCQ7
         PFONN8Kd7alGK+WxlQCkkoesLnSZoTf5r7q5cZ2U16kdZYPrL0smbz5LRwMy3zZm5n6l
         4Ffg==
X-Gm-Message-State: AOJu0YwPMNM6+VuXAFfBpJT7hajaGInHHpyYGlAzFTbOVIr5yyey1DCH
	3DqgoB7V2wD2DdO/Bio8fzj8jaCiGrMtcKL+7BZCL8IOf8VQoev4KjKzJUdtldlhNfHDpRbM6ws
	461b8sGl6fo8a5MqaLdx9y5Mjwk/TGGNLqsbbTjwLQA==
X-Gm-Gg: ASbGncvsL+ejGFF+rmipZKRtXp7DuT8FJBkbAVYdZ0lFwaJa8In55mrivaFoX/pYS0f
	BTzQPZ+o8BjpowVN+PTBig7NWOglScXYOXDyNi3ScPcJqGV2vHpH0RtiDSzvE28fNVFoYc1Ic2c
	D/K8ThNYkrQgB6koN+4YI2VLypOXwl7QPMwaqrraP4
X-Google-Smtp-Source: AGHT+IGgUjoXN+/3708UY+Ls768JIcOYLySGYaBbKEywbE4g2hWExn4laNX0/JHfqBXrgcTPhe0TCimZXNri84J21/w=
X-Received: by 2002:a05:6870:b291:b0:2e9:1e11:3183 with SMTP id
 586e51a60fabf-2efed453abfmr2221668fac.8.1751039934787; Fri, 27 Jun 2025
 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
 <aFxbi6dnKjydzyNk@mail-itl> <CACHz=Zj=LsfbUVMkuKHx-xpy+NMQh13NUJ_-sPSq3OMwSurHPA@mail.gmail.com>
 <aF1hIARPp6a0wWmi@mail-itl> <CACHz=ZiVT-iSzEsG48NjJzJgdd=Ns-+dVTUTZKqVq78Py-kp2A@mail.gmail.com>
 <aF6onqQMlms2svXT@mail-itl>
In-Reply-To: <aF6onqQMlms2svXT@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 27 Jun 2025 16:58:43 +0100
X-Gm-Features: Ac12FXzak7oPGdewtWGyzrEKXVYaMKnYw6RoBdQr3Tg0wzl24EYksSfQvuxtDV0
Message-ID: <CACHz=Zi3THWcucw6ioZhKaeeDxM+e+E1rb-NvczG=mkVjD5qzg@mail.gmail.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with GRUB2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 3:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Jun 27, 2025 at 01:29:48PM +0100, Frediano Ziglio wrote:
> > On Thu, Jun 26, 2025 at 4:03=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Thu, Jun 26, 2025 at 09:12:53AM +0100, Frediano Ziglio wrote:
> > > > On Wed, Jun 25, 2025 at 9:26=E2=80=AFPM Marek Marczykowski-G=C3=B3r=
ecki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> > > > > > On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> > > > > > <frediano.ziglio@cloud.com> wrote:
> > > > > > >
> > > > > > > The combination of GRUB2, EFI and UKI allows potentially more=
 flexibility.
> > > > > > > For instance is possible to load xen.efi from a no ESP partit=
ion leaving
> > > > > > > a boot loader like GRUB2 taking care of the file loading.
> > > > > > > This however requires some changes in Xen to be less restrict=
ive.
> > > > > > > Specifically for GRUB2 these changes allows the usage of "cha=
inloader"
> > > > > > > command with UKI and reading xen.efi from no ESP (so no Devic=
eHandle
> > > > > > > set) and usage of "linux" and "initrd" commands to load separ=
ately
> > > > > > > the kernel (embedding using UKI) and initrd (using LoadFile2 =
protocol).
> > > > > >
> > > > > > I was forgetting. If somebody wants to test "linux" and "initrd=
"
> > > > > > command with these changes be aware that GRUB currently has a p=
roblem
> > > > > > passing arguments, I posted a patch, see
> > > > > > https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.=
html.
> > > > > > I also have a workaround for this issue in xen but it would be =
better
> > > > > > to have a fix in GRUB.
> > > > >
> > > > > Can you tell more how to test this, especially the second variant=
? When
> > > > > trying to use GRUB linux or linuxefi commands on xen.efi, I get "=
invalid
> > > > > magic number" error.
> > > > >
> > > >
> > > > That's weird.
> > > >
> > > > Be the way. As usual I have a super complicated script that does ev=
erything.
> > > >
> > > > But to simplify:
> > > > - I compile xen (plain upstream plus my patches) with "make -C
> > > > ~/work/xen/xen -j O=3Dnormal MAP"
> > >
> > > Is there any that would be related to the "invalid magic" error? IIUC
> > > without your patches options will be mangled, but I don't think I get
> > > this far.
> > >
> >
> > I tried to do some changes and check the CI with your branch. Not hard
> > to reproduce and the test looks correct.
> > Looking at GRUB code I can see various "linux" command implementations
> > and it looks like yours is picking up i386-pc target and not
> > x86_64-efi one which is really odd to me.
>
> Indeed, very odd, I do pass -O x86_64-efi option explicitly...
>
> But also, when I do the test locally with grub 2.12 from Fedora, I get th=
e filename
> prefix:
>
>     error: ../../grub-core/loader/i386/efi/linux.c:387:invalid magic numb=
er.
>
> which does look like the efi variant.
>
> This is even more interesting, as this path does not exist in the
> upstream repository. It appears as it's _yet another_ linux loader added
> by Fedora package:
> https://src.fedoraproject.org/rpms/grub2/blob/rawhide/f/0213-Add-support-=
for-Linux-EFI-stub-loading.patch
> That code I think looks for some Linux-specific header with "EFI
> handover" pointer?
>

So, yet another "linux" loader :-(
I found that a bit crazy... Why not have a single "linux"
implementation calling different architecture specific functions? I
mean, some parts like arguments parsing and handling are pretty
common, the syntax should be the same. And is not the Linux booting
format already complicated enough to add another entry point format?

> I don't see exactly this patch in Debian package, but there are also
> some messing with the 'linux' command, so I guess it may be similar
> issue.
>
> If I use upstream grub directly, then the "linux" command indeed doesn't
> complain.
>
> So, it looks like major distributions use a patched grub version that
> changes behavior of "linux" command. IIUC many of those patches are
> about hardening SecureBoot, and shim-review kinda suggest using patched
> version (many of the submissions explicitly mention the at least patch
> grub for NX). So, I think this needs figuring out how to make your
> approach working with grub flavor that is actually used by SB-enabled
> distributions...
>

We (xenserver) would like to provide booting using separate
hypervisor, kernel and initrd.
Using "linux" was an old discussed option which had a nice usage.
The merged patches allow to have a fully UKI file bundling kernel and
initrd loaded from no-ESP partition which is nice to have.
For the final solution I was thinking about using "xen_hypervisor" and
"xen_module" already present for ARM. From the user perspective is
surely less confusing than using "linux" to pass something which is
not Linux.

Frediano

