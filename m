Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DFA332EC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886880.1296471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLdy-00046E-9G; Wed, 12 Feb 2025 22:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886880.1296471; Wed, 12 Feb 2025 22:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLdy-00043U-5t; Wed, 12 Feb 2025 22:55:46 +0000
Received: by outflank-mailman (input) for mailman id 886880;
 Wed, 12 Feb 2025 22:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O++Y=VD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiLdv-00041s-Fj
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:55:44 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b70e07d-e994-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 23:55:41 +0100 (CET)
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
X-Inumbo-ID: 7b70e07d-e994-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739400939; x=1739660139;
	bh=CFI/or2Y54QcfIcU7aL0MZ6OT0fV/AOcH1G6cEWaz4I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mK3qu47Y0f9jZYvLs29NfU1TznYbleo0PHi4FkQPJXAKZOIYwH3hfvZvQIvfTk51V
	 iogLhNgJjmtDuhwegDIp56Fu4KcsrcZJ9ncSac+dvGhwSNxBpv8szFDBhRyVke6Fg3
	 0TpcRC8mFT/8MixRPaUB2WvYhkwZQocF6BzV9RQBe/5L81oRNqS/VC+aE02C34yTMp
	 d8mRlS5mNdawIp2t18hmajUjVV+KMvtW6XMFK3XrplnXEsP4tx4LCFUNrypOhG7NeV
	 d4ZGUvoxQzKT/y4FdX9rqPhcmul4J2K3P/79tkLcKpxtVd6VK3ld9NpNirm4p7dDRb
	 eKcmWFVq4JbPA==
Date: Wed, 12 Feb 2025 22:55:35 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 15/24] xen/console: make console buffer size configurable
Message-ID: <-Vypoc7aCvpezT4XIi4SuC0xcmwka9oxXZCcdzjXvfeiD7-NS1fKS1Gzu9DWASOrPTdX5vGznvRGa4E5XLW3YO00qD3nKN1cTrX2XvBZEbs=@proton.me>
In-Reply-To: <b4426452-16cc-4a85-84b1-8e27152796d4@suse.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com> <20250103-vuart-ns8250-v3-v1-15-c5d36b31d66c@ford.com> <d471f3b0-5638-47b3-927e-318b0575eaa3@suse.com> <RKwzueYurWHDxryD0KUwTcZHRfprlyr4H0fIq4w-yV2i5uK4XfDGrWsUBgt8FnW4R-28hIjbclYcGVP62eLjfFAIwNjXzP0Qj2sajURd-8s=@proton.me> <b4426452-16cc-4a85-84b1-8e27152796d4@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0d57610a5a7ede97cb24942124f930d5ae6c7701
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 28th, 2025 at 11:53 PM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>=20
>=20
> On 29.01.2025 04:04, Denis Mukhin wrote:
>=20
> > On Tuesday, January 28th, 2025 at 8:32 AM, Jan Beulich jbeulich@suse.co=
m wrote:
> >=20
> > > On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> > >=20
> > > > From: Denis Mukhin dmukhin@ford.com
> > > >=20
> > > > Add new CONRING_SIZE Kconfig parameter to specify the boot console =
buffer size
> > > > in bytes. The value is rounded to the nearest power of 2 to match e=
xisting
> > > > conring_size=3D behavior.
> > > >=20
> > > > The supported range is [16KiB..128MiB].
> > > >=20
> > > > Bump default size to 32 KiB.
> > > >=20
> > > > Link: https://gitlab.com/xen-project/xen/-/issues/185
> > > > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > >=20
> > > As asked elsewhere already: How's this related to the goal of the ser=
ies?
> >=20
> > I mentioned in the cover letter that there are two group of patches - c=
onsole
> > driver cleanups/fixes and the follow on UART emulator (and up until v3 =
it was OK
> > to have this patch bundled into the series).
> >=20
> > Yes, I acknowledge that the first group of patches for console driver g=
rew big
> > and probably should have been posted in its own thread.
> >=20
> > I can move "console" part to its own series if it makes sense now.
> >=20
> > What do you think?
>=20
>=20
> I for one would appreciate you doing so. Where patches are independent, y=
ou
> may even want to consider posting them individually. That way it'll be cl=
ear
> they're isolated, and hence any one of them that is fully reviewed/acked =
can
> go in (once the tree is fully open again).

Moved patch to a separate thread:
  https://lore.kernel.org/xen-devel/20250212222157.2974150-1-dmukhin@ford.c=
om/

>=20
> Jan

