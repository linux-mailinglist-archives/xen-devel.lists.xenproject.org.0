Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841DF91089B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744749.1151857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIwJ-0004S1-6p; Thu, 20 Jun 2024 14:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744749.1151857; Thu, 20 Jun 2024 14:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIwJ-0004Pb-3d; Thu, 20 Jun 2024 14:39:03 +0000
Received: by outflank-mailman (input) for mailman id 744749;
 Thu, 20 Jun 2024 14:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nkum=NW=bounce.vates.tech=bounce-md_30504962.66743f02.v1-7d6c54d1c8194bb4a381d2d9a2e31000@srs-se1.protection.inumbo.net>)
 id 1sKIwH-0004PV-Vp
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:39:02 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e7ea7f-2f12-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 16:39:00 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W4jmL27RlzDRJ1X7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 14:38:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7d6c54d1c8194bb4a381d2d9a2e31000; Thu, 20 Jun 2024 14:38:58 +0000
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
X-Inumbo-ID: d4e7ea7f-2f12-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718894338; x=1719154838;
	bh=91Tg+JtM111mPgte8fdOPT6iTIZ3vjTubIw9uyh/OOc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HGnS6WsYz55Lc6pJDF9/jNaUGaxeAzkTuKH+P8x0Cuow+9o29HkRQQObBkV9nl4Na
	 gkJixEmJGJhCYUjmjIHN1fHYS8Hkq1xtpHWjYnCwNHS0RpR3Bp+dJbvojF2e/JRa1g
	 CVo/ybv+Q2w2RaTmoIQgKZ0qey3KNvGoqedPXaBp3MPIUvvdoT72XlvD/e+EGIHinw
	 fC0h2OHBG2lE5g2yV70CsvOJWpQFgiA//Wh5d3zwNpgyRbc2UdztUT0QjmshnOCxYZ
	 h81S0tLTPTYc/iD5n+pvV6t/cyDRkIHPEvNh3wPeJZLzvfnkVfje9gIeDhaDp5dg0X
	 +/BGQCz5UOxIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718894338; x=1719154838; i=anthony.perard@vates.tech;
	bh=91Tg+JtM111mPgte8fdOPT6iTIZ3vjTubIw9uyh/OOc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZkSMRWiU4uTh1HxpEDSIZn/Ox2YBU8zP1n6vXd6c0CtuST4c3FJyuddd5qq4uSd8R
	 4exJx5IAa5Fc6mBhNUUWWWSJVbZMzvAhcYKYzJfWXlJi3oYZJfpUJsIC37j/QtgCNv
	 We+dSAzstjVwZVw2Xfb7T+I3Ml0cy/Vp2EAHzbf4febzoBkDIcOyjCEyJsBROTQBDL
	 0PoPSq/y5hgKgbTCkXNBKqDQsg4P1k/sl9rSAQ1TCXEjjLuiJTEeUNxzEPLgeEfjqb
	 +tvoYUN02Rr7TVlyqEh7IxVzi32QoxEzndwqCDeU5pfGjSby9vw/czLA1Z76zarVpT
	 /AAyfPyllOIZA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v10=204/5]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718894336030
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>
Message-Id: <ZnQ+/y/AGyasDGHY@l14>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com> <20240617090035.839640-5-Jiqian.Chen@amd.com>
In-Reply-To: <20240617090035.839640-5-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7d6c54d1c8194bb4a381d2d9a2e31000?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240620:md
Date: Thu, 20 Jun 2024 14:38:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 17, 2024 at 05:00:34PM +0800, Jiqian Chen wrote:
> diff --git a/tools/include/xencall.h b/tools/include/xencall.h
> index fc95ed0fe58e..750aab070323 100644
> --- a/tools/include/xencall.h
> +++ b/tools/include/xencall.h
> @@ -113,6 +113,8 @@ int xencall5(xencall_handle *xcall, unsigned int op,
>               uint64_t arg1, uint64_t arg2, uint64_t arg3,
>               uint64_t arg4, uint64_t arg5);
>  
> +int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf);

I don't think that an appropriate library for this new feature.
libxencall is a generic lib to make hypercall.

>  /* Variant(s) of the above, as needed, returning "long" instead of "int". */
>  long xencall2L(xencall_handle *xcall, unsigned int op,
>                 uint64_t arg1, uint64_t arg2);
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 9ceca0cffc2f..a0381f74d24b 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>                            uint32_t domid,
>                            int pirq);
>  
> +int xc_physdev_gsi_from_dev(xc_interface *xch, uint32_t sbdf);
> +
>  /*
>   *  LOGGING AND ERROR REPORTING
>   */
> diff --git a/tools/libs/call/core.c b/tools/libs/call/core.c
> index 02c4f8e1aefa..6dae50c9a6ba 100644
> --- a/tools/libs/call/core.c
> +++ b/tools/libs/call/core.c
> @@ -173,6 +173,11 @@ int xencall5(xencall_handle *xcall, unsigned int op,
>      return osdep_hypercall(xcall, &call);
>  }
>  
> +int xen_oscall_gsi_from_dev(xencall_handle *xcall, unsigned int sbdf)
> +{
> +    return osdep_oscall(xcall, sbdf);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/call/libxencall.map b/tools/libs/call/libxencall.map
> index d18a3174e9dc..b92a0b5dc12c 100644
> --- a/tools/libs/call/libxencall.map
> +++ b/tools/libs/call/libxencall.map
> @@ -10,6 +10,8 @@ VERS_1.0 {
>  		xencall4;
>  		xencall5;
>  
> +		xen_oscall_gsi_from_dev;

FYI, never change already released version of a library, this would add
a new function to libxencall.1.0. Instead, when adding a new function
to a library that is supposed to be stable (they have a *.map file in
xen case), add it to a new section, that woud be VERS_1.4 in this case.
But libxencall isn't approriate for this new function, so just for
future reference.

>  		xencall_alloc_buffer;
>  		xencall_free_buffer;
>  		xencall_alloc_buffer_pages;
> diff --git a/tools/libs/call/linux.c b/tools/libs/call/linux.c
> index 6d588e6bea8f..92c740e176f2 100644
> --- a/tools/libs/call/linux.c
> +++ b/tools/libs/call/linux.c
> @@ -85,6 +85,21 @@ long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall)
>      return ioctl(xcall->fd, IOCTL_PRIVCMD_HYPERCALL, hypercall);
>  }
>  
> +int osdep_oscall(xencall_handle *xcall, unsigned int sbdf)
> +{
> +    privcmd_gsi_from_dev_t dev_gsi = {
> +        .sbdf = sbdf,
> +        .gsi = -1,
> +    };
> +
> +    if (ioctl(xcall->fd, IOCTL_PRIVCMD_GSI_FROM_DEV, &dev_gsi)) {

Looks like libxencall is only for hypercall, and so I don't think
it's the right place to introducing another ioctl() call.

> +        PERROR("failed to get gsi from dev");
> +        return -1;
> +    }
> +
> +    return dev_gsi.gsi;
> +}
> +
>  static void *alloc_pages_bufdev(xencall_handle *xcall, size_t npages)
>  {
>      void *p;
> diff --git a/tools/libs/call/private.h b/tools/libs/call/private.h
> index 9c3aa432efe2..cd6eb5a3e66f 100644
> --- a/tools/libs/call/private.h
> +++ b/tools/libs/call/private.h
> @@ -57,6 +57,15 @@ int osdep_xencall_close(xencall_handle *xcall);
>  
>  long osdep_hypercall(xencall_handle *xcall, privcmd_hypercall_t *hypercall);
>  
> +#if defined(__linux__)
> +int osdep_oscall(xencall_handle *xcall, unsigned int sbdf);
> +#else
> +static inline int osdep_oscall(xencall_handle *xcall, unsigned int sbdf)
> +{
> +    return -1;
> +}
> +#endif
> +
>  void *osdep_alloc_pages(xencall_handle *xcall, size_t nr_pages);
>  void osdep_free_pages(xencall_handle *xcall, void *p, size_t nr_pages);
>  
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index 460a8e779ce8..c1458f3a38b5 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -111,3 +111,7 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_physdev_gsi_from_dev(xc_interface *xch, uint32_t sbdf)
> +{

I'm not sure if this is the best place for this new function, but I
can't find another one, so that will do.

> +    return xen_oscall_gsi_from_dev(xch->xcall, sbdf);
> +}
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 37e4d1670986..6b616d5ee9b6 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -40,7 +40,7 @@ OBJS-$(CONFIG_X86) += $(ACPI_OBJS)
>  
>  CFLAGS += -Wno-format-zero-length -Wmissing-declarations -Wformat-nonliteral
>  
> -CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ
> +CFLAGS-$(CONFIG_X86) += -DCONFIG_PCI_SUPP_LEGACY_IRQ -DCONFIG_X86
>  
>  OBJS-$(CONFIG_X86) += libxl_cpuid.o
>  OBJS-$(CONFIG_X86) += libxl_x86.o
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..376f91759ac6 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1406,6 +1406,12 @@ static bool pci_supp_legacy_irq(void)
>  #endif
>  }
>  
> +#define PCI_DEVID(bus, devfn)\
> +            ((((uint16_t)(bus)) << 8) | ((devfn) & 0xff))
> +
> +#define PCI_SBDF(seg, bus, devfn) \
> +            ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
> +
>  static void pci_add_dm_done(libxl__egc *egc,
>                              pci_add_state *pas,
>                              int rc)
> @@ -1418,6 +1424,10 @@ static void pci_add_dm_done(libxl__egc *egc,
>      unsigned long long start, end, flags, size;
>      int irq, i;
>      int r;
> +#ifdef CONFIG_X86
> +    int gsi;
> +    uint32_t sbdf;
> +#endif
>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>      uint32_t domainid = domid;
>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> @@ -1486,6 +1496,18 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +#ifdef CONFIG_X86

Could you avoid these #ifdef, and move the new arch specific code (and
maybe existing code) into libxl_x86.c ? There's already examples of arch
specific code.

> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
> +                        (PCI_DEVFN(pci->dev, pci->func)));
> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> +        /*
> +         * Old kernel version may not support this function,
> +         * so if fail, keep using irq; if success, use gsi
> +         */
> +        if (gsi > 0) {
> +            irq = gsi;
> +        }
> +#endif
>          r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
>          if (r < 0) {
>              LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> @@ -2172,6 +2194,10 @@ static void pci_remove_detached(libxl__egc *egc,
>      int  irq = 0, i, stubdomid = 0;
>      const char *sysfs_path;
>      FILE *f;
> +#ifdef CONFIG_X86
> +    int gsi;
> +    uint32_t sbdf;
> +#endif
>      uint32_t domainid = prs->domid;
>      bool isstubdom;
>  
> @@ -2239,6 +2265,18 @@ skip_bar:
>      }
>  
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +#ifdef CONFIG_X86
> +        sbdf = PCI_SBDF(pci->domain, pci->bus,
> +                        (PCI_DEVFN(pci->dev, pci->func)));
> +        gsi = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> +        /*
> +         * Old kernel version may not support this function,
> +         * so if fail, keep using irq; if success, use gsi
> +         */
> +        if (gsi > 0) {
> +            irq = gsi;
> +        }
> +#endif
>          rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
>          if (rc < 0) {
>              /*

Thanks,

-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

