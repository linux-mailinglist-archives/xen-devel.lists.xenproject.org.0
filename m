Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE72B10FD0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 18:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056393.1424608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyzo-0004Si-Mc; Thu, 24 Jul 2025 16:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056393.1424608; Thu, 24 Jul 2025 16:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueyzo-0004R8-Iu; Thu, 24 Jul 2025 16:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1056393;
 Thu, 24 Jul 2025 16:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ueyzn-0004QP-Fg
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 16:40:39 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed440c5f-68ac-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 18:40:37 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55a25635385so1365667e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 09:40:37 -0700 (PDT)
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
X-Inumbo-ID: ed440c5f-68ac-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753375237; x=1753980037; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR1fBdy9VQIlAEDB0tBrHuHaLpvBC6SbQWLXrk6leSs=;
        b=Tj/2qzcnxOTz+0C4bE4hIrN2eEjuSvFpxJymcopERYFtXDb6OgQ5sCbCIRvKRc3lml
         lqpxxyMlKmFJqlx2G9Ca0xQGWruWvJkcYfgcixWLDl2Bg7rOwOKdidclKQ85Tu9UKo3b
         9KhLZDn2EJWW2cQsoNAP+ULgsVo9wb35aO5l0Tf45Ih+ai4rF73V34i8XQsEXpNKj3XI
         DU7WcjmxfVRClntyWXvh6Q9gGDrb5DXQJfc8Q5mui1Utly70UyeSUxQsr8lWVeZR07Ko
         Hx26Cu65NOU0ewZv6zeWbe7bb5IbhPi4lPv/mlbWxnEt2yWJoDyUdpURlu7FtT9Hh+aD
         22sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753375237; x=1753980037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR1fBdy9VQIlAEDB0tBrHuHaLpvBC6SbQWLXrk6leSs=;
        b=Ei8KGoCGMKoEadyYPugb/JnpxJDG1PWiy77G8DA+VgIbaTIR43FihoRuXPBsfOFJYK
         gGRZzG+v9bir5jhSSLJHZIfqFXibFs2s3pgw2zCuoZlQrZzYdSlE9+ezmP1mpVVTr0RL
         /xp2oRSj3RxBvo0GekOoI5t1tOl3HS9F0BfPSQkJsHuQf/Kd/E9DUA9+N6gPcGyz2Sk2
         4VxBQe4zurlADYUQgp/X6Jqa8upaQl4Pd/vjTpY0mnnsAgljPE9hId2lWSwjS8/AsPXR
         COBjx0Lz3xEgN24BdyRmo8XtkhfS87P1kh6movQR+V+KUynybqlyiyTfjXq7Q862UOqC
         DLsA==
X-Gm-Message-State: AOJu0Yzbj89KWtNWcrL6HpzQk+jKu8r1PWjWoo+9/+sF268QlDZMWWsQ
	sKgXfuEa2zPC+W7So6NbdTSITu7VOPj3IWrf3o7onoLd4fe7ipGA8Fl0FotGWFlnfw6cdnyf2lX
	4naRvVaVk1dlskSn3fp5NmE1RjutaGug=
X-Gm-Gg: ASbGnctPJynQeBsJdL82smgMntz1y8uVRGd0TIUF3OxEZC52GITtaOlWFX9ziG0bXgF
	bSFvmDBuLFUCpJTgUWVyYdyZ1jt5zb5DXBVZ5SndgTzm/ehsRQX9b9fX4AOKVjKEFDIaugmtaCQ
	xtB+7vx/fOtcjw7jen23vWC2TpA0njxWKp9Yv0eag9RPoukt3Hhn/+bsSuFrHkS+XPhkNnnzNsz
	8L+ug==
X-Google-Smtp-Source: AGHT+IF5CP+wB1IBzkVd1rXDYfsQxfWwIJnRkrupdpq4Fu8T7kAkU/GHN3/NNv2zGmvESsWDSylOhmQgmMSoFUzMWHo=
X-Received: by 2002:a05:6512:158d:b0:553:2868:6357 with SMTP id
 2adb3069b0e04-55a513e8072mr2516175e87.50.1753375236351; Thu, 24 Jul 2025
 09:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753349108.git.mykola_kvach@epam.com> <48ea1dfb5bbcbc993332acb8508060d7cba342fc.1753349109.git.mykola_kvach@epam.com>
 <aII8kN1fmrLKb8ek@l14>
In-Reply-To: <aII8kN1fmrLKb8ek@l14>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Jul 2025 19:40:25 +0300
X-Gm-Features: Ac12FXzE3XhXsis4m1TatFidGcg9y1Ix3fIE_SYIibZEsTd4SQzSr6CFyzpRFRk
Message-ID: <CAGeoDV_dYzMRZtz8iPWy713dNifTL5Lw-+ZTbu+gnFOJ7wiOXg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] tools/xl: Allow compilation of 'xl resume' command
 on Arm
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anthony,

On Thu, Jul 24, 2025 at 5:01=E2=80=AFPM Anthony PERARD <anthony@xenproject.=
org> wrote:
>
> On Thu, Jul 24, 2025 at 12:40:57PM +0300, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > The "xl resume" command was previously excluded from Arm builds because
> > system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
> > implemented. On x86, this command is used for ACPI S3 suspend/resume.
> >
> > This change enables compilation of `xl resume` on Arm regardless of the
> > underlying implementation status, making the tool available for testing
> > and future feature support. The relevant libxl infrastructure and handl=
er
> > functions are already present and usable.
> >
> > The macro `LIBXL_HAVE_NO_SUSPEND_RESUME` has been renamed to
> > `LIBXL_HAVE_NO_SUSPEND` to better reflect the updated semantics.
> >
> > Note: This does not imply full system suspend/resume support on Arm.
> >       The `xl suspend` command still does not work on Arm platforms.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v6:
> > - Renamed macro from LIBXL_HAVE_NO_SUSPEND_RESUME to LIBXL_HAVE_NO_SUSP=
END
> >   to better reflect the scope of this change
> > - Applied cosmetic changes based on review feedback
> > ---
> >  tools/include/libxl.h     |  5 ++---
> >  tools/xl/xl.h             | 10 +++++-----
> >  tools/xl/xl_cmdtable.c    |  8 ++++----
> >  tools/xl/xl_migrate.c     |  4 ++--
> >  tools/xl/xl_saverestore.c |  4 ++--
> >  tools/xl/xl_vmcontrol.c   | 14 +++++++-------
> >  6 files changed, 22 insertions(+), 23 deletions(-)
> >
> > diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> > index d6b6e5d2dd..632264912a 100644
> > --- a/tools/include/libxl.h
> > +++ b/tools/include/libxl.h
> > @@ -1128,17 +1128,16 @@ typedef struct libxl__ctx libxl_ctx;
> >  #define LIBXL_HAVE_SIGCHLD_SHARING 1
> >
> >  /*
> > - * LIBXL_HAVE_NO_SUSPEND_RESUME
> > + * LIBXL_HAVE_NO_SUSPEND
> >   *
> >   * Is this is defined then the platform has no support for saving,
> >   * restoring or migrating a domain. In this case the related functions
> >   * should be expected to return failure. That is:
> >   *  - libxl_domain_suspend
> > - *  - libxl_domain_resume
> >   *  - libxl_domain_remus_start
> >   */
> >  #if defined(__arm__) || defined(__aarch64__)
> > -#define LIBXL_HAVE_NO_SUSPEND_RESUME 1
> > +#define LIBXL_HAVE_NO_SUSPEND 1
> >  #endif
>
> I'm sorry, if you remove LIBXL_HAVE_NO_SUSPEND_RESUME, you have to
> implement all the function listed. I'm pretty sure `libvirt` isn't going
> to build (on arm) if you remove that macro... Actually, libvirt is going
> to build, it's going to expect migration to work, and probably allow to
> try to migrate Arm VMs instead of bailing out early.
>
> I wonder what this LIBXL_HAVE_NO_SUSPEND_RESUME is for, since you don't
> make any changes to libxl (tools/libs/light), but only to program that
> make use of it.
>
> Looking at 3ac3817762d1 ("xl: suppress suspend/resume functions on platfo=
rms which do not support it.")
>     https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=
=3D3ac3817762d1a8b39fa45998ec8c40cabfcfc802
> it seems the real purpose was just an hint that migrate/suspend/saving
> aren't going to work on that platform.
>
> Looks like `xl resume` is a fairly new command which only makes use if
> libxl_domain_resume outside of migration, but the macro
> LIBXL_HAVE_NO_SUSPEND_RESUME was mostly a hint that migration doesn't
> work.
>
> So I think moving the `xl resume` command out of
> LIBXL_HAVE_NO_SUSPEND_RESUME would be good enough for this patch,
> without touching libxl.h.

Got it. I'll revert the patch to the previous version.
Thanks for the review and clarification -- much appreciated!

>
> Cheers,
>
> --
> Anthony PERARD

Best regards,
Mykola

