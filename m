Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8DBB15530
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 00:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063210.1429006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugseE-0003V4-Sy; Tue, 29 Jul 2025 22:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063210.1429006; Tue, 29 Jul 2025 22:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugseE-0003TJ-Pv; Tue, 29 Jul 2025 22:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1063210;
 Tue, 29 Jul 2025 22:18:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TdY=2K=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugseC-0003TB-JV
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 22:18:12 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9c914d4-6cc9-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 00:18:11 +0200 (CEST)
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
X-Inumbo-ID: e9c914d4-6cc9-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753827490; x=1754086690;
	bh=ku2hGNPZSfOr3lejpzD+mQo8UaeQO5xgSoz7UJMTTsk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FklBy/JFHNINHMHuNnz+0JxkuMRosM8GmiUUzMyFa0VQ2wi8qkXg1rff+P8NjMO0W
	 exro6l/1oKvsw2Kc682wJVk5WZWSQe5d34sw0yUZbBhJIzHAmD/p2w7HlbY0uWn8Ep
	 O5lwsjnwk9NWM/H9ZKTf+kxPbZTRSTIKwCqFhoIwfEhaK1Dny+6ML95d4gzTo8XYC3
	 feydnOC7EHwa0ydAHrpsRASjGPrmIUlcNVUNbEoiV5nMZ4gwPBImGYnS6gAEBjCyV+
	 7hI/I8+dk9sWXM2MtFd0HLlFBc1uGApXKPreIbxgcJkQ4odsHwEpJQdYhnyCbdp3if
	 V5C0Wi407Mf/w==
Date: Tue, 29 Jul 2025 22:18:07 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <aIlIm7F5L3WQLoWd@kraken>
In-Reply-To: <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com>
References: <20250725212235.753363-1-dmukhin@ford.com> <290ae958-4fba-42d8-a64b-d44845b85491@xen.org> <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7c5ca26b9df21a2b9b50be12773dbc82df7183e8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
> On 26.07.2025 11:20, Julien Grall wrote:
> > On 25/07/2025 22:24, dmkhn@proton.me wrote:
> >> From: Denis Mukhin <dmukhin@ford.com>
> >>
> >> __printk_ratelimit() is never used outside of the console driver.
> >> Remove it from the lib.h and merge with the public printk_ratelimit().
> >
> > Is this solving any sort of violation? Asking because even if the
> > function is only used by one caller, I could see a benefit to be able t=
o
> > use different value for the ratelimit. So I leaning towards keep the
> > code as-is.
>=20
> +1
>=20
> In fact I'm surprised (or maybe not) that we still don't make better use
> the rate limiting functionality.

Out of curiosity, do you have any ideas re: make better use of the rate
limiting functionality?

Build-time parameterization?

>=20
> Jan
>=20


