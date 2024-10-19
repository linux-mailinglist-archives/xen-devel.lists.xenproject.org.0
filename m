Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3C9A4B19
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2024 05:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822331.1236322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t204D-0006Yl-Dt; Sat, 19 Oct 2024 03:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822331.1236322; Sat, 19 Oct 2024 03:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t204D-0006X2-B9; Sat, 19 Oct 2024 03:23:49 +0000
Received: by outflank-mailman (input) for mailman id 822331;
 Sat, 19 Oct 2024 03:23:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpTG=RP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t204B-0006Ww-Da
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2024 03:23:47 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8af16639-8dc9-11ef-a0be-8be0dac302b0;
 Sat, 19 Oct 2024 05:23:45 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 5EB39138025C;
 Fri, 18 Oct 2024 23:23:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Fri, 18 Oct 2024 23:23:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Oct 2024 23:23:40 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8af16639-8dc9-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1729308222;
	 x=1729394622; bh=62U24OVI9ASqF2RIn6vHVkVMeUufpkaeCYq69ukBmv8=; b=
	i/meU/GlHsLVxubQLaYIEuz8TkncgJOvgly2mIlXBRqWozw2DGoxIDEG2J8HvUk9
	hj7mPL2Av/S/XOUYtjSB1AtqqFon5DM3IkRjm1XIZ9MjwRZYzwUpKCrPUPaypx6d
	KxGkL/QHZEE4/VpjX6GuDysQR7v64xiLyVwye/OPM3FA5WU0VdYoHELJf/1c+/Vv
	D23IUo45J0kGWlBbalNtHcrh89tzArHYnpnuP3+VIhv4alupfP3z/C3GaxUxZmm/
	I+sPu1PNaMLCOc9bbZU/WynFFgpBAHr5VoKod3fCXPaSknB2/OaC11WmsLMrHx85
	eEhmVgXokX5wI+FFW3FRMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1729308222; x=1729394622; bh=62U24OVI9ASqF2RIn6vHVkVMeUuf
	pkaeCYq69ukBmv8=; b=QdpYHD9Xj26PZO6HBFMyHy/qTwso8JZAVcyO2RRxmeUv
	MLYpUMJPyL3HmqYtvD5NlkzqF54ToAkKkfs9PWVlsoRdO0d4hI2nt5anciNf5dXF
	VELatzwipxYEl/ZOdKRSAVAyEC3eJbuhD7biBbXsKWQeorQL5DKLTmAxKYKy+vU+
	Z826PqEIBd4pZq0LG8BWSUETOZkGVzeQpjQWKSQDDXike4zxi65ycD8fz8VrM5La
	QbyOBn9blwwknLL3GFGnzoJPXhPa8cwwLEVo4UV70Jfq0eVWnX59Tam4FYc37jL/
	H3vcVj/7/GDQALAbujebG1i9BoJWkNSCNU5Mo4efYQ==
X-ME-Sender: <xms:PSYTZ8-QzfboB1SmVg8iz6w2KqXqGp3bQo1b_ba7149z6iXqZeE7SA>
    <xme:PSYTZ0u-ag5BI-p5Alb3gL2ZsMDCT0jqBhFyhh0a0QziRoSmKfoOFvGuQIY3hAR5W
    qep4MkZtMji3g>
X-ME-Received: <xmr:PSYTZyDA7nhtJgGUVU4NZ1TsWOmOsraY3hIMurfy_D4FBYzUBkZas4wlOB-aO3mn3YM6eN5HWPmQgJ4QMIW8ZL8EFY4LfwDpdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehgedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghh
    sehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhhprhhojhgvtghtseihmhihrdgsvgdprhgt
    phhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhk
X-ME-Proxy: <xmx:PSYTZ8f5pyAkbApOZ6Z4mvOvNtTsDkhmlehwjzjCuDyh0WmPl3bp8A>
    <xmx:PSYTZxPopeP1xanPxl9WGvSmOAUgieo0L67OR6Cy7BCgFevWVyBkOQ>
    <xmx:PSYTZ2l-j-gXUZf7uAz2Cm6tOEuZIehhmhKXe_pmB4121HuSiNVW-w>
    <xmx:PSYTZzu6FPrzTecFJtDb21T0nVUNiXu28S3CGNKmgqlikI0acmwRZQ>
    <xmx:PiYTZ03wN-AqzKo6l1FsFOeKj4YhxgBQE4KoftVTdxZr93lNQNKXWxSk>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 19 Oct 2024 05:23:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxMmOjD7oHuAE7Vb@mail-itl>
References: <20241018080813.45759-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+AprsNGlh2aM16SR"
Content-Disposition: inline
In-Reply-To: <20241018080813.45759-1-roger.pau@citrix.com>


--+AprsNGlh2aM16SR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Oct 2024 05:23:38 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping

On Fri, Oct 18, 2024 at 10:08:13AM +0200, Roger Pau Monne wrote:
> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE=
 is
> repurposed to contain part of the offset into the remapping table.  Previ=
ous to
> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> table would match the vector.  Such logic was mandatory for end of interr=
upt to
> work, since the vector field (even when not containing a vector) is used =
by the
> IO-APIC to find for which pin the EOI must be performed.
>=20
> Introduce a table to store the EOI handlers when using interrupt remappin=
g, so
> that the IO-APIC driver can translate pins into EOI handlers without havi=
ng to
> read the IO-APIC RTE entry.  Note that to simplify the logic such table i=
s used
> unconditionally when interrupt remapping is enabled, even if strictly it =
would
> only be required for AMD-Vi.
>=20
> Reported-by: Willi Junga <xenproject@ymy.be>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a=
 static mapping')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

I can confirm it fixes touchpad issue on Framework 13 AMD,
it works without ioapic_ack=3Dnew now, thanks!
Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e40d2f7dbd75..8856eb29d275 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> =20
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> =20
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry rem=
apped
> + * format repurposes the vector field to store the offset into the Inter=
rupt
> + * Remap table.  This causes directed EOI to longer work, as the CPU vec=
tor no
> + * longer matches the contents of the RTE vector field.  Add a translati=
on
> + * table so that directed EOI uses the value in the RTE vector field when
> + * interrupt remapping is enabled.
> + *
> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vecto=
r field
> + * when using the remapped format, but use the translation table uniform=
ly in
> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + */
> +static unsigned int **apic_pin_eoi;
> +
>  static void share_vector_maps(unsigned int src, unsigned int dst)
>  {
>      unsigned int pin;
> @@ -273,6 +289,13 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Might be called before apic_pin_eoi is allocated.  Entry will=
 be
> +         * updated once the array is allocated and there's an EOI or wri=
te
> +         * against the pin.
> +         */
> +        if ( apic_pin_eoi )
> +            apic_pin_eoi[apic][pin] =3D e.vector;
>      }
>      else
>          iommu_update_ire_from_apic(apic, pin, e.raw);
> @@ -298,9 +321,17 @@ static void __io_apic_eoi(unsigned int apic, unsigne=
d int vector, unsigned int p
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> +        if ( apic_pin_eoi )
> +            vector =3D apic_pin_eoi[apic][pin];
> +
>          /* If vector is unknown, read it from the IO-APIC */
>          if ( vector =3D=3D IRQ_VECTOR_UNASSIGNED )
> +        {
>              vector =3D __ioapic_read_entry(apic, pin, true).vector;
> +            if ( apic_pin_eoi )
> +                /* Update cached value so further EOI don't need to fetc=
h it. */
> +                apic_pin_eoi[apic][pin] =3D vector;
> +        }
> =20
>          *(IO_APIC_BASE(apic)+16) =3D vector;
>      }
> @@ -1022,7 +1053,23 @@ static void __init setup_IO_APIC_irqs(void)
> =20
>      apic_printk(APIC_VERBOSE, KERN_DEBUG "init IO_APIC IRQs\n");
> =20
> +    if ( iommu_intremap )
> +    {
> +        apic_pin_eoi =3D xzalloc_array(typeof(*apic_pin_eoi), nr_ioapics=
);
> +        BUG_ON(!apic_pin_eoi);
> +    }
> +
>      for (apic =3D 0; apic < nr_ioapics; apic++) {
> +        if ( iommu_intremap )
> +        {
> +            apic_pin_eoi[apic] =3D xmalloc_array(typeof(**apic_pin_eoi),
> +                                               nr_ioapic_entries[apic]);
> +            BUG_ON(!apic_pin_eoi[apic]);
> +
> +            for ( pin =3D 0; pin < nr_ioapic_entries[apic]; pin++ )
> +                apic_pin_eoi[apic][pin] =3D IRQ_VECTOR_UNASSIGNED;
> +        }
> +
>          for (pin =3D 0; pin < nr_ioapic_entries[apic]; pin++) {
>              /*
>               * add it to the IO-APIC irq-routing table:
> --=20
> 2.46.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+AprsNGlh2aM16SR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmcTJjoACgkQ24/THMrX
1yzaFwf8C+J4vgJ4lEOMFFSgir20FGRMxKH616PLIqdhzrMsDs+21pd9A+YbAyuL
0zf3OipSRjZhdl73klQuEuQGvrl81r5jrk0Pr6WcM29rAdufEs1zcjQVgYneRExH
2jcnGEyGih9JThhxSgq69lGir/q4MCCZdujYULKQ5QaYgKA9EVrGX4SBf0o39JM0
eFbIXObt7OeZs8CHD2ihfiPsLOF9oUd/2U6WTGIRAnAjUrzLqajNty/6TzyPtxHS
SM9pjWBQIa72Z56a87Ry0vuN4OPSF5tjUAqHzxqzS9xfCLk010ZATyl7yUsiNOb3
oZrkQhNh3XjJO3ZwJXXnjqasw/52fA==
=dFRW
-----END PGP SIGNATURE-----

--+AprsNGlh2aM16SR--

