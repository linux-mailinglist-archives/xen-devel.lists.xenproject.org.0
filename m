Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C568BB13DF3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 17:11:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061672.1427254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPV7-0001iq-GG; Mon, 28 Jul 2025 15:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061672.1427254; Mon, 28 Jul 2025 15:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugPV7-0001hO-DT; Mon, 28 Jul 2025 15:10:53 +0000
Received: by outflank-mailman (input) for mailman id 1061672;
 Mon, 28 Jul 2025 15:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44Jj=2J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ugPV5-0001g3-J4
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 15:10:51 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b67d549-6bc5-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 17:10:50 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-234f17910d8so39307395ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 08:10:50 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23ffdd8b8b9sm36158485ad.29.2025.07.28.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 08:10:47 -0700 (PDT)
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
X-Inumbo-ID: 0b67d549-6bc5-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753715448; x=1754320248; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44ifbJQ+wok33P/Hi+UxfcTj5GHZHK5snHDnxCW5DTo=;
        b=Jf7TnSnBGCg0t6vLHoEqAFLx/pJM41xegwHM4e1fPApO5Qxy3SLS8sLDrlni7ehXVZ
         pH5+ffroKmycCCXHTt+eywF7dN4LWIHgA/mW2l/JywT60XrADv5R74oveMUVLZugYhIH
         TWpIY0tsWFOBppQwbOrnU89vLxOiUpf5mZz9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753715448; x=1754320248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44ifbJQ+wok33P/Hi+UxfcTj5GHZHK5snHDnxCW5DTo=;
        b=YLGXeylMZr/ZWPtUOSanmMPkXaK1GqquoWdbGW6XS0y1nKYYiTqxwt3RUAc1XePWRl
         ZnOlANNLsFHEd8/QeAgA72wN6C+uZcvkvTqT+tErqqn2NLmDM2vilU5B6cHpiPSvp8oI
         nAIkVIL6wIH4igsMxyK/jNJFwywSNjwZu4mIndLVef5s32zXm+UpQBO6lKoe1I72Bsu1
         zYteg6CnXteIS4+A6xGLxiQTapSFlsKUdohHvM9zphvVobxGvdwbJjYDIXjNBigHnAS+
         /aq0PXl7zXNRBPeIFPCRQ3tIuLk1fUhluAvRiA0ItFsKayZmR9vMcNd33J5nBc7gmv4P
         jOsA==
X-Gm-Message-State: AOJu0YzbarETJ4a9jZwF3ZIZdULhndr8GCyVxErSUC3ag2Z2anjve3bc
	7cEAqBJpaF3LDGka4HvcffqXJhVI3lLjuLNUT1Z+buiHDqQg5wFcfPRqBOEoU7wB9YY=
X-Gm-Gg: ASbGncsDQ3ozWvxQyK1gX1Ntt7/cT6y6/LBFMz1HqY9jMQIwd2vI4xeplcAee91M5uk
	PWTbSGbF/BLB4turkU32xntyDAL0hznUsstaYwGSHPpcNb9ShjOYbAKmIsF6pnDFqqkinR0auk5
	igT23qOntfvBkom3DsasJDLbp/lM2E9F8pE4JAETfv/AbIn4RQ0dxAKoWw6usg4OwQpUxH0ik5V
	ZAAnD3JrSbtNd/hJfmrvH8au+EZhsng+WWDk9bBzzvuqQPFXOwsmXDXcfO7IURYhBC2W4Z2Yjvj
	GV/aCy3NdW+1pl2RupWR7NxZNB1xSwb5cQz2AQ0XbqhMqxbHjxspNsWCtPAZbhsuY4wOZWoQ/Jy
	IBhry5V3ju5QApGGVDY6h0di95SauUlg9ctrsy/lBXAhvR3tlOcbbn0vYPkkMucbnhw==
X-Google-Smtp-Source: AGHT+IH09+PLBO96kSt0Prlmz0f9oecMh8nfOxNuDxaKDOZDghk4qYWC5lg0P06rdHunBaYEcInACQ==
X-Received: by 2002:a17:903:4055:b0:240:2eae:aecb with SMTP id d9443c01a7336-2402eaeb26dmr36553865ad.43.1753715448343;
        Mon, 28 Jul 2025 08:10:48 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:10:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 6/6] vpci: add SR-IOV support for DomUs
Message-ID: <aIeS86j8ZOGVK3fy@macbook.local>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <24ecd4b4877f82304e5fe5a4a6c524cc263c7756.1753450965.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24ecd4b4877f82304e5fe5a4a6c524cc263c7756.1753450965.git.mykyta_poturai@epam.com>

On Fri, Jul 25, 2025 at 02:24:33PM +0000, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> SR-IOV virtual functions have simplified configuration space such as
> Vendor ID is derived from the physical function and Device ID comes
> from SR-IOV extended capability.
> Emulate those, so we can provide VID/DID pair for guests which use PCI
> passthrough for SR-IOV virtual functions.
> 
> Emulate guest BAR register values based on PF BAR values for VFs.
> This allows creating a guest view of the normal BAR registers and emulates
> the size and properties as it is done during PCI device enumeration by
> the guest.
> 
> Note, that VFs ROM BAR is read-only and is all zeros, but VF may provide
> access to the PFs ROM via emulation and is not implemented.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/drivers/vpci/sriov.c | 119 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> index 640430e3e9..bf8d9763c6 100644
> --- a/xen/drivers/vpci/sriov.c
> +++ b/xen/drivers/vpci/sriov.c
> @@ -39,7 +39,8 @@ static int vf_init_bars(const struct pci_dev *vf_pdev)
>      for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
>      {
>          bars[i].addr = physfn_vf_bars[i].addr + vf_idx * physfn_vf_bars[i].size;
> -        bars[i].guest_addr = bars[i].addr;
> +        if ( pf_pdev->domain == vf_pdev->domain || bars[i].guest_addr == 0 )
> +            bars[i].guest_addr = bars[i].addr;

Wouldn't this better be done based on the owner of the device being
the hardware domain?  This seems a bit ad-hoc and not quite obvious.

>          bars[i].size = physfn_vf_bars[i].size;
>          bars[i].type = physfn_vf_bars[i].type;
>          bars[i].prefetchable = physfn_vf_bars[i].prefetchable;
> @@ -166,6 +167,44 @@ static void cf_check control_write(const struct pci_dev *pdev, unsigned int reg,
>      pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +static void cf_check vf_cmd_write(const struct pci_dev *pdev, unsigned int reg,
> +                                  uint32_t cmd, void *data)
> +{
> +    struct vpci_header *header = data;
> +
> +    cmd |= PCI_COMMAND_INTX_DISABLE;
> +
> +    header->guest_cmd = cmd;
> +
> +    /*
> +     * Let Dom0 play with all the bits directly except for the memory
> +     * decoding one. Bits that are not allowed for DomU are already
> +     * handled above and by the rsvdp_mask.
> +     */
> +    if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
> +    {
> +        /*
> +         * Ignore the error. No memory has been added or removed from the p2m
> +         * (because the actual p2m changes are deferred in defer_map) and the
> +         * memory decoding bit has not been changed, so leave everything as-is,
> +         * hoping the guest will realize and try again.
> +         */
> +        map_vf(pdev, cmd);
> +    }
> +    else
> +        pci_conf_write16(pdev->sbdf, reg, cmd);
> +}

This seems to be (mostly) a duplication of the existing cmd_write() in
header.c.  Is there anyway that we could use the same handler and
check for whether the device is a VF for any specific VF handling?

> +
> +static uint32_t cf_check vf_cmd_read(const struct pci_dev *pdev,
> +                                     unsigned int reg, void *data)
> +{
> +    const struct vpci_header *header = data;
> +
> +    return header->guest_cmd;
> +}

This is a verbatim duplicate of guest_cmd_read() in header.c.

> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
> +
>  static int vf_init_header(struct pci_dev *vf_pdev)
>  {
>      const struct pci_dev *pf_pdev;
> @@ -184,6 +223,84 @@ static int vf_init_header(struct pci_dev *vf_pdev)
>      sriov_pos = pci_find_ext_capability(pf_pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
>      ctrl = pci_conf_read16(pf_pdev->sbdf, sriov_pos + PCI_SRIOV_CTRL);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    if ( pf_pdev->domain != vf_pdev->domain )
> +    {
> +        uint16_t vid = pci_conf_read16(pf_pdev->sbdf, PCI_VENDOR_ID);
> +        uint16_t did = pci_conf_read16(pf_pdev->sbdf,
> +                                       sriov_pos + PCI_SRIOV_VF_DID);
> +        struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +        unsigned int i;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_VENDOR_ID, 2, (void *)(uintptr_t)vid);
> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_DEVICE_ID, 2, (void *)(uintptr_t)did);
> +        if ( rc )
> +            return rc;
> +
> +        /* Hardcode multi-function device bit to 0 */
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                               PCI_HEADER_TYPE, 1,
> +                               (void *)PCI_HEADER_TYPE_NORMAL);
> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_add_register(vf_pdev->vpci, vpci_hw_read32, NULL,
> +                               PCI_CLASS_REVISION, 4, NULL);
> +        if ( rc )
> +            return rc;
> +
> +        /* VF ROZ is covered by ro_mask */
> +        rc = vpci_add_register_mask(vf_pdev->vpci, vf_cmd_read, vf_cmd_write,
> +                                    PCI_COMMAND, 2, &vf_pdev->vpci->header,
> +                                    PCI_COMMAND_IO | PCI_COMMAND_SPECIAL |
> +                                    PCI_COMMAND_INVALIDATE |
> +                                    PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_WAIT |
> +                                    PCI_COMMAND_FAST_BACK,
> +                                    0,
> +                                    PCI_COMMAND_RSVDP_MASK |
> +                                    PCI_COMMAND_PARITY | PCI_COMMAND_SERR,
> +                                    0);
> +        if ( rc )
> +            return rc;
> +
> +        rc = vpci_init_capability_list(vf_pdev);
> +        if ( rc )
> +            return rc;
> +
> +        for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +        {
> +            switch ( pf_pdev->vpci->sriov->vf_bars[i].type )
> +            {
> +            case VPCI_BAR_MEM32:
> +            case VPCI_BAR_MEM64_LO:
> +            case VPCI_BAR_MEM64_HI:
> +                rc = vpci_add_register(vf_pdev->vpci, vpci_guest_mem_bar_read,
> +                                       vpci_guest_mem_bar_write,
> +                                       PCI_BASE_ADDRESS_0 + i * 4, 4, &bars[i]);
> +                if ( rc )
> +                    return rc;
> +                break;
> +            default:
> +                rc = vpci_add_register(vf_pdev->vpci, vpci_read_val, NULL,
> +                                       PCI_BASE_ADDRESS_0 + i * 4, 4,
> +                                       (void *)0);
> +                if ( rc )
> +                    return rc;
> +                break;
> +            }
> +        }
> +
> +        rc = vf_init_bars(vf_pdev);
> +        if ( rc )
> +            return rc;
> +    }
> +#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */

I think it would be better if the code in sr-iov.c would only deal
with accesses to the SR-IOV capability (so the hardware domain), while
the code to handle SR-IOV VFs was directly added to header.c.

Otherwise the work here will collide from the series by Jiqian that
attempts to clean up the mediation of capabilities done in vPCI:

https://lore.kernel.org/xen-devel/20250728050401.329510-1-Jiqian.Chen@amd.com/

Specifically see patch #2:

https://lore.kernel.org/xen-devel/20250728050401.329510-3-Jiqian.Chen@amd.com/

Which introduces vpci_init_capabilities(), and makes vPCI capability
initialization tied to the PCI device having the capability present.

Thanks, Roger.

