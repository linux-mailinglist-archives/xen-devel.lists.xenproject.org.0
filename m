Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D0B0CDA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MHc-00049V-Gv; Thu, 12 Sep 2019 10:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uvwM=XH=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1i8MHb-00049F-8f
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:24:59 +0000
X-Inumbo-ID: 91bb2cce-d547-11e9-83e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91bb2cce-d547-11e9-83e6-12813bfff9fa;
 Thu, 12 Sep 2019 10:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34BD6AF47;
 Thu, 12 Sep 2019 10:24:57 +0000 (UTC)
Message-ID: <08af44affecf2f635afc0ff1e1f377651866d78b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 12:24:51 +0200
In-Reply-To: <20190809145833.1020-31-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-31-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 30/48] xen/sched: introduce
 unit_runnable_state()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============4414281846376508431=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4414281846376508431==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vbQxU2DbMKz2WftpD2J0"


--=-vbQxU2DbMKz2WftpD2J0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-09 at 16:58 +0200, Juergen Gross wrote:
> Today the vcpu runstate of a new scheduled vcpu is always set to
> "running" even if at that time vcpu_runnable() is already returning
> false due to a race (e.g. with pausing the vcpu).
>=20
> With core scheduling this can no longer work as not all vcpus of a
> schedule unit have to be "running" when being scheduled. So the
> vcpu's
> new runstate has to be selected at the same time as the runnability
> of
> the related schedule unit is probed.
>=20
So, you're saying that this patch is meant at fixing a race. A race
that, if I understood correctly, it's not there/it's not problematic
right now, but will be when we have more than 1 vcpu in a unit and we
enable core scheduling. Is this the case?

If yes:
- this very patch, at this point in the series, is basically
introducing no functional (or at least behavioral) change, is this
right too?
- can you provide some more detail about the race. When/how it occurs
and how the changes done in credit and rt fix it?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-vbQxU2DbMKz2WftpD2J0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl16HPQACgkQFkJ4iaW4
c+5laxAA3DErsducXHK1nL4QHFH1bNP3EI3bSH5cXkv8zIJ6DpkDNi4mj0CyBUcB
/1/aGUrJjParXscK9Km3e7hnk7BIjQcdmqVGFYW/RoHbKUWtr5ZsTslsesZh+wpV
9T2Q9l+/a/G/A+hTBDXA3w2j4MEzi+aPdDO6DfJRK5UP7PR6RJXVXlIguKsuqKF2
3h/V71tr2YC/Q9rYCB8v87ry/9ZklO5hd0nxoV8gD8bANR7DBtYgFNX9Q6bLSE3o
ZBaVX5KvQd580yERxrzjqB3vp8A+zGdhMEAGMkyS41tcPKyJqyba3U0DldsUjJIN
VKqu7mlHn8zFpf08ddtVNM+gi/cMJtBGAxoB0xpDsJNUv1Xm/kNGUvWfebYw+7X5
70HHj8Vap4QaD6S1MVeYc4q5ZWHzW5VbmK7LHd4/VKiadLqs5gbbCSUydAIr4dBC
/O83gkHeDhbeOE41y26DYjT0TkJMaNjyF7wqKBkeOXovK+PbsCaQCsazP7RgkYLp
OdHs3aewfAGZK32mBAj5zOohOfRkQJ7Yv0vZKPAAw86gjMoAUeGZo3x8Fr28fTTY
eoz+9KbxhvdXBW91591nsaHvSu/UYh68KMiQd9dtWuRf2s93rKjnuoQ6b/vXfoCn
COLF/SHQmCe68O/i2bx+BejhbeX27NE8Hq9gBi3myW2RmFNHsVc=
=TTxb
-----END PGP SIGNATURE-----

--=-vbQxU2DbMKz2WftpD2J0--



--===============4414281846376508431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4414281846376508431==--


