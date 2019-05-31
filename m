Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39630EDE
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 15:28:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWhX4-0000oZ-2x; Fri, 31 May 2019 13:25:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agGR=T7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hWhX2-0000oT-TV
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 13:25:16 +0000
X-Inumbo-ID: 861d8661-83a7-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 861d8661-83a7-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 13:25:15 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 15:25:13 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Fri, 31 May 2019 14:24:58 +0100
Message-ID: <1dd86fe1814a52cb9b521a39511c2c5b70379b03.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>, Andrii Anisov
 <andrii.anisov@gmail.com>
Date: Fri, 31 May 2019 15:24:57 +0200
In-Reply-To: <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
 <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============2528461977636236750=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2528461977636236750==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rRg++k3Q8uzcfIyqhWV6"


--=-rRg++k3Q8uzcfIyqhWV6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-31 at 10:26 +0000, George Dunlap wrote:
> > On May 30, 2019, at 3:15 PM, Andrii Anisov <andrii.anisov@gmail.com
> > > wrote:
> >=20
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >=20
> > The structure member last_run_time is used by credit scheduler
> > only.
> > So move it from a generic vcpu structure to the credit scheduler
> > private
> > vcpu definition.
>=20
> This seems like a useful change, and the commit message has a lot of
> good detail, thanks.  But I=E2=80=99m left wondering: Is the main idea he=
re
> just to generally reduce code and data usage when not running the
> credit scheduler, or is there another reason?
>=20
Yeah, I also think this change is a good one to have.

Weather or not the main reason is that one, it fixes an (albeit not too
terrible) layering/encapsulation violation, as things used only by
Credit, should live in Credit code.

It also makes (although only slightly) `struct vcpu` smaller, if one
doesn't use Credit at all.

But sure, let's have just a few more words about the motivation for the
change in the commit message, as George is asking.

> If it=E2=80=99s the first, a quick note to that effect will help put
> archaeologist=E2=80=99s minds at ease. :-)  This could probably be added =
on
> commit.  (I=E2=80=99ll do a full review it in a day or two if Dario doesn=
=E2=80=99t
> beat me to it.)
>=20
I've looked at it, and there's only one thing that bothers me a little
bit. In fact, here:

--- a/xen/common/sched_credit.c
+++ b/xen/common/sched_credit.c
@@ -175,6 +175,9 @@ struct csched_vcpu {
     atomic_t credit;
     unsigned int residual;
=20
+    /* last time when vCPU is scheduled out */
+    s_time_t last_run_time;
+
 #ifdef CSCHED_STATS
     struct {
         int credit_last;

The comment is not accurate. And I'm afraid that it could be misleading
for someone reading it, but then realizing that the code does something
slightly different, and hence not being able to tell which one of the
two things is correct.

So, either we change the comment (but I'm not capable, right now, of
finding something that is short and, at the same time, clear enough),
or we change how the variable is using.

Like, e.g., in csched_schedule(), we first set it to 0, and then we
update it with `now` for `prev` if `prev !=3D next && !is_idle(prev)` (or
something like that)

The rest of the patch looks fine to me.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-rRg++k3Q8uzcfIyqhWV6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzxKykACgkQFkJ4iaW4
c+7X/w//en2LDQ0Ncf4C0HLNeUz5r6LjVakBvEuTk/TbUto4hAv/Lg176Zsk1S37
/KWE8oz2rXNe51cDNmiLIvq0SlVT8GvRXlgJ8TJmFIuzqx/MAT/l8mO6oBYEfEmy
2i1GoxHHyBtfapXuJi7GBQF+uQ9kCDZrtrwnI9Svo3cDn0dqRtfRcT7e+6iWXdZB
q7bB87zQNrj5sJW89rUuNirAB1p8839RkqI6RrEys3KlUoZWr8l+x6lHgR3UspzR
2IG1lJpg2qNZTfnD1Oktl91wkJStHlYPhsFcA1cRurnPu9rGHEoxVwxJWvu4HkB6
lS/7t4jXyvyf8R3DlAi9xGyquMVh/UtTwKxWzYJFt1hKZogDgNV/kNzJhbKXUXeK
jl7QsNCK2Tj494aeX5fnRD+nKBCwEXu4tU1TLtI/7tSK4sLCuT9cuWk0DZvkv2+9
cp5KDTYA4sSnz7Jl+uw6DeY3ZJO/zDqskG2J+tSTVBVJBA6JpQwJB5UhT4+bhTho
riIAmCtOb00ylLQEafE2/iA6qzCbjA8JVOWuRidrFl+KYQfeDjcz6pH0FAQM/Nbn
OkO6ddZywDklSESJe/UOWNqYIfXaaQAKwOM60wgqoT54VvV6aRgo6Wb0rRxfnV8l
6T63uHCQiFmLOZto8AlRUHV/q5G0d+wNfO+phswUBjI3+WvvrJk=
=VQiP
-----END PGP SIGNATURE-----

--=-rRg++k3Q8uzcfIyqhWV6--



--===============2528461977636236750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2528461977636236750==--


