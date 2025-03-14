Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD0A61960
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 19:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915283.1320823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9lj-0001O9-7y; Fri, 14 Mar 2025 18:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915283.1320823; Fri, 14 Mar 2025 18:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt9lj-0001LC-3W; Fri, 14 Mar 2025 18:28:27 +0000
Received: by outflank-mailman (input) for mailman id 915283;
 Fri, 14 Mar 2025 18:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7HmO=WB=bounce.vates.tech=bounce-md_30504962.67d47545.v1-5921751e1bf34a4a91bbcdad8eebdd74@srs-se1.protection.inumbo.net>)
 id 1tt9lg-00013Y-RP
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 18:28:25 +0000
Received: from mail136-29.atl41.mandrillapp.com
 (mail136-29.atl41.mandrillapp.com [198.2.136.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c23e9ad-0102-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 19:28:22 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-29.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZDtCn3pwHz6CPyQT
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 18:28:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5921751e1bf34a4a91bbcdad8eebdd74; Fri, 14 Mar 2025 18:28:21 +0000
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
X-Inumbo-ID: 1c23e9ad-0102-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741976901; x=1742246901;
	bh=KTdCXNey4OTm/dMcNNsj8MUWlHjJYuj75Jr3wuUbpsI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NQ7CrW7/LW+QPn258R7QN20tE26fGAiD3WNb+YcB6fw7qP/gWHQ21w7RuESU0JwAu
	 pU5kp0yY4h10Atf3r1a//CG7UipV7Gz3Tm5ByP+XOgiZaJsci8uyUD8sTp4SJNoYUO
	 JyZP6f9LLW2eGVTC+SsL+zRBy9uDp0nr91C2w3EpTHDOBwf892qAmrKFaJSd1ZLDhF
	 T8CcM55sby3l1bWewYsObbYDWMTU3EAk1DJfqaNsax0NKIpAQ6HigYcV9TUB5NVldt
	 AEhRZP7aObwjWYK5GAAesSCN3typ9e+nhsmVLpzxnKMBDglPz8w9u54eJYE3HFo3OQ
	 jHEzNTAjxoAUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741976901; x=1742237401; i=anthony.perard@vates.tech;
	bh=KTdCXNey4OTm/dMcNNsj8MUWlHjJYuj75Jr3wuUbpsI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m9gn44Nl7v8wAMXuyr1Q8euwGgv5AuU4sTf3AUMyyYhRm+5Ya767L5Zg7DCSNDPF7
	 a5Pktmh1QEkJf8GS4MSL7Yf+9Q7WxXw13x494YPIfxOnVbbJ/bmWWbZVDulXB8ynDm
	 TH2iTQe/qZKzDR7fTfXRGWjTm3Z1IFaMD1X6AEq0Ovy2burdXpYH10DpLibVbw9fAO
	 Kf4jd4YHPAyl4zjox9IbGpLidQ4fmUZdSu7ZLP3zwLEWvHt+4dCNHdDIaalj5atSL8
	 De/vlOwuN9l1ztZMfrsbOL2SaXtZEp01fe3W3hHK5oXKgKVnXJUU7pCiFnFI9grkwf
	 65WMzPjOjP0sw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=20v3=207/7]=20xen/arm:=20scmi:=20generate=20scmi=20dt=20node=20for=20DomUs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741976899091
To: "Grygorii Strashko" <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Roger Pau Monne" <roger.pau@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Oleksii Moisieiev" <oleksii_moisieiev@epam.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Juergen Gross" <jgross@suse.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
Message-Id: <Z9R1Qqj91RQGXl4T@l14>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com> <20250311111618.1850927-8-grygorii_strashko@epam.com>
In-Reply-To: <20250311111618.1850927-8-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5921751e1bf34a4a91bbcdad8eebdd74?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250314:md
Date: Fri, 14 Mar 2025 18:28:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 11, 2025 at 01:16:18PM +0200, Grygorii Strashko wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 2ddc3f4f426d..f4ffab2021cd 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2229,6 +2229,24 @@ out:
>  
>      return ret;
>  }
> +
> +int xc_domain_get_sci_info(xc_interface *xch, uint32_t domid,
> +                            uint64_t *paddr, uint32_t *func_id)
> +{
> +    struct xen_domctl domctl = {};
> +
> +    memset(&domctl, 0, sizeof(domctl));

This memset() looks redundant with variable initialisation.

> +    domctl.cmd = XEN_DOMCTL_get_sci_info;
> +    domctl.domain = domid;

There's one way to write these first few lines more nicely:

    struct xen_domctl domctl = {
        .cmd = XEN_DOMCTL_get_sci_info,
        .domain = domid,
    };

> +    if ( do_domctl(xch, &domctl) != 0 )
> +        return 1;

The error return value should be -1. (Returning the value returned by
do_domctl() is also an option.)

> +
> +    *paddr = domctl.u.sci_info.paddr;
> +    *func_id = domctl.u.sci_info.func_id;
> +    return 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index cdf5edb299af..cc54abc1ea79 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -9,6 +9,7 @@
>  #include <libfdt.h>
>  #include <assert.h>
>  #include <xen/device_tree_defs.h>
> +#include <xenhypfs.h>
>  
>  /*
>   * There is no clear requirements for the total size of Virtio MMIO region.
> @@ -640,9 +641,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>      int res;
>      LOG(DEBUG, "Creating OP-TEE node in dtb");
>  
> -    res = fdt_begin_node(fdt, "firmware");
> -    if (res) return res;
> -
>      res = fdt_begin_node(fdt, "optee");
>      if (res) return res;
>  
> @@ -655,9 +653,6 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
>      res = fdt_end_node(fdt);
>      if (res) return res;
>  
> -    res = fdt_end_node(fdt);
> -    if (res) return res;
> -
>      return 0;
>  }
>  
> @@ -1191,10 +1186,9 @@ static int copy_node(libxl__gc *gc, void *fdt, void *pfdt,
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
> @@ -1214,12 +1208,277 @@ static int copy_node_by_path(libxl__gc *gc, const char *path,
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
> +static int map_sci_page(libxl__gc *gc, uint32_t domid, uint64_t paddr,
> +                         uint64_t guest_addr)
> +{
> +    int ret;
> +    uint64_t _paddr_pfn = paddr >> XC_PAGE_SHIFT;
> +    uint64_t _guest_pfn = guest_addr >> XC_PAGE_SHIFT;
> +
> +    assert(paddr && guest_addr);
> +    LOG(DEBUG, "[%d] mapping sci shmem page %"PRIx64, domid, _paddr_pfn);

Use LOGD() instead, to print domid:
   LOGD(DEBUG, domid, "mapping sci shmem page %"PRIx64, _paddr_pfn);

And use LOGD() instead of LOG() throughout the patch whenever `domid` is
available.

> +
> +    ret = xc_domain_iomem_permission(CTX->xch, domid, _paddr_pfn, 1, 1);
> +    if (ret < 0) {
> +        LOG(ERROR,
> +              "failed give domain access to iomem page %"PRIx64,
> +             _paddr_pfn);

You can use LOGED() variant, which would also print errno in the log as
well. You can use it everything you log an error from a system function
(or xc_* one which should set errno on error).

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
> +static int scmi_dt_make_shmem_node(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +    char buf[64];
> +
> +    snprintf(buf, sizeof(buf), "scmi-shmem@%llx", GUEST_SCI_SHMEM_BASE);
> +
> +    res = fdt_begin_node(fdt, buf);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "arm,scmi-shmem");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> +                    GUEST_ROOT_SIZE_CELLS, 1,
> +                    GUEST_SCI_SHMEM_BASE, GUEST_SCI_SHMEM_SIZE);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_SCMI);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
> +static const char *name_from_path(const char *path)
> +{
> +    return strrchr(path, '/') + 1;

This function should probably return NULL in case the chr '/' isn't
found (strrchr returns NULL) instead of 0x1.

Also, it might be worth moving this function to just after "#ifdef
ENABLE_PARTIAL_DEVICE_TREE" in the source file, seen that
get_path_nodeoff() could potentially use it as well.

> +}
> +
> +static int dt_copy_properties(libxl__gc *gc, void* fdt, void *xen_fdt,

                                                ^ void *fdt.

> +        const char *full_name)
> +{
> +    int propoff, nameoff, r, nodeoff;
> +    const struct fdt_property *prop;
> +
> +    LOG(DEBUG, "Copy properties for node: %s", full_name);
> +    nodeoff = get_path_nodeoff(full_name, xen_fdt);
> +    if (nodeoff < 0)
> +        return -FDT_ERR_NOTFOUND;
> +
> +    for (propoff = fdt_first_property_offset(xen_fdt, nodeoff);
> +         propoff >= 0;
> +         propoff = fdt_next_property_offset(xen_fdt, propoff)) {
> +
> +        if (!(prop = fdt_get_property_by_offset(xen_fdt, propoff, NULL)))
> +            return -FDT_ERR_INTERNAL;
> +
> +        nameoff = fdt32_to_cpu(prop->nameoff);
> +
> +        /* Skipping phandle nodes in xen device-tree */
> +        if (strcmp(fdt_string(xen_fdt,nameoff), "phandle") == 0 ||
> +            strcmp(fdt_string(xen_fdt, nameoff), "linux,phandle") == 0)
> +            continue;
> +
> +        r = fdt_property(fdt, fdt_string(xen_fdt, nameoff),
> +                         prop->data, fdt32_to_cpu(prop->len));
> +        if (r) return r;
> +    }
> +
> +    return (propoff != -FDT_ERR_NOTFOUND)? propoff : 0;
> +}
> +
> +static int scmi_dt_scan_node(libxl__gc *gc, void *fdt, void *pfdt,
> +                             void *xen_fdt, int nodeoff)
> +{
> +    int rc;

Could you call this variable `r` instead? `rc` is reserved for libxl's
returns codes. See "CONVENTIONAL VARIABLE NAMES" in
libs/light/CODING_STYLE.

> +    int node_next;
> +    char full_name[128];
> +    uint32_t phandle;
> +
> +    node_next = fdt_first_subnode(pfdt, nodeoff);
> +    while (node_next > 0)
> +    {
> +        LOG(ERROR,"Processing node %s",
> +                fdt_get_name(pfdt, node_next, NULL));
> +
> +        phandle = fdt_get_phandle(pfdt, node_next);
> +
> +        rc = fdt_get_path(pfdt, node_next, full_name, sizeof(full_name));
> +        if (rc) return rc;
> +
> +        rc = fdt_begin_node(fdt, name_from_path(full_name));
> +        if (rc) return rc;
> +
> +        rc = dt_copy_properties(gc, fdt, xen_fdt, full_name);
> +        if (rc) return rc;
> +
> +        if (phandle) {
> +            rc = fdt_property_cell(fdt, "phandle", phandle);
> +            if (rc) return rc;
> +        }
> +
> +        rc = scmi_dt_scan_node(gc, fdt, pfdt, xen_fdt, node_next);
> +        if (rc) return rc;
> +
> +        rc = fdt_end_node(fdt);
> +        if (rc) return rc;
> +
> +        node_next = fdt_next_subnode(pfdt, node_next);
> +    }
> +
> +    return 0;
> +}
> +
> +static int scmi_hypfs_fdt_check(libxl__gc *gc, void *fdt)
> +{
> +    int r;
> +
> +    if (fdt_magic(fdt) != FDT_MAGIC) {
> +         LOG(ERROR, "FDT is not a valid Flat Device Tree");
> +         return ERROR_FAIL;
> +     }
> +
> +     r = fdt_check_header(fdt);
> +     if (r) {
> +         LOG(ERROR, "Failed to check the FDT (%d)", r);
> +         return ERROR_FAIL;
> +     }
> +
> +     return r;
> +}
> +
> +static int scmi_dt_copy_subnodes(libxl__gc *gc, void *fdt, void *pfdt)
> +{
> +    struct xenhypfs_handle *hdl;
> +    struct xenhypfs_dirent *ent;
> +    void *xen_fdt;
> +    int rc, nodeoff;
> +
> +    hdl = xenhypfs_open(NULL, 0);
> +    if (!hdl)
> +        return -EINVAL;

That value been return doesn't make sense. Also !0 is probably enough.

> +
> +    xen_fdt = xenhypfs_read_raw(hdl, "/devicetree", &ent);
> +    if (!xen_fdt) {
> +        rc = errno;

Is doesn't seems taht anything in the functions constructind the device
tree look at return values as if the were "errno". There's maybe just
one libxl__prepare_dtb() which looks at those value as an FDT_* error
code, via the FDT() macro. Most of the other just check for !0 values.

If errno value is uesful here, you can at least log it by replacing
LOG() by LOGE() in this next line:

> +        LOG(ERROR, "Unable to read hypfs entry: %d", rc);

`rc` which contain `errno` here isn't useful to log as is, instead use
LOGE() which will write strerror(errno) automatically. Also, maybe
writing which entry can't be read in the log might be useful.

[...]

Please use `r` to store return code of many of those new function
instead of a mixture of `res`, `ret`, `r`, `rc`. `rc` is reserved for
libxl error code, and are expected to by returned by libxl_*()
functions. But it seems that most functions dealing with the device tree
actually are expected to return FDT_* error code.


Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

