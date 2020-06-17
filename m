Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E181FD1E8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 18:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlaqN-0004pv-8f; Wed, 17 Jun 2020 16:23:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VBsC=76=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jlaqM-0004pp-1t
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 16:23:18 +0000
X-Inumbo-ID: d97c3ff8-b0b6-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d97c3ff8-b0b6-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 16:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmp7KriPlTNX+dbyIsz4SSI8efFYX5h0yhnkAvyhYpU=; b=46RT7xRBZ6b5k4OQHzTxiXw21J
 GeU3XgZ0qBs+6D0TMlhhLnx3WT3VG37CWUciZNccX5o9IpzPBfssgzzYU9R93soTSfYrog0rmLwrE
 N1K4UDuPMwfCUtejskYBubQROz6ka9qrawQOcL01b2wkMX0BRbF6bza7afM92zk/rzYY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlaqE-0007UR-28; Wed, 17 Jun 2020 16:23:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jlaqD-0004Or-RZ; Wed, 17 Jun 2020 16:23:09 +0000
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
Date: Wed, 17 Jun 2020 17:23:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: paul@xen.org, Andre.Przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Bertrand.Marquis@arm.com, security@xenproject.org,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 16/06/2020 22:24, Stefano Stabellini wrote:
> On Tue, 16 Jun 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Some CPUs can speculate past a RET instruction and potentially perform
>> speculative accesses to memory before processing the return.
>>
>> There is no known gadget available after the RET instruction today.
>> However some of the registers (such as in check_pending_guest_serror())
>> may contain a value provided the guest.
>                                ^ by
> 
> 
>> In order to harden the code, it would be better to add a speculation
>> barrier after each RET instruction. The performance is meant to be
>> negligeable as the speculation barrier is not meant to be archicturally
>> executed.
>>
>> Note that on arm32, the ldmia instruction will act as a return from the
>> function __context_switch(). While the whitepaper doesn't suggest it is
>> possible to speculate after the instruction, add preventively a
>> speculation barrier after it as well.
>>
>> This is part of the work to mitigate straight-line speculation.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I did a compile-test on the patch too.
> 
> 
>> ---
>>
>> I am still unsure whether we preventively should add a speculation barrier
>> preventively after all the RET instructions in arm*/lib/. The smc call be
>> taken care in a follow-up patch.
> 
> SMC is great to have but it seems to be overkill to do the ones under
> lib/.
 From my understanding, the compiler will add a speculation barrier 
preventively after each 'ret' when the mitigation are turned on.So it 
feels to me we want to follow the same approach.

Obviously, we can avoid them but I would like to have a justification 
for not adding them (nothing is overkilled against speculation ;)).

Cheers,

-- 
Julien Grall

