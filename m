Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51A1E1289
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 18:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdFqi-00039A-FN; Mon, 25 May 2020 16:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7v1=7H=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdFqh-000395-1s
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 16:21:11 +0000
X-Inumbo-ID: ba31e596-9ea3-11ea-ae69-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba31e596-9ea3-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 16:21:03 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id E07E2122804;
 Mon, 25 May 2020 18:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590422641;
 bh=BNe2R8tifla9iLYf7B+jPurPruxQbGfizIkZY85wFFQ=;
 h=Date:From:To:Cc:Subject:From;
 b=nJDNlPUTcplLpcXGA1OC2kJC3ykorw2KC32zRXopyDAAongcoYRPSOE3Bzd80aUG9
 +wCuKbPx+NljUZPxapYylXrc/h6neHckG2N7y1bnncIOHRvaNVzc1nLitX2NXvmfrI
 dy7DiYnSMM4j2em88jDei3j8xQ+80YE1A1Np8sL4kbWN+rwVh5zs57cZxvY07GAJoU
 CVMuzrROpBSyr9rukyFJX81KFdLq0hvAPpy3CAZawPDKsFCFFkFuaEvcf+Ud3uzAIF
 jq3rCgwUyDSM2C+x7EkJunx32dYsbYOZFgAhrCX9vBAu38J4+esTMG/Pwb/XJRDYYQ
 tOntArvN7qIyA==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id B515E268436E; Mon, 25 May 2020 18:04:01 +0200 (CEST)
Date: Mon, 25 May 2020 18:04:01 +0200
From: Martin Lucina <martin@lucina.net>
To: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org
Subject: Xen PVH domU start-of-day VCPU state
Message-ID: <20200525160401.GA3091@nodbug.lucina.net>
Mail-Followup-To: xen-devel@lists.xenproject.org,
 mirageos-devel@lists.xenproject.org, anil@recoil.org,
 dave@recoil.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: dave@recoil.org, anil@recoil.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

I'm trying to bootstrap a new PVH-only Xen domU OS "from scratch", to
replace our existing use of Mini-OS for the early boot/low-level support
layer in MirageOS. I've done this by creating new Xen bindings for Solo5
[1], basing them on our existing virtio code [2].

Unfortunately, I can't seem to get past the first few instructions on VCPU
boot. Here's what I have at the moment (abridged):

    .section .note.solo5.xen

            .align  4
            .long   4
            .long   4
            .long   XEN_ELFNOTE_PHYS32_ENTRY
            .ascii "Xen\0"
            .long   _start32

    /* ... */

    .code32

    ENTRY(_start32)
            cld

            lgdt (gdt64_ptr)
            ljmp $0x10, $1f

    1:      movl $0x18, %eax
            movl %eax, %ds
            movl %eax, %es
            movl %eax, %ss

            xorl %eax, %eax
            movl %eax, %fs
            movl %eax, %gs

I have verified, via xl -v create -c ..., that the domain builder appears
to be doing the right thing, and is interpreting the ELF NOTE correctly.
However, for some reason I cannot fathom, I get a triple fault on the ljmp
following the lgdt instruction above:

    (XEN) d31v0 Triple fault - invoking HVM shutdown action 1
    (XEN) *** Dumping Dom31 vcpu#0 state: ***
    (XEN) ----[ Xen-4.11.4-pre  x86_64  debug=n   Not tainted ]----
    (XEN) CPU:    0
    (XEN) RIP:    0000:[<0000000000100028>]
    (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d31v0)
    (XEN) rax: 0000000000000000   rbx: 0000000000116000   rcx: 0000000000000000
    (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
    (XEN) rbp: 0000000000000000   rsp: 0000000000000000   r8:  0000000000000000
    (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
    (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
    (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
    (XEN) cr3: 0000000000000000   cr2: 0000000000000000
    (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
    (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0000

Cross-checking 0x100028 via gdb:

    Dump of assembler code for function _start32:
       0x00100020 <+0>:	cld
       0x00100021 <+1>:	lgdtl  0x108040
       0x00100028 <+8>:	ljmp   $0x10,$0x10002f
       0x0010002f <+15>:	mov    $0x18,%eax

I've spent a couple of days trying various things and cross-checking both
with the Mini-OS PVH/HVM startup [3] and the Intel SDM, but no joy. I've
also re-checked the GDT selector values used by the original virtio code
which this is based on, and they appear to be fine.

This is not helped by the fact that the Xen domU PVH start-of-day VCPU
state does not seem to be documented anywhere, with the exception of
"struct hvm_start_info is passed in %ebx" as stated in
arch-x86/hvm/start_info.h.

In case it's relevant, I'm testing with Xen 4.11.4 as shipped with Debian
10, on an Intel Broadwell CPU.

Any ideas? Any help much appreciated.

Thanks,

-mato

[1] https://github.com/mato/solo5/tree/xen/bindings/xen / https://github.com/mato/solo5/commit/f2539d588883a2e8854998c75bdea9b10f113ed6
[2] https://github.com/mato/solo5/tree/xen/bindings/virtio
[3] https://xenbits.xen.org/gitweb/?p=mini-os.git;a=blob;f=arch/x86/x86_hvm.S;h=6e8ad983a16adbe97b343f7dbc17e281ee0c389f;hb=HEAD


