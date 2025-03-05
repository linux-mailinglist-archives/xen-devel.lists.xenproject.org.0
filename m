Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C70A4F356
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 02:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901699.1309659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdMv-0008UH-Ui; Wed, 05 Mar 2025 01:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901699.1309659; Wed, 05 Mar 2025 01:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpdMv-0008RS-Ri; Wed, 05 Mar 2025 01:16:17 +0000
Received: by outflank-mailman (input) for mailman id 901699;
 Wed, 05 Mar 2025 01:16:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vvpY=VY=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tpdMu-0008BT-Os
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 01:16:16 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee0273c-f95f-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 02:16:15 +0100 (CET)
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
X-Inumbo-ID: 6ee0273c-f95f-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741137374; x=1741396574;
	bh=9uHUztNyLmT7su3aewSSpWdH3XbIZBZ3jd5kj2ptHmg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hy5mm/xfmzCiYsSDf/1kKD6rYPFIKv9/MAnKPUfVz1SHGLBV/dgTEYSX+EaBO5FEB
	 asGrD7u56Piubl6dW0Q04nMw+JqNb1qIPGfpAvnKzrSUGFpCqEiNuW1OcarEWYJZpt
	 amNz3ps9pIfeP0eh5MzJCbvNSTfOsWmBHOCi6zYa0c6a03UjCUa7GYP0dTfbgAdnf1
	 mTtSd3vbb/UB+wmNcXkZUER5XUnScwyIjFqwOVYb2pcZEp260rMegMLUDVWOzj+0S0
	 zS6kiSsZgFIzq/AF2yRMcLuyGmgkJ3iUUkZk5kE8SYxUvXrC0FQZiTSGCXp70QN9q4
	 60ijSIl1nuS+Q==
Date: Wed, 05 Mar 2025 01:16:08 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: make console buffer size configurable
Message-ID: <FeSvjW7Hj0OqRIqxJaLUxZ_5uXXC26qMLMFE-gCdYtMcbgKGi3uAl8zByRbiuHvEJVI3BeaoR2STgXak0NjvxHW0y3weTLZyANai2bZ7NIo=@proton.me>
In-Reply-To: <224c2c94-0835-4ba9-88d7-c57bb1cd4ee8@suse.com>
References: <20250212222157.2974150-1-dmukhin@ford.com> <4203576f-0b93-4647-9983-e36c15fa1d0c@suse.com> <o_C90Tb8fjLMkG-pSNmxycIsYytdAxHSTU7yrudH07-h6L9e4XGirmyyKKSRQsLuOyYwA6b-9jd8kOOnM21yC8I-6q5EzcX2lsLHcbgGqec=@proton.me> <3826b034-be99-4f43-ac55-d616e473ab40@suse.com> <OyVZrdA69HTSGgzR--Ww8VQODmbKn_9CUDbnqVClk7Mkep-tQdOluHw2ofeoLekSohbc28ZSabP4l6O3dIQwrO_7jk6L7RxQwYs-6QxpLuE=@proton.me> <224c2c94-0835-4ba9-88d7-c57bb1cd4ee8@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 92d3755ecab5dc81ce6e20182de8626d6ad145d8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, February 24th, 2025 at 11:23 PM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>=20
>=20
> On 25.02.2025 03:45, Denis Mukhin wrote:
>=20
> > On Monday, February 24th, 2025 at 2:44 AM, Jan Beulich jbeulich@suse.co=
m wrote:
> >=20
> > > On 21.02.2025 21:52, Denis Mukhin wrote:
> > >=20
> > > > On Tuesday, February 18th, 2025 at 8:05 AM, Jan Beulich jbeulich@su=
se.com wrote:
> > > >=20
> > > > > On 12.02.2025 23:31, dmkhn@proton.me wrote:
> > > > >=20
> > > > > > --- a/xen/drivers/char/Kconfig
> > > > > > +++ b/xen/drivers/char/Kconfig
> > > > > > @@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
> > > > > >=20
> > > > > > Default value is 32768 (32KiB).
> > > > > >=20
> > > > > > +config CONRING_SIZE
> > > > > > + int "Console buffer size"
> > > > > > + default 32768
> > > > > > + range 16384 134217728
> > > > > > + help
> > > > > > + Select the boot console buffer size (in bytes).
> > > > >=20
> > > > > Why in bytes when ...
> > > > >=20
> > > > > > + Note, the value provided will be rounded down to the nearest =
power of 2.
> > > > >=20
> > > > > ... this rounding is done anyway? Why have people type in complic=
ated numbers?
> > > > > A granularity of 1k would already be an improvement; yet better w=
ould be if
> > > > > this was a power-of-two value altogether.
> > > >=20
> > > > My understanding that the semantics of new CONFIG_CONRING_SIZE buil=
d-time setting
> > > > should be consistent with existing boot-time conring_size=3D behavi=
or (string value
> > > > converted to number of bytes).
> > > >=20
> > > > I can update both to round up to 1k boundary.
> > > >=20
> > > > I also agree that having power of 2s for both (e.g. similar to Linu=
x'es CONFIG_LOG_BUF_SHIFT)
> > > > will be the simplest (implementation) and non-ambigous.
> > > > I had it done earlier:
> > > > https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-26-e9aa9=
23127eb@ford.com/
> > >=20
> > > I'd prefer the power-of-2 approach, yet I could live with the Kb-base=
d one as
> > > was suggested by Roger.
> >=20
> > Just to double check: I think it makes sense to switch both build-time =
and run-time
> > settings to use the same size calculation algorithm (e.g. Kb-based) to =
avoid
> > confusion during building hypervisor configuration.
> >=20
> > Will that be OK to do such change?
>=20
>=20
> No, you can't change existing command line options like this, at least no=
t
> without a very good reason. You'd break existing uses. Plus there is
>=20
> size_param("conring_size", opt_conring_size);
>=20
> already anyway, so the command line option can be used with Kb and other
> granularities without any adjustments to the code.

OK, thanks.

>=20
> > > > Also, since there's a build-time configuration parameter along with=
 the boot-time
> > > > configuration, perhaps it makes sense to retire boot-time setting i=
n favor of
> > > > build-time setting?
> > >=20
> > > Why would that be? Build-time settings can only ever be defaults. We =
don't
> > > know what people need in their configurations.
> >=20
> > I was thinking about few reasons.
> > In embedded setup run-time settings are unlikely to change, it is mostl=
y
> > built-time configuration.
> > On a server setup, bumping the size of console buffer morelikely means =
some
> > debugging, which to me means new xen binary can be re-generated and re-=
deployed.
>=20
>=20
> That depends on who's doing the debugging and who's giving the instructio=
ns.
> A developer telling a customer to increase the buffer size is certainly
> easier when it simply means adding/changing a command line option, for
> example.

Ack.

>=20
> Jan

