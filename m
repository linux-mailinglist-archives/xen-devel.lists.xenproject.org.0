Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFE7A0199
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 12:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602202.938625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjVK-00015q-Fw; Thu, 14 Sep 2023 10:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602202.938625; Thu, 14 Sep 2023 10:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgjVK-000148-Bq; Thu, 14 Sep 2023 10:23:22 +0000
Received: by outflank-mailman (input) for mailman id 602202;
 Thu, 14 Sep 2023 10:23:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qgjVI-000142-JN
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 10:23:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgjVI-00045c-4v; Thu, 14 Sep 2023 10:23:20 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qgjVH-0005zf-R9; Thu, 14 Sep 2023 10:23:19 +0000
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
	bh=oCQLxkR+u2+E92hzZkD0Fbm4wmecsigy20GUzGeRb8A=; b=QfvbOGvAgfb3yfwck4i1ligv4a
	sAY+/YVSTYDiRa1xRpSFAzrTpNJR1z3acg4C/AUgvmd3kew7ipWEdtCIzc7eekemOq6n6RRMpXnvW
	NmR1FiJqhHrXTWaji1gNe+a+/S+Dx093Uh6osa2YdU8I1wz3jCZl/I5Hq6nXLxo2lqy4=;
Message-ID: <286ff37b-23f0-4e51-b70d-69f427594e5c@xen.org>
Date: Thu, 14 Sep 2023 11:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/arm: Enlarge identity map space to 127TB
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexey Klimov <alexey.klimov@linaro.org>
References: <20230914021734.1395472-1-leo.yan@linaro.org>
 <20230914021734.1395472-3-leo.yan@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230914021734.1395472-3-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/09/2023 03:17, Leo Yan wrote:
> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
> the physical memory regions are:
> 
>    DRAM memory regions:
>      Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
>      Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
>      Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
> 
> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
> and ramdisk images are loaded into the low memory space:
> 
>    (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>    (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>    (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>    (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> 
> In this case, the Xen binary is loaded above 8TB, which exceeds the
> maximum supported identity map space of 2TB in Xen. Consequently, the
> system fails to boot.
> 
> This patch enlarges identity map space to 127TB, allowing module loading
> within the range of [0x0 .. 0x00007eff_ffff_ffff].

On v2 you wrote:

"
When I reviewed the existed code, I found it reserves 125TiB:

   0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
     Unused

  Seems to me, we can map this area.  Ideally, if we only map for the
  first level's page table, we can just fill the zeroeth page and don't
  need to allocate extra page tables.
"

I agree that we will not allocate page-tables for the whole reserved 
region. However, my concern was more related to the fact that it would 
be more difficult to reclaim space in the virtual address if necessary 
in the future.

So I would rather prefer if we don't use the whole 127 TiB if this is 
not necessary. For your platform, it seems that it would be enough to 
bump the area to 10 TB (this is 8TB + some margin).

> 
> Note, despite this expansion of the identity map to 127TB, the frame
> table still only supports 2TB.  The reason is the frame table is data
> structure for the page management, which does not require coverage of
> the memory layout gaps (refer to pfn_pdx_hole_setup() for Xen removing
> the biggest gap from memory regions).

This is not quite correct. The PDX can only compress the bottom bits (if 
they are all zeroes) and one region in the address. So some holes may be 
covered.

It might be possible that for your platform, the compression is enough 
to fit everything in 2TB.

But I would drop this paragraph. The decision to enlarge the identity 
mapping is different from the size of frametable. You may have a 
platform where the first RAM bank is high in memory (such as on AMD 
Seattle). There might also be some changes necessary in Xen to support 
more than 2TB frametable.

Cheers,

-- 
Julien Grall

