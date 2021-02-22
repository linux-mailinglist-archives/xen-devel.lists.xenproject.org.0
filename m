Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A4322286
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 00:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88422.166248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEKGV-0005hS-8y; Mon, 22 Feb 2021 23:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88422.166248; Mon, 22 Feb 2021 23:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEKGV-0005h3-5i; Mon, 22 Feb 2021 23:05:19 +0000
Received: by outflank-mailman (input) for mailman id 88422;
 Mon, 22 Feb 2021 23:05:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zptr=HY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lEKGU-0005gy-AQ
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 23:05:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 860e5a30-5a20-4b0c-abf6-7ae81031fdef;
 Mon, 22 Feb 2021 23:05:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A3BD64E20;
 Mon, 22 Feb 2021 23:05:16 +0000 (UTC)
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
X-Inumbo-ID: 860e5a30-5a20-4b0c-abf6-7ae81031fdef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614035116;
	bh=OlkGaVDCTD0em0cJ90yqyCtlDfX6TULh+vYlXVNqQIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bvgw7au8Yb7HEyIM556kPTMiwK6lED2IstBP1d51kI+LANoiLXvJ76SgtTWOr2w9Q
	 WGU7RZbfwu2+3mZiwxc1kcY2I6s7qbRhMyq/kcshRZLbhxUDuDv8CsuZqxWgtfapPt
	 0uiLecqrzr6fhZHWxk664ggpMW5Xf02qV4swFYlXUGfs+gX3uUlmPSQfFGJhW9Nb/2
	 hIPBNqSfGYv6STpjr2gZwksTGQGQbC7i0d5NL8zoC7XLjM0uhTTmRKBBQJdSyJFtf8
	 Q1n/+ZaOh/eILvcM1hJFhCVx08S8XiIRRutYe2CDtPFuN5jALduOszEGJeAOqP8HZU
	 ChiGNv2WxS9Ow==
Date: Mon, 22 Feb 2021 15:05:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
In-Reply-To: <3723a430-e7de-017a-294f-4c3fdb35da51@suse.com>
Message-ID: <alpine.DEB.2.21.2102221453080.3234@sstabellini-ThinkPad-T480s>
References: <20210213020540.27894-1-sstabellini@kernel.org> <20210213135056.GA6191@mail-itl> <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com> <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s> <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
 <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s> <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com> <alpine.DEB.2.21.2102181737310.3234@sstabellini-ThinkPad-T480s> <3723a430-e7de-017a-294f-4c3fdb35da51@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Feb 2021, Jan Beulich wrote:
> On 19.02.2021 02:42, Stefano Stabellini wrote:
> > OK it took me a lot longer than expected (I have never had the dubious
> > pleasure of working with autoconf before) but the following seems to
> > work, tested on both Alpine Linux and Debian Unstable. Of course I had
> > to run autoreconf first.
> > 
> > 
> > diff --git a/config/Tools.mk.in b/config/Tools.mk.in
> > index 48bd9ab731..d5e4f1679f 100644
> > --- a/config/Tools.mk.in
> > +++ b/config/Tools.mk.in
> > @@ -50,6 +50,7 @@ CONFIG_OVMF         := @ovmf@
> >  CONFIG_ROMBIOS      := @rombios@
> >  CONFIG_SEABIOS      := @seabios@
> >  CONFIG_IPXE         := @ipxe@
> > +CONFIG_HVMLOADER    := @hvmloader@
> >  CONFIG_QEMU_TRAD    := @qemu_traditional@
> >  CONFIG_QEMU_XEN     := @qemu_xen@
> >  CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
> > diff --git a/tools/Makefile b/tools/Makefile
> > index 757a560be0..6cff5766f3 100644
> > --- a/tools/Makefile
> > +++ b/tools/Makefile
> > @@ -14,7 +14,7 @@ SUBDIRS-y += examples
> >  SUBDIRS-y += hotplug
> >  SUBDIRS-y += xentrace
> >  SUBDIRS-$(CONFIG_XCUTILS) += xcutils
> > -SUBDIRS-$(CONFIG_X86) += firmware
> > +SUBDIRS-$(CONFIG_HVMLOADER) += firmware
> 
> But there are more subdirs under firmware/ than just hvmloader.
> In particular you'd now also skip building the shim if hvmloader
> was disabled.
> 
> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -307,6 +307,10 @@ AC_ARG_VAR([AWK], [Path to awk tool])
> >  
> >  # Checks for programs.
> >  AC_PROG_CC
> > +AC_LANG(C)
> > +AC_LANG_CONFTEST([AC_LANG_SOURCE([[int main() { return 0;}]])])
> > +AS_IF([gcc -m32 conftest.c -o - 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled as the compiler cannot build 32bit binaries)])
> > +AC_SUBST(hvmloader)
> 
> I'm puzzled: "gcc -m32" looked to work fine on its own. I suppose
> the above fails at the linking stage, but that's not what we care
> about (we don't link with any system libraries). Instead, as said,
> you want to check "gcc -m32 -c" produces correct code, in
> particular with sizeof(uint64_t) being 8. Of course all of this
> would be easier if their headers at least caused some form of
> error, instead of silently causing bad code to be generated.
> 
> The way you do it, someone simply not having 32-bit C libraries
> installed would then also have hvmloader build disabled, even if
> their compiler and headers are fine to use.

I realize that technically this test is probing for something different:
the ability to build and link a trivial 32-bit userspace program, rather
than a specific check about sizeof(uint64_t). However, I thought that if
this test failed we didn't want to continue anyway.

If you say that hvmloader doesn't link against any system libraries,
then in theory the hvmloader build could succeed even if this test
failed. Hence, we need to change strategy.

What do you think of something like this?

AC_LANG_CONFTEST([AC_LANG_SOURCE([[#include <assert.h>
#include <stdint.h>
int main() { assert(sizeof(uint64_t) == 8); return 0;}]])])
AS_IF([gcc -m32 conftest.c -o conftest 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(XXX)])


Do you have any better ideas?


> Also I don't think "-o -" does what you want - it'll produce a
> binary named "-" (if compilation and linking succeed), while I
> suppose what you want is to discard the output (i.e. probably
> "-o /dev/null"). Albeit even that doesn't look to be the commonly
> used approach - a binary named "conftest" would normally be
> specified as the output, according to other configure.ac I've
> looked at. Such tests then have a final "rm -f conftest*".

OK

