Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C52811A83
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 18:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654134.1020857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSjq-0004OV-Nd; Wed, 13 Dec 2023 17:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654134.1020857; Wed, 13 Dec 2023 17:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDSjq-0004Lz-L1; Wed, 13 Dec 2023 17:09:38 +0000
Received: by outflank-mailman (input) for mailman id 654134;
 Wed, 13 Dec 2023 17:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrFR=HY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDSjp-0004Lt-FV
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 17:09:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a98402-99da-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 18:09:35 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso73600315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 09:09:35 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003feae747ff2sm23687766wms.35.2023.12.13.09.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 09:09:34 -0800 (PST)
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
X-Inumbo-ID: 63a98402-99da-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702487374; x=1703092174; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b/hGGeu72epB4yX2XYgx/OBMHCbcRC3/pwvQyhn6UOM=;
        b=kMvqqLCbq0EPqw8H7S3qK3yUdqJiR4T6/qlnWwsIE2L4Zw4Mv+hQmwZC/9gQZ5N4ZW
         +yU8n9dd6l+a+XSKRDEzzhbKzkJi8EeQrPwOScV21mugIild70ktkNQuUzjVc1XT9+2t
         GDHQJasG0nIZ4qV56xhnaEBIeZz34mHjI9FRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487374; x=1703092174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/hGGeu72epB4yX2XYgx/OBMHCbcRC3/pwvQyhn6UOM=;
        b=aR9qZ9LH8BzxgpW/iboLTi4IE7oR7Lc+W+Zd3d/AeAvEyn8oMq/6v+fX4RAKmWZBW0
         PiL50s0gNJFAdGCYo+VvJ8o4hIzkaMarJxroVa7q/+aABXidh1N8vftvS0H5Q81AJtJR
         u+8pXeHn5VGf6rPwlLx0L50Rvx16tXa/qf2uqdKSKwfOwS3gVGphwja7FFAFqZ8oV/TK
         a4gJjuIWeBU/1/8Rj7odRIb+YiiYKORU/4y/hCudiQwogG7ZXzprW3EO10/4b5LM0HrN
         7CTT+37kkQXytcqXUuOUdZcFpvW2KaYf6qs/znbkqoI1WH257tX382Vl2+SvfYLP/AeH
         yLDA==
X-Gm-Message-State: AOJu0YygK9Zt4Cx6FKaYaNtH/MzgczsExDeqfc0iHCH4g/1GeFSZ6WlK
	1Wpni9ub5lQMrE68HJ/6gGN/jA==
X-Google-Smtp-Source: AGHT+IEwf9F37TVbZg5njBvxrroua/WUbF9bnE75jurNaJcRzVBwjT+LTZ/gY+rAW1KE72Iu+3utKA==
X-Received: by 2002:a1c:7210:0:b0:40b:5e21:d360 with SMTP id n16-20020a1c7210000000b0040b5e21d360mr3734559wmc.105.1702487374490;
        Wed, 13 Dec 2023 09:09:34 -0800 (PST)
Date: Wed, 13 Dec 2023 18:09:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
Message-ID: <ZXnlTS0iCboWfnB0@macbook>
References: <20231205123403.63813-1-roger.pau@citrix.com>
 <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
 <ZW86TOTFn3JZswUO@macbook>
 <CAG7k0Eq72v7Y5HN+dckAkiL4+RHHUOaVCMW0TGwKdWa9wOeTMA@mail.gmail.com>
 <ZXbneT2XGoj8CtMW@macbook>
 <CAG7k0ErYAYO9dq7KfwpcDU856Hau663ToLUmbk0KUTMMDQYB0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0ErYAYO9dq7KfwpcDU856Hau663ToLUmbk0KUTMMDQYB0A@mail.gmail.com>

On Wed, Dec 13, 2023 at 04:39:04PM +0000, Ross Lagerwall wrote:
> On Mon, Dec 11, 2023 at 10:42 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Dec 06, 2023 at 12:11:39PM +0000, Ross Lagerwall wrote:
> > > On Tue, Dec 5, 2023 at 2:57 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Tue, Dec 05, 2023 at 02:15:05PM +0000, Andrew Cooper wrote:
> > > > > On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> > > > > > Currently version.o is explicitly ignored as the file would change as a result
> > > > > > of the orignal and the patched build having possibly different dates and
> > > > > > times.
> > > > > >
> > > > > > Fix such difference by exporting the date and time from the build script, so
> > > > > > that both builds share the same build time.  This allows checking for changes
> > > > > > in version.c, since the rest of fields need to be manually changed in order to
> > > > > > produce different output.
> > > > > >
> > > > > > Setting XEN_BUILD_{DATE,TIME} as an environment variable has been supported
> > > > > > since before livepatch support was added to Xen, so it's safe to export those
> > > > > > variables unconditionally.
> > > > > >
> > > > > > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > > > ---
> > > > > >  livepatch-build | 4 ++++
> > > > > >  livepatch-gcc   | 2 --
> > > > > >  2 files changed, 4 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/livepatch-build b/livepatch-build
> > > > > > index e2ccce4f7fd7..f622683fc56c 100755
> > > > > > --- a/livepatch-build
> > > > > > +++ b/livepatch-build
> > > > > > @@ -417,6 +417,10 @@ if [ "${SKIP}" != "build" ]; then
> > > > > >
> > > > > >      export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
> > > > > >
> > > > > > +    # Force same date and time to prevent unwanted changes in version.c
> > > > > > +    export XEN_BUILD_DATE=`LC_ALL=C date`
> > > > > > +    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
> > > > >
> > > > > Date is the one that goes wrong every time, but everything else in
> > > > > compile.h can go wrong in a way that causes version.o to change.
> > > >
> > > > I've attempted to reflect that in "since the rest of fields need to be
> > > > manually changed in order to produce different output".
> > > >
> > > > For those to change there must be some kind of environment change
> > > > between the original and the patched version build, and hence I don't
> > > > think that would be supported.
> > >
> > > In general, yes. However, with this patch changes to the
> > > hostname/domain/username would result in version.o being marked
> > > as changed even though it is entirely fine to build the live patch
> > > on a different build host from the original Xen.
> >
> > Keep in mind livepatch-build-tools builds it's base version of Xen and
> > then a patched version, and that's how the diff is performed.  For the
> > hostname/domain/username changes to appear on the livepatch payload
> > such change would need to happen in the muddle of the execution of
> > livepatch-build.
> >
> > This change doesn't prevent building the original Xen on a different
> > host than the one building the livepatch, and the
> > hostname/domain/username changes won't be part of the livepatch
> > payload.
> 
> Oh, of course. That makes sense.
> 
> There is one other issue that may cause version.o to change
> unnecessarily.
> 
> XEN_CHANGESET may change when the source tree is a Git repo.
> In some cases, it will change from <commit> to <commit>-dirty
> when the patch is applied. I guess we could set .scmversion
> explicitly to avoid this?

Oh, right, I did consider that <commit> cannot change, but it can
indeed become <commit>-dirty.  Will expand to make it fixed also.

> >
> > > >
> > > > > Ideally, the pristine source for building livepatches would include a
> > > > > generated compile.h, and livepatch would have a way to force no
> > > > > regeneration of the header.  But I've got no idea how nice that would be
> > > > > to arrange.
> > > >
> > > > Yes, no idea how fragile that would be either.  IMO the proposed
> > > > approach is not that bad.
> > > >
> > > > > That way, you're using the same details as the Xen being patched, rather
> > > > > than hoping that two identical different details will cancel out in the
> > > > > binary diff.
> > > >
> > > > Another option is to set all the env variables to disable any
> > > > build time probing.  However things like compiler or version changing
> > > > between the original and the patched builds likely point out to issues
> > > > elsewhere, unless it's intentional modification of the helpers.
> > > >
> > > > > > +
> > > > > >      echo "Perform full initial build with ${CPUS} CPU(s)..."
> > > > > >      build_full
> > > > > >
> > > > > > diff --git a/livepatch-gcc b/livepatch-gcc
> > > > > > index fcad80551aa0..e4cb6fb59029 100755
> > > > > > --- a/livepatch-gcc
> > > > > > +++ b/livepatch-gcc
> > > > > > @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
> > > > > >              obj=$2
> > > > > >              [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
> > > > > >              case "$(basename $obj)" in
> > > > > > -            version.o|\
> > > > > >              debug.o|\
> > > > > >              check.o|\
> > > > >
> > > > > Tangential question.  check.o is excluded because it's a toolchain test,
> > > > > but any idea what debug.o is doing in this list?
> > > > >
> > > > > It can't possibly be the debug.c I've recently added to x86 (which we'll
> > > > > want to be able to livepatch), so I guess it's got something to do the
> > > > > ARM debug.S's, but I can't see anything in those that are worthy of
> > > > > exemption either...
> > > >
> > > > Hm, that comes from the first commit that imported the wrapper to the
> > > > repository, and at that point only x86 had livepatch support.
> > > >
> > > > I'm tempted to think this was inherited from the original xsplice
> > > > tooling, and so debug.o needs to be removed from the list.
> > > >
> > >
> > > livepatch-build-tools is derived from the kpatch build tooling and
> > > debug.o has never been present there so it was added here for a
> > > reason. AFAICT the gdbsx code used to live in debug.o. I can't
> > > recall why it was being marked as changed unnecessarily but since
> > > that is no longer an issue and the code lives elsewhere, the debug.o
> > > lines can be dropped.
> >
> > Will someone send a patch for this, or should I do it?
> >
> 
> I will send a patch for this.

Thanks, Roger.

