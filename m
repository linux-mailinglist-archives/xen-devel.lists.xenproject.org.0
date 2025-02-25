Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81875A43343
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 03:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895411.1304010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmkxI-0007Tm-6H; Tue, 25 Feb 2025 02:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895411.1304010; Tue, 25 Feb 2025 02:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmkxI-0007Rd-2K; Tue, 25 Feb 2025 02:45:56 +0000
Received: by outflank-mailman (input) for mailman id 895411;
 Tue, 25 Feb 2025 02:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cgXI=VQ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tmkxG-0007RX-8g
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 02:45:55 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04a2051-f322-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 03:45:51 +0100 (CET)
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
X-Inumbo-ID: a04a2051-f322-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740451550; x=1740710750;
	bh=ngMNkENh3tHI76r8sHg1Vcvc4HIoQCKXqHZ3or0PaEU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RTVfnO9Q3ydA3NpnzRICyyyQVIsu2txu88xrE8sAsKRXY0vcgE3xxbvfJCrmsw8iZ
	 eoZ51qehjhYEDQTIQ0m/kIusn2OHJN1sIn42s++uTD5mxUmTqogXqQeJmweG53NLWZ
	 pBn45gj8ohHfbRqWq4MRnsiFJdB2WkKcanWPpXJR2gSXFZWk0GkgI9tjEcwnnWZVqX
	 N5/wrKV9c7JjvyxG1/uEj1BqQZYrR4aiIA33/9nq7tzfOrEaHk+1BRaSR63gvXwLhi
	 wlL7fFtOI/4z9tsRGqic2EHeVl85GwPU0qaD1xKWDSWiPFcpwRW5O4CoMNrBlRiVa0
	 8sOHZ4SrEEO0A==
Date: Tue, 25 Feb 2025 02:45:44 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable
Message-ID: <OyVZrdA69HTSGgzR--Ww8VQODmbKn_9CUDbnqVClk7Mkep-tQdOluHw2ofeoLekSohbc28ZSabP4l6O3dIQwrO_7jk6L7RxQwYs-6QxpLuE=@proton.me>
In-Reply-To: <3826b034-be99-4f43-ac55-d616e473ab40@suse.com>
References: <20250212222157.2974150-1-dmukhin@ford.com> <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com> <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me> <3826b034-be99-4f43-ac55-d616e473ab40@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4fc3c3199a94ba68e35fc12d6b12d669167cfe76
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, February 24th, 2025 at 2:44 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>=20
>=20
> On 21.02.2025 21:52, Denis Mukhin wrote:
>=20
> > On Tuesday, February 18th, 2025 at 8:05 AM, Jan Beulich jbeulich@suse.c=
om wrote:
> >=20
> > > On 12.02.2025 23:31, dmkhn@proton.me wrote:
> > >=20
> > > > --- a/xen/drivers/char/Kconfig
> > > > +++ b/xen/drivers/char/Kconfig
> > > > @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
> > > >=20
> > > > Default value is 32768 (32KiB).
> > > >=20
> > > > +config CONRING_SIZE
> > > > + int "Console buffer size"
> > > > + default 32768
> > > > + range 16384 134217728
> > > > + help
> > > > + Select the boot console buffer size (in bytes).
> > >=20
> > > Why in bytes when ...
> > >=20
> > > > + Note, the value provided will be rounded down to the nearest powe=
r of 2.
> > >=20
> > > ... this rounding is done anyway? Why have people type in complicated=
 numbers?
> > > A granularity of 1k would already be an improvement; yet better would=
 be if
> > > this was a power-of-two value altogether.
> >=20
> > My understanding that the semantics of new CONFIG_CONRING_SIZE build-ti=
me setting
> > should be consistent with existing boot-time conring_size=3D behavior (=
string value
> > converted to number of bytes).
> >=20
> > I can update both to round up to 1k boundary.
> >=20
> > I also agree that having power of 2s for both (e.g. similar to Linux'es=
 CONFIG_LOG_BUF_SHIFT)
> > will be the simplest (implementation) and non-ambigous.
> > I had it done earlier:
> > https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-26-e9aa92312=
7eb@ford.com/
>=20
>=20
> I'd prefer the power-of-2 approach, yet I could live with the Kb-based on=
e as
> was suggested by Roger.

Just to double check: I think it makes sense to switch both build-time and =
run-time
settings to use the same size calculation algorithm (e.g. Kb-based) to avoi=
d
confusion during building hypervisor configuration.

Will that be OK to do such change?

>=20
> > Also, since there's a build-time configuration parameter along with the=
 boot-time
> > configuration, perhaps it makes sense to retire boot-time setting in fa=
vor of
> > build-time setting?
>=20
>=20
> Why would that be? Build-time settings can only ever be defaults. We don'=
t
> know what people need in their configurations.

I was thinking about few reasons.
In embedded setup run-time settings are unlikely to change, it is mostly
built-time configuration.
On a server setup, bumping the size of console buffer morelikely means some
debugging, which to me means new xen binary can be re-generated and re-depl=
oyed.
Also, having dynamically configured options will add some extra burden for =
the
follow-on cert work.

I will keep both, just want to make sure that both settings are preferred.

>=20
> Jan

