Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A571C67A37
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 07:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164335.1491347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEm1-0007za-NJ; Tue, 18 Nov 2025 06:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164335.1491347; Tue, 18 Nov 2025 06:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLEm1-0007wd-KH; Tue, 18 Nov 2025 06:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1164335;
 Tue, 18 Nov 2025 06:01:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLEm0-0006JB-Ge
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 06:01:04 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f3dc2e-c443-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 07:01:01 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-37b8aa5adf9so45004591fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 22:01:01 -0800 (PST)
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
X-Inumbo-ID: f5f3dc2e-c443-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445661; x=1764050461; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1ntIy5eBe+qUgxMKngVbEIrjiJ49U9U9JIlEAAQJcw=;
        b=UsNFMb+qyVS+nITFT2RzncWkCOZu1APdLB6AT/6bRQoUYWwHCUZ3iYDoKreRgSQq0X
         jlJSh4PPS73hmTdm3N6ASMDEuFTmFmmZ23LzGU+fPhx/MtnrI0NcLPiYON7xAlE+Qz5i
         3e2bh3j8xOZKgeYBoXLhXNrL3SiwfWhNUr3SRMOxIN2/oYUTuaxFg3+QPUKP2hsV+fs/
         iDXfxkZTWH8qMflxHwCeZ9KtPb2Jqu8MOYDnRbRbmrNs0sj64hd+aTyE4sR48WTtfBYJ
         1Bx3XkDgofEHpU9XEq2YTNkh4bMxW58ENWItDymq1rB441UEXHLolwjRpPwmCHfoV6pT
         dUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445661; x=1764050461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1ntIy5eBe+qUgxMKngVbEIrjiJ49U9U9JIlEAAQJcw=;
        b=IMiBP+f6B5bPYZdmo5/CwXm85vUlNKid5tf1waFj3QrTKDvkMIxCC5pkRGEzYHWoR+
         wCHUHaJrjN8I3LJcsfgXnqI+KVpOijJ9+JKvYSPhzqgAdkDol7LquBZocQW3zF98TRvl
         ho5yOr21Oa71zaArwZ/ozju6YRFbeJQDq3C0hXymyr/rk4wSVH2pRMdqUG7wlFfO0VUG
         QLDVJlaGxiDEKvHAdTJLDbby2aI9JFf6xk3TiMOTBm5z2x1lJR5rHh4LVx5m6mveQMbg
         lrj+C2zsX4ut0zfvBAYRVlstESnYIZoq1mMHLJu6pkqCDiQP3K9N/Modz61P5V0Gvh6h
         4FhQ==
X-Gm-Message-State: AOJu0Yxx0Z1txSgr0wP7Nm9xaGPk++lUBdObLjZModSql4PI1D06MrCx
	UCFWbDePRrIyX6oohXYQRC299sqzYcgQMlwcnpik3JJTM+r18ZkvphAg7z/yvCQ58o2aZBZIA6r
	jw31SMoDeX0vFl9F0CTghQFZ46FxywKY=
X-Gm-Gg: ASbGncsSN+xLPqALyKrYXR2UsEFFDqCcw1X8Qi1HlzcUq5tW+AQek7P+0hR7ITzmdRR
	xo0qrT7dUkzkMLKNBdclXd3NGkQ6YxwsCTsS99AczCXov6kyFNQbz4zQ6NlXD3mAFiAofJVGyzw
	tOtz8KVqo46XbmUheq+udOTXXqRW/OiWfQCR6rjpkhm99XoGsiOxH1/jWuDv6IL1S3bM/yepXcE
	9FzA2VIY7JXCCxsobACQ/l+ecyyY0ae/qXKGTCa574ceAMG2VaTJ28rSYQ=
X-Google-Smtp-Source: AGHT+IE5tjKlyQJif/PGnnJ4Oo+LDaSwfImoUn/6k84wNkC1ed0BUTobp3AUAFNgPNxvgb6A7hah6TESAJbVPLVbMoY=
X-Received: by 2002:a2e:9692:0:b0:37a:5cb7:968f with SMTP id
 38308e7fff4ca-37babbf7f73mr36056991fa.29.1763445660873; Mon, 17 Nov 2025
 22:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-16-dmukhin@ford.com>
In-Reply-To: <20250908211149.279143-16-dmukhin@ford.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 18 Nov 2025 08:00:00 +0200
X-Gm-Features: AWmQ_bmsO5IClkL5cQh1kN8Rt5vg-ViLaCG4yGSTxfQRpRriOqswuRSnkjGQtCQ
Message-ID: <CAGeoDV8WORKLRGPhGnsXw_VtRh2E22ugj9wbQXvfRiHFfCmJ0Q@mail.gmail.com>
Subject: Re: [PATCH v7 15/16] xen/domain: allocate d->irq_caps before
 arch-specific initialization
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
	dmukhin@ford.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thank you for the patch.

On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
>
> From: Denis Mukhin <dmukhin@ford.com>
>
> Make sure that NS16550 emulator does not share virtual device IRQ with th=
e
> physical one. This is needed for enabling NS16550 emulator for PVH hwdom
> (dom0).
>
> To do that, move per-domain interrupt rangeset allocation before arch-spe=
cific
> code. Add irqs_setup_access() to setup the initial rangeset.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v6:
> - n/a
> ---
>  xen/arch/x86/dom0_build.c       | 1 -
>  xen/arch/x86/hvm/dom0_build.c   | 7 +++++++
>  xen/arch/x86/include/asm/irq.h  | 2 ++
>  xen/arch/x86/irq.c              | 8 ++++++++
>  xen/arch/x86/pv/dom0_build.c    | 3 +++
>  xen/common/domain.c             | 8 ++++++--
>  xen/common/emul/vuart/ns16x50.c | 9 +++++++++
>  7 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 26202b33345c..9dc87efbf3e8 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -442,7 +442,6 @@ int __init dom0_setup_permissions(struct domain *d)
>
>      rc |=3D iomem_permit_access(d, 0UL,
>                                PFN_DOWN(1UL << domain_max_paddr_bits(d)) =
- 1);
> -    rc |=3D irqs_permit_access(d, 1, nr_irqs_gsi - 1);
>
>      /* Local APIC. */
>      if ( mp_lapic_addr !=3D 0 )
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.=
c
> index 5551f9044836..245a42dec9aa 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1348,6 +1348,13 @@ int __init dom0_construct_pvh(const struct boot_do=
main *bd)
>           */
>          pvh_setup_mmcfg(d);
>
> +        rc =3D irqs_setup_access(d);
> +        if ( rc )
> +        {
> +            printk("%pd unable to setup IRQ rangeset: %d\n", d, rc);
> +            return rc;
> +        }
> +
>          /*
>           * Setup permissions early so that calls to add MMIO regions to =
the
>           * p2m as part of vPCI setup don't fail due to permission checks=
.
> diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/ir=
q.h
> index 8c81f66434a8..8bffec3bbfee 100644
> --- a/xen/arch/x86/include/asm/irq.h
> +++ b/xen/arch/x86/include/asm/irq.h
> @@ -231,4 +231,6 @@ int allocate_and_map_gsi_pirq(struct domain *d, int i=
ndex, int *pirq_p);
>  int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
>                                int type, struct msi_info *msi);
>
> +int irqs_setup_access(struct domain *d);
> +
>  #endif /* _ASM_HW_IRQ_H */
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 556134f85aa0..079277be719d 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -3046,3 +3046,11 @@ int allocate_and_map_msi_pirq(struct domain *d, in=
t index, int *pirq_p,
>
>      return ret;
>  }
> +
> +int irqs_setup_access(struct domain *d)
> +{
> +    if ( is_hardware_domain(d) )
> +        return irqs_permit_access(d, 1, nr_irqs_gsi - 1);
> +
> +    return 0;
> +}
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 2b8b4d869ee7..1a092b802833 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -1037,6 +1037,9 @@ static int __init dom0_construct(const struct boot_=
domain *bd)
>      rc =3D ioports_setup_access(d);
>      BUG_ON(rc !=3D 0);
>
> +    rc =3D irqs_setup_access(d);
> +    BUG_ON(rc !=3D 0);
> +
>      rc =3D dom0_setup_permissions(d);
>      BUG_ON(rc !=3D 0);
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 775c33928585..edf76b02e1a1 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -952,6 +952,11 @@ struct domain *domain_create(domid_t domid,
>      radix_tree_init(&d->pirq_tree);
>  #endif
>
> +    err =3D -ENOMEM;
> +    d->irq_caps =3D rangeset_new(d, "Interrupts", 0);
> +    if ( !d->irq_caps )
> +        goto fail;
> +
>      if ( (err =3D arch_domain_create(d, config, flags)) !=3D 0 )
>          goto fail;
>      init_status |=3D INIT_arch;
> @@ -961,8 +966,7 @@ struct domain *domain_create(domid_t domid,
>
>      err =3D -ENOMEM;
>      d->iomem_caps =3D rangeset_new(d, "I/O Memory", RANGESETF_prettyprin=
t_hex);
> -    d->irq_caps   =3D rangeset_new(d, "Interrupts", 0);
> -    if ( !d->iomem_caps || !d->irq_caps )
> +    if ( !d->iomem_caps )
>          goto fail;
>
>      if ( (err =3D xsm_domain_create(XSM_HOOK, d, config->ssidref)) !=3D =
0 )
> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16=
x50.c
> index ea34c3ae598a..6bd58ba5540b 100644
> --- a/xen/common/emul/vuart/ns16x50.c
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -797,6 +797,15 @@ static int ns16x50_init(void *arg)
>          return rc;
>      }
>
> +    /* Disallow sharing physical IRQ */

Should this be undone on teardown and error paths?


Best regards,
Mykola


> +    rc =3D irq_deny_access(d, info->irq);
> +    if ( rc )
> +    {
> +        ns16x50_err(info, "virtual IRQ#%d: conflict w/ physical IRQ: %d\=
n",
> +                    info->irq, rc);
> +        return rc;
> +    }
> +
>      /* NB: report 115200 baud rate. */
>      vdev->regs[NS16X50_REGS_NUM + UART_DLL] =3D divisor & UINT8_MAX;
>      vdev->regs[NS16X50_REGS_NUM + UART_DLM] =3D (divisor >> 8) & UINT8_M=
AX;
> --
> 2.51.0
>
>

