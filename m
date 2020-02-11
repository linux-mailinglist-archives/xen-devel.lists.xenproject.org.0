Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2675158CDB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 11:40:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Suz-0005fM-6z; Tue, 11 Feb 2020 10:37:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H8PB=37=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j1Sux-0005fD-M0
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:37:23 +0000
X-Inumbo-ID: 7c6a1160-4cba-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c6a1160-4cba-11ea-b472-bc764e2007e4;
 Tue, 11 Feb 2020 10:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B2DF1AB3D;
 Tue, 11 Feb 2020 10:37:21 +0000 (UTC)
Message-ID: <ab00b9b4e25d9d690c803ae5a986881cfa1b6fbd.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 11:37:20 +0100
In-Reply-To: <20200210153920.4297-1-jgross@suse.com>
References: <20200210153920.4297-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/sched: remove sched_init_pdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Meng Xu <mengxu@cis.upenn.edu>
Content-Type: multipart/mixed; boundary="===============0360903007120736254=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0360903007120736254==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZSpqO/21BAacC5wMBjRe"


--=-ZSpqO/21BAacC5wMBjRe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-10 at 16:39 +0100, Juergen Gross wrote:
> sched_init_pdata() is used nowhere, it can be removed. Same applies
> to
> the .init_pdata hook of the per-scheduler interface.
>
Right, and that appear to be the case since
f855dd962523b6cb47a92037bdd28b1485141abe ("sched: add minimalistic idle
scheduler for free cpus"), which removed all call sites.

And that is because switching to a scheduler always happens via
switch_sched from the idle scheduler, and it's there that we do all the
initializations, right?

This change is obviously doing the right thing, removing code that is
never called! :-)

Can we, though:
- add a mention to the commit above and a quick explanation of things=20
  in the changelog?
- update the following comments too:
  1) in cpu_schedule_callback()

"* This happens by calling the deinit_pdata and free_pdata hooks, in this  =
                                       =20
 * order. If no per-pCPU memory was allocated, there is no need to         =
                                       =20
 * provide an implementation of free_pdata. deinit_pdata may, however,     =
                                       =20
 * be necessary/useful in this case too (e.g., it can undo something done  =
                                       =20
 * on scheduler wide data structure during init_pdata). Both deinit_pdata  =
                                       =20
 * and free_pdata are called during CPU_DEAD."

  2) schedule_cpu_add()

"*  - a valid instance of per-CPU scheduler specific data, as it is
 *    allocated by sched_alloc_pdata(). Note that we do not want to
 *    initialize it yet (i.e., we are not calling sched_init_pdata()).
 *    That will be done by the target scheduler, in sched_switch_sched(),
 *    in proper ordering and with locking."

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ZSpqO/21BAacC5wMBjRe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5Cg+AACgkQFkJ4iaW4
c+7QOg/8CnzS+ye1hysDsT8JOydbqL7ZnZjveXcfECSn1RX5FWOz7CycwVKDc6WD
VIiXWj1ItjaxsqXIsrpVezpViNA9OSTXR6WeG9PEw+7rvaJSvnlZOXGaK8kJ6Xaw
M9qVPo6mT14b1UECJmGDWkSQXASxXnPrjeYPQIpEcr3mTMus/oDL5X80QltnFM0x
K2MtpbI2rjgNq5Fmv2AW1b0Wncab1A3KCKCe+AqWeCA4CSGBmoAFWiicD95tFc2x
SALORlRuCPYqlslMrhOQaHAGTH4rBBnqwFzjlx+gKOT5UNLoO553vpSx56Pzt1+K
g7BHHdUZ5k+PIHN8FjSdBBZC9BpBzd0mMMSWqKcwOQKyV66A8PxzLet/2QQA6Bq6
KB4HnEsSAK/OO1AT8sgRJJ8JRcNv8wcTa7j7FwA/VQeaFgLotYjOGGlNzKzu7BFp
Bk3se7mCYMybBTGwjRb0fd24p9DQfjAsKp0awNYpgMtGMSLSyogv6VZ92S10vahy
A376fqS6Zor2LRYmGdkN8bLjc0XDWWu9BkzCqL+1e8xipZ2Ye3kXtrwbCSaMwByM
xOoPxQn/F05mRsZUCrdYiV8wQp86foRz88axYNtPSlbuMvmihska9CGk3+f07M8L
hbrHnw1OvqiUuIIBtJ58iBoNOXumHvBdmzYH2f4gI2TnOxie34w=
=xrVt
-----END PGP SIGNATURE-----

--=-ZSpqO/21BAacC5wMBjRe--



--===============0360903007120736254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0360903007120736254==--


