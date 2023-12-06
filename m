Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F40806F7F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 13:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649209.1013622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqkt-00028g-OJ; Wed, 06 Dec 2023 12:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649209.1013622; Wed, 06 Dec 2023 12:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAqkt-00025n-Km; Wed, 06 Dec 2023 12:11:55 +0000
Received: by outflank-mailman (input) for mailman id 649209;
 Wed, 06 Dec 2023 12:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OP1m=HR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rAqkr-00025g-TV
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 12:11:53 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35f457d-9430-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 13:11:51 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3333074512bso365902f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 04:11:51 -0800 (PST)
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
X-Inumbo-ID: a35f457d-9430-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701864711; x=1702469511; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=437VIxtcX0N4H5jsRtSLZUpdsDelvlY9ahAn1pXxHd8=;
        b=OGi3rWgjG783tjTKVJc2kwsV20rfg9tXwkzFPujAFIChRqMXlXgzYdYi/R2001oJdk
         SH4wTT1gYnJJ/Jjyxr2Bj7aYl1cBRfhZpprJIYsnQEaKT4Ap0Z4BD64JUHRSEFhzNgoZ
         GJVV+bxFLcbRPwswflH4XD2fLznaiz0cSXj/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701864711; x=1702469511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=437VIxtcX0N4H5jsRtSLZUpdsDelvlY9ahAn1pXxHd8=;
        b=hMrN8t/iSo8bG4oSOHRYdTSBYqAdSaeBxadUJhBUEVmWTMdRVojdRKeG+62FOinnm5
         tmmxAAASH2BfvF5C0a+WckJo8Ew10/HhjgRUVHqtd3lJl24BX37vqTsU6X0GPngFPAdt
         F3qs0nsRu2b0qlf/QY3NqaAcJS1CJPGBXI1YbwYTrjO++1uGPIHQk7GAWMW1y+l9PlVj
         WGTB+ZFYbKgC1LeHxX+WjdUYMD8YPUHoTQ8w1N/jQT3Q6vSapv01xuNpV7drlPP6IAYz
         uxjBylTZsR/zG8QSc4bAiZ1+BIMEPr/MGSGnf30Sp0nEExs5B+SB87k8aDbc+g/YX5zr
         Y/FA==
X-Gm-Message-State: AOJu0Yw2syz/Vy4EDSmVAFvXiAS7EzI9xNjX9Lnu/mZ2PFp6JwvXE6U0
	J8GrvgJM91mhuFm0pUC8YTL8ESesI1R8AA8evNOX
X-Google-Smtp-Source: AGHT+IF5yObhQ8uk+icxlQqEsFmR4OCppJuwYtA4ONqytcSjy2O21eRWj1IFdl/TrUPvoEUV5oItPDc7XcRzB01T+qA=
X-Received: by 2002:a05:600c:138a:b0:40b:2a62:a2b6 with SMTP id
 u10-20020a05600c138a00b0040b2a62a2b6mr1456938wmf.1.1701864711095; Wed, 06 Dec
 2023 04:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20231205123403.63813-1-roger.pau@citrix.com> <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
 <ZW86TOTFn3JZswUO@macbook>
In-Reply-To: <ZW86TOTFn3JZswUO@macbook>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 6 Dec 2023 12:11:39 +0000
Message-ID: <CAG7k0Eq72v7Y5HN+dckAkiL4+RHHUOaVCMW0TGwKdWa9wOeTMA@mail.gmail.com>
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:57=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
>
> On Tue, Dec 05, 2023 at 02:15:05PM +0000, Andrew Cooper wrote:
> > On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> > > Currently version.o is explicitly ignored as the file would change as=
 a result
> > > of the orignal and the patched build having possibly different dates =
and
> > > times.
> > >
> > > Fix such difference by exporting the date and time from the build scr=
ipt, so
> > > that both builds share the same build time.  This allows checking for=
 changes
> > > in version.c, since the rest of fields need to be manually changed in=
 order to
> > > produce different output.
> > >
> > > Setting XEN_BUILD_{DATE,TIME} as an environment variable has been sup=
ported
> > > since before livepatch support was added to Xen, so it's safe to expo=
rt those
> > > variables unconditionally.
> > >
> > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > >  livepatch-build | 4 ++++
> > >  livepatch-gcc   | 2 --
> > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/livepatch-build b/livepatch-build
> > > index e2ccce4f7fd7..f622683fc56c 100755
> > > --- a/livepatch-build
> > > +++ b/livepatch-build
> > > @@ -417,6 +417,10 @@ if [ "${SKIP}" !=3D "build" ]; then
> > >
> > >      export CROSS_COMPILE=3D"${TOOLSDIR}/livepatch-gcc "
> > >
> > > +    # Force same date and time to prevent unwanted changes in versio=
n.c
> > > +    export XEN_BUILD_DATE=3D`LC_ALL=3DC date`
> > > +    export XEN_BUILD_TIME=3D`LC_ALL=3DC date +%T`
> >
> > Date is the one that goes wrong every time, but everything else in
> > compile.h can go wrong in a way that causes version.o to change.
>
> I've attempted to reflect that in "since the rest of fields need to be
> manually changed in order to produce different output".
>
> For those to change there must be some kind of environment change
> between the original and the patched version build, and hence I don't
> think that would be supported.

In general, yes. However, with this patch changes to the
hostname/domain/username would result in version.o being marked
as changed even though it is entirely fine to build the live patch
on a different build host from the original Xen.

>
> > Ideally, the pristine source for building livepatches would include a
> > generated compile.h, and livepatch would have a way to force no
> > regeneration of the header.  But I've got no idea how nice that would b=
e
> > to arrange.
>
> Yes, no idea how fragile that would be either.  IMO the proposed
> approach is not that bad.
>
> > That way, you're using the same details as the Xen being patched, rathe=
r
> > than hoping that two identical different details will cancel out in the
> > binary diff.
>
> Another option is to set all the env variables to disable any
> build time probing.  However things like compiler or version changing
> between the original and the patched builds likely point out to issues
> elsewhere, unless it's intentional modification of the helpers.
>
> > > +
> > >      echo "Perform full initial build with ${CPUS} CPU(s)..."
> > >      build_full
> > >
> > > diff --git a/livepatch-gcc b/livepatch-gcc
> > > index fcad80551aa0..e4cb6fb59029 100755
> > > --- a/livepatch-gcc
> > > +++ b/livepatch-gcc
> > > @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =3D~ $GCC_RE ]] ; then
> > >              obj=3D$2
> > >              [[ $2 =3D */.tmp_*.o ]] && obj=3D${2/.tmp_/}
> > >              case "$(basename $obj)" in
> > > -            version.o|\
> > >              debug.o|\
> > >              check.o|\
> >
> > Tangential question.  check.o is excluded because it's a toolchain test=
,
> > but any idea what debug.o is doing in this list?
> >
> > It can't possibly be the debug.c I've recently added to x86 (which we'l=
l
> > want to be able to livepatch), so I guess it's got something to do the
> > ARM debug.S's, but I can't see anything in those that are worthy of
> > exemption either...
>
> Hm, that comes from the first commit that imported the wrapper to the
> repository, and at that point only x86 had livepatch support.
>
> I'm tempted to think this was inherited from the original xsplice
> tooling, and so debug.o needs to be removed from the list.
>

livepatch-build-tools is derived from the kpatch build tooling and
debug.o has never been present there so it was added here for a
reason. AFAICT the gdbsx code used to live in debug.o. I can't
recall why it was being marked as changed unnecessarily but since
that is no longer an issue and the code lives elsewhere, the debug.o
lines can be dropped.

Ross

