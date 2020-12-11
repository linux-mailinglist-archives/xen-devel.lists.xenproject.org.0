Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059602D7431
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 11:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50384.89027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfzd-0001E5-GQ; Fri, 11 Dec 2020 10:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50384.89027; Fri, 11 Dec 2020 10:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfzd-0001De-Bi; Fri, 11 Dec 2020 10:49:45 +0000
Received: by outflank-mailman (input) for mailman id 50384;
 Fri, 11 Dec 2020 10:49:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knfzb-0001DZ-26
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:49:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knfza-0002sk-69; Fri, 11 Dec 2020 10:49:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knfzZ-0007xN-N2; Fri, 11 Dec 2020 10:49:42 +0000
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
	bh=kUtO6OUIZS+BF3kaegfDuyN/BVTedtpv0m//7v4jA3s=; b=gFguw8J3IuHCrGphGyv9BWyyC8
	R4ZhdNhuYMpmLXXgMyhILmnJpz9z87Egn6h0VFpN0r7UUoa/Oid0mENFK2rqn9TfmQ3++VqSNDgvg
	y2XJ6fEMTTGadR61HcjpXlTFHD8Y6B1VJ7sGksj6AMrzeCTThscR11WPxSpbn1b3598Y=;
Subject: Re: [PATCH v3] xen: add support for automatic debug key actions in
 case of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201126080340.6154-1-jgross@suse.com>
 <22190c77-eb35-5b72-7d72-34800c3f052f@suse.com>
 <98c45abd-8796-088c-e2a6-9ad494beeb9e@xen.org>
 <59f126a3-f716-345b-b464-746e6156c15a@suse.com>
 <1e305cf6-aa14-54cc-a77d-88bb38ba4c6e@xen.org>
 <7271b2f4-816a-5541-5402-50ea29218d81@suse.com>
 <077f3e02-0e07-1549-cc41-62b42177e19c@suse.com>
 <699e48ea-8807-a1f3-d2b9-dc918913ede8@xen.org>
 <18959d53-30d9-b702-81df-8a4051d61fb2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ece0eb78-4e5f-2c2d-598d-aaf126fbcd23@xen.org>
Date: Fri, 11 Dec 2020 10:49:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <18959d53-30d9-b702-81df-8a4051d61fb2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 11/12/2020 10:38, Jürgen Groß wrote:
> On 11.12.20 11:22, Julien Grall wrote:
>> Hi,
>>
>> On 11/12/2020 07:24, Jan Beulich wrote:
>>> On 11.12.2020 08:02, Jürgen Groß wrote:
>>>> On 10.12.20 21:51, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 09/12/2020 14:29, Jan Beulich wrote:
>>>>>> On 09.12.2020 13:11, Julien Grall wrote:
>>>>>>> On 26/11/2020 11:20, Jan Beulich wrote:
>>>>>>>> On 26.11.2020 09:03, Juergen Gross wrote:
>>>>>>>>> When the host crashes it would sometimes be nice to have 
>>>>>>>>> additional
>>>>>>>>> debug data available which could be produced via debug keys, but
>>>>>>>>> halting the server for manual intervention might be impossible 
>>>>>>>>> due to
>>>>>>>>> the need to reboot/kexec rather sooner than later.
>>>>>>>>>
>>>>>>>>> Add support for automatic debug key actions in case of crashes 
>>>>>>>>> which
>>>>>>>>> can be activated via boot- or runtime-parameter.
>>>>>>>>>
>>>>>>>>> Depending on the type of crash the desired data might be 
>>>>>>>>> different, so
>>>>>>>>> support different settings for the possible types of crashes.
>>>>>>>>>
>>>>>>>>> The parameter is "crash-debug" with the following syntax:
>>>>>>>>>
>>>>>>>>>      crash-debug-<type>=<string>
>>>>>>>>>
>>>>>>>>> with <type> being one of:
>>>>>>>>>
>>>>>>>>>      panic, hwdom, watchdog, kexeccmd, debugkey
>>>>>>>>>
>>>>>>>>> and <string> a sequence of debug key characters with '+' having 
>>>>>>>>> the
>>>>>>>>> special semantics of a 10 millisecond pause.
>>>>>>>>>
>>>>>>>>> So "crash-debug-watchdog=0+0qr" would result in special output 
>>>>>>>>> in case
>>>>>>>>> of watchdog triggered crash (dom0 state, 10 ms pause, dom0 state,
>>>>>>>>> domain info, run queues).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>>> ---
>>>>>>>>> V2:
>>>>>>>>> - switched special character '.' to '+' (Jan Beulich)
>>>>>>>>> - 10 ms instead of 1 s pause (Jan Beulich)
>>>>>>>>> - added more text to the boot parameter description (Jan Beulich)
>>>>>>>>>
>>>>>>>>> V3:
>>>>>>>>> - added const (Jan Beulich)
>>>>>>>>> - thorough test of crash reason parameter (Jan Beulich)
>>>>>>>>> - kexeccmd case should depend on CONFIG_KEXEC (Jan Beulich)
>>>>>>>>> - added dummy get_irq_regs() helper on Arm
>>>>>>>>>
>>>>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>>>>
>>>>>>>> Except for the Arm aspect, where I'm not sure using
>>>>>>>> guest_cpu_user_regs() is correct in all cases,
>>>>>>>
>>>>>>> I am not entirely sure to understand what get_irq_regs() is 
>>>>>>> supposed to
>>>>>>> returned on x86. Is it the registers saved from the most recent
>>>>>>> exception?
>>>>>>
>>>>>> An interrupt (not an exception) sets the underlying per-CPU
>>>>>> variable, such that interested parties will know the real
>>>>>> context is not guest or "normal" Xen code, but an IRQ.
>>>>>
>>>>> Thanks for the explanation. I am a bit confused to why we need to 
>>>>> give a
>>>>> regs to handle_keypress() because no-one seems to use it. Do you 
>>>>> have an
>>>>> explanation?
>>>>
>>>> dump_registers() (key 'd') is using it.
>>>>
>>>>>
>>>>> To add to the confusion, it looks like that get_irqs_regs() may return
>>>>> NULL. So sometimes we may pass guest_cpu_regs() (which may contain
>>>>> garbagge or a set too far).
>>>>
>>>> I guess this is a best effort approach.
>>>
>>> Indeed. If there are ways to make it "more best", we should of
>>> course follow them. (Except before Dom0 starts, I'm afraid I
>>> don't see though where garbage would come from. And even then,
>>> just like for the idle vCPU-s, it shouldn't really be garbage,
>>> or else this suggests missing initialization somewhere.)
>>
>> So I decided to mimick what 'd' does to see what happen if this is 
>> called early boot.
>>
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 7fcff9af2a7e..9d33507a26eb 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -857,6 +857,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>>        */
>>       system_state = SYS_STATE_boot;
>>
>> +    dump_execstate(guest_cpu_user_regs());
>> +
>>       vm_init();
>>
>>       if ( acpi_disabled )
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 30d6f375a3af..50fcf2e8d70e 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1678,6 +1678,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>           end_boot_allocator();
>>
>>       system_state = SYS_STATE_boot;
>> +    dump_execstate(guest_cpu_user_regs());
>>       /*
>>        * No calls involving ACPI code should go between the setting of
>>        * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
>>
>> It leads to crash on both Arm and x86.
>>
>> For the Arm crash:
>>
>> (XEN) Data Abort Trap. Syndrome=0x1c08006
>> (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR 0x0000000065a7f000
>> (XEN) 0TH[0x0] = 0x0000000065a7ef7f
>> (XEN) 1ST[0x0] = 0x0000000065a7bf7f
>> (XEN) 2ND[0x0] = 0x0000000000000000
>> (XEN) CPU0: Unexpected Trap: Data Abort
>> (XEN) ----[ Xen-4.15-unstable  arm64  debug=y   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) PC:     0000000000219674 dump_execstate+0x58/0x1ec
>> (XEN) LR:     00000000002d77dc
>> (XEN) SP:     000000000030fdc0
>> (XEN) CPSR:   800003c9 MODE:64-bit EL2h (Hypervisor, handler)
>> (XEN)      X0: 0000000000000000  X1: 0000000000000000  X2: 
>> 0000000000007fff
>> (XEN)      X3: 00000000002b7198  X4: 0000000000000080  X5: 
>> 00000000002e9a68
>> (XEN)      X6: 0080808080808080  X7: fefefefefefeff09  X8: 
>> 7f7f7f7f7f7f7f7f
>> (XEN)      X9: 717164616f726051 X10: 7f7f7f7f7f7f7f7f X11: 
>> 0101010101010101
>> (XEN)     X12: 0000000000000008 X13: 00000000002b9a48 X14: 
>> 0000000000000000
>> (XEN)     X15: 0000000000400000 X16: 00000000002ba000 X17: 
>> 00000000002b9000
>> (XEN)     X18: 00000000002b9000 X19: 0000000000000000 X20: 
>> 000000000030feb0
>> (XEN)     X21: 0000000080000000 X22: 00000000002f0d30 X23: 
>> 00000000002f1d68
>> (XEN)     X24: 00000000002f0eb8 X25: 0000000040000000 X26: 
>> 0000000080000000
>> (XEN)     X27: 0000000000000018 X28: 000000000003f970  FP: 
>> 000000000030fdc0
>> (XEN)
>> (XEN)   VTCR_EL2: 00000000
>> (XEN)  VTTBR_EL2: 0000000000000000
>> (XEN)
>> (XEN)  SCTLR_EL2: 30cd183d
>> (XEN)    HCR_EL2: 0000000000000038
>> (XEN)  TTBR0_EL2: 0000000065a7f000
>> (XEN)
>> (XEN)    ESR_EL2: 97c08006
>> (XEN)  HPFAR_EL2: 0000000000000000
>> (XEN)    FAR_EL2: 0000000000000010
>> (XEN)
>> (XEN) Xen stack trace from sp=000000000030fdc0:
>> (XEN)    000000000030fdf0 00000000002d77dc 0000000000080000 
>> 000000007fffc000
>> (XEN)    0000000080000000 00000000002f0d30 000000007f68b250 
>> 00000000002001b8
>> (XEN)    0000000065932000 0000000065732000 00000000784f9000 
>> 0000000000000000
>> (XEN)    0000000000400000 0000000065a2ad30 0000000000000630 
>> 0000000000000001
>> (XEN)    0000000000000001 0000000000000001 0000000000000000 
>> 0000000000003000
>> (XEN)    00000000784f9000 00000000002bc8e4 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000300000000 0000000000000000 
>> 00000040ffffffff
>> (XEN)    00000000ffffffff 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN) Xen call trace:
>> (XEN)    [<0000000000219674>] dump_execstate+0x58/0x1ec (PC)
>> (XEN)    [<00000000002d77dc>] start_xen+0x3d0/0xcf8 (LR)
>> (XEN)    [<00000000002d77dc>] start_xen+0x3d0/0xcf8
>> (XEN)    [<00000000002001b8>] arm64/head.o#primary_switched+0x10/0x30
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) CPU0: Unexpected Trap: Data Abort
>> (XEN) ****************************************
>>
>> For the x86 crash:
>>
>> (XEN) Early fatal page fault at e008:ffff82d0402188b4 
>> (cr2=0000000000000010, ec=0000)
>> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=y   Tainted:   C   ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d0402188b4>] dump_execstate+0x42/0x167
>> (XEN) RFLAGS: 0000000000010086   CONTEXT: hypervisor
>> (XEN) rax: 0000000000000000   rbx: 0000000000000000   rcx: 
>> 0000000000000000
>> (XEN) rdx: ffff82d0404affff   rsi: 000000000000000a   rdi: 
>> ffff82d0404afef8
>> (XEN) rbp: ffff82d0404afd90   rsp: ffff82d0404afd80   r8:  
>> 0000000000000004
>> (XEN) r9:  0101010101010101   r10: 0f0f0f0f0f0f0f0f   r11: 
>> 5555555555555555
>> (XEN) r12: ffff82d0404afef8   r13: 0000000000800163   r14: 
>> ffff83000009dfb0
>> (XEN) r15: 0000000000000002   cr0: 0000000080050033   cr4: 
>> 00000000000000a0
>> (XEN) cr3: 00000000bfa9e000   cr2: 0000000000000010
>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 
>> 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>> (XEN) Xen code around <ffff82d0402188b4> (dump_execstate+0x42/0x167):
>> (XEN)  ff 7f 00 00 48 8b 40 c9 <48> 8b 40 10 66 81 38 ff 7f 75 49 3b 
>> 1d 23 18 27
>> (XEN) Xen stack trace from rsp=ffff82d0404afd80:
>> (XEN)    000000000023ffff 00000000000005ed ffff82d0404afee8 
>> ffff82d0404378cb
>> (XEN)    0000000000000002 0000000000000002 0000000000000002 
>> 0000000000000001
>> (XEN)    0000000000000001 0000000000000001 0000000000000001 
>> 0000000000000000
>> (XEN)    00000000000001ff 0000000002a45fff 0000000000240000 
>> 0000000002a45000
>> (XEN)    0000000000100000 0000000000000000 00000000000001ff 
>> ffff82d040475c80
>> (XEN)    ffff82d000800163 ffff83000009dee0 ffff83000009dfb0 
>> 0000000000200001
>> (XEN)    0000000100000000 0000000100000000 ffff83000009df80 
>> 642ded38bf9fe4f3
>> (XEN)    bf9fed3500000000 bfaafe980009df73 0009df73bf9fe7ea 
>> 00000004bf9fed31
>> (XEN)    bfaafeb00009df01 0000000800000000 000000010000006e 
>> 0000000000000003
>> (XEN)    00000000000002f8 ffff82d0405b0000 ffff82d0404b0000 
>> 0000000000000002
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 ffff82d04020012f 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000e01000000000 0000000000000000 0000000000000000 
>> 00000000000000a0
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d0402188b4>] R dump_execstate+0x42/0x167
>> (XEN)    [<ffff82d0404378cb>] F __start_xen+0x1e10/0x2906
>> (XEN)    [<ffff82d04020012f>] F __high_start+0x8f/0x91
>> (XEN)
>> (XEN) Pagetable walk from 0000000000000010:
>> (XEN)  L4[0x000] = 00000000bfa54063 ffffffffffffffff
>> (XEN)  L3[0x000] = 00000000bfa50063 ffffffffffffffff
>> (XEN)  L2[0x000] = 00000000bfa4f063 ffffffffffffffff
>> (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) FATAL TRAP: vec 14, #PF[0000] IN INTERRUPT CONTEXT
>> (XEN) ****************************************
>> (XEN)
>> (XEN) Reboot in five seconds...
>>
>> So I think guest_cpu_user_regs() is not quite yet ready to be called 
>> from panic().
> 
> guest_cpu_user_regs() isn't the problem, but dump_execstate().
> 
> This is one of the caveats from the added boot parameter doc: some debug
> keys might lead to problems. 'd' seems to be such a key when used for
> the panic() case and the panic() happens in early boot.

Right, I think we should be clearer in the documentation about the keys 
we know works.

> 
>>
>> A different approach my be to generate an exception and call the 
>> keyhandler from there. At least you know that the register would 
>> always be accurate.
> 
> Or dump_execstate() is modified to accept NULL for regs and it will do
> nothing in case guest_cpu_user_regs() isn't valid (a test for idle vcpu
> might be the easiest way to determine that).

So Jan pointed out that current may not be initialized properly in early 
boot. So we possibly want to use "system_state" instead.

Cheers,

-- 
Julien Grall

