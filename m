Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DF3F9ADF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173729.316960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcq1-0006Uq-Au; Fri, 27 Aug 2021 14:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173729.316960; Fri, 27 Aug 2021 14:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcq1-0006Ry-7a; Fri, 27 Aug 2021 14:28:09 +0000
Received: by outflank-mailman (input) for mailman id 173729;
 Fri, 27 Aug 2021 14:28:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJcq0-0006Rs-2z
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:28:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcpz-0007CP-5E; Fri, 27 Aug 2021 14:28:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcpy-0003eW-V8; Fri, 27 Aug 2021 14:28:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IrXCbO2mtffHsR/vGMTAzseRSrjN5y7QyoAfTRjzoN4=; b=3zToZQLFRGW5rwna5amkBhnmcH
	jAjEahMAPUeefFO/aFx5RlugczYhkbXME0T+QWeE0PD0R4/01tDg6swX9NzW5lkTNzNYhB9ZrV94F
	quD5cOb6TilsLl8Ax/4S9BMOh6cqTUjRMJiq6YqBBvzgkZz3MAGB632YDeNxSulChBO0=;
Subject: Re: [XEN RFC PATCH 36/40] xen/arm: keep guest still be NUMA unware
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-37-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e801a6e-68db-c541-7386-04e981681ec4@xen.org>
Date: Fri, 27 Aug 2021 15:28:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-37-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> We have not wanted to make Xen guest be NUMA aware in this patch
> series. 

The concept of patch series ceases to exist once we merge the code. So 
about how:

"The NUMA information provided in the host Device-Tree are only for Xen. 
For dom0, we want to hide them as they may be different (for now, dom0 
is still not aware of NUMA".

> So in this patch, Xen will skip NUMA distance matrix node
> and skip the numa-node-id property in CPU node and memory node,
> when Xen is creating guest device tree binary.

The CPU and memory nodes are recreated from scratch for the domain. So 
we already skip the property numa-node-id. However...

> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index cf341f349f..e62fa761bd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -584,6 +584,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>                   continue;
>           }
>   
> +        /* Guest is numa unaware in current stage */
> +        if ( dt_property_name_is_equal(prop, "numa-node-id") )
> +            continue;

... your code is doing more than skipping the property for the two nodes 
you mentionned. Can the property exists in other nodes?

> +
>           res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
>   
>           if ( res )
> @@ -1454,6 +1458,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>           DT_MATCH_TYPE("memory"),
>           /* The memory mapped timer is not supported by Xen. */
>           DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
> +        /* Numa info doesn't need to be exposed to Domain-0 */
> +        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
>           { /* sentinel */ },
>       };
>       static const struct dt_device_match timer_matches[] __initconst =
> 

Cheers,

-- 
Julien Grall

