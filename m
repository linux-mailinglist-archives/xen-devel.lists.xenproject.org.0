Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7F24B859
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:18:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8iZt-0000Fa-D1; Thu, 20 Aug 2020 11:17:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8iZr-0000FV-UZ
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:17:52 +0000
X-Inumbo-ID: db4ac1dd-8fd4-4733-a382-a46ca6734964
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db4ac1dd-8fd4-4733-a382-a46ca6734964;
 Thu, 20 Aug 2020 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=//5swmDdkmyt4Stx7SSQlWGi44x1Tkmr0zx5b/QM824=; b=BYH9pPLQTEm7UMYdTHGfocDxuz
 XClWfet/qWuiYlBX5wpU4qqmpjbZvyKcGYglrcm9bI0v1F4UcIkZuLWdXWv/RyiKGOObLfGFiy4e1
 8Btj5/ThLIpeUSgxRstjgILD0v3+qgHs45///Q+VZkr6L5xn5hxt1BsghyQqj5cUqfbQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8iZp-0001KI-8q; Thu, 20 Aug 2020 11:17:49 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8iZo-0001iL-Vc; Thu, 20 Aug 2020 11:17:49 +0000
Subject: Re: [Linux] [ARM] Granting memory obtained from the DMA API
To: Simon Leiner <simon@leiner.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
From: Julien Grall <julien@xen.org>
Message-ID: <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
Date: Thu, 20 Aug 2020 12:17:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
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



On 19/08/2020 12:04, Simon Leiner wrote:
> Hi everyone,

Hi Simon,

> 
> I'm working on a virtio driver for the Linux kernel that supports the
> dynamic connection of devices via the Xenbus (as part of a research
> project at the Karlsruhe Institute of Technology).

There is a lot of interest to get Virtio working on Xen at the moment. 
Is this going to be a new transport layer for Virtio?

> My question concerns the Xenbus client API in the Linux kernel. As this
> is my first time posting on the Xen mailing lists, I'm not entirely
> sure if this is the right place for this question. If not, feel free to
> point me to the right place :-)

Xen-devel is probably most suitable for this discussion, so I moved the 
discussion there. I have also CCed a couple of Linux maintainers that 
should be able to provide feedbacks on the approaches.

> 
> Part of virtio is having shared memory. So naturally, I'm using Xen's
> grant system for that. Part of the Xenbus client API is the function
> xenbus_grant_ring which, by its documentation grants access to a block
> of memory starting at vaddr to another domain. I tried using this in my
> driver which created the grants and returned without any error, but
> after mounting the grants on another domain, it turns out that some
> other location in memory was actually granted instead of the one behind
> the original vaddr.
> 
> So I found the problem: The vaddr that I was using xenbus_grant_ring
> with was obtained by dma_alloc_coherent (whereas the other split
> drivers included in the mainline kernel use Xen IO rings allocated by
> the "regular" mechanisms such as __get_free_page, alloc_page etc.).
> But xenbus_grant_ring uses virt_to_gfn to get the GFN for the vaddr
> which on ARM(64) must not be used for DMA addresses. So I could fix the
> problem by providing a modified version of xenbus_grant_ring as part of
> my driver which takes a dma_addr_t instead of a void* for the start
> address, gets the PFN via dma_to_phys, converts it to a GFN and then
> delegates to gnttab_grant_foreign_access, just like xenbus_grant_ring.
> I can confirm that this works on Linux 5.4.0.
> 
> My question to you is: How can this be fixed "the right way"?
> Is there anything that can be done to prevent others from debugging
> the same problem (which for me, took some hours...)?
> 
> I can see multiple approaches:
> 1. Have xenbus_grant_ring "just work" even with DMA addresses on ARM
>     This would certainly be the nicest solution, but I don't see how
>     it could be implemented. I don't know how to check whether some
>     address actually is a DMA address and even if there was a way to
>     know, dma_to_phys still requires a pointer to the device struct
>     which was used for allocation.
> 2. Provide another version which takes a dma_addr_t instead of void*
>     This can be easily done, but things get complicated when the device
>     for which the DMA memory was allocated is not the xenbus_device
>     which is passed anyway. So, it would be necessary to include an
>     additional argument pointing the actual device struct which was used
>     for allocation.
> 3. Just use gnttab_grant_foreign_access which works with GFNs anyway
>     Which is essentially what I'm doing currently, as in my driver I
>     know from which the device the DMA addresses were allocated.
>     If this is the preferred solution to this problem, I propose adding
>     a warning to the documentation of xenbus_grant_ring that forbids
>     using this for vaddrs obtained from the DMA API as it will not work
>     (at least on ARM).
> 
> What do you think?
> 
> Greetings from Germany,
> Simon

Best regards,

-- 
Julien Grall

