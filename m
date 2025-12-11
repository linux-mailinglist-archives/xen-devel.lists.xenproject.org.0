Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F2BCB5C16
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183993.1506553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfRa-0004NM-7F; Thu, 11 Dec 2025 12:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183993.1506553; Thu, 11 Dec 2025 12:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfRa-0004Lq-4M; Thu, 11 Dec 2025 12:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1183993;
 Thu, 11 Dec 2025 12:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTfRY-0004Lj-Q2
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:06:48 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd9d0f0a-d689-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 13:06:46 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-37a33b06028so34991fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:06:46 -0800 (PST)
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
X-Inumbo-ID: dd9d0f0a-d689-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765454806; x=1766059606; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbGBt/2aTcUBzV2qgSvTqRAluVntdo6PYZ2c9n6/i7w=;
        b=Sw9bDDvcnoWqF2uY2hMDtfZzEZSuRUK7kOtpIMk1UWAZftRuH33vkFdHgu3Q0NYWH2
         m9je4frbIwdxMj8c0e80avk5zk3cp5UjJ8IXQLWEFn8yNvn2OcQBeneyaoR+Y+Fhs0WN
         m4x6NeYO+hLbPAMv2UlZ9j9LqR4Q7cqMNDJaRE8P2ix/QNx4rIV/31BPz6g7uutFH3UX
         cWyS/VgVZrEFGZVT4grJ6cc37QMuxtm4oaXE2dVrOMERP2KFgFT6a5sgzU6STFVirur+
         MoXyKytg8MgVv4NFgFCiSexL02Y/WWJOoiF0GskqcTbz34OMg9xZmNj/ANjltsr3TUNT
         2NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765454806; x=1766059606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbGBt/2aTcUBzV2qgSvTqRAluVntdo6PYZ2c9n6/i7w=;
        b=QyTrdn1NmLL9FhL10v7Wfa5RWDXzo0xEmIFEbZMgzz2ZN7SI2FpaBc/v8yj1k6Yu9l
         akkG+c3D/ew3WbZcpAEMElEvHXGzb13D06zh6oKUyNpIIqU/FZMTCHiGYfNEjUhqm+pj
         JkiDlmsRM3+U7+V6s7J40XgKYJY2mtd+fKFbK5h2Kg6ycY0f3yaAV8pOx9Pu5DosQISF
         J4KO0uKVEJhaH+elm+b0LkXfXfiUhwsE9l/Wc7fnu9vfQbsMxiLL3/zzNtXp7xFi7HNi
         oxN0+9KEbPImJzZxhx2vsEns9dLs5zux2WtYTJznN+Yz1FyIxKkIZ3Hp3cuCw23tWNTF
         +Hiw==
X-Gm-Message-State: AOJu0YxTdLX+NwiYKPeAzG1hPLR+/s3lqC+ugbkwtjZZpXI4Si5mIzVB
	tsCltizjdbQvthib/tdoQbM+1fDcsDCaSf1ESB7cH/T+E9/1BIfpXbj1FADd7f7+QQU3MqLPcBM
	/keyy1aJtntKUiKyy42QTHXlbJcAwfwY=
X-Gm-Gg: AY/fxX4BhP7haYm2gKLjPr1KWPrVYJ7OX02LzWlgzZ3aHZBTiL4hWdHqJHctji5YzbD
	UUsLKh82xBWG8YWvudj/PahNQH5/aZbJwUmveCWMxcJn++CrKi4yczTHaktUF129P/y1NOBQ6bt
	vSppZSevPxN2wr10ouU3DvK0PCBz2G8x1hOgIfOBiBpiqMlbcMAP0GCrVq0CMusVmVEOS/ANOOd
	iZs6I5sZJGR/Of/iitH2Y1jrr/h6ladsaycARTZQ+RXQMQR8+TXvUCe0ozzFsDO6ZkTDWI=
X-Google-Smtp-Source: AGHT+IH6zI8Ba4uk5nIn6F60221uT6K0LkyrESf/Vcm3b57S6+vZt4VYeszWypxJIdqgAbLHeg1uw2kYSFXhRTkTu5E=
X-Received: by 2002:a05:6512:114f:b0:595:910c:8ee9 with SMTP id
 2adb3069b0e04-598ee4c1ceamr1643297e87.37.1765454805832; Thu, 11 Dec 2025
 04:06:45 -0800 (PST)
MIME-Version: 1.0
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com> <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
In-Reply-To: <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 11 Dec 2025 14:06:32 +0200
X-Gm-Features: AQt7F2qPD528PAzULfqjZ3MqN3_NgqidJlMwV6sr3WJA7osTIK_UTeGv28K50iU
Message-ID: <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 1:44=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> On Thu, Dec 11, 2025 at 1:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> w=
rote:
> >
> > On 11.12.2025 11:29, Mykola Kvach wrote:
> > > While working on an arm64 s2ram series for Xen I have hit what looks
> > > like very strange behaviour in symbols_lookup() as exercised by test-=
symbols.
> > >
> > > The series is in the branch referenced at [1]. All patches there exce=
pt
> > > the last one build and pass CI; adding only the last patch makes the =
CI
> > > job referenced at [2] start failing.
> > >
> > > Note that the tests in that job are built without CONFIG_SYSTEM_SUSPE=
ND
> > > enabled, so most of the code introduced by the s2ram branch is not
> > > compiled at all for that configuration. That is why I initially did n=
ot
> > > expect my series to affect this job.
> > >
> > > To investigate, I tried to reproduce the issue locally. I downloaded =
the
> > > xen-config artifact from the failing job [3] and used it to build Xen
> > > with my local aarch64 cross compiler. With this local toolchain
> > > I could not reproduce the failure, and the resulting .config changed =
slightly
> > > compared to the job's config. The relevant part of the diff looks lik=
e this:
> > >
> > >     diff --git a/xen/.config b/xen-config
> > >     index 057553f510..44dcf6bacc 100644
> > >     --- a/xen/.config
> > >     +++ b/xen-config
> > >     @@ -3,11 +3,11 @@
> > >      # Xen/arm 4.22-unstable Configuration
> > >      #
> > >      CONFIG_CC_IS_GCC=3Dy
> > >     -CONFIG_GCC_VERSION=3D130300
> > >     +CONFIG_GCC_VERSION=3D120201
> > >      CONFIG_CLANG_VERSION=3D0
> > >      CONFIG_LD_IS_GNU=3Dy
> > >      CONFIG_CC_HAS_ASM_INLINE=3Dy
> > >     -CONFIG_CC_HAS_ASM_GOTO_OUTPUT=3Dy
> > >     +CONFIG_GCC_ASM_GOTO_OUTPUT_BROKEN=3Dy
> > >      CONFIG_FUNCTION_ALIGNMENT_4B=3Dy
> > >      CONFIG_FUNCTION_ALIGNMENT=3D4
> > >      CONFIG_ARM_64=3Dy
> > >
> > > So there is at least a difference in GCC version and asm-goto related
> > > Kconfig options between the CI environment and my local one.
> > >
> > > After that I tried rebuilding inside the same Docker image that GitLa=
b
> > > CI uses:
> > >
> > >     registry.gitlab.com/xen-project/xen/alpine:3.18-arm64v8
> > >
> > > When I build Xen in that container, using the same branch, the proble=
m
> > > reproduces in the same way as in the CI job.
> > >
> > > Even more confusingly, adding extra prints in test_symbols just befor=
e
> > > the calls to test_lookup() makes the problem disappear. This made me
> > > suspect some undefined behaviour or logic issue that is very sensitiv=
e
> > > to optimisation or layout changes.
> >
> > All symptoms described make me suspect you're hitting a problem we're
> > already in the process of hunting down. Can you please take [1], make
> > the small adjustment necessary to Arm's linking rule, and see whether
> > you get a build failure in the case where right now you get a boot time
> > crash? Of course no other changes to code or data layout should be done=
,
> > or else you may observe false negatives.
>
> I tested the issue with the provided patch, and it is still reproducible.

I also triggered a pipeline with the patch you provided on top of my
changes [1],
and it failed there as well. In fact, it exposed additional problems
in other jobs.

[1] https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2209=
153728

>
> This is my working branch:
>
> e8d5baab50 (HEAD -> reg) symbols: check table sizes don't change
> between linking passes 2 and 3
> e53439fdfc (xen_gitlab/reg) xen/arm: Add support for system suspend
> triggered by hardware domain
> eaa461f3b5 xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
> 4236fff9a4 xen/arm: Save/restore context on suspend/resume
> a150f3d4bb xen/arm: Resume memory management on Xen resume
>
> You can find the following line in the attached Xen boot log:
>
> (XEN) [ 0.010785] Latest ChangeSet: Tue Dec 9 11:11:40 2025 +0100 git:e8d=
5baab50
>
> >
> > Jan
> >
> > [1] https://lists.xen.org/archives/html/xen-devel/2025-12/msg00390.html
>
> Best regards,
> Mykola

