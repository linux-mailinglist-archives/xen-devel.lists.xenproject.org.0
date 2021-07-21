Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A133D0F3C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 15:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159353.293120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Byy-0003Ks-JZ; Wed, 21 Jul 2021 13:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159353.293120; Wed, 21 Jul 2021 13:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Byy-0003Hz-G8; Wed, 21 Jul 2021 13:09:52 +0000
Received: by outflank-mailman (input) for mailman id 159353;
 Wed, 21 Jul 2021 13:09:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6Byx-0003Ht-2h
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 13:09:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6Byw-0002e3-Tb; Wed, 21 Jul 2021 13:09:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6Byw-0003th-NQ; Wed, 21 Jul 2021 13:09:50 +0000
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
	bh=rNEIm3sgxU+WDbSwF6wJUQCgBvsOAV3APpA1UNHzY+8=; b=B2RXD6toiNmkNzhW5glVwNTAYL
	I7gO1szaOxo45egtzmcZF4poJVVFwgvrEIP7JXFsaCx+c2ihn5dT2HJa4P60XkT2OQPfh+sd5AXs6
	hdG+Il/nG3Fp1Q78zTmlf4dbnja/u1OQKtPxM0GLAV7+2rpuKXSxf889cESQwP6TuMjU=;
Subject: Re: Dom0 hangs after enable KROBE_EVENTS and/or UPROBE_EVENTS in
 kernel config
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrii Anisov <Andrii_Anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <PA4PR03MB7136DEB7183936907DFE145AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB713685E6A8004ED13814B05AE3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
 <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a02d4291-e48e-28cc-52da-6b9c998b2d0a@xen.org>
Date: Wed, 21 Jul 2021 14:09:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <PA4PR03MB71367B7662A1D3E4E234F6C0E3E39@PA4PR03MB7136.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

(+ Stefano)

On 21/07/2021 12:44, Oleksii Moisieiev wrote:
> Hello,

Hi,

Thanks for the report.

I nearly miss this e-mail because the title doesn't suggest this is an 
Arm and I wasn't CCed. In future, would you be able to CC the Arm 
maintainers (you can find them in MAINTAINERS) and mention arm in the title?

> I've got a problem that Dom0 hangs without any output from kernel once I 
> enable CONFIG_KPROBE_EVENTS and/or CONFIG_UPROBE_EVENTS in dom0 kernel.
> Everything works fine when kprobe/uprobe events are disabled.

By disabled, do you mean compile out?

> 
> My setup:
> Board: H3ULCB Kinfisher board
> Xen: revision dba774896f7dd74773c14d537643b7d7477fefcd (stable-4.15) 
> https://github.com/xen-project/xen.git 
> <https://github.com/xen-project/xen.git>;
> Kernel: revision 09162bc32c880a791c6c0668ce0745cf7958f576 (v5.10-rc4)

Hmmm... 5.10 was released a few months ago and there are probably a few 
stable release for the version. Can you try the latest 5.10 stable?

> 
> https://github.com/torvalds/linux.git 
> <https://github.com/torvalds/linux.git>;
> 
> kernel config: see attached;
> 
> dtb: see attached;

Please avoid large attachment as they will be duplicated on every 
mailbox. Instead, in the future, please upload them somewhere (your own 
webserve, pastebin...) and provide a link in the e-mail.
> 
> 
> If kprobe/uprobe events are enabled - I see no output after xen switched 
> input to Dom0, if disabled - system boots up successfully.
The console subsystem tends to be enabled quite late in the boot 
process. So this may mean a panic during early boot.

If you haven't done yet, I would suggest to add earlycon=xenboot on the 
dom0 command line. This will print some messages during early boot.
ing.

> 
> Both configs work fine when I boot without xen.
> 
> 
> Dom0 information from Xen console shows that only one CPU works, and PC 
> stays in "__arch_counter_get_cntvct" function on read_sysreg call. //
> 
> I did further investigation and found that kernel 5.4 doesn't have such 
> kind of issues.
> After bisecting kernel,between 5.10 and 5.4, I found that output 
> disappeared on commit:
> 
> 76085aff29f585139a37a10ea0a7daa63f70872c

 From the information you provided so far, I am a bit confused how this 
could be the source of the problem. But given this is not the latest 
5.10, I will wait for you to confirm the bug is still present before 
providing more input.

> 
> 
> Another issue, which was revealed after I got kernel output was kernel 
> oops with message that CPU is in inconsistent state.
> 
> [0.415612] EFI services will not be available.
> 
> [0.420267] smp: Bringing up secondary CPUs ...
> 
> [0.425185] Detected PIPT I-cache on CPU1
> 
> [0.425267] Xen: initializing cpu1
> 
> [0.425292] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
> 
> [0.425815] Detected PIPT I-cache on CPU2
> 
> [0.425879] Xen: initializing cpu2
> 
> [0.425899] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
> 
> [0.426362] Detected PIPT I-cache on CPU3
> 
> [0.426425] Xen: initializing cpu3
> 
> [0.426444] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
> 
> [0.426537] smp: Brought up 1 node, 4 CPUs
> 
> [0.472807] SMP: Total of 4 processors activated.
> 
> [0.477551] CPU features: detected: 32-bit EL0 Support
> 
> [0.482745] CPU features: detected: CRC32 instructions
> 
> [0.499470] ------------[ cut here ]------------
> 
> [0.504034] CPU: CPUs started in inconsistent modes

Looking at Linux 5.7 code, this is printed when not all the CPUs are 
booted in the same mode (i.e. EL1 or EL2).

This is quite odd. So let me ask a question first, did you see this 
error during the bisection or on the latest 5.7?

Cheers,

-- 
Julien Grall

