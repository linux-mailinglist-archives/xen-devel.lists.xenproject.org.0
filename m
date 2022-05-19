Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A607552CE05
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 10:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332786.556550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrbHs-0007wg-1u; Thu, 19 May 2022 08:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332786.556550; Thu, 19 May 2022 08:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrbHr-0007tz-VD; Thu, 19 May 2022 08:13:35 +0000
Received: by outflank-mailman (input) for mailman id 332786;
 Thu, 19 May 2022 08:13:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrbHr-0007tt-G1
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 08:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrbHq-00083A-Bg; Thu, 19 May 2022 08:13:34 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrbHq-0008GO-5H; Thu, 19 May 2022 08:13:34 +0000
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
	bh=N58ydY1mQnPE18529/sv6+YtSsgLIZYHPOhZdC7Pxbs=; b=lOWI+xHI7AMOk6aYKNzkOmmcTc
	bpMfD9E6vxwYMYgmu2sjBUcZoWjOTd+pLwP/rGivk3/UjK60jQnGTYYMnT7RaNlbYOG7bwCc0IGe0
	/Coxi5hrqowvmh1Ig9JPN/OmHmBvIsF6Lt18VjvPm5ETo9f98GAC9Xv/oK4lDsxlxmy4=;
Message-ID: <e4361880-4179-b843-a1e1-0f89b6f3bc41@xen.org>
Date: Thu, 19 May 2022 09:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-11-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-11-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

A few more comments that I spotted after reviewing the next patch.

On 08/03/2022 19:47, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl overlay remove file.dtbo:
>      Removes all the nodes in a given dtbo.
>      First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>      in dt_host and delete the device node entries from dt_host.
> 
>      The nodes get removed only if it is not used by any of dom0 or domio.

Can overlay be nested (let say B nest in A)? If yes, how do you deal 
with the case the A is removed before B?

[...]

> +long dt_sysctl(struct xen_sysctl *op)
> +{
> +    long ret = 0;
> +    void *overlay_fdt;
> +    char **nodes_full_path = NULL;
> +    unsigned int num_overlay_nodes = 0;
> +
> +    if ( op->u.dt_overlay.overlay_fdt_size <= 0 )

 From my understanding, FDT are typically limited to 2MB. At minimum, we 
should check the overlay is not bigger than that (to avoid arbirtrary 
allocation size). I would possibly consider to limit to lower than that 
(i.e 500KB) if there is no need to have larger and to reduce the amount 
memory consumption by the overlay code.

> +        return -EINVAL;
> +
> +    overlay_fdt = xmalloc_bytes(op->u.dt_overlay.overlay_fdt_size);
> +
> +    if ( overlay_fdt == NULL )
> +        return -ENOMEM;
> +
> +    ret = copy_from_guest(overlay_fdt, op->u.dt_overlay.overlay_fdt,
> +                         op->u.dt_overlay.overlay_fdt_size);
> +    if ( ret )
> +    {
> +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> +        xfree(overlay_fdt);

You free overlay_fdt, but not in the other paths.

> +
> +        return -EFAULT;
> +    }
> +
> +    switch ( op->u.dt_overlay.overlay_op )
> +    {
> +    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
> +        ret = check_overlay_fdt(overlay_fdt,
> +                                op->u.dt_overlay.overlay_fdt_size);
> +        if ( ret )
> +        {
> +            ret = -EFAULT;
> +            break;
> +        }
> +
> +        num_overlay_nodes = overlay_node_count(overlay_fdt);
> +        if ( num_overlay_nodes == 0 )
> +        {
> +            ret = -ENOMEM;
> +            break;
> +        }
> +
> +        ret = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
> +                                     num_overlay_nodes);
> +        if ( ret )
> +             break;
> +
> +        ret = handle_remove_overlay_nodes(nodes_full_path,
> +                                          num_overlay_nodes);
> +        break;
> +
> +    default:
> +        break;
> +    }
> +
> +    if ( nodes_full_path != NULL )
> +    {
> +        int i;
> +        for ( i = 0; i < num_overlay_nodes && nodes_full_path[i] != NULL; i++ )
> +        {
> +            xfree(nodes_full_path[i]);
> +        }
> +        xfree(nodes_full_path);
> +    }

AFAICT, nodes_full_path is not going to be used by the subop to add an 
overlay. So I would consider to move this within the case or (even 
better) create a function handling the subop (like you did for add) so 
we don't end up with a large switch.

Cheers,

-- 
Julien Grall

