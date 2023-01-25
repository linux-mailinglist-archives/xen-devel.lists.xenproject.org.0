Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DED67B81E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 18:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484491.751081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjJE-00023e-ET; Wed, 25 Jan 2023 17:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484491.751081; Wed, 25 Jan 2023 17:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjJE-00021x-AI; Wed, 25 Jan 2023 17:11:40 +0000
Received: by outflank-mailman (input) for mailman id 484491;
 Wed, 25 Jan 2023 17:11:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKjJC-00021r-JP
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 17:11:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKjJC-0008K4-30; Wed, 25 Jan 2023 17:11:38 +0000
Received: from [54.239.6.189] (helo=[192.168.17.90])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKjJB-0006cj-TG; Wed, 25 Jan 2023 17:11:38 +0000
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
	bh=uOoPMSx7VIOWCdUM1b2Y3crUYU9rHsv3ZujwPGSCjq0=; b=N6shWrfkTVAEyHbdRvAQW10JYG
	tiivFGYTEixPhwkL4mRR7yKOAArwlyEVaAfvCIA87I40pkDz+YubwoaorUizZ/6Pv1P1f5PWGP9w+
	DiaP4TnX0mMc7MNKmPymuVJEMjnoU/xu22EE2Ge1vmXqSbGkzjFSxC5AosxVeUW1w6iE=;
Message-ID: <a790bbf6-10aa-214a-b3ef-d6cd7e849384@xen.org>
Date: Wed, 25 Jan 2023 17:11:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>,
 Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <74ca10d9be1dfc3aed4b3b21a79eae88c9df26a4.1674226563.git.oleksii.kurochko@gmail.com>
 <CAKmqyKNtFGoXmF1SJWO+JBJQvPSyDYEfpaYn2YBMQ=BsCk6VPQ@mail.gmail.com>
 <df6bd499b06c2e4997a3b647624aa2163e7f23d6.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <df6bd499b06c2e4997a3b647624aa2163e7f23d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/01/2023 17:01, Oleksii wrote:
> On Mon, 2023-01-23 at 09:39 +1000, Alistair Francis wrote:
>> On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
>> <oleksii.kurochko@gmail.com> wrote:
>>>
>>> The patch introduces the function the purpose of which is to print
>>> a cause of an exception and call "wfi" instruction.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>   xen/arch/riscv/traps.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>>> index dd64f053a5..fc25138a4b 100644
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -95,7 +95,19 @@ const char *decode_cause(unsigned long cause)
>>>       return decode_trap_cause(cause);
>>>   }
>>>
>>> -void __handle_exception(struct cpu_user_regs *cpu_regs)
>>> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>>   {
>>> +    unsigned long cause = csr_read(CSR_SCAUSE);
>>> +
>>> +    early_printk("Unhandled exception: ");
>>> +    early_printk(decode_cause(cause));
>>> +    early_printk("\n");
>>> +
>>> +    // kind of die...
>>>       wait_for_interrupt();
>>
>> We could put this in a loop, to ensure we never progress
>>
> I think that right now there is no big difference how to stop
> because we have only 1 CPU, interrupts are disabled and we are in
> exception so it looks like anything can interrupt us.

 From my understanding of the specification, WFI is an hint. So it could 
be implemented as a NOP.

Therefore it would sound better to wrap in a loop. That said...

> And in future it will be changed to panic() so we won't need here wfi()
> any more.

... ideally using panic() right now would be the best.

Cheers,

-- 
Julien Grall

