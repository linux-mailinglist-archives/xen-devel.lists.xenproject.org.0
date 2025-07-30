Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B9B165FF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 20:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064356.1430042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBCM-0003ed-2i; Wed, 30 Jul 2025 18:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064356.1430042; Wed, 30 Jul 2025 18:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBCL-0003bW-Vu; Wed, 30 Jul 2025 18:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1064356;
 Wed, 30 Jul 2025 18:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhBCI-0003bO-Qd
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 18:06:40 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed2d6705-6d6f-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 20:06:33 +0200 (CEST)
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
X-Inumbo-ID: ed2d6705-6d6f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753898791; x=1754157991;
	bh=nLpl8+wc7lqPmtuInjNAQ5G6FZtR5UHYVEqgW/hRV9U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N8gSVI2HNt5XPOH73oEn5QeJ2ktj3HIGEOh8lNOHAzy2BhYbEoMU6k5jiEN17wq5N
	 hujpTX8xB7nPQeS1tid/CY1Ry93cwuB8EGvSi39LJn8/wvJbbtgdX9qiLweGY5iJXW
	 J//99IHNm4RGrIje+JuYQ0soQQ9BU587McVEYRE6l53KFADfkf0I60jgk3fh3kofZb
	 fi6FwO+6YxWUWCA72VYw8/1ycirfbOtnWBHbVHs/qkWeiIyX3IW+Ob73lXc4i5e5Au
	 tWxhSrvPBkWedhFYJkPBGaUXSoWvJQmeT7i+HQj/oBx65nLxWgaNF5u5U6Sy90OWGI
	 CmnB6WHb7X6tw==
Date: Wed, 30 Jul 2025 18:06:27 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <aIpfH5Cy10o8VMCu@kraken>
In-Reply-To: <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com>
References: <20250725212235.753363-1-dmukhin@ford.com> <290ae958-4fba-42d8-a64b-d44845b85491@xen.org> <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com> <aIlIm7F5L3WQLoWd@kraken> <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c07fdf8b757209a92172ee7411723c4348ded95e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 07:35:04AM +0200, Jan Beulich wrote:
> On 30.07.2025 00:18, dmkhn@proton.me wrote:
> > On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
> >> On 26.07.2025 11:20, Julien Grall wrote:
> >>> On 25/07/2025 22:24, dmkhn@proton.me wrote:
> >>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> __printk_ratelimit() is never used outside of the console driver.
> >>>> Remove it from the lib.h and merge with the public printk_ratelimit(=
).
> >>>
> >>> Is this solving any sort of violation? Asking because even if the
> >>> function is only used by one caller, I could see a benefit to be able=
 to
> >>> use different value for the ratelimit. So I leaning towards keep the
> >>> code as-is.
> >>
> >> +1
> >>
> >> In fact I'm surprised (or maybe not) that we still don't make better u=
se
> >> the rate limiting functionality.
> >
> > Out of curiosity, do you have any ideas re: make better use of the rate
> > limiting functionality?
>=20
> No concrete ones; thinking about this has been way too long ago.
>=20
> > Build-time parameterization?
>=20
> That and/or command line controls.

Got it.

Can you please explain why exporting __printk_ratelimit() is still required
for implementation of build/command line settings in console.c?

>=20
> Jan


