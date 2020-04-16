Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FF71ACCD1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 18:11:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP76T-00011V-PC; Thu, 16 Apr 2020 16:11:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04wr=6A=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jP76S-00011P-OJ
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 16:11:00 +0000
X-Inumbo-ID: dc4e1eda-7ffc-11ea-8bc4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc4e1eda-7ffc-11ea-8bc4-12813bfff9fa;
 Thu, 16 Apr 2020 16:10:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 462E9AB3D;
 Thu, 16 Apr 2020 16:10:58 +0000 (UTC)
Message-ID: <559fe5e03caa954f6985e074940b5eb076b0af3f.camel@suse.com>
Subject: Re: [PATCH] sched: fix scheduler_disable() with core scheduling
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Sergey Dyasli
 <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 16 Apr 2020 18:10:57 +0200
In-Reply-To: <8db96ff6-53e3-8c01-0737-5181ccc348ab@suse.com>
References: <20200409094137.13836-1-sergey.dyasli@citrix.com>
 <8db96ff6-53e3-8c01-0737-5181ccc348ab@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-YN2g2caKjbfUCaXH3L5Q"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-YN2g2caKjbfUCaXH3L5Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-09 at 14:50 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 09.04.20 11:41, Sergey Dyasli wrote:
> > In core-scheduling mode, Xen might crash when entering ACPI S5
> > state.
> > This happens in sched_slave() during is_idle_unit(next) check
> > because
> > next->vcpu_list is stale and points to an already freed memory.
> >=20
> > This situation happens shortly after scheduler_disable() is called
> > if
> > some CPU is still inside sched_slave() softirq. Current logic
> > simply
> > returns prev->next_task from sched_wait_rendezvous_in() which
> > causes
> > the described crash because next_task->vcpu_list has become
> > invalid.
> >=20
> > Fix the crash by returning NULL from sched_wait_rendezvous_in() in
> > the case when scheduler_disable() has been called.
> >=20
> > Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
>=20
> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-YN2g2caKjbfUCaXH3L5Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6Yg5EACgkQFkJ4iaW4
c+5qmw/+JPlnlHvg0c5jxt4Y7BsJo8P1HLhfIFT6lviclMaIQR7rCuo2S/thnnN1
bsmoxB0nyI+REPq8ZEe+zOqhqO6dzg53+/Ue1Ybdy1592Z5ETzAOaDGUZU5395ty
rgFMdTVG0ePL3kyJcoHBxoG2IHVyRBQE9nIERQ1VUhwMPt8P4mlJ4He+P2mJNBDV
u6vVZcnO85qxaXuctvyUXTJlmd8vvixr0I93FcLjtnvH9GTxDba3597EZkTk/qug
FRiCIceaAdSZzzrG+dTyQMOqVLtHbRPoYeEc+5sdazNmItd5G4sdpQv7nfYjotF7
+OGSHX9k1prglZ11WFhhTur2pthnWMc7GNFPdyE8um2X3fMcIIPPBbsgSuxGlD82
ib6qt8aRnt6zaZkUrleGmJ7mjcEHywsTWV7cPORsJkUQpYCzMEGfJgwxxAJNMwY2
nBYAb5PhMNraK1r2yDFCOP0zAM0tuFMoJtnGLjFYnfXC200qDfOh5cFp0sQQT3kl
r7EPmFvsNaj0xaGyM3VCt+go93ig5iBzElUcw/vf/b/irctNE9adQ4Uc+2B0hfPR
AlCLSRjfysdZ9sE7BPj+pbH7wX689ybCbiDJoR04HRHtXDaHNsX8yJZ4xwXyCXlU
cy7fjrvKBIelpCSEExzajnBtIkhaDPM01uQsMcWWrEnYuqWQ1+Y=
=vc/P
-----END PGP SIGNATURE-----

--=-YN2g2caKjbfUCaXH3L5Q--


