Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBA72695B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 21:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544979.851126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6yPX-0004BW-N4; Wed, 07 Jun 2023 19:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544979.851126; Wed, 07 Jun 2023 19:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6yPX-00049m-Ix; Wed, 07 Jun 2023 19:01:35 +0000
Received: by outflank-mailman (input) for mailman id 544979;
 Wed, 07 Jun 2023 19:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/iFR=B3=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q6yPV-00049g-Bs
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 19:01:33 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c033d9-0565-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 21:01:30 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 89EA93F07D;
 Wed,  7 Jun 2023 12:01:27 -0700 (PDT)
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
X-Inumbo-ID: b5c033d9-0565-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686164488; bh=HgHLAVvRx1JQuA4pPUJu+MoDSy5figbCmBjCnuvfZvE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=IeQ17NZV/i/MjnYdawmuLCAb2x1PYc/0uP8iptg/aoULxYL3mqtMc8ty6zRNC5NiE
	 AQCmrtn45etcUBAZOzrsSKjSwWs9dA/1P5TbI9nWVPU3+xbm54YUCP04XE53jH/V3v
	 lY+nJOncBpRCUR14hgCaB1whEpcGVor0ORM7tthI3IqngHk4tPzB5rIsFxzgdgMxdL
	 F6pmC4DblvoYLKEWLD1XIE2Zyo1x2x8uK2CIAz4xjUA9k89epYKataCawIpDBbievh
	 Jdi9ZgSmtjidngKubFaN6ELsMRAbg7motJw2jLtClM67H10soxtPJUo7m1KGuvHGOh
	 bf89BMgxDQeag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 14:01:24 -0500
Message-Id: <CT6NFAE37O7K.215IO8HD8PTWU@Shawns-Mac-mini.lan>
Subject: Re: [PATCH 0/3] Initial support for Power
From: "Shawn Anastasio" <shawn@anastas.io>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: <tpearson@raptorengineering.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>,
 "Wei Liu" <wl@xen.org>
References: <cover.1686148363.git.shawn@anastas.io>
 <c1e75aaf-407d-6163-b382-b0c984e9db4c@citrix.com>
In-Reply-To: <c1e75aaf-407d-6163-b382-b0c984e9db4c@citrix.com>

On Wed Jun 7, 2023 at 1:07 PM CDT, Andrew Cooper wrote:
> Oh wow - this is a surprise, but certainly a good one.

I'm glad to hear that!

> We've recently done just a similar exercise with RISCV64, starting with
> getting cross-compilation and a basic smoke test into our CI.

I see. I used the initial RISC-V patch as a model for patch 1, though I
didn't realize that the TARGET=3D override were unnecessary for getting a
minimal image building.

> We use gitlab CI, and one example is
> https://gitlab.com/xen-project/xen/-/pipelines/889871648=C2=A0 (search fo=
r
> riscv64 in amongst all the x86 and ARM).
>
> The configuration is all in tree, in the automation/ directory.=C2=A0
> Relevant files to copy/tweak are:
>
> automation/build/archlinux/current-riscv64.dockerfile (x86 cross compile
> container)
> automation/scripts/qemu-smoke-riscv64.sh (smoke test script)
> automation/gitlab-ci/{build,test}.yaml (wire the jobs up)
>
> The smoke test looks on stdout for "All set up" which can be any string
> put out via earlyprintk.

Thanks for the pointer -- I'll use this as a model to implement a
similar smoke test for PPC64.

> If you look around in the Xen tree at bb62c25e3e5c and take the makefile
> override's in particular, you should be able to get `make -C xen build`
> work without any magic TARGET=3D overrides, and without most of the
> headers you've added in patch 1.=C2=A0 The trick is to have a head.S whic=
h
> doesn't include any files (except the config.h it gets implicitly).

Perfect. I'll start work on a v2 without the TARGET=3D overrides and
without the headers in patch #1.

> We're still trying to do some re-arranging to the common / arch split to
> remove unnecessary boilerplate.=C2=A0 Having a set of PPC headers too wil=
l
> make it easier to spot the rough edges in the current boundary.

Great. I've been using arch/arm and arch/riscv as models for which
headers to define (as well as the build errors that inevitably pop up
when including xen/lib.h or similar). Is this a reasonable approach for
now?

> Looking to the future, where could XenProject get some real hardware to
> put into our CI systems?=C2=A0 We'd want to do that in due course.

As an employee of Raptor Engineering, my recommendation for an OpenPOWER
system would definitely be the Talos II or Blackbird families from Raptor
Computing Systems: https://www.raptorcs.com/ :)

> I see you've nominated yourself as maintainer, which is of course fine.=
=C2=A0
> How much time do you have to put towards this?=C2=A0 It is some part of a
> full time job, or just your own free time?

I'm currently working on the port full-time for Raptor Engineering.

> Do you have any suggested reading for those of us who are invariably
> going to need to learn some of the CPU/platform/architecture details,
> but aren't really PPC-literate right now?

We have a pretty extensive library of documentation covering the ISA
as well as CPU and platform details available here:
https://wiki.raptorcs.com/wiki/Category:Documentation

> Thanks, and welcome.

Thanks!

Shawn

