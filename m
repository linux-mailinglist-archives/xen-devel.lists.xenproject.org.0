Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35229C01683
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 15:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149118.1480849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBvOY-0003Mv-9I; Thu, 23 Oct 2025 13:30:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149118.1480849; Thu, 23 Oct 2025 13:30:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBvOY-0003KL-6U; Thu, 23 Oct 2025 13:30:22 +0000
Received: by outflank-mailman (input) for mailman id 1149118;
 Thu, 23 Oct 2025 13:30:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imNL=5A=bounce.vates.tech=bounce-md_30504962.68fa2de5.v1-32ac75dc8df34429bf4e588d5e23033d@srs-se1.protection.inumbo.net>)
 id 1vBvOW-0003KD-RQ
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 13:30:20 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6859c569-b014-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 15:30:15 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4csn2s4g0MzGlt2LG
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 13:30:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 32ac75dc8df34429bf4e588d5e23033d; Thu, 23 Oct 2025 13:30:13 +0000
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
X-Inumbo-ID: 6859c569-b014-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761226213; x=1761496213;
	bh=C3MUkLbc658lXkU5bJ8t2d23wVFkcki+lvsa95Pzq8I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AowSXASw0DzhNfyQBOGPlAeZmgEc0Jp2oG0LLU30576h2P0K/YXF8lcaMItxvKHHt
	 YK7ySbZfE0xwVIGKDtbEroenAYDZ8XZWg6rhbyO6BeL+UgV72HOm58xepeBTxAeMOQ
	 wqQ3USqnMAWrowc7vlGBe+a5ODcSc2YdQmNAK7d4fxvZZkFmUDIJ/+MKqdBcX7IZze
	 a6vPh0EuE0T/uUaaUkNP7LBo19U1/5c+VZ67rT9fj3TLElKpxo+jO1DJDD3NeZsnr4
	 BDq7m02l/jbjSUOpoJTqJd4KPJ7WRNWvu9CqphHYxRz0Tl/eZcRpOg5c5ZOUPN3/aF
	 /FFgkfjsaf2FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761226213; x=1761486713; i=teddy.astie@vates.tech;
	bh=C3MUkLbc658lXkU5bJ8t2d23wVFkcki+lvsa95Pzq8I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EPfbz4Llz4QNUNOm3/+Bxp2vlvStddX00SNmmvDbFsR4xZisAMKic2RyMpuGkQLej
	 KyGjibiSAYPXqpjjO1d8uJuVcaYSZBCsIj9K5382/eKwRtuwesSPqdlLHNQnxqqsnJ
	 7sp4ZfDBa0cr+Fi945WwVVrybsFJdj11FXS0rk7e+PL7YrwSADcRVfHgWN21aZp+TR
	 iFhb43SPawvfASOODiZqULV387s6D9IiCQNGxydGwWYPoR0RMpxw+hs7J4PCoRtpQm
	 E67pHMJFrsYUk1o+YJ1lKvN7T+bw429lJNFFumBcPPKaNwFRMsgrDRT1sD8ZlI4nHB
	 4dnj0zEoFpdCQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2006/12]=20VT-d:=20respect=20ACPI=20SATC's=20ATC=5FREQUIRED=20flag?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761226212719
Message-Id: <61df4103-7969-4f06-ad0f-374c17195653@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com> <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
In-Reply-To: <e98daa41-c6b6-4f4e-b41d-84006011068d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.32ac75dc8df34429bf4e588d5e23033d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 13:30:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/10/2025 =C3=A0 15:14, Jan Beulich a =C3=A9crit=C2=A0:
> When the flag is set, permit Dom0 to control the device (no worse than
> what we had before and in line with other "best effort" behavior we use
> when it comes to Dom0), but suppress passing through to DomU-s unless
> ATS can actually be enabled for such devices (and was explicitly enabled
> on the command line).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Re-base over new earlier patches.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -225,7 +225,11 @@ exceptions (watchdog NMIs and unexpected
>   > Default: `false`
>   
>   Permits Xen to set up and use PCI Address Translation Services.  This i=
s a
> -performance optimisation for PCI Passthrough.
> +performance optimisation for PCI Passthrough.  Note that firmware may in=
dicate
> +that certain devices need to have ATS enabled for proper operation. For =
such
> +devices ATS will be enabled by default, unless the option is used in its
> +negative form.  Such devices will still not be eligible for passing thro=
ugh to
> +guests, unless the option is used in its positive form.
>   
>   **WARNING: Xen cannot currently safely use ATS because of its synchrono=
us wait
>   loops for Queued Invalidation completions.**

Do we want to address the warning before attempting to unconditionnaly 
enable ATS in these scenarios ? A unstable hypervisor is likely worse 
than a non-functionning device to me.

Or at least log a warning that ATS is enabled due to a device requiring it.

> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -253,6 +253,24 @@ struct acpi_atsr_unit *acpi_find_matched
>       return all_ports;
>   }
>   
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev)
> +{
> +    const struct acpi_satc_unit *satc;
> +
> +    list_for_each_entry ( satc, &acpi_satc_units, list )
> +    {
> +        if ( satc->segment !=3D pdev->seg )
> +            continue;
> +
> +        for ( unsigned int i =3D 0; i < satc->scope.devices_cnt; ++i )
> +            if ( satc->scope.devices[i] =3D=3D pdev->sbdf.bdf )
> +                return satc;
> +    }
> +
> +    return NULL;
> +}
> +
>   struct acpi_rhsa_unit *drhd_to_rhsa(const struct acpi_drhd_unit *drhd)
>   {
>       struct acpi_rhsa_unit *rhsa;
> --- a/xen/drivers/passthrough/vtd/dmar.h
> +++ b/xen/drivers/passthrough/vtd/dmar.h
> @@ -112,6 +112,8 @@ struct acpi_satc_unit {
>   
>   struct acpi_drhd_unit *acpi_find_matched_drhd_unit(const struct pci_dev=
 *);
>   struct acpi_atsr_unit *acpi_find_matched_atsr_unit(const struct pci_dev=
 *);
> +const struct acpi_satc_unit *acpi_find_matched_satc_unit(
> +    const struct pci_dev *pdev);
>   
>   #define DMAR_TYPE 1
>   #define RMRR_TYPE 2
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2364,6 +2364,26 @@ static int cf_check intel_iommu_add_devi
>       if ( ret )
>           dprintk(XENLOG_ERR VTDPREFIX, "%pd: context mapping failed\n",
>                   pdev->domain);
> +    else if ( !pdev->broken )
> +    {
> +        const struct acpi_drhd_unit *drhd =3D acpi_find_matched_drhd_uni=
t(pdev);
> +        const struct acpi_satc_unit *satc =3D acpi_find_matched_satc_uni=
t(pdev);
> +
> +        /*
> +         * Prevent the device from getting assigned to an unprivileged d=
omain
> +         * when firmware indicates ATS is required, but ATS could not be=
 enabled
> +         * or was not explicitly enabled via command line option.
> +         */
> +        if ( satc && satc->atc_required &&
> +             (!drhd || ats_device(pdev, drhd) <=3D 0 ||
> +              !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) ||
> +              opt_ats < 0) )
> +        {
> +            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-thr=
ough\n",
> +                   &pdev->sbdf);
> +            pdev->broken =3D true;
> +        }
> +    }

I don't feel pdev->broken is the right way for signaling ineligibility 
for passthrough due to policy (ATS required).
Especially if we eventually consider in the future allowing on a 
per-domain basis the ability to use ATS (starting with Dom0).

>   
>       return ret;
>   }
> @@ -2375,12 +2395,26 @@ static int cf_check intel_iommu_enable_d
>   
>       pci_vtd_quirk(pdev);
>   
> -    if ( ret <=3D 0 )
> -        return ret;
> +    if ( ret <=3D 0 ||
> +         (ret =3D enable_ats_device(pdev, &drhd->iommu->ats_devices)) < =
0 ||
> +         opt_ats < 0 )
> +    {
> +        const struct acpi_satc_unit *satc =3D acpi_find_matched_satc_uni=
t(pdev);
> +
> +        /*
> +         * Besides in error cases also prevent the device from getting a=
ssigned
> +         * to an unprivileged domain when firmware indicates ATS is requ=
ired,
> +         * but ATS use was not explicitly enabled via command line optio=
n.
> +         */
> +        if ( satc && satc->atc_required && !pdev->broken )
> +        {
> +            printk(XENLOG_WARNING "ATS: %pp is not eligible for pass-thr=
ough\n",
> +                   &pdev->sbdf);
> +            pdev->broken =3D true;
> +        }
> +    }
>   
> -    ret =3D enable_ats_device(pdev, &drhd->iommu->ats_devices);
> -
> -    return ret >=3D 0 ? 0 : ret;
> +    return ret <=3D 0 ? ret : 0;
>   }
>   
>   static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev =
*pdev)
> --- a/xen/drivers/passthrough/vtd/x86/ats.c
> +++ b/xen/drivers/passthrough/vtd/x86/ats.c
> @@ -45,8 +45,9 @@ int ats_device(const struct pci_dev *pde
>   {
>       struct acpi_drhd_unit *ats_drhd;
>       unsigned int pos, expfl =3D 0;
> +    const struct acpi_satc_unit *satc;
>   
> -    if ( opt_ats <=3D 0 || !iommu_qinval )
> +    if ( !opt_ats || !iommu_qinval )
>           return 0;
>   
>       if ( !ecap_queued_inval(drhd->iommu->ecap) ||
> @@ -61,6 +62,10 @@ int ats_device(const struct pci_dev *pde
>            !acpi_find_matched_atsr_unit(pdev) )
>           return 0;
>   
> +    satc =3D acpi_find_matched_satc_unit(pdev);
> +    if ( opt_ats < 0 && (!satc || !satc->atc_required) )
> +        return 0;
> +
>       ats_drhd =3D find_ats_dev_drhd(drhd->iommu);
>       pos =3D pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
>   
> 
> 
>



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



