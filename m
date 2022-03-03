Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818314CB9F7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 10:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282859.481688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPhYa-0001hZ-Me; Thu, 03 Mar 2022 09:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282859.481688; Thu, 03 Mar 2022 09:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPhYa-0001fj-JX; Thu, 03 Mar 2022 09:15:32 +0000
Received: by outflank-mailman (input) for mailman id 282859;
 Thu, 03 Mar 2022 09:15:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPhYY-0001fd-Pv
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 09:15:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPhYY-0001Ck-IO; Thu, 03 Mar 2022 09:15:30 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPhYY-0000NK-Az; Thu, 03 Mar 2022 09:15:30 +0000
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
	bh=VmHKFRwwZlFDN0vrDp/zGMEMHRmiUBB3siuNUwo8XHY=; b=5lJLzwxbXLt6CjZmQNwSrxFQ3P
	2D/AMQf6lYrs0g3TJzisN1eZa4tghyXCJYLIUTAV/I13hIVcn6NNtciaY8kQevHqct68c3yR6755U
	WKKcqyW8t/+gvZK6kHpn0JeDwN1APdWC26x7yb7/YIisRV3Tufv4YoTlJgs1SqyZoXcw=;
Message-ID: <4058b2c7-4c46-bdb1-017d-69a934989071@xen.org>
Date: Thu, 3 Mar 2022 09:15:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
 <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5eb5fe51-9ef7-affe-06e1-b15da512a76c@xen.org>
 <PAXPR08MB7420836458E512FE375B8F199E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420836458E512FE375B8F199E049@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 03/03/2022 01:35, Wei Chen wrote:
>>> 1. Assembly code for EL1 MPU context_switch
>>
>> This discussion reminds me when KVM decided to rewrite their context
>> switch from assembly to C. The outcome was the compiler is able to do a
>> better job than us when it comes to optimizing.
>>
>> With a C version, we could also share the save/restore code with 32-bit
>> and it is easier to read/maintain.
>>
>> So I would suggest to run some numbers to check if it really worth
>> implementing the MPU save/restore in assembly.
>>
> 
> It's interesting to hear KVM guys have similar discussion. Yes, if the
> gains of assembly code is not very obvious, then reusing the code for 32-bit
> would be more important. As our current platform (FVP) could not do very
> precise performance measurement. I want to keep current assembly code there,
> when we have a platform that can do such measurement we can have a thread
> to discuss it.

I briefly looked at the code, the assembly version is not going to be 
trivial to review and we don't know yet whether it has an advantage. So 
I would say this should be the inverse here.

We want the C version first until we can prove the assembly version is 
better.

My gut feeling is we will not need the assembly version.

Cheers,

-- 
Julien Grall

