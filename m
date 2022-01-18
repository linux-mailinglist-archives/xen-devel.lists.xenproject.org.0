Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A06492CA6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 18:50:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258613.445598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9sbe-0006ke-HS; Tue, 18 Jan 2022 17:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258613.445598; Tue, 18 Jan 2022 17:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9sbe-0006i1-EV; Tue, 18 Jan 2022 17:49:18 +0000
Received: by outflank-mailman (input) for mailman id 258613;
 Tue, 18 Jan 2022 17:49:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQbF=SC=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n9sbc-0006hv-Ug
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 17:49:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f387ab7b-7886-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 18:49:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8CF34212BC;
 Tue, 18 Jan 2022 17:49:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0700113DC8;
 Tue, 18 Jan 2022 17:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Psh2Opn95mHrLAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Tue, 18 Jan 2022 17:49:13 +0000
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
X-Inumbo-ID: f387ab7b-7886-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642528154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5EYQbuSQS57q+0J/ylkYt0w+G1ZK6xicD017oib6dvs=;
	b=el7THgtJhJcp+Nj76iHHl98TQllFCSYyo88jhM29jbDC+pKjxfchwRWB+ijl6Wop+m5DmR
	ylupbIeK3R+kGadaMXQsUOScDPPHcX2LfwvstSz72HupLUQ5wNVS6TqxXzwY6iiZLMh/dr
	ltWhiJf9UiiJGLHNiWoVxeiQsKjeDtw=
Message-ID: <8bae88c3e3ddd777537ed942943b0a871cd65f36.camel@suse.com>
Subject: Re: sched=null vwfi=native and call_rcu()
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <George.Dunlap@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>
Cc: "julien@xen.org" <julien@xen.org>, Jan Beulich <JBeulich@suse.com>, 
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, Roger Pau Monne
 <roger.pau@citrix.com>,  "Volodymyr_Babchuk@epam.com"
 <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Date: Tue, 18 Jan 2022 18:49:12 +0100
In-Reply-To: <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
References: 
	<alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
	 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
	 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
	 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
	 <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
	 <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
	 <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T/tAcri0S1JrRXMlwOXy"
User-Agent: Evolution 3.42.3 (flatpak git) 
MIME-Version: 1.0


--=-T/tAcri0S1JrRXMlwOXy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-01-17 at 12:13 +0100, Juergen Gross wrote:
> On 17.01.22 12:05, George Dunlap wrote:
> >=20
> > An x86 equivalent of vwfi=3Dnative could be implemented easily, but
> > AFAIK nobody has asked for it yet.=C2=A0 I agree that we need to fix if
> > for ARM, and so in the absence of someone with the time to fix up
> > the x86 side, I think fixing ARM-only is the way to go.
> >=20
> > It would be good if we could add appropriate comments warning
> > anyone who implements `hlt=3Dnative` on x86 the problems they=E2=80=99l=
l face
> > and how to fix them.=C2=A0 Not sure the best place to do that; in the
> > VMX / SVM code that sets the exit for HLT &c?
>=20
> But wouldn't a guest in a busy loop on x86 with NULL scheduler suffer
> from the same problem?
>=20
Right, and even more 'idle=3Dpoll' as a _guest_ kernel command line
parameter, IMO.

That does not change what happens when the guest issue an HLT, but it
drastically reduces the frequency of it doing so (or at least, it did
the last time I tried it).

So it's not exactly like wfi=3Dnative on ARM, but on the other hand, it
can be under the guest's control.

> And wouldn't that be a problem for PV guests, too?
>=20
Yeah, that's one of the things that makes it tricky

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-T/tAcri0S1JrRXMlwOXy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmHm/ZkACgkQFkJ4iaW4
c+6LQBAA59mduTzrLvBqfABMoKcjgIVML+GxuVZvgZZAWPLvwE8uK0drx9Z68AZ2
IpuADH6TB0lE8Tza4gZj63+TVensijINYC3j008GVcsR3pDmBTvvkw1ddPEAPf9Q
41XHnjiuk9fAEt8gIFdOXs/yEi76qs3rS3uOnxg/B3QpHKYII1VLDA1FeVFMOAnI
MDZrJFYVQWYQx4mOgukCfC8+a4Ocee8Q7lFoytJzDPFPTXApSGCrgORTb3Cim9jp
ImGLToEj3TUYFEwVL8v2UfL4ln1lod78ejecAW0MOEf62SYRMCR769z4CPO41cYg
+gRkFWYHibZdDVZYVZA5peD6Emr/9czPffANt2wRqvx0vv7IKGWaYVa1dJ+FCjKH
zwGeO3vgbfowIiYOCYNvyGvuA0f3MI3DscRDnUWVeq1Feayk+LHyKp0PImTidoGO
GWBpIzW+QE3Ebq0Gp6+OSaEKFD+y7r+5paU1GvEsTwccEpEr1pMlf9iag4frEhEm
5rAqhp3ksYsSmg/5HJ8zuYYmBDG0kdHnq0Q04UHiAf8mWJypXzgmldh8Q/8SUzFs
kqaNEKdv3Vgm3+XC8DDjOV7JJpt6wtExDuObHBLBvtBQIv7Ghbl0lrQOuKc/gT+R
XpfgMKmF8WqoI1YHFVMb+WuZlsxWJC3y0v80SxS8p1ZUKl7fdqM=
=AgFr
-----END PGP SIGNATURE-----

--=-T/tAcri0S1JrRXMlwOXy--

