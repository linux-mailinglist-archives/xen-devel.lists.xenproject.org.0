Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C50A467717
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237519.411944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7N9-0006U0-Q7; Fri, 03 Dec 2021 12:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237519.411944; Fri, 03 Dec 2021 12:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7N9-0006Rc-MS; Fri, 03 Dec 2021 12:09:03 +0000
Received: by outflank-mailman (input) for mailman id 237519;
 Fri, 03 Dec 2021 12:09:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek4d=QU=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1mt7N8-0006RR-BE
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:09:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cc91410b-5431-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 13:09:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E794E1396;
 Fri,  3 Dec 2021 04:08:59 -0800 (PST)
Received: from [10.57.0.138] (unknown [10.57.0.138])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B534F3F5A1;
 Fri,  3 Dec 2021 04:08:58 -0800 (PST)
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
X-Inumbo-ID: cc91410b-5431-11ec-b1df-f38ee3fbfdf7
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
 <4f14f0ec-82f4-df4a-5d87-9c39727b4634@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <6b66bb69-9cb3-3311-d690-848b95295d18@arm.com>
Date: Fri, 3 Dec 2021 13:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f14f0ec-82f4-df4a-5d87-9c39727b4634@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Julien,

On 03.12.2021 13:05, Julien Grall wrote:
> Hi Michal,
> 
> On 03/12/2021 09:58, Michal Orzel wrote:
>> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
>> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
>> forgot to modify a comment about lr_pending list,
>> referring to a function that has been renamed.
>> Fix that.
>>
>> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
> 
> The format for fixes tag is a 12 characters sha1 followed by the commit message. In this case, it would be:
> 
> Fixes: 68dcdf942326 ("xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq")
> 
> I can fix it on commit.
Please do. I forgot about this requirement.
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>>   xen/include/asm-arm/vgic.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
>> index e69a59063a..ade427a808 100644
>> --- a/xen/include/asm-arm/vgic.h
>> +++ b/xen/include/asm-arm/vgic.h
>> @@ -195,7 +195,7 @@ struct vgic_cpu {
>>        * corresponding LR it is also removed from this list. */
>>       struct list_head inflight_irqs;
>>       /* lr_pending is used to queue IRQs (struct pending_irq) that the
>> -     * vgic tried to inject in the guest (calling gic_set_guest_irq) but
>> +     * vgic tried to inject in the guest (calling gic_raise_guest_irq) but
>>        * no LRs were available at the time.
>>        * As soon as an LR is freed we remove the first IRQ from this
>>        * list and write it to the LR register.
>>
> 
> Cheers,
> 
Cheers,
Michal

