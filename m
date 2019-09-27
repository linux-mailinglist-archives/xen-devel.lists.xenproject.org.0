Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7489C022E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:21:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmNw-0007hq-8S; Fri, 27 Sep 2019 09:17:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDmNv-0007hg-4r
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:17:55 +0000
X-Inumbo-ID: af8ce8de-e107-11e9-9672-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id af8ce8de-e107-11e9-9672-12813bfff9fa;
 Fri, 27 Sep 2019 09:17:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 663DAAFC1;
 Fri, 27 Sep 2019 09:17:53 +0000 (UTC)
Message-ID: <2a757320db096f0f1362a1f58525b3e33377d179.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:17:52 +0200
In-Reply-To: <20190927070050.12405-21-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-21-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 20/46] xen: let vcpu_create() select
 processor
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3432777066370766135=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3432777066370766135==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Rnor0CX0pQ1mXmkTSEKP"


--=-Rnor0CX0pQ1mXmkTSEKP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Today there are two distinct scenarios for vcpu_create(): either for
> creation of idle-domain vcpus (vcpuid =3D=3D processor) or for creation
> of
> "normal" domain vcpus (including dom0), where the caller selects the
> initial processor on a round-robin scheme of the allowed processors
> (allowed being based on cpupool and affinities).
>=20
> Instead of passing the initial processor to vcpu_create() and passing
> on to sched_init_vcpu() let sched_init_vcpu() do the processor
> selection. For supporting dom0 vcpu creation use the node_affinity of
> the domain as a base for selecting the processors. User domains will
> have initially all nodes set, so this is no different behavior
> compared
> to today. In theory this is not guaranteed as vcpus are created only
> with XEN_DOMCTL_max_vcpus being called, but this call is going to be
> removed in future and the toolstack doesn't call
> XEN_DOMCTL_setnodeaffinity before calling XEN_DOMCTL_max_vcpus.
>=20
> To be able to use const struct domain * make cpupool_domain_cpumask()
> take a const domain pointer, too.
>=20
> A further simplification is possible by having a single function for
> creating the dom0 vcpus with vcpu_id > 0 and doing the required
> pinning
> for all vcpus after that. This allows to make sched_set_affinity()
> private to schedule.c and switch it to sched_units easily. Note that
> this functionality is x86 only.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Julien Grall <julien.grall@arm.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Rnor0CX0pQ1mXmkTSEKP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2N08AACgkQFkJ4iaW4
c+7A+A/9FeLzjmvjN7lMGZTi8MlDycevR+TyN7FAZl7e86ZO+5rWvj0II1HrKILQ
llPIIgSvBY7Tp8k3rUlL20Ph2XfCzCBzTzNQ7qu6H+NWQMNErE9OCWrBmpXw4Kbp
utTn5AI242t0P7phiRtHsNnQYJaw2u6iihLYufVTOL9+8FOZzdmmVAgit40q/RAG
VJr/FSYlVDzJaEkkCr0GSUxJIeD5O4D05ezTpgXZYtH5gECx+oJMAtVlHbFSmAaI
bL19UQ/CaMbFOgdo667vqtH5mtH6dMsKQeK3zlN3vHhOITM3ohriW84utbN66z/i
tYCIwWPVOPnlv9kty0KCVP4GR+g5hnzpbPt4nn+JZbM031q3IaXagC6YMvHL8lxq
wcObgcKuKV/Kv/vwkDXaCZFk9v83iYGRyiFtW+vvdGsM2WmStZofw+aLvN2vN6t4
hAh38adQnHgLuugrkvMgHwbctnKW31M/EFvOAln+lDNMoTnPCmglyUoc5pvAejJc
rP57hMg1XlruxBBbf+HjCqRo37OIeJuA4hxLy1VfN2HRqaArco6Sm1bUx64Ps3MT
sh678gvHIsMniYjMFNvzRAg5W+GXjvL7TCKmB1nuY45N9DFlNR5fK+M4r2GIgW68
55FI3dz5oZHxDvQZqfhRE0bjwrxqExWFa7Jn0cFPdZnu/hHShxI=
=KWF2
-----END PGP SIGNATURE-----

--=-Rnor0CX0pQ1mXmkTSEKP--



--===============3432777066370766135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3432777066370766135==--


