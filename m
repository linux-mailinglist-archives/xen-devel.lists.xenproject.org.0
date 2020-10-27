Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15429AD73
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 14:36:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12846.33239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXP8I-0000fj-0B; Tue, 27 Oct 2020 13:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12846.33239; Tue, 27 Oct 2020 13:35:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXP8H-0000fK-TK; Tue, 27 Oct 2020 13:35:25 +0000
Received: by outflank-mailman (input) for mailman id 12846;
 Tue, 27 Oct 2020 13:35:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/8F=EC=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1kXP8G-0000fF-Pf
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:35:24 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88a35dc3-605a-48e0-a214-8394d436ff8a;
 Tue, 27 Oct 2020 13:35:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RDUV5F054249;
 Tue, 27 Oct 2020 13:35:20 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34dgm3yjgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Oct 2020 13:35:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RDVI8m168151;
 Tue, 27 Oct 2020 13:35:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 34cx6vygrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 13:35:19 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RDZI5Y012414;
 Tue, 27 Oct 2020 13:35:18 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Oct 2020 06:35:18 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 8FA456A0121; Tue, 27 Oct 2020 09:37:01 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o/8F=EC=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
	id 1kXP8G-0000fF-Pf
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 13:35:24 +0000
X-Inumbo-ID: 88a35dc3-605a-48e0-a214-8394d436ff8a
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 88a35dc3-605a-48e0-a214-8394d436ff8a;
	Tue, 27 Oct 2020 13:35:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RDUV5F054249;
	Tue, 27 Oct 2020 13:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6SwjgoK6NmHrI7CpsdIL3yfEJog1phV7AEfu8seZA/M=;
 b=kRXDExu9qqJPjZrehu24qzSbTC0ClcfPsU+E1LCNqwZPgXaAuNivtu7tqhMfiZ6q0lpe
 Bc1rJ0kUziITVuLTbsP+xc0QqqexEpxCiNpw4wC3MvpUMWaUVfEDuHdObkmMq/Z/v6tH
 X6h2+gop8GjYD+39av1lHRI9HqyrzDcYyIEZ5VDgzqp4QFliovcuwBR6IXhG+0YeYv6n
 zZ4tglD5BG/aTAmPoqTvmoggu26V0I/2ZQQVXMhKytv7dCCx8onZQvV3Z5ohpk4C1U1/
 TQXQoHQHMUjEUi7pbhhlMvU0zdedoahfmbvsem7LF20QVv3dtc1iiQTSPRaKivdbHjOp Fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 34dgm3yjgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Oct 2020 13:35:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09RDVI8m168151;
	Tue, 27 Oct 2020 13:35:19 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 34cx6vygrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Oct 2020 13:35:19 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09RDZI5Y012414;
	Tue, 27 Oct 2020 13:35:18 GMT
Received: from char.us.oracle.com (/10.152.32.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 27 Oct 2020 06:35:18 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
	id 8FA456A0121; Tue, 27 Oct 2020 09:37:01 -0400 (EDT)
Date: Tue, 27 Oct 2020 09:37:01 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, hch@lst.de
Subject: Re: [PATCH] fix swiotlb panic on Xen
Message-ID: <20201027133701.GB6077@char.us.oracle.com>
References: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9786 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=2 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270085

On Mon, Oct 26, 2020 at 05:02:14PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> kernel/dma/swiotlb.c:swiotlb_init gets called first and tries to
> allocate a buffer for the swiotlb. It does so by calling
> 
>   memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> 
> If the allocation must fail, no_iotlb_memory is set.
> 
> 
> Later during initialization swiotlb-xen comes in
> (drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
> is != 0, it thinks the memory is ready to use when actually it is not.
> 
> When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
> and since no_iotlb_memory is set the kernel panics.
> 
> Instead, if swiotlb-xen.c:xen_swiotlb_init knew the swiotlb hadn't been
> initialized, it would do the initialization itself, which might still
> succeed.
> 
> 
> Fix the panic by setting io_tlb_start to 0 on swiotlb initialization
> failure, and also by setting no_iotlb_memory to false on swiotlb
> initialization success.

Should this have a Fixes: flag?

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index c19379fabd20..9924214df60a 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -231,6 +231,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	if (verbose)
>  		swiotlb_print_info();
> @@ -262,9 +263,11 @@ swiotlb_init(int verbose)
>  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
>  		return;
>  
> -	if (io_tlb_start)
> +	if (io_tlb_start) {
>  		memblock_free_early(io_tlb_start,
>  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> +		io_tlb_start = 0;
> +	}
>  	pr_warn("Cannot allocate buffer");
>  	no_iotlb_memory = true;
>  }
> @@ -362,6 +365,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	swiotlb_print_info();
>  

