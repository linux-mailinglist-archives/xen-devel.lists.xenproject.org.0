Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23367648871
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 19:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458155.716025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3i6L-0000HF-81; Fri, 09 Dec 2022 18:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458155.716025; Fri, 09 Dec 2022 18:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3i6L-0000E8-5C; Fri, 09 Dec 2022 18:28:01 +0000
Received: by outflank-mailman (input) for mailman id 458155;
 Fri, 09 Dec 2022 18:27:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3i6J-0000Dz-5P
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 18:27:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3i6I-00019S-M3; Fri, 09 Dec 2022 18:27:58 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.4.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3i6I-0000kr-Fa; Fri, 09 Dec 2022 18:27:58 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=yF880oS7ypKpqn0EC0zFB34FoE3VJQ6yn8AtT+jPh5A=; b=IkKjqaxoMh2egY9lyIUzdgPLPD
	y2jQCd4qjzl/cqN3bnyRfm+S/Ei7zMumEY3D3/M0WqyqPmj307F1kfqaiKjzjDEhOJUnodk0GZei0
	vsTmaawnysJ9qTAlDvurFhj5Q1IEmBmPIuuhhpiFJjEHR6TWNqbAjTszLzcpWif/kTco=;
Message-ID: <49ff51d6-3c29-14f9-5648-11957c6ce8d5@xen.org>
Date: Fri, 9 Dec 2022 18:27:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] xen/arm: Do not route NS phys timer IRQ to Xen
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221028124937.27677-1-michal.orzel@amd.com>
 <eedd5b2f-3d5c-aa85-5a86-98a8717568a1@xen.org>
In-Reply-To: <eedd5b2f-3d5c-aa85-5a86-98a8717568a1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 24/11/2022 18:57, Julien Grall wrote:
> On 28/10/2022 14:49, Michal Orzel wrote:
>> At the moment, we route NS phys timer IRQ to Xen even though it does not
>> make use of this timer. Xen uses hypervisor timer for itself and the
>> physical timer is fully emulated, hence there is nothing that can trigger
>> such IRQ. This means that requesting/releasing IRQ ends up as a deadcode
>> as it has no impact on the functional behavior, whereas the code within
>> a handler ends up being unreachable. This is a left over from the early
>> days when the CNTHP IRQ was buggy on the HW model used for testing and we
>> had to use the CNTP instead.
>>
>> Remove the calls to {request/release}_irq for this timer as well as the
>> code within the handler. Since timer_interrupt handler is now only used
>> by the CNTHP, refactor it as follows:
>>   - rename it to htimer_interrupt to reflect its purpose,
>>   - remove the IRQ affiliation test,
>>   - invert the condition to avoid indented code and use unlikely,
>>   - improve readability by adding new lines \btw code and comments.
>>
>> Keep the calls to zero the CNTP_CTL_EL0 register for sanity and also
>> remove the corresponding perf counter definition.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

-- 
Julien Grall

