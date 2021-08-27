Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5783F9AA4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173700.316902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcXT-00018z-HA; Fri, 27 Aug 2021 14:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173700.316902; Fri, 27 Aug 2021 14:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcXT-00017C-EE; Fri, 27 Aug 2021 14:08:59 +0000
Received: by outflank-mailman (input) for mailman id 173700;
 Fri, 27 Aug 2021 14:08:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJcXS-000176-HD
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:08:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcXR-0006qF-Ic; Fri, 27 Aug 2021 14:08:57 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJcXR-0000ew-C0; Fri, 27 Aug 2021 14:08:57 +0000
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
	bh=gECZRGFWKARyxiPcs3AOlwn2PPGXg523rs5EIcJ9ehE=; b=nT8lSnxAeZ25H6EZKNA+ox/V5d
	IEJUY0PNKrAuWGT5khuW8Sg7czUAljHflnlmwc0M48yS73JOPZHtJqGwfC6blSrf3VquwvxYT9iNH
	abTqHXhzUaNZhBA/4YefVHTfsdVKEsUFWDZkp/AtkAZTHTpdno16JyuGIhxtY8HpB+Vk=;
Subject: Re: [XEN RFC PATCH 32/40] xen/x86: make acpi_scan_nodes to be neutral
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-33-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f830422a-79e3-b9d7-138c-3db468f8376b@xen.org>
Date: Fri, 27 Aug 2021 15:08:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-33-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> The code in acpi_scan_nodes can be reused for device tree based
> NUMA. So we rename acpi_scan_nodes to numa_scan_nodes for a neutral
> function name. As acpi_numa variable is available in ACPU based NUMA
> system only, we use CONFIG_ACPI_NUMA to protect it.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/x86/srat.c        | 4 +++-
>   xen/common/numa.c          | 2 +-
>   xen/include/asm-x86/acpi.h | 2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index dcebc7adec..3d4d90a622 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -362,7 +362,7 @@ void __init srat_parse_regions(u64 addr)
>   }
>   
>   /* Use the information discovered above to actually set up the nodes. */
> -int __init acpi_scan_nodes(u64 start, u64 end)
> +int __init numa_scan_nodes(u64 start, u64 end)
>   {
>   	int i;
>   	nodemask_t all_nodes_parsed;
> @@ -371,8 +371,10 @@ int __init acpi_scan_nodes(u64 start, u64 end)
>   	for (i = 0; i < MAX_NUMNODES; i++)
>   		cutoff_node(i, start, end);
>   
> +#ifdef CONFIG_ACPI_NUMA
>   	if (acpi_numa <= 0)
>   		return -1;
> +#endif

Looking at the follow-up patches, I find a bit odd that there is a check 
for ACPI but there is none added for DT. Can you explain why?

However, I think this check is going to impair the work to support both 
ACPI and DT on Arm because acpi_numa would end up to be 0 so you would 
bail out here.

With that in mind, I think this check needs to either go away or replace 
by something there is firmware agnostic.

Cheers,

-- 
Julien Grall

