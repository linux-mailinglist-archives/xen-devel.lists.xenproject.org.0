Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3C06E0AFE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 12:03:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520602.808357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtnc-0002h7-8C; Thu, 13 Apr 2023 10:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520602.808357; Thu, 13 Apr 2023 10:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmtnc-0002ez-4h; Thu, 13 Apr 2023 10:03:28 +0000
Received: by outflank-mailman (input) for mailman id 520602;
 Thu, 13 Apr 2023 10:03:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmtna-0002et-VM
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 10:03:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmtna-00072s-RR; Thu, 13 Apr 2023 10:03:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmtna-00078e-Iv; Thu, 13 Apr 2023 10:03:26 +0000
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
	bh=Eheui3wJSAP0Xc1BwIsLqFdWXjNT/C88bEtOr2Jl/Dk=; b=6sNyxDYML5/Rq8oIqxggdsoKjX
	2b6OWbV4Z+LpptbSUKOJ+p/sHt8hw2LcmzkOuiZg/GCVVpUOu+wzmxuew2IIbBkbjANHzFP8FBTTC
	jJlRwCR2Z5KA11kz/bEx9lnlIfhqEuozUyIhgObsaHC06pQfNyWj2RdMr/K8CwxAEQgY=;
Message-ID: <869d014a-d325-6592-d51e-e3638ba04076@xen.org>
Date: Thu, 13 Apr 2023 11:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 02/17] common/device_tree: change
 __unflatten_device_tree()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-3-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230411191636.26926-3-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/04/2023 20:16, Vikram Garhwal wrote:
> Following changes are done to __unflatten_device_tree():
>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>      2. Remove static function type.
>      3. Add handling of memory allocation. This will be useful in dynamic node
>          programming when we unflatten the dt during runtime memory allocation
>          can fail.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>   xen/common/device_tree.c      | 10 ++++++----
>   xen/include/xen/device_tree.h |  5 +++++
>   2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index aed38ff63c..bf847b2584 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -2047,7 +2047,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
>   }
>   
>   /**
> - * __unflatten_device_tree - create tree of device_nodes from flat blob
> + * unflatten_device_tree - create tree of device_nodes from flat blob
>    *
>    * unflattens a device-tree, creating the
>    * tree of struct device_node. It also fills the "name" and "type"
> @@ -2056,8 +2056,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
>    * @fdt: The fdt to expand
>    * @mynodes: The device_node tree created by the call
>    */
> -static void __unflatten_device_tree(const void *fdt,
> -                                    struct dt_device_node **mynodes)
> +void unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
>   {
>       unsigned long start, mem, size;
>       struct dt_device_node **allnextp = mynodes;
> @@ -2079,6 +2078,9 @@ static void __unflatten_device_tree(const void *fdt,
>       /* Allocate memory for the expanded device tree */
>       mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
>   
> +    if ( !mem )
> +        panic("Cannot allocate memory for unflatten device tree\n");

After your series, unflatten_device_tree() will be called after boot, so 
we should not unconditionally called panic(). Instead, 
unflatten_device_tree() should return an error and let the caller decide 
what to do.

I suggest to read misc/xen-error-handling.txt to understand when to use 
panic()/BUG() & co. For...


> +
>       ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeef);
>   
>       dt_dprintk("  unflattening %lx...\n", mem);
> @@ -2179,7 +2181,7 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
>   
>   void __init dt_unflatten_host_device_tree(void)
>   {
> -    __unflatten_device_tree(device_tree_flattened, &dt_host);
> +    unflatten_device_tree(device_tree_flattened, &dt_host);

... this caller this should be a panic() (this is OK here because it is 
boot code).

But for your new caller, you should properly report the error back the 
toolstack.

Also, unflatten_dt_node() (called by __unflatten_device_tree()) seems to 
have some failure cases. Can you explain why they are not properly 
propagated in your case? Are you trusting the device-tree to always be 
valid?

Cheers,

-- 
Julien Grall

