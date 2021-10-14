Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397D42E4E0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 01:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209626.366137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbARu-00056I-I1; Thu, 14 Oct 2021 23:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209626.366137; Thu, 14 Oct 2021 23:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbARu-00053g-EI; Thu, 14 Oct 2021 23:47:46 +0000
Received: by outflank-mailman (input) for mailman id 209626;
 Thu, 14 Oct 2021 23:47:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGop=PC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mbARt-00053a-9U
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 23:47:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca75063f-9c2b-4c31-9e9c-3406885dba09;
 Thu, 14 Oct 2021 23:47:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0382460FDA;
 Thu, 14 Oct 2021 23:47:42 +0000 (UTC)
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
X-Inumbo-ID: ca75063f-9c2b-4c31-9e9c-3406885dba09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634255263;
	bh=Zc5v0CCY2XBkmc+G5mLnF8FCEl7IEblL6r3/QCRBbu8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LCiZYh9/N5ykOZwrw0qx4tuaPKx/ujlFPF7s9J1nP0InechSd5LxGs2Qui12mrU3G
	 mFTjprYi01X6GY2fQf0pC9+9K+49sJXl/An4slgipkLwxAY66F4/nF8YeCyIHD1/ts
	 QdEmyG/fBIRKHTL+SV1Whp3R7PVD7WkiXzs03ZGZ/8b7cCD4ekHOuFHDhz+ES+g+30
	 LH0j9Sa7LKeDZNWQNtMDRqQmLoyk76wuy5AqBIwOzW1C//6v9Z6qK7gVXQEy75nSY1
	 FOHGmikg/P9VGFulux/jNGbG8i6HmxMChXySTdm7LqnyFl9TDHFLskDjElpHSwIfjs
	 EzLiC33r3MF+g==
Date: Thu, 14 Oct 2021 16:47:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, 
    Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
In-Reply-To: <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2110141306290.9408@sstabellini-ThinkPad-T480s>
References: <cover.1634221830.git.bertrand.marquis@arm.com> <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-474416638-1634242050=:9408"
Content-ID: <alpine.DEB.2.21.2110141314360.9408@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-474416638-1634242050=:9408
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110141314361.9408@sstabellini-ThinkPad-T480s>

On Thu, 14 Oct 2021, Bertrand Marquis wrote:
> PCI standard is using ECAM and not MCFG which is coming from ACPI[1].
> Use ECAM/ecam instead of MCFG in common code and in new functions added
> in common vpci code by this patch.
> 
> Rename vpci_access_allowed to vpci_ecam_access_allowed and move it
> from arch/x86/hvm/io.c to drivers/vpci/vpci.c.
> 
> Create vpci_ecam_mmio_{read,write} in drivers/vpci/vpci.c that
> contains the common code to perform these operations, changed
> vpci_mmcfg_{read,write} accordingly to make use of these functions.
> 
> The vpci_ecam_mmio_{read,write} functions are returning 0 on error and 1
> on success. As the x86 code was previously always returning X86EMUL_OKAY
> the return code is ignored. A comment has been added in the code to show
> that this is intentional.
>
> Those functions will be used in a following patch inside by arm vpci
> implementation.
> 
> Rename MMCFG_SBDF to ECAM_SBDF.
> 
> Not functional change intended with this patch.
> 
> [1] https://wiki.osdev.org/PCI_Express
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Everything checks out:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


FYI I like the new naming scheme and I think it is the right one for us
to use, but either way for me it wouldn't be a blocker for acceptance.


> ---
> Changes in v6: Patch added
> ---
>  xen/arch/x86/hvm/io.c     | 50 +++++---------------------------
>  xen/drivers/vpci/vpci.c   | 60 +++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/pci.h |  2 +-
>  xen/include/xen/vpci.h    | 10 +++++++
>  4 files changed, 78 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index 046a8eb4ed..340b8c8b0e 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -260,20 +260,6 @@ unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
>      return CF8_ADDR_LO(cf8) | (addr & 3);
>  }
>  
> -/* Do some sanity checks. */
> -static bool vpci_access_allowed(unsigned int reg, unsigned int len)
> -{
> -    /* Check access size. */
> -    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> -        return false;
> -
> -    /* Check that access is size aligned. */
> -    if ( (reg & (len - 1)) )
> -        return false;
> -
> -    return true;
> -}
> -
>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
>  static bool vpci_portio_accept(const struct hvm_io_handler *handler,
>                                 const ioreq_t *p)
> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      *data = vpci_read(sbdf, reg, size);
> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io_handler *handler,
>  
>      reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
>  
> -    if ( !vpci_access_allowed(reg, size) )
> +    if ( !vpci_ecam_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
>  
>      vpci_write(sbdf, reg, size, data);
> @@ -394,7 +380,7 @@ static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
>                                             paddr_t addr, pci_sbdf_t *sbdf)
>  {
>      addr -= mmcfg->addr;
> -    sbdf->bdf = MMCFG_BDF(addr);
> +    sbdf->bdf = ECAM_BDF(addr);
>      sbdf->bus += mmcfg->start_bus;
>      sbdf->seg = mmcfg->segment;
>  
> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    /*
> -     * According to the PCIe 3.1A specification:
> -     *  - Configuration Reads and Writes must usually be DWORD or smaller
> -     *    in size.
> -     *  - Because Root Complex implementations are not required to support
> -     *    accesses to a RCRB that cross DW boundaries [...] software
> -     *    should take care not to cause the generation of such accesses
> -     *    when accessing a RCRB unless the Root Complex will support the
> -     *    access.
> -     *  Xen however supports 8byte accesses by splitting them into two
> -     *  4byte accesses.
> -     */
> -    *data = vpci_read(sbdf, reg, min(4u, len));
> -    if ( len == 8 )
> -        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +    /* Ignore return code */
> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
>  
>      return X86EMUL_OKAY;
>  }
> @@ -476,13 +445,8 @@ static int vpci_mmcfg_write(struct vcpu *v, unsigned long addr,
>      reg = vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>      read_unlock(&d->arch.hvm.mmcfg_lock);
>  
> -    if ( !vpci_access_allowed(reg, len) ||
> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> -        return X86EMUL_OKAY;
> -
> -    vpci_write(sbdf, reg, min(4u, len), data);
> -    if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +    /* Ignore return code */
> +    vpci_ecam_mmio_write(sbdf, reg, len, data);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc..c0853176d7 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -478,6 +478,66 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>      spin_unlock(&pdev->vpci->lock);
>  }
>  
> +/* Helper function to check an access size and alignment on vpci space. */
> +bool vpci_ecam_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /*
> +     * Check access size.
> +     *
> +     * On arm32 or for 32bit guests on arm, 64bit accesses should be forbidden
> +     * but as for those platform ISV register, which gives the access size,
> +     * cannot have a value 3, checking this would just harden the code.
> +     */
> +    if ( len != 1 && len != 2 && len != 4 && len != 8 )
> +        return false;
> +
> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )
> +        return false;
> +
> +    return true;
> +}
> +
> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                         unsigned long data)
> +{
> +    if ( !vpci_ecam_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return 0;
> +
> +    vpci_write(sbdf, reg, min(4u, len), data);
> +    if ( len == 8 )
> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +
> +    return 1;
> +}
> +
> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                        unsigned long *data)
> +{
> +    if ( !vpci_ecam_access_allowed(reg, len) ||
> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
> +        return 0;
> +
> +    /*
> +     * According to the PCIe 3.1A specification:
> +     *  - Configuration Reads and Writes must usually be DWORD or smaller
> +     *    in size.
> +     *  - Because Root Complex implementations are not required to support
> +     *    accesses to a RCRB that cross DW boundaries [...] software
> +     *    should take care not to cause the generation of such accesses
> +     *    when accessing a RCRB unless the Root Complex will support the
> +     *    access.
> +     *  Xen however supports 8byte accesses by splitting them into two
> +     *  4byte accesses.
> +     */
> +    *data = vpci_read(sbdf, reg, min(4u, len));
> +    if ( len == 8 )
> +        *data |= (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
> +
> +    return 1;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index edd7c3e71a..a0df5c1279 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,7 +6,7 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
> +#define ECAM_BDF(addr)   ( ((addr) & 0x0ffff000) >> 12)
>  
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 9f5b5d52e1..4a0c3d77c9 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -208,6 +208,16 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
>  {
>      return entry - msix->entries;
>  }
> +
> +/* ECAM mmio read/write helpers */
> +bool vpci_ecam_access_allowed(unsigned int reg, unsigned int len);
> +
> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                         unsigned long data);
> +
> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
> +                        unsigned long *data);
> +
>  #endif /* __XEN__ */
>  
>  #else /* !CONFIG_HAS_VPCI */
> -- 
> 2.25.1
> 
> 
--8323329-474416638-1634242050=:9408--

