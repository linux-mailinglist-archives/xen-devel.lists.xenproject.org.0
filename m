Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5152772E
	for <lists+xen-devel@lfdr.de>; Sun, 15 May 2022 12:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329368.552587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqBws-0001Gl-PT; Sun, 15 May 2022 10:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329368.552587; Sun, 15 May 2022 10:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqBws-0001E4-M5; Sun, 15 May 2022 10:58:06 +0000
Received: by outflank-mailman (input) for mailman id 329368;
 Sun, 15 May 2022 10:58:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqBwr-0001Dy-DR
 for xen-devel@lists.xenproject.org; Sun, 15 May 2022 10:58:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqBwq-00085v-Li; Sun, 15 May 2022 10:58:04 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqBwq-0004lJ-FU; Sun, 15 May 2022 10:58:04 +0000
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
	bh=sijXoezdeLPhwSVDSsO8yT8FIeH1G73CLFXpmSXpA/M=; b=PEQKaRK/uLwz2BqeyKW+75R6rk
	/xy04l5U31BkrCJftDrRUr6vxd/OC9xn7NFeC0G6OQwz//WjM0HQu3zlcUGg13w9v5N02qQDcbq2Z
	dc/+lFw8hOvABsOanlUVgLS1knoT/XZxOHeW7k/DvWAsdeALV6gbXaOgBuDo5BIuojXk=;
Message-ID: <c14a2bbb-d21f-4332-dd3b-1f5f073b90d0@xen.org>
Date: Sun, 15 May 2022 11:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220507025434.1063710-1-Henry.Wang@arm.com>
 <20220507025434.1063710-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220507025434.1063710-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/05/2022 03:54, Henry Wang wrote:
> With the enhanced ASSERT_ALLOC_CONTEXT, calling request_irq before
> local_irq_enable on secondary cores will lead to
> 
> (XEN) Xen call trace:
> (XEN) [<000000000021d86c>] alloc_xenheap_pages+0x74/0x194 (PC)
> (XEN) [<000000000021d864>] alloc_xenheap_pages+0x6c/0x194 (LR)
> (XEN) [<0000000000229e90>] xmalloc_tlsf.c#xmalloc_pool_get+0x1c/0x28
> (XEN) [<000000000022a270>] xmem_pool_alloc+0x21c/0x448
> (XEN) [<000000000022a8dc>] _xmalloc+0x8c/0x290
> (XEN) [<000000000026b57c>] request_irq+0x40/0xb8
> (XEN) [<0000000000272780>] init_timer_interrupt+0x74/0xcc
> (XEN) [<000000000027212c>] start_secondary+0x1b4/0x238
> (XEN) [<0000000084000200>] 0000000084000200
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 4:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
> num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
> (XEN) ****************************************
> 
> on systems without a big enough pool for xmalloc() to cater the
> requested size.
> 
> Moving the call of request_irq() past local_irq_enable() on
> secondary cores will make sure the assertion condition in
> alloc_xenheap_pages(), i.e. !in_irq && local_irq_enabled() is
> satisfied. It is also safe because the timer and GIC maintenance
> interrupt will not be used until the CPU is fully online.
> 
> Reported-by: Wei Chen <Wei.Chen@arm.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

