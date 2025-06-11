Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C73AAD5D37
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012006.1390569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPDJ-0007K6-4B; Wed, 11 Jun 2025 17:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012006.1390569; Wed, 11 Jun 2025 17:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPDI-0007Ic-WA; Wed, 11 Jun 2025 17:26:12 +0000
Received: by outflank-mailman (input) for mailman id 1012006;
 Wed, 11 Jun 2025 17:26:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uPPDG-0007IU-R2
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:26:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPPDF-00DsgD-23;
 Wed, 11 Jun 2025 17:26:09 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uPPDF-002vgZ-0s;
 Wed, 11 Jun 2025 17:26:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=TvY8XJCtLseOyo7AdSpTBjkYvZb5kh/DRwYv1c3FU20=; b=yJMZ7x/1fDot2KpB3G2tXo3sff
	oiFLAuCLktUKTGgZJAglj4XPdQvakri6g9cyFhAR7xDsTv1YYsjVFKaBIPB5J7cZdizdS3M1ygz1M
	rdN0uouWA75s3wkRTBGLWkyuW1O8T2KMlzZ1T60T6WEJ73TbThqnmfkot6336jwTDOrc=;
Date: Wed, 11 Jun 2025 19:26:06 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Anthoine Bourgeois <anthoine.bourgeois@vates.tech>
Subject: Re: [PATCH v4] x86/hvmloader: select xenpci MMIO BAR UC or WB MTRR
 cache attribute
Message-ID: <aEm8LuDrNBqjgaWF@l14>
References: <20250610162930.89055-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610162930.89055-1-roger.pau@citrix.com>

On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index c388899306c2..ddbff6fffc16 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-drivers/>.
>  Setting B<xen_platform_pci=0> with the default device_model "qemu-xen"
>  requires at least QEMU 1.6.
>  
> +
> +=item B<xenpci_bar_uc=BOOLEAN>
> +
> +B<x86 only:> Select whether the memory BAR of the Xen PCI device should have
> +uncacheable (UC) cache attribute set in MTRR.

For information, here are different name used for this pci device:

- man xl.cfg:
    xen_platform_pci=<bool>
        Xen platform PCI device
- QEMU:
    -device xen-platform
    in comments: XEN platform pci device
    with pci device-id PCI_DEVICE_ID_XEN_PLATFORM
- EDK2 / OVMF:
    XenIoPci
        described virtual Xen PCI device
        But XenIo is a generic protocol in EDK2
    Before XenIo, the pci device would be linked to XenBus, and
    loaded with PCI_DEVICE_ID_XEN_PLATFORM
- Linux:
    Seems to be called "xen-platform-pci"

Overall, this PCI device is mostly referenced as the Xen Platform PCI
device. So "xenpci" or "Xen PCI device" is surprising to me, and I'm not
quite sure what it is.


> +
> +Default is B<true>.
> +
>  =item B<viridian=[ "GROUP", "GROUP", ...]> or B<viridian=BOOLEAN>
>  
>  The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenments
> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
> index cc67b18c0361..cfd39cc37cdc 100644
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -116,6 +116,8 @@ void pci_setup(void)
>       * experience the memory relocation bug described below.
>       */
>      bool allow_memory_relocate = 1;
> +    /* Select the MTRR cache attribute of the xenpci device BAR. */
> +    bool xenpci_bar_uc = false;

This default value for `xenpci_bar_uc` mean that hvmloader changes
behavior compared to previous version, right? Shouldn't we instead have
hvmloader keep the same behavior unless the toolstack want to use the
new behavior? (Like it's done for `allow_memory_relocate`,
"platform/mmio_hole_size")

It would just mean that toolstack other than `xl` won't be surprised by
a change of behavior.

>      BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=
>                   PCI_COMMAND_IO);
> @@ -130,6 +132,12 @@ void pci_setup(void)
>      printf("Relocating guest memory for lowmem MMIO space %s\n",
>             allow_memory_relocate?"enabled":"disabled");
>  
> +    s = xenstore_read(HVM_XS_XENPCI_BAR_UC, NULL);
> +    if ( s )
> +        xenpci_bar_uc = strtoll(s, NULL, 0);
> +    printf("XenPCI device BAR MTRR cache attribute set to %s\n",
> +           xenpci_bar_uc ? "UC" : "WB");
> +
>      s = xenstore_read("platform/mmio_hole_size", NULL);
>      if ( s )
>          mmio_hole_size = strtoll(s, NULL, 0);
> @@ -271,6 +279,44 @@ void pci_setup(void)
>              if ( bar_sz == 0 )
>                  continue;
>  
> +            if ( !xenpci_bar_uc &&
> +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
> +                 vendor_id == 0x5853 &&
> +                 (device_id == 0x0001 || device_id == 0x0002) )

We don't have defines for 0x5853 in the tree (and those device_id)?
Maybe introduce at least one for the vendor_id:

These two names are use by QEMU, OVMF, Linux, for example.

#define PCI_VENDOR_ID_XEN           0x5853
#define PCI_DEVICE_ID_XEN_PLATFORM  0x0001

There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux


> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index 79c0e6bd4ad2..31b4411db7b4 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -867,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
>          config->table_flags |= ACPI_HAS_HPET;
>  
>      config->pci_start = pci_mem_start;
> -    config->pci_len = pci_mem_end - pci_mem_start;
> +    config->pci_len = RESERVED_MEMBASE - pci_mem_start;
>      if ( pci_hi_mem_end > pci_hi_mem_start )
>      {
>          config->pci_hi_start = pci_hi_mem_start;
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 8bc768b5156c..962fa820faec 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
>          libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
>          libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
> +        libxl_defbool_setdefault(&b_info->u.hvm.xenpci_bar_uc,      true);
>          libxl_defbool_setdefault(&b_info->u.hvm.pirq,               false);
>  
>          libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 4d67b0d28294..60ec0354d19a 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>              goto err;
>      }
>  
> +    if (info->type == LIBXL_DOMAIN_TYPE_HVM &&
> +        libxl_defbool_val(info->u.hvm.xenpci_bar_uc)) {

I think this condition is wrong. You should always write the value of
xenpci_bar_uc into xenstore, or only write it if a value have been
selected. But I guess we already lost the information here about whether
the value is the default or not, and it's probably not important, so I
think you should always write the value.

> +        path = GCSPRINTF("/local/domain/%d/"HVM_XS_XENPCI_BAR_UC, domid);
> +        ret = libxl__xs_printf(gc, XBT_NULL, path, "%d",
> +                               libxl_defbool_val(info->u.hvm.xenpci_bar_uc));
> +        if (ret)
> +            goto err;
> +    }
> +
>      return 0;
>  
>  err:

Thanks,

-- 
Anthony PERARD

