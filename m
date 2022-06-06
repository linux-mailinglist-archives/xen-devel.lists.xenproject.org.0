Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471453E4B7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342527.567565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCiV-0006k0-KY; Mon, 06 Jun 2022 13:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342527.567565; Mon, 06 Jun 2022 13:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyCiV-0006hg-H3; Mon, 06 Jun 2022 13:24:23 +0000
Received: by outflank-mailman (input) for mailman id 342527;
 Mon, 06 Jun 2022 13:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Jy1=WN=citrix.com=prvs=14988d3bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nyCiT-0006ha-U2
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:24:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81a8059-e59b-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 15:24:20 +0200 (CEST)
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
X-Inumbo-ID: f81a8059-e59b-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654521860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nB7uJlkx7Z0K/2USL+juAs6nLnZo62u3Fcdbi9B4HVg=;
  b=NethKb4mGHHBGBOgfTDVM04acdmZgUGdH4AfnnCb1zwBPBF7cXH4MzvD
   LuKGII15+JWLjR92MHlKAY3Uh526l+BpZ4nLi9JIigforbZrqWuXtzimF
   swBUHbd3aY/oLrbLG6s8/dL1UKPuQbJYE290/3dwBT4X4fQ04fhOU1IlI
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72939522
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GzFse6gbWV9JBSjn83jFLclHX161GBAKZh0ujC45NGQN5FlHY01je
 htvWW+OMvaCYmP3Ktt3PY7kpk9SvpTSydBjQQc5/ig9Hnwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvQ4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQoPGrHFg94ybwt/IQp4P49ayO7GeHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmA+N0WdOUcn1lE/OLk6prmHjHrEVCxlk1yR//UbwUuK9VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmP167V7gCxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8oBWWJSEOF0A+dwg2Zg0HwcXT8YBqgUeaJjp8K5JZnuEZCBmpn
 W3W9nJm2+9M5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSf2MPMvO9/vU5RCIU3c+TPND6m8UzazSsIpKF/vEN9GOSZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGOqN5PfQ5XdiFrbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:YrSXVasPeT+7MRXCL+oUwJG77skCKYAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPiftXrdyRGVxeZZnMXfKlzbamHDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjHzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIN/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfrWG0hYczGgNkGmpDp1L8Yqq
 iLn/7mBbUr15rlRBDwnfIq4Xi57N9h0Q649bbSuwqfnSWwfkNHNyMGv/MYTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuI4O5ArZvjn+9Pa1wVR4S0rpXWN
 WGzfuskcp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcrW2He4OSETeuOb0oYiK9yeXe
 qvM5RLBPKmJXfyGO9yrnnDZ6U=
X-IronPort-AV: E=Sophos;i="5.91,280,1647316800"; 
   d="scan'208";a="72939522"
Date: Mon, 6 Jun 2022 14:24:13 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Julien
 Grall" <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [XEN PATCH 0/4] xen: rework compat headers generation
Message-ID: <Yp3//c/CAcwLHCvi@perard.uk.xensource.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <5e94648f-ba89-3691-0d80-1a8cca588ca6@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e94648f-ba89-3691-0d80-1a8cca588ca6@citrix.com>

On Wed, Jun 01, 2022 at 05:17:36PM +0000, Andrew Cooper wrote:
> On 01/06/2022 17:59, Anthony PERARD wrote:
> > Patch series available in this git branch:
> > https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-include-rework-v1
> >
> > Hi,
> >
> > This patch series is about 2 improvement. First one is to use $(if_changed, )
> > in "include/Makefile" to make the generation of the compat headers less verbose
> > and to have the command line part of the decision to rebuild the headers.
> > Second one is to replace one slow script by a much faster one, and save time
> > when generating the headers.
> >
> > Thanks.
> >
> > Anthony PERARD (4):
> >   build: xen/include: use if_changed
> >   build: set PERL
> >   build: replace get-fields.sh by a perl script
> >   build: remove auto.conf prerequisite from compat/xlat.h target
> >
> >  xen/Makefile                 |   1 +
> >  xen/include/Makefile         | 106 ++++---
> >  xen/tools/compat-xlat-header | 539 +++++++++++++++++++++++++++++++++++
> >  xen/tools/get-fields.sh      | 528 ----------------------------------
> 
> Excellent.  I was planning to ask you about this.  (I also need to
> refreshing my half series cleaning up other bits of the build.)
> 
> One trivial observation is that it would probably be nicer to name the
> script with a .pl extension.

Sound fine, I don't think it matter much here.

> Any numbers on what the speedup in patch 3 is?

Yes, on my machine when doing a full build, with `ccache` enabled, it
saves about 1.17 seconds (out of ~17s), and without ccache, it saves
about 2.0 seconds (out of ~37s).

Without ccache:

before:
    $ for i in `seq 4`; do time make -j$(nproc) -s O=build 2>/dev/null >/dev/null; rm -r build; done
    make --no-print-directory -j$(nproc) -s O=build > /dev/null  244.98s user 29.24s system 683% cpu 40.146 total
    make --no-print-directory -j$(nproc) -s O=build > /dev/null  47.05s user 11.50s system 332% cpu 17.610 total
    make --no-print-directory -j$(nproc) -s O=build > /dev/null  47.35s user 11.22s system 330% cpu 17.733 total
    make --no-print-directory -j$(nproc) -s O=build > /dev/null  47.31s user 11.23s system 333% cpu 17.577 total

after:
    $ for i in `seq 4`; do time make -j$(nproc) -s O=build 2>/dev/null>/dev/null; rm -r build; done
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  237.28s user 25.97s system 667% cpu 39.456 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  37.60s user 8.20s system 282% cpu 16.214 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  37.95s user 8.67s system 279% cpu 16.651 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  38.02s user 8.40s system 280% cpu 16.545 total

And without ccache:

before:
    $ for i in `seq 4`; do time make -j$(nproc) -s O=build 2>/dev/null>/dev/null; rm -r build; done
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  206.37s user 22.19s system 640% cpu 35.695 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  221.45s user 22.26s system 667% cpu 36.537 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  233.95s user 23.80s system 686% cpu 37.518 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  234.27s user 23.83s system 680% cpu 37.923 total

after:
    $ for i in `seq 4`; do time make -j$(nproc) -s O=build 2>/dev/null>/dev/null; rm -r build; done
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  198.62s user 18.64s system 642% cpu 33.841 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  202.91s user 19.46s system 655% cpu 33.912 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  224.42s user 20.89s system 680% cpu 36.025 total
    make --no-print-directory -j$(nproc) -s O=build 2> /dev/null > /dev/null  222.93s user 21.29s system 683% cpu 35.708 total


> Are the generated compat headers identical before and after this
> series?  If yes, I'm very tempted to ack and commit it straight away.

Yes, the headers are identical. Hopefully, I've managed to check with
all compat headers enabled, since that depends on .config.

Cheers,

-- 
Anthony PERARD

