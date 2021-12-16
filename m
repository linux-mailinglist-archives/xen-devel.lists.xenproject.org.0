Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E804766D4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 01:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247660.427058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxeGJ-0003Ke-8j; Thu, 16 Dec 2021 00:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247660.427058; Thu, 16 Dec 2021 00:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxeGJ-0003Ia-4V; Thu, 16 Dec 2021 00:04:43 +0000
Received: by outflank-mailman (input) for mailman id 247660;
 Thu, 16 Dec 2021 00:04:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQEQ=RB=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxeGG-0003IU-MD
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 00:04:40 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2233ce4-5e03-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 01:04:37 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id i63so35808459lji.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 16:04:37 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b2sm552291lfj.280.2021.12.15.16.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 16:04:36 -0800 (PST)
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
X-Inumbo-ID: c2233ce4-5e03-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=unsWTcBD4DsgOjFgBqsvdUgt9cZBme6pVJXbQpvys9k=;
        b=jlUamhZkHi6VtvIQgaugk/bYek/ibNYFyrOrinf/gYWc2vbD3BY3j0EoTBiOKSGl4D
         k7wEzX7tR5foMsP3FGrKOXGL4lYpChjk378xNqEqh04kcdX1UNhK8CIhaeMCHgXHB1uc
         7MXX/opLtv/QclFCK09yiuqKpPIfW9n3tWatD7bngnGjs+HeD6Bzqi7CsSJgrS1A0x7Q
         5DV/n6Li/rxenJLsAtUjNOuiONxxgtnP3OxcXZmy5oqcJHaVikVgUHD+stx0SP2z3jrb
         g38as/4mNb1j+uzuACcezYtCNMeCc6TK+kUl1H17+7yZfIRjP8q+SlDHn3ogxV9fip8G
         Z9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=unsWTcBD4DsgOjFgBqsvdUgt9cZBme6pVJXbQpvys9k=;
        b=CdyjB/hot/nlspMDPfVqnc6w9E0CMUtrg8tWt9sJej+JFlbfKHx96RQpjxFsdZam6p
         8b3b8eTNAXT+Moc5YBa29Rgz8sq1x5xpyaP4O8okHCqoNc1KWKYEV4DufKkk1jqy5gY6
         WD5yN9b41+nUlB2myOkRZRQ7UVOz1izx2HodKGju+KOEddA8OV/xNAazS13dLCZWUw7M
         taIm32iopuRkxMxVCjF94E4AFFStRmGwfs77BQyHFKHExcz2TqYrQefrtIhlBfLazJb+
         +sNrDFHzylDWpYQCu7xoHd15QijOAZ+waoQb9oMxRUn4R5nkSO6XOUm/kMtTzaMufc/w
         2ZwA==
X-Gm-Message-State: AOAM531w1D7KZE+gDgvSBY7Vk2q/0GwubLHtX4b27myz/X6cZ/6pchl1
	+nWFJdZuMea1u2JiQP8KOQk=
X-Google-Smtp-Source: ABdhPJz/9XsJtFnaF3H0rEufoV1fCBlsfoSDKm/SRlTkvu4ZeEVtRs/FinxHfU6Ldsb6atwIoRfbEA==
X-Received: by 2002:a2e:e09:: with SMTP id 9mr12411742ljo.172.1639613077175;
        Wed, 15 Dec 2021 16:04:37 -0800 (PST)
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b1c27f70-309d-bb36-3228-32836063fd16@gmail.com>
Date: Thu, 16 Dec 2021 02:04:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.12.21 11:34, Oleksii Moisieiev wrote:

Hi Oleksii

> Integration of the SCMI mediator with xen libs:
> - add hypercalls to aquire SCI channel and set device permissions
> for DomUs;
> - add SCMI_SMC nodes to DomUs device-tree based on partial device-tree;
> - SCI requests redirection from DomUs to Firmware.
>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>   tools/include/xenctrl.h           |   3 +
>   tools/include/xenguest.h          |   2 +
>   tools/libs/ctrl/xc_domain.c       |  23 ++++++
>   tools/libs/guest/xg_dom_arm.c     |   5 +-
>   tools/libs/light/libxl_arm.c      | 122 +++++++++++++++++++++++++++---
>   tools/libs/light/libxl_create.c   |  54 ++++++++++++-
>   tools/libs/light/libxl_dom.c      |   1 +
>   tools/libs/light/libxl_internal.h |   4 +
>   xen/arch/arm/domctl.c             |  15 ++++
>   xen/include/public/domctl.h       |   9 +++
>   10 files changed, 223 insertions(+), 15 deletions(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 07b96e6671..cdd14f465f 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1238,6 +1238,9 @@ int xc_domain_getvnuma(xc_interface *xch,
>   int xc_domain_soft_reset(xc_interface *xch,
>                            uint32_t domid);
>   
> +int xc_domain_add_sci_device(xc_interface *xch,
> +                              uint32_t domid, char *path);
> +
>   #if defined(__i386__) || defined(__x86_64__)
>   /*
>    * PC BIOS standard E820 types and structure.
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index 61d0a82f48..35c611ac73 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -242,6 +242,8 @@ struct xc_dom_image {
>   
>       /* Number of vCPUs */
>       unsigned int max_vcpus;
> +
> +    xen_pfn_t sci_shmem_gfn;
>   };
>   
>   /* --- arch specific hooks ----------------------------------------- */
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index b155d6afd2..07bb390e17 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2206,6 +2206,29 @@ int xc_domain_soft_reset(xc_interface *xch,
>       domctl.domain = domid;
>       return do_domctl(xch, &domctl);
>   }
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
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 5e3b76355e..368a670c46 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -25,11 +25,12 @@
>   
>   #include "xg_private.h"
>   
> -#define NR_MAGIC_PAGES 4
> +#define NR_MAGIC_PAGES 5
>   #define CONSOLE_PFN_OFFSET 0
>   #define XENSTORE_PFN_OFFSET 1
>   #define MEMACCESS_PFN_OFFSET 2
>   #define VUART_PFN_OFFSET 3
> +#define SCI_SHMEM_OFFSET 4
>   
>   #define LPAE_SHIFT 9
>   
> @@ -69,11 +70,13 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
>       dom->console_pfn = base + CONSOLE_PFN_OFFSET;
>       dom->xenstore_pfn = base + XENSTORE_PFN_OFFSET;
>       dom->vuart_gfn = base + VUART_PFN_OFFSET;
> +    dom->sci_shmem_gfn = base + SCI_SHMEM_OFFSET;
>   
>       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
>       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->xenstore_pfn);
>       xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
>       xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
> +    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->sci_shmem_gfn);
>   
>       xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
>               dom->console_pfn);
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0939..73ef591822 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -8,6 +8,8 @@
>   #include <assert.h>
>   #include <xen/device_tree_defs.h>
>   
> +#define SCMI_NODE_PATH      "/firmware/scmi"
> +
>   static const char *gicv_to_string(libxl_gic_version gic_version)
>   {
>       switch (gic_version) {
> @@ -101,6 +103,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           return ERROR_FAIL;
>       }
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
>       return 0;
>   }
>   
> @@ -122,6 +137,7 @@ int libxl__arch_domain_save_config(libxl__gc *gc,
>       }
>   
>       state->clock_frequency = config->arch.clock_frequency;
> +    state->sci_agent_paddr = config->arch.sci_agent_paddr;
>   
>       return 0;
>   }
> @@ -502,9 +518,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>       int res;
>       LOG(DEBUG, "Creating OP-TEE node in dtb");
>   
> -    res = fdt_begin_node(fdt, "firmware");
> -    if (res) return res;
> -
>       res = fdt_begin_node(fdt, "optee");
>       if (res) return res;
>   
> @@ -517,9 +530,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>       res = fdt_end_node(fdt);
>       if (res) return res;
>   
> -    res = fdt_end_node(fdt);
> -    if (res) return res;
> -
>       return 0;
>   }
>   
> @@ -902,10 +912,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *pfdt,
>       return 0;
>   }
>   
> -static int copy_node_by_path(libxl__gc *gc, const char *path,
> -                             void *fdt, void *pfdt)
> +static int get_path_nodeoff(const char *path, void *pfdt)
>   {
> -    int nodeoff, r;
> +    int nodeoff;
>       const char *name = strrchr(path, '/');
>   
>       if (!name)
> @@ -925,12 +934,101 @@ static int copy_node_by_path(libxl__gc *gc, const char *path,
>       if (strcmp(fdt_get_name(pfdt, nodeoff, NULL), name))
>           return -FDT_ERR_NOTFOUND;
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
>       r = copy_node(gc, fdt, pfdt, nodeoff, 0);
>       if (r) return r;
>   
>       return 0;
>   }
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
> +
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
> +
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
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>   /*
>    * The partial device tree is not copied entirely. Only the relevant bits are
>    * copied to the guest device tree:
> @@ -1088,8 +1186,10 @@ next_resize:
>           if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>               FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
>   
> -        if (info->tee == LIBXL_TEE_TYPE_OPTEE)
> -            FDT( make_optee_node(gc, fdt) );
> +        FDT( make_firmware_node(gc, fdt, pfdt, info->tee, info->sci) );
> +
> +        if (info->sci == LIBXL_SCI_TYPE_SCMI_SMC)
> +            FDT( make_scmi_shmem_node(gc, fdt, pfdt, dom) );
>   
>           if (d_config->num_pcidevs)
>               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index dcd09d32ba..c7372fd344 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -596,6 +596,37 @@ out:
>       return ret;
>   }
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
>   int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>                          libxl__domain_build_state *state,
>                          uint32_t *domid, bool soft_reset)
> @@ -762,6 +793,16 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>           goto out;
>       }
>   
> +    if (state->sci_agent_paddr != 0) {
> +        ret = map_sci_page(gc, *domid, state->sci_agent_paddr,
> +                            state->sci_shmem_gfn << XC_PAGE_SHIFT);
> +        if (ret < 0) {
> +            LOGED(ERROR, *domid, "map SCI page fail");
> +            rc = ERROR_FAIL;
> +            goto out;
> +        }
> +    }
> +
>       dom_path = libxl__xs_get_dompath(gc, *domid);
>       if (!dom_path) {
>           rc = ERROR_FAIL;
> @@ -1817,17 +1858,24 @@ static void libxl__add_dtdevs(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
>   {
>       AO_GC;
>       libxl__ao_device *aodev = libxl__multidev_prepare(multidev);
> -    int i, rc = 0;
> +    int i, rc = 0, rc_sci = 0;
>   
>       for (i = 0; i < d_config->num_dtdevs; i++) {
>           const libxl_device_dtdev *dtdev = &d_config->dtdevs[i];
>   
>           LOGD(DEBUG, domid, "Assign device \"%s\" to domain", dtdev->path);
>           rc = xc_assign_dt_device(CTX->xch, domid, dtdev->path);
> -        if (rc < 0) {
> -            LOGD(ERROR, domid, "xc_assign_dtdevice failed: %d", rc);
> +        rc_sci = xc_domain_add_sci_device(CTX->xch, domid, dtdev->path);
> +
> +        if ((rc < 0) && (rc_sci < 0)) {
> +            LOGD(ERROR, domid, "xc_assign_dt_device failed: %d; "
> +                 "xc_domain_add_sci_device failed: %d",
> +                 rc, rc_sci);
>               goto out;
>           }
> +
> +        if (rc)
> +            rc = rc_sci;


If I get this code right, it sounds like the dom.cfg's dtdev property is 
reused to describe sci devices as well, but the libxl__add_dtdevs() does 
not (and can not) differentiate them. So it has no option but to send 
two domctls for each device in dtdevs[] hoping to at least one domctl to 
succeeded. Or I really missed something?

It feels to me that:
  - either new dom.cfg's property could be introduced (scidev?) to 
describe sci devices together with new parsing logic/management code, so 
you will end up having new libxl__add_scidevs() to invoke 
XEN_DOMCTL_add_sci_device,
so no mixing things.
  - or indeed dtdev logic could be *completely* reused including 
extending XEN_DOMCTL_assign_device to cover your use-case, although 
sounds generic, it is used to describe devices for the passthrough (to 
configure an IOMMU for the device), in that case you wouldn't need an 
extra XEN_DOMCTL_add_sci_device introduced by current patch.

Personally I would use the first option as I am not sure that second 
option is conceptually correct && possible. I would leave this for the 
maintainers to clarify.




>       }
>   
>   out:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index fe9f760f71..b1d288a8b9 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -710,6 +710,7 @@ int libxl__build_pv(libxl__gc *gc, uint32_t domid,
>           state->console_mfn = dom->console_pfn;
>           state->store_mfn = dom->xenstore_pfn;
>           state->vuart_gfn = dom->vuart_gfn;
> +        state->sci_shmem_gfn = dom->sci_shmem_gfn;
>       } else {
>           state->console_mfn = xc_dom_p2m(dom, dom->console_pfn);
>           state->store_mfn = xc_dom_p2m(dom, dom->xenstore_pfn);
> diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
> index 0b4671318c..f9f9cc633a 100644
> --- a/tools/libs/light/libxl_internal.h
> +++ b/tools/libs/light/libxl_internal.h
> @@ -1407,6 +1407,10 @@ typedef struct {
>       /* Whether this domain is being migrated/restored, or booting fresh.  Only
>        * applicable to the primary domain, not support domains (e.g. stub QEMU). */
>       bool restore;
> +
> +    /* sci channel paddr to be set to device-tree node */
> +    uint64_t sci_agent_paddr;
> +    xen_pfn_t sci_shmem_gfn;
>   } libxl__domain_build_state;
>   
>   _hidden void libxl__domain_build_state_init(libxl__domain_build_state *s);
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 6245af6d0b..ba200407da 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -4,6 +4,7 @@
>    * Copyright (c) 2012, Citrix Systems
>    */
>   
> +#include <asm/sci/sci.h>
>   #include <xen/errno.h>
>   #include <xen/guest_access.h>
>   #include <xen/hypercall.h>
> @@ -175,6 +176,20 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>   
>           return rc;
>       }
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
> +
>       default:
>       {
>           int rc;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0..671c72c3e8 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
>   #define XEN_DOMCTL_vmtrace_get_option         5
>   #define XEN_DOMCTL_vmtrace_set_option         6
>   };
> +
> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> +struct xen_domctl_sci_device_op {
> +    uint32_t size; /* Length of the path */
> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> +};
> +
>   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>   
> @@ -1265,6 +1272,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_get_cpu_policy                82
>   #define XEN_DOMCTL_set_cpu_policy                83
>   #define XEN_DOMCTL_vmtrace_op                    84
> +#define XEN_DOMCTL_add_sci_device                85
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1326,6 +1334,7 @@ struct xen_domctl {
>           struct xen_domctl_psr_alloc         psr_alloc;
>           struct xen_domctl_vuart_op          vuart_op;
>           struct xen_domctl_vmtrace_op        vmtrace_op;
> +        struct xen_domctl_sci_device_op     sci_device_op;
>           uint8_t                             pad[128];
>       } u;
>   };

I assume the XSM needs updating (adding new hook, etc).


-- 
Regards,

Oleksandr Tyshchenko


