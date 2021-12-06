Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BED46A5B5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 20:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239838.415828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muJhe-0004gO-B7; Mon, 06 Dec 2021 19:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239838.415828; Mon, 06 Dec 2021 19:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muJhe-0004dn-84; Mon, 06 Dec 2021 19:31:10 +0000
Received: by outflank-mailman (input) for mailman id 239838;
 Mon, 06 Dec 2021 19:31:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muJhd-0004dh-2u
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 19:31:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muJhc-0005LF-K5; Mon, 06 Dec 2021 19:31:08 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muJhc-00011X-Dt; Mon, 06 Dec 2021 19:31:08 +0000
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
	bh=Z0kyI+2+HqZ6AlQwoVkqd9bi4NchKr2lcUo+cH6Q158=; b=ejxsjpL4pM+77PvGFsaO6X2JP2
	XFX3WTHmY6ln3fUoHpAcfr4fiWkjys4x9dmaRhHXGGLXZnEz47xkj0ylnRxnbInXi1BgPMqu7w0TJ
	0Yu2wElLO5tYs7bxgFeoR9SHZaJBVRfU3ysqvShDDj9yBLQ1TNmDe6czNYdBkSXJQ3Rk=;
Message-ID: <4315f3f8-4431-3257-dc95-a3089532237b@xen.org>
Date: Mon, 6 Dec 2021 19:31:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: Andre Przywara <Andre.Przywara@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "stefanos@xilinx.com" <stefanos@xilinx.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <20211130094950.1bf368d6@donnerap.cambridge.arm.com>
 <a69d41f1-7b57-c127-ae73-2de5a581dddd@xilinx.com>
 <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <D8811539-65F2-4D40-BFEF-CE72EA8E902A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 01/12/2021 08:41, Bertrand Marquis wrote:
> Hi Ayan,
> 
>> On 30 Nov 2021, at 19:13, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>
>> Hi Andre,
>>
>> Thanks for your comments. They are useful.
>>
>> On 30/11/2021 09:49, Andre Przywara wrote:
>>> On Mon, 29 Nov 2021 19:16:38 +0000
>>> Ayan Kumar Halder <ayan.kumar.halder@xilinx.com> wrote:
>>> Hi,
>>>> At the moment, Xen is only handling data abort with valid syndrome (i.e.
>>>> ISV=0). Unfortunately, this doesn't cover all the instructions a domain
>>>> could use to access MMIO regions.
>>>>
>>>> For instance, Xilinx baremetal OS will use:
>>>>
>>>>          volatile u32 *LocalAddr = (volatile u32 *)Addr;
>>>>          *LocalAddr = Value;
>>>>
>>>> This leave the compiler to decide which store instructions to use.
>>> As mentioned in the other email, this is wrong, if this points to MMIO:
>>> don't let the compiler do MMIO accesses. If a stage 2 fault isn't in
>>> an MMIO area, you should not see traps that you cannot handle already.
>>> So I don't think it's a good idea to use that as an example. And since
>>> this patch only seems to address this use case, I would doubt its
>>> usefulness in general.
>> Yes, I should have fixed the comment.
>>
>> Currently, I am testing with baremetal app which uses inline assembly code with post indexing instructions, to access the MMIO.
>>
>> ATM, I am testing with 32 bit MMIO only.
>>
>> On the usefulness, I am kind of torn as it is legitimate for post indexing instructions to be used in an inline-assembly code for accessing MMIO. However, that may not be something commonly seen.
>>
>> @Stefano/Bertrand/Julien/Volodymyr :- As you are the Arm mantainers, can you comment if we should have decoding logic or not ?
> 
> Andre gave you the official statement from Arm and there is nothing more I can say.

I think this would be handy for other hypervisor and OS developper to 
know what they can expect when running in a virtualized environment. So 
would it be possible to update the Arm Arm reflecting this statement?

> I will leave this decision to Stefano and Julien.

I have had a chat on IRC with Stefano about this. I think the main 
sticking point is the Arm Arm doesn't clearly state those instructions 
should not be used by a virtualized OS on MMIO regions.

To me, this topic looks similar to the set/way instruction dilemma. They 
are a pain to virtualize (and the Arm Arm clearly hint it) but we had to 
do it because some OSes relied on them.

I think the main difference is the Arm Arm doesn't hint they should not 
be used (it only says a valid syndrome is not provided) and the 
implementation should hopefully be smaller and self-contained.

So I would be inclined to allow Xen to decode post-indexing instructions 
(pending the review).

Cheers,

-- 
Julien Grall

