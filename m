Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D250055B91A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356423.584644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lpr-0002BB-4B; Mon, 27 Jun 2022 10:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356423.584644; Mon, 27 Jun 2022 10:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lpr-00028a-1W; Mon, 27 Jun 2022 10:19:15 +0000
Received: by outflank-mailman (input) for mailman id 356423;
 Mon, 27 Jun 2022 10:19:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5lpp-00028U-BT
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:19:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lph-0000BO-3e; Mon, 27 Jun 2022 10:19:05 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lpg-0000Qq-Sy; Mon, 27 Jun 2022 10:19:05 +0000
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
	bh=Fd7SNqyJ3gUsXFoqNaY/wMGrGZ8jzIRgsGEe0NNTWQk=; b=EScbIo1cJ1Ltt7MgsScCWkr+PP
	wQXWUa1BDlPYwCOErJOV3yIZ3pjGYrUU9PbdYtGcEu7F/N8bOAQTi4pXEtqkZR5unu/JGpXq19dkz
	HycJaDJxirOWbTSn7EYmdx/j7IAmprccIFyGpTWkd15ze8j2tIIUN0Z9qwc3hxkJHSIU=;
Message-ID: <380b2610-fe2f-6246-e6a4-f0dd8295d488@xen.org>
Date: Mon, 27 Jun 2022 11:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] xen/arm: unpopulate memory when domain is static
To: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
 <20220620024408.203797-8-Penny.Zheng@arm.com>
 <5ac0e46d-2100-331e-b4d2-8fc715973b71@suse.com>
 <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73255B2995B4692B5D46252FF7B99@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2022 11:03, Penny Zheng wrote:
> Hi jan
> 
>> -----Original Message-----
> put_static_pages, that is, adding pages to the reserved list, is only for freeing static
> pages on runtime. In static page initialization stage, I also use free_statimem_pages,
> and in which stage, I think the domain has not been constructed at all. So I prefer
> the freeing of staticmem pages is split into two parts: free_staticmem_pages and
> put_static_pages

AFAIU, all the pages would have to be allocated via 
acquire_domstatic_pages(). This call requires the domain to be allocated 
and setup for handling memory.

Therefore, I think the split is unnecessary. This would also have the 
advantage to remove one loop. Admittly, this is not important when the 
order 0, but it would become a problem for larger order (you may have to 
pull the struct page_info multiple time in the cache).

Cheers,

-- 
Julien Grall

