Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2C9B9C9C
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 04:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829280.1244352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t75Dl-00062b-Nx; Sat, 02 Nov 2024 03:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829280.1244352; Sat, 02 Nov 2024 03:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t75Dl-000615-Is; Sat, 02 Nov 2024 03:54:41 +0000
Received: by outflank-mailman (input) for mailman id 829280;
 Sat, 02 Nov 2024 03:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8EOZ=R5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t75Dj-00060z-SH
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 03:54:40 +0000
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b312107-98ce-11ef-99a3-01e77a169b0f;
 Sat, 02 Nov 2024 04:54:33 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id F29F41140118;
 Fri,  1 Nov 2024 23:54:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Fri, 01 Nov 2024 23:54:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 23:54:29 -0400 (EDT)
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
X-Inumbo-ID: 2b312107-98ce-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTQ3IiwiaGVsbyI6ImZvdXQtYjQtc210cC5tZXNzYWdpbmdlbmdpbmUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiMzEyMTA3LTk4Y2UtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNTE5NjczLjk5MTI2Miwic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1730519671;
	 x=1730606071; bh=++AHLVmJ6BsNb184+4dgPKxrWbOGf+cQlEP8x6mGi1M=; b=
	pggwgTAhmV9geZ5f1PirtCC39LHJadALowajk3MIiKMty2SgKjw96UwfYcthojXx
	ISidPRWG0rhpe5dujaVChKg/GcylSnylvmcAa1EW2uzUupe1e81R7MjzNKENEJae
	eFSJMapt5sS1YKzaI5r0TWD3vHBPmCAb9G2mCAYk0iXTnXJAzxOS8jLUQz1ADlRo
	38ZnktVBgK5B05Wx97HfVfYURfoZ0K4fbIP0wcs1VaPUMjQBn4ttH4yqkvzWvbWV
	uF96D+atsRFlv70mKVCjwLpHiIQO+1cW+ujtxxcHj4ATPtAPqZsvrKHWHOoXUWPn
	qhJTXfdm0T7hS3h7Ga/2gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730519671; x=1730606071; bh=++AHLVmJ6BsNb184+4dgPKxrWbOGf+cQlEP
	8x6mGi1M=; b=Yc+mrWpMGwhK0xJWQI+VvfC+p31NVbvtClD8Re984B8Avb9ll0J
	18GsbKUHdG/7fn3aUCM4sK1t1pXOXt6LxjWXc6skH5T1yv+l+ShaaEw6iy42bJ4i
	UhXkCq+4S6lGtyzIS1aY2rG0EGBTZIKNvqdSzT7QLZ0vkTsJ7gmoqk3UhRUu0swE
	jGFSJBBeYYDyCYJojIB7DtDctoE8X5QL0vJWebpziIhSSiwiu1Esg/XBQhRHUGUy
	DW7UYgCB7zVc7GOzVh2cX9KKabu2FzBpOXCvr8qJSW7G0ghjjW/lOAmibkzsZhxe
	gj5xVWnQDW9VFildui4acDzaY/aJVjOG+sA==
X-ME-Sender: <xms:d6IlZy6enDCctfdZN5djBmryyeqCjRRhpLCAY0NiLHmfA67hBUwThA>
    <xme:d6IlZ77JKmfqRtQZd0p85liL7TthrqPCb0d_4jn_AXJIvSMoPEl7uLGn5g9YGTpdw
    bmYEIRsnQpZTA>
X-ME-Received: <xmr:d6IlZxfyABUKb77OB1NCBBPP0Tlbx-V_hhMwolJKTPmeboaZ3BWAj9Kv8vCOeurTY3zdz27g1JN4ErYFtgi8EbPVrBwKJHr2tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeltddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpedfmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdfuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeekveei
    veekhfeiteevheeukeehudeflefgvedujeekhfffhedutdejgeethedtnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepkedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepugifmhifsegrmhgriihonhdrtghordhu
    khdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtth
    hopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgi
    gvnhhprhhojhgvtghtseihmhihrdgsvgdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtg
    hoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:d6IlZ_Ip_y5ehUJeJS55sF1C9o2w0AOt6B7mCpB15ilx6g3VuGehVg>
    <xmx:d6IlZ2IMsAUmR_y4XO3rX434khFHGQOhCijxlVQ7CLdZgltVuBYfUg>
    <xmx:d6IlZwzuU35WArKQuOJo9_j8DuO4eNkHrIYvjeOC9CKVEtNqKiXcpw>
    <xmx:d6IlZ6K0SH__SabEbni3bvQbqOs1ZS3NvYWoDk0rrJGpEhSub_Ep9Q>
    <xmx:d6IlZ3o_8iOf4zvkOKxxihkC9yk_PJIZAr3_TRuLjhmAKbMudL8VEexC>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 2 Nov 2024 04:54:27 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: "Woodhouse, David" <dwmw@amazon.co.uk>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	"xenproject@ymy.be" <xenproject@ymy.be>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZyWicz8YHqFb3hMz@mail-itl>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <ZxMmOjD7oHuAE7Vb@mail-itl>
 <3663ba26192a78de2090512c912bff8afc852e5c.camel@amazon.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o/IffRyF+aHcQMa3"
Content-Disposition: inline
In-Reply-To: <3663ba26192a78de2090512c912bff8afc852e5c.camel@amazon.co.uk>


--o/IffRyF+aHcQMa3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 2 Nov 2024 04:54:27 +0100
From: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
To: "Woodhouse, David" <dwmw@amazon.co.uk>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>,
	"xenproject@ymy.be" <xenproject@ymy.be>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping

On Mon, Oct 21, 2024 at 11:43:04AM +0000, Woodhouse, David wrote:
> On Sat, 2024-10-19 at 05:23 +0200, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Oct 18, 2024 at 10:08:13AM +0200, Roger Pau Monne wrote:
> > > When using AMD-VI interrupt remapping the vector field in the IO-APIC=
 RTE is
> > > repurposed to contain part of the offset into the remapping table.=C2=
=A0 Previous to
> > > 2ca9fbd739b8 Xen had logic so that the offset into the interrupt rema=
pping
> > > table would match the vector.=C2=A0 Such logic was mandatory for end =
of interrupt to
> > > work, since the vector field (even when not containing a vector) is u=
sed by the
> > > IO-APIC to find for which pin the EOI must be performed.
> > >=20
> > > Introduce a table to store the EOI handlers when using interrupt rema=
pping, so
> > > that the IO-APIC driver can translate pins into EOI handlers without =
having to
> > > read the IO-APIC RTE entry.=C2=A0 Note that to simplify the logic suc=
h table is used
> > > unconditionally when interrupt remapping is enabled, even if strictly=
 it would
> > > only be required for AMD-Vi.
> > >=20
> > > Reported-by: Willi Junga <xenproject@ymy.be>
> > > Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> > > Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of usi=
ng a static mapping')
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > I can confirm it fixes touchpad issue on Framework 13 AMD,
> > it works without ioapic_ack=3Dnew now, thanks!
> > Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
>=20
> Thanks for testing. But... why did this work with the auto-EOI? That
> *should* have had exactly the same problem, surely?=20
>=20
> The problem fixed by this patch is that the directed EOI used the
> actual vector# and *not* the bits that the I/O APIC *thinks* are the
> vector#, which are actually the IRTE index#.
>=20
> But if you let the CPU do its broadcast EOI then surely *that* is going
> to use the actual vector# too, and have precisely the same problem?
>=20
> If you use the code prior to this patch, *without* ioapic_ack=3Dnew (i.e.
> the mode that was failing), what happens if you do this:
>=20
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -595,7 +595,7 @@ void setup_local_APIC(void)
>      /*
>       * Enable directed EOI
>       */
> -    if ( directed_eoi_enabled )
> +    if ( 0 && directed_eoi_enabled )
>      {
>          value |=3D APIC_SPIV_DIRECTED_EOI;
>          apic_printk(APIC_VERBOSE, "Suppress EOI broadcast on CPU#%d\n",
>=20
>=20
> I'm guessing that 'fixes' it too? In which case, it looks like AMD has
> some undocumented hack in between its APIC and I/O APIC to let it
> magically auto-EOI the correct pin somehow?

So, this does _not_ fix the touchpad issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--o/IffRyF+aHcQMa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmclonMACgkQ24/THMrX
1ywUHAf/RZD8T7jOEZVE73t71cOtriKLLTvdVfRFC4tigM61MZiO7+Dc75k0QgVw
yiVuNeA8no2+u2or7CSXvpATNO3sYugL1H9y46xKKwX2x7knhi7/F3dX4elZgJpV
7z7meePIrH8ezOWuZ0kKzgroir+fhA/m8zzmftmaQBIAyKhquCDxFpF509++yJZg
fpVEFy3qYh0iojOG7QOUtmmKqWpY2oBKhEeHIleV6kQOEb1N4e3hr6ZZJgERPJ7r
HGHthw6kM5IPb8Alndv2EXI/R1zxnTHBSB3rzp5rmVrkcQw5lMouKStNFCKP3Vz9
c+8+dmT6FCutZEisGAuZvuaU5LtptQ==
=MFYp
-----END PGP SIGNATURE-----

--o/IffRyF+aHcQMa3--

