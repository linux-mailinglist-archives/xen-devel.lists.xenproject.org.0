Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CE63EDAE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450457.707722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0glq-0004O6-16; Thu, 01 Dec 2022 10:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450457.707722; Thu, 01 Dec 2022 10:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0glp-0004LJ-Tx; Thu, 01 Dec 2022 10:26:21 +0000
Received: by outflank-mailman (input) for mailman id 450457;
 Thu, 01 Dec 2022 10:26:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0glo-0004LD-Va
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:26:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0gln-0005XZ-TZ; Thu, 01 Dec 2022 10:26:19 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0gln-0007tG-M7; Thu, 01 Dec 2022 10:26:19 +0000
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
	bh=5q89znQ4sdTwU5ei2jsxGLwJ1B0kCxpTVue4GqUcJ0E=; b=4WIKrTGI4w0pYKhMoJbwiOs5ya
	q+L0FsZsVvxpglTi3/LFPdAD+NfdrRb5CAroyxL/E2tdR6yDezP2I6K2DRcrT9wintDfXOOxfTIuN
	kAt43iLOmL5QoPV1hOROUty5gxEZjjFOLe4+gi0kHqPnCiTcr37p5raR22A75zqzJfnQ=;
Message-ID: <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
Date: Thu, 1 Dec 2022 10:26:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v1] Xen: Enable compilation when PADDR_BITS == BITS_PER_LONG
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, bobbyeshleman@gmail.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, wl@xen.org
References: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 01/12/2022 10:03, Ayan Kumar Halder wrote:
> It is possible for a pointer to represent physical memory of the same size.
> In other words, a 32 bit pointer can represent 32 bit addressable physical
> memory.
> Thus, issue a compilation failure only when the count of physical address bits
> is greater than BITS_PER_LONG (ie count of bits in void*).

I am having difficult to understand how this description is related to 
the BUILD_BUG_ON(). AFAIU, it is used to check that xenheap_bits can be 
used in shift.

If the unsigned long is 32-bit, then a shift of 32 could be undefined. 
Looking at the current use, the shift are used with "xenheap_bits - 
PAGE_SHIFT". So as long as PAGE_SHIFT is not 0, you would be fine.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Currently this change will not have any impact on the existing architectures.
> The following table illustrates PADDR_BITS vs BITS_PER_LONG of different archs
> 
> ------------------------------------------------
> | Arch      |   PADDR_BITS    |   BITS_PER_LONG |
> ------------------------------------------------
> | Arm_64    |   48            |   64            |
> | Arm_32    |   40            |   32            |
> | RISCV_64  |   Don't know    |   64            |
> | x86       |   52            |   64            |
> -------------------------------------------------

The Arm_32 line is a bit confusing because one would wonder why we 
haven't seen this issue yet. So I think you want to clarify that the 
code path is not used by Arm32.

> 
> However, this will change when we introduce a platform (For eg Cortex-R52) which
> supports 32 bit physical address and BITS_PER_LONG.
> Thus, I have introduced this change as I don't see it causing a regression on
> any of the supported platforms.
> 
>   xen/common/page_alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 62afb07bc6..cd390a0956 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>   {
>       ASSERT(!first_node_initialised);
>       ASSERT(!xenheap_bits);
> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
> +    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG);

Based on the above, I think this wants to be "(PADDR_BITS - PAGE_SHIFT) 
 >= BITS_PER_LONG)".

>       xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
>       printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
>   }

Cheers,

-- 
Julien Grall

