Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C383D320
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:59:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hak43-0004qq-S9; Tue, 11 Jun 2019 16:56:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5o1B=UK=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hak42-0004ql-BC
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:56:02 +0000
X-Inumbo-ID: c99587f6-8c69-11e9-a90f-b36c5f96790a
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c99587f6-8c69-11e9-a90f-b36c5f96790a;
 Tue, 11 Jun 2019 16:56:00 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 18:55:58 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Tue, 11 Jun 2019 17:55:49 +0100
Message-ID: <bc1bd71d30525853e293624ec9684935b3082d14.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Tue, 11 Jun 2019 18:55:47 +0200
In-Reply-To: <20190528103313.1343-4-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-4-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/60] xen/sched: let sched_switch_sched()
 return new lock address
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============3596329964947372309=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3596329964947372309==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vpTRhMasaZa4vB7WmVbH"


--=-vpTRhMasaZa4vB7WmVbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-05-28 at 12:32 +0200, Juergen Gross wrote:
> Instead of setting the scheduler percpu lock address in each of the
> switch_sched instances of the different schedulers do that in
> schedule_cpu_switch() which is the single caller of that function.
> For that purpose let sched_switch_sched() just return the new lock
> address.
>=20
This looks good to me. The only actual functional/behavioral difference
I've been able to spot is the fact that, in Credit2, we currently
switch the lock pointer while still holding the write lock on the
global scheduler. After this change, we don't any longer.

That being said, I've tried to think about how this could be a problem,
but failed at imagining such a scenario, so:

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

I'm wondering whether it make sense for the above to be quickly
mentioned in the changelog, but am leaning toward "not really
necessary". In particular, I don't think it's worth to respin the patch
just for that... So, either just something that can be added while
committing, or forget it.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-vpTRhMasaZa4vB7WmVbH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlz/3RQACgkQFkJ4iaW4
c+4UwxAAwSZNRmawDpPIaBmzs0u8q0AGq/Qg8gph7MXkSNOjrCUG+VVOsFpKq3Zu
+kpPU5ANWFE+sjHMum4bicYvWj2Lp/S9yFiyTjKHp8kNCylyUS8v3qlN4hp0Phh3
Se4++o3tbIj5UNng9elmQX/OHVdO4G8cqNaNeJ+SkoRjgNo4QZhaCGLnx2Av44cm
awB8S2nz8T0RSmHvwJWjjATYKYd4WbJrqo66yFQcjlFifDlGiNyFIbVsNK3KUFeH
SpanIV2+Ok0k7qUVSxxEHyQrmjo2gxAlvCfJS04GXupkH+xeGcWLS4tN37bg2o2S
DAwsS93IX8bUC4SQ4KSqCdz30SaxHLsNKDKQy/3fIltlHFenU+wFKK7nhr6IgoGV
nrzctPxFVHrPib8d6p7EOnkRgz9ZSBgSulU7EwYLQ8K/JiSz7RhSUbl/u5V3ITiO
UhQBn67jwJ26PAUShalV6MXsclwr8R3cFOqRvw8EYS0MEOSQ3SLgWfwU84mEFjZP
Lpe7qyshoxt4Ju8skMV2NNQ3dp55zglDrUmVeUm8ou+ISPO2fI7uNA50wQWenYx3
SNKgyD/YHIB6OnNvz5VVckxwewVdj2bZS+QTDsgW0lJyjJxo+/YMat6g5wV4GDol
8F9RYAnpAVB6iDuOC3pLGSFT+dfJ0HYf0p7XG1w9xwNiRuJjDXg=
=U0uP
-----END PGP SIGNATURE-----

--=-vpTRhMasaZa4vB7WmVbH--



--===============3596329964947372309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3596329964947372309==--


