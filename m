Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A740B17832
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 23:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066475.1431698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhapK-0001Rx-9M; Thu, 31 Jul 2025 21:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066475.1431698; Thu, 31 Jul 2025 21:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhapK-0001QP-6M; Thu, 31 Jul 2025 21:28:38 +0000
Received: by outflank-mailman (input) for mailman id 1066475;
 Thu, 31 Jul 2025 21:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhapJ-0001QI-3U
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 21:28:37 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f970e9d-6e55-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 23:28:33 +0200 (CEST)
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
X-Inumbo-ID: 4f970e9d-6e55-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753997312; x=1754256512;
	bh=AAlIWml7bcoENwEStdn/K43hhrFAS8Fyi4C7owG9jEg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZoIIpCaMi3aBQ3hkApyzIpDDz0nMyhLusXytZesM9kU8Ge6Sy4R6Z8lt6ATNWJ/ZY
	 kAWEdIhQ5VtT8oKPJx/Hzk1oderqCxlWqJju55ditYX/5InOwnwvMX7VY7rTr/PlCP
	 BoYA46msjsjKh+5enYk8oqI4nkCBHQ2uB3ICSyQCL4l3KRF6TWRIWsVKgGYqwX0Rt1
	 rASyVxd4v9wLa5SJifzhzMuvFZQvVD8h92/XSy7TX/7C3nzxdhewvHSqAB9Hnxv24h
	 4+hY4Gz88q0jo+Yq2n98hMkTDRwQItzP9n3CMOfrwSTdkaHR1IIDuKisfQ/8quwKnJ
	 a0EaFWXAHMhTw==
Date: Thu, 31 Jul 2025 21:28:28 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] xen/console: remove __printk_ratelimit()
Message-ID: <aIvf+FHRFgqZmQgA@kraken>
In-Reply-To: <528f4bd1-4a2f-4fa1-94cc-363a5f5fdbea@suse.com>
References: <20250725212235.753363-1-dmukhin@ford.com> <290ae958-4fba-42d8-a64b-d44845b85491@xen.org> <aade04e0-737f-481c-9ed1-1275969c2ef7@suse.com> <aIlIm7F5L3WQLoWd@kraken> <4292abbe-28b1-4545-87af-b37dd4ace53e@suse.com> <aIpfH5Cy10o8VMCu@kraken> <528f4bd1-4a2f-4fa1-94cc-363a5f5fdbea@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0544253cd5abf37931af09e17bf8700111222670
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thanks for the feedback.

On Thu, Jul 31, 2025 at 08:23:16AM +0200, Jan Beulich wrote:
> On 30.07.2025 20:06, dmkhn@proton.me wrote:
> > On Wed, Jul 30, 2025 at 07:35:04AM +0200, Jan Beulich wrote:
> >> On 30.07.2025 00:18, dmkhn@proton.me wrote:
> >>> On Mon, Jul 28, 2025 at 11:32:43AM +0200, Jan Beulich wrote:
> >>>> On 26.07.2025 11:20, Julien Grall wrote:
> >>>>> On 25/07/2025 22:24, dmkhn@proton.me wrote:
> >>>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>>
> >>>>>> __printk_ratelimit() is never used outside of the console driver.
> >>>>>> Remove it from the lib.h and merge with the public printk_ratelimi=
t().
> >>>>>
> >>>>> Is this solving any sort of violation? Asking because even if the
> >>>>> function is only used by one caller, I could see a benefit to be ab=
le to
> >>>>> use different value for the ratelimit. So I leaning towards keep th=
e
> >>>>> code as-is.
> >>>>
> >>>> +1
> >>>>
> >>>> In fact I'm surprised (or maybe not) that we still don't make better=
 use
> >>>> the rate limiting functionality.
> >>>
> >>> Out of curiosity, do you have any ideas re: make better use of the ra=
te
> >>> limiting functionality?
> >>
> >> No concrete ones; thinking about this has been way too long ago.
> >>
> >>> Build-time parameterization?
> >>
> >> That and/or command line controls.
> >
> > Got it.
> >
> > Can you please explain why exporting __printk_ratelimit() is still requ=
ired
> > for implementation of build/command line settings in console.c?
>=20
> I didn't say console.c, did I? Whatever subsystem wanted to do proper rat=
e

But you also did not say anything about idea of having per-subsystem rate
limiting.

> limiting would need to gain some way of controlling this (as said, build
> time or cmdline driven), and it'll then need that function: How would it
> effect the behavior with custom ms and/or burst values, without having
> that function to call? (It is another thing that the function, using stat=
ic
> variables rather than per-caller state, may not be quite ready for that
> kind of use. Also the arbitrary and hard-coded 10 * 5 * 1000 there would
> probably also want to be customizable.)
>=20
> What you may want to do for Misra's sake is make the function static for
> the time being. The compiler will then fold it into its sole caller,
> until some new user appears. (At that occasion dropping one of the
> underscores may also be reasonable.)

Do I understand it correctly that you will accept the following submission:
 1) make __printk_ratelimit() static
 2) drop one underscore from the name
 3) keep the only call __printk_ratelimit() in a hope of there will be
    per-subsystem rate limiting in the future?

--
Denis

>=20
> Jan
>=20


