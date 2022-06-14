Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63E54AF00
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 13:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348789.574972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14N6-0005PD-DC; Tue, 14 Jun 2022 11:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348789.574972; Tue, 14 Jun 2022 11:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o14N6-0005Mr-9e; Tue, 14 Jun 2022 11:06:08 +0000
Received: by outflank-mailman (input) for mailman id 348789;
 Tue, 14 Jun 2022 11:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5YSJ=WV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o14N4-0005Mj-Lm
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 11:06:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f22fd588-ebd1-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 13:05:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1AFA1424;
 Tue, 14 Jun 2022 04:05:57 -0700 (PDT)
Received: from [10.57.11.30] (unknown [10.57.11.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7417F3F73B;
 Tue, 14 Jun 2022 04:05:56 -0700 (PDT)
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
X-Inumbo-ID: f22fd588-ebd1-11ec-8901-93a377f238d6
Message-ID: <998ad0b5-1835-025c-9329-e80695247033@arm.com>
Date: Tue, 14 Jun 2022 13:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220614094157.95631-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220614094157.95631-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 14.06.2022 11:41, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
> xmalloc()" extended the checks in _xmalloc() to catch any use of the
> helpers from context with interrupts disabled.
> 
> Unfortunately, the rule is not followed when initializing the per-CPU
> IRQs:
> 
> (XEN) Xen call trace:
> (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
> (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
> (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
> (XEN)    [<00288fa4>] start_secondary+0x194/0x274
> (XEN)    [<40010170>] 40010170
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:601
> (XEN) ****************************************
> 
> This is happening because zalloc_cpumask_var() may allocate memory
> if NR_CPUS is > 2 * sizeof(unsigned long).
> 
> Avoid the problem by allocate the per-CPU IRQs while preparing the
> CPU.
Shouldn't this be" by initializing the per-CPU IRQs while ..." ?
Either way this text is the same like in the previous patch so I think this is not correct.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@arm.com>


