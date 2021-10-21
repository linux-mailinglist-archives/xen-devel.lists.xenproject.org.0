Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41C436A8E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 20:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214582.373183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdcpu-0006PL-MF; Thu, 21 Oct 2021 18:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214582.373183; Thu, 21 Oct 2021 18:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdcpu-0006NU-Ix; Thu, 21 Oct 2021 18:30:42 +0000
Received: by outflank-mailman (input) for mailman id 214582;
 Thu, 21 Oct 2021 18:30:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdcps-0006NM-WF
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 18:30:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdcpp-00073K-Bs; Thu, 21 Oct 2021 18:30:37 +0000
Received: from [54.239.6.190] (helo=[192.168.27.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdcpp-0005A3-0p; Thu, 21 Oct 2021 18:30:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xDmdELIKYqcTRmCROXLF9qemMwnOCXQs9m7o1NUuyV0=; b=o199ey6/gzoHPvUUGwcJ6wgKQO
	11izxkjcvKkJuBnZQNbG6c0TG0vwKOGXq5j1TatiAODwitALeEBwLQnitBMdbNfyvy2FC1HvMzShu
	VPCHRgAnHiXbP0rQVh0sAEdSSkpoUUu0De2MH4SclxzdFbCfksptd2HJwdwSyDp1BnV8=;
Message-ID: <13240b69-f7bb-6a64-b89c-b7c2cbb7e465@xen.org>
Date: Thu, 21 Oct 2021 19:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 10/13] xen/arm: Implement device tree node
 addition functionalities
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-11-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-11-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 02/09/2021 07:06, Vikram Garhwal wrote:
> Introduce domctl XEN_DOMCTL_addfpga to add a device-tree node through device

XEN_DOMCTL_* are hypercalls to manage a given domain. However, here you 
are modifying the system.

This is similar to managing PCI devices, except here we are dealing with 
platforms devices. In the case of PCI devices, we are using PHYSDEVOP_*.

If we only expect the toolstack to the call (e.g. the kernel won't use 
it directly), then it would be better to use SYSCTL_* as they are not 
stable (so we have more flexibility to modify the layout).

Furthermore, rather than introduciong 2 new sub-hypercalls for 
XEN_SYSCTL_* I would introduce a single sub-hypercall that takes a 
command (e.g. add/remove).

Regarding the name, in theory this feature is not FPGA specific. So I 
would prefer a more generic name, maybe XEN_DOMCTL_dt_overlay?

> tree overlay. This works with a device tree overlay(.dtbo) as input.
> 
> Add check_pfdt() to do sanity check on the dtbo.

 From my experience with libfdt, the library tends to consider the DTB 
to be sound. So we would have to trust what the toolstack is provided us.

So I think we need to make clear that this is basic sanity check and 
there are no expectation that we will be able to deal with a random blob.

> 
> Also, added overlay_get_node_info() to get the node's full name with path. This
> comes handy when checking node for duplication.
> 
> Each time a overlay node is added, a new fdt(memcpy of device_tree_flattened) is
> created and updated with overlay node. This updated fdt is further unflattened
> to a dt_host_new. Next, it checks if overlay node already exists in the dt_host.
> If overlay node doesn't exist then find the overlay node in dt_host_new, find
> the overlay node's parent in dt_host and add the node as child under parent in
> the dt_host. The node is attached as the last node under target parent.
> 
> Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
> overlay node.
> 
> When a node is added using overlay, a new entry is allocated in the
> overlay_track to keep the track of memory allocation due to addition of overlay
> node. This is helpful for freeing the memory allocated when a device tree node
> is removed with domctl XEN_DOMCTL_delfpga domctl.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/arch/arm/domctl.c         | 262 ++++++++++++++++++++++++++++++++++++++++++
>   xen/common/device_tree.c      |  54 +++++++++
>   xen/include/public/domctl.h   |   7 ++
>   xen/include/xen/device_tree.h |   1 +
>   4 files changed, 324 insertions(+)
> 
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index 5986934..0ac635f 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -15,6 +15,8 @@
>   #include <xen/types.h>
>   #include <xsm/xsm.h>
>   #include <public/domctl.h>
> +/* Included for FPGA dt add. */

We don't usually write done why an header is included. So I would remove 
this comment.

> +#include <xen/libfdt/libfdt.h>
>   #include <xen/xmalloc.h>
>   #include <xen/device_tree.h>
>   #include <asm/domain_build.h>
> @@ -68,6 +70,61 @@ static int handle_vuart_init(struct domain *d,
>       return rc;
>   }
>   
> +static int check_pfdt(void *pfdt, uint32_t pfdt_size)
> +{
> +    if ( fdt_totalsize(pfdt) != pfdt_size )
> +    {
> +        printk(XENLOG_ERR "Partial FDT is not a valid Flat Device Tree\n");
> +        return -EFAULT;

I think -EINVAL is more suitable.

> +    }
> +
> +    if ( fdt_check_header(pfdt) )
> +    {
> +        printk(XENLOG_ERR "Partial FDT is not a valid Flat Device Tree\n");

The printk() is exactly the same as above. So how about combining the 
two check?

Furthemore, from the commit message, the pfdt is an overlay fdt. So 
shouldn't we have write "The overlay FDT" rather than "Partial FDT"?

> +        return -EFAULT;
> +    }
> +
> +    return 0;
> +}
> +
> +static void overlay_get_node_info(void *fdto, char *node_full_path)
> +{
> +    int fragment;
> +
> +    /*
> +     * Handle overlay nodes. But for now we are just handling one node.

Is this a limitation you plan to handle before this series is going to 
be committed?

> +     */
> +    fdt_for_each_subnode(fragment, fdto, 0)
> +    {
> +        int target;
> +        int overlay;
> +        int subnode;
> +        const char *target_path;
> +
> +        target = overlay_get_target(device_tree_flattened, fdto, fragment,
> +                                    &target_path);
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            const char *node_name = fdt_get_name(fdto, subnode, NULL);
> +            int node_name_len = strlen(node_name);
> +            int target_path_len = strlen(target_path);
> +
> +            memcpy(node_full_path, target_path, target_path_len);
Looking at the caller (handle_add_fpga_overlay()), the node_full_path is 
a fixed array. What does guarantee that the array is large enough to 
target_path?

> +
> +            node_full_path[target_path_len] = '/';
> +
> +            memcpy(node_full_path + target_path_len + 1, node_name,
> +                   node_name_len);
> +
> +            node_full_path[target_path_len + 1 + node_name_len] = '\0';
> +
> +            return;
> +        }
> +    }
> +}
> +
>   /*
>    * First finds the device node to remove. Check if the device is being used by
>    * any dom and finally remove it from dt_host. IOMMU is already being taken care
> @@ -194,6 +251,181 @@ out:
>       return rc;
>   }
>   
> +/*
> + * Adds only one device node at a time under target node.
> + * We use dt_host_new to unflatten the updated device_tree_flattened. This is
> + * done to avoid the removal of device_tree generation, iomem regions mapping to
> + * DOM0 done by handle_node().

Below you are using "hardware_domain" which may or may not be dom0. So 
replace "dom0" with "hardware domain".

> + */
> +static long handle_add_fpga_overlay(void *pfdt, uint32_t pfdt_size)
> +{
> +    int rc = 0;
> +    struct dt_device_node *fpga_node;
> +    char node_full_path[128];
> +    void *fdt = xmalloc_bytes(fdt_totalsize(device_tree_flattened));

I would prefer if the xmalloc_bytes() happens closer to the check "fdt 
== NULL" below. This makes easier to link the two.

In addition to that, device_tree_flattened will be NULL when Xen is 
booting with ACPI. So we need to return an error if one try to use this 
feature on such platform.

Lastly, I think we should consider to protect all the new code under a 
config so this is not compiled by default.

> +    struct dt_device_node *dt_host_new;
> +    struct domain *d = hardware_domain;
> +    struct overlay_track *tr = NULL;
> +    int node_full_path_namelen;
> +    unsigned int naddr;
> +    unsigned int i;
> +    u64 addr, size;
> +
> +    if ( fdt == NULL )
> +        return ENOMEM;

We usually add - in from of the errno.

> +
> +    spin_lock(&overlay_lock);
> +
> +    memcpy(fdt, device_tree_flattened, fdt_totalsize(device_tree_flattened));
> +
> +    rc = check_pfdt(pfdt, pfdt_size);
> +
> +    if ( rc )
> +        goto err;
> +
> +    overlay_get_node_info(pfdt, node_full_path);

You don't really need this info until the overlay has been applied. So I 
would suggest to move this after fdt_overlay_apply().

> +
> +    rc = fdt_overlay_apply(fdt, pfdt);
> +
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Adding overlay node %s failed with error %d\n",
> +               node_full_path, rc);
> +        goto err;
> +    }
> +
> +    /* Check if node already exists in dt_host. */
> +    fpga_node = dt_find_node_by_path(node_full_path);
> +
> +    if ( fpga_node != NULL )
> +    {
> +        printk(XENLOG_ERR "node %s exists in device tree\n", node_full_path);
> +        rc = -EINVAL;
> +        goto err;
> +    }
> +
> +    /* Unflatten the fdt into a new dt_host. */
> +    unflatten_device_tree(fdt, &dt_host_new);

Looking at this function, there is at least a potential allocation 
failure. So it needs to be updated to propagate any error in order to 
use it in an hypercall.

Furthemore, AFAICT, the function will continue even if there are 
corrupted node. This brings back to my point above that this hypercall 
will only work with trusted DT. I am OK with that so long we written it 
clearly in the interface and documentation.

> +
> +    /* Find the newly added node in dt_host_new by it's full path. */
> +    fpga_node = _dt_find_node_by_path(dt_host_new, node_full_path);
> +
> +    if ( fpga_node == NULL )
> +    {
> +        dt_dprintk("%s node not found\n", node_full_path);
> +        rc = -EFAULT;
> +        xfree(dt_host_new);
> +        goto err;
> +    }
> +
> +    /* Just keep the node we intend to add. Remove every other node in list. */
> +    fpga_node->allnext = NULL;
> +    fpga_node->sibling = NULL;

IMHO, the two lines belong to fpga_add_node().

> +
> +    /* Add the node to dt_host. */
> +    rc = fpga_add_node(fpga_node, fpga_node->parent->full_name);
> +
> +    if ( rc )
> +    {
> +        /* Node not added in dt_host. Safe to free dt_host_new. */
> +        xfree(dt_host_new);
> +        goto err;
> +    }
> +
> +    /* Get the node from dt_host and add interrupt and IOMMUs. */
> +    fpga_node = dt_find_node_by_path(fpga_node->full_name);
> +
> +    if ( fpga_node == NULL )
> +    {
> +        /* Sanity check. But code will never come in this loop. */

There is no loop here. So what did you mean?

> +        printk(XENLOG_ERR "Cannot find %s node under updated dt_host\n",
> +               fpga_node->name);
> +        goto remove_node;
> +    }
> +

The code below is pretty much a copy of handle_device(). Can you look to 
re-use it?

> +    /* First let's handle the interrupts. */
> +    rc = handle_device_interrupts(d, fpga_node, false);
> +
> +    if ( rc )
> +    {
> +        printk(XENLOG_G_ERR "Interrupt failed\n");
> +        goto remove_node;
> +    }
> +
> +    /* Add device to IOMMUs */
> +    rc = iommu_add_dt_device(fpga_node);
> +
> +    if ( rc < 0 )
> +    {
> +        printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
> +               dt_node_full_name(fpga_node));
> +        goto remove_node;
> +    }
> +
> +    /* Set permissions. */
> +    naddr = dt_number_of_address(fpga_node);
> +
> +    dt_dprintk("%s passthrough = %d naddr = %u\n",
> +               dt_node_full_name(fpga_node), false, naddr);
> +
> +    /* Give permission and map MMIOs */
> +    for ( i = 0; i < naddr; i++ )
> +    {
> +        struct map_range_data mr_data = { .d = d, .p2mt = p2m_mmio_direct_c };
> +        rc = dt_device_get_address(fpga_node, i, &addr, &size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                   i, dt_node_full_name(fpga_node));
> +            goto remove_node;
> +        }
> +
> +        rc = map_range_to_domain(fpga_node, addr, size, &mr_data);
> +        if ( rc )
> +            goto remove_node;
> +    }
> +
> +    /* This will happen if everything above goes right. */
> +    tr = xzalloc(struct overlay_track);

xzalloc() can fail. So you need to check the return.

> +    tr->dt_host_new = dt_host_new;

Looking at the code above, dt_host_new is pretty much a full copy of the 
DT + the overlay. From my understanding, the flat device-tree can be up 
to 2MB, therefore the unflatten one is likely bigger.

So to me this seems quite a waste of memory. Can we look to only keep in 
memory the nodes we need?

> +    node_full_path_namelen = strlen(node_full_path);
> +    tr->node_fullname = xmalloc_bytes(node_full_path_namelen + 1);
> +
> +    if ( tr->node_fullname == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto remove_node;
> +    }
> +
> +    memcpy(tr->node_fullname, node_full_path, node_full_path_namelen);
> +    tr->node_fullname[node_full_path_namelen] = '\0';
> +
> +    INIT_LIST_HEAD(&tr->entry);
> +    list_add_tail(&tr->entry, &overlay_tracker);
> +
> +err:
> +    spin_unlock(&overlay_lock);
> +    xfree(fdt);
> +    return rc;
> +
> +/*
> + * Failure case. We need to remove the node, free tracker(if tr exists) and
> + * dt_host_new. As the tracker is not in list yet so it doesn't get freed in
> + * handle_del_fpga_nodes() and due to that dt_host_new will not get freed so we
> + * we free tracker and dt_host_new here.
> + */
> +remove_node:
> +    spin_unlock(&overlay_lock);
> +    handle_del_fpga_nodes(node_full_path);
> +    xfree(dt_host_new);
> +
> +    if ( tr )
> +        xfree(tr);
> +
> +    xfree(fdt);
> +    return rc;
> +}
> +
>   long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>   {
> @@ -323,6 +555,36 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>           return rc;
>       }
>   
> +    case XEN_DOMCTL_addfpga:
> +    {
> +        void *pfdt;
> +        int rc;
> +
> +        if ( domctl->u.fpga_add_dt.pfdt_size > 0 )
> +            pfdt = xmalloc_bytes(domctl->u.fpga_add_dt.pfdt_size);

Can we limit the size of the blob?

> +        else
> +            return -EINVAL;
> +
> +        if ( pfdt == NULL )
> +            return -ENOMEM;
> +
> +        rc = copy_from_guest(pfdt, domctl->u.fpga_add_dt.pfdt,
> +                             domctl->u.fpga_add_dt.pfdt_size);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "copy from guest failed\n");
> +            xfree(pfdt);
> +
> +            return -EFAULT;
> +        }
> +
> +        rc = handle_add_fpga_overlay(pfdt, domctl->u.fpga_add_dt.pfdt_size);
> +
> +        xfree(pfdt);
> +
> +        return rc;
> +    }
> +
>       case XEN_DOMCTL_delfpga:
>       {
>           char *full_dt_node_path;
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 04f2578..d062c17 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -324,6 +324,60 @@ void dt_print_node_names(struct dt_device_node *dt)
>       return;
>   }
>   
> +int fpga_add_node(struct dt_device_node *fpga_node,
> +                  const char *parent_node_path)
> +{
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *np;
> +    struct dt_device_node *next_node;
> +    struct dt_device_node *new_node;
> +
> +    parent_node = dt_find_node_by_path(parent_node_path);
> +
> +    new_node = fpga_node;
> +
> +    if ( new_node == NULL )
> +        return -EINVAL;
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("Node not found. Partial dtb will not be added");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * If node is found. We can attach the fpga_node as a child of the
> +     * parent node.
> +     */
> +
> +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +    {

I would suggest to clearify in the comment what this loop is for. This 
would make easier to understand that the body of the loop is left empty 
on purpose.

> +    }
> +
> +    /*
> +     * Before attaching also check if the parent node of fpga_node is also
> +     * same named as parent.
> +     */
> +    next_node = np->allnext;
> +
> +    new_node->parent = parent_node;
> +    np->sibling = new_node;
> +    np->allnext = new_node;
> +
> +    /*
> +     * Reach at the end of fpga_node.
> +     * TODO: Remove this loop as we are just adding one node for now.

For clarification, by "one node", do you mean top-level node or are you 
saying this node has no child?

> +     */
> +    for ( np = new_node; np->allnext != NULL; np = np->allnext )
> +    {
> +    }
> +
> +    /* Now plug next_node at the end of fpga_node. */
> +    np->allnext = next_node;
> +
> +    return 0;
> +}
> +
>   int fpga_del_node(struct dt_device_node *device_node)
>   {
>       struct dt_device_node *np;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b1b8efd..ce4667e 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1175,6 +1175,11 @@ struct xen_domctl_fpga_del_dt {
>       uint32_t size;
>   };
>   
> +/* XEN_DOMCTL_fpga_add. */

Please add some documentation about the new hypercall.

> +struct xen_domctl_fpga_add_dt {
> +    XEN_GUEST_HANDLE_64(void) pfdt;
> +    uint32_t pfdt_size;  /* Partial dtb size. */
> +};
>   
>   struct xen_domctl {
>       uint32_t cmd;
> @@ -1261,6 +1266,7 @@ struct xen_domctl {
>   #define XEN_DOMCTL_get_cpu_policy                82
>   #define XEN_DOMCTL_set_cpu_policy                83
>   #define XEN_DOMCTL_vmtrace_op                    84
> +#define XEN_DOMCTL_addfpga                      85
>   #define XEN_DOMCTL_delfpga                      86
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> @@ -1323,6 +1329,7 @@ struct xen_domctl {
>           struct xen_domctl_psr_alloc         psr_alloc;
>           struct xen_domctl_vuart_op          vuart_op;
>           struct xen_domctl_vmtrace_op        vmtrace_op;
> +        struct xen_domctl_fpga_add_dt       fpga_add_dt;
>           struct xen_domctl_fpga_del_dt       fpga_del_dt;
>           uint8_t                             pad[128];
>       } u;
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index eb7f645..4c8dec6 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -496,6 +496,7 @@ int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
>    * Prints all node names.
>    */
>   void dt_print_node_names(struct dt_device_node *dt);
> +int fpga_add_node(struct dt_device_node *fpga_node, const char *parent_node);
>   int fpga_del_node(struct dt_device_node *device_node);
>   
>   /**
> 

Cheers,

-- 
Julien Grall

