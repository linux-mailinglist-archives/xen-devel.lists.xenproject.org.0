Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE152774C
	for <lists+xen-devel@lfdr.de>; Sun, 15 May 2022 13:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329394.552620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqCcE-0007ia-MX; Sun, 15 May 2022 11:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329394.552620; Sun, 15 May 2022 11:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqCcE-0007gG-Jn; Sun, 15 May 2022 11:40:50 +0000
Received: by outflank-mailman (input) for mailman id 329394;
 Sun, 15 May 2022 11:40:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqCcC-0007g9-Em
 for xen-devel@lists.xenproject.org; Sun, 15 May 2022 11:40:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqCcB-0000Oe-Ru; Sun, 15 May 2022 11:40:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.16.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqCcB-0007iU-LH; Sun, 15 May 2022 11:40:47 +0000
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
	bh=sV+DZPXXisuF8dQ1tTKpfkJq0MivOExFO3DKcQGBh38=; b=zw0qlaQfhtooJaX1NRDnEQ4gwL
	xLZyUWz3H/R0ks16RkrVw9q5mraVGKzpZmFKiidTh5iQU1kvH6mLmK8lcyRomI0KvPchaSEgS0hCk
	/QBaQYAigYqBMB4BKIWPurJm7QAoDQA5Xuh6Tw+VEL3UuHUsqJiGYYVHO7Tg/c35FdTY=;
Message-ID: <5c0e81f1-fac4-f14f-f4a1-2a00f6d16f47@xen.org>
Date: Sun, 15 May 2022 12:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
 xmalloc()
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220507025434.1063710-1-Henry.Wang@arm.com>
 <20220507025434.1063710-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220507025434.1063710-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/05/2022 03:54, Henry Wang wrote:
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index e866e0d864..ea59cd1a4a 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,13 +162,6 @@
>   static char __initdata opt_badpage[100] = "";
>   string_param("badpage", opt_badpage);
>   
> -/*
> - * Heap allocations may need TLB flushes which may require IRQs to be
> - * enabled (except when only 1 PCPU is online).
> - */
> -#define ASSERT_ALLOC_CONTEXT() \
> -    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
> -
FYI, the patch introducing ASSERT_ALLOC_CONTEXT() has been reverted. I 
intend to re-introduce it once your previous patch and the one fixing 
the ITS (not yet formally sent) have been committed.

I have also checked that none of the ASSERTs() would be triggered on my 
x86 setup. So:

Tested-by: Julien Grall <jgrall@amazon.com>
Acked-by: Julien Grall <jgrall@amazon.com>

On a side note (no action expected for you), I noticed that the 
ASSERT()s would only trigger from CPU2 and onwards at least for Arm. 
This is because num_online_cpus() would still be 1 when bringing-up CPU1.

I went through the original discussion and I am not sure why we switched 
from < SYS_STATE_smp_boot to num_online_cpus() (aside that Arm doesn't 
set it). Aynway, this is not a major issue here as this is an ASSERT().

Cheers,

-- 
Julien Grall

