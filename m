Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFF247E9E9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 01:46:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251188.432480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0YiP-0003bg-0d; Fri, 24 Dec 2021 00:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251188.432480; Fri, 24 Dec 2021 00:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0YiO-0003Zt-T2; Fri, 24 Dec 2021 00:45:44 +0000
Received: by outflank-mailman (input) for mailman id 251188;
 Fri, 24 Dec 2021 00:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n0YiN-0003Zn-Pk
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 00:45:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10be756-6452-11ec-bb0b-79c175774b5d;
 Fri, 24 Dec 2021 01:45:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52E5B61FA7;
 Fri, 24 Dec 2021 00:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D409C36AE9;
 Fri, 24 Dec 2021 00:45:37 +0000 (UTC)
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
X-Inumbo-ID: d10be756-6452-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640306738;
	bh=4HefQp9Azj2EUV+cvY+xo0e+RXN2FORcGKY0eB6eSZ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EXEj/4278N0p+0ETw17k5O2ggebcufoBqG4StJgOWGDk+hr33MQ2dBMeVwNzf286K
	 pZ8a9/ZebNLP/xWwkTw1Ws6nRstzolQ1z5KrcZiUZO5XMopxI+9CbSRaPxlt8FWkIt
	 ecfalkzZqx9cvn9mSM8gQukg/4CHc4ZWkqlFs9YT3Dg2mp14eri72iEoV7Pik/7lr6
	 MG9VuCCsilyo1i1MPwDK/vprkZWB1qybZPJ5NNgj2FbeflM+sy2euMPK6U32DPTGDO
	 RHMIRTCtZic/FVyQV7kTmKNgKf/qELyPsCgDaUZX0SV0WxaiNFpILUwT9eP9KRJiJO
	 zTXJa1Mhanntw==
Date: Thu, 23 Dec 2021 16:45:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org, bertrand.marquis@arm.com, 
    volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN][RFC PATCH v2 08/12] xen/arm: Implement device tree node
 removal functionalities
In-Reply-To: <229a8fb4-816d-bfc3-31d3-5c375c5cd14b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2112231627060.2060010@ubuntu-linux-20-04-desktop>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com> <1636441347-133850-9-git-send-email-fnu.vikram@xilinx.com> <229a8fb4-816d-bfc3-31d3-5c375c5cd14b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Dec 2021, Julien Grall wrote:
> Hi,
> 
> On 09/11/2021 08:02, Vikram Garhwal wrote:
> > Introduce sysctl XEN_SYSCTL_overlay to remove device-tree nodes added using
> 
> I agree with Jan about the name being too generic. I will comment on this a
> bit further down.
> 
> > device tree overlay.
> > 
> > xl overlay remove file.dtbo:
> >      Removes all the nodes in a given dtbo.
> >      First, removes IRQ permissions and MMIO accesses. Next, it finds the
> > nodes
> >      in dt_host and delete the device node entries from dt_host.
> > 
> >      The nodes get removed only if it is not used by any of dom0 or domus.
> > If
> >      even one of the node in dtbo is not available for removal i.e. either
> > not
> >      there in dt_host or currently used by any domain, in that case we don't
> >      remove any node in the given dtbo.
> > 
> > Also, added overlay_track struct to keep the track of added node through
> > device
> > tree overlay. overlay_track has dt_host_new which is unflattened form of
> > updated
> > fdt and name of overlay node. When a node is removed, we also free the
> > memory
> > used by overlay_track for the particular overlay node.
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > ---
> >   xen/common/device_tree.c      |  53 ++++++
> >   xen/common/sysctl.c           | 372
> > ++++++++++++++++++++++++++++++++++++++++++
> >   xen/include/public/sysctl.h   |  23 +++
> >   xen/include/xen/device_tree.h |   4 +
> >   4 files changed, 452 insertions(+)
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 26d2e28..19320e1 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -385,6 +385,59 @@ void dt_print_node_names(struct dt_device_node *dt)
> >       return;
> >   }
> >   +#if defined (CONFIG_OVERLAY_DTB)
> > +int overlay_remove_node(struct dt_device_node *device_node)
> 
> This want to be prefixed with dt_* so it is clear which components it is
> touching. But I think all the DT overlay code (including sysctl) should be
> moved in a new file (maybe dt_overlay.c) to spreading the overlay code and
> growing
> the size of sysctl.c.
> 
> > +{
> > +    struct dt_device_node *np;
> > +    struct dt_device_node *parent_node;
> > +    struct dt_device_node *current_node;
> > +
> > +    parent_node = device_node->parent;
> > +
> > +    current_node = parent_node;
> > +
> > +    if ( parent_node == NULL )
> > +    {
> > +        dt_dprintk("%s's parent node not found\n", device_node->name);
> > +        return -EFAULT;
> > +    }
> > +
> > +    np = parent_node->child;
> > +
> > +    if ( np == NULL )
> > +    {
> > +        dt_dprintk("parent node %s's not found\n", parent_node->name);
> > +        return -EFAULT;
> > +    }
> > +
> > +    /* If node to be removed is only child node or first child. */
> > +    if ( np->name == device_node->name )
> 
> Why are you checking the equality between the fields name rather than the node
> itself?
> 
> If it is intended, then I think this wants to be explained because often
> people wants to check the names are equal (e.g str*cmp()) rather than the
> pointer where the names are stored.
> 
> > +    {
> > +        current_node->allnext = np->next;
> > +        return 0;
> > +    }
> > +
> > +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> > +    {
> > +        current_node = np;
> > +        if ( np->sibling->name == device_node->name )
> 
> Same question.
> 
> > +        {
> > +            /* Found the node. Now we remove it. */
> > +            current_node->allnext = np->allnext->allnext;
> > +
> > +            if ( np->sibling->sibling )
> > +                current_node->sibling = np->sibling->sibling;
> > +            else
> > +                current_node->sibling = NULL;
> > +
> > +            break;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +#endif
> > +
> >   int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
> >                             struct dt_device_node **node)
> >   {
> > diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> > index f2dab72..fca47f5 100644
> > --- a/xen/common/sysctl.c
> > +++ b/xen/common/sysctl.c
> > @@ -28,6 +28,311 @@
> >   #include <xen/livepatch.h>
> >   #include <xen/coverage.h>
> >   +#if defined (CONFIG_OVERLAY_DTB)
> 
> This can be shortend to #ifdef CONFIG_<...>.
> 
> > +#include <xen/list.h>
> > +#include <xen/libfdt/libfdt.h>
> > +#include <xen/xmalloc.h>
> > +#include <xen/device_tree.h>
> > +#include <asm/domain_build.h>
> > +#endif
> > +
> > +#if defined (CONFIG_OVERLAY_DTB)
> 
> Same here.
> 
> > +static LIST_HEAD(overlay_tracker);
> > +static DEFINE_SPINLOCK(overlay_lock);
> > +
> > +/*
> > + * overlay_node_track describes information about added nodes through dtbo.
> > + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated
> > fdt'.
> > + * @node_fullname: Store the name of nodes.
> > + * @entry: List pointer.
> > + */
> > +struct overlay_track {
> > +    struct list_head entry;
> > +    struct dt_device_node *dt_host_new;
> > +    char **node_fullname;
> > +    uint8_t num_nodes;
> 
> Any reason to restrict to 256 nodes?
> 
> > +};
> > +
> > +/* Basic sanity check for the dtbo tool stack provided to Xen. */
> > +static int check_overlay_fdt(void *overlay_fdt, uint32_t overlay_fdt_size)
> This function doesn't modify overlay_fdt. So I think it should be const if
> fdt_total_size() and fdt_check_header() allows it.
> 
> > +{
> > +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
> > +          fdt_check_header(overlay_fdt) )
> > +    {
> > +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device
> > Tree\n");
> > +        return -EINVAL;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int overlay_node_count(void *fdto)
> > +{
> > +    int num_overlay_nodes = 0;
> 
> The name suggests this should be an unsiged int.
> 
> > +    int fragment;
> > +
> > +    fdt_for_each_subnode(fragment, fdto, 0)
> > +    {
> > +
> > +        int subnode;
> > +        int overlay;
> > +
> > +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> 
> This may return < 0 if __overlay__ is not found. From my understanding,
> fdt_for_each_subnode() would end up to start from 0.
> 
> So I think you want to add a check here.
> 
> > +
> > +        fdt_for_each_subnode(subnode, fdto, overlay)
> > +        {
> > +            num_overlay_nodes++;
> > +        }
> > +    }
> > +
> > +    return num_overlay_nodes;
> > +}
> > +
> > +/*
> > + * overlay_get_node_info will get the all node's full name with path. This
> > is
> > + * useful when checking node for duplication i.e. dtbo tries to add nodes
> > which
> > + * already exists in device tree.
> > + */
> > +static void overlay_get_node_info(void *fdto, char ***node_full_path,
> 
> You will retrieve mutiple nodes. So I think the function wants to be named
> 'overlay_get_nodes_info()'. Same for node_full_path.
> 
> Furthermore, you could drop one * if you return the list of paths. This will
> also allow you to return an error when xmalloc fails (see below)
> 
> Lastly, AFAICT, fdto can be const.
> 
> > +                                  int num_overlay_nodes)
> 
> This coud be unsigned int.
> 
> > +{
> > +    int fragment;
> > +    int node_num = 0;
> 
> This could be unsigned int.
> 
> > +
> > +    *node_full_path = xmalloc_bytes(num_overlay_nodes * sizeof(char *));
> 
> Memory allocation can fail.
> 
> > +
> > +    fdt_for_each_subnode(fragment, fdto, 0)
> > +    {
> > +        int target;
> > +        int overlay;
> > +        int subnode;
> > +        const char *target_path;
> > +
> > +        target = fdt_overlay_get_target(device_tree_flattened, fdto,
> > fragment,
> > +                                    &target_path);
> 
> fdt_overlay_get_target() can fail. Also, the indentation looks strange.
> 
> > +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> 
> fdt_subnode_offset can fail.
> 
> > +
> > +        fdt_for_each_subnode(subnode, fdto, overlay)
> > +        {
> > +            const char *node_name = fdt_get_name(fdto, subnode, NULL);
> 
> AFAIU, fdt_get_name() can return NULL;
> 
> > +            int node_name_len = strlen(node_name);
> 
> fdt_get_name() can already provide the len for you. Can you re-use it?
> 
> 
> 
> > +            int target_path_len = strlen(target_path);
> > +            int node_full_name_len = target_path_len + node_name_len + 2;
> 
> node_name_len, target_path_len, node_full_name_len can be unsigned. Also, I
> would add a comment explain what '2' refers to.
> 
> > +
> > +            (*node_full_path)[node_num] =
> > xmalloc_bytes(node_full_name_len);
> 
> xmalloc_bytes() can fail.
> 
> > +
> > +            memcpy((*node_full_path)[node_num], target_path,
> > target_path_len);
> > +
> > +            (*node_full_path)[node_num][target_path_len] = '/';
> > +
> > +            memcpy((*node_full_path)[node_num] + target_path_len + 1,
> > node_name,
> > +                   node_name_len);
> > +
> > +            (*node_full_path)[node_num][node_full_name_len - 1] = '\0';
> > +
> > +            node_num++;
> > +        }
> > +    }
> > +}
> > +
> > +/*
> > + * Checks if all the devices node listed are present in dt_host and used by
> > any
> > + * domain.
> > + */
> 
> Why do we need to handle all the nodes together? I think the code would end up
> to be simpler if we were handling node by node.
> 
> > +static int check_nodes(char **full_dt_node_path, uint32_t num_nodes)
> > +{
> > +    int rc = 0;
> > +    unsigned int i;
> > +    struct dt_device_node *overlay_node;
> > +    uint32_t ret = 0;
> 
> AFAICT, you are storing a domid here, so this wants to be a domid_t and
> possible renamed to domid.
> 
> > +
> > +    for ( i = 0; i < num_nodes; i++ ) {
> > +        dt_dprintk("Finding node %s in the dt_host\n",
> > full_dt_node_path[i]);
> > +
> > +        overlay_node = dt_find_node_by_path(full_dt_node_path[i]);
> > +
> > +        if ( overlay_node == NULL )
> > +        {
> > +            rc = -EINVAL;
> > +
> > +            printk(XENLOG_G_ERR "Device %s is not present in the tree."
> 
> You seem to use a mix of XENLOG_G_ERR and XENLOG_ERR. However, it is not
> entirely clear some messages are more critical than the other. Could you
> clarify?
> 
> > +                   " Removing nodes failed\n", full_dt_node_path[i]);
> 
> Coding style: We don't split error message even if they are more than 80
> lines. This helps grepping them in the log.
> 
> > +            return rc;
> > +        }
> > +
> > +        ret = dt_device_used_by(overlay_node);
> > +
> > +        dt_dprintk("Checking if node %s is used by any domain\n",
> > +                   full_dt_node_path[i]);
> > +
> > +        if ( ret != 0 && ret != DOMID_IO )
> 
> In the commit message you wrote:
> 
> "The nodes get removed only if it is not used by any of dom0 or domus"
> 
> This implies that this should return -EINVAL for domid as well. Can you make
> sure the two matches? (I am not sure which one you want).
> 
> Also, what does prevent the device to not be assigned for the check?
> 
> > +        {
> > +            rc = -EINVAL;
> 
> NIT: This is a bit pointless to set rc when it is just used 2 lines below in
> the return. The alternative is to replace the return with a break.
> 
> > +
> > +            printk(XENLOG_G_ERR "Device %s as it is being used by domain
> > %d."
> > +                   " Removing nodes failed\n", full_dt_node_path[i], ret);
> 
> Coding style: Same about the error message.
> 
> > +            return rc;
> > +        }
> > +    }
> > +
> > +    return rc;
> > +}
> > +
> > +/* Remove nodes from dt_host. */
> > +static int remove_nodes(char **full_dt_node_path, uint32_t num_nodes)
> 
> In the commit message, you said you wanted to remove all the nodes together.
> But this function could possibly fail leaving some nodes present or not.
> 
> As I wrote above, I think handling node by node would be fine. However, we
> need to make sure that the remove operation can be called again to clean-up
> the rest of the nodes.
> 
> > +{
> > +    struct domain *d = hardware_domain;
> > +    int rc = 0;
> > +    struct dt_device_node *overlay_node;
> > +    unsigned int naddr;
> > +    unsigned int i, j, nirq;
> > +    struct dt_raw_irq rirq;
> > +    u64 addr, size;
> > +
> > +    for ( j = 0; j < num_nodes; j++ ) {
> > +        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
> > +
> > +        overlay_node = dt_find_node_by_path(full_dt_node_path[j]);
> > +
> > +        nirq = dt_number_of_irq(overlay_node);
> > +
> > +        /* Remove IRQ permission */
> > +        for ( i = 0; i < nirq; i++ )
> > +        {
> > +            rc = dt_device_get_raw_irq(overlay_node, i, &rirq);
> > +            if ( rc )
> > +            {
> > +                printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> > +                       i, dt_node_full_name(overlay_node));
> > +                return rc;
> > +            }
> 
> The interrupt may not be routed to the GIC, in which case we want to skip
> them. So you want to check the controller is equal to dt_interrupt_controller.
> 
> The code is also quite similar to handle_device_interrupts(). So I would
> abstract the code to avoid duplication.
> 
> That said, I find a bit odd to have to parse the overlay again on remove given
> you expect the same to be passed.  I think it might be better to use rangeset
> to keep track of the interrupts added with that specific overlay.
> 
> This will reduce the possibility that remove can go wrong.
> 
> > +
> > +            rc = platform_get_irq(overlay_node, i);
> > +            if ( rc < 0 )
> > +            {
> > +                printk(XENLOG_ERR "Unable to get irq %u for %s\n",
> > +                       i, dt_node_full_name(overlay_node));
> > +                return rc;
> > +            }
> > +
> > +            rc = irq_deny_access(d, rc);
> 
> A few things:
> 
>   1) IRQs can be assigned to another domain without the device being assigned.
> So this want to be checked.
>   2) This is assuming the IRQ was not shared. I am not entirely sure how to
> solve this one. Maybe a TODO and note in the documentation will do for now.
> Stefano?

I think it is fine if we don't handle shared IRQs for now. A note in the
documentation and a TODO is OK.

