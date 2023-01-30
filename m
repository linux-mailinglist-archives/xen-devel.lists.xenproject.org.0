Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EC681E0D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 23:29:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487262.754850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcde-0008Sk-Ae; Mon, 30 Jan 2023 22:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487262.754850; Mon, 30 Jan 2023 22:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMcde-0008QV-7h; Mon, 30 Jan 2023 22:28:34 +0000
Received: by outflank-mailman (input) for mailman id 487262;
 Mon, 30 Jan 2023 22:28:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMcdc-0008QP-M1
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 22:28:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcdb-0006YX-Fa; Mon, 30 Jan 2023 22:28:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMcdb-0006RX-9V; Mon, 30 Jan 2023 22:28:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=EDF1QFuI4jxrtzBXSFtiSx9pKV3f0YCfWn7V8Syo8/s=; b=kEhBIhejaJFr7qxrljuUpxR7p8
	MxC5Lcq4rYbc4dmfLw0oDWsT2cbKBzLCS+Rh4rZx7JwNldERdgRRjjCu/b2iul9X2+kdLDlB2WC+W
	mcOr6dMUXfM7FERyqoZd1oJ8LK5HLqbfw8g+aPxcE6YKaZrlsryaAc0dMo7+5v6kPsQ4=;
Message-ID: <873d4754-0314-0022-96a9-e54ed78ac6ef@xen.org>
Date: Mon, 30 Jan 2023 22:28:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
In-Reply-To: <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 30/01/2023 11:35, Oleksii wrote:
> Hi Julien,
> On Fri, 2023-01-27 at 16:02 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 27/01/2023 13:59, Oleksii Kurochko wrote:
>>> The patch introduces macros: BUG(), WARN(), run_in_exception(),
>>> assert_failed.
>>>
>>> The implementation uses "ebreak" instruction in combination with
>>> diffrent bug frame tables (for each type) which contains useful
>>> information.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes:
>>>     - Remove __ in define namings
>>>     - Update run_in_exception_handler() with
>>>       register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);
>>>     - Remove bug_instr_t type and change it's usage to uint32_t
>>> ---
>>>    xen/arch/riscv/include/asm/bug.h | 118
>>> ++++++++++++++++++++++++++++
>>>    xen/arch/riscv/traps.c           | 128
>>> +++++++++++++++++++++++++++++++
>>>    xen/arch/riscv/xen.lds.S         |  10 +++
>>>    3 files changed, 256 insertions(+)
>>>    create mode 100644 xen/arch/riscv/include/asm/bug.h
>>>
>>> diff --git a/xen/arch/riscv/include/asm/bug.h
>>> b/xen/arch/riscv/include/asm/bug.h
>>> new file mode 100644
>>> index 0000000000..4b15d8eba6
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/bug.h
>>> @@ -0,0 +1,118 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2012 Regents of the University of California
>>> + * Copyright (C) 2021-2023 Vates
>>
>> I have to question the two copyrights here given that the majority of
>> the code seems to be taken from the arm implementation (see
>> arch/arm/include/asm/bug.h).
>>
>> With that said, we should consolidate the code rather than
>> duplicating
>> it on every architecture.
>>
> Copyrights should be removed. They were taken from the previous
> implementation of bug.h for RISC-V so I just forgot to remove them.
> 
> It looks like we should have common bug.h for ARM and RISCV but I am
> not sure that I know how to do that better.
> Probably the code wants to be moved to xen/include/bug.h and using
> ifdef ARM && RISCV ...

Or you could introduce CONFIG_BUG_GENERIC or else, so it is easily 
selectable by other architecture.

> But still I am not sure that this is the best one option as at least we
> have different implementation for x86_64.

My main concern is the maintainance effort. For every bug, we would need 
to fix it in two places. The risk is we may forget to fix one architecture.
This is not a very ideal situation.

So I think sharing the header between RISC-V and Arm (or x86, see below) 
is at least a must. We can do the 3rd architecture at a leisure pace.

One option would be to introduce asm-generic like Linux (IIRC this was a 
suggestion from Andrew). This would also to share code between two of 
the archs.

Also, from a brief look, the difference in implementation is mainly 
because on Arm we can't use %c (some version of GCC didn't support it). 
Is this also the case on RISC-V? If not, you may want to consider to use 
the x86 version.

Cheers,

-- 
Julien Grall

