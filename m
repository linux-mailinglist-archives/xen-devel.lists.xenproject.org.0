Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DEB9B2FA2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826431.1240677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OUp-0006lE-DU; Mon, 28 Oct 2024 12:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826431.1240677; Mon, 28 Oct 2024 12:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OUp-0006jk-AR; Mon, 28 Oct 2024 12:05:19 +0000
Received: by outflank-mailman (input) for mailman id 826431;
 Mon, 28 Oct 2024 12:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5OUn-0006jc-8j
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:05:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4be23d5-9524-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:05:16 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c94861ee25so2410996a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 05:05:16 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62c42c7sm3113579a12.51.2024.10.28.05.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 05:05:15 -0700 (PDT)
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
X-Inumbo-ID: e4be23d5-9524-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730117116; x=1730721916; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZpevYCcbbF/l6J/XaEuwR4BPCJEXWWyXhTQ3y0eSLk=;
        b=GWjYOdC7fHHw0dsScSxm3y/WOvZzACmFm+l48gJvzd2o56x7xxSo1BOtxAASSqntVk
         X7Tgz5HrDg6uudd043fKZeQvytaUXGARDN0FOHPGS4iBcSEq8Tk2VhcJD3MPd+I+lNHA
         wym3SWn271QRdWarw7lIgWNxK0/8cek5SEvOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730117116; x=1730721916;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZpevYCcbbF/l6J/XaEuwR4BPCJEXWWyXhTQ3y0eSLk=;
        b=LqU4xGISLcnrnfowqut0SOrH5uVTQ7ErNd61bm2kv2qAIPa+9MuMV4TuxcOfoWcjPL
         PA693fRXs02G1paBxUboNXshVEmlylRgPwoQPMLvazPa25Gh3Dc6hgAE2mcgWrGXIvvk
         nzeWMbLSypiNx/hHi2gFX12zufN5YS9idFV3metkWT1zruRG00P808m/sBFNmiuFlQZH
         mc9kHmUiiLlf/saqmZuvnRnNSpSSQgN3qLvWmmZfTl4MTEyVN6viLVovOHXA1Cbv5Qgl
         whpZOkQmrYUsp0W4naFRQoAgZw+wJvOPjdMUvkipSQ05KrUqtamKs09wUUuOJTvqo9S2
         vRng==
X-Forwarded-Encrypted: i=1; AJvYcCWsRidsxeffcgF1S7uOqlhB2jB+ybFWMFIRVIPQlS5VtZcQN5RRCIcrAu3219XpNiRqQ7oMkRr8IwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywqy67CVrV5fbG1n0KEd7XYOMFYXiM4xehExA0oD2LlOwJ9q/KJ
	UIPSos9HPlU62hkbS2hsRPMwToP7dmmaBn+JX0cNHqRjS1UueNx9vI4HQMfLMUpocMVipTYmzbv
	g
X-Google-Smtp-Source: AGHT+IFjFBfmdxAX+cMaeN9D4wZTjSOeZkB/achZAfE3otZ1vnp7LRu3tZZANC1WUqF8JTJ7gttb8g==
X-Received: by 2002:a05:6402:1f4b:b0:5c8:9529:1b59 with SMTP id 4fb4d7f45d1cf-5cbbf8dec0bmr9571584a12.20.1730117115419;
        Mon, 28 Oct 2024 05:05:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Oct 2024 12:05:14 +0000
Message-Id: <D57FBXUKL8PH.1FQRR4NJ139AX@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Bernhard Kaindl" <bernhard.kaindl@cloud.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v4] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
X-Mailer: aerc 0.18.2
References: <20241027144305.1839348-1-bernhardkaindl7@gmail.com>
In-Reply-To: <20241027144305.1839348-1-bernhardkaindl7@gmail.com>

Hi,

On Sun Oct 27, 2024 at 2:43 PM GMT, Bernhard Kaindl wrote:
> From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
>
> At the moment, Xen keeps track of the spans of PFNs of the NUMA nodes.
> But the PFN span sometimes includes large MMIO holes, so these values
> might not be an exact representation of the total usable RAM of nodes.
>
> Xen does not need it, but the size of the NUMA node's memory can be
> helpful for management tools and HW information tools like hwloc/lstopo
> with its Xen backend for Dom0: https://github.com/xenserver-next/hwloc/
>
> First, introduce NODE_DATA(nodeid)->node_present_pages to node_data[],
> determine the sum of usable PFNs at boot and update them on memory_add().
>
> (The Linux kernel handles NODE_DATA->node_present_pages likewise)
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
> Changes in v3:
> - Use PFN_UP/DOWN, refactored further to simplify the code while leaving
>   compiler-level optimisations to the compiler's optimisation passes.
> Changes in v4:
> - Refactored code and doxygen documentation according to the review.
> ---
>  xen/arch/x86/numa.c      | 13 +++++++++++++
>  xen/arch/x86/x86_64/mm.c |  3 +++
>  xen/common/numa.c        | 36 +++++++++++++++++++++++++++++++++---
>  xen/include/xen/numa.h   | 21 +++++++++++++++++++++
>  4 files changed, 70 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index 4b0b297c7e..3c0574f773 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -100,6 +100,19 @@ unsigned int __init arch_get_dma_bitsize(void)
>                   + PAGE_SHIFT, 32);
>  }
> =20
> +/**
> + * @brief Retrieves the RAM range for a given index from the e820 memory=
 map.
> + *
> + * This function fetches the start and end address (exclusive) of a RAM =
range
> + * specified by the given index idx from the e820 memory map.
> + *
> + * @param idx The index of the RAM range in the e820 memory map to retri=
eve.
> + * @param start Pointer to store the start address of the RAM range.
> + * @param end Pointer to store the end address of the RAM range.

Same as setup_node_bootmem(), we probably want this to explicitly state
"exclusive" to indicate it's not the last address, but the address after.

> + *
> + * @return 0 on success, -ENOENT if the index is out of bounds,
> + *         or -ENODATA if the memory map at index idx is not of type E82=
0_RAM.
> + */
>  int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t =
*end)
>  {
>      if ( idx >=3D e820.nr_map )
> diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
> index b2a280fba3..66b9bed057 100644
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1334,6 +1334,9 @@ int memory_add(unsigned long spfn, unsigned long ep=
fn, unsigned int pxm)
>      share_hotadd_m2p_table(&info);
>      transfer_pages_to_heap(&info);
> =20
> +    /* Update the node's present pages (like the total_pages of the syst=
em) */
> +    NODE_DATA(node)->node_present_pages +=3D epfn - spfn;
> +
>      return 0;
> =20
>  destroy_m2p:
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 209c546a3b..9a8b805dd7 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -4,6 +4,7 @@
>   * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>   */
> =20
> +#include "xen/pfn.h"
>  #include <xen/init.h>
>  #include <xen/keyhandler.h>
>  #include <xen/mm.h>
> @@ -499,15 +500,44 @@ int __init compute_hash_shift(const struct node *no=
des,
>      return shift;
>  }
> =20
> -/* Initialize NODE_DATA given nodeid and start/end */
> +/**
> + * @brief Initialize a NUMA node's node_data structure at boot.
> + *
> + * It is given the NUMA node's index in the node_data array as well
> + * as the start and exclusive end address of the node's memory span
> + * as arguments and initializes the node_data entry with this informatio=
n.
> + *
> + * It then initializes the total number of usable memory pages within
> + * the NUMA node's memory span using the arch_get_ram_range() function.
> + *
> + * @param nodeid The index into the node_data array for the node.
> + * @param start The starting physical address of the node's memory range=
.
> + * @param end The exclusive ending physical address of the node's memory=
 range.
> + */
>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t e=
nd)
>  {
>      unsigned long start_pfn =3D paddr_to_pfn(start);
>      unsigned long end_pfn =3D paddr_to_pfn(end);
> +    struct node_data *numa_node =3D NODE_DATA(nodeid);
> +    paddr_t start_ram, end_ram;

With the loop in place and arch_get_ram_range() being called inside, these =
two
can further reduce scope by being moved inside as well.

> +    unsigned int idx =3D 0;
> +    unsigned long *pages =3D &numa_node->node_present_pages;
> =20
> -    NODE_DATA(nodeid)->node_start_pfn =3D start_pfn;
> -    NODE_DATA(nodeid)->node_spanned_pages =3D end_pfn - start_pfn;
> +    numa_node->node_start_pfn =3D start_pfn;
> +    numa_node->node_spanned_pages =3D end_pfn - start_pfn;
> +
> +    /* Calculate the number of present RAM pages within the node: */

nit: that last ":" feels a bit out of place

> +    *pages =3D 0;
> +    do {
> +        int err =3D arch_get_ram_range(idx++, &start_ram, &end_ram);
> +
> +        if (err =3D=3D -ENOENT)

Missing spaces between condition and the parenthesis of the conditional. Bu=
t...

> +            break;
> +        if ( err || start_ram >=3D end || end_ram <=3D start )
> +            continue;  /* range is outside of the node, or not usable RA=
M */
> =20
> +        *pages +=3D PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, =
start));
> +    } while (1);

... testing for validity rather than invalidity would allow the loop to be
checked for termination on the termination condition rather than the ad-hoc
check inside. That is...

    (untested)

    do {
        paddr_t start_ram, end_ram;
        int err =3D arch_get_ram_range(idx++, &start_ram, &end_ram);

        if ( !err && start_ram < end && end_ram > start )
            *pages +=3D PFN_DOWN(min(end_ram, end)) -
                      PFN_UP(max(start_ram, start));
    } while (err !=3D ENOENT);

>      node_set_online(nodeid);
>  }
> =20
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index fd1511a6fb..6e82dfd2a8 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -68,9 +68,28 @@ extern unsigned int memnode_shift;
>  extern unsigned long memnodemapsize;
>  extern nodeid_t *memnodemap;
> =20
> +/**
> + * @struct numa_node
> + * @brief Represents the memory information of a NUMA node.
> + *
> + * @var numa_node::node_start_pfn
> + * The starting page frame number (lowest pfn) of the NUMA node.
> + *
> + * @var numa_node::node_spanned_pages
> + * The number of pages spanned by the NUMA node, including memory holes.
> + * Used to get the end of the node memory when scrubbing unallocated mem=
ory.
> + *
> + * @var numa_node::node_present_pages
> + * The total number of usable memory pages that are available in this NU=
MA node.
> + * The value of total_pages would be the sum of all node's node_present_=
pages.
> + *
> + * The Xen Hypervisor does not use this field internally, but it is usef=
ul
> + * for reporting the memory information of NUMA nodes to management tool=
s.
> + */

I like the content, but we don't actually use Doxygen in that fashion (or a=
ny
fashion for that matter, AFAIK). In Xen style, the comments for each field =
tend
to be written on top of each respective field rather than stashed on top of=
 the
containing struct.

>  struct node_data {
>      unsigned long node_start_pfn;
>      unsigned long node_spanned_pages;
> +    unsigned long node_present_pages;
>  };
> =20
>  extern struct node_data node_data[];
> @@ -91,6 +110,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
> =20
>  #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
>  #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
> +#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
>  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
>                                   NODE_DATA(nid)->node_spanned_pages)
> =20
> @@ -123,6 +143,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t =
node);
>  extern mfn_t first_valid_mfn;
> =20
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> +#define node_present_pages(nid) total_pages
>  #define node_start_pfn(nid) mfn_x(first_valid_mfn)
>  #define __node_distance(a, b) 20
> =20

That said, take all of this with a pinch of salt. I'm not a maintainer here=
,
after all, and you might want to wait for Andrew, Jan or Roger to chip in.

Cheers,
Alejandro

