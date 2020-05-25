Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3551E137C
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 19:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdH6D-0002DT-Fz; Mon, 25 May 2020 17:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvIA=7H=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdH6B-0002DO-Hk
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 17:41:15 +0000
X-Inumbo-ID: ed4dd754-9eae-11ea-b9cf-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed4dd754-9eae-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 17:41:13 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:43642
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdH68-000Mfb-Jg (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 25 May 2020 18:41:12 +0100
Subject: Re: Xen PVH domU start-of-day VCPU state
To: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org, martin@lucina.net
References: <20200525160401.GA3091@nodbug.lucina.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6fadfd84-0fc4-d462-a917-1c88ec0822b8@citrix.com>
Date: Mon, 25 May 2020 18:41:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525160401.GA3091@nodbug.lucina.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25/05/2020 17:04, Martin Lucina wrote:
> Hi,
>
> I'm trying to bootstrap a new PVH-only Xen domU OS "from scratch", to
> replace our existing use of Mini-OS for the early boot/low-level support
> layer in MirageOS. I've done this by creating new Xen bindings for Solo5
> [1], basing them on our existing virtio code [2].
>
> Unfortunately, I can't seem to get past the first few instructions on VCPU
> boot. Here's what I have at the moment (abridged):
>
>     .section .note.solo5.xen
>
>             .align  4
>             .long   4
>             .long   4
>             .long   XEN_ELFNOTE_PHYS32_ENTRY
>             .ascii "Xen\0"
>             .long   _start32
>
>     /* ... */
>
>     .code32
>
>     ENTRY(_start32)
>             cld
>
>             lgdt (gdt64_ptr)
>             ljmp $0x10, $1f
>
>     1:      movl $0x18, %eax
>             movl %eax, %ds
>             movl %eax, %es
>             movl %eax, %ss
>
>             xorl %eax, %eax
>             movl %eax, %fs
>             movl %eax, %gs
>
> I have verified, via xl -v create -c ..., that the domain builder appears
> to be doing the right thing, and is interpreting the ELF NOTE correctly.
> However, for some reason I cannot fathom, I get a triple fault on the ljmp
> following the lgdt instruction above:
>
>     (XEN) d31v0 Triple fault - invoking HVM shutdown action 1
>     (XEN) *** Dumping Dom31 vcpu#0 state: ***
>     (XEN) ----[ Xen-4.11.4-pre  x86_64  debug=n   Not tainted ]----
>     (XEN) CPU:    0
>     (XEN) RIP:    0000:[<0000000000100028>]
>     (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d31v0)
>     (XEN) rax: 0000000000000000   rbx: 0000000000116000   rcx: 0000000000000000
>     (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
>     (XEN) rbp: 0000000000000000   rsp: 0000000000000000   r8:  0000000000000000
>     (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
>     (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
>     (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
>     (XEN) cr3: 0000000000000000   cr2: 0000000000000000
>     (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
>     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0000

For extra help debugging this, you can dump the vmcs here:

andrewcoop@andrewcoop:/local/xen.git/xen$ git d
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 74c9f84462..8ae23545ae 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1687,6 +1687,7 @@ void hvm_triple_fault(void)
             "Triple fault - invoking HVM shutdown action %d\n",
             reason);
     vcpu_show_execution_state(v);
+    vmcs_dump_vcpu(v);
     domain_shutdown(d, reason);
 }
 

which will include the segment cache, including the just loaded GDT details.

> Cross-checking 0x100028 via gdb:
>
>     Dump of assembler code for function _start32:
>        0x00100020 <+0>:	cld
>        0x00100021 <+1>:	lgdtl  0x108040
>        0x00100028 <+8>:	ljmp   $0x10,$0x10002f
>        0x0010002f <+15>:	mov    $0x18,%eax
>
> I've spent a couple of days trying various things and cross-checking both
> with the Mini-OS PVH/HVM startup [3] and the Intel SDM, but no joy. I've
> also re-checked the GDT selector values used by the original virtio code
> which this is based on, and they appear to be fine.
>
> This is not helped by the fact that the Xen domU PVH start-of-day VCPU
> state does not seem to be documented anywhere, with the exception of
> "struct hvm_start_info is passed in %ebx" as stated in
> arch-x86/hvm/start_info.h.

https://xenbits.xen.org/docs/unstable/misc/pvh.html

The starting state is described there.  It is 32bit flat mode, very
similar to multiboot's entry.

> In case it's relevant, I'm testing with Xen 4.11.4 as shipped with Debian
> 10, on an Intel Broadwell CPU.
>
> Any ideas?

Sadly no.

From
https://github.com/mato/solo5/commit/f2539d588883a2e8854998c75bdea9b10f113ed6

all data looks to be linked below the 4G boundary, so the 32/64bitness
of lgdt shouldn't matter in this case.

Reordering the logic as per MiniOS/XTF will avoid the need for a 32bit
CS selector - it is safe to run on the ABI-provided %cs until you switch
into 64bit mode.

It might also be interesting to see exactly what value is in gdt64_ptr,
just to check that the base an limit are set sensibly.

~Andrew

