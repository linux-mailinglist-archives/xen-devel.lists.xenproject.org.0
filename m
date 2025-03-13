Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219FA5FE85
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913245.1319345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmfZ-0001X8-U2; Thu, 13 Mar 2025 17:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913245.1319345; Thu, 13 Mar 2025 17:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsmfZ-0001VQ-RB; Thu, 13 Mar 2025 17:48:33 +0000
Received: by outflank-mailman (input) for mailman id 913245;
 Thu, 13 Mar 2025 17:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tsmfY-0001VI-Hl
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:48:32 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e13a806-0033-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 18:48:27 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-224191d92e4so27455545ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:48:27 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bbe4f2sm16134035ad.181.2025.03.13.10.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:48:25 -0700 (PDT)
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
X-Inumbo-ID: 5e13a806-0033-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741888106; x=1742492906; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c28r83trvnYT/Cb/CC+0tikVj+EyqzWTZ3CA0iA9eAw=;
        b=jDyyEPRBsR+z0GL8vOAVbnpKjD3+wy/pIiLkkC06gnbc6TY/bXhtEw/yXKadXx3QVh
         aiVkH3rZqvX8LPH6WcqfMSXmRwS1w4bm10873IdGEL5uBvjj5VtKKYR92nbQQouXgPoY
         4bFAr8GakSmgYDXqaO4K9UH4YH+WqMd5Nq6m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741888106; x=1742492906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c28r83trvnYT/Cb/CC+0tikVj+EyqzWTZ3CA0iA9eAw=;
        b=imqsiOaRYmisdEze52wIag3yXGcTrpWlqh6cYyXUh6FrM+F8lumiuG2q3QwaZiyPUB
         6qVrxYLNem9mKCPAYDpSY+Csrz95N1DC3FdrrrLBPYn+fCpNRqzRJK4nReKDLsXhCWe5
         vA0DNBh35uZY/ahwSjKGRK5Vu02bP1ogoUnlr5LvU8mEPGrrAmngq4TrhlgrxEr4GhRH
         9lOc+xJEpE7RJexF581i1TNr68l1feK+j7dI2ajpEYbQB0dTIQwDr4OQl6MNMHbZ9JJa
         JmTENdhVcgnxJNNVTSVKCru8VHFNC0N2/DE4+KTnjEjrrSRqjfXU7v2sITy259r7bFWw
         sBmg==
X-Gm-Message-State: AOJu0YzS3rCr1Fd8dilGzzD8YRi1GjiucdFIft8GLl1uOSkcSXvqD7Ou
	HTG/eCtsAvIBwpGM8nugbjH2RU1nOrAXVWDEtm8X3DcmjN1haSHHUV3OmKqpfu6+C9Lvq0ijcZA
	v
X-Gm-Gg: ASbGncvp6hRckFfplVWltVArcTK1jvK6cASXwkIepGA+cacFQV0N5V51Qwx/Ek6IYvg
	LWMxkm44TvwWloXNXbYAkpm/Pf4emZR6JU5jaCKggYE4bwklS9PcDCcXhO0ZgnZyAOuG1M93xk8
	5WNW6z01A8pwM6phYJZwuFhXXCbnHIESojctuzpcB0wOaqDSPZSF5L6GyCCjCD7OuMyxKY3UIkg
	6TAZvOJm9I9Zx1ZmDX5/eu66NSbwRxZQ8AQVBAWplV0mNp0jlakpFWFx2Sqrur6kxS/5TOSmoPG
	h+fj49EZx0z31bxDj6ftk2deT/b+Oe255wjadvl0ukjTORfy2w==
X-Google-Smtp-Source: AGHT+IFxuc8C6h7UkNwBFRuP/q70f8Z187tuV2czoSEFxh2W05tG/2VMW1X3c8BcLh5Iycj/F++fOQ==
X-Received: by 2002:a17:902:cf07:b0:223:f408:c3f8 with SMTP id d9443c01a7336-225dd866bfemr5696935ad.14.1741888106386;
        Thu, 13 Mar 2025 10:48:26 -0700 (PDT)
Date: Thu, 13 Mar 2025 18:48:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
Message-ID: <Z9MaZVMtI86eAmDJ@macbook.local>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312195019.382926-1-stewart.hildebrand@amd.com>

On Wed, Mar 12, 2025 at 03:50:17PM -0400, Stewart Hildebrand wrote:
> Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
> initialized the BAR to a bad address, Linux will try to write a new
> address to the BAR without disabling memory decoding. Allow the write
> by updating p2m right away in the vPCI BAR write handler.

IIRC it's only 32bit BARs that Linux will attempt to reposition
without toggling memory decoding off.  For 64bit BARs it will in
general (unless pci_dev->mmio_always_on is set) toggle memory decoding
off and then update the BAR registers.

> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/197
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> RFC: Currently the deferred mapping machinery supports only map or
>      unmap, not both. It might be better to rework the mapping machinery
>      to support unmap-then-map operations, but please let me know your
>      thoughts.
> RFC: This patch has not yet made an attempt to distinguish between
>      32-bit and 64-bit writes. It probably should.
> ---
>  xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ef6c965c081c..66adb2183cfe 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -173,7 +173,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>          ASSERT_UNREACHABLE();
>  }
>  
> -bool vpci_process_pending(struct vcpu *v)
> +static bool process_pending(struct vcpu *v, bool need_lock)
>  {
>      struct pci_dev *pdev = v->vpci.pdev;
>      struct vpci_header *header = NULL;
> @@ -182,12 +182,14 @@ bool vpci_process_pending(struct vcpu *v)
>      if ( !pdev )
>          return false;
>  
> -    read_lock(&v->domain->pci_lock);
> +    if ( need_lock )
> +        read_lock(&v->domain->pci_lock);

The addition of need_lock would better be done in a pre-patch.

>  
>      if ( !pdev->vpci || (v->domain != pdev->domain) )
>      {
>          v->vpci.pdev = NULL;
> -        read_unlock(&v->domain->pci_lock);
> +        if ( need_lock )
> +            read_unlock(&v->domain->pci_lock);
>          return false;
>      }
>  
> @@ -209,17 +211,20 @@ bool vpci_process_pending(struct vcpu *v)
>  
>          if ( rc == -ERESTART )
>          {
> -            read_unlock(&v->domain->pci_lock);
> +            if ( need_lock )
> +                read_unlock(&v->domain->pci_lock);
>              return true;
>          }
>  
>          if ( rc )
>          {
> -            spin_lock(&pdev->vpci->lock);
> +            if ( need_lock )
> +                spin_lock(&pdev->vpci->lock);
>              /* Disable memory decoding unconditionally on failure. */
>              modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
>                              false);
> -            spin_unlock(&pdev->vpci->lock);
> +            if ( need_lock )
> +                spin_unlock(&pdev->vpci->lock);
>  
>              /* Clean all the rangesets */
>              for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> @@ -228,7 +233,8 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              v->vpci.pdev = NULL;
>  
> -            read_unlock(&v->domain->pci_lock);
> +            if ( need_lock )
> +                read_unlock(&v->domain->pci_lock);
>  
>              if ( !is_hardware_domain(v->domain) )
>                  domain_crash(v->domain);
> @@ -238,15 +244,23 @@ bool vpci_process_pending(struct vcpu *v)
>      }
>      v->vpci.pdev = NULL;
>  
> -    spin_lock(&pdev->vpci->lock);
> +    if ( need_lock )
> +        spin_lock(&pdev->vpci->lock);
>      modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> -    spin_unlock(&pdev->vpci->lock);
> +    if ( need_lock )
> +        spin_unlock(&pdev->vpci->lock);
>  
> -    read_unlock(&v->domain->pci_lock);
> +    if ( need_lock )
> +        read_unlock(&v->domain->pci_lock);
>  
>      return false;
>  }
>  
> +bool vpci_process_pending(struct vcpu *v)
> +{
> +    return process_pending(v, true);
> +}
> +
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>                              uint16_t cmd)
>  {
> @@ -565,6 +579,8 @@ static void cf_check bar_write(
>  {
>      struct vpci_bar *bar = data;
>      bool hi = false;
> +    bool reenable = false;
> +    uint32_t cmd = 0;
>  
>      ASSERT(is_hardware_domain(pdev->domain));
>  
> @@ -585,10 +601,31 @@ static void cf_check bar_write(
>      {
>          /* If the value written is the current one avoid printing a warning. */
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> +        {
>              gprintk(XENLOG_WARNING,
> -                    "%pp: ignored BAR %zu write while mapped\n",
> +                    "%pp: allowing BAR %zu write while mapped\n",
>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);

If Xen now handles BARs writes with memory decoding enabled the
message can be removed.  It's only purpose was to signal this missing
handling.

> -        return;
> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
> +            reenable = true;
> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> +            /*
> +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
> +             * finish right away since the deferral machinery only supports
> +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
> +             * be better to defer the write-while-mapped case just like regular
> +             * BAR writes (but still only allow it for 32-bit BAR writes).
> +             */
> +            /* Disable memory decoding */
> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);

I think if the guest explicitly avoids toggling memory decoding Xen
should also to the same, and not touch the bit.

> +            /* Call process pending here to ensure P2M operations are done */
> +            while ( process_pending(current, false) )
> +            {
> +                /* Pre-empted, try again */
> +            }

I'm afraid this is not how I would expect this to be done.  We
explicitly do the p2m modifications in a deferred context to avoid
long running operations.  We should continue to do so to perform this
unmap + map operation.

I think you need to introduce a way to queue an operation that will do
a map + unmap in the deferred context processing, or signal that after
the currently queued operation finishes a new call to modify_bars()
should be issued.

It would be nice if we had a more generic way to queue guest vCPU p2m
(map and unmap) operations, but that's likely to require a much better
interface than what we currently have.

Thanks, Roger.

