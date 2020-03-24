Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A151913C4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 15:59:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGkxu-0002Ub-U7; Tue, 24 Mar 2020 14:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dyw=5J=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jGkxt-0002UW-4z
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 14:55:37 +0000
X-Inumbo-ID: 8410ba18-6ddf-11ea-843a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8410ba18-6ddf-11ea-843a-12813bfff9fa;
 Tue, 24 Mar 2020 14:55:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFFEEAB6D;
 Tue, 24 Mar 2020 14:55:33 +0000 (UTC)
Message-ID: <52ae93739b1176f535fabff8932230edbfa6ce7d.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>
Date: Tue, 24 Mar 2020 15:55:32 +0100
In-Reply-To: <af97b12c-e1f5-0278-8599-96264dc57101@suse.com>
References: <1585056853121.58010@citrix.com>
 <af97b12c-e1f5-0278-8599-96264dc57101@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-bl2TbDq3pW1aEZWtjyGf"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] xl vcpu-pin peculiarities in core scheduling mode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-bl2TbDq3pW1aEZWtjyGf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-03-24 at 15:22 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 24.03.20 14:34, Sergey Dyasli wrote:
> > I did some experiments and noticed
> > the following
> > inconsistencies:
> >=20
> >    1. xl vcpu-pin 5 0 0
> >       Windows 10 (64-bit) (1)              5     0    0  =20
> > -b-    1644.0  0 / all
> >       Windows 10 (64-bit) (1)              5     1    1  =20
> > -b-    1650.1  0 / all
> >                                                       ^           =20
> >       ^
> >       CPU 1 doesn't match reported hard-affinity of 0. Should this
> > command set
> >       hard-affinity of vCPU 1 to 1? Or should it be 0-1 for both
> > vCPUs instead?
> >=20
I think this is fine. For improving how this is reported back to users,
I'd go for the solution nr 3 proposed by Juergen (below).

> >    2. xl vcpu-pin 5 0 1
> >       libxl: error: libxl_sched.c:62:libxl__set_vcpuaffinity:
> > Domain 5:Setting vcpu affinity: Invalid argument
> >       This is expected but perhaps needs documenting somewhere?
> >=20
Not against more clear error reporting. It would mean that libxl must
have a way to tell that pinning failed because pinning was not being
done to a "master CPU".

I guess it's doable, but perhaps it's not the top priority, assuming we
have (and we put in place, if we still don't) good documentation on how
pinning works in this operational mode.

That would make a good article/blog post, I think.

> >    3. xl vcpu-pin 5 0 1-2
> >       Windows 10 (64-bit) (1)              5     0    2  =20
> > -b-    1646.7  1-2 / all
> >       Windows 10 (64-bit) (1)              5     1    3  =20
> > -b-    1651.6  1-2 / all
> >                                                       ^           =20
> >       ^^^
> >       Here is a CPU / affinity mismatch again, but the more
> > interesting fact
> >       is that setting 1-2 is allowed at all, I'd expect CPU would
> > never be set
> >       to 1 with such settings.
> >=20
This is the situation I'm most concerned of. Mostly, because I think a
user might be surprised to see the command (1) not failing and (2)
having the effect that it has.

I think that, in this case, we should either fail, or adjust the
affinity to 2-3. If we do the latter, we should inform the user about
that. There's something similar in libxl already (related to soft and
hard affinity, where we set a mask, then we check what's been actually
setup by Xen and act accordingly).

Thoughts?

I'd go for a mix of 1 and 3, i.e., I'd do:

> 1. As today, documenting the output.
>     Not very nice IMO, but the least effort.
>=20
This, i.e., we definitely need more documentation and we need to make
sure it's visible enough.

> 2. Just print one line for each virtual cpu/core/socket, like:
>     Windows 10 (64-bit) (1)    5     0-1   0-1   -b-    1646.7  0-1 /
> all
>     This has the disadvantage of dropping the per-vcpu time in favor
> of
>     per-vcore time, OTOH this is reflecting reality.
>=20
> 3. Print the effective pinnings:
>     Windows 10 (64-bit) (1)    5     0     0     -b-    1646.7  0   /
> all
>     Windows 10 (64-bit) (1)    5     1     1     -b-    1646.7  1   /
> all
>     Should be rather easy to do.
>=20
And this: i.e., I'd always report the effective mapping.

I actually would go as far as changing the mapping we've been given and
store the effective one(s) in `cpu_hard_affinity`, etc, in Xen. Of
course, as said above, we'd need to inform the user that this has
happened.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-bl2TbDq3pW1aEZWtjyGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl56H2QACgkQFkJ4iaW4
c+7M2w/+It4LSH+yVIo8OHhy1geiAoEURYJSrFeQpnojn9o28BsgXW0EcLxFGifO
IP+I1NK6w2om5DNUlbrPsoB7YEq0GTiQNofXyV3yAKKzWLYp5zlsztid2BTyIPtR
O+eclT+D1UYurVvwnKE3CSxJDzq6G71SsjKfKQTWO5+aW4ge/zVKhACSd6ZYDFfP
K7kI+v7QPRZJOtSt/9ZIK0kBMmXLaXvDjuxOE2qkhPh3TVjLTJKCw5wsx48vF0OL
zo5NgHG7EniTt6tTpvKk5f3uQHhIlE8aZt7S+A1PhaYJDkQruZp1BGyipIeCei5p
hSTh/hyjpzoUgs6bBTmfTM3++zEYLU7CoQeBGn6kmdIHyVXIudux6PPys4ZMEfgk
hXtaNYgkMLq9LIyMCllxBdd6aPJZeaeeQwVN7RjQoWptPPY3N0Fr592Hxoyqmni4
CoVlItpwrgtrcDawKvR1//e6rPuK5fagsGnhz4NUdz7CA45ApDbb0SNicuYvU7jo
bGjd0Tj5l0a5oknxooVm5iUgOAuKKFp5gTvmG2JtatoEsfijML07twM8slMgIiW0
6fehzQhxjbmxwgTkq02a4iYZmRriFJ9NjBPvGyptwDd0RWoOR9uZ2QQoVOQkr8wY
sTpaG2VU3taRmyaptvixPoTky8b/6DNWSc74pZz1ym2yAjCUFa4=
=DwEX
-----END PGP SIGNATURE-----

--=-bl2TbDq3pW1aEZWtjyGf--


