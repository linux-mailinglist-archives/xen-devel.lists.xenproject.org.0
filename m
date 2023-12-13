Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3C8119B3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654124.1020828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSGW-0006kt-3X; Wed, 13 Dec 2023 16:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654124.1020828; Wed, 13 Dec 2023 16:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSGW-0006ic-0S; Wed, 13 Dec 2023 16:39:20 +0000
Received: by outflank-mailman (input) for mailman id 654124;
 Wed, 13 Dec 2023 16:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdY9=HY=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rDSGU-0006gz-UU
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:39:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27c3e54f-99d6-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 17:39:16 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3ceded81so44267935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 08:39:16 -0800 (PST)
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
X-Inumbo-ID: 27c3e54f-99d6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702485556; x=1703090356; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPRdQthbvAf4jHes04dP0b8FtKUtzb095r4Y3MTLn8s=;
        b=SgKQUiali1FLmhyniXqCSoNzULOjnGrGT4gv/7uS7dAbMAH4r++/7D9K5sEfcle9Nu
         HXdMA0CsqaFbw0GjyfvqyYUrk/uLzfH7kj6BXv3tAvlFt/FZqtQ8/idrXmb1mTzoItDM
         iJBztpp7BcctPtJnT/rUpHp9rWivhObgxxsf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702485556; x=1703090356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPRdQthbvAf4jHes04dP0b8FtKUtzb095r4Y3MTLn8s=;
        b=IU5+WnS2iqaP/6SsWqt9lexUl+MI2hCh9P+Y176hoF3xbTTOick+gZCIEpsSFzffzJ
         JhsFHNE0Z+e5ZnL5aT1CFOJSPu1tw1DyhNCQpIfH4JFxLuuchsY0v+VV3EBtIr+DbSLL
         v6fw70RvBkrAyr1ottMI8oHOiUaM15+8see02Yvy624UM+mePoBabPBcO5Q7skv4SKsk
         42nzeeZhhbHrAsEUcSKKpvW6C2YaB+bkVtqdZ5tdVKTrnow+UTFMYWjyAWySvH7lojdF
         oFJXN6HtT6Tl/EvJ7uZV62Q2oVjIgeOUkjdqIU/3Eon+Y91BgKK/ybiSlRIjlfgew65Y
         N36A==
X-Gm-Message-State: AOJu0YzKoPlYTiw1IwTHE9R7kQlDnQ6mZ7kHgkddttGXDFjHF4Zsa9Us
	lP1PDGWL6Pe3RAI4CNJtWwLwv3+OQCWc0rKPV9jvXAbtAt1Kk0algw==
X-Google-Smtp-Source: AGHT+IEBq74aFfWFi5b9YdCKH5uorgPe7NJlN1VPNLTB8q+y8+CI8gOxMoKiliR1Nb/b33M2KZLznyl7hggi3zNSOVY=
X-Received: by 2002:a05:600c:2d4b:b0:40c:3150:3d75 with SMTP id
 a11-20020a05600c2d4b00b0040c31503d75mr3618744wmg.108.1702485555988; Wed, 13
 Dec 2023 08:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20231205123403.63813-1-roger.pau@citrix.com> <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
 <ZW86TOTFn3JZswUO@macbook> <CAG7k0Eq72v7Y5HN+dckAkiL4+RHHUOaVCMW0TGwKdWa9wOeTMA@mail.gmail.com>
 <ZXbneT2XGoj8CtMW@macbook>
In-Reply-To: <ZXbneT2XGoj8CtMW@macbook>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 13 Dec 2023 16:39:04 +0000
Message-ID: <CAG7k0ErYAYO9dq7KfwpcDU856Hau663ToLUmbk0KUTMMDQYB0A@mail.gmail.com>
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:42=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Wed, Dec 06, 2023 at 12:11:39PM +0000, Ross Lagerwall wrote:
> > On Tue, Dec 5, 2023 at 2:57=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:
> > >
> > > On Tue, Dec 05, 2023 at 02:15:05PM +0000, Andrew Cooper wrote:
> > > > On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> > > > > Currently version.o is explicitly ignored as the file would chang=
e as a result
> > > > > of the orignal and the patched build having possibly different da=
tes and
> > > > > times.
> > > > >
> > > > > Fix such difference by exporting the date and time from the build=
 script, so
> > > > > that both builds share the same build time.  This allows checking=
 for changes
> > > > > in version.c, since the rest of fields need to be manually change=
d in order to
> > > > > produce different output.
> > > > >
> > > > > Setting XEN_BUILD_{DATE,TIME} as an environment variable has been=
 supported
> > > > > since before livepatch support was added to Xen, so it's safe to =
export those
> > > > > variables unconditionally.
> > > > >
> > > > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > > > ---
> > > > >  livepatch-build | 4 ++++
> > > > >  livepatch-gcc   | 2 --
> > > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/livepatch-build b/livepatch-build
> > > > > index e2ccce4f7fd7..f622683fc56c 100755
> > > > > --- a/livepatch-build
> > > > > +++ b/livepatch-build
> > > > > @@ -417,6 +417,10 @@ if [ "${SKIP}" !=3D "build" ]; then
> > > > >
> > > > >      export CROSS_COMPILE=3D"${TOOLSDIR}/livepatch-gcc "
> > > > >
> > > > > +    # Force same date and time to prevent unwanted changes in ve=
rsion.c
> > > > > +    export XEN_BUILD_DATE=3D`LC_ALL=3DC date`
> > > > > +    export XEN_BUILD_TIME=3D`LC_ALL=3DC date +%T`
> > > >
> > > > Date is the one that goes wrong every time, but everything else in
> > > > compile.h can go wrong in a way that causes version.o to change.
> > >
> > > I've attempted to reflect that in "since the rest of fields need to b=
e
> > > manually changed in order to produce different output".
> > >
> > > For those to change there must be some kind of environment change
> > > between the original and the patched version build, and hence I don't
> > > think that would be supported.
> >
> > In general, yes. However, with this patch changes to the
> > hostname/domain/username would result in version.o being marked
> > as changed even though it is entirely fine to build the live patch
> > on a different build host from the original Xen.
>
> Keep in mind livepatch-build-tools builds it's base version of Xen and
> then a patched version, and that's how the diff is performed.  For the
> hostname/domain/username changes to appear on the livepatch payload
> such change would need to happen in the muddle of the execution of
> livepatch-build.
>
> This change doesn't prevent building the original Xen on a different
> host than the one building the livepatch, and the
> hostname/domain/username changes won't be part of the livepatch
> payload.

Oh, of course. That makes sense.

There is one other issue that may cause version.o to change
unnecessarily.

XEN_CHANGESET may change when the source tree is a Git repo.
In some cases, it will change from <commit> to <commit>-dirty
when the patch is applied. I guess we could set .scmversion
explicitly to avoid this?

>
> > >
> > > > Ideally, the pristine source for building livepatches would include=
 a
> > > > generated compile.h, and livepatch would have a way to force no
> > > > regeneration of the header.  But I've got no idea how nice that wou=
ld be
> > > > to arrange.
> > >
> > > Yes, no idea how fragile that would be either.  IMO the proposed
> > > approach is not that bad.
> > >
> > > > That way, you're using the same details as the Xen being patched, r=
ather
> > > > than hoping that two identical different details will cancel out in=
 the
> > > > binary diff.
> > >
> > > Another option is to set all the env variables to disable any
> > > build time probing.  However things like compiler or version changing
> > > between the original and the patched builds likely point out to issue=
s
> > > elsewhere, unless it's intentional modification of the helpers.
> > >
> > > > > +
> > > > >      echo "Perform full initial build with ${CPUS} CPU(s)..."
> > > > >      build_full
> > > > >
> > > > > diff --git a/livepatch-gcc b/livepatch-gcc
> > > > > index fcad80551aa0..e4cb6fb59029 100755
> > > > > --- a/livepatch-gcc
> > > > > +++ b/livepatch-gcc
> > > > > @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =3D~ $GCC_RE ]] ; then
> > > > >              obj=3D$2
> > > > >              [[ $2 =3D */.tmp_*.o ]] && obj=3D${2/.tmp_/}
> > > > >              case "$(basename $obj)" in
> > > > > -            version.o|\
> > > > >              debug.o|\
> > > > >              check.o|\
> > > >
> > > > Tangential question.  check.o is excluded because it's a toolchain =
test,
> > > > but any idea what debug.o is doing in this list?
> > > >
> > > > It can't possibly be the debug.c I've recently added to x86 (which =
we'll
> > > > want to be able to livepatch), so I guess it's got something to do =
the
> > > > ARM debug.S's, but I can't see anything in those that are worthy of
> > > > exemption either...
> > >
> > > Hm, that comes from the first commit that imported the wrapper to the
> > > repository, and at that point only x86 had livepatch support.
> > >
> > > I'm tempted to think this was inherited from the original xsplice
> > > tooling, and so debug.o needs to be removed from the list.
> > >
> >
> > livepatch-build-tools is derived from the kpatch build tooling and
> > debug.o has never been present there so it was added here for a
> > reason. AFAICT the gdbsx code used to live in debug.o. I can't
> > recall why it was being marked as changed unnecessarily but since
> > that is no longer an issue and the code lives elsewhere, the debug.o
> > lines can be dropped.
>
> Will someone send a patch for this, or should I do it?
>

I will send a patch for this.

Thanks,
Ross

