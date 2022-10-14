Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81705FEAAA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 10:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422564.668668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGF0-0007M1-7z; Fri, 14 Oct 2022 08:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422564.668668; Fri, 14 Oct 2022 08:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojGF0-0007J3-5D; Fri, 14 Oct 2022 08:40:26 +0000
Received: by outflank-mailman (input) for mailman id 422564;
 Fri, 14 Oct 2022 08:40:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ojGEy-0007Ix-FW
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 08:40:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojGEy-0004Wa-85; Fri, 14 Oct 2022 08:40:24 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.21.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ojGEy-0000XM-1u; Fri, 14 Oct 2022 08:40:24 +0000
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
	bh=59aBtbK0SShx/lXL0eXqY2HWTS+Vxh7xLezeI3iC1dc=; b=YcoEhIcVkGm23ZOKFyWIue9Btq
	Ge3Wjm60qPX6ctZG6oxqdhynKBI145lFG7x5Eu9ncQ+NHESIaMFa67lER/bITY6zpgqfrh3TdRGP3
	rDO3PoRFPhR+PLM1K0Xllzy6TDTL5TG1xBI7ZdbNN80D4SmpCffC2QpwolZiBnvJUwmQ=;
Message-ID: <00c6e7fc-7441-95bb-b7ff-dc78137df0f3@xen.org>
Date: Fri, 14 Oct 2022 09:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH for-4.17 1/2] docs: Document the minimal requirement of
 static heap
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>
 <20221013025722.48802-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221013025722.48802-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 13/10/2022 03:57, Henry Wang wrote:
> The static heap feature requires user to know the minimal size of
> heap to make sure the system can work. Since the heap controlled
> by Xen is intended to provide memory for the whole system, not only
> the boot time memory allocation should be covered by the static
> heap region, but also the runtime allocation should be covered.
> 
> The main source of runtime allocation is the memory for the P2M.
> Currently, from XSA-409, the P2M memory is bounded by the P2M pool.
> So make this part as the minimal requirement of static heap. The
> amount of memory allocated after all the guests have been created
> should be quite limited and mostly predictable.
> 
> This commit adds documentation that explains how a user can size the
> static heap region.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 87eaa3e254..046f28ce31 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -531,6 +531,13 @@ Below is an example on how to specify the static heap in device tree:
>   RAM starting from the host physical address 0x30000000 of 1GB size will
>   be reserved as static heap.
>   
> +Users should be mindful that the static heap should at least satisfy the
> +allocation of the P2M maps for all guests. Currently, the minimal requirement
> +of per-domain P2M pages pool is in-sync with function
> +libxl__get_required_paging_memory() (for xl-created domUs) and
> +domain_p2m_pages() (for dom0less domUs), that is, 1MB per vCPU, plus 4KiB per
> +MiB of RAM for the P2M map, and plus 512KiB to cover extended regions.

I think this wording is OK if the feature is a tech preview. However, if 
this is security supported, we need to provide some more details about 
the size.

In particular, this doesn't tell a user how they can find the size that 
would fit them. Can this be decided with a formula?

If not, could a user configure his system without the reserved heap and 
find out the memory usage from dom0 (or a debug keys)?

Cheers,


-- 
Julien Grall

