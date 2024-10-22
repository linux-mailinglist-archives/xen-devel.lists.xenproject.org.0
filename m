Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56E9AA10C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 13:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824107.1238197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3CwC-0007Ls-O5; Tue, 22 Oct 2024 11:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824107.1238197; Tue, 22 Oct 2024 11:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3CwC-0007K9-KC; Tue, 22 Oct 2024 11:20:32 +0000
Received: by outflank-mailman (input) for mailman id 824107;
 Tue, 22 Oct 2024 11:20:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtP5=RS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t3CwA-0007K3-GT
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 11:20:30 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a418453f-9067-11ef-99a3-01e77a169b0f;
 Tue, 22 Oct 2024 13:20:28 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9a3da96a8aso859681666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2024 04:20:28 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91559b33sm324647866b.116.2024.10.22.04.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 04:20:27 -0700 (PDT)
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
X-Inumbo-ID: a418453f-9067-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729596028; x=1730200828; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99i7iibbJGvEeFRBxMTHBv5mXYRfhzAjEyUVUsI4UOo=;
        b=SQZ8XnypgUe06JTv4bRJcqWAbacEDSeijlyCC9Ys5fYbr5Wqxo5u0fgPbj8T1YJGEq
         4hyGpxYXQrLTtekl4Hnxs83+2l9HjfM6O9m2UR2uHbQd5FJ+9i7a6nEeUErm+iGvtYdi
         y1OB7O72E59fDIMjAPYMR+XGyyZXo4V26C7bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729596028; x=1730200828;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=99i7iibbJGvEeFRBxMTHBv5mXYRfhzAjEyUVUsI4UOo=;
        b=KVp+x6BuI/sNt2G48v4QfqWxbASId7o3VqYuJBAIDIIiVtcJtG7IE8Xi1eNYgwRrcl
         a7u/S7iunf7NOAUarhdjVgy/uPv+nPHMb1V63yc18GK+HZTaT23PBLtlcovwKLNWOc4g
         OtDoiDHzrXd48G68RnekLv6G0Nl5WJdi5wTpLDMXEkDzxSKOp5QYCUCMgFPKnlLv3f9v
         WGNziTGFZiPNhyPIFwshUjByT+xb22Mcfje52eB/yySLnH1NBNV4a4uNqaf4fxS4czVI
         aLok2SGgfK0DF+FtE2KLucNdo+wz7vKBwXSMHx4pLQ7haX8WR4ljf9hIGClla0DhhWP1
         IJdg==
X-Forwarded-Encrypted: i=1; AJvYcCUOH0m27VDN3PE27TcNo9XEy0dOvAoJrq0oOSJIDtQOA7IoJs9a58AR+FKiBiYMLMJ30hxplIEsvSQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOUE7IyQmft/jO0HAr5Xe9MwBZA9PgcXQB6HGaLKholk00m8LQ
	L5jxFDCqY8gvb5kEdC9Is8Ma2KKCDmw2H4m9pND4qQLPFlfKFTggbi7vitZa95g=
X-Google-Smtp-Source: AGHT+IHB1w08OjfYrx4K1lq0j0+AEqNA35mQXBd4ztCiumy3a6Gl8MPERhDlQvh1Pat+vYksO6ZoIQ==
X-Received: by 2002:a17:907:7e8f:b0:a99:facf:cfc with SMTP id a640c23a62f3a-a9aaa540c6dmr328295566b.17.1729596027595;
        Tue, 22 Oct 2024 04:20:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Oct 2024 12:20:25 +0100
Message-Id: <D52AMD3KJVNP.2JX4IYPI4AE0A@cloud.com>
Subject: Re: [PATCH 1/1] NUMA: Introduce NODE_DATA->node_present_pages(RAM
 pages)
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Bernhard Kaindl" <bernhard.kaindl@cloud.com>,
 <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Julien Grall"
 <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241022101029.967911-1-bernhardkaindl7@gmail.com>
In-Reply-To: <20241022101029.967911-1-bernhardkaindl7@gmail.com>

Hi,

The subject was probably meant to have a v3?

On Tue Oct 22, 2024 at 11:10 AM BST, Bernhard Kaindl wrote:
> From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
>
> Some admin tools like 'xl info -n' like to display the total memory
> for each NUMA node. The Xen backend[1] of hwloc comes to mind too.
>
> The total amount of RAM on a NUMA node is not needed by Xen internally:
> Xen only uses NODE_DATA->node_spanned_pages, but that can be confusing
> for users as it includes memory holes (can be as large as 2GB on x86).
>
> Calculate the RAM per NUMA node by iterating over arch_get_ram_range()
> which returns the e820 RAM entries on x86 and update it on memory_add().
>
> Use NODE_DATA->node_present_pages (like in the Linux kernel) to hold
> this info and in a later commit, find a way for tools to read it.

Part of this information would be more helpful in a comment in the definiti=
on
of node_data, I think.

>
> [1] hwloc with Xen backend: https://github.com/xenserver-next/hwloc/
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
> ---
> Changes in v2:
> - Remove update of numainfo call, only calculate RAM for each node.
> - Calculate RAM based on page boundaries, coding style fixes
> Changes in v3:
> - Use PFN_UP/DOWN, refactored further to simplify the code, while leaving
>   compiler-level optimisations to the compiler's optimisation passes.
> ---
>  xen/arch/x86/x86_64/mm.c |  3 +++
>  xen/common/numa.c        | 31 ++++++++++++++++++++++++++++---
>  xen/include/xen/numa.h   |  3 +++
>  3 files changed, 34 insertions(+), 3 deletions(-)
>
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
> index 28a09766fa..374132df08 100644
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
> @@ -499,15 +500,39 @@ int __init compute_hash_shift(const struct node *no=
des,
>      return shift;
>  }
> =20
> -/* Initialize NODE_DATA given nodeid and start/end */
> +/**
> + * @brief Initialize a NUMA node's NODE_DATA given nodeid and start/end =
addrs.
> + *
> + * This function sets up the boot memory for a given NUMA node by calcul=
ating
> + * the node's start and end page frame numbers (PFNs) and determining
> + * the number of present RAM pages within the node's memory range.
> + *
> + * @param nodeid The identifier of the node to initialize.
> + * @param start The starting physical address of the node's memory range=
.
> + * @param end The ending physical address of the node's memory range.

I'd add that end is "exclusive". To make it unambiguous.

> + */
>  void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t e=
nd)
>  {
>      unsigned long start_pfn =3D paddr_to_pfn(start);
>      unsigned long end_pfn =3D paddr_to_pfn(end);
> +    struct node_data *numa_node =3D NODE_DATA(nodeid);
> +    paddr_t start_ram, end_ram;
> +    unsigned long pages =3D 0;
> +    unsigned int idx =3D 0;
> +    int err;
> =20
> -    NODE_DATA(nodeid)->node_start_pfn =3D start_pfn;
> -    NODE_DATA(nodeid)->node_spanned_pages =3D end_pfn - start_pfn;
> +    numa_node->node_start_pfn =3D start_pfn;
> +    numa_node->node_spanned_pages =3D end_pfn - start_pfn;
> =20
> +    /* Calculate the number of present RAM pages within the node: */
> +    while ( (err =3D arch_get_ram_range(idx++, &start_ram, &end_ram)) !=
=3D -ENOENT )

nit: This line seems quite overloaded. Might be easier for the eye as a
do-while, with "int err" being defined inside the loop itself.

> +    {
> +        if ( err || start_ram >=3D end || end_ram <=3D start )
> +            continue;  /* Not RAM (err !=3D 0) or range is outside the n=
ode */
> +
> +        pages +=3D PFN_DOWN(min(end_ram, end)) - PFN_UP(max(start_ram, s=
tart));
> +    }
> +    numa_node->node_present_pages =3D pages;
>      node_set_online(nodeid);
>  }
> =20
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index fd1511a6fb..c860f3ad1c 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -71,6 +71,7 @@ extern nodeid_t *memnodemap;
>  struct node_data {
>      unsigned long node_start_pfn;
>      unsigned long node_spanned_pages;
> +    unsigned long node_present_pages;
>  };
> =20
>  extern struct node_data node_data[];
> @@ -91,6 +92,7 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
> =20
>  #define node_start_pfn(nid)     (NODE_DATA(nid)->node_start_pfn)
>  #define node_spanned_pages(nid) (NODE_DATA(nid)->node_spanned_pages)
> +#define node_present_pages(nid) (NODE_DATA(nid)->node_present_pages)
>  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
>                                   NODE_DATA(nid)->node_spanned_pages)
> =20
> @@ -123,6 +125,7 @@ extern void numa_set_processor_nodes_parsed(nodeid_t =
node);
>  extern mfn_t first_valid_mfn;
> =20
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> +#define node_present_pages(nid) total_pages
>  #define node_start_pfn(nid) mfn_x(first_valid_mfn)
>  #define __node_distance(a, b) 20
> =20

Cheers,
Alejandro

