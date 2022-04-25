Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678A50E1E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 15:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312961.530380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyrM-0003sP-5W; Mon, 25 Apr 2022 13:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312961.530380; Mon, 25 Apr 2022 13:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyrM-0003qB-1g; Mon, 25 Apr 2022 13:34:36 +0000
Received: by outflank-mailman (input) for mailman id 312961;
 Mon, 25 Apr 2022 13:34:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1niyrK-0003q5-Jg
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 13:34:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niyrJ-00043p-LI; Mon, 25 Apr 2022 13:34:33 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.15.211]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niyrJ-0007Za-DY; Mon, 25 Apr 2022 13:34:33 +0000
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
	bh=VFA2bwq+N/g1nk5aB6qmDDdBQOpyn63PAsMd+yKpEvc=; b=5f4c6SdmfCTdpk4hcjk0RjAjm7
	VmticDrx/rxshlmf+tSEggBl+ps51jma3Kh7zFeHH2rHrErfSrNybUJKceCgPDz/zAlZaGEOGM2R0
	2iA9pquiU9KFQhqr/x91gZrrXf/PSrjsRyeiDk2nILw52uW5YmMQN1sNTo2TtPl3dHNA=;
Message-ID: <4fbc28f9-5a0e-5ed2-12a7-d2bfd63af633@xen.org>
Date: Mon, 25 Apr 2022 14:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
To: David Vrabel <dvrabel@cantab.net>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>
References: <20220425132801.1076759-1-dvrabel@cantab.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220425132801.1076759-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 25/04/2022 14:28, David Vrabel wrote:
> From: David Vrabel <dvrabel@amazon.co.uk>
> 
> Heap pages can only be safely allocated and freed with interuupts
> enabled as they may require a TLB flush which will send IPIs (on x86).
> 
> Normally spinlock debugging would catch calls from the incorrect
> context, but not from stop_machine_run() action functions as these are
> called with spin lock debugging disabled.
> 
> Enhance the assertions in alloc_xenheap_pages() and
> alloc_domheap_pages() to check interrupts are enabled. For consistency
> the same asserts are used when freeing heap pages.
> 
> As an exception, when only 1 PCPU is online, allocations are permitted
> with interrupts disabled as any TLB flushes would be local only. This
> is necessary during early boot.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
> ---
> Changes in v4:
> - Tweak comment.
> 
> Changes in v3:
> - Use num_online_cpus() in assert.
> 
> Changes in v2:
> - Set SYS_STATE_smp_boot on arm.
> ---
>   xen/common/page_alloc.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 319029140f..739ca6e74b 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,6 +162,13 @@
>   static char __initdata opt_badpage[100] = "";
>   string_param("badpage", opt_badpage);
>   
> +/*
> + * Heap allocations may need TLB flushes which require IRQs to be

The comment needs to be updated to reflect the fact that at least Arm 
doesn't use IPI to flush TLBs.

The update can possibly be done on commit.

> + * enabled (except when only 1 PCPU is online).
> + */

Cheers,

-- 
Julien Grall

