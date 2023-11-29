Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5867FD4DA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 12:04:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643816.1004355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IM5-0006o8-6X; Wed, 29 Nov 2023 11:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643816.1004355; Wed, 29 Nov 2023 11:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8IM5-0006la-3b; Wed, 29 Nov 2023 11:03:45 +0000
Received: by outflank-mailman (input) for mailman id 643816;
 Wed, 29 Nov 2023 11:03:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdkt=HK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8IM3-0006lR-1y
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 11:03:43 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b8ffc7-8ea6-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 12:03:40 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b31232bf0so53076305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 03:03:40 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 p37-20020a05600c1da500b0040b42df75fcsm1848889wms.39.2023.11.29.03.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 03:03:39 -0800 (PST)
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
X-Inumbo-ID: f3b8ffc7-8ea6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701255820; x=1701860620; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPGZkjpNQxFtZZ0zo1xXtAiFfuf19lHL+uQ6kvKimJ0=;
        b=ot/hZDWqMLu2CLhkX/YhIUMGvnzNJHVNBrnSco+YS36ierRHADZG848IKj9/hSHQ27
         Hjlso4YBy+a7NAVQqHBd+tKoFEDZ98PMqcmcWrwdfpkmJ6IwuD7TOpVNIqefwgrRPMvM
         YAaKEJzu/SI5ahHUYpO88R0b0r4S9Gettv7rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701255820; x=1701860620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPGZkjpNQxFtZZ0zo1xXtAiFfuf19lHL+uQ6kvKimJ0=;
        b=ZuUU20HOWpiEH6GZLJVf6qM3MMk21ESTgQgFTQ2AwOgS8CeRosOYl0w69EqAOOVpL5
         g8l7JwEQIh7QwiK9PBu3oJ6gIoKIF/Nr5VIsGBKvFZQ8C6fD4kAziW3D/Tsmqx1MvFU3
         tX5Dpjkdg0+9Xa764dIN1U3HQuw9SNU//l2a4dXxIYUWE6oFZ+nkeTdDJPTyZRd00kDt
         xWyQIYJYUV71X90jOdNjD6GWNY596GMgYxajYc7vMaICK8z9ODC/KF7CmDXIj+qJmXZG
         DB3b1yDyCjxtaZxjwSeJTzFLJRpR0FZJnv1FSzeSNWR/Z07QmeunmPA5viei9EQxdzlm
         ZCTw==
X-Gm-Message-State: AOJu0YyHZUUDrAbFPKRlEXiseiJQ3+HPJKfy/w6PmH2q2xhxPCaGQeww
	lIDUYQmpo3cnPoOToVqE0raYVg==
X-Google-Smtp-Source: AGHT+IGP5pY2TLvjHVoFWdizvmAkDuDm46TNVJj8cUDiIA6EPy9oFrwTUmwAAM9g4EgBH0uw0SlNzw==
X-Received: by 2002:a05:600c:1907:b0:40b:5075:86b0 with SMTP id j7-20020a05600c190700b0040b507586b0mr2182040wmq.33.1701255819561;
        Wed, 29 Nov 2023 03:03:39 -0800 (PST)
Date: Wed, 29 Nov 2023 12:03:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 1/2] xen/vpci: header: status register handler
Message-ID: <ZWcaiqrg9ZMn6JFC@macbook>
References: <20231128194427.2513249-1-stewart.hildebrand@amd.com>
 <20231128194427.2513249-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128194427.2513249-2-stewart.hildebrand@amd.com>

On Tue, Nov 28, 2023 at 02:44:24PM -0500, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask
> the capabilities bit. The status register contains RsvdZ bits,
> read-only bits, and write-1-to-clear bits. Additionally, we use RsvdP to
> mask the capabilities bit. Introduce bitmasks to handle these in vPCI.
> If a bit in the bitmask is set, then the special meaning applies:
> 
>   ro_mask: read normal, guest write ignore (preserve on write to hardware)
>   rw1c_mask: read normal, write 1 to clear
>   rsvdp_mask: read as zero, guest write ignore (preserve on write to hardware)
>   rsvdz_mask: read as zero, guest write ignore (write zero to hardware)
> 
> The RO/RW1C/RsvdP/RsvdZ naming and definitions were borrowed from the
> PCI Express Base 6.1 specification. RsvdP/RsvdZ bits help Xen enforce
> our view of the world. Xen preserves the value of read-only bits on
> write to hardware, discarding the guests write value. This is done in
> case hardware wrongly implements R/O bits as R/W.
> 
> The mask_cap_list flag will be set in a follow-on patch.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Thanks for adding the tests, this is looking very good, just a couple
of cosmetics comments mostly, and a question whether we should refuse
masks that have bit set outside the register size instead of
attempting to adjust them.

> ---
> v7->v8:
> * move PCI_STATUS_UDF to rsvdz_mask (per PCI Express Base 6 spec)
> * add support for rsvdp bits
> * add tests for ro/rw1c/rsvdp/rsvdz bits in tools/tests/vpci/main.c
> * dropped R-b tag [1] since the patch has changed moderately since the last rev
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00909.html
> 
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
>  tools/tests/vpci/main.c    | 98 ++++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/header.c  | 12 +++++
>  xen/drivers/vpci/vpci.c    | 62 +++++++++++++++++++-----
>  xen/include/xen/pci_regs.h |  9 ++++
>  xen/include/xen/vpci.h     |  9 ++++
>  5 files changed, 178 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
> index b9a0a6006bb9..b0bb993be297 100644
> --- a/tools/tests/vpci/main.c
> +++ b/tools/tests/vpci/main.c
> @@ -70,6 +70,26 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
>      *(uint32_t *)data = val;
>  }
>  
> +struct mask_data {
> +    uint32_t val;
> +    uint32_t rw1c_mask;
> +};
> +
> +static uint32_t vpci_read32_mask(const struct pci_dev *pdev, unsigned int reg,
> +                                 void *data)
> +{
> +    struct mask_data *md = data;

Newline, and possibly const for md.

> +    return md->val;
> +}
> +
> +static void vpci_write32_mask(const struct pci_dev *pdev, unsigned int reg,
> +                              uint32_t val, void *data)
> +{
> +    struct mask_data *md = data;

Newline.

> +    md->val  = val | (md->val & md->rw1c_mask);
> +    md->val &= ~(val & md->rw1c_mask);
> +}
> +
>  #define VPCI_READ(reg, size, data) ({                           \
>      data = vpci_read((pci_sbdf_t){ .sbdf = 0 }, reg, size);     \
>  })
> @@ -94,9 +114,20 @@ static void vpci_write32(const struct pci_dev *pdev, unsigned int reg,
>      assert(!vpci_add_register(test_pdev.vpci, fread, fwrite, off, size,     \
>                                &store))
>  
> +#define VPCI_ADD_REG_MASK(fread, fwrite, off, size, store,                     \
> +                          ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask)          \
> +    assert(!vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
> +                                   &store,                                     \
> +                                   ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
> +
>  #define VPCI_ADD_INVALID_REG(fread, fwrite, off, size)                      \
>      assert(vpci_add_register(test_pdev.vpci, fread, fwrite, off, size, NULL))
>  
> +#define VPCI_ADD_INVALID_REG_MASK(fread, fwrite, off, size,                   \
> +                                  ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask) \
> +    assert(vpci_add_register_mask(test_pdev.vpci, fread, fwrite, off, size,   \
> +                                  NULL, ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask))
> +
>  #define VPCI_REMOVE_REG(off, size)                                          \
>      assert(!vpci_remove_register(test_pdev.vpci, off, size))
>  
> @@ -154,6 +185,7 @@ main(int argc, char **argv)
>      uint16_t r20[2] = { };
>      uint32_t r24 = 0;
>      uint8_t r28, r30;
> +    struct mask_data r32;
>      unsigned int i;
>      int rc;
>  
> @@ -213,6 +245,14 @@ main(int argc, char **argv)
>      /* Try to add a register with missing handlers. */
>      VPCI_ADD_INVALID_REG(NULL, NULL, 8, 2);
>  
> +    /* Try to add registers with the same bits set in multiple masks. */
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 1, 0, 0);
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 1, 0);
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 1, 0, 0, 1);
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 1, 0);
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 1, 0, 1);
> +    VPCI_ADD_INVALID_REG_MASK(vpci_read32, vpci_write32, 8, 4, 0, 0, 1, 1);
> +
>      /* Read/write of unset register. */
>      VPCI_READ_CHECK(8, 4, 0xffffffff);
>      VPCI_READ_CHECK(8, 2, 0xffff);
> @@ -287,6 +327,64 @@ main(int argc, char **argv)
>      VPCI_ADD_REG(vpci_read8, vpci_write8, 30, 1, r30);
>      VPCI_WRITE_CHECK(28, 4, 0xffacffdc);
>  
> +    /*
> +     * Test ro/rw1c/rsvdp/rsvdz masks.
> +     *
> +     * 32     24     16      8      0
> +     *  +---------------------------+
> +     *  |            r32            | 32
> +     *  +---------------------------+

Might be even better to clarify which region is using each mask:

32     24     16      8      0
 +------+------+------+------+
 |rsvdz |rsvdp | rw1c |  ro  | 32
 +------+------+------+------+

> +     *
> +     */
> +    r32.rw1c_mask = 0x0000ff00U;
> +    VPCI_ADD_REG_MASK(vpci_read32_mask, vpci_write32_mask, 32, 4, r32,
> +                      0x000000ffU   /* RO    */,
> +                      r32.rw1c_mask /* RW1C  */,
> +                      0x00ff0000U   /* RsvdP */,
> +                      0xff000000U   /* RsvdZ */);
> +
> +    /* ro */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(32, 1, 0x0f);
> +    VPCI_WRITE(32, 1, 0x5a);
> +    VPCI_READ_CHECK(32, 1, 0x0f);
> +    assert(r32.val == 0x000f0f0fU);
> +
> +    /* rw1c */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(33, 1, 0x0f);
> +    VPCI_WRITE(33, 1, 0x5a);
> +    VPCI_READ_CHECK(33, 1, 0x05);
> +    assert(r32.val == 0x000f050fU);
> +
> +    /* rsvdp */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(34, 1, 0);
> +    VPCI_WRITE(34, 1, 0x5a);
> +    VPCI_READ_CHECK(34, 1, 0);
> +    assert(r32.val == 0x000f0f0fU);
> +
> +    /* rsvdz */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(35, 1, 0);
> +    VPCI_WRITE(35, 1, 0x5a);
> +    VPCI_READ_CHECK(35, 1, 0);
> +    assert(r32.val == 0x000f0f0fU);
> +
> +    /* write all 0's */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
> +    VPCI_WRITE(32, 4, 0);
> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
> +    assert(r32.val == 0x000f0f0fU);
> +
> +    /* write all 1's */
> +    r32.val = 0x0f0f0f0fU;
> +    VPCI_READ_CHECK(32, 4, 0x00000f0fU);
> +    VPCI_WRITE(32, 4, 0xffffffffU);
> +    VPCI_READ_CHECK(32, 4, 0x0000000fU);
> +    assert(r32.val == 0x000f000fU);
> +
>      /* Finally try to remove a couple of registers. */
>      VPCI_REMOVE_REG(28, 1);
>      VPCI_REMOVE_REG(24, 4);
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 767c1ba718d7..351318121e48 100644
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
> @@ -544,6 +545,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
> +    rc = vpci_add_register_mask(pdev->vpci, vpci_hw_read16, vpci_hw_write16,
> +                                PCI_STATUS, 2, NULL,
> +                                PCI_STATUS_RO_MASK &
> +                                    ~(mask_cap_list ? PCI_STATUS_CAP_LIST : 0),
> +                                PCI_STATUS_RW1C_MASK,
> +                                mask_cap_list ? PCI_STATUS_CAP_LIST : 0,
> +                                PCI_STATUS_RSVDZ_MASK);
> +    if ( rc )
> +        return rc;
> +
>      if ( pdev->ignore_bars )
>          return 0;
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 3bec9a4153da..96187b70141b 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -29,6 +29,10 @@ struct vpci_register {
>      unsigned int offset;
>      void *private;
>      struct list_head node;
> +    uint32_t ro_mask;
> +    uint32_t rw1c_mask;
> +    uint32_t rsvdp_mask;
> +    uint32_t rsvdz_mask;
>  };
>  
>  #ifdef __XEN__
> @@ -145,9 +149,17 @@ uint32_t cf_check vpci_hw_read32(
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
> +                        unsigned int size, void *data, uint32_t ro_mask,
> +                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
> +                        uint32_t rsvdz_mask)
>  {
>      struct list_head *prev;
>      struct vpci_register *r;
> @@ -155,7 +167,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      /* Some sanity checks. */
>      if ( (size != 1 && size != 2 && size != 4) ||
>           offset >= PCI_CFG_SPACE_EXP_SIZE || (offset & (size - 1)) ||
> -         (!read_handler && !write_handler) )
> +         (!read_handler && !write_handler) || (ro_mask & rw1c_mask) ||
> +         (ro_mask & rsvdp_mask) || (ro_mask & rsvdz_mask) ||
> +         (rw1c_mask & rsvdp_mask) || (rw1c_mask & rsvdz_mask) ||
> +         (rsvdp_mask & rsvdz_mask) )

It would also be helpful to check that the masks don't have bits set
above the given register size, ie:

if ( size != 4 &&
     (ro_mask | rw1c_mask | rsvdp_mask | rsvdz_mask) >> (size * 8) )
    return -EINVAL;

>          return -EINVAL;
>  
>      r = xmalloc(struct vpci_register);
> @@ -167,6 +182,10 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->size = size;
>      r->offset = offset;
>      r->private = data;
> +    r->ro_mask = ro_mask & (0xffffffffU >> (32 - 8 * size));
> +    r->rw1c_mask = rw1c_mask & (0xffffffffU >> (32 - 8 * size));
> +    r->rsvdp_mask = rsvdp_mask & (0xffffffffU >> (32 - 8 * size));
> +    r->rsvdz_mask = rsvdz_mask & (0xffffffffU >> (32 - 8 * size));

Oh, you adjust the masks to match the expected width.  I think it
might be more sensible to instead make sure the caller has provided
appropriate masks, as providing a mask that doesn't match the register
size likely points out to issues in the caller.

>  
>      spin_lock(&vpci->lock);
>  
> @@ -193,6 +212,24 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      return 0;
>  }
>  
> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> +                      vpci_write_t *write_handler, unsigned int offset,
> +                      unsigned int size, void *data)
> +{
> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
> +                        0, 0, 0, 0);
> +}
> +
> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
> +                           vpci_write_t *write_handler, unsigned int offset,
> +                           unsigned int size, void *data, uint32_t ro_mask,
> +                           uint32_t rw1c_mask, uint32_t rsvdp_mask,
> +                           uint32_t rsvdz_mask)
> +{
> +    return add_register(vpci, read_handler, write_handler, offset, size, data,
> +                        ro_mask, rw1c_mask, rsvdp_mask, rsvdz_mask);
> +}
> +
>  int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>                           unsigned int size)
>  {
> @@ -376,6 +413,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          }
>  
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~(r->rsvdp_mask | r->rsvdz_mask);
>  
>          /* Check if the read is in the middle of a register. */
>          if ( r->offset < emu.offset )
> @@ -407,26 +445,26 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
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

Nit: might be clearer to name this 'current': it's easy to get
confused whether val or data holds the user-provided input.

> +    uint32_t preserved_mask = r->ro_mask | r->rsvdp_mask;
> +
>      ASSERT(size <= r->size);
>  
> -    if ( size != r->size )
> +    if ( (size != r->size) || preserved_mask )
>      {
> -        uint32_t val;
> -
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rw1c_mask;
>          data = merge_result(val, data, size, offset);
>      }
>  
> +    data &= ~(preserved_mask | r->rsvdz_mask);
> +    data |= val & preserved_mask;
> +
>      r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>               r->private);
>  }
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index 84b18736a85d..9909b27425a5 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -66,6 +66,15 @@
>  #define  PCI_STATUS_REC_MASTER_ABORT	0x2000 /* Set on master abort */
>  #define  PCI_STATUS_SIG_SYSTEM_ERROR	0x4000 /* Set when we drive SERR */
>  #define  PCI_STATUS_DETECTED_PARITY	0x8000 /* Set on parity error */
> +#define  PCI_STATUS_RSVDZ_MASK		0x0046 /* Includes PCI_STATUS_UDF */
> +
> +#define  PCI_STATUS_RO_MASK (PCI_STATUS_IMM_READY | PCI_STATUS_INTERRUPT | \
> +    PCI_STATUS_CAP_LIST | PCI_STATUS_66MHZ | PCI_STATUS_FAST_BACK | \
> +    PCI_STATUS_DEVSEL_MASK)
> +#define  PCI_STATUS_RW1C_MASK (PCI_STATUS_PARITY | \
> +    PCI_STATUS_SIG_TARGET_ABORT | PCI_STATUS_REC_TARGET_ABORT | \
> +    PCI_STATUS_REC_MASTER_ABORT | PCI_STATUS_SIG_SYSTEM_ERROR | \
> +    PCI_STATUS_DETECTED_PARITY)
>  
>  #define PCI_CLASS_REVISION	0x08	/* High 24 bits are class, low 8 revision */
>  #define PCI_REVISION_ID		0x08	/* Revision ID */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index d743d96a10b8..8e8e42372ec1 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -37,6 +37,13 @@ int __must_check vpci_add_register(struct vpci *vpci,
>                                     vpci_write_t *write_handler,
>                                     unsigned int offset, unsigned int size,
>                                     void *data);
> +int __must_check vpci_add_register_mask(struct vpci *vpci,
> +                                        vpci_read_t *read_handler,
> +                                        vpci_write_t *write_handler,
> +                                        unsigned int offset, unsigned int size,
> +                                        void *data, uint32_t ro_mask,
> +                                        uint32_t rw1c_mask, uint32_t rsvdp_mask,
> +                                        uint32_t rsvdz_mask);

Instead of exporting two functions, you could export only
vpci_add_register_mask() and make vpci_add_register() a static inline
defined in the header as a wrapper around vpci_add_register_mask().

Thanks, Roger.

