Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E540059F5F1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392300.630556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmQn-0007f6-3t; Wed, 24 Aug 2022 09:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392300.630556; Wed, 24 Aug 2022 09:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmQn-0007bd-0o; Wed, 24 Aug 2022 09:12:13 +0000
Received: by outflank-mailman (input) for mailman id 392300;
 Wed, 24 Aug 2022 09:12:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQmQl-0007bX-Ed
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:12:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQmQl-0000O9-2O; Wed, 24 Aug 2022 09:12:11 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQmQk-0000eZ-Rg; Wed, 24 Aug 2022 09:12:10 +0000
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
	bh=QiHRl3RIqzXnjebnN1ENkRNyAHOBjxUqBnDH+nC8cbA=; b=jtqvDVQPuVEUeLrmsQrgOnVZfK
	KsYOel7znTZw/pg2SR7PofLO8v0p7wce9mzElwd/4sqkrvmDPXSvhr8GCjVAy2O9CW+wN5++bEtsL
	LH43kgCIdsf0OKlXSnPpOeAyn00N9kVqtuoYOUYFVu5aYWoy9BCjkesmcpnTiZEssp6w=;
Message-ID: <e1742e37-78a3-8de8-6cf1-b16bc2bab91c@xen.org>
Date: Wed, 24 Aug 2022 10:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v10 6/9] xen: unpopulate memory when domain is static
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220816023658.3551936-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/08/2022 03:36, Penny Zheng wrote:
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

Other than Jan's comment:

Acked-by: Julien Grall <jgrall@amazon.com>

AFAICT, patch #2 needs some tweak. So I assuming this will need a 
respin. If not, I can possibly handle the change while committing if you 
provide a new version of the commit message.

Cheers,

-- 
Julien Grall

