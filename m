Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA24641866
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 19:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452716.710493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1X0Z-0000KC-52; Sat, 03 Dec 2022 18:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452716.710493; Sat, 03 Dec 2022 18:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1X0Z-0000HM-1R; Sat, 03 Dec 2022 18:13:03 +0000
Received: by outflank-mailman (input) for mailman id 452716;
 Sat, 03 Dec 2022 18:13:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1X0X-0000HG-R0
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 18:13:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1X0X-0008OB-Fj; Sat, 03 Dec 2022 18:13:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1X0X-0005UQ-AS; Sat, 03 Dec 2022 18:13:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=vHx8gj90UWxkp+A1PdafvslTE+RAcZrS3iO+38jfYaQ=; b=o648F8gumCVUtNPecaCADiR6tq
	nVcbhPgoEtSsoFbNe2QZW4PY3twuRvWxWkeyTtQAQDnzVs6guNpSwc8f/BXPMrc3nOE4ZNvapsN6N
	sK00PqI7Xc58LsSoyVkXMg/916ThXS9lJ0HjIyw3YmeKV2DHmrjKyZl6TOMFS0NIgItM=;
Message-ID: <0af28944-f194-fc3d-1e24-8ad924f59b03@xen.org>
Date: Sat, 3 Dec 2022 18:12:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] Arm/P2M: reduce locking in p2m_{alloc,free}_page()
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <c29a48ba-a662-f92a-4b97-0694dc93684a@suse.com>
 <711bf14e-7059-6bf3-4337-c25d027cc532@xen.org>
In-Reply-To: <711bf14e-7059-6bf3-4337-c25d027cc532@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/11/2022 15:53, Julien Grall wrote:
> Hi Jan,
> 
> On 29/11/2022 15:39, Jan Beulich wrote:
>> It is generally preferable to not hold locks around allocation
>> functions. And indeed in the hwdom case there's no point at all to hold
>> the paging lock. Reduce the locked regions to the non-hwdom case, while
>> at the same time arranging for p2m_alloc_page() to have just a single
>> return point.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

It is now committed.

Cheers,

-- 
Julien Grall

