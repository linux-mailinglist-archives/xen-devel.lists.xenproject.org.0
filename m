Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A273B828C44
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 19:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664898.1035017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGcu-0001j5-At; Tue, 09 Jan 2024 18:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664898.1035017; Tue, 09 Jan 2024 18:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNGcu-0001gj-8I; Tue, 09 Jan 2024 18:15:00 +0000
Received: by outflank-mailman (input) for mailman id 664898;
 Tue, 09 Jan 2024 18:14:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNGcs-0001gd-9T
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 18:14:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNGcr-0006Ec-S4; Tue, 09 Jan 2024 18:14:57 +0000
Received: from [15.248.2.151] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNGcr-0005tI-N7; Tue, 09 Jan 2024 18:14:57 +0000
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
	bh=7K8CAESnRqY9IgoQOk7J1iQuVN3/aQoucmyGCXaiHZI=; b=gz+4dmvVUngwRyXwBxvHz1n4ym
	J4PCo8HYpUQ8N7NKlP5Pb+iXM5A6s5X9rMW1P1oU9c3dgTzeux9J2Zf7VoN+Ti2hk0jVaQ3Ai97fF
	++hRnv0EQtTOuci26yRcQUNPH12f5im2PiM+ZtX6Ffbg+3EBCM+YlYjLd6DS/2T7fu6M=;
Message-ID: <c1c6ee29-7fa1-4b39-aa7a-1b8f750cd893@xen.org>
Date: Tue, 9 Jan 2024 18:14:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen/device-tree: Fix bootfdt.c to tolerate 0
 reserved regions
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1c6f0f94f4ea2b773f960d88bd02e2168ac28abb.1702607884.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1c6f0f94f4ea2b773f960d88bd02e2168ac28abb.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Stefano)

Hi Shawn,

On 15/12/2023 02:43, Shawn Anastasio wrote:
> The early_print_info routine in bootfdt.c incorrectly stores the result
> of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
> negative error code being interpreted incorrectly in a subsequent loop
> in the case where the device tree does not contain any memory reserve
> map entries.

I have some trouble to reconciliate the code with your explanation. 
Looking at the implementation fdt_num_mem_rsv() should return 0 if there 
are no reserved regions. A negative value would only be returned if the 
device-tree is malformated.

Do you have a Device-Tree where the issue occurs?

That said, I agree that the code could be hardened.

> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>   xen/common/device-tree/bootfdt.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index ae9fa1e3d6..796ac01c18 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -466,7 +466,8 @@ static void __init early_print_info(void)
>       struct meminfo *mem_resv = &bootinfo.reserved_mem;
>       struct bootmodules *mods = &bootinfo.modules;
>       struct bootcmdlines *cmds = &bootinfo.cmdlines;
> -    unsigned int i, j, nr_rsvd;
> +    unsigned int i, j;
> +    int nr_rsvd;
>   
>       for ( i = 0; i < mi->nr_banks; i++ )
>           printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
> @@ -481,7 +482,7 @@ static void __init early_print_info(void)
>                   boot_module_kind_as_string(mods->module[i].kind));
>   
>       nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);

If I am correct above, then I think we should panic() rather than trying 
to continue with a buggy DT.

> -    for ( i = 0; i < nr_rsvd; i++ )
> +    for ( i = 0; nr_rsvd > 0 && i < nr_rsvd; i++ )
>       {
>           paddr_t s, e;
>   

Cheers,

-- 
Julien Grall

