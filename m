Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997151186F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 15:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315073.533430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhtH-0000VV-3O; Wed, 27 Apr 2022 13:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315073.533430; Wed, 27 Apr 2022 13:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njhtH-0000Ti-02; Wed, 27 Apr 2022 13:39:35 +0000
Received: by outflank-mailman (input) for mailman id 315073;
 Wed, 27 Apr 2022 13:39:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njhtF-0000TX-IJ
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 13:39:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njhtA-0006iu-Ri; Wed, 27 Apr 2022 13:39:28 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njhtA-0007Fd-Ky; Wed, 27 Apr 2022 13:39:28 +0000
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
	bh=oQEdwBmNPJJr+RVjgIrjDpu6U+aAHy+3RVtHczzXuuE=; b=yhlKUhqpFGfsJGuKw56SehZ19J
	F+yavbpH8xXzvuOHZMN02i07DRBLLulyvMiMDZ9wQcK19GYmNpFNwgnWzD7NI7o8vEN/7K+Jie2PY
	TnlR4qccvMMvaK1iMU6PIGdxofNJjUmMwtHoDjlHNnIw29OxXAoxm1kZeBWNmxBo8+sY=;
Message-ID: <e55c5c99-f3e7-58ae-08be-76dee88e87c5@xen.org>
Date: Wed, 27 Apr 2022 14:39:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH] SUPPORT.MD: Correct the amount of physical memory
 supported for Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220427132246.52715-1-julien@xen.org>
 <066202e1-f4c8-be2e-4eb0-45a977d1de5e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <066202e1-f4c8-be2e-4eb0-45a977d1de5e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/04/2022 14:34, Jan Beulich wrote:
> On 27.04.2022 15:22, Julien Grall wrote:
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -50,9 +50,10 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>>   
>>   ### Physical Memory
>>   
>> -    Status: Supported up to 8 TiB
>> -
>> -Hosts with more memory are supported, but not security supported.
>> +    Status, x86: Supported up to 8 TiB. Hosts with more memory are
>> +                 supported but not security support.
> 
> Nit: "supported" also in the 2nd instance, as it was before. I think
> retaining the comma would also be beneficial.

Agree for both. Sorry, I rewrote the sentence rather than copying/pasting.

> 
>> +    Status, Arm32: Supported up to 12 GiB
>> +    Status, Arm64: Supported up to 2 TiB
> 
> This really will need to be ack-ed by an Arm person, so I don't see
> value in me providing an ack.

Bertrand and Stefanos should be CCed. I will wait input from them before 
resending a new version.

Cheers,

-- 
Julien Grall

