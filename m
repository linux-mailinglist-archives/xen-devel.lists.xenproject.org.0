Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8928DA76D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 10:30:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL16t-0007kY-0U; Thu, 17 Oct 2019 08:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xclA=YK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iL16r-0007kT-Vc
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 08:26:14 +0000
X-Inumbo-ID: c77fd220-f0b7-11e9-8aca-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c77fd220-f0b7-11e9-8aca-bc764e2007e4;
 Thu, 17 Oct 2019 08:26:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BF8621F69;
 Thu, 17 Oct 2019 04:26:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 17 Oct 2019 04:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=L3Higc
 y8FZzEtISj1kV8lhx6Ac0NUnVhfdV8iss7h8E=; b=AdL/7un0Ghq7sHjm6BeTMA
 7naaKaAYmPnE6EmUtYN9odFKQDapxPY4QmdWnb/zEgvMxLYQLDsS/nrjwuqKtI09
 dp82lPEGpwc2kVRdTHz5sbWo4hl8dR1kgi4NCTtcWBbzl1GoWp7s1FsrrryJJDyw
 hdOB8afp6exUJimIoDMSWmuWjWBt7alPEXoYCgmhRMBTxs8qi9r7ZJMSLYguAGCL
 XynIzhG/VpAw/y3V2ciGNLFks3/bz04SBxicdCRlf29pia4Jcd92jPPSC0fE3GtQ
 fuZZUI7wd4ulAWqSEOOpGfX4fi0gM8blQ4neVqTHr8CYD46blB+ITtrT5mdbhM8A
 ==
X-ME-Sender: <xms:pCWoXYs3dbYP9LRgOCuD2J-OQ-qNSLy7ikyV71Gu7gN4-9zXh_tDlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeejgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pCWoXUaNHlKbPLn19NxN5z0tgyqHF-MKWq8hloQB_yFpLazoiPvXvg>
 <xmx:pCWoXf19IY5Qu1vqEwXmT9E8xM-hNEeZ5aJfHl9PsYMPKPpXRoyTBw>
 <xmx:pCWoXetik4e6Age-WzAlVYEMN_iNp9KNWaPmWAfdSpMFmThSaPFlwg>
 <xmx:pCWoXa8ga6fKBAnCQKG7BzeoVpVquBQ7jVDVxMMFk4giJ303pndYmw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 595AE8005B;
 Thu, 17 Oct 2019 04:26:11 -0400 (EDT)
Date: Thu, 17 Oct 2019 10:26:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191017082608.GA1410@mail-itl>
References: <20191015154736.19882-1-roger.pau@citrix.com>
 <20191015154736.19882-3-roger.pau@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20191015154736.19882-3-roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 2/4] x2APIC: simplify resume
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============1280047412952601004=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1280047412952601004==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/4] x2APIC: simplify resume

On Tue, Oct 15, 2019 at 05:47:34PM +0200, Roger Pau Monne wrote:
> There's no need to save and restore the IO-APIC entries, the entries
> prior to suspension have already been saved by ioapic_suspend, and
> will be restored by ioapic_resume. Note that at the point where
> resume_x2apic gets called the IO-APIC has not yet resumed, and hence
> all entries should be masked.
>=20
> Note this shouldn't introduce any functional change.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

I've tried host suspend without any domU running and it works. I've tested
just this patch without others in the series, does it matter?

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> I'm Ccing Marek since I think he usually tests suspend/resume. Could
> you give this patch a try?
> ---
> Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
> Changes since v2:
>  - New in this version.
> ---
>  xen/arch/x86/apic.c | 27 ---------------------------
>  1 file changed, 27 deletions(-)
>=20
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index 6cdb50cf41..0607eb92a8 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -492,35 +492,8 @@ static void __enable_x2apic(void)
> =20
>  static void resume_x2apic(void)
>  {
> -    struct IO_APIC_route_entry **ioapic_entries =3D NULL;
> -
> -    ASSERT(x2apic_enabled);
> -
> -    ioapic_entries =3D alloc_ioapic_entries();
> -    if ( !ioapic_entries )
> -    {
> -        printk("Allocate ioapic_entries failed\n");
> -        goto out;
> -    }
> -
> -    if ( save_IO_APIC_setup(ioapic_entries) )
> -    {
> -        printk("Saving IO-APIC state failed\n");
> -        goto out;
> -    }
> -
> -    mask_8259A();
> -    mask_IO_APIC_setup(ioapic_entries);
> -
>      iommu_enable_x2apic();
>      __enable_x2apic();
> -
> -    restore_IO_APIC_setup(ioapic_entries);
> -    unmask_8259A();
> -
> -out:
> -    if ( ioapic_entries )
> -        free_ioapic_entries(ioapic_entries);
>  }
> =20
>  void setup_local_APIC(void)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2oJaAACgkQ24/THMrX
1yz+Agf/RtdcghMttQ01fvLUie28TXbXfpuEtIL0awUeyCCgked7Klui2F/q3gsP
oxTRB54E8qHUT1iFJ2QEJkwsFv4CeBli/jhDDsKwI1+op2AeYdOySUqcpfGyBOIF
AE0U0/Qr2YEhkq6ytGciZnJBdxQTqHf8MtBgKavEawHQmclgBggHXiEDQR+S2yVF
GJDEjKm9M9fhpOgWwX58WySt48bf6b+cf2pnIzMO2H8cXh86iS4oj/10ezWNFpkM
+sOuLHouPqp4pdhvF3YgV+KO6TOWwRA9/r92PKgSP5rE5d/L65yv8PrC3QZW3Gj7
KsQ93pE2ztT38MQmlUUp5IydVt29hA==
=+QD6
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--


--===============1280047412952601004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1280047412952601004==--

