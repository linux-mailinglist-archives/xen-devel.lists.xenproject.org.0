Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB15427B9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 15:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb3NP-0003Kb-AG; Wed, 12 Jun 2019 13:33:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiAS=UL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hb3NO-0003K4-0m
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 13:33:18 +0000
X-Inumbo-ID: a1ef2d61-8d16-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1ef2d61-8d16-11e9-8980-bc764e045a96;
 Wed, 12 Jun 2019 13:33:16 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 15:33:15 +0200
Received: from [192.168.0.36] (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 12 Jun 2019 14:32:49 +0100
Message-ID: <d37278c66ee6aca48bb075cc050f2b09a5b55936.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Date: Wed, 12 Jun 2019 15:32:47 +0200
In-Reply-To: <44422740-bef7-0025-a139-67aa0de13982@citrix.com>
References: <20190528103313.13431jgross@suse.com>
 <20190528103313.13434jgross@suse.com>
 <afe9fd8d36b5e946208436bf8f7dcaba@citrix.com>
 <4e594f85-b33b-87ca-2253-53a70ab8808f@suse.com>
 <5D00C6960200007800237622@suse.com>
 <0889f51d8aed0c95ecfcd038678f945abf2ca42a.camel@suse.com>
 <5D00D07F020000780023768C@prv1-mh.provo.novell.com>
 <44422740-bef7-0025-a139-67aa0de13982@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4706748662629695390=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4706748662629695390==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nyyQVz3B9tHlTvkrUwoG"


--=-nyyQVz3B9tHlTvkrUwoG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-12 at 12:27 +0100, Andrew Cooper wrote:
> It is a consequence of our extra magic scheduler locks which protect
> the
> pointer used to locate them, and the ensuing double-step in ???
> (seriously - I can't figure out the function names created by the
> sched_lock() monstrosity) which take the lock, re-read the lock
> pointer
> and drop on a mismatch.
>=20
Just FTR, they're:

vcpu_schedule_lock()
vcpu_schedule_lock_irq()
vcpu_schedule_lock_irqsave()

and:

pcpu_schedule_lock()
pcpu_schedule_lock_irq()
pcpu_schedule_lock_irqsave()

and the corresponding *_schedule_unlock_*() ones, of course. ;-P

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-nyyQVz3B9tHlTvkrUwoG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl0A/wAACgkQFkJ4iaW4
c+6EKhAAnI6vGMD12gCvhT6w1MGkein5ZYokJnzof65Q7dTByi5PD6bjzN9o8EDO
NVeB8qLlfjEku68JYJ+WcZ9Y3aEagQrkl8wBJoHbu7py37eEhrr6YSvXuj1+brav
MOAVH3eJA74iEpT3yEjeMVZkKvVOFEOB+YulOEs9yLmW+IpM7ZCuMn6VIkYcf9+m
+b2xkWsJx0gu9fpoCQnI1pLfRRV8a8jeDasIeoz6k3EKclG7jMv2pkAhCmefWf16
uYmUJs5pq1KPPfBiIsDm3Bx7h10SmKgV1Z37pAEetBGW1afzujHigkFIWn50O3ky
/C5B9Dcuh7tShc25v2EeN05oEU/YaWZe8ELphp1T9WK40g6d7YVnY9aXUubVtRDN
TwPtjNrkDDsWPTfl0TuutzR8fNq8ioZ/c+cO+p/9k3WkP2YSIyGz7Vqm2NjsNgWQ
SyiGEiOGsU2T0PpRbpZ6Hae+JXmoZ1ciZNgxSv/uPS9p0zFQu5SwMRDeEttmo1Ub
qOAVU34ysV+z9WCA1RLjTtgUqTorkqaCQpuaXV+8gLQrCfsMwxpa5JC94KhPcz0f
dgQnVvhUDEgRhfUt0KhoHe93zb0ZTlYm5zuOWPhGR362Wl4fb7WATPWp0daGtKg9
p6Wi/TZLRNndLSjATUyd0X2wLfnNtOTXNm6jkXTOaRev9eHpmzo=
=csK1
-----END PGP SIGNATURE-----

--=-nyyQVz3B9tHlTvkrUwoG--



--===============4706748662629695390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4706748662629695390==--


