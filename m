Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBD3D20EE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 11:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159671.293668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6V1f-0008L3-Rq; Thu, 22 Jul 2021 09:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159671.293668; Thu, 22 Jul 2021 09:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6V1f-0008Hs-O9; Thu, 22 Jul 2021 09:29:55 +0000
Received: by outflank-mailman (input) for mailman id 159671;
 Thu, 22 Jul 2021 09:29:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6V1e-0008Hm-GU
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 09:29:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6V1e-0004Vv-8L; Thu, 22 Jul 2021 09:29:54 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6V1e-0001s5-2I; Thu, 22 Jul 2021 09:29:54 +0000
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
	bh=Y7jtwbxZ9gJjsVPMEdrdb0eruTMaxHZh3db39p+R0Go=; b=FMZZfou5YcP3aMicQx7x3BSEyp
	EXHUAGo+cxCZw8BXz9NhocP2tdcnW25DUQJaaIZ/Pcvi70nbqj5y5pVPl6J+K2B5YDs2ogvaRF4Av
	s2pW1r+LQvxA4rd/UMpJVdjLk1k9qTB5y6fElP0Y7tNEOrVzsR1g5/ihCJjMRj3UcuFY=;
Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS
 in kernel config
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
 <PA4PR03MB7136452DF9961BC283718F4BE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <8ce6f5fe-ccb6-d463-a39e-50fd82816b86@xen.org>
 <PA4PR03MB7136D3B811F820FC8A5AFF95E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <7c3453ed-181f-a166-f16c-43a33bcc529c@xen.org>
Date: Thu, 22 Jul 2021 10:29:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107211850540.14204@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano and Oleksii,


On 22/07/2021 03:12, Stefano Stabellini wrote:
> On Wed, 21 Jul 2021, Oleksii Moisieiev wrote:
>> Please see my answers below.
>>
>> ___________________________________________________________________________________________________________________________________________
>> From: Julien Grall <julien@xen.org>
>> Sent: Wednesday, July 21, 2021 7:39 PM
>> To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
>> Cc: Andrii Anisov <Andrii_Anisov@epam.com>; Stefano Stabellini <sstabellini@kernel.org>
>> Subject: Re: [arm] Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS in kernel config
>>        On 21/07/2021 15:40, Oleksii Moisieiev wrote:
>>        > Hello Julien,
>>
>>        Hello,
>>
>>        >>>
>>        >>> My setup:
>>        >>> Board: H3ULCB Kinfisher board
>>        >>> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15)
>>        >>>https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>>        ri3haIaks6cbo7Ri$
>>        ><https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8
>>        Qri3haIaks6cbo7Ri$>[github[.]com]
>>        >
>>        >>><https://urldefense.com/v3/__https://github.com/xen-project/xen.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8
>>        Qri3haIaks6cbo7Ri$
>>        > [github[.]com]>;
>>        >>> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5.10-rc4)
>>        >
>>        >>Hmmm... 5.10 was released a few months ago and there are probably a few
>>        >>stable release for the version. Can you try the latest 5.10 stable?
>>        >
>>        > Switched to tag v5.10 rev: 2c85ebc57b3e of
>>        >https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!hJARiSsCASVNpAQxrnN-7sFsVHHTS39sjRraLqBkD6AoaCbplgoyi
>>        v-iCGlHhXafbPNc$ [github[.]com]
>>        > and got the same problem, that I see no output from kernel. All tests
>>        > were done with earlycon parameter set in the kernel cmdline.
>>        The tag v5.10 is the first official release. What I meant is using the
>>        stable branch from
>>        git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git (branch
>>        linux-5.10.y).
>>
>> I need some time to download and build mainline kernel. I'll test this scenario and send you results tomorrow.
> 
> I tried 5.10 with:
> 
> CONFIG_KPROBE_EVENTS=y
> CONFIG_UPROBE_EVENTS=y
> 
> and I could boot without issues on Xilinx ZynqMP.
> 
> 
> 
>>        >>>
>>        >>>https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Qr
>>        i3haIaks29w69MC$
>>        ><https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>>        ri3haIaks29w69MC$>[github[.]com]
>>        >
>>        >>><https://urldefense.com/v3/__https://github.com/torvalds/linux.git__;!!GF_29dbcQIUBPA!m4NHC2XbbSHWWZjQ7CX1ZZhaET6l0bQhZo581jtCmpst8E8JBp8Q
>>        ri3haIaks29w69MC$
>>        > [github[.]com]>;
>>        >>>
>>        >>> kernel config: see attached;
>>        >>>
>>        >>> dtb: see attached;
>>        >
>>        >>Please avoid large attachment as they will be duplicated on every
>>        >>mailbox. Instead, in the future, please upload them somewhere (your own
>>        >>webserve, pastebin...) and provide a link in the e-mail.
>>        >
>>        > I'm sorry for that.
>>        >
>>        >>>
>>        >>>
>>        >>> If kprobe/uprobe events are enabled - I see no output after xen switched
>>        >>> input to Dom0, if disabled - system boots up successfully.
>>        >>The console subsystem tends to be enabled quite late in the boot
>>        >>process. So this may mean a panic during early boot.
>>        >
>>        >>If you haven't done yet, I would suggest to add earlycon=xenboot on the
>>        >>dom0 command line. This will print some messages during early boot.
>>        >>ing.
>>        >
>>        > All tests were done with earlycon parameter set in the kernel command
>>        > line (xen, dom0-bootargs).
>>        >
>>        >>>
>>        >>> Both configs work fine when I boot without xen.
>>        >>>
>>        >>>
>>        >>> Dom0 information from Xen console shows that only one CPU works, and PC
>>        >>> stays in "__arch_counter_get_cntvct" function on read_sysreg call. //
>>        >>>
>>        >>> I did further investigation and found that kernel 5.4 doesn't have such
>>        >>> kind of issues.
>>        >>> After bisecting kernel,between 5.10 and 5.4, I found that output
>>        >>> disappeared on commit:
>>        >>>
>>        >>> 76085aff29f585139a37a10ea0a7daa63f70872c
>>        >
>>        >> From the information you provided so far, I am a bit confused how this
>>        >>could be the source of the problem. But given this is not the latest
>>        >>5.10, I will wait for you to confirm the bug is still present before
>>        >>providing more input.
>>        >
>>        > I was confused with this commit either. As I mentioned above, I've
>>        > checked with the latest stable 5.10 kernel and still got the same problem.
>>
>>        Thanks for the testing. I am not quite too sure where this may fail.
>>        Maybe Stefano has an idea?
> 
> Are you booting with bootefi? (I cannot see any issues with or without
> bootefi.)
> 
> In any case, the fact that you need to revert
> 76085aff29f585139a37a10ea0a7daa63f70872c to see the printk output is
> very odd. It might point to an alignment problem or another memory
> issue. It is possible that the weirdness you are seeing below (e.g. "we
> get some 18446744073709551615 while expecting 0") is due to a memory
> corruption.
> 
> Given that 76085aff29f585139a37a10ea0a7daa63f70872c is changing some
> section alignment from 4K to 64K, it increases the memory used to load
> the kernel. Is it possible that the size increase is causing you to go
> beyond the address range supposed to be used? E.g. U-Boot loading the
> kernel at invalid addresses.
> 
> Things like CONFIG_KPROBE_EVENTS=y and CONFIG_UPROBE_EVENTS=y are
> relevant because they increase the size of the kernel, possibly pushing
> it to an invalid memory range?

This is actually a good point. There are two other possible issues:
    1) The kernel and the hypervisor may overlaps each other.
    2) The size of the kernel is not correctly provided.

I remember hitting such issues in the past and they will lead to weird 
issues.

In fact looking at the device-tree provided in the first e-mail, I see:

                 module@0 {
                         compatible = "xen,linux-zimage", 
"xen,multiboot-module";
                         reg = <0x5 0x1000000 0x0 0x2000000>;
                 };

However from the pastebin, U-boot will report for the kernel:

Bytes transferred = 37124608 (2367a00 hex)

So, if I am not mistaken, the region in the DT is smaller than the 
kernel itself. The Image header doesn't provide the binary size, so Xen 
can't do any sanity check.

In this case, we would copy a truncated kernel. Can you change in the 
size in the DT and give another try?


If you haven't one yet, I would highly recommend to have script (either 
a U-boot one or outside) that will generate the correct DT for a given 
kernel, xen, initramfs. We have some example scripts on the wiki for 
either solution.

> 
> You can go and edit 76085aff29f585139a37a10ea0a7daa63f70872c to change
> from 4K to any multiple of 4K, e.g. 8K, 12K, 16K, 20K. They should all
> work the same.
> 
> Looking at the boot logs on pastebin I noticed that Xen is not loaded at
> a 2MB aligned address. I recommend you change Xen loading address to
> 0x500200000. And the kernel loading address to 0x500400000.

I am curious to know why you recommend to load at 2MB aligned address. 
The Image protocol doesn't require to load a 2MB aligned address. In 
fact, we add issue on Juno because the bootloader would load Xen at a 
4KB address. UEFI will also load at a 4KB align address.

Cheers,

-- 
Julien Grall

