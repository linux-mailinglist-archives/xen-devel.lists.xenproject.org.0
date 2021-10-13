Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9271D42C117
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208451.364578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mae3C-00020N-GC; Wed, 13 Oct 2021 13:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208451.364578; Wed, 13 Oct 2021 13:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mae3C-0001yZ-CM; Wed, 13 Oct 2021 13:12:06 +0000
Received: by outflank-mailman (input) for mailman id 208451;
 Wed, 13 Oct 2021 13:12:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mae3B-0001yT-3B
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:12:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mae39-0005Hy-7k; Wed, 13 Oct 2021 13:12:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mae39-0000C8-0o; Wed, 13 Oct 2021 13:12:03 +0000
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
	bh=5PJWoDUK/Rr0ZsQ7XsqDOWVB68fWASA5VWj02ABvHVU=; b=2zu0C0Y79w2m+dYQGCYPVV7blL
	HyMemfBlE0aNXgo5y7A0fp+Jz8/GiU80YMyxt0iYteQS/bpkOnf+tGQwYLkh5VzxX3vI8265laXwS
	UE7pklT7PKIE/u1pdSiKh7t2D49azAVxoKSIz/E+KOr8A6USiA1oDq7a2N/3wYSgcvrw=;
Message-ID: <bcdf096c-aeaa-5d5f-fffc-95719c7b4038@xen.org>
Date: Wed, 13 Oct 2021 14:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v7] xen: Expose the PMU to the guests
To: Ian Jackson <iwj@xenproject.org>, Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 bertrand.marquis@arm.com
References: <20211013123352.6625-1-michal.orzel@arm.com>
 <24934.54743.853232.853726@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <24934.54743.853232.853726@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ian,

On 13/10/2021 13:49, Ian Jackson wrote:
> Michal Orzel writes ("[PATCH v7] xen: Expose the PMU to the guests"):
>> Add parameter vpmu to xl domain configuration syntax
>> to enable the access to PMU registers by disabling
>> the PMU traps(currently only for ARM).
>>
>> The current status is that the PMU registers are not
>> virtualized and the physical registers are directly
>> accessible when this parameter is enabled. There is no
>> interrupt support and Xen will not save/restore the
>> register values on context switches.
>>
>> According to Arm Arm, section D7.1:
>> "The Performance Monitors Extension is common
>> to AArch64 operation and AArch32 operation."
>> That means we have an ensurance that if PMU is
>> present in one exception state, it must also be
>> present in the other.
>>
>> Please note that this feature is experimental.
> ...
>> Changes since v6:
>> -fix missing "HVM" for vPMU entry in SUPPORT.md
> 
> The SUPPORT.md changes LGTM, thanks.
> 
>> -Virtual Performance Management Unit for HVM guests
>> +Virtual Performance Management Unit
>>   
>> -    Status, x86: Supported, Not security supported
>> +    Status, x86 HVM: Supported, Not security supported
>> +    Status, ARM: Experimental
>> +
>> +On ARM, support for accessing PMU registers from the guests.
>> +There is no interrupt support and Xen will not save/restore
>> +the register values on context switches.
> 
> FTAOD ISTM that this limitation makes the feature very hard to use
> successfully on ARM.  You would need to pin vcpus to dedicated
> pcpus ?

Yes and this is not really the only restriction for the feature. You 
can't even use the PMU properly with an out-of-box domain... But a few 
stakeholders seem to be happy with this hackyness for now.

> 
> I think this is fine for an experimental feature.
> 
> I think this patch needs a ARM/hypervisor acks still.

I am in the signed-off-by list. Even if the patch has changed compare 
the original, I feel it is odd to ack my own patch.

 From my understanding, my signed-off-by is sufficient serve as an 
approval for the maintainer part. We also have a review form a person of 
a suitable stature in the community (Bertrand). So I think in term of 
approval we are good.

Additionally, from a discussion yesterday on IRC, Stefano was happy with 
this patch (I was the one requesting the resend for SUPPORT.MD). So I 
think we can commit it now.

Let me know if you prefer to wait for a formal Ack from Stefano.

Cheers,

-- 
Julien Grall

