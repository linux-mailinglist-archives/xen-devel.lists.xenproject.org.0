Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC94545E7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226797.392071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJQi-0002Lb-0F; Wed, 17 Nov 2021 11:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226797.392071; Wed, 17 Nov 2021 11:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJQh-0002Jg-T3; Wed, 17 Nov 2021 11:48:43 +0000
Received: by outflank-mailman (input) for mailman id 226797;
 Wed, 17 Nov 2021 11:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mnJQh-0002Ja-57
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:48:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnJQg-0007VL-3P; Wed, 17 Nov 2021 11:48:42 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mnJQf-0003dF-TA; Wed, 17 Nov 2021 11:48:42 +0000
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
	bh=mpApsSg1E3OQHUYW1TRPvg2gV1+EAFXMAWBUyIm1WpA=; b=S+dWXGtsFfmy6yoge4TnqdssEZ
	DQVJ8nYPnoUekh2yYnDPdGnNo3gUi1+8nt+Z+iPB0zt3Yc3U4xjhQKfq2ih8S2arrfqDKtNA/vEwz
	Uto1zt3oj26pxj4jmHLyf7D1ynbQhc4ybF8aaa3mtnlyrE84PtV63fLVJq5+wuBT8j5A=;
Message-ID: <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
Date: Wed, 17 Nov 2021 11:48:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2021 11:16, Bertrand Marquis wrote:
> Hi Julien,

Hi,

>> On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 17/11/2021 09:57, Luca Fancellu wrote:
>>> Currently Xen creates a default cpupool0 that contains all the cpu brought up
>>> during boot and it assumes that the platform has only one kind of CPU.
>>> This assumption does not hold on big.LITTLE platform, but putting different
>>> type of CPU in the same cpupool can result in instability and security issues
>>> for the domains running on the pool.
>>
>> I agree that you can't move a LITTLE vCPU to a big pCPU. However...
>>
>>> For this reason this serie introduces an architecture specific way to create
>>> different cpupool at boot time, this is particularly useful on ARM big.LITTLE
>>> platform where there might be the need to have different cpupools for each type
>>> of core, but also systems using NUMA can have different cpu pool for each node.
>>
>> ... from my understanding, all the vCPUs of a domain have to be in the same cpupool. So with this approach it is not possible:
>>    1) to have a mix of LITTLE and big vCPUs in the domain
>>    2) to create a domain spanning across two NUMA nodes
>>
>> So I think we need to make sure that any solutions we go through will not prevent us to implement those setups.
> 
> The point of this patch is to make all cores available without breaking the current behaviour of existing system.

I might be missing some context here. By breaking current behavior, do 
you mean user that may want to add "hmp-unsafe" on the command line?

Cheers,

-- 
Julien Grall

