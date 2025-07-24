Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F58B10DF7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056199.1424398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexEQ-0000VF-4p; Thu, 24 Jul 2025 14:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056199.1424398; Thu, 24 Jul 2025 14:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexEQ-0000T7-0H; Thu, 24 Jul 2025 14:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1056199;
 Thu, 24 Jul 2025 14:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uexEO-00008T-O7
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:47:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2367c721-689d-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:47:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so647903f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:47:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fc72665sm2484522f8f.25.2025.07.24.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 07:47:35 -0700 (PDT)
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
X-Inumbo-ID: 2367c721-689d-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753368456; x=1753973256; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6VGnRrSPo3pMqkKtj0ACXDRGT9w/qnMCAOgUAkv0bE=;
        b=NZA9d2xeIuD1PdRIPGWklqWRQCnJWIp84+j/6CMa9oAOGERA6VGzuOdBz810r5fhNj
         +SvTFfdeDD1yHV4hr3H1zYiHeJoaVFXmm3XCKPAtrBdicxc/P5HkO+EjW6YWg4ga39t5
         OED0nEtJXmqBcr7WrPdrkrgk1KQ8EyamMJvGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368456; x=1753973256;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6VGnRrSPo3pMqkKtj0ACXDRGT9w/qnMCAOgUAkv0bE=;
        b=WEzZoCCn7wiuHrtSN85GgzSdVmgkUay2tU43SzfnLo+8MlIKydKoewPKVO71+MaTgF
         gwYVFpYezmPaAsRcDJJjKncLOKOKohkKRQBkEVIkBTbArFYV7XIyCSwO81JvAqEroV8F
         UKMxPViJzu3gX9KpD7P/1sqDaQtCzSERK9cR1HgVEGfM5UXFa9X1Gg2LO+CrFJkntxEa
         PunFBdqgRzU/l3HqkehlciAL7lH6vhPw85aeXMcMYP/ueiFvUBn7or9FHz3jDHCynvda
         GsN/AgLT9wNd/BYDDdbglb9GvdjdBe/vsJqkQsUjDciSkbwS+SSP6Y56MSczHnmkTMt4
         Cx8A==
X-Gm-Message-State: AOJu0Yz3KPquH3vy7EVctR3N3ON72faPnFm9pAG8ClZ+vyj+ClfHBZeJ
	8qy7wAKeKJ/WY+KJXF7I9OrJVnhx+F0xNd8SX+kuJZ6oH4yRLxxhz5cq+shdIgV53ao=
X-Gm-Gg: ASbGncsFeP6h5aEPlQgvhOW1YGn07TzoFryyefT1JOrXFV5enVj7QeZ0+CcS7idiIBA
	b/myZhTfcT5CmsMgnyaeSLFa0qYgIn2dprY3q5YzCtZWz80PsQbgSR8TLYi2dVRMpz1jfQ1WRjr
	lHM+Fnp/gE/npsIrsp50UNO07bjqhRKN0Tr27Y4qqV4Jys0M4x/zcAJH26XojonzpEuahgRlyyU
	jw6KEPA+KHno/22IRqeEOfXUtSYNP/cJ9GzEXd/2oV9PhcxgKpUaqF6Q96TlnKsb04GKLi9F4xF
	k+RvRB+HHhW+BXxysa/geRfSa7XjQ10WV3OD1O736DE/651HHgYG+G7IrMaFnOs3CL99o6o1rI8
	MErbFJcfvzZc9oqhxNN0jw7SAayX8YulfM/nOmsxkzbypPIoWJAJML56838zJsR9nuw==
X-Google-Smtp-Source: AGHT+IFW1NmXOM0XQGvxL4ISfTXVTKoPGdpQaBqt0Y0TwDvPOdbkw4QgIbEGqH5QpulFULwEKxoqJg==
X-Received: by 2002:a05:6000:25c6:b0:3a6:f2c1:5191 with SMTP id ffacd0b85a97d-3b768c98cfemr5716653f8f.4.1753368455631;
        Thu, 24 Jul 2025 07:47:35 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:47:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v8 3/8] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aIJHhuwX4TbIz-3n@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724055006.29843-4-Jiqian.Chen@amd.com>

On Thu, Jul 24, 2025 at 01:50:01PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a legacy capability of device, it just
> returns an error and vPCI gets disabled for the whole device.  That
> most likely renders the device unusable, plus possibly causing issues
> to Xen itself if guest attempts to program the native MSI or MSI-X
> capabilities if present.
> 
> So, add new function to hide legacy capability when initialization
> fails. And remove the failed legacy capability from the vpci emulated
> legacy capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v7->v8 changes:
> * Change the type of next from uint31_t to unsigned int in vpci_get_previous_cap_register().
> * Change to not return error when cleanup fail for dom0.
> 
> v6->v7 changes:
> * Change the pointer parameter of vpci_get_register(),
>   vpci_get_previous_cap_register() and vpci_capability_hide() to be const.
> 
> v5->v6 changes:
> * Rename parameter rm to r in vpci_get_register().
> * Use for loop to compact the code of vpci_get_previous_cap_register().
> * Rename prev_next_r to prev_r in vpci_capability_hide(().
> * Add printing when cap init, cleanup and hide fail.
> 
> v4->v5 changes:
> * Modify vpci_get_register() to delete some unnecessary check, so that
>   I don't need to move function vpci_register_cmp().
> * Rename vpci_capability_mask() to vpci_capability_hide().
> 
> v3->v4 changes:
> * Modify the commit message.
> * In function vpci_get_previous_cap_register(), add an ASSERT_UNREACHABLE() if offset below 0x40.
> * Modify vpci_capability_mask() to return error instead of using ASSERT.
> * Use vpci_remove_register to remove PCI_CAP_LIST_ID register instead of open code.
> * Add check "if ( !offset )" in vpci_capability_mask().
> 
> v2->v3 changes:
> * Separated from the last version patch "vpci: Hide capability when it fails to initialize"
> * Whole implementation changed because last version is wrong.
>   This version adds a new helper function vpci_get_register() and uses it to get
>   target handler and previous handler from vpci->handlers, then remove the target.
> 
> v1->v2 changes:
> * Removed the "priorities" of initializing capabilities since it isn't used anymore.
> * Added new function vpci_capability_mask() and vpci_ext_capability_mask() to
>   remove failed capability from list.
> * Called vpci_make_msix_hole() in the end of init_msix().
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/vpci.c | 111 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 7778acee0df6..9960b11cf2c9 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -83,6 +83,88 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static struct vpci_register *vpci_get_register(const struct vpci *vpci,
> +                                               unsigned int offset,
> +                                               unsigned int size)
> +{
> +    struct vpci_register *r;
> +
> +    ASSERT(spin_is_locked(&vpci->lock));
> +
> +    list_for_each_entry ( r, &vpci->handlers, node )
> +    {
> +        if ( r->offset == offset && r->size == size )
> +            return r;
> +
> +        if ( offset <= r->offset )
> +            break;
> +    }
> +
> +    return NULL;
> +}
> +
> +static struct vpci_register *vpci_get_previous_cap_register(
> +    const struct vpci *vpci, unsigned int offset)
> +{
> +    unsigned int next;
> +    struct vpci_register *r;
> +
> +    if ( offset < 0x40 )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }
> +
> +    for ( r = vpci_get_register(vpci, PCI_CAPABILITY_LIST, 1); r;
> +          r = next >= 0x40 ? vpci_get_register(vpci,
> +                                               next + PCI_CAP_LIST_NEXT, 1)
> +                           : NULL )
> +    {
> +        next = (unsigned int)(uintptr_t)r->private;
> +        ASSERT(next == (uintptr_t)r->private);
> +        if ( next == offset )
> +            break;
> +    }
> +
> +    return r;
> +}
> +
> +static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_cap_offset(pdev->sbdf, cap);
> +    struct vpci_register *prev_r, *next_r;
> +    struct vpci *vpci = pdev->vpci;
> +
> +    if ( !offset )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    prev_r = vpci_get_previous_cap_register(vpci, offset);
> +    next_r = vpci_get_register(vpci, offset + PCI_CAP_LIST_NEXT, 1);
> +    if ( !prev_r || !next_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    prev_r->private = next_r->private;
> +    /*
> +     * Not calling vpci_remove_register() here is to avoid redoing
> +     * the register search

I would prefer a full stop after the sentence here, but since it's
still a single sentence multi line comment, I don't think it's
strictly necessary.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

