Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376647651E7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 13:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571028.893863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOylf-0004Ta-Jc; Thu, 27 Jul 2023 11:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571028.893863; Thu, 27 Jul 2023 11:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOylf-0004QG-Gh; Thu, 27 Jul 2023 11:02:51 +0000
Received: by outflank-mailman (input) for mailman id 571028;
 Thu, 27 Jul 2023 11:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dT6+=DN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOyle-0004QA-8h
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 11:02:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f34debb-2c6d-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 13:02:48 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.234.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 2BDF34EE073F;
 Thu, 27 Jul 2023 13:02:47 +0200 (CEST)
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
X-Inumbo-ID: 1f34debb-2c6d-11ee-8613-37d641c3527e
Message-ID: <31b72cda-2ef0-2f3c-4e83-948d7b763f19@bugseng.com>
Date: Thu, 27 Jul 2023 13:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C: 2012
 Rules 8.2 and 8.3
Content-Language: en-US, it
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690217195.git.federico.serafini@bugseng.com>
 <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
 <a81326f4-e018-b461-ebec-9ef2ff5dc4df@suse.com>
 <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2307251226180.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jan, Stefano,

On 25/07/23 21:32, Stefano Stabellini wrote:
> On Tue, 25 Jul 2023, Jan Beulich wrote:
>> On 24.07.2023 19:50, Federico Serafini wrote:
>>> @@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
>>>   }
>>>   
>>>   int request_irq(unsigned int irq, unsigned int irqflags,
>>> -                void (*handler)(int, void *, struct cpu_user_regs *),
>>> +                void (*handler)(int irq, void *dev_id,
>>> +                                struct cpu_user_regs *regs),
>>>                   const char *devname, void *dev_id)
>>>   {
>>
>> Before we accept patches, don't we need to first settle on whether to
>> apply the rule(s) also to function type declarations (and not just
>> ordinary prototypes)?
> 
> Yes, in retrospect we should have found agreement on this issue this
> morning but I forgot to bring it up :-(  Ooops.
> 
> (I think the agreement was to change the function type declarations too,
> that's why docs/misra/rules.rst doesn't have a note about this, but I
> don't want to make assumptions as I am not certain.)

I have ready a patch for violations of rules 8.2 and 8.3 in
xen/include/xen/iommu.h.
I am talking about this, in this IRQ thread, because I think the 
following two options also apply for an eventual v2 patch for the IRQ 
module, until a decision about rule 8.2 and function pointers is taken:

1) Split patches and submit only the changes *not* involving function
    pointers.
2) In the meantime that you make a decision,
    I submit patches thus addressing the existing violations.

I personally prefer the second one, but please let me know what you
think.

Regards
-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

