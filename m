Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1F47B6ED
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 02:38:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250084.430696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzU6I-0002Sh-Mv; Tue, 21 Dec 2021 01:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250084.430696; Tue, 21 Dec 2021 01:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzU6I-0002Qx-Gu; Tue, 21 Dec 2021 01:37:58 +0000
Received: by outflank-mailman (input) for mailman id 250084;
 Tue, 21 Dec 2021 01:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNu3=RG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mzU6H-0002Qb-5Z
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 01:37:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9de20094-61fe-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 02:37:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EDBEB81103;
 Tue, 21 Dec 2021 01:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF37C36AE8;
 Tue, 21 Dec 2021 01:37:51 +0000 (UTC)
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
X-Inumbo-ID: 9de20094-61fe-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640050672;
	bh=gyJUfUIO40WYUae6Xa3az1Mhe/TOTgOQj4ue4qzZwpM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UrlX+xfpDCyFs0oD4Q5wtSdGavFy0zFaMyLclWp0a2Rj0COIaiqd0snAzvbTOIWq2
	 AEFmKtzxFcRR0YHlLQpG9zdrCHVA/+0KxFwvzHhX6JiVaC7YQp+o1lZOsf7Y/UuGni
	 gh0GckY/zikpDUTVPVzUn7mt8lVERAmP2UT2tdTQwgbGicVQE4FWThm/qQVT0J6npR
	 mNz3HPMJ+E5Q2bhjwSPLZkWPyWaUPbwXexVbIWPkNj/ttV7/zpqUIg6CvgCkZVl4lZ
	 N7+aQooe3HpjEVS0Lo2QQMNenWvKI6OeOHPIUIQ9zXSxjFLS16Hx6okBLbrs8LWaSK
	 faG4wFs1e4edg==
Date: Mon, 20 Dec 2021 17:37:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
In-Reply-To: <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2112201703310.2060010@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> Integration of the SCMI mediator with xen libs:
> - add hypercalls to aquire SCI channel and set device permissions
> for DomUs;
> - add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
> - SCI requests redirection from DomUs to Firmware.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  tools/include/xenctrl.h           |   3 +
>  tools/include/xenguest.h          |   2 +
>  tools/libs/ctrl/xc_domain.c       |  23 ++++++
>  tools/libs/guest/xg_dom_arm.c     |   5 +-
>  tools/libs/light/libxl_arm.c      | 122 +++++++++++++++++++++++++++---
>  tools/libs/light/libxl_create.c   |  54 ++++++++++++-
>  tools/libs/light/libxl_dom.c      |   1 +
>  tools/libs/light/libxl_internal.h |   4 +
>  xen/arch/arm/domctl.c             |  15 ++++
>  xen/include/public/domctl.h       |   9 +++
>  10 files changed, 223 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 07b96e6671..cdd14f465f 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
>  int xc_domain_soft_reset(xc_interface *xch,
>                           uint32_t domid);
>  
> +int xc_domain_add_sci_device(xc_interface *xch,
> +                              uint32_t domid, char *path);
> +
>  #if defined(__i386__) || defined(__x86_64__)
>  /*
>   * PC BIOS standard E820 types and structure.
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 61d0a82f48..35c611ac73 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -242,6 +242,8 @@ struct xc_dom_image {
>  
>      /* Number of vCPUs */
>      unsigned int max_vcpus;
> +
> +    xen_pfn_t sci_shmem_gfn;

We should be able to avoid introducing sci_shmem_gfn (more below)


>  };
>  
>  /* --- arch specific hooks ----------------------------------------- */
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index b155d6afd2..07bb390e17 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2206,6 +2206,29 @@ int xc_domain_soft_reset(xc_interface *xch,
>      domctl.domain = domid;
>      return do_domctl(xch, &domctl);
>  }
> +
> +int xc_domain_add_sci_device(xc_interface *xch,
> +                              uint32_t domid, char *path)
> +{
> +    size_t size = strlen(path);
> +    int rc;
> +    DECLARE_DOMCTL;
> +    DECLARE_HYPERCALL_BOUNCE(path, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +
> +    if ( xc_hypercall_bounce_pre(xch, path) )
> +        return -1;
> +
> +    domctl.cmd = XEN_DOMCTL_add_sci_device;
> +    domctl.domain = domid;
> +    domctl.u.sci_device_op.size = size;
> +    set_xen_guest_handle(domctl.u.sci_device_op.path, path);
> +    rc = do_domctl(xch, &domctl);
> +
> +    xc_hypercall_bounce_post(xch, path);
> +
> +    return rc;
> +}

I'd skip this xc_ function and hypercall (more below)


>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 5e3b76355e..368a670c46 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -25,11 +25,12 @@
>  
>  #include "xg_private.h"
>  
> -#define NR_MAGIC_PAGES 4
> +#define NR_MAGIC_PAGES 5
>  #define CONSOLE_PFN_OFFSET 0
>  #define XENSTORE_PFN_OFFSET 1
>  #define MEMACCESS_PFN_OFFSET 2
>  #define VUART_PFN_OFFSET 3
> +#define SCI_SHMEM_OFFSET 4
>  
>  #define LPAE_SHIFT 9
>  
> @@ -69,11 +70,13 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
>      dom->console_pfn = base + CONSOLE_PFN_OFFSET;
>      dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
>      dom->vuart_gfn = base + VUART_PFN_OFFSET;
> +    dom->sci_shmem_gfn = base + SCI_SHMEM_OFFSET;
>  
>      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
>      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
>      xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
>      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
> +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->sci_shmem_gfn);

Given that sci_shmem_gfn doesn't actually require any allocations, just
a remapping of an existing and already specified physical page, then I
don't think we need to add a new page to alloc_magic_pages for it.

We can just #define a static address for the SCMI page in the domU
addres space and use it for the mapping. No need to allocate a new
page.


>      xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
>              dom->console_pfn);
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0939..73ef591822 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -8,6 +8,8 @@
>  #include <assert.h>
>  #include <xen/device_tree_defs.h>
>  
> +#define SCMI_NODE_PATH      "/firmware/scmi"
> +
>  static const char *gicv_to_string(libxl_gic_version gic_version)
>  {
>      switch (gic_version) {
> @@ -101,6 +103,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> +    switch (d_config->b_info.sci) {
> +    case LIBXL_SCI_TYPE_NONE:
> +        config->arch.sci_type = XEN_DOMCTL_CONFIG_SCI_NONE;
> +        break;
> +    case LIBXL_SCI_TYPE_SCMI_SMC:
> +        config->arch.sci_type = XEN_DOMCTL_CONFIG_SCI_SCMI_SMC;
> +        break;
> +    default:
> +        LOG(ERROR, "Unknown SCI type %d",
> +            d_config->b_info.sci);
> +        return ERROR_FAIL;
> +    }
> +
>      return 0;
>  }
>  
> @@ -122,6 +137,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>      }
>  
>      state->clock_frequency = config->arch.clock_frequency;
> +    state->sci_agent_paddr = config->arch.sci_agent_paddr;
>  
>      return 0;
>  }
> @@ -502,9 +518,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>      int res;
>      LOG(DEBUG, "Creating OP-TEE node in dtb");
>  
> -    res = fdt_begin_node(fdt, "firmware");
> -    if (res) return res;
> -
>      res = fdt_begin_node(fdt, "optee");
>      if (res) return res;
>  
> @@ -517,9 +530,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>      res = fdt_end_node(fdt);
>      if (res) return res;
>  
> -    res = fdt_end_node(fdt);
> -    if (res) return res;
> -
>      return 0;
>  }
>  
> @@ -902,10 +912,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *pfdt,
>      return 0;
>  }
>  
> -static int copy_node_by_path(libxl__gc *gc, const char *path,
> -                             void *fdt, void *pfdt)
> +static int get_path_nodeoff(const char *path, void *pfdt)
>  {
> -    int nodeoff, r;
> +    int nodeoff;
>      const char *name = strrchr(path, '/');
>  
>      if (!name)
> @@ -925,12 +934,101 @@ static int copy_node_by_path(libxl__gc *gc, const char *path,
>      if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
>          return -FDT_ERR_NOTFOUND;
>  
> +    return nodeoff;
> +}
> +
> +static int copy_node_by_path(libxl__gc *gc, const char *path,
> +                             void *fdt, void *pfdt)
> +{
> +    int nodeoff, r;
> +
> +    nodeoff = get_path_nodeoff(path, pfdt);
> +    if (nodeoff < 0)
> +        return nodeoff;
> +
>      r = copy_node(gc, fdt, pfdt, nodeoff, 0);
>      if (r) return r;
>  
>      return 0;
>  }
>  
> +static int get_node_phandle(const char *path, void *pfdt, uint32_t *phandle)
> +{
> +    int nodeoff;
> +    const char *name = strrchr(path, '/');
> +
> +    if (!name)
> +        return -FDT_ERR_INTERNAL;
> +
> +    name++;
> +    nodeoff = fdt_path_offset(pfdt, path);
> +    if (nodeoff < 0)
> +        return nodeoff;
> +
> +    *phandle = fdt_get_phandle(pfdt, nodeoff);
> +    return 0;
> +}
> +
> +static int make_scmi_shmem_node(libxl__gc *gc, void *fdt, void *pfdt,
> +                           struct xc_dom_image *dom)
> +{
> +    int res;
> +    char buf[64];
> +    uint32_t phandle = 0;
> +
> +    res = get_node_phandle("/scp-shmem", pfdt, &phandle);
> +    if (res) return res;

I hope we'll be able to avoid requiring the user to write a partial
device tree with SCMI info in order to use it.

But if we have to go down this route, then we need to add a description
of scp-shmem under docs/misc/arm/

Also, in general, we cannot mandate or require specific paths in device
tree and instead we should find nodes based on the compatible string.
(There are exceptions like /reserved-memory and /firmware but they are
only a couple.)


> +    snprintf(buf, sizeof(buf), "scp-shmem@%lx",
> +             dom->sci_shmem_gfn << XC_PAGE_SHIFT);
> +    res = fdt_begin_node(fdt, buf);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +                    GUEST_ROOT_SIZE_CELLS, 1,
> +                    dom->sci_shmem_gfn << XC_PAGE_SHIFT, XC_PAGE_SHIFT);
> +    if (res) return res;
> +
> +    LOG(DEBUG, "scmi: setting phandle = %u\n", phandle);
> +    res = fdt_property_cell(fdt, "phandle", phandle);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
> +static int make_firmware_node(libxl__gc *gc, void *fdt, void *pfdt, int tee,
> +                              int sci)
> +{
> +    int res;
> +
> +    if ((tee != LIBXL_TEE_TYPE_OPTEE) && (sci != LIBXL_SCI_TYPE_NONE))
> +        return 0;

Shouldn't this be:

    if ((tee != LIBXL_TEE_TYPE_OPTEE) && (sci == LIBXL_SCI_TYPE_NONE))


> +    res = fdt_begin_node(fdt, "firmware");
> +    if (res) return res;
> +
> +    if (tee == LIBXL_TEE_TYPE_OPTEE) {
> +       res = make_optee_node(gc, fdt);
> +       if (res) return res;
> +    }
> +
> +    if (sci == LIBXL_SCI_TYPE_SCMI_SMC) {
> +        res = copy_node_by_path(gc, SCMI_NODE_PATH, fdt, pfdt);
> +        if (res) return res;
> +    }

Do we really need to copy the node from the partial device tree? That
makes it a lot harder to use for the user. Ideally a user would only
need to specify sci = "scmi_smc" and everything else should be done
automatically.

Can we automatically generate the SCMI device tree node instead? It
looks like we should have all the information to be able to do it. If
not, what is missing?


> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>  /*
>   * The partial device tree is not copied entirely. Only the relevant bits are
>   * copied to the guest device tree:
> @@ -1088,8 +1186,10 @@ next_resize:
>          if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>              FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
>  
> -        if (info->tee == LIBXL_TEE_TYPE_OPTEE)
> -            FDT( make_optee_node(gc, fdt) );
> +        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->sci) );
> +
> +        if (info->sci == LIBXL_SCI_TYPE_SCMI_SMC)
> +            FDT( make_scmi_shmem_node(gc, fdt, pfdt, dom) );
>  
>          if (d_config->num_pcidevs)
>              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index dcd09d32ba..c7372fd344 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -596,6 +596,37 @@ out:
>      return ret;
>  }
>  
> +static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
> +                         uint64_t guest_addr)
> +{
> +    int ret;
> +    uint64_t _paddr_pfn = paddr >> XC_PAGE_SHIFT;
> +    uint64_t _guest_pfn = guest_addr >> XC_PAGE_SHIFT;
> +
> +    LOG(DEBUG, "iomem %"PRIx64, _paddr_pfn);
> +
> +    ret = xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1, 1);
> +    if (ret < 0) {
> +        LOG(ERROR,
> +              "failed give domain access to iomem page %"PRIx64,
> +             _paddr_pfn);
> +        return ret;
> +    }
> +
> +    ret = xc_domain_memory_mapping(CTX->xch, domid,
> +                                   _guest_pfn, _paddr_pfn,
> +                                   1, 1);
> +    if (ret < 0) {
> +        LOG(ERROR,
> +              "failed to map to domain iomem page %"PRIx64
> +              " to guest address %"PRIx64,
> +              _paddr_pfn, _guest_pfn);
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                         libxl__domain_build_state *state,
>                         uint32_t *domid, bool soft_reset)
> @@ -762,6 +793,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>          goto out;
>      }
>  
> +    if (state->sci_agent_paddr != 0) {

Shouldn't we also check for sci_type == XEN_DOMCTL_CONFIG_SCI_NONE ?

If the user specifies sci_type == XEN_DOMCTL_CONFIG_SCI_SCMI_SMC, we
shouldn't automatically map any SCMI channels to the guest, right?


> +        ret = map_sci_page(gc, *domid, state->sci_agent_paddr,
> +                            state->sci_shmem_gfn << XC_PAGE_SHIFT);
> +        if (ret < 0) {
> +            LOGED(ERROR, *domid, "map SCI page fail");
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +    }
> +
>      dom_path = libxl__xs_get_dompath(gc, *domid);
>      if (!dom_path) {
>          rc = ERROR_FAIL;
> @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
>  {
>      AO_GC;
>      libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
> -    int i, rc = 0;
> +    int i, rc = 0, rc_sci = 0;
>  
>      for (i = 0; i < d_config->num_dtdevs; i++) {
>          const libxl_device_dtdev *dtdev = &d_config->dtdevs[i];
>  
>          LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
>          rc = xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> -        if (rc < 0) {
> -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> +        rc_sci = xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
> +
> +        if ((rc < 0) && (rc_sci < 0)) {
> +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> +                 "xc_domain_add_sci_device failed: %d",
> +                 rc, rc_sci);
>              goto out;
>          }
> +
> +        if (rc)
> +            rc = rc_sci;

I would make this simpler actually. Do we need to pass dtdev->path
twice, once for xc_assign_dt_device and a second time for
xc_domain_add_sci_device?

I would skip adding xc_domain_add_sci_device altogether. A general SCMI
enable/disable for the domain is necessary, but then we can just get the
directly assigned devices from xc_assign_dt_device. There is no need to
specify the list twice. If a device is not manageable via SCMI we can
detect it automatically because it is going to be missing scmi_devid on
device tree.


>      }
>  
>  out:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index fe9f760f71..b1d288a8b9 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -710,6 +710,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
>          state->console_mfn = dom->console_pfn;
>          state->store_mfn = dom->xenstore_pfn;
>          state->vuart_gfn = dom->vuart_gfn;
> +        state->sci_shmem_gfn = dom->sci_shmem_gfn;
>      } else {
>          state->console_mfn = xc_dom_p2m(dom, dom->console_pfn);
>          state->store_mfn = xc_dom_p2m(dom, dom->xenstore_pfn);
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 0b4671318c..f9f9cc633a 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -1407,6 +1407,10 @@ typedef struct {
>      /* Whether this domain is being migrated/restored, or booting fresh.  Only
>       * applicable to the primary domain, not support domains (e.g. stub QEMU). */
>      bool restore;
> +
> +    /* sci channel paddr to be set to device-tree node */
> +    uint64_t sci_agent_paddr;
> +    xen_pfn_t sci_shmem_gfn;
>  } libxl__domain_build_state;
>  
>  _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 6245af6d0b..ba200407da 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2012, Citrix Systems
>   */
>  
> +#include <asm/sci/sci.h>
>  #include <xen/errno.h>
>  #include <xen/guest_access.h>
>  #include <xen/hypercall.h>
> @@ -175,6 +176,20 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return rc;
>      }
> +    case XEN_DOMCTL_add_sci_device:
> +    {
> +        int rc;
> +        struct dt_device_node *dev;
> +
> +        rc = dt_find_node_by_gpath(domctl->u.sci_device_op.path,
> +                                   domctl->u.sci_device_op.size,
> +                                   &dev);
> +        if ( rc )
> +            return rc;
> +
> +        return sci_add_dt_device(d, dev);
> +    }

I would skip it and instead I would add a call to sci_add_dt_device in
the implementation of XEN_DOMCTL_assign_device.


>      default:
>      {
>          int rc;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0..671c72c3e8 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
>  #define XEN_DOMCTL_vmtrace_get_option         5
>  #define XEN_DOMCTL_vmtrace_set_option         6
>  };
> +
> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> +struct xen_domctl_sci_device_op {
> +    uint32_t size; /* Length of the path */
> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> +};
> +
>  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>  
> @@ -1265,6 +1272,7 @@ struct xen_domctl {
>  #define XEN_DOMCTL_get_cpu_policy                82
>  #define XEN_DOMCTL_set_cpu_policy                83
>  #define XEN_DOMCTL_vmtrace_op                    84
> +#define XEN_DOMCTL_add_sci_device                85
>  #define XEN_DOMCTL_gdbsx_guestmemio            1000
>  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1326,6 +1334,7 @@ struct xen_domctl {
>          struct xen_domctl_psr_alloc         psr_alloc;
>          struct xen_domctl_vuart_op          vuart_op;
>          struct xen_domctl_vmtrace_op        vmtrace_op;
> +        struct xen_domctl_sci_device_op     sci_device_op;
>          uint8_t                             pad[128];
>      } u;
>  };
> -- 
> 2.27.0
> 

