Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E9205498
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 16:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnjto-0000Yt-5a; Tue, 23 Jun 2020 14:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EaA/=AE=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jnjtm-0000Yo-8E
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 14:27:42 +0000
X-Inumbo-ID: b1a68960-b55d-11ea-bf83-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1a68960-b55d-11ea-bf83-12813bfff9fa;
 Tue, 23 Jun 2020 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IURxG91sRzxVmW/MneK75Cz8yfMZIlpvgK+sa1F5nHA=; b=GKdLT7Y3MzXwpVURQITrQSZzQD
 Q5Un2GAx81Ii1T1tV/2nmLfztaZmbca149xIc0yXSjvLhvkMOa6INXAK/lVGWyQaue2HrGoZHRX1o
 6dp0b/irjA4vE+bRjrhFmDlQg6aMc8u+vFwc8fTvso2ieO6sTzNey+MYPCdEqeKH0nL8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnjti-00065n-82; Tue, 23 Jun 2020 14:27:38 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jnjth-0002j2-VS; Tue, 23 Jun 2020 14:27:38 +0000
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200623135246.66170-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ddc76028-f695-0e54-cd04-54837c88879c@xen.org>
Date: Tue, 23 Jun 2020 15:27:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623135246.66170-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 23/06/2020 14:52, Roger Pau Monne wrote:
> XENMEM_acquire_resource and it's related structure is currently inside
> a __XEN__ or __XEN_TOOLS__ guarded section to limit it's scope to the
> hypervisor or the toolstack only. This is wrong as the hypercall is
> already being used by the Linux kernel at least, and as such needs to
> be public.
> 
> Also switch the usage of uint64_aligned_t to plain uint64_t, as
> uint64_aligned_t is only to be used by the toolstack. Note that the
> layout of the structure will be the same, as the field is already
> naturally aligned to a 8 byte boundary.
>
> No functional change expected.
> 
> Fixes: 3f8f12281dd20 ('x86/mm: add HYPERVISOR_memory_op to acquire guest resources')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> Would be good to get this fixed before the release in order to avoid
> shipping bogus headers. Should also be backported.
> ---
>   xen/include/public/memory.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..1767d7d5f5 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -607,6 +607,8 @@ struct xen_reserved_device_memory_map {
>   typedef struct xen_reserved_device_memory_map xen_reserved_device_memory_map_t;
>   DEFINE_XEN_GUEST_HANDLE(xen_reserved_device_memory_map_t);
>   
> +#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> +
>   /*
>    * Get the pages for a particular guest resource, so that they can be
>    * mapped directly by a tools domain.
> @@ -645,7 +647,7 @@ struct xen_mem_acquire_resource {
>        * IN - the index of the initial frame to be mapped. This parameter
>        *      is ignored if nr_frames is 0.
>        */
> -    uint64_aligned_t frame;
> +    uint64_t frame;
>   
>   #define XENMEM_resource_ioreq_server_frame_bufioreq 0
>   #define XENMEM_resource_ioreq_server_frame_ioreq(n) (1 + (n))
> @@ -666,8 +668,6 @@ struct xen_mem_acquire_resource {
>   typedef struct xen_mem_acquire_resource xen_mem_acquire_resource_t;
>   DEFINE_XEN_GUEST_HANDLE(xen_mem_acquire_resource_t);
>   
> -#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
> -
>   /*
>    * XENMEM_get_vnumainfo used by guest to get
>    * vNUMA topology from hypervisor.
> 

-- 
Julien Grall

