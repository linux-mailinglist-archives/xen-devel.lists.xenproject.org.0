Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FDACF246
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006989.1386255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBs1-0000f3-Bq; Thu, 05 Jun 2025 14:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006989.1386255; Thu, 05 Jun 2025 14:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBs1-0000dc-96; Thu, 05 Jun 2025 14:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1006989;
 Thu, 05 Jun 2025 14:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNBs0-0000dW-98
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:47:04 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f150ac9b-421b-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:47:03 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so9143025e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 07:47:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-451fb22b09dsm20438105e9.39.2025.06.05.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 07:47:01 -0700 (PDT)
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
X-Inumbo-ID: f150ac9b-421b-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749134822; x=1749739622; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=di+wlchiJc2wLdNgQd/YIgUSr6Cs8eMtFIzEN8dijqA=;
        b=Tb/pNMdKzDbkDm44RbmKhlN7/U7MpO8mglV6KPwyFRgLjMfxU0zSLvbENHJY96x2OS
         bWvYNXknXKVYdxVDLyBjO/X8K8Z25pCjBMA5WOdPnpGKO52qLEZpb7z/Q47lCeUh49sS
         ImjWWvdCG5WH+FUOrxPqu0HgvASnGiKozbPho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749134822; x=1749739622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=di+wlchiJc2wLdNgQd/YIgUSr6Cs8eMtFIzEN8dijqA=;
        b=ptWbcke8pEERZXmyiBLpr/gG1X0XyRFGHV1fVmUtJ0XMhfqFPHjISpTHuYIRzSgOsq
         +QSdxp94HgZ15/sPgtWOQMbaEDmwS+aQvdSsrHPHxiVwMLEYL4YERAQXi5tawwV/lPJ+
         24Oc0iF72JsPKMesES9GQtM71T2/GHDAiD5fLAfoLOYKqwM0EPR/ZDlbcllYUE2sLTUV
         mu5d1KUdmNQMxu5+6rlLqRZWwasxcF8VrIo2U/Z4wGPo1DnXkulCewSH5sXb3BqJQm7n
         kR9pjVBzXF+k2BU2m/F6yX4ddCqauqRnNorL9Pi7j1Z0KkjRhEOBWuYMPdvuwaEm3egD
         BKlQ==
X-Gm-Message-State: AOJu0Yx5Q18XsIeNKtjw2lFibCttX5/2MOVIqUbo71eEPQR86q+C3EpJ
	QT6WFuUrchA+CCBz6pPot2Emg1j5E6EHSxOu9ntsCAMsbSx8d4TCeP6cP1TThiTfoG0=
X-Gm-Gg: ASbGnctaX5cBewkb285P1F5nKq8bP+rjf/UYexaLkdbchymwu7wLTOpUNk2zqBaIx/+
	GOx4Cbr/RUhkVMsiBDf2RvXKQoiWOtL1b41juLlfSAoUj26QIKS1pCAFwxE9a3OBt4eVo5+iqxJ
	qOjO+7p0UkDSZkfoMNn7Vl3oojS8pOAW6DotLFft79P5pfNRDJ/AA7cabVwPs4CXnhrqzqxTmAm
	nxDxorNTlg4CE86WZLCm+YGAjjLGEXW3tNpyhU8bgWeJ6zz1o9IGO0o8YMvO5TV0rDML7aKAxci
	QNQsyJqX8b1g90k+37xM4y07zSqMDPU+myPgVq1cWDAYQ7Xy22aLnWYwNxxW45vGy0YaN+Vf8iC
	ydHCDK9InhmGDfV1YCUQ=
X-Google-Smtp-Source: AGHT+IER/bpJNHlYfJHc+zoLblH6SNgUzD2o/kVjRW5JAXYVwPuEeCQnKZQltTkyTzqR8d7koVs3Ww==
X-Received: by 2002:a05:600c:8cd:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-451f270de8cmr45936035e9.19.1749134822318;
        Thu, 05 Jun 2025 07:47:02 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:47:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 06/10] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aEGt5SJ32hovLinu@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-7-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526094559.140423-7-Jiqian.Chen@amd.com>

On Mon, May 26, 2025 at 05:45:55PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a extended capability of device, it
> just returns an error and vPCI gets disabled for the whole device.
> 
> So, add function to hide extended capability when initialization
> fails. And remove the failed extended capability handler from vpci
> extended capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> cc: Michal Orzel <michal.orzel@amd.com>
> cc: Jan Beulich <jbeulich@suse.com>
> cc: Julien Grall <julien@xen.org>
> cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v4->v5 changes:
> * Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
> * Rename vpci_ext_capability_mask to vpci_ext_capability_hide.
> 
> v3->v4 changes:
> * Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header) (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
> * Modify the commit message.
> * Change vpci_ext_capability_mask() to return error instead of using ASSERT.
> * Set the capability ID part to be zero when we need to hide the capability of position 0x100U.
> * Add check "if ( !offset )" in vpci_ext_capability_mask().
> 
> v2->v3 changes:
> * Separated from the last version patch "vpci: Hide capability when it fails to initialize".
> * Whole implementation changed because last version is wrong.
>   This version gets target handler and previous handler from vpci->handlers, then remove the target.
> * Note: a case in function vpci_ext_capability_mask() needs to be discussed,
>   because it may change the offset of next capability when the offset of target
>   capability is 0x100U(the first extended capability), my implementation is just to
>   ignore and let hardware to handle the target capability.
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
>  xen/drivers/vpci/vpci.c    | 100 +++++++++++++++++++++++++++++++++++--
>  xen/include/xen/pci_regs.h |   5 +-
>  2 files changed, 100 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 60e7654ec377..2d4794ff3dea 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -176,6 +176,98 @@ static int vpci_capability_hide(struct pci_dev *pdev, unsigned int cap)
>      return 0;
>  }
>  
> +static struct vpci_register *vpci_get_previous_ext_cap_register(
> +    struct vpci *vpci, unsigned int offset)
> +{
> +    uint32_t header;
> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> +    struct vpci_register *r;
> +
> +    if ( offset <= PCI_CFG_SPACE_SIZE )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }
> +
> +    r = vpci_get_register(vpci, pos, 4);
> +    if ( !r )
> +        return NULL;
> +
> +    header = (uint32_t)(uintptr_t)r->private;
> +    pos = PCI_EXT_CAP_NEXT(header);
> +    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
> +    {
> +        r = vpci_get_register(vpci, pos, 4);
> +        if ( !r )
> +            return NULL;
> +        header = (uint32_t)(uintptr_t)r->private;
> +        pos = PCI_EXT_CAP_NEXT(header);
> +    }
> +
> +    if ( pos <= PCI_CFG_SPACE_SIZE )
> +        return NULL;

Same comment as in the previous patch, I think the proposed for loop
there can also be used here to reduce a bit the code size (and unify
the return paths).

> +
> +    return r;
> +}
> +
> +static int vpci_ext_capability_hide(struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    struct vpci_register *rm, *prev_r;

s/rm/r/

> +    struct vpci *vpci = pdev->vpci;
> +    uint32_t header, pre_header;
> +
> +    if ( !offset )

I think you want offset < PCI_CFG_SPACE_SIZE here?

> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    rm = vpci_get_register(vpci, offset, 4);
> +    if ( !rm )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    header = (uint32_t)(uintptr_t)rm->private;
> +    if ( offset == PCI_CFG_SPACE_SIZE )
> +    {
> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
> +            rm->private = (void *)(uintptr_t)0;
> +        else
> +            /*
> +             * If this case removes target capability of position 0x100U, then
> +             * it needs to move the next capability to be in position 0x100U,
> +             * that would cause the offset of next capability in vpci different
> +             * from the hardware, then cause error accesses, so here chooses to
> +             * set the capability ID part to be zero.

/*
 * The first extended capability (0x100) cannot be removed from the linked
 * list, so instead mask its capability ID to return 0 and force OSes
 * to skip it.
 */

Is simpler IMO and conveys the same message.

> +             */
> +            rm->private = (void *)(uintptr_t)(header &
> +                                              ~PCI_EXT_CAP_ID(header));
> +
> +        spin_unlock(&vpci->lock);
> +        return 0;
> +    }
> +
> +    prev_r = vpci_get_previous_ext_cap_register(vpci, offset);
> +    if ( !prev_r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    pre_header = (uint32_t)(uintptr_t)prev_r->private;
> +    prev_r->private = (void *)(uintptr_t)((pre_header &
> +                                           ~PCI_EXT_CAP_NEXT_MASK) |
> +                                          (header & PCI_EXT_CAP_NEXT_MASK));

No strong opinion (and your code is correct), but it might be easier
to read as:

pre_header &= ~PCI_EXT_CAP_NEXT_MASK;
pre_header |= header & PCI_EXT_CAP_NEXT_MASK;
prev_r->private = (void *)(uintptr_t)pre_header;

It's still tree lines of code at the end.  I would also add a newline
to separate from the removal of rm.

> +    list_del(&rm->node);
> +    spin_unlock(&vpci->lock);
> +    xfree(rm);

Newline before the return preferably.

> +    return 0;
> +}
> +
>  static int vpci_init_capabilities(struct pci_dev *pdev)
>  {
>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
> @@ -209,11 +301,11 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
>                     pdev->domain, &pdev->sbdf,
>                     is_ext ? "extended" : "legacy", cap);
>              if ( !is_ext )
> -            {
>                  rc = vpci_capability_hide(pdev, cap);
> -                if ( rc )
> -                    return rc;
> -            }
> +            else
> +                rc = vpci_ext_capability_hide(pdev, cap);
> +            if ( rc )
> +                return rc;

Could the code in the previous patch be:

if ( !is_ext )
    rc = vpci_capability_hide(pdev, cap);

if ( rc )
    return rc;

So that your introduction here is simpler?

Thanks, Roger.

