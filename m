Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38993F4FFF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170576.311409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIED0-0003ln-52; Mon, 23 Aug 2021 17:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170576.311409; Mon, 23 Aug 2021 17:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIED0-0003ib-17; Mon, 23 Aug 2021 17:58:06 +0000
Received: by outflank-mailman (input) for mailman id 170576;
 Mon, 23 Aug 2021 17:58:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIECy-0003iV-4m
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:58:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIECx-00008a-0B; Mon, 23 Aug 2021 17:58:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIECw-0001Iv-Qk; Mon, 23 Aug 2021 17:58:02 +0000
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
	bh=T2JSAkKBRQcUO/gzCOf9uwToE5IrSjXAfVOU2gEqTA0=; b=nXBbn1+yQkjIXdBE/HOVmqcxgb
	1oRxajxCpwV1G50Rhv4/6Pv6oblLDdPQD9jmpLIcFtkQ/zgwRvLKFsr9LghXSN9LGTuqFq5U0pFDw
	NPShPfM7hApvQ0EcDxYbh0PiLuFExpEpcsPQQkW4Opo0iE/01oXsdfBA4bamkGVfg0l8=;
Subject: Re: [XEN RFC PATCH 10/40] xen/x86: Move NR_NODE_MEMBLKS macro to
 common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-11-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <286592b5-ea2f-f77d-14f7-b85411e3d7f7@xen.org>
Date: Mon, 23 Aug 2021 18:58:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-11-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> Not only x86 ACPI need this macro. Device tree based NUMA
> also needs this macro to present max memory block number.
AFAICT, a memory range described in DT cannot be split across multiple 
nodes. So I think we want to define NR_NODE_MEMBLKS as NR_MEM_BANKS.

> So we move it from x86 ACPI header file to common NUMA
> header file.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/include/asm-x86/acpi.h | 1 -
>   xen/include/xen/numa.h     | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
> index 7032f3a001..d347500a3c 100644
> --- a/xen/include/asm-x86/acpi.h
> +++ b/xen/include/asm-x86/acpi.h
> @@ -103,7 +103,6 @@ extern unsigned long acpi_wakeup_address;
>   
>   extern s8 acpi_numa;
>   extern int acpi_scan_nodes(u64 start, u64 end);
> -#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>   
>   extern struct acpi_sleep_info acpi_sinfo;
>   #define acpi_video_flags bootsym(video_flags)
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index f9769cba4b..5af74b357f 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -11,6 +11,7 @@
>   #define NUMA_NO_DISTANCE 0xFF
>   
>   #define MAX_NUMNODES    (1 << NODES_SHIFT)
> +#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>   
>   #define vcpu_to_node(v) (cpu_to_node((v)->processor))
>   
> 

Cheers,

-- 
Julien Grall

