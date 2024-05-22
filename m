Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 872008CBDD8
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 11:29:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727360.1131847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iHG-0002MI-2L; Wed, 22 May 2024 09:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727360.1131847; Wed, 22 May 2024 09:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iHF-0002Jb-V3; Wed, 22 May 2024 09:28:53 +0000
Received: by outflank-mailman (input) for mailman id 727360;
 Wed, 22 May 2024 09:28:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9ieL=MZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9iHE-0002JV-9S
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 09:28:52 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b271d8b1-181d-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 11:28:50 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-69b730fc89bso17701206d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 02:28:50 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f195018sm132971176d6.74.2024.05.22.02.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 02:28:48 -0700 (PDT)
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
X-Inumbo-ID: b271d8b1-181d-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716370129; x=1716974929; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gz1YsCbI1a4oUPtYa4QDaeqCIURr7ry/9yejUUOBEsk=;
        b=EyrpkNdCC+9S7WRtHiBc6Wr/HDQ611MGbK/MgrtVx9pTw59lZoR1HK9QdHUl0TcMBX
         w8t2ByA8GgCIO2Js4cv79IonBVvhXJlL6081I/gi7hNJN4EThhS29fHdMf4/xsAv52wW
         AdlFKyyI5+FENpdEjqKdk/qwK7wZDP/ubTzWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370129; x=1716974929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz1YsCbI1a4oUPtYa4QDaeqCIURr7ry/9yejUUOBEsk=;
        b=dgUN3kf6HmxkD9Y91IKpxVEheFBRABUq/6V08rZkoQ/WeKQiHhK2V4tSiHx+0MLQgO
         AjB3DU3PWwV2JnAP9QbdKOLIsd5FahChq0HwjrLEDI4U+0Bx9YD/vop0JDovp/d+mThE
         6aZ/QFxUlDkSG7/Hk1SJ260Ewgx9weLSR47QuvEqZWnhG8kzcg142pIzmmKWm4yrJ+qO
         KyAv32sAfSPehX/un+2xAhhAfn3I4bB50eJYlIMVCT4sFnqsY/v+OEavUEbc+cusA7/w
         Rqa+RujvMpM5y25rNUQy09zLwI9mo7y7dtNORzQrW2t1/9vJlthjvhJ5Xyb8NoCBMtks
         0T2w==
X-Gm-Message-State: AOJu0YwgALXyOrWy7iedihju4b/yHOIRk8c9krBdBtbv/ZPWAG02hln4
	Tun6OMvNJDtDM0Cs5GxhqEyp2KO70NVQ9RuN5FM9WnCVI95aNx7WPXEv6J5kplE=
X-Google-Smtp-Source: AGHT+IGrDQm9FAtR51aBACkT2Di0gxvalTT3yo3WfSsIvhZLPZoxUdssYMxqUSfHsMtaa0OKsRGiNw==
X-Received: by 2002:a05:6214:498f:b0:6ab:6f32:1a66 with SMTP id 6a1803df08f44-6ab7f361273mr19532236d6.26.1716370129124;
        Wed, 22 May 2024 02:28:49 -0700 (PDT)
Date: Wed, 22 May 2024 11:28:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v15 2/5] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <Zk26zphhCQ40rn2B@macbook>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
 <20240517170619.45088-3-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240517170619.45088-3-stewart.hildebrand@amd.com>

On Fri, May 17, 2024 at 01:06:12PM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
> to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
> guest's (domU) view of this will want to be zero (for now), the host
> having set it to 1 should be preserved, or else we'd effectively be
> giving the domU control of the bit. Thus, PCI_COMMAND register needs
> proper emulation in order to honor host's settings.
> 
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> Device Control" the reset state of the command register is typically 0,
> so when assigning a PCI device use 0 as the initial state for the
> guest's (domU) view of the command register.
> 
> Here is the full list of command register bits with notes about
> PCI/PCIe specification, and how Xen handles the bit. QEMU's behavior is
> also documented here since that is our current reference implementation
> for PCI passthrough.
> 
> PCI_COMMAND_IO (bit 0)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware. QEMU sets this bit to 1 in
>     hardware if an I/O BAR is exposed to the guest.
>   Xen domU: (rsvdp_mask) We treat this bit as RsvdP for now since we
>     don't yet support I/O BARs for domUs.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> PCI_COMMAND_MEMORY (bit 1)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware. QEMU sets this bit to 1 in
>     hardware if a Memory BAR is exposed to the guest.
>   Xen domU/dom0: We handle writes to this bit by mapping/unmapping BAR
>     regions.
>   Xen domU: For devices assigned to DomUs, memory decoding will be
>     disabled at the time of initialization.
> 
> PCI_COMMAND_MASTER (bit 2)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: Pass through writes to hardware.
>   Xen domU/dom0: Pass through writes to hardware.
> 
> PCI_COMMAND_SPECIAL (bit 3)
>   PCIe 6.1: RO, hardwire to 0
>   PCI LB 3.0: RW
>   QEMU: Pass through writes to hardware.
>   Xen domU/dom0: Pass through writes to hardware.
> 
> PCI_COMMAND_INVALIDATE (bit 4)
>   PCIe 6.1: RO, hardwire to 0
>   PCI LB 3.0: RW
>   QEMU: Pass through writes to hardware.
>   Xen domU/dom0: Pass through writes to hardware.
> 
> PCI_COMMAND_VGA_PALETTE (bit 5)
>   PCIe 6.1: RO, hardwire to 0
>   PCI LB 3.0: RW
>   QEMU: Pass through writes to hardware.
>   Xen domU/dom0: Pass through writes to hardware.
> 
> PCI_COMMAND_PARITY (bit 6)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware.
>   Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> PCI_COMMAND_WAIT (bit 7)
>   PCIe 6.1: RO, hardwire to 0
>   PCI LB 3.0: hardwire to 0
>   QEMU: res_mask
>   Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> PCI_COMMAND_SERR (bit 8)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware.
>   Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> PCI_COMMAND_FAST_BACK (bit 9)
>   PCIe 6.1: RO, hardwire to 0
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware.
>   Xen domU: (rsvdp_mask) We treat this bit as RsvdP.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> PCI_COMMAND_INTX_DISABLE (bit 10)
>   PCIe 6.1: RW
>   PCI LB 3.0: RW
>   QEMU: (emu_mask) QEMU provides an emulated view of this bit. Guest
>     writes do not propagate to hardware. QEMU checks if INTx was mapped
>     for a device. If it is not, then guest can't control
>     PCI_COMMAND_INTX_DISABLE bit.
>   Xen domU: We prohibit a guest from enabling INTx if MSI(X) is enabled.
>   Xen dom0: We allow dom0 to control this bit freely.
> 
> Bits 11-15
>   PCIe 6.1: RsvdP
>   PCI LB 3.0: Reserved
>   QEMU: res_mask
>   Xen domU/dom0: rsvdp_mask
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: There is an unaddressed question for Roger: should we update the
>      guest view of the PCI_COMMAND_INTX_DISABLE bit in
>      msi.c/msix.c:control_write()? See prior discussion at [1].
>      In my opinion, I think we should make sure that hardware state and
>      the guest view are consistent (i.e. don't lie to the guest).
> 
> [1] https://lore.kernel.org/xen-devel/86b25777-788c-4b9a-8166-a6f8174bedc9@suse.com/

I think updating the guest view is helpful in case we need to debug
issues in the guest.

> 
> In v15:
> - add Jan's R-b
> - add blank line after declaration in msi.c:control_write()
> 
> In v14:
> - check for 0->1 transition in INTX_DISABLE-setting logic in
>   msi.c:control_write() to match msix.c:control_write()
> - clear domU-controllable bits in header.c:init_header()
> 
> In v13:
> - Update right away (don't defer) PCI_COMMAND_MEMORY bit in guest_cmd
>   variable in cmd_write()
> - Make comment single line in xen/drivers/vpci/msi.c:control_write()
> - Rearrange memory decoding disabling snippet in init_header()
> 
> In v12:
> - Rework patch using vpci_add_register_mask()
> - Add bitmask #define in pci_regs.h according to PCIe 6.1 spec, except
>   don't add the RO bits because they were RW in PCI LB 3.0 spec.
> - Move and expand TODO comment about properly emulating bits
> - Update guest_cmd in msi.c/msix.c:control_write()
> - Simplify cmd_write(), thanks to rsvdp_mask
> - Update commit description
> 
> In v11:
> - Fix copy-paste mistake: vpci->msi should be vpci->msix
> - Handle PCI_COMMAND_IO
> - Fix condition for disabling INTx in the MSI-X code
> - Show domU changes to only allowed bits
> - Show PCI_COMMAND_MEMORY write only after P2M was altered
> - Update comments in the code
> In v10:
> - Added cf_check attribute to guest_cmd_read
> - Removed warning about non-zero cmd
> - Updated comment MSI code regarding disabling INTX
> - Used ternary operator in vpci_add_register() call
> - Disable memory decoding for DomUs in init_bars()
> In v9:
> - Reworked guest_cmd_read
> - Added handling for more bits
> Since v6:
> - fold guest's logic into cmd_write
> - implement cmd_read, so we can report emulated INTx state to guests
> - introduce header->guest_cmd to hold the emulated state of the
>   PCI_COMMAND register for guests
> Since v5:
> - add additional check for MSI-X enabled while altering INTX bit
> - make sure INTx disabled while guests enable MSI/MSI-X
> Since v3:
> - gate more code on CONFIG_HAS_MSI
> - removed logic for the case when MSI/MSI-X not enabled
> ---
>  xen/drivers/vpci/header.c  | 60 ++++++++++++++++++++++++++++++++++----
>  xen/drivers/vpci/msi.c     |  9 ++++++
>  xen/drivers/vpci/msix.c    |  7 +++++
>  xen/include/xen/pci_regs.h |  1 +
>  xen/include/xen/vpci.h     |  3 ++
>  5 files changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 47648c395132..2491dbae8901 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -524,9 +524,21 @@ static void cf_check cmd_write(
>  {
>      struct vpci_header *header = data;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        const struct vpci *vpci = pdev->vpci;
> +
> +        if ( (vpci->msi && vpci->msi->enabled) ||
> +             (vpci->msix && vpci->msix->enabled) )
> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> +
> +        header->guest_cmd = cmd;
> +    }
> +
>      /*
>       * Let Dom0 play with all the bits directly except for the memory
> -     * decoding one.
> +     * decoding one. Bits that are not allowed for DomU are already
> +     * handled above and by the rsvdp_mask.
>       */
>      if ( header->bars_mapped != !!(cmd & PCI_COMMAND_MEMORY) )
>          /*
> @@ -540,6 +552,14 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check guest_cmd_read(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    const struct vpci_header *header = data;
> +
> +    return header->guest_cmd;
> +}
> +
>  static void cf_check bar_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -754,9 +774,23 @@ static int cf_check init_header(struct pci_dev *pdev)
>          return -EOPNOTSUPP;
>      }
>  
> -    /* Setup a handler for the command register. */
> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
> -                           2, header);
> +    /*
> +     * Setup a handler for the command register.
> +     *
> +     * TODO: If support for emulated bits is added, re-visit how to handle
> +     * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
> +     */
> +    rc = vpci_add_register_mask(pdev->vpci,
> +                                is_hwdom ? vpci_hw_read16 : guest_cmd_read,
> +                                cmd_write, PCI_COMMAND, 2, header, 0, 0,
> +                                PCI_COMMAND_RSVDP_MASK |
> +                                    (is_hwdom ? 0
> +                                              : PCI_COMMAND_IO |
> +                                                PCI_COMMAND_PARITY |
> +                                                PCI_COMMAND_WAIT |
> +                                                PCI_COMMAND_SERR |
> +                                                PCI_COMMAND_FAST_BACK),

We want to allow full access to the hw domain and only apply the
PCI_COMMAND_RSVDP_MASK when !is_hwdom in order to keep the current
behavior for dom0.

I don't think it makes a difference in practice, but we are very lax
in explicitly not applying any of such restrictions to dom0.

With that fixed:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

