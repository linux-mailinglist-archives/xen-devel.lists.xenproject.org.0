Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3329B3B8B8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101095.1454292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwMu-0005i0-LD; Fri, 29 Aug 2025 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101095.1454292; Fri, 29 Aug 2025 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwMu-0005ex-IF; Fri, 29 Aug 2025 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 1101095;
 Fri, 29 Aug 2025 10:30:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urwMt-0005OQ-Fi
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:30:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e727f39-84c3-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 12:30:01 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso11635295e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:30:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e8879cesm31910185e9.12.2025.08.29.03.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:30:00 -0700 (PDT)
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
X-Inumbo-ID: 1e727f39-84c3-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756463401; x=1757068201; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxBWRwmDn7a/yzlbS6M3NIL8naXz1opl1I7teYfXxZ4=;
        b=UU8pgKsVWGkATDSB9JgWe8JwJ2halYcn/iZH1IiLS+2XLPB51BCd1l0T+c8+HclLNd
         RbzrNQiNXmE+32qSggy/I4bwr86jOsLMHl+ACbTEAZJ0xRfiljvUXZhUkIRtAltxvE5O
         StPCqhjzGgKJ3QiO1IoavUgrWW8HjIDfauzi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756463401; x=1757068201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxBWRwmDn7a/yzlbS6M3NIL8naXz1opl1I7teYfXxZ4=;
        b=o2hY1yDfZe1y3/OSvksibFOageVb4sYZQyNkzVRHwrwgTBfWZIOBB3zo6ZKZYFRf7r
         tShTF4lk/B+sd4hyGf5wuU4qB1XRKQkZ7xzXFTqawd2bA2uVnYP73qL23PZNPSxxYfVh
         H14tNadkAordqeFdV+rZUfhLn24ENaxw1Mga9WRD8O7tpkrg8BkV2P7xZrmBpVjh472D
         EzQ2CUQxRW2DGDhMdXtEkqYCihhAz8KBavZeML4V4egxOuAFkOXrAR/8h10mAY0j1KNv
         Bb9T3kpxWGJ7l30OsRPnaNWBzXUI/92hbPWZsIwKKP9DHd58JmR4fgl8g+3AZDIdhaxJ
         Rv4g==
X-Gm-Message-State: AOJu0YzVeP2IUicMQ7wEiBwW1SABopY7C1ZWAJHm+AE0/nt4FVsdFyF6
	fxFDdhjggzxEIBB7/yX9wJzbGOOfeCOkhmHs552b8k72FFdXNBxgiPdJA7HGR8CSVdI=
X-Gm-Gg: ASbGnctuPHDRuhQN83gwz81LLvGq4ALq+BDy3aA20BZXKU6zHye1gRe1irkqZVegXCO
	BrjPGl5Tt4yBsQlVJH8E6FIly4KGwqEEEm2//vnlwdFipzyUy46Hqc5vk/fmTp2SHR+M6ddgLhA
	jxq1tp/I+0wvnG1LJEoHd4SFd8d16TGw5VePR8iLEcOoxgFuKpphxlvNKJZQU9yFmUmq22RiEsD
	Itf2Ut80KE5SSMuY97UZNIRZh14XlCBtGeQkEv5smRQC6CBosECnWzIaI5FHStwqZk+A+D3XLYq
	2OTuZpCPweXLXG/VBMdvUWwm9n1sAEywFXfxn+KsndU6GtuEdANogmF+4z0ICcxsQbv+nxLLCaI
	8HirRgt5TwxCKlr+zzokXMljswEyH4UoEdbJwFxWGyOREopgN5qEQV42IquDXdqXyQw==
X-Google-Smtp-Source: AGHT+IHKw8H0jNLHj6015SQ0KjUj+22ds2GJg5kWIoxn6dGNWq2PIv+9XKdogI5BYdPOWBMLbnh7TA==
X-Received: by 2002:a05:600c:1e8a:b0:459:ddad:a3a3 with SMTP id 5b1f17b1804b1-45b517ddbd5mr243005005e9.25.1756463400580;
        Fri, 29 Aug 2025 03:30:00 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:29:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v11 4/5] vpci/msi: Implement cleanup function for MSI
Message-ID: <aLGBJ0KSlt75BTKA@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-5-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-5-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:36PM +0800, Jiqian Chen wrote:
> When MSI initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement MSI cleanup hook that will be called to
> cleanup MSI related handlers and free it's associated data when
> initialization fails.
> 
> Since cleanup function of MSI is implemented, delete the open-code
> in vpci_deassign_device().
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v10->v11 changes:
> * Add hide paratemer to cleanup_msi().
> * Check hide, if false return directly instead of letting ctrl RO.
> * Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
> * Remove Roger's Reviewed-by since patch change.
> 
> v9->v10 changes:
> No.
> 
> v8->v9 changes:
> * Add Roger's Reviewed-by.
> 
> v7->v8 changes:
> * Add a comment to describe why "-2" in cleanup_msi().
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msi() to be const.
> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>   directly, instead try to free msi and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>   init_msi() since we need that every handler realize that msi is NULL
>   when msi is free but handlers are still in there.
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
> 
> v3->v4 changes:
> * Change function name from fini_msi() to cleanup_msi().
> * Remove unnecessary comment.
> * Change to use XFREE to free vpci->msi.
> 
> v2->v3 changes:
> * Remove all fail path, and use fini_msi() hook instead.
> * Change the method to calculating the size of msi registers.
> 
> v1->v2 changes:
> * Added a new function fini_msi to free all MSI resources instead of using an array
>   to record registered registers.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msi.c  | 49 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c |  1 -
>  2 files changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index c3eba4e14870..6ab45b9ba655 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,53 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    unsigned int end;
> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !msi_pos || !vpci->msi )
> +        return 0;
> +
> +    if ( vpci->msi->masking )
> +        end = msi_pending_bits_reg(msi_pos, vpci->msi->address64);
> +    else
> +        /*
> +         * "-2" here is to cut the reserved 2 bytes of Message Data when
> +         * there is no masking support.
> +         */
> +        end = msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;
> +
> +    rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +
> +    XFREE(vpci->msi);
> +
> +    if ( !hide )
> +        return 0;

Kind of the same comment as in the previous patch, for the non-hide
case there's likely no reason to perform the removal of the registers,
as the caller will take care of that.  The function could be
short-circuited earlier as:

if ( !hide )
{
    XFREE(vpci->msi);
    return 0;
}

Thanks, Roger.

