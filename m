Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B1234A900
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101837.195045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmro-0001SW-A8; Fri, 26 Mar 2021 13:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101837.195045; Fri, 26 Mar 2021 13:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmro-0001S7-6M; Fri, 26 Mar 2021 13:51:12 +0000
Received: by outflank-mailman (input) for mailman id 101837;
 Fri, 26 Mar 2021 13:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqr=IY=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1lPmrm-0001S2-PF
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:51:10 +0000
Received: from sender4-of-o53.zoho.com (unknown [136.143.188.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de396abe-a277-4c66-8e06-ce80e09f5c1e;
 Fri, 26 Mar 2021 13:51:09 +0000 (UTC)
Received: from [10.137.0.21] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1616766661875659.6343008552868;
 Fri, 26 Mar 2021 06:51:01 -0700 (PDT)
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
X-Inumbo-ID: de396abe-a277-4c66-8e06-ce80e09f5c1e
ARC-Seal: i=1; a=rsa-sha256; t=1616766664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UdHTAZ0UgXkvGCUiUyuFfIETpcgy//DTcvM5MnJC4f4m81ocpugqWgLSgDppspRZcnC1be+j9nO+gHEWMxJeRvMGXlUurniRxpei3oUlcHj/VXeu/p4y01vDB/EfOTOd3lC4RTcBmTbk/ZCa+Tuj/EjZGUedzzAk+5MXeyWgoJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1616766664; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7A6f+DxGKA3HdcXnWePE17ILeHLrWnaFVON/gkQQzh0=; 
	b=Q40eIlU84Nau8K6ZsP2jlB3H7rVIAurP0q6nMVVjke0beCXe0pgOAm+LD7xvu+BROaxLl+/Mq94g8VlRL0jhUtE37Mvsw13TPT5eoQ6HxUfsuM+ImsOnTf0wnwVTDI/p4KXYBqd99DI+0IddeW2pbOKuaUz9OtSzK3gwhTJAPtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616766664;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=7A6f+DxGKA3HdcXnWePE17ILeHLrWnaFVON/gkQQzh0=;
	b=IkvnlTaBkhtbg3LMl7lv+TIbe3eqKR8JK3lhRffAtalaDJdu80yLWcbUcoYYSP15
	gMPUfZEWFstCkuPx83yS8AFkwlF/YkY5yXCm8SLthhcWGR4Itp31JstEk2riTLsVGkO
	G0zq9/9Gx5Y6mDswUkA+dRvOv3jMT64VJtHmAeS4=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Message-ID: <d42deaf6-e84e-1ae6-b263-075e5478376c@qubes-os.org>
Date: Fri, 26 Mar 2021 14:50:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325172132.14980-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CpeHFbyDZALDuakzqjMf5J0aw9CVkvBG8"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CpeHFbyDZALDuakzqjMf5J0aw9CVkvBG8
Content-Type: multipart/mixed; boundary="AcoBcncXtEYGzsjjebvs4QQfNZd84yJuu";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <d42deaf6-e84e-1ae6-b263-075e5478376c@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
In-Reply-To: <20210325172132.14980-1-andrew.cooper3@citrix.com>

--AcoBcncXtEYGzsjjebvs4QQfNZd84yJuu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi,
I confirm your patch makes my Ryzen 7 1800X platform working again! To do=
uble check that I've not messed up with xen.gz on my /boot, adding hpet=3D=
legacy-replacement makes my computer reboot as the original issue.

I hope this will hit stable release! Thank you for that!

Best,
Fr=C3=A9d=C3=A9ric

Le 3/25/21 =C3=A0 6:21 PM, Andrew Cooper a =C3=A9crit=C2=A0:
> From: Jan Beulich <jbeulich@suse.com>
>=20
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPR=
C
> static PIT clock gating") was reported to cause boot failures on certai=
n
> AMD Ryzen systems.
>=20
> Refine the fix to do nothing in the default case, and only attempt to
> configure legacy replacement mode if IRQ0 is found to not be working.
>=20
> In addition, introduce a "hpet" command line option so this heuristic
> can be overridden.  Since it makes little sense to introduce just
> "hpet=3Dlegacy-replacement", also allow for a boolean argument as well =
as
> "broadcast" to replace the separate "hpetbroadcast" option.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Fr=C3=A9d=C3=A9ric Pierret <frederic.pierret@qubes-os.org>
>=20
> v2:
>   * Drop missing hunk from Jan's original patch.
>=20
> For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
> ---
>   docs/misc/xen-command-line.pandoc | 33 +++++++++++++++++++++++++++
>   xen/arch/x86/hpet.c               | 48 +++++++++++++++++++++++++-----=
---------
>   xen/arch/x86/io_apic.c            | 26 +++++++++++++++++++++
>   xen/include/asm-x86/hpet.h        |  1 +
>   4 files changed, 91 insertions(+), 17 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> index a0601ff838..4d020d4ad7 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for =
more information.
>   When the hmp-unsafe option is disabled (default), CPUs that are not
>   identical to the boot CPU will be parked and not used by Xen.
>  =20
> +### hpet (x86)
> +    =3D List of [ <bool> | broadcast=3D<bool> | legacy-replacement=3D<=
bool> ]
> +
> +    Applicability: x86
> +
> +Controls Xen's use of the system's High Precision Event Timer.  By def=
ault,
> +Xen will use an HPET when available and not subject to errata.  Use of=
 the
> +HPET can be disabled by specifying `hpet=3D0`.
> +
> + * The `broadcast` boolean is disabled by default, but forces Xen to k=
eep
> +   using the broadcast for CPUs in deep C-states even when an RTC inte=
rrupt is
> +   enabled.  This then also affects raising of the RTC interrupt.
> +
> + * The `legacy-replacement` boolean allows for control over whether Le=
gacy
> +   Replacement mode is enabled.
> +
> +   Legacy Replacement mode is intended for hardware which does not hav=
e an
> +   8025 PIT, and allows the HPET to be configured into a compatible mo=
de.
> +   Intel chipsets from Skylake/ApolloLake onwards can turn the PIT off=
 for
> +   power saving reasons, and there is no platform-agnostic mechanism f=
or
> +   discovering this.
> +
> +   By default, Xen will not change hardware configuration, unless the =
PIT
> +   appears to be absent, at which point Xen will try to enable Legacy
> +   Replacement mode before falling back to pre-IO-APIC interrupt routi=
ng
> +   options.
> +
> +   This behaviour can be inhibited by specifying `legacy-replacement=3D=
0`.
> +   Alternatively, this mode can be enabled unconditionally (if availab=
le) by
> +   specifying `legacy-replacement=3D1`.
> +
>   ### hpetbroadcast (x86)
>   > `=3D <boolean>`
>  =20
> +Deprecated alternative of `hpet=3Dbroadcast`.
> +
>   ### hvm_debug (x86)
>   > `=3D <integer>`
>  =20
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index c73135bb15..957e053a47 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -52,6 +52,8 @@ static unsigned int __read_mostly num_hpets_used;
>   DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
>  =20
>   unsigned long __initdata hpet_address;
> +int8_t __initdata opt_hpet_legacy_replacement =3D -1;
> +static bool __initdata opt_hpet =3D true;
>   u8 __initdata hpet_blockid;
>   u8 __initdata hpet_flags;
>  =20
> @@ -63,6 +65,32 @@ u8 __initdata hpet_flags;
>   static bool __initdata force_hpet_broadcast;
>   boolean_param("hpetbroadcast", force_hpet_broadcast);
>  =20
> +static int __init parse_hpet_param(const char *s)
> +{
> +    const char *ss;
> +    int val, rc =3D 0;
> +
> +    do {
> +        ss =3D strchr(s, ',');
> +        if ( !ss )
> +            ss =3D strchr(s, '\0');
> +
> +        if ( (val =3D parse_bool(s, ss)) >=3D 0 )
> +            opt_hpet =3D val;
> +        else if ( (val =3D parse_boolean("broadcast", s, ss)) >=3D 0 )=

> +            force_hpet_broadcast =3D val;
> +        else if ( (val =3D parse_boolean("legacy-replacement", s, ss))=
 >=3D 0 )
> +            opt_hpet_legacy_replacement =3D val;
> +        else
> +            rc =3D -EINVAL;
> +
> +        s =3D ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("hpet", parse_hpet_param);
> +
>   /*
>    * Calculate a multiplication factor for scaled math, which is used t=
o convert
>    * nanoseconds based values to clock ticks:
> @@ -820,12 +848,9 @@ u64 __init hpet_setup(void)
>       unsigned int hpet_id, hpet_period;
>       unsigned int last, rem;
>  =20
> -    if ( hpet_rate )
> +    if ( hpet_rate || !hpet_address || !opt_hpet )
>           return hpet_rate;
>  =20
> -    if ( hpet_address =3D=3D 0 )
> -        return 0;
> -
>       set_fixmap_nocache(FIX_HPET_BASE, hpet_address);
>  =20
>       hpet_id =3D hpet_read32(HPET_ID);
> @@ -852,19 +877,8 @@ u64 __init hpet_setup(void)
>       if ( (rem * 2) > hpet_period )
>           hpet_rate++;
>  =20
> -    /*
> -     * Intel chipsets from Skylake/ApolloLake onwards can statically c=
lock
> -     * gate the 8259 PIT.  This option is enabled by default in slight=
ly later
> -     * systems, as turning the PIT off is a prerequisite to entering t=
he C11
> -     * power saving state.
> -     *
> -     * Xen currently depends on the legacy timer interrupt being activ=
e while
> -     * IRQ routing is configured.
> -     *
> -     * Reconfigure the HPET into legacy mode to re-establish the timer=

> -     * interrupt.
> -     */
> -    hpet_enable_legacy_replacement_mode();
> +    if ( opt_hpet_legacy_replacement > 0 )
> +        hpet_enable_legacy_replacement_mode();
>  =20
>       return hpet_rate;
>   }
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e93265f379..f08c60d71f 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -29,6 +29,8 @@
>   #include <xen/acpi.h>
>   #include <xen/keyhandler.h>
>   #include <xen/softirq.h>
> +
> +#include <asm/hpet.h>
>   #include <asm/mc146818rtc.h>
>   #include <asm/smp.h>
>   #include <asm/desc.h>
> @@ -1922,14 +1924,38 @@ static void __init check_timer(void)
>              vector, apic1, pin1, apic2, pin2);
>  =20
>       if (pin1 !=3D -1) {
> +        bool hpet_changed =3D false;
> +
>           /*
>            * Ok, does IRQ0 through the IOAPIC work?
>            */
>           unmask_IO_APIC_irq(irq_to_desc(0));
> +    retry_ioapic_pin:
>           if (timer_irq_works()) {
>               local_irq_restore(flags);
>               return;
>           }
> +
> +        /*
> +         * Intel chipsets from Skylake/ApolloLake onwards can statical=
ly clock
> +         * gate the 8259 PIT.  This option is enabled by default in sl=
ightly
> +         * later systems, as turning the PIT off is a prerequisite to =
entering
> +         * the C11 power saving state.
> +         *
> +         * Xen currently depends on the legacy timer interrupt being a=
ctive
> +         * while IRQ routing is configured.
> +         *
> +         * If the user hasn't made an explicit option, attempt to reco=
nfigure
> +         * the HPET into legacy mode to re-establish the timer interru=
pt.
> +         */
> +        if ( opt_hpet_legacy_replacement < 0 &&
> +             !hpet_changed && hpet_enable_legacy_replacement_mode() )
> +        {
> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Leg=
acy Replacement Mode\n");
> +            hpet_changed =3D true;
> +            goto retry_ioapic_pin;
> +        }
> +
>           clear_IO_APIC_pin(apic1, pin1);
>           printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "=

>                  "IO-APIC\n");
> diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
> index 50176de3d2..07bc8d6079 100644
> --- a/xen/include/asm-x86/hpet.h
> +++ b/xen/include/asm-x86/hpet.h
> @@ -53,6 +53,7 @@
>   extern unsigned long hpet_address;
>   extern u8 hpet_blockid;
>   extern u8 hpet_flags;
> +extern int8_t opt_hpet_legacy_replacement;
>  =20
>   /*
>    * Detect and initialise HPET hardware: return counter update frequen=
cy.
>=20


--AcoBcncXtEYGzsjjebvs4QQfNZd84yJuu--

--CpeHFbyDZALDuakzqjMf5J0aw9CVkvBG8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAmBd9NAACgkQSEAQtc3F
duIVjw/8D0+aZ39Y7iuWzlPayk73WuEFRzXkNSPxxzCjj6DPG4xFiHvrY+WtJ0Nt
7arlLFkSml2IQIkTgf4L9CQrtphFdfS3AJ5QoNlrAFQUaTkWrTBfUv3tg03bh8Ao
RuoCOOuCi2TQJUPjP1av5P/ETaiF3YVesT51NQjP8Fco9KWqss+Nc6BcgzvwX+cj
Kz9nVMZGVvKxPMM/Ypc64xCVpDpJetmeC8F0UGGFaCP3ARGIs2O3RrMtPSPHH6nv
KXhRln62r06s6WSfTgqLDLn+9y5A85qlsdAaO5A9RhUrwXENL12G2gkSp+S43lQE
19IPRn9nfLjUJUi2W39CH6NcL4YbgqySEjJ7hj8gjmB2tUMbV0fxMZ145ugbaxWE
e6jUWmvCreiKwKqNctRz+jmLROXsYpjTQfjPJC+4aCKS6IfRtLvkcwMtDo4oq9Po
C/bgdAUGPBJxfxZyZwp7Qn107HTe+6BUP6J8bQuPOv/SJu7dAbGsw221kcCB4SoI
fgFpgEYXbMGIGl863ROsf1IFRmrdccfUV1dLLVTzGArYwI2iQUshuR5sQ0FLMU36
/dLbB85VKvI0OwkwoV2fuQwuxMqprPomVfo0j7HSFgFDjRCln5ooAUstw9BmOMfz
4XwnGn8UTsnQiPWm9yXyP0RbtDTMyhKhepzmOI9Y/+cPKfL+Uy4=
=2qOX
-----END PGP SIGNATURE-----

--CpeHFbyDZALDuakzqjMf5J0aw9CVkvBG8--

