Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E04CFD113
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 11:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196628.1514394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQLb-0006iW-No; Wed, 07 Jan 2026 10:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196628.1514394; Wed, 07 Jan 2026 10:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdQLb-0006h2-KZ; Wed, 07 Jan 2026 10:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1196628;
 Wed, 07 Jan 2026 10:00:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U8cu=7M=bounce.vates.tech=bounce-md_30504962.695e2ed6.v1-2caa85d02d2945c8ac2d970d7dd3ba9a@srs-se1.protection.inumbo.net>)
 id 1vdQLZ-0006gw-MQ
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 10:00:57 +0000
Received: from mail132-4.atl131.mandrillapp.com
 (mail132-4.atl131.mandrillapp.com [198.2.132.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f30afa-ebaf-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 11:00:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-4.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4dmNpG3Msxzlmq2J
 for <xen-devel@lists.xenproject.org>; Wed,  7 Jan 2026 10:00:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2caa85d02d2945c8ac2d970d7dd3ba9a; Wed, 07 Jan 2026 10:00:54 +0000
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
X-Inumbo-ID: c1f30afa-ebaf-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767780054; x=1768050054;
	bh=gGUPo32Yk5+6k/E+Z73kJcwOaII+molcgAUV7+E63N8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=i7gMqUbIsm/65ImmyICGudkrsbJyz+lRlQJ9QLSSst/mdH+sVgfaZNG6WLqDgAj2V
	 BSJCX9UpLS7nhkm7QpPSNhIRBcefCuAtwp9GIV6udphzmHB5s1xVZjLDduFNqHfys4
	 Nps08KyFSMWzsNYHSrfGcUN6T5IZLuBALC2G/ryE/IOoTqapJIPYCqoSDU7ws98NWR
	 aspl4amqQ4+rYXExIVndm0RhmfyVtW8dch8qG6K9EJtPyGr2vKnSRfMCTdx5bECH+h
	 vlbKYDutyhlZrK0xAeKj06fMHRy3gq2O6XunSyZ/B+wf+OReMA/8yFhDE4l9Ce5eeT
	 y7oi3hyh+wzDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767780054; x=1768040554; i=teddy.astie@vates.tech;
	bh=gGUPo32Yk5+6k/E+Z73kJcwOaII+molcgAUV7+E63N8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xk9vM3m9yQ2UAvBkiIi/suGEYp4iaiwe/PAa2yQvnblthel6a3TNLlXF99fHDgLHH
	 Oxyk9EwOibo8aDFDdZVdc+6iJbaioAwZHSyj06GXst8+JxaY6w4nIGAz9W2WpeuONR
	 PXCoL5Gko4g0F0vdGwbKRWOPOuqG1HOY44oBERM+xp+RsW8OetaxJRcAhMxmILtdiX
	 G6ESS309vYnM7MtOdyEY9a0EtqfMyS5QT+tgc9di13rxoKxTuWUjH3K+eNygVTEKWS
	 +Qiz0t48peIaQ9XL9fgHtOQHqiNK8h0dPCa+U22vqbJZ5tFGujFOZb10/ygWfdzofu
	 w3cbmjo8qWEGA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/6]=20PCI:=20determine=20whether=20a=20device=20has=20extended=20config=20space?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767780052556
Message-Id: <dcf7f6f3-f1bd-479b-ac11-24e972f4446a@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stewart Hildebrand" <stewart.hildebrand@amd.com>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com> <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
In-Reply-To: <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2caa85d02d2945c8ac2d970d7dd3ba9a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260107:md
Date: Wed, 07 Jan 2026 10:00:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/01/2026 =C3=A0 14:50, Jan Beulich a =C3=A9crit=C2=A0:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may return all ones or other arbitrary data, e.g. in some cases
> base config space contents repeatedly.
> 
> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> determination of device type; in particular some comments are taken
> verbatim from there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Note that alloc_pdev()'s switch doesn't handle DEV_TYPE_PCI2PCIe_BRIDGE a=
t
> all. Such bridges will therefore not have ->ext_cfg set (which is likely
> wrong). Shouldn't we handle them like DEV_TYPE_LEGACY_PCI_BRIDGE (or
> DEV_TYPE_PCI?) anyway (just like VT-d's set_msi_source_id() does)?
> 
> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
> risky code (as reads may in principle have side effects). Should we gain
> such, too?
> 
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -310,6 +310,41 @@ static void apply_quirks(struct pci_dev
>                * from trying to size the BARs or add handlers to trap acc=
esses.
>                */
>               pdev->ignore_bars =3D true;
> +
> +    if ( pdev->ext_cfg )
> +    {
> +        unsigned int pos;
> +
> +        /*
> +         * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4=
 says
> +         * that when forwarding a type1 configuration request the bridge=
 must
> +         * check that the extended register address field is zero.  The =
bridge
> +         * is not permitted to forward the transactions and must handle =
it as
> +         * an Unsupported Request.  Some bridges do not follow this rule=
 and
> +         * simply drop the extended register bits, resulting in the stan=
dard
> +         * config space being aliased, every 256 bytes across the entire
> +         * configuration space.  Test for this condition by comparing th=
e first
> +         * dword of each potential alias to the vendor/device ID.
> +         * Known offenders:
> +         *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev =
01 & 03)
> +         *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
> +         */
> +        for ( pos =3D PCI_CFG_SPACE_SIZE;
> +              pos < PCI_CFG_SPACE_EXP_SIZE; pos +=3D PCI_CFG_SPACE_SIZE =
)
> +        {
> +            if ( pci_conf_read16(pdev->sbdf, pos) !=3D vendor ||
> +                 pci_conf_read16(pdev->sbdf, pos + 2) !=3D device )
> +                break;
> +        }
> +
> +        if ( pos >=3D PCI_CFG_SPACE_EXP_SIZE )
> +        {
> +            printk(XENLOG_WARNING
> +                   "%pp: extended config space aliases base one\n",
> +                   &pdev->sbdf);
> +            pdev->ext_cfg =3D false;
> +        }
> +    }

Given that it only appears to be the case for PCIe to PCI/PCI-X bridges, 
do we want to check this for all devices ?

>   }
>   
>   static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devf=
n)
> @@ -351,6 +386,8 @@ static struct pci_dev *alloc_pdev(struct
>           unsigned long flags;
>   
>           case DEV_TYPE_PCIe2PCI_BRIDGE:
> +            pdev->ext_cfg =3D true;
> +            fallthrough;
>           case DEV_TYPE_LEGACY_PCI_BRIDGE:
>               sec_bus =3D pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
>               sub_bus =3D pci_conf_read8(pdev->sbdf, PCI_SUBORDINATE_BUS)=
;
> @@ -363,9 +400,19 @@ static struct pci_dev *alloc_pdev(struct
>                   pseg->bus2bridge[sec_bus].devfn =3D devfn;
>               }
>               spin_unlock_irqrestore(&pseg->bus2bridge_lock, flags);
> +
> +            fallthrough;
> +        case DEV_TYPE_PCI:
> +            pos =3D pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
> +            if ( pos &&
> +                 (pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
> +                  (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
> +                pdev->ext_cfg =3D true;
>               break;
>   
>           case DEV_TYPE_PCIe_ENDPOINT:
> +            pdev->ext_cfg =3D true;
> +
>               pos =3D pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
>               BUG_ON(!pos);
>               cap =3D pci_conf_read16(pdev->sbdf, pos + PCI_EXP_DEVCAP);
> @@ -409,9 +456,9 @@ static struct pci_dev *alloc_pdev(struct
>               }
>               break;
>   
> -        case DEV_TYPE_PCI:
>           case DEV_TYPE_PCIe_BRIDGE:
>           case DEV_TYPE_PCI_HOST_BRIDGE:
> +            pdev->ext_cfg =3D true;
>               break;
>   
>           default:
> @@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
>               break;
>       }
>   
> +    if ( pdev->ext_cfg &&
> +         /*
> +          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Expr=
ess
> +          * devices have 4096 bytes.  Even if the device is capable, tha=
t
> +          * doesn't mean we can access it.  Maybe we don't have a way to
> +          * generate extended config space accesses, or the device is be=
hind a
> +          * reverse Express bridge.  So we try reading the dword at
> +          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extende=
d
> +          * capability header.
> +          */
> +         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) =3D=3D 0xffffff=
ffU )
> +        pdev->ext_cfg =3D false;
> +
>       apply_quirks(pdev);
>       check_pdev(pdev);
>   
> @@ -717,6 +777,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>   
>                   list_add(&pdev->vf_list, &pf_pdev->vf_list);
>               }
> +
> +            if ( !pdev->ext_cfg )
> +                printk(XENLOG_WARNING
> +                       "%pp: VF without extended config space?\n",
> +                       &pdev->sbdf);
>           }
>       }
>   
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -126,6 +126,9 @@ struct pci_dev {
>   
>       nodeid_t node; /* NUMA node */
>   
> +    /* Whether the device has extended config space. */
> +    bool ext_cfg;
> +
>       /* Device to be quarantined, don't automatically re-assign to dom0 =
*/
>       bool quarantine;
>   
> 
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



