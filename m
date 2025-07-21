Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251B9B0C868
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 18:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051632.1419995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt0T-0000Hz-N0; Mon, 21 Jul 2025 16:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051632.1419995; Mon, 21 Jul 2025 16:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udt0T-0000Fm-K1; Mon, 21 Jul 2025 16:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1051632;
 Mon, 21 Jul 2025 16:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udt0S-0000Fg-Be
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 16:04:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a4e4771-664c-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 18:04:43 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2037585f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 09:04:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca2c013sm10834880f8f.33.2025.07.21.09.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 09:04:42 -0700 (PDT)
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
X-Inumbo-ID: 6a4e4771-664c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753113883; x=1753718683; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOhohSuO819EjP2ihaLcJ15Wy8/rmlvKpaHIeiGa9PU=;
        b=fzjOkdQt7lruP3K642TyW8dz5xt/L+402ph34TilFOM3VAtE7O2jvVfBXMXpBabzLl
         ZyYjxznZOGsgtNIVJHfeNlu32GCfCY8QLCV6AvnpTGn+jDV/XxB4I0WdshFYdlq9WJ0O
         WD1ipIXf+py4HJgEeO0EP/D+AdGDVVo1e7CBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113883; x=1753718683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOhohSuO819EjP2ihaLcJ15Wy8/rmlvKpaHIeiGa9PU=;
        b=DTZMOE8/WEDExQgHGiXamipyUyzAsJ8ZezkYYUn/Pu9FfetHARYm0DScccSTjZ6WNU
         Gi11pcoQJ05yWW2ebhGinCcIyUvXYVCBOxCCU8ADgFpykCgm+iKfJd6/6uqWRWdNAVsD
         YXjQpMm1yy4ykHIqNcQu+KjtJo5kpOw3AnRUkQs1qFywDO3LuMxyzwc3rDgywlNhIxsw
         Z44X3cGum2TBoGCHQQpz0WWftTZGt92TfVSCw1RjoRJPULfcDvNEZfrrDk9ekO2J7hIG
         1dMyU8dJ4Pq6o8Qlvik9040x6Knu0dR6BD/vKhCh5T2q9epLNxanOGes5lWz23jneRhf
         Uc9w==
X-Gm-Message-State: AOJu0Yw5pTb0Szs+/cr4/yHEwPGFfy3UVAh8iWk4myNV58FodZtxhTKL
	29TD/gxktXqRIhr2y4A040K+95FoWxBVfDYkqx8zFLlmz77adID9k+wgXjFR0njxpo4=
X-Gm-Gg: ASbGncvHprtuPwuxMkXUsVJyaNmbGHlSjvuICV9K4wIP/DjsZM1T6yunOt27RFi3c/c
	oZxlecjqHI2mTjKZpS3c4e5aLW5Kbyy390iGEhp6MMY8ouLWKY8434SkqCTNq0PVUO/6A0crK48
	BqiK+705O8Qr+uwQZx06WgibkZoLslBzHSz5GA83BfS4lBD/uoLKtanWD0XSSNCIdxw5tSoc4i8
	ytdcDh0TPyHQvupH99chSLBNkkG9FlWenZ+SAQ3WtnLChP+BhQRiCjkV8sresTYKcuDMDq0T3to
	UjV5XFGxAxp3CygQlX7MaTvxpx7bdDqC0SA24e5s0UlviiNAyukZXZ1ACs5JvOTRwZBeccCfbD9
	d8tsl6G1JKd5zGYa9UP3YBqo6eiF9EsXBIkwZZylxiizxMTw5VtrwgeNq8htgtqM6PA==
X-Google-Smtp-Source: AGHT+IGwB7LdUuSwwdtYqb3bKD/LFFj2E8Qqtp8ffTzTFZyX/KIaw0rX+cL0XrjH3XdMR1QzqrCStA==
X-Received: by 2002:a05:6000:40ca:b0:3a8:6262:e78 with SMTP id ffacd0b85a97d-3b60e513909mr14735444f8f.37.1753113882849;
        Mon, 21 Jul 2025 09:04:42 -0700 (PDT)
Date: Mon, 21 Jul 2025 18:04:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 4/8] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aH5lGXW19o4iD0sj@macbook.local>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704070803.314366-5-Jiqian.Chen@amd.com>

On Fri, Jul 04, 2025 at 03:07:59PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a extended capability of device, it
> just returns an error and vPCI gets disabled for the whole device.
> 
> So, add function to hide extended capability when initialization
> fails. And remove the failed extended capability handler from vpci
> extended capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> Comment left over for the situation that "capability in 0x100 can't be removed case"
> from Jan in last version, need Roger's input.
> 
> Jan:
> Can we rely on OSes recognizing ID 0 as "just skip"?
> Since the size isn't encoded in the header, there might be issues lurking here.

I think it's the best we can aim to do TBH, I don't see any other way
to workaround this.  Size is indeed not encoded, but the next
capability pointer doesn't need to know the size of the current
capability to fetch the next one.

> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> cc: Anthony PERARD <anthony.perard@vates.tech>
> cc: Michal Orzel <michal.orzel@amd.com>
> cc: Jan Beulich <jbeulich@suse.com>
> cc: Julien Grall <julien@xen.org>
> cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v6->v7 changes:
> * Change the pointer parameter of vpci_get_previous_ext_cap_register()
>   and vpci_ext_capability_hide() to be const.
> 
> v5->v6 changes:
> * Change to use for loop to compact code of vpci_get_previous_ext_cap_register().
> * Rename parameter rm to r in vpci_ext_capability_hide().
> * Change comment to describ the case that hide capability of position
>   0x100U.
> 
> v4->v5 changes:
> * Modify the hex digits of PCI_EXT_CAP_NEXT_MASK and PCI_EXT_CAP_NEXT to be low case.
> * Rename vpci_ext_capability_mask to vpci_ext_capability_hide.
> 
> v3->v4 changes:
> * Change definition of PCI_EXT_CAP_NEXT to be "#define PCI_EXT_CAP_NEXT(header)
>   (MASK_EXTR(header, PCI_EXT_CAP_NEXT_MASK) & 0xFFCU)" to avoid redundancy.
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
>  xen/drivers/vpci/vpci.c    | 88 ++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/pci_regs.h |  5 ++-
>  2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index a91c3d4a1415..8be4b53533a3 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -165,6 +165,92 @@ static int vpci_capability_hide(const struct pci_dev *pdev, unsigned int cap)
>      return 0;
>  }
>  
> +static struct vpci_register *vpci_get_previous_ext_cap_register(
> +    const struct vpci *vpci, unsigned int offset)
> +{
> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> +    struct vpci_register *r;
> +
> +    if ( offset <= PCI_CFG_SPACE_SIZE )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }
> +
> +    for ( r = vpci_get_register(vpci, pos, 4); r;
> +          r = pos > PCI_CFG_SPACE_SIZE ? vpci_get_register(vpci, pos, 4)
> +                                       : NULL )
> +    {
> +        uint32_t header = (uint32_t)(uintptr_t)r->private;
> +
> +        ASSERT(header == (uintptr_t)r->private);
> +
> +        pos = PCI_EXT_CAP_NEXT(header);
> +        if ( pos == offset )
> +            break;
> +    }
> +
> +    return r;
> +}
> +
> +static int vpci_ext_capability_hide(
> +    const struct pci_dev *pdev, unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    struct vpci_register *r, *prev_r;
> +    struct vpci *vpci = pdev->vpci;
> +    uint32_t header, pre_header;
> +
> +    if ( offset < PCI_CFG_SPACE_SIZE )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return 0;
> +    }
> +
> +    spin_lock(&vpci->lock);
> +    r = vpci_get_register(vpci, offset, 4);
> +    if ( !r )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return -ENODEV;
> +    }
> +
> +    header = (uint32_t)(uintptr_t)r->private;
> +    if ( offset == PCI_CFG_SPACE_SIZE )
> +    {
> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
> +            r->private = (void *)(uintptr_t)0;
> +        else
> +            /*
> +             * The first extended capability (0x100) can not be removed from
> +             * the linked list, so instead mask its capability ID to return 0
> +             * and force OSes to skip it.

s/and force/hopefully forcing/.  I think that's the best Xen can
possibly do in this situation.  Unless someone has a more reliable
idea.

With that adjusted:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

