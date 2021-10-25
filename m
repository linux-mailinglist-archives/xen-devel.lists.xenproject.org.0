Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C16439654
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 14:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215795.375165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mez4k-0005UC-Rg; Mon, 25 Oct 2021 12:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215795.375165; Mon, 25 Oct 2021 12:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mez4k-0005SP-OU; Mon, 25 Oct 2021 12:27:38 +0000
Received: by outflank-mailman (input) for mailman id 215795;
 Mon, 25 Oct 2021 12:27:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eqc=PN=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mez4j-0005SJ-5U
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 12:27:37 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29238a89-4d51-48a1-ace4-07e9ea9cb8f0;
 Mon, 25 Oct 2021 12:27:36 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bq11so9556053lfb.10
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 05:27:36 -0700 (PDT)
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
X-Inumbo-ID: 29238a89-4d51-48a1-ace4-07e9ea9cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWOZ10wj2v8xGCTkB4tkDGPE0ipYkZlGVNgK1wjlSKw=;
        b=iBb9cr5DvW2ttDUCpykmiohztN7R33oVN5Uzv47denlfZ3S10nnPCRIV2oR41D4oJ0
         fiUKRMDKPj8poOJOTAOwVcKq1vp/Nrru9Ooj7EMpncTk/tFPFRCdPajifeZsNkj5CUaw
         gPauzwfypIk/JVBtjptq7HigkNPjqdtii4W6RH4gOfJgW0pxzivUA6A8PX8SycbGKUTJ
         hqUhvnIhXq23gFKmOsRKmIhS7uB4TVMHfiAih56j3hNZe94fut/JT4Vr8cSxOwrbK+ff
         znQ5Tfs33QGMbPfIgz9YHGJlpe1SyAEIonzkCeTjaizM/Ygq9anFaJUTFVOnuhsLc5qJ
         mbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWOZ10wj2v8xGCTkB4tkDGPE0ipYkZlGVNgK1wjlSKw=;
        b=A0LS6IUrlnicHkf3r9oTClZUL+a7Czt/4/80Q4wGmL71bf3l09gtrLGwLd40ajp0um
         AkrbIdIkStWKP9wisKjl3LVjWGBKWUHOyi4Hl4elTsgbezIlXLwIc1D/kUEXBcvAXcsz
         /mPGP4sXh9PwRxYSrQ8jCjLjvfF+sBZ3yXb6mJszzQKWStIdVUYdfZ5AIyYmrMXtfhvm
         y//S7iPNv39LfDSDHCZIMstW2cFUupL0QIlfA3stuaLUOheV+I5BUVjVw4q/qXeBctxB
         vjKQJ1hm7kpGVRo3EHwaeYIqvmZ9wU6UxxAjbtltp3+iRwfdXKONoeTdrPiIOZ/57Zy4
         kZ6w==
X-Gm-Message-State: AOAM5322M7OhfNcZnFMWrUAn46hYu2AKQZjb+qvT7XyPLbuJX9yUOipP
	WE6Fyqut19OKmvDp3qZ/J7O+9gTbWjKwQbqQ5wg=
X-Google-Smtp-Source: ABdhPJzKdoy+jz5VQV5Ihbb1TCNijRakZIFx6FMRizoKZTvmhjIQMJT/zQWj2ePGI5xnyqAUpbTaxMlQh/TKk/n205A=
X-Received: by 2002:a05:6512:3d89:: with SMTP id k9mr7771626lfv.359.1635164855150;
 Mon, 25 Oct 2021 05:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <90277228-cf14-0cfa-c95e-d42e7d533353@oderland.se> <20211025012503.33172-1-jandryuk@gmail.com>
In-Reply-To: <20211025012503.33172-1-jandryuk@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 25 Oct 2021 08:27:23 -0400
Message-ID: <CAKf6xptSbuj3VGxzed1uPx59cA_BRJY5FDHczX744rvnTHB8Lg@mail.gmail.com>
Subject: Re: [PATCH] PCI/MSI: Fix masking MSI/MSI-X on Xen PV
To: Josef Johansson <josef@oderland.se>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Bjorn Helgaas <helgaas@kernel.org>, 
	Juergen Gross <jgross@suse.com>, linux-pci@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 24, 2021 at 9:26 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> commit fcacdfbef5a1 ("PCI/MSI: Provide a new set of mask and unmask
> functions") introduce functions pci_msi_update_mask() and
> pci_msix_write_vector_ctrl() that is missing checks for
> pci_msi_ignore_mask that exists in commit 446a98b19fd6 ("PCI/MSI: Use
> new mask/unmask functions").  The checks are in place at the high level
> __pci_msi_mask_desc()/__pci_msi_unmask_desc(), but some functions call
> directly to the helpers.
>
> Push the pci_msi_ignore_mask check down to the functions that make
> the actual writes.  This keeps the logic local to the writes that need
> to be bypassed.
>
> With Xen PV, the hypervisor is responsible for masking and unmasking the
> interrupts, which pci_msi_ignore_mask is used to indicate.
>
> This change avoids lockups in amdgpu drivers under Xen during boot.
>
> Fixes: commit 446a98b19fd6 ("PCI/MSI: Use new mask/unmask functions")
> Reported-by: Josef Johansson <josef@oderland.se>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

I should have written that this is untested.  If this is the desired
approach, Josef should test that it solves his boot hangs.

Regards,
Jason

