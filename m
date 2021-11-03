Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B508E44448E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221001.382497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miI40-0006kC-C2; Wed, 03 Nov 2021 15:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221001.382497; Wed, 03 Nov 2021 15:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miI40-0006hC-90; Wed, 03 Nov 2021 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 221001;
 Wed, 03 Nov 2021 15:20:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miI3z-0006h6-1x
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:20:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miI3y-0003CT-Vr
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:20:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1miI3y-0006rB-Ux
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:20:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1miI3v-0004ch-14; Wed, 03 Nov 2021 15:20:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=1xT97f3XRsDQYO3QA5LOtWYSQI7vjkhgHAu/UIPviHg=; b=2LYEQy8pCRrksY+fGBZiHesCSs
	YkSDcnVwM0la8NjW/TmCuGK1FZ3BDthw0n/o3Es+4UGE2LAbOfUwW43gJlEStT7v0B3rK0n0T6CxI
	LuscvgCHpt4K+QmES4B1Qaq5MQCLBjzB6uL+XELZNPA+Z/ldwV2V9cBqtKa0dik7JfU0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24962.43194.390685.41050@mariner.uk.xensource.com>
Date: Wed, 3 Nov 2021 15:20:26 +0000
To: Juergen Gross <jgross@suse.com>,
    xen-devel@lists.xenproject.org,
    Community Manager <community.manager@xenproject.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/3] tools: disable building qemu-trad per default
In-Reply-To: <24962.34455.398862.552200@mariner.uk.xensource.com>
References: <20210910055518.562-1-jgross@suse.com>
	<20210910055518.562-4-jgross@suse.com>
	<24962.34455.398862.552200@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v3 3/3] tools: disable building qemu-trad per default"):
> Juergen Gross writes ("[PATCH v3 3/3] tools: disable building qemu-trad per default"):
> > Using qemu-traditional as device model is deprecated for some time now.
> > 
> > So change the default for building it to "disable". This will affect
> > ioemu-stubdom, too, as there is a direct dependency between the two.
> > 
> > Today it is possible to use a PVH/HVM Linux-based stubdom as device
> > model. Additionally using ioemu-stubdom isn't really helping for
> > security, as it requires to run a very old and potentially buggy qemu
> > version in a PV domain. This is adding probably more security problems
> > than it is removing by using a stubdom.
> 
> Now that the relevant osstest patches are in and stable, I revisited
> this.  The downside risk to the release is very modest.  It might
> cause some temporary test breakage but is very easily reverted.
...
> And pushed to staging.

Unfortunately this broke the gitlab CI:

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/1743723306

  === configuring in tools (/builds/xen-project/people/andyhhp/xen/tools)
  configure: running /bin/sh ./configure --disable-option-checking '--prefix=/usr/local'  '--enable-docs' '--with-system-seabios=/usr/share/seabios/bios.bin' '--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe' '--disable-stubdom' '--with-extra-qemuu-configure-args="--disable-werror"' '--with-system-seabios=/bin/false' --cache-file=/dev/null --srcdir=.
  configure: WARNING: Setting CC, CFLAGS, LDFLAGS, LIBS, CPPFLAGS or CPP is not recommended, use PREPEND_INCLUDES, PREPEND_LIB, APPEND_INCLUDES and APPEND_LIB instead when possible.
  checking build system type... x86_64-pc-linux-musl
  ...
  checking for _FILE_OFFSET_BITS value needed for large files... no
  configure: error: Rombios is required to use IPXE
  configure: error: ./configure failed for tools

The configure arguments look coherent so this is surely a bug in the
configure script.

Looking at the code, it seems that there is code to enable rombios if
$enable_qemu_traditional, but nothing for ipxe.  This seems like a
bug, which was presumably masked by qemu-trad being enabled by
default.

With my RM hat on: Unfortunately I think this means this patch needs
to be reverted right away, at least for now, since it is causing a
regression.  I will do that now.

I would be open to reapplying it after the default for rombios is made
to depend on ipxe too, and ideally if we can see that the CI is happy
with the branch.

> The upside is that this will accelerate the total removal of qemu-trad
> by about one release cycle.  That is highly desirable.

So FTAOD although I am reverting this now, I am still in favour of it.

Thanks,
Ian.

