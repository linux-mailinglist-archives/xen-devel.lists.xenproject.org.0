Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DB417E86
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 02:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195743.348592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvCj-000343-TJ; Sat, 25 Sep 2021 00:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195743.348592; Sat, 25 Sep 2021 00:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTvCj-00031n-Pr; Sat, 25 Sep 2021 00:06:09 +0000
Received: by outflank-mailman (input) for mailman id 195743;
 Sat, 25 Sep 2021 00:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTvCi-00031h-Tp
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 00:06:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f88de43-d7bf-4c9b-a069-aa7bc68edc69;
 Sat, 25 Sep 2021 00:06:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1FB060FDC;
 Sat, 25 Sep 2021 00:06:06 +0000 (UTC)
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
X-Inumbo-ID: 1f88de43-d7bf-4c9b-a069-aa7bc68edc69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632528367;
	bh=8Kr3nfOHfayj52scmf+IKB3qa8sEIJ3rRqab05Wiji0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AUe6sH52GD2gU751uaTSiRa7XFw2VeJW+PdwmUzlLddvXRH0nayiADPFkzCaQWAUE
	 2OiNlOMOwhZaFqgI999M0mxTF5pwVbWFZICR2YuRJKjLl2iI+ki2IkW3tSDm+p7PdV
	 lz3NrfnNtpsOXf/Gf83nC6ZUcsN5cRDJu47fw/MfY78+K1BZ1pXHB+tQiv5B1LCFY0
	 AW+vnnKSlybOmuzG0gU88kcBE5982sEeoLdtlyEdNFQ+CHbjn/REPltKWD+RTElz9o
	 G1Zu+aBTFTxOQfbc+9stYWijofG7Z4DwreP9awOCwkzSb8la2RxtsYxYkf5SAfldJT
	 mDGMAvHizrkWQ==
Date: Fri, 24 Sep 2021 17:06:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    jbeulich@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 08/11] libxl: Only map legacy PCI IRQs if they are
 supported
In-Reply-To: <20210923125438.234162-9-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241704050.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-9-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
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
>
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

This patch is a lot better than the previous version, thanks!

I think the usage of pci_supp_legacy_irq below is good and we can't do
better than that.

I wonder if there is a better way than the above to export
CONFIG_PCI_SUPP_LEGACY_IRQ. Suggestions?


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

