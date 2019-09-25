Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C2BE0F6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:13:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD8xA-0004BX-7P; Wed, 25 Sep 2019 15:11:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rg9B=XU=suse.de=nsaenzjulienne@srs-us1.protection.inumbo.net>)
 id 1iD8fB-000286-AO
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 14:53:05 +0000
X-Inumbo-ID: 2ce9a642-dfa4-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2ce9a642-dfa4-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 14:53:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47F59AEE1;
 Wed, 25 Sep 2019 14:53:02 +0000 (UTC)
Message-ID: <d1a31a2ec8eb2f226b1fb41f6c24ffb47c3bf7c7.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Date: Wed, 25 Sep 2019 16:52:59 +0200
In-Reply-To: <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <CAL_Jsq+v+svTyna7UzQdRVqfNc5Z_bgWzxNRXv7-Wqv3NwDu2g@mail.gmail.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Sep 2019 15:11:38 +0000
Subject: Re: [Xen-devel] [PATCH 00/11] of: Fix DMA configuration for non-DT
 masters
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>, james.quinlan@broadcom.com,
 linux-pci@vger.kernel.org, "open list:DMA GENERIC OFFLOAD ENGINE
 SUBSYSTEM" <dmaengine@vger.kernel.org>, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============9060129792173961816=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============9060129792173961816==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5Mzcra9IsjRjM5vnaomh"


--=-5Mzcra9IsjRjM5vnaomh
Content-Type: multipart/mixed; boundary="=-QzsDiLgE5dpWVAyKk5Wj"


--=-QzsDiLgE5dpWVAyKk5Wj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-09-24 at 16:59 -0500, Rob Herring wrote:
> On Tue, Sep 24, 2019 at 1:12 PM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> > Hi All,
> > this series tries to address one of the issues blocking us from
> > upstreaming Broadcom's STB PCIe controller[1]. Namely, the fact that
> > devices not represented in DT which sit behind a PCI bus fail to get th=
e
> > bus' DMA addressing constraints.
> >=20
> > This is due to the fact that of_dma_configure() assumes it's receiving =
a
> > DT node representing the device being configured, as opposed to the PCI=
e
> > bridge node we currently pass. This causes the code to directly jump
> > into PCI's parent node when checking for 'dma-ranges' and misses
> > whatever was set there.
> >=20
> > To address this I create a new API in OF - inspired from Robin Murphys
> > original proposal[2] - which accepts a bus DT node as it's input in
> > order to configure a device's DMA constraints. The changes go deep into
> > of/address.c's implementation, as a device being having a DT node
> > assumption was pretty strong.
> >=20
> > On top of this work, I also cleaned up of_dma_configure() removing its
> > redundant arguments and creating an alternative function for the specia=
l
> > cases
> > not applicable to either the above case or the default usage.
> >=20
> > IMO the resulting functions are more explicit. They will probably
> > surface some hacky usages that can be properly fixed as I show with the
> > DT fixes on the Layerscape platform.
> >=20
> > This was also tested on a Raspberry Pi 4 with a custom PCIe driver and
> > on a Seattle AMD board.
>=20
> Humm, I've been working on this issue too. Looks similar though yours
> has a lot more churn and there's some other bugs I've found.

That's good news, and yes now that I see it, some stuff on my series is ove=
rly
complicated. Specially around of_translate_*().

On top of that, you removed in of_dma_get_range():

-	/*
-	 * At least empty ranges has to be defined for parent node if
-	 * DMA is supported
-	 */
-	if (!ranges)
-		break;

Which I assumed was bound to the standard and makes things easier.

> Can you test out this branch[1]. I don't have any h/w needing this,
> but wrote a unittest and tested with modified QEMU.

I reviewed everything, I did find a minor issue, see the patch attached.

Also I tested your branch both on an RPi4, with a PCI device that depends o=
n
these changes and by comparing the OF debugs logs on a Layerscape board whi=
ch
uses dma-ranges, dma-coherent and IOMMU. All works as expected.

Will you send this series for v5.5? Please keep me in the loop, I'll review=
 and
test the final version.

Regards,
Nicolas


--=-QzsDiLgE5dpWVAyKk5Wj
Content-Disposition: attachment;
	filename*0=0001-of-device-do-not-bail-of_dma_configure-when-force_dm.pat;
	filename*1=ch
Content-Type: text/x-patch;
	name="0001-of-device-do-not-bail-of_dma_configure-when-force_dm.patch";
	charset="UTF-8"
Content-Transfer-Encoding: base64

RnJvbSAyNmQ1MTg1M2MyNWMwNGMyOGRiYzA5MDYxOTUxYTkzYzEwMmRhYmNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNvbGFzIFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5u
ZUBzdXNlLmRlPgpEYXRlOiBXZWQsIDI1IFNlcCAyMDE5IDE2OjI2OjU3ICswMjAwClN1YmplY3Q6
IFtQQVRDSF0gb2Y6IGRldmljZTogZG8gbm90IGJhaWwgb2ZfZG1hX2NvbmZpZ3VyZSgpIHdoZW4g
Zm9yY2VfZG1hIGlzCiBzZXQKClNvbWUgWGVuIGRldmljZXMgY2FsbCBvZl9kbWFfY29uZmlndXJl
KCkgd2l0aG91dCBhbiBhY3R1YWwgRFQgbm9kZSBpbgpvcmRlciBmb3IgaXQgdG8gc2V0IGl0cyAn
ZG1hX29wcycuIFRoYXQncyB0aGUgb3JpZ2luYWwgaW50ZW50IG9mCidmb3JjZV9kbWEnLCBob25v
ciB0aGF0IGJlaGF2aW91ci4KClNpZ25lZC1vZmYtYnk6IE5pY29sYXMgU2FlbnogSnVsaWVubmUg
PG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9vZi9kZXZpY2UuYyB8IDIgLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yv
ZGV2aWNlLmMgYi9kcml2ZXJzL29mL2RldmljZS5jCmluZGV4IGE0NTI2MWUyMTE0NC4uN2JjMDBm
NzI0NjhmIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2RldmljZS5jCisrKyBiL2RyaXZlcnMvb2Yv
ZGV2aWNlLmMKQEAgLTEwMCw4ICsxMDAsNiBAQCBpbnQgb2ZfZG1hX2NvbmZpZ3VyZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50LCBib29sIGZvcmNlXwogCW5w
ID0gZGV2LT5vZl9ub2RlOwogCWlmICghbnApCiAJCW5wID0gcGFyZW50OwotCWlmICghbnApCi0J
CXJldHVybiAtRU5PREVWOwogCiAJcmV0ID0gb2ZfZG1hX2dldF9yYW5nZShucCwgJmRtYV9hZGRy
LCAmcGFkZHIsICZzaXplKTsKIAlpZiAocmV0IDwgMCkgewotLSAKMi4yMy4wCgo=


--=-QzsDiLgE5dpWVAyKk5Wj--

--=-5Mzcra9IsjRjM5vnaomh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2Lf0sACgkQlfZmHno8
x/7mvQf6A++shc7v4vCUvlFLh6kIZ0UPBKuSnxpUpUn+R3BMoS6J5Ce/ma0SOzIJ
MRQmawROuL2F6qf0g3ykdpnaSD14TAEB9UnJzLoTkprKRFRhdq4pQjCDGDWIpWSO
fW6GnBbCLaTa0r38siU1DvnV3ZXCNnmN+lO5mqEp380R7cLwMj0hrH4mzkNuSUHK
uKWLMd/ZZyDk7e2j1qZ2bXg6PRRSfXZfU7Oqtwt6k7JNoPB/HneraMxoO43EyzDA
qt4Fxx6cDsZQAPbqJPChpSN4USdi0rN171NlKW3+PRsGfZN4LzUF3MoK2uvReV0n
DhW7JoNOzqhh0pk2iPTRov0M+zbYEg==
=jmQ8
-----END PGP SIGNATURE-----

--=-5Mzcra9IsjRjM5vnaomh--



--===============9060129792173961816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9060129792173961816==--


