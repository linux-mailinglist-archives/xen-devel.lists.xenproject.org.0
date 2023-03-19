Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9226C047D
	for <lists+xen-devel@lfdr.de>; Sun, 19 Mar 2023 20:43:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511665.790774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdyvU-0002zc-Ew; Sun, 19 Mar 2023 19:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511665.790774; Sun, 19 Mar 2023 19:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdyvU-0002wj-C0; Sun, 19 Mar 2023 19:42:44 +0000
Received: by outflank-mailman (input) for mailman id 511665;
 Sun, 19 Mar 2023 19:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u/8N=7L=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1pdyvS-0002wb-Km
 for xen-devel@lists.xenproject.org; Sun, 19 Mar 2023 19:42:42 +0000
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3586731c-c68e-11ed-b464-930f4c7d94ae;
 Sun, 19 Mar 2023 20:42:40 +0100 (CET)
Received: from [92.76.123.191] ([92.76.123.191]) by web-mail.web.de
 (3c-app-webde-bap20.server.lan [172.19.172.20]) (via HTTP); Sun, 19 Mar
 2023 20:42:39 +0100
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
X-Inumbo-ID: 3586731c-c68e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679254959; i=tachyon_gun@web.de;
	bh=94B7CdiTUUVJfc+ipRfB4eoJx93QM1i/2u9OB+TS8dY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RJPJF8MIJnyEQ3AgT/Y5Dl+OTFtlGcc0HvXa1U1tgOd5MazmfImsgggE5ACqwjJaB
	 afosdHa+unLNQY62rV1SGZk2IgXYP4etxEcFmoaBaDfbiOBU38zxlRZiOY4rfJC3Pv
	 JZdbjFzKMWlmfRMjpkx/RAWf4N90+J8VgsyuN2CzUt6SgxdP91KY31flvDB65YvMTv
	 mW8osA94Ekn8UHhdeFD2tBpG9If4PcDWUGM9M3LUj4gk1FuA6TgjbOWwGlez4nu0CJ
	 nhdZIQ2+2/Ryp4+1D6qZUyQyaP3QczUmZSCzEzzrPOrMoOOSgSqVRkL96WlFxcnLFx
	 6WUXAhyiRdF6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-bdb54283-3ac1-4ba4-b590-dd3e056b3ccb-1679254959573@3c-app-webde-bap20>
From: Denis <tachyon_gun@web.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Mar 2023 20:42:39 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <77bcbd53-beb6-6fd0-d272-f0c9e2f95605@suse.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <77bcbd53-beb6-6fd0-d272-f0c9e2f95605@suse.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:hE5F7Y/ueq1AtmKvspOKqA+Jn850ccie6sOPN6d24Dpab1Ja04XAgKb3ZP6PViYz+4Jfc
 H6LQoZx0XKECfRk2ptzvZOKW4aUNNlYg+h1+MlAmoj9v156I33CMKLP2WuNv5Lb77VgZZwBz6VQw
 ylj1yPAjd5Iy/61jfgdhansopSkch0NmQyZYlAtHfI1aB7FNoIggCLqVf7vxE6xlMIXrl1ca6pDr
 nkBXM8no8CbdoNY9cHzSb8zoQCdVdsHZr5W2abdt7P6DiOOoCfWDQIRqrFVhC8semsU0NpCDzcWz
 fo=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qvvgKrfHDYY=;R8VSZoLY8WkNv79B3dXBWP0ynKX
 oHbcsBTsOKWBoB06NxiLWj2gQZ+kg/5CVS719ArnaRG0ZZTauVLZCMLH6HCgcT92xg42yKB62
 HC3IVwMi+jtwctR3H57/C6QKMGLpChGcVzFUVtK8kS1mNoM32yA61Tu7Sf4rrZHEmavb/8VKy
 d7ppEK8zTVyphxED1MohBGLqaKmsc9h8EjcFhjz1+3atCzJvsuQL66BcAJEuIsvmJFnzojtFo
 Kn05vSe55WJvNdSSEaY+TtYigJZCCA4OMVzilDrWefI/SHhv9twu3U88n5hKCI5IEqzqF0INn
 VoopBqvXDVEw6HP5GTtujuTyz8N+KZfPC8UQGZNTP0I1x+Fid2LwwCfcNvC9iwGN10zDwG67r
 pcL1CjfFnEznRGnN4tFLqYlAIGy0D/iAiJeOMY9LWpZL67ZNrL/A09EiLjzwzT2VlkUEPfttE
 wUxu21hF92FIsweMHfIxvx2zWRLGFF7OElINot2TJWguciDi3OyZnwcOjrqwmVYoh/GLBO9xx
 sv2ITbqRn1+Byz5P7BwYeuvXUze5RmTr6VnETstGmlHBDLXr5G6tPk6Gag8AyTGKE84toOUjK
 b43mazNHiUoLjqCkMc1BxzWUb6ut+aRqs+xASLWSMZ7x9YV665nEYulEaH7KyF6n/LUGShs2H
 Ab2JJUrLsx7Wsu9yNPrYCDGGWWt0rfZ2ypzBnMnQTJ4FofkuFKks77M/40YbiNb33WPjI0o9B
 7+6ZSE86V3BBDcEqt10PKhZRQFW0VurkUBK+eChgr7jeMdR4ZbzUlZ/+RG9igWDk3DL98yxAZ
 6FZZjGNOgMcLQJJY2xWWLD43iHslg8NUpO55jWvh3IzwU=

On 16=2E03=2E2023 16:59, Jan Beulich wrote:
> On 14=2E03=2E2023 16:11, Andrew Cooper wrote:
> > On 14/03/2023 2:53 pm, Denis wrote:
> >> On 14=2E03=2E2023 07:37; Jan Beulich wrote:
> >>> On 14=2E03=2E2023 02:15, Denis wrote:
> >>>> On 13=2E03=2E2023 10:36, Jan wrote
> >>>>> On 10=2E03=2E2023 21:50, Denis wrote:
> >>>>>> Should I test something else?
> >>>>> =2E=2E=2E there was no request for any further testing here, for t=
he moment=2E
> >>>> ah=2E=2E=2Esorry, going by "Would be nice to have this confirmed fo=
rthe system
> >>>> in question, i=2Ee=2E without Xen underneath Linux" I thought I cou=
ld test
> >>>> something which might help shed some light on all of this=2E
> >>> Well, yes, that Linux-without-Xen test would still be useful to have
> >>> results from=2E I didn't account for this in my earlier reply becaus=
e
> >>> I had asked for it before already, and I did take "something else"
> >>> for meaning anything that might have turned up as useful from the ne=
w
> >>> data you had provided=2E
> >> What tests could I do or what info should I provide to help?
> >=20
> > Can you please rebuild Xen with this patch:
> >=20
> > diff --git a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> > b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> > index 2fdebd2d74c9=2E=2E747eae25f56c 100644
> > --- a/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> > +++ b/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> > @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> > acpi_table_header *table)
> > =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_ivrs_header *ivrs_block;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long length;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int apic;
> > -=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D !iommu_intremap;
> > +=C2=A0=C2=A0=C2=A0 bool_t sb_ioapic =3D 1;
> > =C2=A0=C2=A0=C2=A0=C2=A0 int error =3D 0;
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!table);
> >=20
> > which should cause the behaviour to revert back to that of Xen 4=2E0=
=2E1=C2=A0
> > (i=2Ee=2E it will fully ignore the checks relating to the southbridge =
ioapic)=2E
>=20
> Alternatively you may want to try the change below (I think I have now
> convinced myself that the state change is still possible at this point
> in time), with the intended effect of =2E=2E=2E
>=20
> > Confirm that with this, and booting Xen simply with `iommu=3D1` that f=
ull
> > DMA remapping and interrupt remapping is considered active=2E
>=20
> =2E=2E=2E DMA remapping active, but interrupt mapping off (i=2Ee=2E matc=
hing
> Linux behavior), without any overriding command line options=2E
>=20
> Jan
>=20
> AMD/IOMMU: allow DMA remapping to remain enabled when there's no southbr=
idge IO-APIC
>=20
> The original Linux commit that our respective code was derived from
> isn't as heavyhanded as our cloned code: It only disables interrupt
> remapping in such a case=2E Follow that model, noting that it is still
> early enough to turn interrupt remapping off on its own=2E
>=20
> Fixes: 06bbcaf48d09 ("AMD IOMMU: fail if there is no southbridge IO-APIC=
")
> Reported-by: Denis <tachyon_gun@web=2Ede>
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> ---
> Note that the alternative of disabling per-device interrupt remapping
> is undesirable as per XSA-36, yet then again it may still be better than
> turning off interrupt remapping altogether=2E Thoughts?
>=20
> --- unstable=2Eorig/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> +++ unstable/xen/drivers/passthrough/amd/iommu_acpi=2Ec
> @@ -1183,7 +1183,7 @@ static int __init cf_check parse_ivrs_ta
>      if ( !error && !sb_ioapic )
>      {
>          if ( amd_iommu_perdev_intremap )
> -            error =3D -ENXIO;
> +            iommu_intremap =3D iommu_intremap_off;
>          printk("%sNo southbridge IO-APIC found in IVRS table\n",
>                 amd_iommu_perdev_intremap ? XENLOG_ERR : XENLOG_WARNING)=
;
>      }

Thank you=2E

I'll give this a try also and will report back=2E


Denis

