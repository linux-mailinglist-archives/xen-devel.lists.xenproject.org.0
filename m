Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592C63F7605
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:39:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172365.314467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIt7r-0004hV-1h; Wed, 25 Aug 2021 13:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172365.314467; Wed, 25 Aug 2021 13:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIt7q-0004f7-UJ; Wed, 25 Aug 2021 13:39:30 +0000
Received: by outflank-mailman (input) for mailman id 172365;
 Wed, 25 Aug 2021 13:39:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIt7p-0004f0-8I
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:39:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIt7o-00064B-4r; Wed, 25 Aug 2021 13:39:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIt7n-00041j-VE; Wed, 25 Aug 2021 13:39:28 +0000
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
	bh=VbAwu2tMqJlk3C+/RLce4pvqruPwhWo4V/AFoTx/WEE=; b=auUEK9c0qr7CS0ubYzotA9ONap
	AHtFB++dRn39dBUG/eThwcD1ZWRnYQDaJu1kKFHMC7X9+0DNzm5sriseR0P+cK6/RhyTuW7Rr7IGf
	2yFERfl/zdtZh2h2C6ahiVAtSYjZn0Hyipv+nk7ZZ0YOzRtVzOTiQqTygSRwEUIG/6Ro=;
Subject: Re: [XEN RFC PATCH 19/40] xen: fdt: Introduce a helper to check fdt
 node type
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Jan Beulich <jbeulich@suse.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-20-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f43fed3a-a57b-4115-4f68-0fb460d5da14@xen.org>
Date: Wed, 25 Aug 2021 14:39:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-20-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> In later patches, we will parse CPU and memory NUMA information
> from device tree. FDT is using device type property to indicate
> CPU nodes and memory nodes. So we introduce fdt_node_check_type
> in this patch to avoid redundant code in subsequent patches.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/common/libfdt/fdt_ro.c      | 15 +++++++++++++++
>   xen/include/xen/libfdt/libfdt.h | 25 +++++++++++++++++++++++++

This is meant to be a verbatim copy of libfdt. So I am not entirely in 
favor of adding a new function therefore without been upstreamed to 
libfdt first.

>   2 files changed, 40 insertions(+)
> 
> diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
> index 36f9b480d1..ae7794d870 100644
> --- a/xen/common/libfdt/fdt_ro.c
> +++ b/xen/common/libfdt/fdt_ro.c
> @@ -545,6 +545,21 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
>   		return 1;
>   }
>   
> +int fdt_node_check_type(const void *fdt, int nodeoffset,
> +			      const char *type)
> +{
> +	const void *prop;
> +	int len;
> +
> +	prop = fdt_getprop(fdt, nodeoffset, "device_type", &len);
> +	if (!prop)
> +		return len;
> +	if (fdt_stringlist_contains(prop, len, type))

The "device_type" is not a list of string. So I am a bit confused why 
you are using this helper. Shouldn't we simply check that the property 
value and type matches?

> +		return 0;
> +	else
> +		return 1;
> +}
> +
>   int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
>   				  const char *compatible)
>   {
> diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
> index 7c75688a39..7e4930dbcd 100644
> --- a/xen/include/xen/libfdt/libfdt.h
> +++ b/xen/include/xen/libfdt/libfdt.h
> @@ -799,6 +799,31 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
>   int fdt_node_check_compatible(const void *fdt, int nodeoffset,
>   			      const char *compatible);
>   
> +/**
> + * fdt_node_check_type: check a node's device_type property
> + * @fdt: pointer to the device tree blob
> + * @nodeoffset: offset of a tree node
> + * @type: string to match against
> + *
> + *
> + * fdt_node_check_type() returns 0 if the given node contains a 'device_type'
> + * property with the given string as one of its elements, it returns non-zero
> + * otherwise, or on error.
> + *
> + * returns:
> + *	0, if the node has a 'device_type' property listing the given string
> + *	1, if the node has a 'device_type' property, but it does not list
> + *		the given string
> + *	-FDT_ERR_NOTFOUND, if the given node has no 'device_type' property
> + * 	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
> + *	-FDT_ERR_BADMAGIC,
> + *	-FDT_ERR_BADVERSION,
> + *	-FDT_ERR_BADSTATE,
> + *	-FDT_ERR_BADSTRUCTURE, standard meanings
> + */
> +int fdt_node_check_type(const void *fdt, int nodeoffset,
> +			      const char *type);
> +
>   /**
>    * fdt_node_offset_by_compatible - find nodes with a given 'compatible' value
>    * @fdt: pointer to the device tree blob
> 

Cheers,

-- 
Julien Grall

