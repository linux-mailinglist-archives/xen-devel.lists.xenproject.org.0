Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919B5531C4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 14:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353221.580139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3cn1-0007rj-3f; Tue, 21 Jun 2022 12:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353221.580139; Tue, 21 Jun 2022 12:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3cn1-0007oH-07; Tue, 21 Jun 2022 12:15:27 +0000
Received: by outflank-mailman (input) for mailman id 353221;
 Tue, 21 Jun 2022 12:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L66N=W4=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3cmz-0007oB-AJ
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 12:15:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d331485f-f15b-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 14:15:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 891FC165C;
 Tue, 21 Jun 2022 05:15:22 -0700 (PDT)
Received: from [10.57.35.142] (unknown [10.57.35.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE25E3F534;
 Tue, 21 Jun 2022 05:15:19 -0700 (PDT)
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
X-Inumbo-ID: d331485f-f15b-11ec-b725-ed86ccbb4733
Message-ID: <c3232cf1-eec1-36a5-ab62-170a1a40a960@arm.com>
Date: Tue, 21 Jun 2022 14:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: XTF-on-ARM: Bugs
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <7f490d75-153d-7e1d-b3c0-5418ff7fdf8f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 21.06.2022 13:27, Andrew Cooper wrote:
> Hello,
> 
> I tried to have a half hour respite from security and push forward with XTF-on-ARM, but the result was a mess.
> 
> https://github.com/andyhhp/xtf/commit/bc86e2d271f2107da9b1c9bc55a050dbdf07c6c6 is the absolute bare minimum stub VM, which has a zImage{32,64} header, sets up the stack, makes one CONSOLEIO_write hypercall, and then a clean SCHEDOP_shutdown.
> 
> There are some bugs:
> 
> 1) kernel_zimage32_probe() rejects relocatable binaries, but if I skip the check it works fine.
> 
> Furthermore, kernel_zimage64_probe() ignores the header and assumes the binary is relocatable.  Both probe functions fail to check the endianness marker.
> 
> 2) I'm using qemu-system-arm 4.2.1 (Debian 1:4.2-3ubuntu6.21), with some parameters cribbed from the Gitlab CI smoke test, but ctxt_switch_to() exploded with undef on:
> 
> WRITE_CP32(n->arch.joscr, JOSCR);
> WRITE_CP32(n->arch.jmcr, JMCR);
> 
> I'm not sure what these are (beyond Jazelle conf register), but I commented them out and it made further progress.  I have no idea if this is a Xen bug, qemu bug, or user error, but something is clearly wrong here.
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
> qemu-system-aarch64: terminating on signal 2
> 
> i.e. the CONSOLEIO_write hypercall completes successfully, but a trap occurs before the SCHEDOP_shutdown completes.  The full (tiny) binaries are attached, but it seems to be faulting on:
> 
>     40000098:    b81fcc3f     str    wzr, [x1, #-4]!
> 
> which (I think) is the store of 0 to the stack for the schedop shutdown reason.
> 
> 4) For test-arm32-stub under either the 32bit or 64bit Xen, I get:
> 
> (XEN) Freed 348kB init memory.
> (XEN) *** Got CONSOLEIO_write (18 bytes)
> (XEN) *** got fault
> (XEN) *** Got SCHEDOP_shutdown, 0
> (XEN) Hardware Dom0 halted: halting machine
> 
> which is weird.  The CONSOLEIO_write fails to read the passed pointer, despite appearing to have a ip-relative load to find the string, while the SCHEDOP_shutdown passes its parameter fine (it's a stack relative load).
> 
> 
> Other observations:
> 
> * There is no documented vCPU starting state.
> * Qemu is infinitely easier to to use (i.e. no messing with dtb/etc) as -kernel xen -initrd test-$foo with a oneliner change to the dtb parsing to treat ramdisk and no kernel as the dom0 kernel.  Maybe a better change would be to modify qemu to understand multiple -kernel's.
> * Xen can't load ELFs.
> 
> Some of these bugs might be mine, but at a minimum 1 is a bug in Xen and needs fixing.  Any ideas?
> 
> ~Andrew

FWICT Xen does not support booting ELF images so I'm not sure why do you want to use relocatable binaries.

Apart from that I'd suggest to use my patches that are tested and work fine to prevent working on the same thing.
FWICS you are based on some old patches from v1 while the new pull request is already there since March:
https://github.com/andyhhp/xtf/pull/6

This PR contains fixes for findings reported by Julien and Christopher during v1 review.

Cheers,
Michal

