Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8840B177A4
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 23:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066445.1431678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaR4-0005ta-5R; Thu, 31 Jul 2025 21:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066445.1431678; Thu, 31 Jul 2025 21:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhaR4-0005s3-2o; Thu, 31 Jul 2025 21:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1066445;
 Thu, 31 Jul 2025 21:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhaR3-0005rp-0c
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 21:03:33 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0bf6282-6e51-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 23:03:32 +0200 (CEST)
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
X-Inumbo-ID: d0bf6282-6e51-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753995810; x=1754255010;
	bh=bBWu5RC/ZcaHHxnMvO0YJUhDcmAHh+EYqtQNOSQy9uE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IegN2l1KwrQ5ozf7beUDNV+3y8J3fKGGAMXLwGwkwgWXWruRvNaevgFLmNxjIs99I
	 EW0qBEnI/6B6e6TuhdK07ziCJ5pOGx2qrf/qfsrSAFCDL/qxPS3BywfM4xF9dEiSmj
	 MdYTIu3EW/BbRXkngw6m9T/SW1mv0cS2A20NAZzSnCXRuFO/ooGPTxj4sgdwkeY0YJ
	 Era2iIamuuKNEHUd9lK0FQ2MF6A4f3XzfBvy8JzWdbevWtF1l4lmwq6Nh4SwagW115
	 uNYCDI1BJgKWU+Yla5Pd6d8cj/iHFAnWu5e02fHtvh5B/2eIBI50xhnhm6RMMzQBkL
	 u1wZZs4QDNyUQ==
Date: Thu, 31 Jul 2025 21:03:27 +0000
To: "Orzel, Michal" <michal.orzel@amd.com>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 04/16] arm/vpl011: use raw spin_lock_{irqrestore,irqsave}
Message-ID: <aIvaGtNBQ7F85g8g@kraken>
In-Reply-To: <096ba4c4-16eb-43cd-ae4a-6ef654f08ccf@amd.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-5-dmukhin@ford.com> <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com> <0cfc9465-90d5-46db-88a7-ed47d0809b60@amd.com> <aFscml2vxO1sLzoR@kraken> <096ba4c4-16eb-43cd-ae4a-6ef654f08ccf@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c9959dc44e45d73a023d7428a5116e1962254086
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 08:52:39AM +0200, Orzel, Michal wrote:
>=20
>=20
> On 24/06/2025 23:46, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 09:50:54AM +0200, Orzel, Michal wrote:
> >>
> >>
> >> On 24/06/2025 07:46, Jan Beulich wrote:
> >>> On 24.06.2025 05:55, dmkhn@proton.me wrote:
> >>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>
> >>>> Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to impro=
ve
> >>>> readability.
> >>>
> >>> I'm not an Arm maintainer, so I have limited say here, but: How is th=
is
> >>> improving readability? It better utilizes available local variables, =
yes,
> >>> so this may be a little bit of an optimization, but otherwise to me t=
his
> >>> looks to rather hamper readability.
> >> I agree with Jan here. I don't think it improves readability, therefor=
e I don't
> >> think such change is needed.
> >
> > I think exdanding macros helps to understand the code since is explicit=
ly
> > shows what kind of locking *really* used, so this aspect is actually ge=
tting
> > more readable; yes, that's a bit of more text.
> >
> > But, MMIO-based flavor does not define such helpers for example, so now=
 vUARTs
> > follow similar coding pattern which is easy to read/follow.
> I understand your point of view. It's more like a matter of taste here, s=
o I
> won't oppose to it. Others may chime in.

Thank you.

>=20
> ~Michal
>=20


