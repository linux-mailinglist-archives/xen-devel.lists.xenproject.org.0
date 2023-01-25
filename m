Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A167B837
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 18:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484496.751090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjMb-0002ff-SN; Wed, 25 Jan 2023 17:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484496.751090; Wed, 25 Jan 2023 17:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjMb-0002ct-PR; Wed, 25 Jan 2023 17:15:09 +0000
Received: by outflank-mailman (input) for mailman id 484496;
 Wed, 25 Jan 2023 17:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ToUz=5W=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pKjMa-0002cg-9H
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 17:15:08 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d04ab1f3-9cd3-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 18:15:07 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35168)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pKjMT-000KrU-Ux (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 25 Jan 2023 17:15:01 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 534AE1FBD8;
 Wed, 25 Jan 2023 17:15:01 +0000 (GMT)
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
X-Inumbo-ID: d04ab1f3-9cd3-11ed-91b6-6bf2151ebd3b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c12689b9-950c-94f5-e54b-490eea19b066@srcf.net>
Date: Wed, 25 Jan 2023 17:15:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
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
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v1 09/14] xen/riscv: introduce do_unexpected_trap()
In-Reply-To: <df6bd499b06c2e4997a3b647624aa2163e7f23d6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2023 5:01 pm, Oleksii wrote:
> On Mon, 2023-01-23 at 09:39 +1000, Alistair Francis wrote:
>> On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
>> <oleksii.kurochko@gmail.com> wrote:
>>> The patch introduces the function the purpose of which is to print
>>> a cause of an exception and call "wfi" instruction.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>  xen/arch/riscv/traps.c | 14 +++++++++++++-
>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
>>> index dd64f053a5..fc25138a4b 100644
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -95,7 +95,19 @@ const char *decode_cause(unsigned long cause)
>>>      return decode_trap_cause(cause);
>>>  }
>>>
>>> -void __handle_exception(struct cpu_user_regs *cpu_regs)
>>> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>>>  {
>>> +    unsigned long cause = csr_read(CSR_SCAUSE);
>>> +
>>> +    early_printk("Unhandled exception: ");
>>> +    early_printk(decode_cause(cause));
>>> +    early_printk("\n");
>>> +
>>> +    // kind of die...
>>>      wait_for_interrupt();
>> We could put this in a loop, to ensure we never progress
>>
> I think that right now there is no big difference how to stop
> because we have only 1 CPU, interrupts are disabled and we are in
> exception so it looks like anything can interrupt us.
> And in future it will be changed to panic() so we won't need here wfi()
> any more.

WFI is permitted to be implemented as a NOP by hardware.  Furthermore,
WFI with interrupts already disabled is a supported usecase, and will
resume execution without taking the interrupt that became pending.

You need an infinite loop of WFI's for execution to halt here.

~Andrew

