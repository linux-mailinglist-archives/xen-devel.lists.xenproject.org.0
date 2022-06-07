Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A753F972
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 11:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343056.568200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyVNG-0008Ie-UT; Tue, 07 Jun 2022 09:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343056.568200; Tue, 07 Jun 2022 09:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyVNG-0008Fn-Q6; Tue, 07 Jun 2022 09:19:42 +0000
Received: by outflank-mailman (input) for mailman id 343056;
 Tue, 07 Jun 2022 09:19:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nyVNF-0008Fh-4I
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 09:19:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyVNE-0000wY-91; Tue, 07 Jun 2022 09:19:40 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.140]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nyVNE-0006rb-2H; Tue, 07 Jun 2022 09:19:40 +0000
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
	bh=2opv/XBw1QQEw+2S/BMwrXlgcVc9+WDeXBnjQRn0s+0=; b=nzDFjR1AgFWNcZBBSFhiE2iIHc
	MJR3a3E+SfQPp/jOwwzK9kAJqIcRBoGxZWN4c3o3II4EN0unTgSEWkch3BW46yB8DbaLJf9S92a6D
	inOFFYA3orjNz6JIcv3X+0DiRh+RNPIRTEyCuR9LuJlf1Yr+Qr0CfFL1MpyuMtD7Veyw=;
Message-ID: <72bec2ab-13d7-8de9-6bb9-f1e4f9de6a3b@xen.org>
Date: Tue, 7 Jun 2022 10:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v6 7/9] xen/arm: unpopulate memory when domain is static
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220607073031.722174-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2022 08:30, Penny Zheng wrote:
> Today when a domain unpopulates the memory on runtime, they will always
> hand the memory back to the heap allocator. And it will be a problem if domain
> is static.
> 
> Pages as guest RAM for static domain shall be reserved to only this domain
> and not be used for any other purposes, so they shall never go back to heap
> allocator.
> 
> This commit puts reserved pages on the new list resv_page_list only after
> having taken them off the "normal" list, when the last ref dropped.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6 changes:
> - refine in-code comment
> - move PGC_static !CONFIG_STATIC_MEMORY definition to common header

I don't understand why this change is necessary for this patch. AFAICT, 
all the users of PGC_static will be protected by #ifdef 
CONFIG_STATIC_MEMORY and therefore PGC_static should always be defined.

Cheers,

-- 
Julien Grall

