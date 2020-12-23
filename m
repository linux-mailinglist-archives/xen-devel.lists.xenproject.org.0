Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA32E1EEC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 16:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58454.102807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6QF-0003py-1D; Wed, 23 Dec 2020 15:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58454.102807; Wed, 23 Dec 2020 15:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks6QE-0003pZ-Ts; Wed, 23 Dec 2020 15:51:30 +0000
Received: by outflank-mailman (input) for mailman id 58454;
 Wed, 23 Dec 2020 15:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AJ0=F3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ks6QE-0003pU-3t
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 15:51:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e0fa3d0-89d4-4c73-b093-588a36e0f624;
 Wed, 23 Dec 2020 15:51:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8DF8BAD11;
 Wed, 23 Dec 2020 15:51:27 +0000 (UTC)
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
X-Inumbo-ID: 7e0fa3d0-89d4-4c73-b093-588a36e0f624
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608738687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ypQhyRghUymqxZWvKkq/TyX4aEU3MHvGuKy3tyVywx0=;
	b=ksUhdypwsDq03crr6bf9gFeuGuUVCNXtqNFLDwTIdwUWB20uqdxiTPR5mXiA031awvzp3G
	o99H8QrvyJ7AylJXt6j6hjlUtmM7AWPDna7FTwfTSriUh6FI9bf31w8+8dgTk5G3p4AVPg
	fr4CS667JrGFl7RI18B73EaC9sIF86k=
Message-ID: <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dylanger
 Daly <dylangerdaly@protonmail.com>
Date: Wed, 23 Dec 2020 16:51:26 +0100
In-Reply-To: <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
References: 
	<9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
	 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
	 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
	 <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
	 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
	 <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tJmc8m6AEzHTGJjq4Y+3"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-tJmc8m6AEzHTGJjq4Y+3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-12-23 at 10:59 +0100, Jan Beulich wrote:
> On 23.12.2020 00:04, Dylanger Daly wrote:
> > I think I've narrowed down what could be the issue.
> >=20
> > I think disabling SMT on any AMD Zen 2 CPU is breaking Xen's
> > Credit2 scheduler, I can only test on AMD Ryzen 4000 based Mobile
> > CPUs, but I think this is what is causing issues with
> > softlocks/having to pin dom0 1 vcpu.
>=20
> Dario,
>=20
Hi, and thanks for bringing me in. :-)

> does this maybe ring any bells?
>=20
Not really. :-(

Unfortunately, I don't think I have access to a Ryzen CPU (but I'll try
to look better).

I do have access to an EPYC2 (Rome) CPUs, i.e., an EPYC 7742 with 256
CPUs (128 cores x 2 threads). I have just tried booting Xen 4.14 there
and:

1) with all the 256 CPUs enabled (i.e., smt=3D1), Credit2 scheduler and=C2=
=A0
   the default value (16) for sched_credit2_max_cpus_runqueue, the=C2=A0
   system seem to work fine.

   There are 16 runqueues with 16 CPUs inside each of them, and they=C2=A0
   seem to be constructed reasonably (siblings are in the same=C2=A0
   runqueue, etc).

   I don't have a GUI on that box for checking whether mouse movement=C2=A0
   are fluid, but I've run some basic tests from the terminal and=C2=A0
   everything looks normal.

   Dom0 has 256 vCPUs and no pinning.

2) with only 128 CPUs (i.e., booting Xen with smt=3D0), Credit2 and =C2=A0
   still=C2=A016 in sched_credit2_max_cpus_runqueue, it also seems to work=
=C2=A0
   fine.

   There are again 16 runqueues, each one with 8 CPUs and the system=C2=A0
   seems responsive enough.

   Dom0 has 128 vCPUs and no pinning.

I can try Credit as well, later, but if this is something CPU arch/gen
related, it seems to be a Ryzen rather than a Zen 2 thing...

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-tJmc8m6AEzHTGJjq4Y+3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/jZ34ACgkQFkJ4iaW4
c+5wwA//ch9G0WUtgN5EDH96ww5xh7OkBrIpVBhUUxf3aLq/NbGIEFfDeXadKnHC
VHC6bmMYanBDe0kppa9jDmAmm9V9UPQDGNGzwb3w4+lzA6R/YCQ/i+GZSA1JxzPc
Ku+acv+cMn3nTSuq8UC85vufyHWXfxlCPTvs7hCvPDiFaObpLy7HW2pcETf8xVSE
tdl+UR2Prcx5CuPn5ZlyfFtDreaxXI3yBRYz+9tcmAcTg5Dgq4zpRB8iGoz+pg3Q
isXLTOO2puvDY8dm5oPro+UjcgcWmqt+0RqOLoLLLZFVcERfRxNxzwVO20grNpom
A/d786Y3exo5hVay4cYnAG+hv0domWbcg5a99cKW9GVTlh9bm5xTsQKLZ7Ffapdd
ZgrnJOjmzIgQD705ABZ+kP7hPXshFPNXw2ejS9kw8P71thCwIMIs+2PeI+dTXjmU
Ky/09xvrudyvlB7lfYA2FmseLZ1gp7v0ovztiFlZwSsRxtBsN/SiAQjybdSiLye+
SOS4kJK5HV4uefe1EI42WQYfmU64EY5+CvrcFVdnjRSnZWW0gQ5t6TksVwMR43tE
4c22U1ftFxV0djk3MnciMlGaJ7kmht04FdDWnfQlINyN2jJ1bLAX3wjnv32SD4gK
cdLNPguNU77I3HJzCXvqaeg9qhWJERRKMX73qGuIS7wQXKZrKFs=
=GYJB
-----END PGP SIGNATURE-----

--=-tJmc8m6AEzHTGJjq4Y+3--


