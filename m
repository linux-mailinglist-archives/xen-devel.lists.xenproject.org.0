Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF0A89FD2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953978.1348349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gbN-0005Mj-JN; Tue, 15 Apr 2025 13:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953978.1348349; Tue, 15 Apr 2025 13:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4gbN-0005Js-G9; Tue, 15 Apr 2025 13:45:25 +0000
Received: by outflank-mailman (input) for mailman id 953978;
 Tue, 15 Apr 2025 13:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGoX=XB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4gbM-0004pm-Rk
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:45:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1afc2d8-19ff-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:45:24 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso39945945e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 06:45:24 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43f233a2f71sm208580835e9.15.2025.04.15.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 06:45:23 -0700 (PDT)
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
X-Inumbo-ID: e1afc2d8-19ff-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744724724; x=1745329524; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5SYfiysPdG/42yMMYMhRphTDfMvWBf/wNO2XCbt2Hss=;
        b=d62RjP4Uaf46bgrtOuDNdUTvNruzjDns4lUpWzPqgAMPHFcelHjdALIOK+1ibgagWA
         eyt2n7bk1Adw+dm7L9/xwXRAcK1XUpe9RDXVcnozRxBmNztXgXrO2LLAITmfgTK9FoPV
         iEGLtWDC9O2JHDy3/74n44AMo5He6KMHtgS4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724724; x=1745329524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SYfiysPdG/42yMMYMhRphTDfMvWBf/wNO2XCbt2Hss=;
        b=GfkBOybgF9fr0AespOvrt3onREjBpL27lv9J49y72oqsdV/59RxptYWA5xEtHZJfpz
         fazYjt3KTxf+oIPheYhvWr97RvYp4ccuB0Vk0d7reEpSncRkfELQWoTiZaaKOfrM+Ql/
         ALCEXjTh6TjE2opD1/VCQ5MmE8qbTCkim3EC8m5ry0tMvdpuSISAl+REzEtoECSWSGzz
         b5th+cOs+FfVp1mUABnPMr6ID1GoYMXSunSHvoGlkskk9JhUwFAN/hnpsXf7dJSpv2eM
         r1AW2Swr0YZKR2CCROtVAFBNEdEE8VyTS64GGvvKFLMlSGCWR7uo3S2Z8rf1twTOwQYm
         SyXA==
X-Gm-Message-State: AOJu0YyN2jzvwlB6GsgcBJx3kcyIzvIoJos81UtO3B1A21m5yCCZtgPf
	FXVYspud58A74YhISVAv5xHUasJIRFTAPqwqh6Qy814e5KHj3FFFeDK6STrsHS8=
X-Gm-Gg: ASbGncs7AqK5lIzdnUSBtWGIfUPBBgwPqSdTv3ramFGu2fwbTuoC7NjkTHU4zwQOHRp
	TEBXZ3F3h1Lt/0IGtBb4LWhL2WsBQVyFJ0aa1ZiWqYKXBrtLzwzC4ux+PuMGlXx7SsG2PPydAjd
	qtutkQ9XJ4ArdX9yQEFuZ+IEFqoLtCmyXAhR5O5iWcH1s7x7Zf1gSLlCUGb5o4C7XAxNETS+AAP
	72V6LC5K5CePlbRpIzAmRSrutu4FoIwp/CtsazOS2ol4QsU/MMRd6ZhxJ6alHiiNdNvCbVacjmX
	cyI/WAjw26jbu3HFZ7AJP6+8Fk94qVDU75/uwVIowAkZnmXQOr10YYXF
X-Google-Smtp-Source: AGHT+IHL33KCzKlFjR9o0V7DIEPwXQgX55PoAMz0zEzmguqqxRWWkXu+4BBrj7xFANk9BRDGILFNsg==
X-Received: by 2002:a05:600c:3ac6:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43f3a925e28mr160006645e9.4.1744724723758;
        Tue, 15 Apr 2025 06:45:23 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:45:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
Message-ID: <Z_5i7zZJ7lRjFr7G@macbook.lan>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-9-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409064528.405573-9-Jiqian.Chen@amd.com>

On Wed, Apr 09, 2025 at 02:45:28PM +0800, Jiqian Chen wrote:
> When init_msix() fails, it needs to clean all MSIX resources.
> So, add a new function fini_msix() to do that.
> 
> And to unregister the mmio handler of vpci_msix_table_ops, add
> a new function.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: Jan Beulich <jbeulich@suse.com>
> cc: Andrew Cooper <andrew.cooper3@citrix.com>
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v1->v2 changes:
> new patch.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/arch/x86/hvm/intercept.c      | 44 ++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/io.h |  3 ++
>  xen/drivers/vpci/msix.c           | 61 ++++++++++++++++++++++++++++---
>  3 files changed, 103 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/intercept.c b/xen/arch/x86/hvm/intercept.c
> index da22c386763e..5eacf51d4d2c 100644
> --- a/xen/arch/x86/hvm/intercept.c
> +++ b/xen/arch/x86/hvm/intercept.c
> @@ -276,6 +276,50 @@ void register_mmio_handler(struct domain *d,
>      handler->mmio.ops = ops;
>  }
>  
> +void unregister_mmio_handler(struct domain *d,
> +                             const struct hvm_mmio_ops *ops)
> +{
> +    unsigned int i, count = d->arch.hvm.io_handler_count;
> +
> +    ASSERT(d->arch.hvm.io_handler);
> +
> +    if ( !count )
> +        return;
> +
> +    for ( i = 0; i < count; i++ )
> +        if ( d->arch.hvm.io_handler[i].type == IOREQ_TYPE_COPY &&
> +             d->arch.hvm.io_handler[i].mmio.ops == ops )
> +            break;
> +
> +    if ( i == count )
> +        return;
> +
> +    for ( ; i < count - 1; i++ )
> +    {
> +        struct hvm_io_handler *curr = &d->arch.hvm.io_handler[i];
> +        struct hvm_io_handler *next = &d->arch.hvm.io_handler[i + 1];
> +
> +        curr->type = next->type;
> +        curr->ops = next->ops;
> +        if ( next->type == IOREQ_TYPE_COPY )
> +        {
> +            curr->portio.port = 0;
> +            curr->portio.size = 0;
> +            curr->portio.action = 0;
> +            curr->mmio.ops = next->mmio.ops;
> +        }
> +        else
> +        {
> +            curr->mmio.ops = 0;
> +            curr->portio.port = next->portio.port;
> +            curr->portio.size = next->portio.size;
> +            curr->portio.action = next->portio.action;
> +        }
> +    }

Can't you use memmove() instead of a for loop?

memmove(&d->arch.hvm.io_handler[i], &d->arch.hvm.io_handler[i + 1],
	sizeof(d->arch.hvm.io_handler[0]) * (count - i - 1));

> +
> +    d->arch.hvm.io_handler_count--;
> +}
> +
>  void register_portio_handler(struct domain *d, unsigned int port,
>                               unsigned int size, portio_action_t action)
>  {
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index 565bad300d20..018d2745fd99 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -75,6 +75,9 @@ bool hvm_mmio_internal(paddr_t gpa);
>  void register_mmio_handler(struct domain *d,
>                             const struct hvm_mmio_ops *ops);
>  
> +void unregister_mmio_handler(struct domain *d,
> +                             const struct hvm_mmio_ops *ops);
> +
>  void register_portio_handler(
>      struct domain *d, unsigned int port, unsigned int size,
>      portio_action_t action);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 6537374c79a0..60654d4f6d0b 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -703,6 +703,54 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static void fini_msix(struct pci_dev *pdev)
> +{
> +    struct vpci *vpci = pdev->vpci;
> +
> +    if ( !vpci->msix )
> +        return;
> +
> +    list_del(&vpci->msix->next);
> +    if ( list_empty(&pdev->domain->arch.hvm.msix_tables) )
> +        unregister_mmio_handler(pdev->domain, &vpci_msix_table_ops);

At the point the MMIO handler is added the capability initialization
cannot fail, so arguably if the MSI-X handler is registered there will
always be at least one functional MSI-X capability that requires it.

IOW: you can likely drop the addition of unregister_mmio_handler() and
avoid the removal of the MMIO handler.  Worst case a domain will end
up with a dummy handler that does nothing, but it won't cause
malfunctions.

> +
> +    /* Remove any MSIX regions if present. */
> +    for ( unsigned int i = 0;
> +          vpci->msix && i < ARRAY_SIZE(vpci->msix->tables);
> +          i++ )
> +    {
> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> +
> +        for ( unsigned int j = 0; j < ARRAY_SIZE(vpci->header.bars); j++ )
> +        {
> +            int rc;
> +            const struct vpci_bar *bar = &vpci->header.bars[j];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
> +                        &pdev->sbdf, start, end, rc);
> +                return;
> +            }
> +        }
> +    }

There's no need to do any of this rangeset manipulation.  The BAR
rangesets are re-created for any map/unmap request, and hence should
be empty unless there's a concurrent operation going on (which won't
be the case when initializing the capabilities).

> +
> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> +        if ( vpci->msix->table[i] )
> +            iounmap(vpci->msix->table[i]);

The MSI-X init function never maps tables, so the code here (given
it's current usage) will also never unmap anything.  However I would
also like to use this code for vPCI deassing, at which point the logic
will get used.

Thanks, Roger.

