Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C498F675
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809812.1222339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQqt-0004wQ-7E; Thu, 03 Oct 2024 18:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809812.1222339; Thu, 03 Oct 2024 18:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQqt-0004uf-4S; Thu, 03 Oct 2024 18:47:03 +0000
Received: by outflank-mailman (input) for mailman id 809812;
 Thu, 03 Oct 2024 18:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swQqr-0004tB-NX
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:47:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df4592f7-81b7-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 20:46:59 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5398e33155fso1702747e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:46:59 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539a82a3890sm235298e87.216.2024.10.03.11.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:46:57 -0700 (PDT)
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
X-Inumbo-ID: df4592f7-81b7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981219; x=1728586019; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxNVqecRvkYD7Yjb7qO/AnPWEEM5Fp2WZf3IfrDzV2U=;
        b=lld8CNJ11A6LhqyGiAxmDt7hK7Lj2QyruMCwBjw8s+HQYlulP47fCFzBJtP51ZVU+r
         2mkc25H7BnZjovtRrqYN85RetIbpZd+gLf4zZPYkKW9Do0FLO8ukGFo7NVfqz1Q22llw
         +tlsjd7rx50jpHKw14Fs9hWlisY7mUHUkegzkHA+v0bUcx4S2w+TWfVClereP+ON7IA4
         DG7TbwBhJA7gLG3xc93d9Vh379ngkTW1PU8opGl9cmLrHxIfP/LnGAupqGw6UMZQBsfj
         uqkPj2gcdIQZG1e+aZWoSZxUH2t63ha5wtjDkeiHpFZlb9ES4qqHiX4LZjctWAjse5q4
         EGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981219; x=1728586019;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxNVqecRvkYD7Yjb7qO/AnPWEEM5Fp2WZf3IfrDzV2U=;
        b=PAYCbG9tUavscfU6dwHXxe/A9tJVvODveVeJO9ZIUoY4fsqg881B4XBsgubYcQg+0C
         1+dimQEMML1eZc4cxP/Bf/6AL8ZgAaX2ogXimb6anDGmPqEu0CNYGd/XM7pGU0cOcyjo
         SIv22tR5AU6PqawxzxvuUPhPs/EHGqfreF5HX3as1AOZdZwn63+TPAPbKNIEVFOSY7YD
         B1I+hRU2xtohOGMCsWVQx5RrCjoTUMtmjljilbJIJjhBh1w5O8aAohTIpcRGoOaLJsTu
         hDLJcDQRMDS1/CJJDWvPiudzwa1cF9iLQP3KscUnv+H1mutVnW9OQK/rjWghMLPdieKW
         p7ng==
X-Forwarded-Encrypted: i=1; AJvYcCVjBix1R7aKZ5L1oCpExxiWoiTTzgpgahg5+kmrTbPfEjkRUkWyFTjLiVJ+3iWCSXNFXX7moBHBKEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyctLGCy71TPpbzZO8xPXQNH9Ww3AxRYRLpAZ1v1elecK2atC6U
	m+NOX+XOrX/Cm+fdt3zM8J6pSEsn+YiRQa3Xx+OUzOOiL7aMfwvZ
X-Google-Smtp-Source: AGHT+IEDANPzn9Tbpg9Me56OPCcgs/2usC+PJjRqvZAj8AZFAClQd1shccGdZN2d1m+U1EFvic1mTg==
X-Received: by 2002:a05:6512:1591:b0:534:543e:1895 with SMTP id 2adb3069b0e04-539ab9e17aamr178407e87.39.1727981218692;
        Thu, 03 Oct 2024 11:46:58 -0700 (PDT)
Date: Thu, 3 Oct 2024 19:52:06 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org,
	paul@xen.org, edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PULL v1 0/5] Xen Queue
Message-ID: <Zv7ZxuDujOtgrs22@zapote>
References: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
 <CAFEAcA9tST+-mZTcdBtwVOeVmxnBDrO=VJBMj=C0iFw5GAojLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9tST+-mZTcdBtwVOeVmxnBDrO=VJBMj=C0iFw5GAojLw@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Thu, Oct 03, 2024 at 06:07:00PM +0100, Peter Maydell wrote:
> On Thu, 3 Oct 2024 at 15:31, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> >
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:
> >
> >   Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-03.for-upstream
> >
> > for you to fetch changes up to 507118c2a066b70e8069702c120461ad8c98ccd5:
> >
> >   hw/arm: xenpvh: Enable PCI for ARM PVH (2024-10-03 15:24:42 +0200)
> >
> > ----------------------------------------------------------------
> > Edgars Xen Queue.
> >
> > ----------------------------------------------------------------
> > Dr. David Alan Gilbert (1):
> >       hw/xen: Remove deadcode
> >
> > Edgar E. Iglesias (4):
> >       hw/xen: Expose handle_bufioreq in xen_register_ioreq
> >       hw/xen: xenpvh: Disable buffered IOREQs for ARM
> >       hw/xen: xenpvh: Add pci-intx-irq-base property
> >       hw/arm: xenpvh: Enable PCI for ARM PVH
> 
> Hi; this failed the tsan-build CI job:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/7986783747
> 
> ../hw/xen/xen-hvm-common.c:711:48: error: variable 'ioreq_pfn' is
> uninitialized when used here [-Werror,-Wuninitialized]
> trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
>                                        ^~~~~~~~~
> ../hw/xen/xen-hvm-common.c:667:24: note: initialize the variable
> 'ioreq_pfn' to silence this warning
> xen_pfn_t ioreq_pfn;
>                    ^
>                    = 0
>

Thanks Peter,

I had moved that trace call but forgot to remove the original line.
Will send a v2 PR.

Cheers,
Edgar

