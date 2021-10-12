Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20F42A94E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207544.363419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKWY-0005pv-Br; Tue, 12 Oct 2021 16:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207544.363419; Tue, 12 Oct 2021 16:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKWY-0005o8-7u; Tue, 12 Oct 2021 16:21:06 +0000
Received: by outflank-mailman (input) for mailman id 207544;
 Tue, 12 Oct 2021 16:21:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maKWW-0005nm-8T
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:21:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maKWP-0005RV-Cr; Tue, 12 Oct 2021 16:20:57 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maKWP-0001m5-7U; Tue, 12 Oct 2021 16:20:57 +0000
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
	bh=sQXO04lq6vrstTxK7ij5JDZTAOLPs/BKLXVVYJ9yUJs=; b=R7QkZCtpw7uxZ14YsLh45CpZW1
	ZVhsH4HcPMDHZOWj+iqXI7PchCJQcWKUC9tQ7dmL4vvhE4Z308ZNHWxWtVg8WtBT7MwxJ4CIvaM1y
	U2K76Ytf0cjLYk+J3efnlQ+e9CIeauzWz/Non+VBLOtsNfADRjcyC5q0Bao0Kw+bkExw=;
Message-ID: <3b8ffd7d-cfc8-34c5-b0ad-aa23942dbe10@xen.org>
Date: Tue, 12 Oct 2021 17:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <2b0670e9-b442-047c-9479-daa97d6329f6@xen.org>
 <16C05F67-E3C8-44BE-9382-BF0EAA69AF5C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <16C05F67-E3C8-44BE-9382-BF0EAA69AF5C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/10/2021 17:12, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 12 Oct 2021, at 16:04, Julien Grall <julien@xen.org> wrote:
>>
>> On 11/10/2021 13:41, Bertrand Marquis wrote:
>>> Hi Jan,
>>
>> Hi Bertrand,
>>
>>> As Rahul is on leave, I will answer you and make the changes needed.
>>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>> Independent of this - is bare metal Arm enforcing this same
>>>> alignment restriction (unconditionally)? Iirc on x86 we felt we'd
>>>> better synthesize misaligned accesses.
>>> Unaligned IO access could be synthesise also on arm to but I would
>>> rather not make such a change now without testing it (and there is
>>> also a question of it making sense).
>>
>> Yes it makes sense. I actually have an item in my TODO list to forbid unaligned access because they should not happen on any device we currently emulate.
>>
>> Although, I am not aware of any issue other than the guest would shoot itself in the foot if this happens.
>>
>>> So if it is ok with you I will keep that check and discuss it with Rahul
>>> when he is back. I will add a comment in the code to make that clear.
>>
>> I am OK with it.
>>
>> [...]
>>
>>>> Throughout this series I haven't been able to spot where the HAS_VPCI
>>>> Kconfig symbol would get selected. Hence I cannot tell whether all of
>>>> this is Arm64-specific. Otherwise I wonder whether size 8 actually
>>>> can occur on Arm32.
>>> Dabt.size could be 3 even on ARM32 but we should not allow 64bit
>>> access on mmio regions on arm32.
>>
>> Hmmm... Looking at the Armv7 and Armv8 spec, ldrd/strd (64-bit read) would not present a valid ISV. So I think it is not be possible to have dabt.size = 3 for 32-bit domain. But I agree we probably want to harden the code.
>>
>>> So I will surround this code with ifdef CONFIG_ARM_64 and add a test
>>> for len > 4 to prevent this case on 32bit.
>>> To be completely right we should disable this also for 32bit guests but
>>> this change would be a bit more invasive.
>>
>> I think the following should be sufficient:
>>
>> if ( is_domain_32bit_domain() && len > 4 )
>>   return ...;
> 
> With the last request from Roger to use the function implemented in arch/x86/hw/io.c, the function will move to vpci.h so using is_32bit_domain will not be possible without ifdefery CONFIG_ARM.
> Also I have no access to the domain there.
> 
> So the best I can do for now would be something like:
> #ifdef CONFIG_ARM_32
> If (len == 8)
>      return false
> #endif
> 
> A 32bit guest on 64bit xen would not be checked.
> 
> Would that be ok for now ?

I think the #ifdef is a bit pointless. My preference would be to not add 
the #ifdef but instead add...

> 
> I could add a comment in the code to warn about the limitation.

.. a comment for now as this is only an hardening problem.

Cheers,

-- 
Julien Grall

