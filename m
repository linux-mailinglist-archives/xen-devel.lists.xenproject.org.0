Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ECA4071B4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 21:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184753.333483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlrU-0004CI-Ix; Fri, 10 Sep 2021 19:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184753.333483; Fri, 10 Sep 2021 19:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlrU-0004A9-F1; Fri, 10 Sep 2021 19:06:56 +0000
Received: by outflank-mailman (input) for mailman id 184753;
 Fri, 10 Sep 2021 19:06:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOlrS-0004A3-Ji
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 19:06:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423c1c50-126a-11ec-b278-12813bfff9fa;
 Fri, 10 Sep 2021 19:06:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F2F36103D;
 Fri, 10 Sep 2021 19:06:52 +0000 (UTC)
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
X-Inumbo-ID: 423c1c50-126a-11ec-b278-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631300812;
	bh=BZGtJxCFbzrAbWpwiJa1S/SwJiopZbvSxX6mT696BQo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q2mY/68TDirhGXyHdmzIYUdd39IPawgXbKu9nu1dZ2DKoOQ52RFJZ2vpOGeG1zn28
	 QUaiChP553x9Ssf5iRhFHI+jR1s5NB0f279W0QYVWhD7v+G+s8KrS9QN60psucPCGb
	 kZsudF3PiUv9FfZ5IMDN0R0I8DP15CMyYTsK/MmoNEZuaMe5GQUuYsc9nojBlG3lMt
	 KeS1IEwWOxpn2AJDusp56Ns2nTwYJoUXUfq2mCLSJskLQrnd20uxZCpmZC7qo10yCy
	 HbF0KwTDnvUI5Lwv5sSdE7gD8M6rTid39Ogd7TmQ+g/bqHhXi5LPrfdb8XkqIw8CtL
	 C4Uvf1LBDcPgA==
Date: Fri, 10 Sep 2021 12:06:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
In-Reply-To: <20210903083347.131786-9-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109101159100.10523@sstabellini-ThinkPad-T480s>
References: <20210903083347.131786-1-andr2000@gmail.com> <20210903083347.131786-9-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Sep 2021, Oleksandr Andrushchenko wrote:
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
> index 59f3686fc85e..cd4fea46c3f7 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1434,6 +1434,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          }
>      }
>      fclose(f);
> +#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ

As Juergen pointed out the logic is inverted.

I also think we need to come up with a better way to handle this #ifdef
logic in this file.

For instance, could we let this function try to open sysfs_path? I
imagine it would fail, right? If so, we could just have an #ifdef inside
the failure check.

Alternatively, could we have a small #ifdef right here doing:

#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
goto out_no_irq;
#endif

?


Even better, would be to introduce a static inline as follows:

static inline bool pci_supp_legacy_irq(void)
{
#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
    return false;
#else
    return true;
#endif
}

Then in libxl_pci.c you can avoid all ifdefs:

if (!pci_supp_legacy_irq()))
    goto out_no_irq;


>      sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
>      f = fopen(sysfs_path, "r");
> @@ -1460,6 +1461,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          }
>      }
>      fclose(f);
> +#endif
>  
>      /* Don't restrict writes to the PCI config space from this VM */
>      if (pci->permissive) {
> @@ -1471,7 +1473,9 @@ static void pci_add_dm_done(libxl__egc *egc,
>          }
>      }
>  
> +#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
>  out_no_irq:
> +#endif
>      if (!isstubdom) {
>          if (pci->rdm_policy == LIBXL_RDM_RESERVE_POLICY_STRICT) {
>              flag &= ~XEN_DOMCTL_DEV_RDM_RELAXED;
> @@ -1951,7 +1955,9 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>                                       pci->bus, pci->dev, pci->func);
>          FILE *f = fopen(sysfs_path, "r");
>          unsigned int start = 0, end = 0, flags = 0, size = 0;
> +#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
>          int irq = 0;
> +#endif

I'd let this compile if possible.


>          int i;
>          if (f == NULL) {
> @@ -1983,6 +1989,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>          }
>          fclose(f);
>  skip1:
> +#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ

Here we could do instead:

if (!pci_supp_legacy_irq()))
    goto skip_irq;


>          sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                 pci->bus, pci->dev, pci->func);
>          f = fopen(sysfs_path, "r");
> @@ -2001,8 +2008,14 @@ skip1:
>              }
>          }
>          fclose(f);
> +#else
> +        /* Silence error: label at end of compound statement */
> +        ;
> +#endif
>      }
> +#ifndef CONFIG_PCI_SUPP_LEGACY_IRQ
>  skip_irq:
> +#endif
>      rc = 0;
>  out_fail:
>      pci_remove_detached(egc, prs, rc); /* must be last */
> -- 
> 2.25.1
> 

