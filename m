Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E840F805803
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647983.1011833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWrR-0005Ee-4u; Tue, 05 Dec 2023 14:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647983.1011833; Tue, 05 Dec 2023 14:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAWrR-0005Ba-1L; Tue, 05 Dec 2023 14:57:21 +0000
Received: by outflank-mailman (input) for mailman id 647983;
 Tue, 05 Dec 2023 14:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAWrP-0005A8-79
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:57:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 959efb9d-937e-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 15:57:18 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso27673775e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 06:57:18 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b0040c08567bbfsm9915485wmq.17.2023.12.05.06.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:57:17 -0800 (PST)
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
X-Inumbo-ID: 959efb9d-937e-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701788237; x=1702393037; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhWNLMI9HZCvwXp4Qw5+sLm0Bub/kktsD695PWMtSUM=;
        b=MJ+hbWkjRrQvsbe88rAC0uxJDcm2laUf8zmoBG+BpgNI89/bLq2AdS4y88vg/4JjpT
         Yax4Nd2s6Qp6ul3/cmz0um12Sy8cN6DctGe0tVOGlw+8A3wBO6jPCgUDMTQeWPNUhCOn
         8PnxjtG0x8OJcRFgA1LF+yjlg9LD6W7OigwQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788237; x=1702393037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhWNLMI9HZCvwXp4Qw5+sLm0Bub/kktsD695PWMtSUM=;
        b=ErOwPyDooWL0XPEN1ycRmCX7XKG6mxM5SiWwcvlToX/BGk3yEI6wDf5WDrUKXIV3o4
         /62NfdoErh4jLlYWu2U2WtoiUFwTxy8Pbsx4OSUEc5hiEv2/TBdtXOTlXzPzo2pZHpwP
         zYNSVpJLJs2AgEzDpbSW+rUxi5PyvfUia2QLUE7qoAr2xOJw9+IMV6FgcGSw3KMtQTDv
         ykK/+HPPhIfI2lQ009YaUV7BjGFhDnphrCcI1jgfbwiSfwqSkP98inMdWRW27wqBqT73
         zU+vpgKmuzHIBRQk2AS8FIEe5Myb2Hf1dVdG7d+wO6ckYJJlowjQhlCj2KdgbOyOWWEB
         bNYQ==
X-Gm-Message-State: AOJu0Yx6Awfeq3QZ18OH5D3zudmb4+HRrapnHYAhRAFlfUOjr76y6a9P
	jsyk3cO9T/viZY63sAWk8yQxPA==
X-Google-Smtp-Source: AGHT+IGdZxHzOptDmk3tRctP7cFJD7MwbM8IbU4luEXXtih+JknSGHbxi6HWMnHAyfx/a58lYr1rSQ==
X-Received: by 2002:a05:600c:3515:b0:40b:5e22:2de with SMTP id h21-20020a05600c351500b0040b5e2202demr1867399wmq.74.1701788237621;
        Tue, 05 Dec 2023 06:57:17 -0800 (PST)
Date: Tue, 5 Dec 2023 15:57:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] livepatch-build-tools: allow livepatching version.c
Message-ID: <ZW86TOTFn3JZswUO@macbook>
References: <20231205123403.63813-1-roger.pau@citrix.com>
 <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <824c50c3-ad3f-4d97-a3e8-5343564cbde5@citrix.com>

On Tue, Dec 05, 2023 at 02:15:05PM +0000, Andrew Cooper wrote:
> On 05/12/2023 12:34 pm, Roger Pau Monne wrote:
> > Currently version.o is explicitly ignored as the file would change as a result
> > of the orignal and the patched build having possibly different dates and
> > times.
> >
> > Fix such difference by exporting the date and time from the build script, so
> > that both builds share the same build time.  This allows checking for changes
> > in version.c, since the rest of fields need to be manually changed in order to
> > produce different output.
> >
> > Setting XEN_BUILD_{DATE,TIME} as an environment variable has been supported
> > since before livepatch support was added to Xen, so it's safe to export those
> > variables unconditionally.
> >
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  livepatch-build | 4 ++++
> >  livepatch-gcc   | 2 --
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/livepatch-build b/livepatch-build
> > index e2ccce4f7fd7..f622683fc56c 100755
> > --- a/livepatch-build
> > +++ b/livepatch-build
> > @@ -417,6 +417,10 @@ if [ "${SKIP}" != "build" ]; then
> >  
> >      export CROSS_COMPILE="${TOOLSDIR}/livepatch-gcc "
> >  
> > +    # Force same date and time to prevent unwanted changes in version.c
> > +    export XEN_BUILD_DATE=`LC_ALL=C date`
> > +    export XEN_BUILD_TIME=`LC_ALL=C date +%T`
> 
> Date is the one that goes wrong every time, but everything else in
> compile.h can go wrong in a way that causes version.o to change.

I've attempted to reflect that in "since the rest of fields need to be
manually changed in order to produce different output".

For those to change there must be some kind of environment change
between the original and the patched version build, and hence I don't
think that would be supported.

> Ideally, the pristine source for building livepatches would include a
> generated compile.h, and livepatch would have a way to force no
> regeneration of the header.  But I've got no idea how nice that would be
> to arrange.

Yes, no idea how fragile that would be either.  IMO the proposed
approach is not that bad.

> That way, you're using the same details as the Xen being patched, rather
> than hoping that two identical different details will cancel out in the
> binary diff.

Another option is to set all the env variables to disable any
build time probing.  However things like compiler or version changing
between the original and the patched builds likely point out to issues
elsewhere, unless it's intentional modification of the helpers.

> > +
> >      echo "Perform full initial build with ${CPUS} CPU(s)..."
> >      build_full
> >  
> > diff --git a/livepatch-gcc b/livepatch-gcc
> > index fcad80551aa0..e4cb6fb59029 100755
> > --- a/livepatch-gcc
> > +++ b/livepatch-gcc
> > @@ -33,7 +33,6 @@ if [[ "$TOOLCHAINCMD" =~ $GCC_RE ]] ; then
> >              obj=$2
> >              [[ $2 = */.tmp_*.o ]] && obj=${2/.tmp_/}
> >              case "$(basename $obj)" in
> > -            version.o|\
> >              debug.o|\
> >              check.o|\
> 
> Tangential question.  check.o is excluded because it's a toolchain test,
> but any idea what debug.o is doing in this list?
> 
> It can't possibly be the debug.c I've recently added to x86 (which we'll
> want to be able to livepatch), so I guess it's got something to do the
> ARM debug.S's, but I can't see anything in those that are worthy of
> exemption either...

Hm, that comes from the first commit that imported the wrapper to the
repository, and at that point only x86 had livepatch support.

I'm tempted to think this was inherited from the original xsplice
tooling, and so debug.o needs to be removed from the list.

Thanks, Roger.

