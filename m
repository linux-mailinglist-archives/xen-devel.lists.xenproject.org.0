Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA6B16645
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 20:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064393.1430060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBag-0008EJ-4M; Wed, 30 Jul 2025 18:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064393.1430060; Wed, 30 Jul 2025 18:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhBag-0008Bi-1i; Wed, 30 Jul 2025 18:31:50 +0000
Received: by outflank-mailman (input) for mailman id 1064393;
 Wed, 30 Jul 2025 18:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Z10=2L=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhBad-0008BJ-Kl
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 18:31:48 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722a1bec-6d73-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 20:31:45 +0200 (CEST)
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
X-Inumbo-ID: 722a1bec-6d73-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753900303; x=1754159503;
	bh=b5n73VCyaVuuG9a+By13QW5zXMlFX4yWQsKS+Efmtfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YCn90DXRXMdGdAmV1wPNrYGry+5V8FV0jF5AboNKJ8y2seShkIW3ptIqOZ4Soyl4n
	 1i4raYBlpUql8ImR119wGKAvDi7pmc5AIuURJzkDBAu/BiKWlt8tR8goNdqVtRX5ux
	 /AMbDYuoPrAZ8GZimgVGglBE+ucHRIoRF9OS+BiuenrUT96uPKBAjdxyP8gqWOoYWH
	 NtpF7b2v7owGNkYB6kgGS8NN/eXR4gG9jhsvXgZjGQgj/PyjBq57pgYwHinUnRpaGT
	 iwBWlxGM3qv8bUWwPWTi2MueDhqZYIepQmDN9/eGOKfma6Rnh/iAWcZEfE7LX8G2nA
	 TgaOwatU4TGVQ==
Date: Wed, 30 Jul 2025 18:31:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: ensure polling timer is disarmed
Message-ID: <aIplBkq7BL52Fn/Q@kraken>
In-Reply-To: <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com>
References: <20250730031249.1613142-1-dmukhin@ford.com> <5a4dc92b-139d-4fa5-9baf-2ebc41bba758@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a6072c2abc006024fcc9ec8b9d24abd8b804d628
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 10:12:54AM +0200, Jan Beulich wrote:
> On 30.07.2025 05:13, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > As it stands, polling timer is kept in the list of timers even after th=
e
> > interrupts have been enabled / polling disabled on ns16550-compatible U=
ART.
> >
> > Ensure polling timer is removed from the timer list once UART interrupt=
s are
> > enabled.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> Wasn't it Andrew(?) who suggested something along these lines? That would
> want reflecting by a tag then.

Yes, indeed.

>=20
> Also, what's the real problem you want to solve here? The timer function
> would be run one more time after ->intr_works is set, and then the timer
> will be permanently inactive (up to a possible S3 resume). Is it being on
> an inactive list an actual problem? (IOW I'd like to understand if the
> change is merely cosmetic, or if there is some actual benefit.)

My understanding is running polling timer one more time after the interrupt=
s
are enabled is the issue: if there's a pending timer when it is known the
timer not needed, then the timer should be canceled.

>=20
> Jan


