Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322614799F2
	for <lists+xen-devel@lfdr.de>; Sat, 18 Dec 2021 10:23:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249019.429470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myVue-0004Tu-1h; Sat, 18 Dec 2021 09:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249019.429470; Sat, 18 Dec 2021 09:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myVud-0004Qf-UA; Sat, 18 Dec 2021 09:21:55 +0000
Received: by outflank-mailman (input) for mailman id 249019;
 Sat, 18 Dec 2021 09:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Apz5=RD=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1myVub-0004P2-OR
 for xen-devel@lists.xenproject.org; Sat, 18 Dec 2021 09:21:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee88b5aa-5fe3-11ec-85d3-df6b77346a89;
 Sat, 18 Dec 2021 10:21:51 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 036F41F387;
 Sat, 18 Dec 2021 09:21:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7245E1377E;
 Sat, 18 Dec 2021 09:21:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GGnQGC2ovWGxAwAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Sat, 18 Dec 2021 09:21:49 +0000
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
X-Inumbo-ID: ee88b5aa-5fe3-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639819310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qWIpqQ866jaqBxBIGJbQdm5RkjAgGGMyg6WyGXAlqpA=;
	b=gaEBgoRt8SvtaKJq0BE9Bmw1M6IO0KnsP7Cv8zcqMCeGD/Qp6BkS9sDBQ8Bq9+5Dq4uGc8
	YFl9gZy6DoCQGHIc2QD+pkQ7Y6kTcmDuEoR4nhm9F4ruvn6zAsLxWt8tp8IL0DCiTRLy94
	n5Yn8O9br+8Ea17PrVERY5X+yyEh9lY=
Message-ID: <cc45051d695cb3f4ca0cc89f9e610c9e289bfe1c.camel@suse.com>
Subject: Re: [RFC 02/10] is_system_domain: replace open-coded instances
From: Dario Faggioli <dfaggioli@suse.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org
Cc: Christopher Clark <christopher.w.clark@gmail.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Sat, 18 Dec 2021 10:21:48 +0100
In-Reply-To: <20211217233437.13791-3-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
	 <20211217233437.13791-3-dpsmith@apertussolutions.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HFVG00BBEm3OMmMr9mAZ"
User-Agent: Evolution 3.42.1 (by Flathub.org) 
MIME-Version: 1.0


--=-HFVG00BBEm3OMmMr9mAZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-12-17 at 18:34 -0500, Daniel P. Smith wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>=20
> There were several instances of open-coded domid range checking. This
> commit
> replaces those with the is_system_domain inline function.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> =C2=A0xen/arch/x86/cpu/vpmu.c | 2 +-
> =C2=A0xen/common/domctl.c=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0xen/common/sched/core.c | 4 ++--
> =C2=A0xen/include/xen/sched.h | 5 +++++
>
The */sched* bits:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

But with a strong preference for renaming=20
is_system_domain_id() to is_system_domid(), as Andrew suggested.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-HFVG00BBEm3OMmMr9mAZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmG9qCwACgkQFkJ4iaW4
c+7VaxAAonRSx3rLYJCFEN48KjyPjXrIKn7Cyz4GOR10PW1XlqfTW/hI2Tdr7N2H
KyBJ74Pe+b784Lljj/6IeihxdgIEjQTa2S8/lOJtbH9CpkiVLJI+woEqQ9rnHm0Y
nK3p+DGALsWWIwmVjtyE/q1lbcAC9bzrWwsBphbCUhuCxSdVC5OWzkGqyRp0Yt+F
Wu1tinCpHUGFVMhiy9dAeFHvNjpKSvOZTTUvKuk0mUQI6uSosRnZQ8dq+udn+x90
lC0pRseFbcGPO5/UbFnE1AYccm32+y/vYOXDla3jWSfLDAM3IfdsNpSGBGLKUZcE
Tjeb56m74vj7H73efrtXV1quwjszQOleBgxZo3aE63Xpcs30BqGX6MeBRn5fE0GV
eEnOnk0ToO4n2kkLhussFU0Sz1vuJDDgqFLZF7qmddh+57/vOGBFFAGM+A64EipE
6PieGnRUa4VOmbpVMCNiTq175KQI5zdiv6fpdqku+gLGSC+bw1yh0sqwdB20x2BP
Kai41bTfsZKLVfPC6In4Ty/y6RZGKZzuNzR6jFnmKhWZ/e3uCuYqx3BFFkfYtpwx
4OaM91xLOQRtP8j8EyWmFdRyla9xHnOzVL4PFhWa6B3DVPNeHChYwy+5QP2yGq50
QbNr5n6x5b+WZPVaYeR28elYp7AEltcI4MLO5f2M3pSaA8z2t68=
=pfhO
-----END PGP SIGNATURE-----

--=-HFVG00BBEm3OMmMr9mAZ--

