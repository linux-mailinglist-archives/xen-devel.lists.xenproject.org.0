Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26594B3B9AA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 13:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101157.1454342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urww3-0004Y0-7m; Fri, 29 Aug 2025 11:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101157.1454342; Fri, 29 Aug 2025 11:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urww3-0004VP-4h; Fri, 29 Aug 2025 11:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1101157;
 Fri, 29 Aug 2025 11:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urww1-0004VF-Ur
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 11:06:21 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 306ef816-84c8-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 13:06:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso1466301f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 04:06:19 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf270fc496sm3019291f8f.1.2025.08.29.04.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 04:06:17 -0700 (PDT)
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
X-Inumbo-ID: 306ef816-84c8-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756465578; x=1757070378; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hcwRWB/9BpbjD3X6u70BXXhc1Td4AaYAR/fiojSuyjM=;
        b=p9z9L1LplN3Bv1sdmSPPKYJWGX9bbduGQ/5xDpVpgrfS8I50B77QGpvB44CaJLmBIq
         maV2vjyc44zQspzjA6uIQXhstK2T+iixdLFAfwRyA2gsyQX0yGFnvgDKHtAyfmEUjYwE
         FmE23cRqwxUfulI7xWkDsi4ZF7bBMPYFTkRoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465578; x=1757070378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcwRWB/9BpbjD3X6u70BXXhc1Td4AaYAR/fiojSuyjM=;
        b=VJCgwxOBqDSAbo2f5LQDHlhzgEelNCmCTcyrCXCtnTYnQDrvpr+AunlOjyrCN8v/OD
         ELaHrcBLQ9BSz8dA0AuPDpCd9llxMOqKWXuKl3zcMx6NQnOlgs11KQiIeG4Z7POmeFSD
         AHYIsFqNU4TN+1bLOyx1cjNWzlmI1Io/vEqty52lXDXhR2kzxjqyNYPXi7diayfHUJkk
         HbA2NLQtzOPimNaFt3qYAYvQIBYOD47YBhp/tI2P6Oki7BCro1Cwy8UzosoIF37eLd0O
         Xc5ouaJAfzADRFjDjZGab4nGCGMxN/F5qkPIjY0sTj/gHMgAfz3EzxAnrXqPrir3ZktQ
         beYg==
X-Gm-Message-State: AOJu0YyjoMwB+zytquLVfq2gI7T+/LxS4rz42Qkz9GexZwfgG8c0gXQh
	V62eNqOK+iYnHIFU75lueUlo5vkch7iNENRCQnIj41kCegsoMWFDzvOCOULADM4aJrs=
X-Gm-Gg: ASbGncvNAnE7Z6lB7U6wHwTVl9X0Z63WxBQptCd3guY0ZkmKe7iGAJX03Zc6Cf5Fdsm
	GqOzswF0m16tMauQwPo6eA0cjnxQbq+9xSwfGX2+GzirKJa0EwzWDMAZcPcyqwoFSSt6AaVwH16
	ZYEkcvGNu8bXfoUhMZ1sss+L9124Kx6oLAskpKZApKSzLNR9j+G6+UrWfht7H68B1mIjkhNv1J3
	ar7bH/AGXSzy5pFUl+DPrmVKOeFcE5f6HwgnMTLqpIU6Whaje7U/xoyqPF/k9XXS6OJeaN5Z0Ea
	YRa1yxm1Oip9EVRQADCqbjKWKhEmRtU3BTij0ygrZgntCQFTJy+8Qneqk/poOBwuA6PxOPPaNPq
	T42IYMIxOvLwuazCAB2/IHsnfb60owKLHNlsT7xY1Neusp3O5fbs+BLjvOoylpUUeFbRBh639LI
	rf
X-Google-Smtp-Source: AGHT+IGDOufDl8b/sjhWJqkpdy+KtFmYucEpA/05rTVM3xxg3VK4XCfrZN/5a/QkSteT1Wxny3ph7g==
X-Received: by 2002:adf:a155:0:b0:3ce:9872:fd3 with SMTP id ffacd0b85a97d-3ce987213dfmr2570104f8f.34.1756465578373;
        Fri, 29 Aug 2025 04:06:18 -0700 (PDT)
Date: Fri, 29 Aug 2025 13:06:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v11 5/5] vpci/msix: Implement cleanup function for MSI-X
Message-ID: <aLGJqMJH46neJYAy@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-6-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-6-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:37PM +0800, Jiqian Chen wrote:
> When MSI-X initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement MSI-X cleanup hook that will be called
> to cleanup MSI-X related handlers and free it's associated data when
> initialization fails.
> 
> Since cleanup function of MSI-X is implemented, delete the open-code
> in vpci_deassign_device().
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v10->v11 changes:
> * Move calling all cleanup hook in vpci_deassign_device() out of this patch.
> * Add hide parameter to cleanup_msix().
> * Check hide, if it is false, return directly instead of letting ctrl RO.
> 
> v9->v10 changes:
> * Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().
> 
> v8->v9 changes:
> * Modify commit message.
> * Call cleanup_msix() in vpci_deassign_device() to remove the open-code to cleanup msix datas.
> * In cleanup_msix(), move "list_del(&vpci->msix->next);" above for loop of iounmap msix tables.
> 
> v7->v8 changes:
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msix() to be const.
> * When vpci_remove_registers() in cleanup_msix() fails, not to return
>   directly, instead try to free msix and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msix in
>   init_msix() since we need that every handler realize that msix is NULL
>   when msix is freed but handlers are still in there.
> 
> v5->v6 changes:
> * Change the logic to add dummy handler when !vpci->msix in cleanup_msix().
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> 
> v3->v4 changes:
> * Change function name from fini_msix() to cleanup_msix().
> * Change to use XFREE to free vpci->msix.
> * In cleanup function, change the sequence of check and remove action according to
>   init_msix().
> 
> v2->v3 changes:
> * Remove unnecessary clean operations in fini_msix().
> 
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msix.c | 47 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c |  8 -------
>  2 files changed, 46 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..287aafda9157 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -655,6 +655,51 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static int cf_check cleanup_msix(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msix_pos = pdev->msix_pos;
> +
> +    if ( !msix_pos )
> +        return 0;

Like with the MSI capability, is it possible to get called and
pdev->msix_pos be 0?

I would also avoid the call to vpci_remove_registers() if !hide, I
think you can change the order of the cleanup, so it's:

if ( vpci->msix )
{
    list_del(&vpci->msix->next);
    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
        if ( vpci->msix->table[i] )
            iounmap(vpci->msix->table[i]);

    XFREE(vpci->msix);
}

if ( !hide )
    return 0;

rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
...

Thanks, Roger.

