Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A080C6E6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 11:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651640.1017415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdji-0004xQ-QJ; Mon, 11 Dec 2023 10:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651640.1017415; Mon, 11 Dec 2023 10:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCdji-0004uI-Nd; Mon, 11 Dec 2023 10:42:06 +0000
Received: by outflank-mailman (input) for mailman id 651640;
 Mon, 11 Dec 2023 10:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCdjh-0004uC-Kt
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 10:42:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebe6dfb2-9811-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 11:42:03 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so40711345e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 02:42:03 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bd21-20020a05600c1f1500b0040c25abd724sm14974409wmb.9.2023.12.11.02.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 02:42:02 -0800 (PST)
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
X-Inumbo-ID: ebe6dfb2-9811-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702291323; x=1702896123; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWtIUHPFqn7WJxyEsBDvSeke1O52VvQsil65m7fexPg=;
        b=fLoqfSlmtrMEv3zej3MYoLhRM/BiFDygsqdeTBROnsWvNC5qfXxo07RY4Fbh0udmWO
         tefGijsKC6sMY85bCsMpyc8n0Gr1+0qpTSQfMaJYL7wDst8HkMJQyEnavlLsouq0vZUE
         wXoXwg5jbwqRcoTMNvDGOZICd5B5Bt8i0m8pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291323; x=1702896123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWtIUHPFqn7WJxyEsBDvSeke1O52VvQsil65m7fexPg=;
        b=jgyNbb/kAVVypWHwzmRJQWTrZUIgLRQ15jwPeIELsGegtd1o+8v6O1XbFX54Pe+dZF
         zsbZ4VOVesheQFJBd3SEZuNXwzgsTTOgMfpvgXOPquHLCz4OW6s4vV8N2ieM6n9yNcgM
         0G6qMBxgSuO6K9HaJpRn4sFfjO2y+OjOdw5Y8FiH4ZHzaMpx6sAbrSoIRUpjLD/cXcMr
         VndccunG+qzxLC7PrsqxlmxGOOkCpC3VlUb0QmjfJc0AgFbr3cf3r9HWvLkSgCl5uyhi
         kx//+lOkQMLMx5fJLret6Uyaf+gPepOax+m+tViSfz3d+EpncYmd2vdVkbeEQ2li3fX9
         DGgw==
X-Gm-Message-State: AOJu0Ywsvxzg87nP6IQO6vvOxNrW0dg9J7kALzsUQUMjOJIz6OIUv1Yo
	pbCjNTOW5LY5D4+89Vq/7u031w==
X-Google-Smtp-Source: AGHT+IFpZBDaEqaKSYQ3iTDYpVLz3inS6PmeDBilIUZ7h6A3ZDb1rhs48hPPAK4F6W7yTO8OvH32WQ==
X-Received: by 2002:a05:600c:3011:b0:40b:5e59:b7d2 with SMTP id j17-20020a05600c301100b0040b5e59b7d2mr1932684wmh.175.1702291322956;
        Mon, 11 Dec 2023 02:42:02 -0800 (PST)
Date: Mon, 11 Dec 2023 11:42:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
Message-ID: <ZXbneT2XGoj8CtMW@macbook>
References: <20231205123403.63813-1-roger.pau@citrix.com>
 <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
 <ZW86TOTFn3JZswUO@macbook>
 <CAG7k0Eq72v7Y5HN+dckAkiL4+RHHUOaVCMW0TGwKdWa9wOeTMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Eq72v7Y5HN+dckAkiL4+RHHUOaVCMW0TGwKdWa9wOeTMA@mail.gmail.com>

On Wed, Dec 06, 2023 at 12:11:39PM +0000, Ross Lagerwall wrote:
> On Tue, Dec 5, 2023 at 2:57 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Tue, Dec 05, 2023 at 02:15:05PM +0000, Andrew Cooper wrote:
> > > On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> > > > Currently version.o is explicitly ignored as the file would change as a result
> > > > of the orignal and the patched build having possibly different dates and
> > > > times.
> > > >
> > > > Fix such difference by exporting the date and time from the build script, so
> > > > that both builds share the same build time.  This allows checking for changes
> > > > in version.c, since the rest of fields need to be manually changed in order to
> > > > produce different output.
> > > >
> > > > Setting XEN_BUILD_{DATE,TIME} as an environment variable has been supported
> > > > since before livepatch support was added to Xen, so it's safe to export those
> > > > variables unconditionally.
> > > >
> > > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > ---
> > > >  livepatch-build | 4 ++++
> > > >  livepatch-gcc   | 2 --
> > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/livepatch-build b/livepatch-build
> > > > index e2ccce4f7fd7..f622683fc56c 100755
> > > > --- a/livepatch-build
> > > > +++ b/livepatch-build
> > > > @@ -417,6 +417,10 @@ if [ "${SKIP}" != "build" ]; then
> > > >
> > > >      export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
> > > >
> > > > +    # Force same date and time to prevent unwanted changes in version.c
> > > > +    export XEN_BUILD_DATE=`LC_ALL=C date`
> > > > +    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
> > >
> > > Date is the one that goes wrong every time, but everything else in
> > > compile.h can go wrong in a way that causes version.o to change.
> >
> > I've attempted to reflect that in "since the rest of fields need to be
> > manually changed in order to produce different output".
> >
> > For those to change there must be some kind of environment change
> > between the original and the patched version build, and hence I don't
> > think that would be supported.
> 
> In general, yes. However, with this patch changes to the
> hostname/domain/username would result in version.o being marked
> as changed even though it is entirely fine to build the live patch
> on a different build host from the original Xen.

Keep in mind livepatch-build-tools builds it's base version of Xen and
then a patched version, and that's how the diff is performed.  For the
hostname/domain/username changes to appear on the livepatch payload
such change would need to happen in the muddle of the execution of
livepatch-build.

This change doesn't prevent building the original Xen on a different
host than the one building the livepatch, and the
hostname/domain/username changes won't be part of the livepatch
payload.

> >
> > > Ideally, the pristine source for building livepatches would include a
> > > generated compile.h, and livepatch would have a way to force no
> > > regeneration of the header.  But I've got no idea how nice that would be
> > > to arrange.
> >
> > Yes, no idea how fragile that would be either.  IMO the proposed
> > approach is not that bad.
> >
> > > That way, you're using the same details as the Xen being patched, rather
> > > than hoping that two identical different details will cancel out in the
> > > binary diff.
> >
> > Another option is to set all the env variables to disable any
> > build time probing.  However things like compiler or version changing
> > between the original and the patched builds likely point out to issues
> > elsewhere, unless it's intentional modification of the helpers.
> >
> > > > +
> > > >      echo "Perform full initial build with ${CPUS} CPU(s)..."
> > > >      build_full
> > > >
> > > > diff --git a/livepatch-gcc b/livepatch-gcc
> > > > index fcad80551aa0..e4cb6fb59029 100755
> > > > --- a/livepatch-gcc
> > > > +++ b/livepatch-gcc
> > > > @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
> > > >              obj=$2
> > > >              [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
> > > >              case "$(basename $obj)" in
> > > > -            version.o|\
> > > >              debug.o|\
> > > >              check.o|\
> > >
> > > Tangential question.  check.o is excluded because it's a toolchain test,
> > > but any idea what debug.o is doing in this list?
> > >
> > > It can't possibly be the debug.c I've recently added to x86 (which we'll
> > > want to be able to livepatch), so I guess it's got something to do the
> > > ARM debug.S's, but I can't see anything in those that are worthy of
> > > exemption either...
> >
> > Hm, that comes from the first commit that imported the wrapper to the
> > repository, and at that point only x86 had livepatch support.
> >
> > I'm tempted to think this was inherited from the original xsplice
> > tooling, and so debug.o needs to be removed from the list.
> >
> 
> livepatch-build-tools is derived from the kpatch build tooling and
> debug.o has never been present there so it was added here for a
> reason. AFAICT the gdbsx code used to live in debug.o. I can't
> recall why it was being marked as changed unnecessarily but since
> that is no longer an issue and the code lives elsewhere, the debug.o
> lines can be dropped.

Will someone send a patch for this, or should I do it?

Thanks, Roger.

