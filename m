Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325460E5B0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 18:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430695.682645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjWm-0003QC-N0; Wed, 26 Oct 2022 16:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430695.682645; Wed, 26 Oct 2022 16:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjWm-0003Nn-JF; Wed, 26 Oct 2022 16:45:16 +0000
Received: by outflank-mailman (input) for mailman id 430695;
 Wed, 26 Oct 2022 16:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onjWl-0003Nh-JP
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 16:45:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onjWl-0007T2-7C; Wed, 26 Oct 2022 16:45:15 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.28.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onjWk-0005vD-V0; Wed, 26 Oct 2022 16:45:15 +0000
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
	bh=dJ0eD5jsTTfJ1q74TTD/br42jRPM/NBqKlxP3ND2HO4=; b=q5tk90gGwoCfeASABgCRyXPqFI
	2J0PB1S6lmU6BtOH6j7EWI3ijiQMS19H+up+IcdhmlN4gTJXzqJjkUS3itm0B6XPIQKMbdBcX1exa
	pLcqqHO7W2KWOzLNsnPUbnTVMeQo2m0qsnibbsf2Wu0TpplKgze1iQ+GrSW30tsfrVO0=;
Message-ID: <bb8709ff-9b1a-91f4-3a73-c5f216b6b44e@xen.org>
Date: Wed, 26 Oct 2022 17:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v3] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221026133540.52191-1-ayankuma@amd.com>
 <95d0a8ca-9ff0-162a-02ae-8cbdc30af8b9@xen.org>
 <2accac91-d822-c493-4045-8657aed26fb1@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <2accac91-d822-c493-4045-8657aed26fb1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/10/2022 16:06, Ayan Kumar Halder wrote:
>>
>> ... you also need to ensure that the writers are atomically setting 
>> rdist_pendbase. Please correct if I am wrong, but the callers are not 
>> using write_atomic(). So how does that work?
> 
> I think read_atomic()/write_atomic() may not be the correct approach for 
> the following reasons :-
> 
> 1. __vgic_v3_rdistr_rd_mmio_read is a static function. So 'val' has a 
> global lifetime. Thus, all the following three lines need to be 
> protected from concurrent access.

I don't understand this argument. 'static' means the function is not 
exported. The local variables will still reside on the stack.

So why does the use of 'val' needs to be protected with the lock?

> 
>          val = read_atomic(&v->arch.vgic.rdist_pendbase);
>          val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> 
>          /* If a context switch happens here, then the 'val' below may 
> potentially be incorrect. */
> 
>          *r = vreg_reg64_extract(val, info);
> 
> 2. The same holds true for 'reg' as well in 
> __vgic_v3_rdistr_rd_mmio_write()
> 
>              reg = v->arch.vgic.rdist_pendbase;
>              blah, blah
>              v->arch.vgic.rdist_pendbase = reg;

Same here.

Cheers,

-- 
Julien Grall

