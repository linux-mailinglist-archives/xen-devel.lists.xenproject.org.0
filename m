Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEDBB22C72
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078882.1439918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrOy-0008U1-MB; Tue, 12 Aug 2025 15:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078882.1439918; Tue, 12 Aug 2025 15:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrOy-0008Sd-JZ; Tue, 12 Aug 2025 15:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1078882;
 Tue, 12 Aug 2025 15:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x9jM=2Y=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulrOx-0008SX-E2
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:59:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409cacc8-7795-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 17:58:56 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-459e20ec1d9so55359975e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 08:58:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458bb04c612sm420392615e9.0.2025.08.12.08.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 08:58:55 -0700 (PDT)
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
X-Inumbo-ID: 409cacc8-7795-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755014336; x=1755619136; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yycMG6mCj0ldKenMLZbBeADpGTYSV3x7QETp1yXHNO8=;
        b=cYEtMPeKAEKm8GoLRX0k5wPPeVQiYO1CzfOUC7zNkzlEldhIFonEhbYWT6k5boa6hB
         2/IMjQzNQuNqd0q5BnShKlDlUbr5/e408NUldp3EmocBIbw5nSFNePSVRtC6BqlzHsp6
         0CG2LHCgecwrSmN2A11y0fR/AvMQkG8vV/L5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755014336; x=1755619136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yycMG6mCj0ldKenMLZbBeADpGTYSV3x7QETp1yXHNO8=;
        b=RImUYd55wL6SHMn2jmIqsW6ykYdqwwLGDDL1iyTi2d9HJy6Tl9UYITPJIeIgLx0ni6
         lMUSfM0x/zFrUmMIF5qQFPUhVtPadFdvRlkeGZSstxCUtlSQUYQu1F5Ikz4dK8tuR1oE
         2hvi9jiOaPaP+6ts9L/S4m2KdfMz4Lt5CK35lpsfD6jZSOXkUoLzGC6xd5Z7DQuilojs
         TkXjsISLGd4AhkKHfbHZuqsQkHMh+a+IWYykoNElbAyHQ3c6gU/DQWUujipEmLUPUB3w
         FjgNr4BKspBNS6JNptPrwkz7Vp+QTBazKgDch0csLVagEhxH3ACJM53aDPeCqbaJCRpN
         F7lg==
X-Gm-Message-State: AOJu0YyIf7peTcxWFVbqNr1MfUE5hFyTargs1vaFmDXM+SnzAFuwEiMS
	oqBUkbRuy1TRqKy53wnk2wr2B3KkDD1GnSmnWJl1BVU4hOkzhwaxIQ0y2KytBK5pR8a0x2+dqgJ
	pj6bA
X-Gm-Gg: ASbGnctk6R51lgQC8GEbvyMgqOntUgp5xiBXn5KYtmQnnCxDC3yITzfBIV31okmbiGL
	hIWzSSq6uHHCjKspCI9U2AWs3C/vwfVj5rLYoLUNLon15h0oUf7hoJGsqAvumRkP2ObwkfVDz+c
	9NNeKZztpCMbt8GA1bbVE3cXhbyLE9qk1kEHZbAaBVz2MR85+F+5mVPHydyflo913qKIT9xRSOX
	cbteVhxfs1dMY5IfXdR5AsiqMvblbwlPJconZ4TiTVEK/147ydDGkZ5dFoZS5gczuhR/RUUv2Lg
	nbOH5dDrOvzJlJJ7xzGsAcULdawjS/VjuHfbb2CvLGfHSnnBxrS0egeQa3rqMgw29YJ8xfWEtc+
	l/bUNW1cNE+Nuy4WPKoYkeAUM93kwdGitJG9jRj04Mhg8s3/0/4Ek9uZy937RN/r76A==
X-Google-Smtp-Source: AGHT+IFwnON6EJ2B5a3gHM3KQB6HBgO8doM4EDbOTF5V6UJR9fAeOPbeTkrdv7Q6H/JknY7qbWq7KQ==
X-Received: by 2002:a05:600c:4d02:b0:456:25aa:e9b0 with SMTP id 5b1f17b1804b1-45a15d9ea2amr1677745e9.16.1755014336075;
        Tue, 12 Aug 2025 08:58:56 -0700 (PDT)
Date: Tue, 12 Aug 2025 17:58:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci/msix: conditionally invoke vpci_make_msix_hole
Message-ID: <aJtkvsc7qlMCfLwc@macbook.local>
References: <20250812151744.460953-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812151744.460953-1-stewart.hildebrand@amd.com>

On Tue, Aug 12, 2025 at 11:17:42AM -0400, Stewart Hildebrand wrote:
> A hotplugged PCI device may be added uninitialized. In particular,
> memory decoding may be disabled and the BARs may be zeroed. In this
> case, the BARs will not be mapped in p2m. However, currently
> vpci_make_msix_hole is called unconditionally in init_msix, and the
> initialization fails in this case:
> 
> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
> 
> vpci_make_msix_hole should only be called if the BARs containing the
> MSI-X/PBA tables are mapped in p2m.
> 
> Take the opportunity to fix a typo in the preceding comment.
> 
> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  xen/drivers/vpci/msix.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 54a5070733aa..39d1c45bd296 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -705,10 +705,16 @@ static int cf_check init_msix(struct pci_dev *pdev)
>  
>      /*
>       * vPCI header initialization will have mapped the whole BAR into the
> -     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
> +     * p2m, as MSI-X capability was not yet initialized.  Carve a hole for
>       * the MSI-X table here, so that Xen can trap accesses.
>       */
> -    return vpci_make_msix_hole(pdev);
> +    if ( pdev->vpci->header.bars[
> +             msix->tables[VPCI_MSIX_TABLE] & PCI_MSIX_BIRMASK].enabled ||
> +         pdev->vpci->header.bars[
> +             msix->tables[VPCI_MSIX_PBA] & PCI_MSIX_BIRMASK].enabled )
> +        return vpci_make_msix_hole(pdev);

I think it might be better to place this checks inside of
vpci_make_msix_hole() itself, so that in case the guest moves the BAR
to an invalid position vpci_make_msix_hole() doesn't return error
either.

At the same time, you might want to introduce some helper to make this
less cumbersome, for example:

bool vmsix_table_bar_valid(const struct vpci *vpci, unsigned int nr)
{
    return vpci->header.bars[vpci->msix->tables[nr] &
                             PCI_MSIX_BIRMASK].enabled;
}

Note that if you adjust vpci_make_msix_hole() this way you will also
need to move the call in modify_decoding() so it happens strictly
after bar->enabled is set.

Thanks, Roger.

