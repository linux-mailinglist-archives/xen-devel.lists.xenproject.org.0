Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABA333B30
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 12:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96003.181384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwmP-00075u-Lb; Wed, 10 Mar 2021 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96003.181384; Wed, 10 Mar 2021 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJwmP-00075Y-IV; Wed, 10 Mar 2021 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 96003;
 Wed, 10 Mar 2021 11:13:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZEI=II=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lJwmN-00075T-OS
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 11:13:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 936b7aa9-22ae-403d-8b83-ff1fc396af22;
 Wed, 10 Mar 2021 11:13:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91C93AE78;
 Wed, 10 Mar 2021 11:13:25 +0000 (UTC)
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
X-Inumbo-ID: 936b7aa9-22ae-403d-8b83-ff1fc396af22
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615374805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eCNKUjyMIm7der6JEf6tGGnpH4ONaht08vLFM0IG6f0=;
	b=MfO2QB9o7gaGI3YFP8cc+zxO95cRLFfL2H0ZDpnFjULQEKnXaXLTqyqCdAKNwkv1uagPv0
	W2jWxo/wcXFtW1SV7TS650kwAFoFEi7cVLBBGSxdPC9SkBVGY/OpuMgHRcHTKhRbHi4890
	7DUy5OefO4IoKWA9FrbBXvjZU4A6l+I=
Message-ID: <5ac80ae8be856e49fd83245eee4baae986beafa9.camel@suse.com>
Subject: Re: Hit ASSERT in credit2 code with NR_CPUS=1 build
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org
Date: Wed, 10 Mar 2021 12:13:24 +0100
In-Reply-To: <YEehTbVVjWMaqjCV@Air-de-Roger>
References: <YEehTbVVjWMaqjCV@Air-de-Roger>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4+52hzy5PpD5au/BQ86Z"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-4+52hzy5PpD5au/BQ86Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-03-09 at 17:24 +0100, Roger Pau Monn=C3=A9 wrote:
> Hello,
>=20
Hey,

> While looking at the NR_CPUS =3D=3D 1 build I realized I could reliable
> trigger the following ASSERT by creating a guest (note that dom0
> seems
> to be fine):
>=20
Yes, I'm (somewhat, not sure if exactly though) able to reproduce.

> (XEN) Assertion 'i !=3D cpu' failed at credit2.c:1725
> (XEN) ----[ Xen-4.15.0-rc=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Tainted:=C2=
=A0=C2=A0 C=C2=A0=C2=A0 ]----
> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d040249399>]
> common/sched/credit2.c#runq_tickle+0x469/0x571
> (XEN) RFLAGS: 0000000000010046=C2=A0=C2=A0 CONTEXT: hypervisor (d4v0)
> (XEN) rax: ffffffffffffffff=C2=A0=C2=A0 rbx: 0000000000000000=C2=A0=C2=A0=
 rcx:
> 0000000000000000
> (XEN) rdx: ffff83086c62feb0=C2=A0=C2=A0 rsi: 0000012774fba66c=C2=A0=C2=A0=
 rdi:
> ffff8307e11d5d40
> (XEN) rbp: ffff83008c8c7cf8=C2=A0=C2=A0 rsp: ffff83008c8c7c68=C2=A0=C2=A0=
 r8:=C2=A0
> ffff83086c66d6c0
> (XEN) r9:=C2=A0 ffff82d0405d1218=C2=A0=C2=A0 r10: 0000000000000000=C2=A0=
=C2=A0 r11:
> ffff83086c631000
> (XEN) r12: ffff83086c6437c0=C2=A0=C2=A0 r13: 0000000000000000=C2=A0=C2=A0=
 r14:
> ffff83086c62fe20
> (XEN) r15: ffff82d0405d0320=C2=A0=C2=A0 cr0: 0000000080050033=C2=A0=C2=A0=
 cr4:
> 00000000003526e0
> (XEN) cr3: 00000007e130d000=C2=A0=C2=A0 cr2: ffff88826910cb38
> (XEN) fsb: 00007efee038b780=C2=A0=C2=A0 gsb: ffff888273400000=C2=A0=C2=A0=
 gss:
> 0000000000000000
> (XEN) ds: 0000=C2=A0=C2=A0 es: 0000=C2=A0=C2=A0 fs: 0000=C2=A0=C2=A0 gs: =
0000=C2=A0=C2=A0 ss: e010=C2=A0=C2=A0 cs: e008
> (XEN) Xen code around <ffff82d040249399>
> (common/sched/credit2.c#runq_tickle+0x469/0x571):
> (XEN)=C2=A0 ac ff 75 3d 0f 0b 0f 0b <0f> 0b c7 45 ac 00 00 00 00 48 8d 05
> 6f 7e 38 00
> (XEN) Xen stack trace from rsp=3Dffff83008c8c7c68:
> [...]
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'i !=3D cpu' failed at credit2.c:1725
> (XEN) ****************************************
>=20
Interesting... So, how do cpumasks look like/work, with NR_CPUS=3D1
(sorry, I couldn't follow all the aspects of it too closely) ?

I'm asking because, what we're doing here is the following. First of
all we put together a cpumask (in `mask`) out of the intersection of
the CPUs that are in the vcpu's hard/soft affinity, are part of this
runqueue, are idle and have not been tickled (where tickled =3D=3D they've
been poked and will go through schedule() soon):

    cpumask_andnot(&mask, &rqd->active, &rqd->idle);
    cpumask_andnot(&mask, &mask, &rqd->tickled);
    cpumask_and(&mask, &mask, cpumask_scratch_cpu(cpu));

Now, I would very much expect for `mask` to have at most one bit set
(i.e., the one of our only CPU). Actually, considering how unlikely it
would be that our only CPU is both idle and not-tickled, I expect mask
to be empty most of the times.

Anyway, let's say the cpumask has 1 bit set (in which case, it must be
the one associated to CPU 0, I presume?). What we do now is this:

if ( __cpumask_test_and_clear_cpu(cpu, &mask) )
{
    ...
}

Which I think means that, no matter whether or not we enter the loop,
we clear the bit. Of course, which bit depends on the value of `cpu`...
But with NR_CPUS=3D1, I don't see how `cpu` can have a value different
than the ID of the one and only CPU we have.

So, in my mind, now `mask` is empty. Therefore, I'm currently clueless
about why we enter this loop...

> =C2=A0=C2=A0=C2=A0 for_each_cpu(i, &mask)
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s_time_t score;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Already looked at this one =
above */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(i !=3D cpu); <=3D=3D=3D=
=3D
>=20
... and we reach this point.

I tried to build staging here (with NR_CPUS=3D1), and I think the code
for this ASSERT(), for me, is:

  test   %ebx,%ebx
  je     ffff82d040245ac5 <runq_tickle+0x48a>

(and ffff82d040245ac5 is of course ud2.)

Snf this kind of makes sense. Or, at least, I'm not surprised that, if
we are inside this loop, `i` is actually equal to `cpu`.

What I'm surprised about is that we are inside the loop in the first
place...

I guess I need to think more about it. Any bright ideas that explain
what is going on would be more than appreciated.

> In runq_tickle. I'm afraid I have no clue of what's going on. FTR
> using a non-debug build with NR_CPUS =3D=3D 1 does seem to work fine and
> I
> don't see any ill effects.
>
Well, yes, special casing `cpu` and dealing with it outside of the loop
is just an optimization, for when soft-affinity is defined for the
vcpu. So it makes sense that things work without the ASSERT().

However, the ASSERT() was there as a consistency check, and it looks to
me to be a valid one, even with NR_CPUS=3D1, so I really don't know why
it triggers...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-4+52hzy5PpD5au/BQ86Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmBIqdQACgkQFkJ4iaW4
c+5H0w//cpZRV4Y4UVJy8BnnKvENKPx+xx+CnBp8P+kqMKDryv3kzS8zU/Dfs1d9
6TSSJBYpPjeaXnp88GuI3g1NzZYHfyAQBKuSRy6DhXed/aCI2DXB+ub930zzmwXt
3ypV1lUChPpj1SbnYRuYV450Vz1BOosYD0svdVOSnvzKH14VE/c+m0X65mm+IUKy
jBrAMxegvDAC8RysIVoFHVIw2ExLyzI/PFZZkO03EE8H1FswAiX23t4YX4gw/5y3
S+kA8dBkaFpWPbGcOxytcwB87vrAsqIFIIffUQQBKnJHZLL7gExGQQfWLUb6Z/ee
NLWHc36SokVobbOsGmXFn5CBABPqJsyBc+yDlQU0+8U+dCtit2XKkWysBYH90BeW
OmPdDJe0uiKMki7K2DBku4dkBc4XQ8h+Wh8gDw9JMmnlE4mNo1E9vAKfuEhf3c3X
a4zrXnLefckw2JJtGCANJ2yxdRfFN0hVpiaRWRLXu7A4lk6mqv+iBgGHXDXkGtZk
FXhWZ0uqpeKQJyM85ONTihk1JBgEMvyJM0MO6YLgx12gXWwDIqgyz31vW+ZC33kA
CxxLTbPrb0LxHK8C4iLIcHDJ8f2Z1oRZp1QIOAvMhcljA+jkkBmj8or7o0F9yKQd
3wxrLF7344kWhYE7miKQJ4LHIkbbBV22GJNXiTSkRqhSuUGLuP8=
=2IDc
-----END PGP SIGNATURE-----

--=-4+52hzy5PpD5au/BQ86Z--


