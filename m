Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2F1687B5D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488652.756826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXLg-0001sX-Lo; Thu, 02 Feb 2023 11:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488652.756826; Thu, 02 Feb 2023 11:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXLg-0001pu-Id; Thu, 02 Feb 2023 11:01:48 +0000
Received: by outflank-mailman (input) for mailman id 488652;
 Thu, 02 Feb 2023 11:01:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNXLf-0001po-SN
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:01:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXLf-0000G1-IS; Thu, 02 Feb 2023 11:01:47 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXLf-00082D-AP; Thu, 02 Feb 2023 11:01:47 +0000
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
	bh=Wfa34thKVwZD18phf0vy2KO2zCRZpkb0b2cZCkSZawk=; b=osgO4KywStz4KDi1svzX3yjSYV
	r+NsGHaPfSpo/QIapDLMMsQ6GMni0SQ8jgEBDjYiD92VjczpfdWDjiaGqkV1pWoRYgfvUE4k9SJm2
	gYRD8+HAx+8weyTOOauqpIBd9fxZEhltqbBr9FZJFWWpY8jvM5WbpaQqd1irtu//naIc=;
Message-ID: <3ef695c9-9b5e-3323-a901-d6daf030e07d@xen.org>
Date: Thu, 2 Feb 2023 11:01:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] xen/arm: Add support for booting gzip compressed
 uImages
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230202084905.6950-1-michal.orzel@amd.com>
 <20230202084905.6950-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230202084905.6950-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 02/02/2023 08:49, Michal Orzel wrote:
> @@ -265,11 +284,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>   #define IH_ARCH_ARM             2       /* ARM          */
>   #define IH_ARCH_ARM64           22      /* ARM64        */
>   
> +/* uImage Compression Types */
> +#define IH_COMP_GZIP            1
> +
>   /*
>    * Check if the image is a uImage and setup kernel_info
>    */
>   static int __init kernel_uimage_probe(struct kernel_info *info,
> -                                      paddr_t addr, paddr_t size)
> +                                      struct bootmodule *mod)
>   {
>       struct {
>           __be32 magic;   /* Image Header Magic Number */
> @@ -287,6 +309,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       } uimage;
>   
>       uint32_t len;
> +    paddr_t addr = mod->start;
> +    paddr_t size = mod->size;
>   
>       if ( size < sizeof(uimage) )
>           return -EINVAL;

Shouldn't we return -ENOENT here?

The rest look good to me.

Cheers,

-- 
Julien Grall

