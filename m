Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538C67A101
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 19:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483674.749975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNqH-0002yZ-A9; Tue, 24 Jan 2023 18:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483674.749975; Tue, 24 Jan 2023 18:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKNqH-0002vj-7D; Tue, 24 Jan 2023 18:16:21 +0000
Received: by outflank-mailman (input) for mailman id 483674;
 Tue, 24 Jan 2023 18:16:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKNqG-0002vd-3C
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 18:16:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNqD-0001Kk-QT; Tue, 24 Jan 2023 18:16:17 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKNqD-0008Nt-JB; Tue, 24 Jan 2023 18:16:17 +0000
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
	bh=NY7JwPPR50y+fz7nwQdvaJwsfN4uh4lspWJSX8WfcUQ=; b=oOfkjowMIrpX675yS6yWavVdaZ
	RZq3h5KKZgzaI5jDOnvGIJEOmFiYLo+RwOyKVuGN7O0kqH+O2Bd3nQcpGDgK2vow0XU9x1pOZJnjL
	GgSGOdpykyacfVwbgQTRBBagC1kuDPXhv27yzm3EYcsSS3FlGLIdXC4IfGk0ZKbFP/8E=;
Message-ID: <631b5639-0f48-a872-219b-607d0a521960@xen.org>
Date: Tue, 24 Jan 2023 18:16:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v4 1/3] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xuwei5@hisilicon.com
References: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
 <20230124122336.40993-2-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230124122336.40993-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 24/01/2023 12:23, Ayan Kumar Halder wrote:
> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
> while creating nodes in fdt, the address (if present in the node name)
> should be represented using 'PRIx64'. This is to be in conformance
> with the following rule present in https://elinux.org/Device_Tree_Linux
> 
> . node names
> "unit-address does not have leading zeros"
> 
> As 'PRIpaddr' introduces leading zeros, we cannot use it.
> 
> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
> represent physical address using 'PRIx64'.
> 
> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> address.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Moved the patch earlier.
> 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
> into this patch.
> 
> v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.
> 
> v3 - 1. Added a comment on top of domain_fdt_begin_node().
> 2. Check for the return of snprintf() in domain_fdt_begin_node().
> 
>   xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
>   xen/arch/arm/gic-v2.c       |  6 ++--
>   xen/arch/arm/mm.c           |  2 +-
>   3 files changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f35f4d2456..81a213cf9a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1288,6 +1288,39 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>       return res;
>   }
>   
> +/*
> + * Wrapper to convert physical address from paddr_t to uint64_t and
> + * invoke fdt_begin_node(). This is required as the physical address
> + * provided as a part of node name should not contain any leading

s/as a part/as part/ ?

> + * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
> + * unit (which contains the physical address) with name to generate a
> + * node name.
> + */
> +static int __init domain_fdt_begin_node(void *fdt, const char *name,
> +                                        uint64_t unit)
> +{
> +    /*
> +     * The size of the buffer to hold the longest possible string ie

I think this should be "i.e." and there is possibly a missing full stop 
before hand.

> +     * interrupt-controller@ + a 64-bit number + \0
> +     */
> +    char buf[38];
> +    int ret;
> +
> +    /* ePAPR 3.4 */
> +    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
> +
> +    if ( ret >= sizeof(buf) )
> +    {
> +        printk(XENLOG_ERR
> +               "Insufficient buffer. Minimum size required is %d\n",
> +               ( ret + 1 ));

The parenthesis are unnecessary. But if you want them, then you should 
not add a space after ( and before ).

> +
> +        return -FDT_ERR_TRUNCATED;
> +    }
> +
> +    return fdt_begin_node(fdt, buf);
> +}
> +

Cheers,

-- 
Julien Grall

