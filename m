Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1817F17
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 19:31:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOQML-0006aN-Am; Wed, 08 May 2019 17:28:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoQP=TI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOQMJ-0006aI-I2
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 17:27:59 +0000
X-Inumbo-ID: 9e74b7ea-71b6-11e9-843c-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e74b7ea-71b6-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 17:27:57 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 08 May 2019 19:27:56 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 08 May 2019 18:27:26 +0100
Message-ID: <ad8af6c4d19b14172310ef9af587d8244032ac9e.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross
 <jgross@suse.com>,  xen-devel@lists.xenproject.org
Date: Wed, 08 May 2019 19:27:25 +0200
In-Reply-To: <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============7963102185298503289=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7963102185298503289==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-E/j27ZM+fwWzyfQs5LHY"


--=-E/j27ZM+fwWzyfQs5LHY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-05-08 at 17:35 +0100, George Dunlap wrote:
> On 5/6/19 7:56 AM, Juergen Gross wrote:
> > Rename the per-scheduler functions insert_vcpu and remove_vcpu to
> > insert_item and remove_item to reflect the change of the parameter.
> > In the schedulers rename local functions switched to sched_item,
> > too.
> >=20
> > For now this new struct will contain a vcpu pointer only and is
> > allocated on the stack. This will be changed later.
> >=20
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Oy, I realize this comment is going to be somewhat painful, but...
> 'item' really seems like the wrong word here.  To me 'item' always
> means
> one thing; whereas what you're planning on doing is grouping together
> vcpus to schedule together; which would mean "unit" (as in, a
> military
> unit).
>=20
_If_ we're getting into this, I'd like to propose 'entity',
'sched_entity', etc. :-)

Perhaps it's because I'm used to it from Linux, but I really like it,
more than both sched_item and sched_unit.

In fact, the group of vcpus is the *entity* with which the scheduler
deals.

> I realize changing it here probably means also changing it in the
> next
> 43 patches as well.
>=20
Indeed! :-O

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-E/j27ZM+fwWzyfQs5LHY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzTEX0ACgkQFkJ4iaW4
c+4gRhAAquKRa7V1Jegv86v1LPW1T/5GAwP4ZXVW5G6ui32FQXCN85t6fZk70YIX
QLo5jbbcnBJpVR7yL27evgi9M573NVE0hjego++8RE+O1WH0YdhhoxTEaUa8yep5
3IINSRUXVTKUomEG1x3bKPLM4Li/qGvYQ0Jd5ySylXj1KS3PuHycFE1irJshIcNP
2wOivTAZO2syWTeD8h8HMI+qPaXEI6V7tiRm9196e6sS3VhYW2XifpQJw/E2yf+V
CuY7/5AoToo+BPZqw4tirkPuJqnvo1CN8dBBLB/r6zAjW+93OyFvmpCvS9dyYaAT
w15sBgPDtiZd1x73lezf4Ucq1G2AE3mGGY1QbQtnauWE2jtZ8W5IffZpVXkvQNXt
xqNVPoqHr5LfJQY7hrHk1z94LMpFSWMpLd8ypeZ7gOxDIh6hxIJRqzjScJv8q+JG
g1gXC5yZj1I5PAAbdf7tq692mHILj+v6irJgZPV/bu1GxawZIJOj9B1fpyJkiMzm
QBgyUvyC8Sas0wdYNc+DObbDXen6PHRsU11yrIMFk+1BvyFARuE0e9KLqZKXLFIe
gAcCY+0QFz2eyM5dwJ5d2WkkB9xqocDKNfdIMfL6EMDZxmTRY/e2ACG8VR/iH+Qw
Adx2UpGY7WaWN81LlME1RT/8xjppTlxijqRhpGA0rU4Otkd/5eU=
=pCks
-----END PGP SIGNATURE-----

--=-E/j27ZM+fwWzyfQs5LHY--



--===============7963102185298503289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7963102185298503289==--


