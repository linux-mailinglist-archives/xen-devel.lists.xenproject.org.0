Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10FABFADF
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992220.1376071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHm1o-0004sq-Lj; Wed, 21 May 2025 16:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992220.1376071; Wed, 21 May 2025 16:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHm1o-0004pt-IC; Wed, 21 May 2025 16:10:48 +0000
Received: by outflank-mailman (input) for mailman id 992220;
 Wed, 21 May 2025 16:10:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uHm1m-0004kc-Ut
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:10:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHm1l-0062hr-29;
 Wed, 21 May 2025 16:10:45 +0000
Received: from [15.248.2.235] (helo=[10.24.67.107])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHm1l-0074CM-0W;
 Wed, 21 May 2025 16:10:45 +0000
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
	bh=A5vMC1ohmzupjDbGzo04CEdKXoiwWkMzOtbB9xCtnzQ=; b=E0ClzlH9mqYoQ/iT+DNhxnrXtS
	uOC8XFbOcVddLqlu3mn7gx5OHonsrYbLjiZYJm7F6olwTB34DwV4D5+4FW0KVeltkcvVb2yTvM972
	FeY5bz/JkY58PJpCYXnca9GsfxsvTGdzMhr8ZDIsSPrp44QLhNppk9hQIzUC4hLxbEk4=;
Message-ID: <9a9682aa-2888-47f5-a985-52e95bf9f9a7@xen.org>
Date: Wed, 21 May 2025 17:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/gnttab: do not implement GNTTABOP_cache_flush
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250521091225.84597-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250521091225.84597-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 21/05/2025 10:12, Roger Pau Monne wrote:
> The current underlying implementation of GNTTABOP_cache_flush on x86 won't
> work as expected.  The provided {clean,invalidate}_dcache_va_range()
> helpers only do a local pCPU cache flush, so the cache of previous pCPUs
> where the vCPU might have run are not flushed.
> 
> However instead of attempting to fix this, make the GNTTABOP_cache_flush
> operation only available to ARM.  There are no known users on x86, the
> implementation is broken, and other architectures don't have grant-table
> support yet.
> 
> With that operation not implemented on x86, the related
> {clean,invalidate}_dcache_va_range() helpers can also be removed.
> 
> Fixes: f62dc81c2df7 ("x86: introduce more cache maintenance operations")
> Fixes: 18e8d22fe750 ("introduce GNTTABOP_cache_flush")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


