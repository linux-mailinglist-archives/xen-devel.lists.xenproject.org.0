Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07799B0D0E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:38:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MSO-0005ND-S0; Thu, 12 Sep 2019 10:36:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uvwM=XH=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8MSN-0005N7-GM
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:36:07 +0000
X-Inumbo-ID: 200515ac-d549-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 200515ac-d549-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 10:36:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C1CFB666;
 Thu, 12 Sep 2019 10:36:05 +0000 (UTC)
Message-ID: <ed7fc8c76fe8474f759cc650174ee4ee62dde86c.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,  xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 12:36:04 +0200
In-Reply-To: <9de7652a-fd0e-c487-8bf7-053d3ee0b2f1@suse.com>
References: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
 <9de7652a-fd0e-c487-8bf7-053d3ee0b2f1@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] RFC: Criteria for checking in core scheduling series
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: multipart/mixed; boundary="===============2527395691695476142=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2527395691695476142==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Yiv484F+VATtvY4ExUrJ"


--=-Yiv484F+VATtvY4ExUrJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-09-09 at 14:44 +0200, Juergen Gross wrote:
> ... using Dario's correct mail address
>=20
Thanks! :-)

> On 06.09.19 13:09, George Dunlap wrote:
> > There was a discussion on the community call about the core
> > scheduling
> > series being developed by Juergen Gross [1].  The conclusion can be
> > summarized as follows:
> >=20
> > * We normally wait to check in series until they are quite good --
> > all
> > the i's dotted and all the t's crossed
> >=20
> > * This is for several reasons; primarily because once code gets
> > checked
> > in, it rarely gets looked at again.  In particular, there's nothing
> > stopping the submitter from neglecting to do important clean-ups,
> > in
> > spite of their best intentions; leaving the maintainer or the rest
> > of
> > the community to do it.
> >=20
> > * However, for particularly long, complicated series like the core
> > scheduling series, this can have significant downsides.  Rebasing a
> > 60-patch branch regularly is a lot of churn for little value; and
> > core
> > parts of the series which are mostly complete are currently only
> > getting
> > sporadic dev testing rather than the wide range of testing they
> > would
> > get from being in staging.
> >=20
> > * XenServer and SuSE are both long-term community members with a
> > strong
> > incentive to maintain and improve the feature; so the risk of the
> > feature being left for the community to maintian is relatively now.
> >=20
"relatively low", I guess. :-)

And, ahem, it's SUSE. :-P :-P :-P

> > With all those things in mind, the conclusion was to lower the
> > "check-in" threshold from what it normally is, in order to allow
> > the
> > series to be checked in in the near future, in enough time at least
> > for
> > the "default off" to be well-tested by the 4.13 release.
> >=20
> > The criteria we sketched out were:
> >=20
> > * All the patches still need appropriate Ack / R-b's
> >=20
> > * There should be reason to believe that the series will have
> > little to
> > no impact on "thread mode" (threads being the unit of scheduling;
> > i.e.,
> > the status quo)
> >=20
Performance wise, the benchmarks I was able to run showed that the
overhead of having the series applied, but only using thread mode, was
rather small, at least for most of the workloads.

Of course, the more numbers, the better. And the XenServer's
performance regression benchmarking campaign announced by Andrew will
definitely be very useful.

> > So this would really be a recommendation / license to the various
> > maintainers involved; primarily Dario, I think (since I probably
> > won't
> > have time to review the series).
> >=20
Ok. I'm back from vacation and am now looking at the patches. I am
traveling next week, but I hope to be able to continue reviewing during
that.

> > No decisions are official until discussed on xen-devel; so the
> > decision
> > will not be considered official until a few days have passed
> > without
> > objection.  And of course, if anyone at the meeting had a different
> > understanding of what was said, or has something to add, please do
> > so.
> >=20
Time is really tight... But I do agree with the points/criteria, and
will do my best to make this happen.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Yiv484F+VATtvY4ExUrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl16H5QACgkQFkJ4iaW4
c+7NJRAAtvES1Zgt2+/SVBEyJ/JTUMVhR8qaeFfCuQLDZK5fY/k4zgoOI9yrzPhb
p6cyrjfaQQt23BHfmuzWOdLgYlVBs7YoNY3DngYwv2Az6Rft4NyhqLZyYSLPV7PB
LIeWGkXxjIl1lGDEJweYlxhQzTRgLTPZK3Ja5zdE5j/Ty3uS98Swx4YSrFje+bpH
GCkFK5OvklWrmBnQRwuKyKKsfhw7/DrlG8i8sqLWK0COCByKMhJBcfqTlyd5lQ5u
xvDjRXIk5eUQC3wWhF3HzSinKKfg0HFQEK2bh+yuWSJURxMUaEUdlTDbccbMpKCA
1Bet/fhs8YRpm+vGdEEIWPfO+azraIFUMRcGImXIMlYj4Hqc4laX8CqNc2FdSOrB
Uzs6XpwEs/e+b080VisRcHsstEZBysoIrkXaFFVXp4RjM2auQUa2/HFKY80PZxzL
kgqCayvbIcq8XJPTQrDGcO5q4jeRTlaPyY74Oc6KKzbM8mCcZs8T/nOWam29aB0p
yPJqU/L0zJUHp4N73S84fX/JY9T7bTomWzBWNd9oLLQoNaxm+NtuzGWRYy5mEmHM
zwW5CNz1X84yKgU1YPTSLWR39GUvBJnkHVhO+aYguixBHfLpaN//TYYQxJgVG3LX
3cV/B4MuaujR9P/0hemJ9mWQXTXRvLVrg53nUrZp2uUtZfr8O00=
=l2HW
-----END PGP SIGNATURE-----

--=-Yiv484F+VATtvY4ExUrJ--



--===============2527395691695476142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2527395691695476142==--


