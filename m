Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57E21B89D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 16:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jttzr-0005af-Ad; Fri, 10 Jul 2020 14:27:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Va4v=AV=kernel.org=ardb@srs-us1.protection.inumbo.net>)
 id 1jttzq-0005aa-1G
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 14:27:26 +0000
X-Inumbo-ID: 7995c356-c2b9-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7995c356-c2b9-11ea-bb8b-bc764e2007e4;
 Fri, 10 Jul 2020 14:27:25 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFAEF207D0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594391245;
 bh=z5GS7bzW3vt89ODcDbxTwcqTDUKbrhtLbUgZN/aPJks=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=udoNZF8P0ADm4fqn4Qy5x9C2vHCV2p9r+Ns+aU2CoUVQCPkWqe/5EBJWiz/+wZ+cB
 ex+pS3L2z+DH2RCdK6ZdxCS5z+5yAfPJTi10+K61d8UR22uyLQCnmMaVnZGFU6P9C/
 uuafWvzXw3P/2xm2EvwMJq+xrmLFHHZ/dRnwr/yQ=
Received: by mail-oo1-f50.google.com with SMTP id a9so1030315oof.12
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2020 07:27:24 -0700 (PDT)
X-Gm-Message-State: AOAM532Lxn4znYrbVkwesVLtQXrQwbgrdfeK+bhcaunVq4HxoFdrMK4K
 3OUvAPkFmLIX5OCeUkMfW/TmorB3M1Vc7KV1wVE=
X-Google-Smtp-Source: ABdhPJz6+EdbHPDvR54y8i1lkJirNkR+7jQgNft2XWsMwOMmyjZqITES3V6nwxYUU7/dFIw3al47o4ejMuE4Cv4kjXk=
X-Received: by 2002:a4a:b34b:: with SMTP id n11mr59771293ooo.41.1594391244224; 
 Fri, 10 Jul 2020 07:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200710142253.28070-1-jgross@suse.com>
In-Reply-To: <20200710142253.28070-1-jgross@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jul 2020 17:27:13 +0300
X-Gmail-Original-Message-ID: <CAMj1kXEdm8MrdWVLO0w_-LJLvpiUURHhazv4-B39L1Bbk8kqFw@mail.gmail.com>
Message-ID: <CAMj1kXEdm8MrdWVLO0w_-LJLvpiUURHhazv4-B39L1Bbk8kqFw@mail.gmail.com>
Subject: Re: [PATCH v2] efi: avoid error message when booting under Xen
To: Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Peter Jones <pjones@redhat.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 10 Jul 2020 at 17:24, Juergen Gross <jgross@suse.com> wrote:
>
> efifb_probe() will issue an error message in case the kernel is booted
> as Xen dom0 from UEFI as EFI_MEMMAP won't be set in this case. Avoid
> that message by calling efi_mem_desc_lookup() only if EFI_MEMMAP is set.
>
> Fixes: 38ac0287b7f4 ("fbdev/efifb: Honour UEFI memory map attributes when mapping the FB")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/video/fbdev/efifb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 65491ae74808..e57c00824965 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -453,7 +453,7 @@ static int efifb_probe(struct platform_device *dev)
>         info->apertures->ranges[0].base = efifb_fix.smem_start;
>         info->apertures->ranges[0].size = size_remap;
>
> -       if (efi_enabled(EFI_BOOT) &&
> +       if (efi_enabled(EFI_MEMMAP) &&
>             !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
>                 if ((efifb_fix.smem_start + efifb_fix.smem_len) >
>                     (md.phys_addr + (md.num_pages << EFI_PAGE_SHIFT))) {
> --
> 2.26.2
>

