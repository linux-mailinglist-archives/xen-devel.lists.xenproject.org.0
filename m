Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA55B1B7E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:32:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403172.645180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFlU-0007Iu-9t; Thu, 08 Sep 2022 11:32:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403172.645180; Thu, 08 Sep 2022 11:32:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFlU-0007H2-5c; Thu, 08 Sep 2022 11:32:12 +0000
Received: by outflank-mailman (input) for mailman id 403172;
 Thu, 08 Sep 2022 11:32:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWFlS-0007Gu-L9
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:32:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFlS-0006Ar-EI; Thu, 08 Sep 2022 11:32:10 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFlS-0005EE-8k; Thu, 08 Sep 2022 11:32:10 +0000
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
	bh=ZYtUtvSlAkEvpZ45leWGUpubBqy2mShuW4fu7d9MF8c=; b=iwrmA7NLJMR0NqMrQ/r1XxLaTg
	r9JdhuDmDll42RW9gC5fXFd4Fr4x3w+Fzetwu+HAAipArBUU8uoP33bFBavm2l6RRvsWxYlaMbe+v
	KcUS9ZOhWCJxWYuPh5mepJz6pGVJfM9V1JD8d9I3XAj/LnO5qTq8QyGLQF09WSCKrvFM=;
Message-ID: <4e561e37-d911-4be9-f50d-3799c71ee3cf@xen.org>
Date: Thu, 8 Sep 2022 12:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v5 7/7] xen/arm: introduce xen-evtchn dom0less property
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662563170.git.rahul.singh@arm.com>
 <f56939423b0b2d9330ff5e88f5f52e5a538f52d0.1662563170.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209071704180.157835@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2209071704180.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/09/2022 01:04, Stefano Stabellini wrote:
> On Wed, 7 Sep 2022, Rahul Singh wrote:
>> Introduce a new sub-node under /chosen node to establish static event
>> channel communication between domains on dom0less systems.
>>
>> An event channel will be created beforehand to allow the domains to
>> send notifications to each other.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> For the DT binding:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed but I didn't notice the "For the DT binding" 
above. So I mistakenly interpreted this as you reviewed everything. Let 
me know if that's a problem with you.

For the future may I ask to use suffix with "# DT binding" as this is 
easier to spot when using automatic tools (e.g. b4)?

Cheers,

-- 
Julien Grall

