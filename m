Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A158D846019
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674690.1049783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbyY-0005UZ-0k; Thu, 01 Feb 2024 18:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674690.1049783; Thu, 01 Feb 2024 18:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbyX-0005Sn-UF; Thu, 01 Feb 2024 18:39:49 +0000
Received: by outflank-mailman (input) for mailman id 674690;
 Thu, 01 Feb 2024 18:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6Mk=JK=proton.me=johnlpoole@srs-se1.protection.inumbo.net>)
 id 1rVbyW-0005Sh-9L
 for xen-devel@lists.xen.org; Thu, 01 Feb 2024 18:39:49 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ae1948-c131-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 19:39:45 +0100 (CET)
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
X-Inumbo-ID: 44ae1948-c131-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1706812782; x=1707071982;
	bh=cPs6kKUUuYzW4X1WmKezrCve1xfZwxiuH9eHp/d/dQc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=C60h4l9V47Uv8ngHpztHjRH6LgCBr5+wpZvTndIGbQHitu3Z9txpiQQ/+TdETi7Gi
	 4edUt1a7iTqz3iRmaVjmOPEROrCIyoZSMBY2AxVcfnTmaCS1UVmJ6MQokHtqF8OFJU
	 V9wYmX4+iLHn7jhW/J1Jn15oS/AfCfYsAZz+wmTxLdfIDKbRTvnL1ZbOEgGHLyHZcJ
	 /U+9gMdLv3Q83cFnjA76iwoCk9M+MAh2dJX31cG0ipgItA7xfPtz7mmhymzRmL4N01
	 HnZQzgLxeRn5YIlIqkPV0FMwcg2boi3+vKWUPnkLNCJqCkcBueZrt787hzC8Bsg67Y
	 z5ggLVfIvEAyA==
Date: Thu, 01 Feb 2024 18:39:20 +0000
To: David Woodhouse <dwmw2@infradead.org>
From: "John L. Poole" <johnlpoole@proton.me>
Cc: xen-devel@lists.xen.org
Subject: Re: Nullifying Recently Introduced Xen Headers Check
Message-ID: <cj1qg72oASoR0AT_B5_w6AnPm5tf8K-muPdrGWSGYozXJ6N8vaMUI3XMVBx2IoAYlKPAyUTewevznMbj6S0t3plMygEAS8_HtUVubMXo1dA=@proton.me>
In-Reply-To: <4b5b1fdadbabd53116d1ab79295b913c27947c4b.camel@infradead.org>
References: <fb379476-f6ae-4eb7-b3c6-6f0ad175964d@proton.me> <4b5b1fdadbabd53116d1ab79295b913c27947c4b.camel@infradead.org>
Feedback-ID: 80499891:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thursday, February 1st, 2024 at 9:18 AM, David Woodhouse <dwmw2@infradea=
d.org> wrote:

> (Thanks Andy for the explicit cc)
>=20
> On Thu, 2024-02-01 at 00:05 +0000, John L. Poole wrote:
>=20
> > cause Gentoo's build to error out. See line 24790:
> >=20
> > 5 | #error In Xen native files, include xen_native.h before other Xen h=
eaders
> >=20
> > at
> > https://salemdata.us/xen/xen_tools_20240128_Sun_174740.script.html.
> >=20
> > What I have done is create a patch for a draft Gentoo ebuild which
> > nullifies lines 4-6 by wrapping them in a comment:
>=20
>=20
> That isn't what the #error told you to do, though.
>=20
> 24788 In file included from ../qemu-xen/hw/xen/xen-operations.c:16:
> 24789 /var/tmp/portage/app-emulation/xen-tools-4.18.0/work/xen-4.18.0/too=
ls/qemu-xen/include/hw/xen/xen_native.h:5:2: error: #error In Xen native fi=
les, include xen_native.h before other Xen headers
> 24790 5 | #error In Xen native files, include xen_native.h before other X=
en headers
> 24791 | ^~~~~
>=20
> So it's hw/xen/xen-operations.h which is failing. As far as I can tell
> (visually and empirically because it does actually build elsewhere), it
> is doing what the #error said =E2=80=94 it is including xen_native.h befo=
re
> any other Xen headers.
>=20
> The first four non-comment lines of xen-operations.c should look
> something like this...
>=20
> #include "qemu/osdep.h"
> #include "qemu/uuid.h"
> #include "qapi/error.h"
>=20
> #include "hw/xen/xen_native.h"
>=20
> So... did you patch it so it doesn't start like that any more? Or does
> one of those first three files (perhaps qemu/osdep.h?) end up bringing
> in the Xen interface headers in a way that I didn't anticipate and
> which doesn't seem to happen elsewhere?
>=20
> I didn't cite the full gcc command line from line 24787 of your log
> because it's huge. Can you run a variant of that command to just give
> me the preprocessed output (-E -dD -o xen-operations.i).

Hi David,

To answer your questions: the patch consists only of this
modification of 3 lines in xen_native.h:

   https://921932.bugs.gentoo.org/attachment.cgi?id=3D883883

Otherwise, the 4.18 code tree is as released.

I'm without the know-how to run a variant of the emerge command
as you have requested, alas.  I just simply removed 3 lines that
were introduced into the 4.18 tree to achieve a successful build.
I posted to this list to learn what the negative impacts might be.=20

While the Xen Project "make" works, the Gentoo emerge
of app-emulation/xen-tools does not unless the three lines are
removed to simulate prior 4.17.3 and earlier code. =20

I suspect the Gentoo approach=20
of building tools first contributes to the problem.

Thank you,

John

