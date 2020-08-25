Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE4251918
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAYVR-0003EF-4D; Tue, 25 Aug 2020 12:56:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzwT=CD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kAYVO-0003E4-U2
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:56:51 +0000
X-Inumbo-ID: 019fb04a-7297-4ec7-85f7-feadf1ec4c07
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 019fb04a-7297-4ec7-85f7-feadf1ec4c07;
 Tue, 25 Aug 2020 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=FVzCu8+GlW/E78TEhQNVPGr0se7e5st5OUySf7iKW4M=; b=2nVtPwXCS4Fai7SUYHvJszGLiN
 Ge6FX96/6L4sKXdad1RZVm3KiOlChSMKHyFYv4j/EKFGlXUCDEOFrUE7FuP+Dm3XIBs9Yo0DatdnP
 XSDJYsK/kfdk6dMqH5/tour27AVRfJZEl69ILlrlhziBIs9Aw4poHIqD9VThIOXx9xfA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAYVM-0006Re-9P; Tue, 25 Aug 2020 12:56:48 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kAYVM-00022h-1q; Tue, 25 Aug 2020 12:56:48 +0000
Subject: Re: [PATCH] make better use of mfn local variable in free_heap_pages()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e129d355-f0ba-eb1c-9755-f6f38b9212e4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4cce38d2-da2b-12dd-0c1a-95571c0bf257@xen.org>
Date: Tue, 25 Aug 2020 13:56:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e129d355-f0ba-eb1c-9755-f6f38b9212e4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 25/08/2020 13:31, Jan Beulich wrote:
> Besides the one use that there is in the function (of the value
> calculated at function entry), there are two more places where the
> redundant page-to-address conversion can be avoided.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1380,7 +1380,7 @@ static void free_heap_pages(
>   {
>       unsigned long mask;
>       mfn_t mfn = page_to_mfn(pg);
> -    unsigned int i, node = phys_to_nid(page_to_maddr(pg)), tainted = 0;
> +    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
>       unsigned int zone = page_to_zone(pg);
>   
>       ASSERT(order <= MAX_ORDER);
> @@ -1417,7 +1417,7 @@ static void free_heap_pages(
>           default:
>               printk(XENLOG_ERR
>                      "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
> -                   i, mfn_x(page_to_mfn(pg + i)),
> +                   i, mfn_x(mfn) + i,
>                      pg[i].count_info, pg[i].v.free.order,
>                      pg[i].u.free.val, pg[i].tlbflush_timestamp);
>               BUG();
> 

-- 
Julien Grall

