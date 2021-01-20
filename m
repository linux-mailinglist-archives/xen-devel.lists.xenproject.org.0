Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD342FD4A5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:58:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71592.128305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Frd-0000gq-0w; Wed, 20 Jan 2021 15:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71592.128305; Wed, 20 Jan 2021 15:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Frc-0000gT-U4; Wed, 20 Jan 2021 15:57:44 +0000
Received: by outflank-mailman (input) for mailman id 71592;
 Wed, 20 Jan 2021 15:57:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2Fra-0000gO-RC
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:57:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2FrZ-0003pO-BL; Wed, 20 Jan 2021 15:57:41 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2FrZ-0005Wr-1x; Wed, 20 Jan 2021 15:57:41 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XZWTcwF1MW6hitXhKiBZWwJO3P+7zykwqu5wEFuCE3E=; b=haczph0L4snGS0Q2fDZozCiArC
	TVMHN2g2ECG4ogu2UIxu4VCUf7mUvEVy09B8GctvUx4eud/8WneRMUPOqnYDBBRFr2aK56KaTmgjr
	apoWSDfcQXDJmB6dM4Y6q4q1Bijg66LqardBrlmgIr8dPhLPDOBIvU/YTHsY7AxGFEk8=;
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
 <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
 <06704224-bb57-c55e-a2ee-23032095e8ea@xen.org>
 <e2dcc876-291f-1244-933c-179f97a84e07@gmail.com>
 <b79b07eb-02db-16bb-2d8b-a55b0c355dbb@xen.org>
 <a7b26b16-cdec-3734-284e-a907e3cc356c@gmail.com>
 <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9c12c1a7-81e3-20e9-7419-a625f23e4c27@xen.org>
Date: Wed, 20 Jan 2021 15:57:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101191626560.14528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 20/01/2021 00:50, Stefano Stabellini wrote:
> On Tue, 19 Jan 2021, Oleksandr wrote:
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index 40b9e59..0508bd8 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -101,12 +101,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>
>>   bool arch_ioreq_complete_mmio(void)
>>   {
>> -    struct vcpu *v = current;
>>       struct cpu_user_regs *regs = guest_cpu_user_regs();
>>       const union hsr hsr = { .bits = regs->hsr };
>> -    paddr_t addr = v->io.req.addr;
>>
>> -    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>> +    if ( handle_ioserv(regs, current) == IO_HANDLED )
>>       {
>>           advance_pc(regs, hsr);
>>           return true;
> 
> Yes, but I think we want to keep the check
> 
>      vio->req.state == STATE_IORESP_READY
> 
> So maybe (uncompiled, untested):
> 
>      if ( v->io.req.state != STATE_IORESP_READY )
>          return false;

Is it possible to reach this function with v->io.req.state != 
STATE_IORESP_READY? If not, then I would suggest to add an 
ASSERT_UNREACHABLE() before the return.

Cheers,

-- 
Julien Grall

