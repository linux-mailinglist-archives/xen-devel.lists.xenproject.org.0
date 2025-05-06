Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D0AACAC5
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977512.1364496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL3C-0004tJ-8z; Tue, 06 May 2025 16:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977512.1364496; Tue, 06 May 2025 16:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCL3C-0004rn-6L; Tue, 06 May 2025 16:21:46 +0000
Received: by outflank-mailman (input) for mailman id 977512;
 Tue, 06 May 2025 16:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCL3A-0004rg-Po
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:21:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30557302-2a96-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 18:21:39 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a07a7b4ac7so2679339f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:21:39 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a0b05334e0sm2136442f8f.43.2025.05.06.09.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:21:38 -0700 (PDT)
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
X-Inumbo-ID: 30557302-2a96-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746548499; x=1747153299; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnWhjOjuuBbZCOL886FhNb6Zm1XdyugIsT8chr49ljo=;
        b=XaOZVj07rNnyvSTdAoquZvx+ejxdYS4CS6eF7K/Xe9LgYavXToasMHT+mDLgVuwRCv
         jP7o5jPb+Tc5z8Tdy1j/JsPu0rMEVRewLpyleldZ/6pxRUGgMnk2A3oPlBpBOD2wVJaF
         mC8T5z4e2GjgakhnSt7FgSsSCAgkx29jDs5oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548499; x=1747153299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnWhjOjuuBbZCOL886FhNb6Zm1XdyugIsT8chr49ljo=;
        b=BzVruX5/r9JML9/7WvgFGY/EvVsfgqhyXjzmLzlynOLnfJTSnNmiZNPZd4HH4IZxOI
         1YGhi6YKJIzk7I9DuckhSNCBtb8nT6cabJcGeXbfvNgU5bUXBJffQohvYRZt6046+P2g
         KuN8+9tC955Rg1wdx4kPL/emcCZfz4FYCkRGJyNq5QDoUgripEXpl9yGkivJcR+/Abwb
         x0v7tLuGOPNCnTTyBQ6cONJZ8+8EqJo29liL5WaR9dHP3clfeovTiqUIhkXNqbAICMDL
         tzXMrL/ggpmunoJEVqCfBeEMF4HbaEPnXPqvKJWPitUxkJp/FxNNFLYzF+qnrD5shmXu
         WqgQ==
X-Gm-Message-State: AOJu0YyjD3CERnftsfBoM6Lp5v7Znb7ciUwF7d3vRJbmxFIacs4nDs/m
	uqkehV64XvmKa7yRsK9PpyDadrbDEJ4ob/0+HLC7q246Ngv2uuymVMdrLqcj7ms=
X-Gm-Gg: ASbGnctYx4QCB7ff4kj0FIBqgBOtiPTkGblIVN6538RV+myKUD/nPLuGeObOeF5of8b
	w0qf9DjMP4m5f6FZep7WeElPaS50Q60NeyeuN5pmpvu4guPEdqIGW7VhqhUpTvmPcceKz8DfC30
	Yf31qEKC1/rzFPSu5s7a3dBz/t1TDi8UjtYUUzgbmuzidirqK5nF90hxFnXWvWb5UebV/fSLlf3
	b4Os6KsMxQw6Opba9oSYGB5IYfMC96eEE4ILCisV/eRsiF33zzEnPm91VQUIw7BmPdrde3C57Sk
	98akCYI7Bg+GxQ7zxR6yXqDxnlN87BIek4iItiVEcy6qPcOTKJ4=
X-Google-Smtp-Source: AGHT+IFEiTydh7SpgzZNe6gjYDiE7iWWuuKKsBq0GEnluKbQ0gq2IxKiNHXZCuapmmjhy+OXqVHscQ==
X-Received: by 2002:a5d:5f56:0:b0:3a0:85b5:463b with SMTP id ffacd0b85a97d-3a0b4a238f0mr55671f8f.48.1746548498871;
        Tue, 06 May 2025 09:21:38 -0700 (PDT)
Date: Tue, 6 May 2025 18:21:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v3 07/11] vpci: Hide extended capability when it fails to
 initialize
Message-ID: <aBo3EfiWJUyWnl_a@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-8-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421061903.1542652-8-Jiqian.Chen@amd.com>

On Mon, Apr 21, 2025 at 02:18:59PM +0800, Jiqian Chen wrote:
> When vpci fails to initialize a extended capability of device for dom0,
> it just return error instead of catching and processing exception. That
> makes the entire device unusable.
> 
> So, add new a function to hide extended capability when initialization
> fails. And remove the failed extended capability handler from vpci
> extended capability list.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
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
>  xen/drivers/vpci/vpci.c    | 79 ++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/pci_regs.h |  1 +
>  2 files changed, 80 insertions(+)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index f97c7cc460a0..8ff5169bdd18 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -183,6 +183,83 @@ static void vpci_capability_mask(struct pci_dev *pdev,
>      xfree(next_r);
>  }
>  
> +static struct vpci_register *vpci_get_previous_ext_cap_register
> +                (struct vpci *vpci, const unsigned int offset)
> +{
> +    uint32_t header;
> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
> +    struct vpci_register *r;
> +
> +    if ( offset <= PCI_CFG_SPACE_SIZE )
> +        return NULL;
> +
> +    r = vpci_get_register(vpci, pos, 4);
> +    ASSERT(r);
> +
> +    header = (uint32_t)(uintptr_t)r->private;
> +    pos = PCI_EXT_CAP_NEXT(header);
> +    while ( pos > PCI_CFG_SPACE_SIZE && pos != offset )
> +    {
> +        r = vpci_get_register(vpci, pos, 4);
> +        ASSERT(r);
> +        header = (uint32_t)(uintptr_t)r->private;
> +        pos = PCI_EXT_CAP_NEXT(header);
> +    }
> +
> +    if ( pos <= PCI_CFG_SPACE_SIZE )
> +        return NULL;
> +
> +    return r;
> +}
> +
> +static void vpci_ext_capability_mask(struct pci_dev *pdev,
> +                                     const unsigned int cap)
> +{
> +    const unsigned int offset = pci_find_ext_capability(pdev->sbdf, cap);
> +    struct vpci_register *rm, *prev_r;
> +    struct vpci *vpci = pdev->vpci;
> +    uint32_t header, pre_header;

Maybe sanity check that offset is correct?

> +    spin_lock(&vpci->lock);
> +    rm = vpci_get_register(vpci, offset, 4);
> +    if ( !rm )
> +    {
> +        spin_unlock(&vpci->lock);
> +        return;
> +    }
> +
> +    header = (uint32_t)(uintptr_t)rm->private;
> +    if ( offset == PCI_CFG_SPACE_SIZE )
> +    {
> +        if ( PCI_EXT_CAP_NEXT(header) <= PCI_CFG_SPACE_SIZE )
> +            rm->private = (void *)(uintptr_t)0;
> +        else
> +            /*
> +             * Else case needs to remove the capability in position 0x100U and
> +             * moves the next capability to be in position 0x100U, that would
> +             * cause the offset of next capability in vpci different from the
> +             * hardware, then cause error accesses, so just ignore it here and
> +             * hope hardware would handle the capability well.
> +            */
> +            printk(XENLOG_ERR "%pd %pp: ext cap %u is first cap, can't mask it\n",
> +                   pdev->domain, &pdev->sbdf, cap);

In this case, could you maybe replace just the capability ID part of
the header to return 0?  That will likely cause the OS to continue
scanning the list, while ID 0 won't match which any known
capability.

Thanks, Roger.

