Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB3ACED13
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 11:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006476.1385650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7Bm-0001yh-NT; Thu, 05 Jun 2025 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006476.1385650; Thu, 05 Jun 2025 09:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7Bm-0001vt-KM; Thu, 05 Jun 2025 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1006476;
 Thu, 05 Jun 2025 09:47:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIxA=YU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uN7Bk-0001vW-QH
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 09:47:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afef5e2-41f2-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 11:47:07 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so6609585e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 02:47:07 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5298a2c1esm1213479f8f.5.2025.06.05.02.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 02:47:06 -0700 (PDT)
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
X-Inumbo-ID: 0afef5e2-41f2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749116826; x=1749721626; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vfvPJ9Bsvm5B2vE0nOnqbArtmZ4FsoRPawu6lXG5IDk=;
        b=WyXrrNIGvkVtulGwytif/hrZ7u+P3sWueO3ia9v6/txSYPvPE9brpFzy9E0DFWV6kX
         bNvP2315HM6jl8QFMI97qCLYwgA5vqbYEl36SGeTQZaZRRxfHlSi7U/3ug01gshTgMSx
         /cNMkV5BGqGVjfkJOjXTeFc47W/P61ynHnMJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116826; x=1749721626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfvPJ9Bsvm5B2vE0nOnqbArtmZ4FsoRPawu6lXG5IDk=;
        b=wUS+9QufXE779odC/wjPoc6KtNRHk/ZXUiBDUQnQi75jOIHUluUGbDn9V6v29Z6lyr
         eDx/prS36iioXW/mKr/ARB3oLO5Wd29cArAx9QpaHEzo3SNPD/a8CLXDXY5lp5Y6CLJ0
         kDrWa9CvLrnPYvZ0znhHDQvKUBoHA64uHjlMES0dQ/PSkywSJCVNbdtmm99YZKWVOiGU
         aBY2SwZys/+jXRYsqzJD5wuvmyUdjn+pMZbdpec8j7VlcrXBiXhCO8HkaQXEhmxJH4Zt
         TECtsoKmGVaQb7S3MGSo7fL93mURu/qy42KvfECK2mB9UDmpYinbDbQsQ4znjTMmiM6/
         ob7A==
X-Gm-Message-State: AOJu0YygZpmHuZKqfud2ueBZtuccPn853nEtkRvwuC3JdMbXhtCs2wtb
	A3sEFhQFAU3qdKHHOInOLHFPtisKYgPwic5Jc5H4Cg+pY1g4Dw0poKAtvU38GmGj1tc=
X-Gm-Gg: ASbGncuFzqvVvQj5I35J109VrtQXNauS430gPsWzyFU4ati1x46dcJfVq2KcscheuF7
	q2XWxZzllpiEi9DllDc3FgnoecGMcoTDxMyBMw2OW0t3DQYdC+8eW+9n8iYKHxd240dAkYvnoZm
	IJ1bHuRVqE88x8XxTFaPRKJP1o5D/6VgAuttLzX9berfqoyaMCjJ5wVVoRddZe0mThlLnrYpT0I
	UQSmL263rg0pTbZjYT7HWDPLbA9rTLI8gawjj6qnTsspHCamoqRPXsVmbcqG804e+r3EbpiDGsA
	PAFNyjCZJ3fd+LrmjzmhbYeWzdG7ln5dhxHoRejsCkrMb3SZtrArEAptwA6QGaBXEO1ZjwhpVjl
	pCTcBrhqtqP7CyEgw7ZIsiIyM
X-Google-Smtp-Source: AGHT+IGAz5kwk+3PxUqTKML4pa957O7B6QvAB/51wR6XQCw64cvT940XOxaiaFZLo4xT4TttjXniLw==
X-Received: by 2002:a05:6000:2207:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a51d98e836mr5244419f8f.54.1749116826480;
        Thu, 05 Jun 2025 02:47:06 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:47:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/5] vpci: const-ify some pdev instances
Message-ID: <aEFnmVotuGhR4Ti0@macbook.local>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
 <20250531125405.268984-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250531125405.268984-2-stewart.hildebrand@amd.com>

On Sat, May 31, 2025 at 08:53:59AM -0400, Stewart Hildebrand wrote:
> Since 622bdd962822 ("vpci/header: handle p2m range sets per BAR"), a
> non-const pdev is no longer needed for error handling in
> vpci_process_pending(). Const-ify pdev in vpci_process_pending(),
> defer_map(), and struct vpci_vcpu.
> 
> Get rid of const-removal workaround in modify_bars().
> 
> Take the opportunity to remove an unused parameter in defer_map().
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One further simplification below.

> ---
> This is prerequisite for ("vpci: use separate rangeset for BAR
> unmapping") in order to call defer_map() with a const pdev.
> ---
>  xen/drivers/vpci/header.c | 16 ++++------------
>  xen/include/xen/vpci.h    |  2 +-
>  2 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1f48f2aac64e..e42c8efa2302 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -175,7 +175,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    struct pci_dev *pdev = v->vpci.pdev;
> +    const struct pci_dev *pdev = v->vpci.pdev;
>      struct vpci_header *header = NULL;
>      unsigned int i;
>  
> @@ -283,8 +283,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>      return rc;
>  }
>  
> -static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      uint16_t cmd, bool rom_only)
> +static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vcpu *curr = current;
>  
> @@ -308,7 +307,7 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct pci_dev *tmp, *dev = NULL;
> +    struct pci_dev *tmp;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i, j;
> @@ -450,11 +449,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  
>              if ( tmp == pdev )
>              {
> -                /*
> -                 * Need to store the device so it's not constified and defer_map
> -                 * can modify it in case of error.
> -                 */
> -                dev = tmp;
>                  if ( !rom_only )

You can now join this with the previous if, and reduce one level of
indentation:

if ( tmp == pdev && !rom_only )
    /* comment text */
    continue;

Thanks, Roger.

