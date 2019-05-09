Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59D18504
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 08:00:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOc2q-0000nJ-IQ; Thu, 09 May 2019 05:56:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Daoc=TJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOc2p-0000nE-Cv
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:56:39 +0000
X-Inumbo-ID: 33d3dc9a-721f-11e9-8758-cba4d4d2740d
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33d3dc9a-721f-11e9-8758-cba4d4d2740d;
 Thu, 09 May 2019 05:56:35 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 07:56:34 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 06:56:29 +0100
Message-ID: <54785fa3c24d14de6c00d343046711f25ea28700.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <george.dunlap@citrix.com>,  xen-devel@lists.xenproject.org
Date: Thu, 09 May 2019 07:56:27 +0200
In-Reply-To: <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
 <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============6570265802659876982=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6570265802659876982==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aUtiyGdMdGlJ1TQPe6/F"


--=-aUtiyGdMdGlJ1TQPe6/F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-05-09 at 07:36 +0200, Juergen Gross wrote:
> On 08/05/2019 18:35, George Dunlap wrote:
> > On 5/6/19 7:56 AM, Juergen Gross wrote:
> > >=20
> > 'item' really seems like the wrong word here.  To me 'item' always
> > means
> > one thing; whereas what you're planning on doing is grouping
> > together
> > vcpus to schedule together; which would mean "unit" (as in, a
> > military
> > unit).
> >=20
> > I realize changing it here probably means also changing it in the
> > next
> > 43 patches as well.
>=20
> Only about 1000 lines to change.
>=20
> TBH, replacing "item" with "unit" is doable via sed. Doing the same
> with
> (as Dario suggested) "entity" is more painful, as I would need to
> check
> coding style (line length, indentation) manually afterwards.=20
>
Ah, right, I didn't spot that 'item' and 'unit' are the same length.
Makes sense.

> So Dario,
> would you be fine with "unit"? This might save me some hours of work.
>=20
I guess I am, yes. I like it more than 'item' too and, as much as I
like 'entity', I agree it's not worth the extra effort.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-aUtiyGdMdGlJ1TQPe6/F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzTwQsACgkQFkJ4iaW4
c+4O/g/9Hj44CNgzmgmhjm9Ln2FdgluT05td64h5AiMGNQxbuoG6nnzDZH5vSjGD
UYpzbEfSikQP4yRqe+fdL7NBm1Hq3OrI6qmbAg1rGwF7ab7SMI5UISfhB5zxwMTA
t9dYHU0uoxPlnrHdBc665CpYygc2sgDIQJayJgLtRlj7YC0qdgCsGTHwcV7vqQyV
ADnPMCZLMTeXR29NimTe3BLUI29j6bBdlmA106q9ThLYcdYYBuzFga2tTgTqZOQj
HKQOyqkxpZs+LHnV4hzgI/Zt76wFF+HBDoA0kVt4DpGr03RDc5ItdKYhLAC84+Sc
iwqFFk+Rg372YJ8XmsDnUVHO6/i7IXKHPsuQNffrTaOLrWy/rrL8VceuU02cdhL8
zZaDXurUmeN8PBZ21v7PfDlHm+37YtiL6BA1pz3g7x09qJq5j7enjQWiUQ5ciJ0H
mYZH9lS0W23f+uT/w+8yAWOk9JaVg8L+lvVfEdpVtUtYo1sdbH8KjQjKnYBTMX98
w2vjOLi5JSTgQ6NTDSbVluIEA7DoLo5ajKUNTHSvD3e4hmbs7fo73yxvsP47wg9L
P0FEpDhfwGmsL16XoELTVrwVuJmo+1gjn8zRMvhk9F96ZKQ95d9peHS9BBwMRSm9
JMpYTpHqkFMThqWluIBncsst7pWQRAyyJLaLL7+VEmZ97FpvLZ0=
=jWmE
-----END PGP SIGNATURE-----

--=-aUtiyGdMdGlJ1TQPe6/F--



--===============6570265802659876982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6570265802659876982==--


