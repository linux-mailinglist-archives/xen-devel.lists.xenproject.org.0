Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB617EF2DC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 13:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635161.991008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3y9K-0005q4-P7; Fri, 17 Nov 2023 12:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635161.991008; Fri, 17 Nov 2023 12:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3y9K-0005o4-L3; Fri, 17 Nov 2023 12:40:42 +0000
Received: by outflank-mailman (input) for mailman id 635161;
 Fri, 17 Nov 2023 12:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3y9J-0005lq-Qn
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 12:40:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 835b80de-8546-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 13:40:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40859c464daso15431995e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 04:40:39 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b0040472ad9a3dsm2553807wml.14.2023.11.17.04.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 04:40:38 -0800 (PST)
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
X-Inumbo-ID: 835b80de-8546-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700224839; x=1700829639; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lHsVu149PonpGYksBoU5RMrGx2/Ct6o361g3R09QHQ=;
        b=WIMDTKauklZ+XyqkzOGqbj0cQmxHgQSuofPwy1NqgZ+pz/G93VPs718Uy8cv4Ms2V2
         fiCZCfEsGbYABebREqp2Yj926Mxi9ScG6NomjHEZE/YVgPvRAozRnoZ2cqT/gpSxpOP4
         /i2772DuN7oWZJSFw3vIZjFHrAwiNgqWZ8vi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700224839; x=1700829639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lHsVu149PonpGYksBoU5RMrGx2/Ct6o361g3R09QHQ=;
        b=fndDwNdic7raSB+Nb5fFiulrCbs4yanFd4dZG/3f9YUJV7HYufULVNb/rq1UMj9IQr
         KLxahOe+3XlOmGvd/2e6m31tHiy8KKcL0peGylixYmicEb3Il47bSvuDbqEquV1e0wb+
         3pf1otsVPgp+vxPFQnbSLtNCTO9Vhqb6lHoDMkZ0S0EJCfpVQSL4KZSFqssP3cV3z1dL
         P2+6mWpC7AgA1HQH6nqjA/zRRfTKHSNrUAsd7DpfZencac3G8UyJo766/OdKN9peWDGj
         s5Af6CAVAUPvLz5xD5591bjgBNNzPBJzXJhVfDa6yL4tvB6gSmni3Je8Ym76k0ga7nFd
         rj5Q==
X-Gm-Message-State: AOJu0Yw0s2Bvr5pPkNM5eyVzljAlfMrK9MdqH7orOFUTLy/MTvM5/UYM
	KZXvPA6rqdPJBM0uvCgnvfdugw==
X-Google-Smtp-Source: AGHT+IFwOec/Zkm0NMtYYY+bBvG4Oo3v45QKaBYLCUWRl8D1jzvy3V/JEweHf67mxxIDwxphKoW0EQ==
X-Received: by 2002:a05:600c:4e44:b0:402:bcac:5773 with SMTP id e4-20020a05600c4e4400b00402bcac5773mr14576409wmq.38.1700224838797;
        Fri, 17 Nov 2023 04:40:38 -0800 (PST)
Date: Fri, 17 Nov 2023 13:40:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVdfRQpGFSU1OIkh@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913143550.14565-2-stewart.hildebrand@amd.com>

On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask the
> capabilities bit. The status register contains RsvdZ bits, read-only bits, and
> write-1-to-clear bits, so introduce bitmasks to handle these in vPCI. If a bit
> in the bitmask is set, then the special meaning applies:
> 
>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>   rw1c_mask: read normal, write 1 to clear
> 
> The RsvdZ naming was borrowed from the PCI Express Base 4.0 specification.
> 
> Xen preserves the value of read-only bits on write to hardware, discarding the
> guests write value.
> 
> The mask_cap_list flag will be set in a follow-on patch.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v6->v7:
> * re-work args passed to vpci_add_register_mask() (called in init_bars())
> * also check for overlap of (rsvdz_mask & ro_mask) in add_register()
> * slightly adjust masking operation in vpci_write_helper()
> 
> v5->v6:
> * remove duplicate PCI_STATUS_CAP_LIST in constant definition
> * style fixup in constant definitions
> * s/res_mask/rsvdz_mask/
> * combine a new masking operation into single line
> * preserve r/o bits on write
> * get rid of status_read. Instead, use rsvdz_mask for conditionally masking
>   PCI_STATUS_CAP_LIST bit
> * add comment about PCI_STATUS_CAP_LIST and rsvdp behavior
> * add sanity checks in add_register
> * move mask_cap_list from struct vpci_header to local variable
> 
> v4->v5:
> * add support for res_mask
> * add support for ro_mask (squash ro_mask patch)
> * add constants for reserved, read-only, and rw1c masks
> 
> v3->v4:
> * move mask_cap_list setting to the capabilities patch
> * single pci_conf_read16 in status_read
> * align mask_cap_list bitfield in struct vpci_header
> * change to rw1c bit mask instead of treating whole register as rw1c
> * drop subsystem prefix on renamed add_register function
> 
> v2->v3:
> * new patch
> ---
>  xen/drivers/vpci/header.c  | 16 +++++++++++
>  xen/drivers/vpci/vpci.c    | 55 +++++++++++++++++++++++++++++---------
>  xen/include/xen/pci_regs.h |  9 +++++++
>  xen/include/xen/vpci.h     |  8 ++++++
>  4 files changed, 76 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 767c1ba718d7..af267b75ac31 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -521,6 +521,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool mask_cap_list = false;
>  
>      switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>      {
> @@ -544,6 +545,21 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    /*
> +     * Utilize rsvdz_mask to hide PCI_STATUS_CAP_LIST from the guest for now. If
> +     * support for rsvdp (reserved & preserved) is added in the future, the
> +     * rsvdp mask should be used instead.
> +     */
> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> +                                PCI_STATUS, 2, NULL,
> +                                PCI_STATUS_RSVDZ_MASK |
> +                                    (mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> +                                PCI_STATUS_RO_MASK &
> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> +                                PCI_STATUS_RW1C_MASK);
> +    if ( rc )
> +        return rc;
> +
>      if ( pdev->ignore_bars )
>          return 0;
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3bec9a4153da..b4cde7db1b3f 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -29,6 +29,9 @@ struct vpci_register {
>      unsigned int offset;
>      void *private;
>      struct list_head node;
> +    uint32_t rsvdz_mask;
> +    uint32_t ro_mask;
> +    uint32_t rw1c_mask;

I understand that we need the rw1c_mask in order to properly merge
values when doing partial writes, but the other fields I'm not sure we
do need them.  RO bits don't care about what's written to them, and
RsvdZ are always read as 0 and written as 0, so the mask shouldn't
affect the merging.

>  };
>  
>  #ifdef __XEN__
> @@ -145,9 +148,16 @@ uint32_t cf_check vpci_hw_read32(
>      return pci_conf_read32(pdev->sbdf, reg);
>  }
>  
> -int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> -                      vpci_write_t *write_handler, unsigned int offset,
> -                      unsigned int size, void *data)
> +void cf_check vpci_hw_write16(
> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> +{
> +    pci_conf_write16(pdev->sbdf, reg, val);
> +}
> +
> +static int add_register(struct vpci *vpci, vpci_read_t *read_handler,
> +                        vpci_write_t *write_handler, unsigned int offset,
> +                        unsigned int size, void *data, uint32_t rsvdz_mask,
> +                        uint32_t ro_mask, uint32_t rw1c_mask)
>  {
>      struct list_head *prev;
>      struct vpci_register *r;
> @@ -155,7 +165,8 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      /* Some sanity checks. */
>      if ( (size != 1 && size != 2 && size != 4) ||
>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
> -         (!read_handler && !write_handler) )
> +         (!read_handler && !write_handler) || (rsvdz_mask & ro_mask) ||
> +         (rsvdz_mask & rw1c_mask) || (ro_mask & rw1c_mask) )
>          return -EINVAL;
>  
>      r = xmalloc(struct vpci_register);
> @@ -167,6 +178,9 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->size = size;
>      r->offset = offset;
>      r->private = data;
> +    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));
> +    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
> +    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
>  
>      spin_lock(&vpci->lock);
>  
> @@ -193,6 +207,23 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      return 0;
>  }
>  
> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> +                      vpci_write_t *write_handler, unsigned int offset,
> +                      unsigned int size, void *data)
> +{
> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
> +                        0, 0, 0);
> +}
> +
> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
> +                           vpci_write_t *write_handler, unsigned int offset,
> +                           unsigned int size, void *data, uint32_t rsvdz_mask,
> +                           uint32_t ro_mask, uint32_t rw1c_mask)
> +{
> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
> +                        rsvdz_mask, ro_mask, rw1c_mask);
> +}
> +
>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>                           unsigned int size)
>  {
> @@ -376,6 +407,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          }
>  
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rsvdz_mask;
>  
>          /* Check if the read is in the middle of a register. */
>          if ( r->offset < emu.offset )
> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  
>  /*
>   * Perform a maybe partial write to a register.
> - *
> - * Note that this will only work for simple registers, if Xen needs to
> - * trap accesses to rw1c registers (like the status PCI header register)
> - * the logic in vpci_write will have to be expanded in order to correctly
> - * deal with them.
>   */
>  static void vpci_write_helper(const struct pci_dev *pdev,
>                                const struct vpci_register *r, unsigned int size,
>                                unsigned int offset, uint32_t data)
>  {
> +    uint32_t val = 0;
> +
>      ASSERT(size <= r->size);
>  
> -    if ( size != r->size )
> +    if ( (size != r->size) || r->ro_mask )

Hm, I'm not sure this specific handling for read-only bits is
required, software is allowed to write either 0 or 1 to read-only
bits, but the write will be ignored.

>      {
> -        uint32_t val;
> -
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rw1c_mask;
>          data = merge_result(val, data, size, offset);
>      }
>  
> +    data &= ~(r->rsvdz_mask | r->ro_mask);
> +    data |= val & r->ro_mask;

You cannot apply the register masks directly into the final value, you
need to offset and mask them as necessary, likewise for val, see
what's done in merge_result().

Regardless of the offset issue, I think the usage of val with the
ro_mask is bogus here, see above.

> +
>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>               r->private);
>  }
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 84b18736a85d..b72131729db6 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -66,6 +66,15 @@
>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
> +#define  PCI_STATUS_RSVDZ_MASK		0x0006

In my copy of the PCIe 6 spec bit 6 is also RsvdZ, so the mask should
be 0x46.

But I'm unsure we really need this mask.

Thanks, Roger.

