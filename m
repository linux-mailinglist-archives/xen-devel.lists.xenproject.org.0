Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D7B1785A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 23:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066513.1431709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhb2P-0004bk-Co; Thu, 31 Jul 2025 21:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066513.1431709; Thu, 31 Jul 2025 21:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhb2P-0004ZR-A5; Thu, 31 Jul 2025 21:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1066513;
 Thu, 31 Jul 2025 21:42:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhb2M-0004ZG-Ft
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 21:42:07 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339355af-6e57-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 23:42:05 +0200 (CEST)
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
X-Inumbo-ID: 339355af-6e57-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753998123; x=1754257323;
	bh=ZFiPf6Q1IUag9JyW3jZDRfhV1/S3CIFye9NJ5Vlv1Bg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TVs+lxoixD7Ij/94FKA0PIzP3C051+JkUxB1BSqb4fpCxc3wjPdvPSc6HSY2QDmKQ
	 hCzKuiS85vuvxb1q9CACobUM/8G+LoPfAgBJvFgp/14VQNuU+FwH5IC996VyI9293E
	 ZOZG2FjgcwmAv81sA+PArtveiDOk8oJvFfKV7a5342IR8X4/mlkuSwwwUscjcEgHmN
	 4jmgtgAIFiKNcVx8gVy9CTHGC5uUk7p1ZmLIq6LkltQOCmTBXPhvFAd0FpU7sOxtEW
	 GsPzdYt7AmvIA78t9b0WVL5TJgszBkZ5HADMTOaDYY3zcoeR2UaBAXHnqUNV2VGZi7
	 0BnKkLlXzs/mw==
Date: Thu, 31 Jul 2025 21:42:01 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
Message-ID: <aIvjJP6bpJpsQRtQ@kraken>
In-Reply-To: <78128ec6-b79f-4d4c-a298-72315b190036@suse.com>
References: <20250730031249.1613142-1-dmukhin@ford.com> <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com> <aIplBkq7BL52Fn/Q@kraken> <78128ec6-b79f-4d4c-a298-72315b190036@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: dc797e1d8a0cd4b6e581fd8bc3040c636deb4387
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 08:54:10AM +0200, Jan Beulich wrote:
> On 30.07.2025 20:31, dmkhn@proton.me wrote:
> > On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
> >> On 30.07.2025 05:13, dmkhn@proton.me wrote:
> >>> From: Denis Mukhin <dmukhin@ford.com>
> >>>
> >>> As it stands, polling timer is kept in the list of timers even after =
the
> >>> interrupts have been enabled / polling disabled on ns16550-compatible=
 UART.
> >>>
> >>> Ensure polling timer is removed from the timer list once UART interru=
pts are
> >>> enabled.
> >>>
> >>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> >>
> >> Wasn't it Andrew(?) who suggested something along these lines? That wo=
uld
> >> want reflecting by a tag then.
> >
> > Yes, indeed.
> >
> >>
> >> Also, what's the real problem you want to solve here? The timer functi=
on
> >> would be run one more time after ->intr_works is set, and then the tim=
er
> >> will be permanently inactive (up to a possible S3 resume). Is it being=
 on
> >> an inactive list an actual problem? (IOW I'd like to understand if the
> >> change is merely cosmetic, or if there is some actual benefit.)
> >
> > My understanding is running polling timer one more time after the inter=
rupts
> > are enabled is the issue: if there's a pending timer when it is known t=
he
> > timer not needed, then the timer should be canceled.
>=20
> And the effort of canceling outweighs the one extra running of the timer?

I think so, because intr_works will not flip at run-time once set.
If so, no need to keep the timer ready to be rearmed.

>=20
> Jan


