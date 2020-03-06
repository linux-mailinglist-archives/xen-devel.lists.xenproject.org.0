Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85117BFAB
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:56:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADQd-0007G3-BC; Fri, 06 Mar 2020 13:54:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dNt+=4X=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jADQc-0007Fp-0c
 for xen-devel@lists.xen.org; Fri, 06 Mar 2020 13:54:14 +0000
X-Inumbo-ID: f5539db4-5fb1-11ea-a7d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5539db4-5fb1-11ea-a7d9-12813bfff9fa;
 Fri, 06 Mar 2020 13:54:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3DAFB40A;
 Fri,  6 Mar 2020 13:54:10 +0000 (UTC)
Message-ID: <e666cfa5d25090f8232aee09bcd863fecea437aa.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Sarah Newman <srn@prgmr.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>, xen-users <xen-users@lists.xenproject.org>
Date: Fri, 06 Mar 2020 14:54:06 +0100
In-Reply-To: <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
 <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Glen <glenbarney@gmail.com>, George Dunlap <George.Dunlap@citrix.com>,
 PGNet Dev <pgnet.dev@gmail.com>, Tomas Mozes <hydrapolic@gmail.com>,
 Juergen Gross <jgross@suse.de>, Alastair Browne <alastair.browne@memset.com>
Content-Type: multipart/mixed; boundary="===============2876515829170176108=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2876515829170176108==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-6JTCmd6+lU+GHqnqXqV3"


--=-6JTCmd6+lU+GHqnqXqV3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding George, as scheduler maintainer, and Juergen as he commented,=20
 later in this thread]

[Adding xen-users back, as the thread originated from there... sorry=20
 for cross-posting]

On Mon, 2020-02-17 at 11:58 -0800, Sarah Newman wrote:
> If there are no merged or proposed fixes soon, it may be worth
> considering making the credit scheduler the default again until
> problems with the=20
> credit2 scheduler are resolved.
>=20
Just as an heads up, I finally --thanks to Jim Fehlig-- gfound a
machine where I could reproduce (something like) this.

I've been able to do some analysis of the situation. Basically, on the
server I'm using, I do not see stalls severe enough to cause=20
NMI/watchdogs to fire, but I do see, during boot, some preliminary
signs of that.

I checked what was happening in Xen at that point in time ('r' debug-
key, which dumps the scheduler's data scructures), and I found out that
there is a vCPU kind of stuck in a runqueue. In fact, the vCPU is in
there, i.e., it is ready to run *but* not running, despite being plenty
of idle pCPUs that could possibly run it.

Reason why it's not being picked up, is that its credit are less than
the ones of the idle vCPU.

I have a theory about how it got in such a situation and, if I'm right,
a draft of an idea of how to fix this.

We're using this bug, that Glen kindly created, to track this issue:

https://bugzilla.opensuse.org/show_bug.cgi?id=3D1165206#c3

But of course I'll keep upstream MLs updated as well.

Stay tuned. :-)
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-6JTCmd6+lU+GHqnqXqV3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5iVf8ACgkQFkJ4iaW4
c+7x8Q//agxkApjy3KhJLyiCoOf0Ll6RYPCxYAark/R2zEjpCXZ/QNRqlLyegvWv
jeoWTd1wXnApwMrfmz1uMWgWvOWGi0jWy2BpH7H9nOctzkL4HX2Ygl01JA5VC2QO
Uw+NLnPCF9oAz/1aIMt+M8KLE2T3fplnYR7xNado9ZbKt6qlQn3ydDIJKHZ21OFc
TUfViu/hl1TQGPlNPU4MOZWF962Vg0uIZSoQUxX5sdIAtjcp7rXLLFl1jduf9191
m3P3p0kNEfVc4DIqCKw0o656aOIIeOAyYRH5CXFd4vyenP97O4gcvWGFUauIJNHz
oe6pFIeteapWhkyfzNPyCYNcJcMkZnOVsCixCTrX2+TTScP6OS+J1LBcWfwfoQ0i
rJ2mMlDXrw/mk8o6X8s41LU++pn4lUhZgZiSJJ0zs7Dz8dg5BIZU6NpkqsYTNhTY
hrzIZYTyl8ew9h5gARNpxN03S10tGUP3AtbbpHgbeppCAX3mmOCn1x9llugu+XxX
4NR2ep3i0RvGw4PebwycEPaSkdbXveZDedTS4tzJUUxNs+QZkTd/80V7WcrkXUU6
XtRFUk8yNirDB9VlBsjZF7ZJkYNxmjhDMfIos9sgpHMvlXSYyfIk3zBmgTVKjzIk
c8sH5yBUZSeSyTO3GshruSx/LcW1g6V3o//hB3hKjCMx4CD2eQo=
=l2V8
-----END PGP SIGNATURE-----

--=-6JTCmd6+lU+GHqnqXqV3--



--===============2876515829170176108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2876515829170176108==--


