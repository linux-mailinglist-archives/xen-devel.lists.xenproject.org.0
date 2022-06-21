Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08855531A5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 14:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353211.580127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3cfK-0006Pi-AW; Tue, 21 Jun 2022 12:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353211.580127; Tue, 21 Jun 2022 12:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3cfK-0006Mw-6Z; Tue, 21 Jun 2022 12:07:30 +0000
Received: by outflank-mailman (input) for mailman id 353211;
 Tue, 21 Jun 2022 12:07:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3cfI-0006Mq-83
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 12:07:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3cfH-0003fb-IE; Tue, 21 Jun 2022 12:07:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.3.84])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3cfH-0006jO-BE; Tue, 21 Jun 2022 12:07:27 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=jKcHp4lsTX841vtWizLuHWuO/Yak1LeyMQO4I+k8GdY=; b=yB1Tc9HKqLxDkmLho+bwsKXpt6
	Q6Ajg+jK1S1IHFyulURd7PqCOZlF+hioby2mYxK2WaEGQocXuK/XBUxNOAuLhnwt4dfLuBhsyCpw3
	dsD/E8gL3A43+s+2lrKdxRDRzPW1BV78Ki/rVwhtGX48ALC/sXF6LkL2nAowDDdQInbk=;
Message-ID: <b8f05e22-c30d-d4b2-b725-9db91ee7a09d@xen.org>
Date: Tue, 21 Jun 2022 13:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: XTF-on-ARM: Bugs
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/06/2022 12:27, Andrew Cooper wrote:
> Hello,

Hi,

> I tried to have a half hour respite from security and push forward with XTF-on-ARM, but the result was a mess.
> 
> https://github.com/andyhhp/xtf/commit/bc86e2d271f2107da9b1c9bc55a050dbdf07c6c6 is the absolute bare minimum stub VM, which has a zImage{32,64} header, sets up the stack, makes one CONSOLEIO_write hypercall, and then a clean SCHEDOP_shutdown.
> 
> There are some bugs:
> 
> 1) kernel_zimage32_probe() rejects relocatable binaries, but if I skip the check it works fine.

Hmmmm... which check are you referring to?

> 
> Furthermore, kernel_zimage64_probe() ignores the header and assumes the binary is relocatable.

Are you referring to bit 3 "Kernel physical placement"?

> Both probe functions fail to check the endianness marker.

AFAIU the header is little endian. So it is not clear to me why we 
should check the endianess marker?

> 
> 2) I'm using qemu-system-arm 4.2.1 (Debian 1:4.2-3ubuntu6.21), with some parameters cribbed from the Gitlab CI smoke test, but ctxt_switch_to() exploded with undef on:
> 
> WRITE_CP32(n->arch.joscr, JOSCR);
> WRITE_CP32(n->arch.jmcr, JMCR);
> 
> I'm not sure what these are (beyond Jazelle conf register), but I commented them out and it made further progress.  I have no idea if this is a Xen bug, qemu bug, or user error, but something is clearly wrong here.

I suspect the QEMU version is a bit too old to support 32-bit 
virtualization. Can you try a newer one?

> 
> 3) For test-arm64-stub, I get this:
> 
> (XEN) d0: extended region 1: 0x70000000->0x80000000
> (XEN) Loading zImage from 0000000048000000 to 0000000050000000-0000000050001012
> (XEN) Loading d0 DTB to 0x0000000058000000-0x0000000058001c85
> ...
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 324kB init memory.
> (XEN) *** Got CONSOLEIO_write (18 bytes)
> Hello from ARM64
> (XEN) *** CONSOLEIO_write done
> (XEN) arch/arm/traps.c:2054:d0v0 HSR=0x000000939f0045 pc=0x00000050000098 gva=0x80002ffc gpa=0x00000080002ffc

Looking at the log above, GPA belong to neither the kernel, extended 
region or DTB.

> qemu-system-aarch64: terminating on signal 2
> 
> i.e. the CONSOLEIO_write hypercall completes successfully, but a trap occurs before the SCHEDOP_shutdown completes.  The full (tiny) binaries are attached, but it seems to be faulting on:
> 
>      40000098:    b81fcc3f     str    wzr, [x1, #-4]!
> 
> which (I think) is the store of 0 to the stack for the schedop shutdown reason.

AFAICT the stack is meant to be right next after the kernel. However, 
the fault above suggest that the value is not even close.

> 
> 4) For test-arm32-stub under either the 32bit or 64bit Xen, I get:
> 
> (XEN) Freed 348kB init memory.
> (XEN) *** Got CONSOLEIO_write (18 bytes)
> (XEN) *** got fault
> (XEN) *** Got SCHEDOP_shutdown, 0

Where are those messages coming from?

> (XEN) Hardware Dom0 halted: halting machine
> 
> which is weird.  The CONSOLEIO_write fails to read the passed pointer, despite appearing to have a ip-relative load to find the string, while the SCHEDOP_shutdown passes its parameter fine (it's a stack relative load).

 From a brief look, your code is still running with MMU off and Cache 
"off" (on armv8, it is more a bypass "cache" rather than off).

This means that you ought to be a lot more careful when reading/writing 
value to avoid reading any stall data.

> Other observations:
> 
> * There is no documented vCPU starting state.

See 
https://github.com/torvalds/linux/blob/master/Documentation/arm64/booting.rst.

> * Qemu is infinitely easier to to use (i.e. no messing with dtb/etc) as -kernel xen -initrd test-$foo with a oneliner change to the dtb parsing to treat ramdisk and no kernel as the dom0 kernel.  Maybe a better change would be to modify qemu to understand multiple -kernel's.
> * Xen can't load ELFs.

The support was dropped in 2018 because it was bogus and not used:

https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg00242.html

Personally, I think that zImage/Image is simple enough that 
re-introducing ELF is not worth it. But I would be OK to consider 
patches if you feel like writing them.

Cheers,

-- 
Julien Grall

