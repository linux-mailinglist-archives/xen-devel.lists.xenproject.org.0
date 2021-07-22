Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D33D1BB3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 04:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159589.293502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6OCq-0003cR-FK; Thu, 22 Jul 2021 02:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159589.293502; Thu, 22 Jul 2021 02:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6OCq-0003af-Az; Thu, 22 Jul 2021 02:13:00 +0000
Received: by outflank-mailman (input) for mailman id 159589;
 Thu, 22 Jul 2021 02:12:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6OCo-0003aZ-OA
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 02:12:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 545f72a6-ea92-11eb-8e26-12813bfff9fa;
 Thu, 22 Jul 2021 02:12:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 256F561279;
 Thu, 22 Jul 2021 02:12:56 +0000 (UTC)
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
X-Inumbo-ID: 545f72a6-ea92-11eb-8e26-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626919976;
	bh=F6gfvGv+ySp5ERII/hFeIhaU18h+cBpDd/Db+0kjQiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EtwaX7wsgyf4X0K+G1S52kRS2eD3IZt+ufvT/bCAcw6f8Eaf7nLSszuQHUJZ1RaGp
	 s6sQzP3NuKlg3O/6241XzBrIDUENTKVb1kHTWwRXleGI1vkKZu8ivlatIRsZ6TGEVN
	 65w7j8QcnNv3E1M+JdDIoU+Oy4P0r/L41hVDQADFnrN8dS7eS1dLjyOzGcVS+6G/oa
	 AsvN1x+cDYPQAxyjKw36sOXZWuh3yoq9JnEwJBshX70vFl/ciDpZdIpXJwNO//wLz/
	 f/hg+o5NMqy4bsOUQLySSqEncpFfxCtwCVgUpsObcO/NhlXDrvuDL8FceQdkJLHKs1
	 Lz9sPAkZrIXpw==
Date: Wed, 21 Jul 2021 19:12:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrii Anisov <Andrii_Anisov@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
In-Reply-To: <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com> <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org> <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>,<8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org> <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2045330416-1626919039=:14204"
Content-ID: <alpine.DEB.2.21.2107211858210.14204@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2045330416-1626919039=:14204
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2107211858211.14204@sstabellini-ThinkPad-T480s>

On Wed, 21 Jul 2021, Oleksii Moisieiev wrote:
> Please see my answers below.
> 
> ___________________________________________________________________________________________________________________________________________
> From: Julien Grall <julien@xen.org>
> Sent: Wednesday, July 21, 2021 7:39 PM
> To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> Cc: Andrii Anisov <Andrii_Anisov@epam.com>; Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS in kernel config  
>       On 21/07/2021 15:40, Oleksii Moisieiev wrote:
>       > Hello Julien,
> 
>       Hello,
> 
>       >>>
>       >>> My setup:
>       >>> Board: H3ULCB Kinfisher board
>       >>> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15)
>       >>>https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>       ri3haIaks6cbo7Ri$
>       ><https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8
>       Qri3haIaks6cbo7Ri$>[github[.]com]
>       >
>       >>><https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8
>       Qri3haIaks6cbo7Ri$
>       > [github[.]com]>;
>       >>> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5.10-rc4)
>       >
>       >>Hmmm... 5.10 was released a few months ago and there are probably a few
>       >>stable release for the version. Can you try the latest 5.10 stable?
>       >
>       > Switched to tag v5.10 rev: 2c85ebc57b3e of
>       >https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyi
>       v-iCGlHhXafbPNc$ [github[.]com]
>       > and got the same problem, that I see no output from kernel. All tests
>       > were done with earlycon parameter set in the kernel cmdline.
>       The tag v5.10 is the first official release. What I meant is using the
>       stable branch from
>       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git (branch
>       linux-5.10.y).
> 
> I need some time to download and build mainline kernel. I'll test this scenario and send you results tomorrow.

I tried 5.10 with:

CONFIG_KPROBE_EVENTS=y
CONFIG_UPROBE_EVENTS=y

and I could boot without issues on Xilinx ZynqMP.



>       >>>
>       >>>https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qr
>       i3haIaks29w69MC$
>       ><https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>       ri3haIaks29w69MC$>[github[.]com]
>       >
>       >>><https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>       ri3haIaks29w69MC$
>       > [github[.]com]>;
>       >>>
>       >>> kernel config: see attached;
>       >>>
>       >>> dtb: see attached;
>       >
>       >>Please avoid large attachment as they will be duplicated on every
>       >>mailbox. Instead, in the future, please upload them somewhere (your own
>       >>webserve, pastebin...) and provide a link in the e-mail.
>       >
>       > I'm sorry for that.
>       >
>       >>>
>       >>>
>       >>> If kprobe/uprobe events are enabled - I see no output after xen switched
>       >>> input to Dom0, if disabled - system boots up successfully.
>       >>The console subsystem tends to be enabled quite late in the boot
>       >>process. So this may mean a panic during early boot.
>       >
>       >>If you haven't done yet, I would suggest to add earlycon=xenboot on the
>       >>dom0 command line. This will print some messages during early boot.
>       >>ing.
>       >
>       > All tests were done with earlycon parameter set in the kernel command
>       > line (xen, dom0-bootargs).
>       >
>       >>>
>       >>> Both configs work fine when I boot without xen.
>       >>>
>       >>>
>       >>> Dom0 information from Xen console shows that only one CPU works, and PC
>       >>> stays in "__arch_counter_get_cntvct" function on read_sysreg call. //
>       >>>
>       >>> I did further investigation and found that kernel 5.4 doesn't have such
>       >>> kind of issues.
>       >>> After bisecting kernel,between 5.10 and 5.4, I found that output
>       >>> disappeared on commit:
>       >>>
>       >>> 76085aff29f585139a37a10ea0a7daa63f70872c
>       >
>       >> From the information you provided so far, I am a bit confused how this
>       >>could be the source of the problem. But given this is not the latest
>       >>5.10, I will wait for you to confirm the bug is still present before
>       >>providing more input.
>       >
>       > I was confused with this commit either. As I mentioned above, I've
>       > checked with the latest stable 5.10 kernel and still got the same problem.
> 
>       Thanks for the testing. I am not quite too sure where this may fail.
>       Maybe Stefano has an idea?

Are you booting with bootefi? (I cannot see any issues with or without
bootefi.)

In any case, the fact that you need to revert
76085aff29f585139a37a10ea0a7daa63f70872c to see the printk output is
very odd. It might point to an alignment problem or another memory
issue. It is possible that the weirdness you are seeing below (e.g. "we
get some 18446744073709551615 while expecting 0") is due to a memory
corruption.

Given that 76085aff29f585139a37a10ea0a7daa63f70872c is changing some
section alignment from 4K to 64K, it increases the memory used to load
the kernel. Is it possible that the size increase is causing you to go
beyond the address range supposed to be used? E.g. U-Boot loading the
kernel at invalid addresses.

Things like CONFIG_KPROBE_EVENTS=y and CONFIG_UPROBE_EVENTS=y are
relevant because they increase the size of the kernel, possibly pushing
it to an invalid memory range?

You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
work the same.

Looking at the boot logs on pastebin I noticed that Xen is not loaded at
a 2MB aligned address. I recommend you change Xen loading address to
0x500200000. And the kernel loading address to 0x500400000.



>       If you have an external debugger, can you use it to get a stack trace?
>       Otherwise, I would suggest to add some xen_raw_printk() in the code to
>       figure out where it may fail.
> 
> Unfortunately, I don't have an external debugger right now (my testing board is placed in the different country).
> Let me share with you the results of the investigation I've done, before asking help from community. I haven't shared it before because I
> wasn't sure it's related.
> 
>  I've met error with no printk on linux-bsp kernel taken from the latest renesas yocto
> release: https://elinux.org/R-Car/Boards/Yocto-Gen3/v5.1.0
> 
> My original kernel based on rev 301d2c636929be96f3d87b1b5d287f87ed67a7be of linux-bsp kernel.
> 
> I've added HYPERVISOR_console_io calls  to the code and got the following backtrace:
> https://pastebin.com/E3X74tyZ
> It's a little bit messy, but still readable. I've added extra prints to the dump_stack function to be able to see backtrace. In this case,
> looks like the problem is that system is unable to get free descriptor from printk_ringbuffer.
> In file kernel/printk/printk_ringbuffer.c, function desc_reserve, line:
> 
> prev_state_val = atomic_long_read(&desc->state_var); /* LMM(desc_reserve:E) */
> 
> we get some 18446744073709551615 while expecting 0.
> 
> But the problem seems to lay deeper because when I switched to the mainline kernel, it hangs on read_sysreg call in
> 
>  __arch_counter_get_cntvct function.
> 
> 
> Then I reverted commit 76085aff29f585139a37a10ea0a7daa63f70872c and this fixed problem with no printk output.
> Now, with the commit reverted, I see the kernel output with error CPU is in inconsistent state. Looks like
> commit 76085aff29f585139a37a10ea0a7daa63f70872c is the cause of no output issue.
>       >
>       >>>
>       >>>
>       >>> Another issue, which was revealed after I got kernel output was kernel
>       >>> oops with message that CPU is in inconsistent state.
>       >>>
>       >>> [0.415612] EFI services will not be available.
>       >>>
>       >>> [0.420267] smp: Bringing up secondary CPUs ...
>       >>>
>       >>> [0.425185] Detected PIPT I-cache on CPU1
>       >>>
>       >>> [0.425267] Xen: initializing cpu1
>       >>>
>       >>> [0.425292] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
>       >>>
>       >>> [0.425815] Detected PIPT I-cache on CPU2
>       >>>
>       >>> [0.425879] Xen: initializing cpu2
>       >>>
>       >>> [0.425899] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
>       >>>
>       >>> [0.426362] Detected PIPT I-cache on CPU3
>       >>>
>       >>> [0.426425] Xen: initializing cpu3
>       >>>
>       >>> [0.426444] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
>       >>>
>       >>> [0.426537] smp: Brought up 1 node, 4 CPUs
>       >>>
>       >>> [0.472807] SMP: Total of 4 processors activated.
>       >>>
>       >>> [0.477551] CPU features: detected: 32-bit EL0 Support
>       >>>
>       >>> [0.482745] CPU features: detected: CRC32 instructions
>       >>>
>       >>> [0.499470] ------------[ cut here ]------------
>       >>>
>       >>> [0.504034] CPU: CPUs started in inconsistent modes
>       >
>       >>Looking at Linux 5.7 code, this is printed when not all the CPUs are
>       >>booted in the same mode (i.e. EL1 or EL2).
>       >
>       >>This is quite odd. So let me ask a question first, did you see this
>       >>error during the bisection or on the latest 5.7?
>       >
>       > Switched to kernel v5.7 tag, rev:3d77e6a8804.
> 
>       Similar to 5.10, the lastest stable in the linux-stable repo
>       linux-5.7.y. If this still doesn't help...
> 
> I need some time to download and build mainline kernel. I'll test this scenario and send you results tomorrow.
>       > On 5.7 kernel I can see printk output, but getting CPUs started in
>       > inconsistent modes error.
>       > Also, I tried with hmp-unsafe=false ( in xen cmdline, so only 0-3 CPU
>       > were enabled. And still got the same issue.
>       ... can you print __boot_cpu_mode[0] and __boot_cpu_mode[1]?
> 
>       Cheers,
> 
>       --
>       Julien Grall
> 
> 
> 
--8323329-2045330416-1626919039=:14204--

