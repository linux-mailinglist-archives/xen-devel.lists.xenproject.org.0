Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB441E594
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200334.354832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6aq-0002iW-Sj; Fri, 01 Oct 2021 00:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200334.354832; Fri, 01 Oct 2021 00:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6aq-0002db-Od; Fri, 01 Oct 2021 00:40:04 +0000
Received: by outflank-mailman (input) for mailman id 200334;
 Fri, 01 Oct 2021 00:40:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6ap-0002Xi-NM
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:40:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c467b1d-2250-11ec-bd77-12813bfff9fa;
 Fri, 01 Oct 2021 00:40:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFD0D615E2;
 Fri,  1 Oct 2021 00:40:00 +0000 (UTC)
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
X-Inumbo-ID: 1c467b1d-2250-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048801;
	bh=UU0tMQdSFglZOhxkwVYy4fkqRv8jiVmtjy7FK8HRH34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bn35gKTcx3oyeeOig50NU4vub4Jyo5MzVx99krRNVyrjfiRPEmKRkBt5Vhq7X/3Rv
	 XUTyOgoxitAAGqhL6Do6tvtnATpYxTX15QcVBM+GE10ocD6RUWKa0cum1M0ee7ttOR
	 Nuw7nSuybOGzApLsa6QuOxjkcGccAbuPtgi34a9FUYJ2+xYpWOySCMSo1lKwQaiten
	 KM+eTtBNxIO7YKEQU4m2dbWdR0D0nyD9/xk0tKZ0e6yaN5/T0mT2sXz+ScWqUpKHJ5
	 Jo/SWCH0MFisJ1zasHUCqGJHEanr2kTx0zuRIWBxp8LOIEQaxFScG617To7HYJK+02
	 rL9iE05ShyHNg==
Date: Thu, 30 Sep 2021 17:39:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
In-Reply-To: <20210930071326.857390-9-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301739520.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-9-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Arm's PCI passthrough implementation doesn't support legacy interrupts,
> but MSI/MSI-X. This can be the case for other platforms too.
> For that reason introduce a new CONFIG_PCI_SUPP_LEGACY_IRQ and add
> it to the CFLAGS and compile the relevant code in the toolstack only if
> applicable.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v1:
>  - Minimized #idefery by introducing pci_supp_legacy_irq function
>    for relevant checks
> ---
>  tools/libs/light/Makefile    |  4 ++++
>  tools/libs/light/libxl_pci.c | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 7d8c51d49242..bd3f6be2a183 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -46,6 +46,10 @@ CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
>  	-Wno-declaration-after-statement -Wformat-nonliteral
>  CFLAGS += -I.
>  
> +ifeq ($(CONFIG_X86),y)
> +CFLAGS += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> +endif
> +
>  SRCS-$(CONFIG_X86) += libxl_cpuid.c
>  SRCS-$(CONFIG_X86) += libxl_x86.c
>  SRCS-$(CONFIG_X86) += libxl_psr.c
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 59f3686fc85e..4c2d7aeefbb2 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1364,6 +1364,15 @@ static void pci_add_timeout(libxl__egc *egc, libxl__ev_time *ev,
>      pci_add_dm_done(egc, pas, rc);
>  }
>  
> +static bool pci_supp_legacy_irq(void)
> +{
> +#ifdef CONFIG_PCI_SUPP_LEGACY_IRQ
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>  static void pci_add_dm_done(libxl__egc *egc,
>                              pci_add_state *pas,
>                              int rc)
> @@ -1434,6 +1443,8 @@ static void pci_add_dm_done(libxl__egc *egc,
>          }
>      }
>      fclose(f);
> +    if (!pci_supp_legacy_irq())
> +        goto out_no_irq;
>      sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
>      f = fopen(sysfs_path, "r");
> @@ -1983,6 +1994,8 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>          }
>          fclose(f);
>  skip1:
> +        if (!pci_supp_legacy_irq())
> +            goto skip_irq;
>          sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                 pci->bus, pci->dev, pci->func);
>          f = fopen(sysfs_path, "r");
> -- 
> 2.25.1
> 

