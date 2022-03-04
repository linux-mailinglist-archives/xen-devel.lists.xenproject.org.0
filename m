Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105BA4CD26A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 11:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284159.483343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5CV-000772-9P; Fri, 04 Mar 2022 10:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284159.483343; Fri, 04 Mar 2022 10:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ5CV-00074h-4a; Fri, 04 Mar 2022 10:30:19 +0000
Received: by outflank-mailman (input) for mailman id 284159;
 Fri, 04 Mar 2022 10:30:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ5CT-00074a-A9
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 10:30:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5CS-0007nV-EY; Fri, 04 Mar 2022 10:30:16 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ5CS-0004mD-8K; Fri, 04 Mar 2022 10:30:16 +0000
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
	bh=s5pbt7yCNVZ8D5xfn+hADGatcEDZGevvEhD90McTKKA=; b=njlINeWFsS/rkWPDDoxA0nthmb
	WrzUzlqgdSbTFzH9s3SK/85yvGTZoZGfckDlIIGL6STmAFBkqYKDbVJKkp2ShBzG6RuxTrPLnvRbK
	y5eOnGXnk6tYThGg4hCqqDehswv+DltZe7F/QM1oUoFPevglwC+7fTT1Oy9KnHcTMzbI=;
Message-ID: <e8c030cf-6909-b730-96f9-b98221c8d4c2@xen.org>
Date: Fri, 4 Mar 2022 10:30:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 2/4] xen/arm64: io: Support instructions (for which ISS
 is not valid) on emulated MMIO region using MMIO/ioreq handler
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: xen-devel@lists.xenproject.org, stefanos@xilinx.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, paul@xen.org, roger.pau@citrix.com,
 Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-3-ayankuma@xilinx.com>
 <alpine.DEB.2.22.394.2203031637200.3261@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203031637200.3261@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/03/2022 00:42, Stefano Stabellini wrote:
>>   void register_mmio_handler(struct domain *d,
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> index 308650b400..58cd320b5a 100644
>> --- a/xen/arch/arm/ioreq.c
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -47,6 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>                                struct vcpu *v, mmio_info_t *info)
>>   {
>>       struct vcpu_io *vio = &v->io;
>> +    struct dabt_instr instr = info->dabt_instr;
>>       ioreq_t p = {
>>           .type = IOREQ_TYPE_COPY,
>>           .addr = info->gpa,
>> @@ -76,10 +77,10 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>       if ( !s )
>>           return IO_UNHANDLED;
>>   
>> -    if ( !info->dabt.valid )
>> -        return IO_ABORT;
>> +    ASSERT(dabt.valid);
> 
> I cannot see where we set dabt.valid on successfully decoding the
> instruction. It looks like we don't? If we don't, then here the ASSERT
> would fail in case of postindexing instructions, right?

We don't currently set dabt.valid. There are other reasons to set it 
(see my reply to Ayan). So...

> 
> If we don't, then we should probably just get rid of this ASSERT: it is
> not worth setting dabt.valid just so that this ASSERT would succeed.

... I would keep the ASSERT.

Cheers,

-- 
Julien Grall

