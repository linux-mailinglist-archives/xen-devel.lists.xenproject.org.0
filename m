Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D81E1D49
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 10:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdUvY-000676-AX; Tue, 26 May 2020 08:27:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdUvX-000671-EM
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:27:11 +0000
X-Inumbo-ID: adfd328a-9f2a-11ea-9947-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adfd328a-9f2a-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 08:27:05 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 2B303122804;
 Tue, 26 May 2020 10:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590481624;
 bh=nMbw4GKCmitbAyTsPCbgeJZDMgcv0pZGQeT3lxD0qLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O58q11Z6PMCr4KpKLZFxlfh72IAdiaHSUro7vrskbvfQB/G5jvVkuiXFfcvnHRbGe
 usat0Jdc6C2ZbqD+CQD7P3xTrQDmcHCcjupohbNSQaRK3lJ7nEHfD90zKK9xIFf7Yz
 OCT+Y1VsUkrf01ysO9rkAi2gt2KCBZIiVFClD1SLNt0PNXu/pyYfF+z+YtjyIk1i6O
 8FwTb23AFsnPBoP6FZYURvZksDbDrTLJkYRK4IMImQbyKlUsqCC7otXFPKC3uaC3a9
 NsE4Fmw5F6yWGtiJdB5e9xCA81Oo8H+TcTH9KGld8bg+pw+lIi0Lx0NmIZTvQsTY+s
 y2Qh/go8Nwzcw==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id EB756268436E; Tue, 26 May 2020 10:27:03 +0200 (CEST)
Date: Tue, 26 May 2020 10:27:03 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526082703.GA5942@nodbug.lucina.net>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <6fadfd84-0fc4-d462-a917-1c88ec0822b8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fadfd84-0fc4-d462-a917-1c88ec0822b8@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, dave@recoil.org,
 mirageos-devel@lists.xenproject.org, anil@recoil.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, 25.05.2020 at 18:41, Andrew Cooper wrote:
> On 25/05/2020 17:04, Martin Lucina wrote:
> > Hi,
> >
> > I'm trying to bootstrap a new PVH-only Xen domU OS "from scratch", to
> > replace our existing use of Mini-OS for the early boot/low-level support
> > layer in MirageOS. I've done this by creating new Xen bindings for Solo5
> > [1], basing them on our existing virtio code [2].
> >
> > Unfortunately, I can't seem to get past the first few instructions on VCPU
> > boot. Here's what I have at the moment (abridged):
> >
> >     .section .note.solo5.xen
> >
> >             .align  4
> >             .long   4
> >             .long   4
> >             .long   XEN_ELFNOTE_PHYS32_ENTRY
> >             .ascii "Xen\0"
> >             .long   _start32
> >
> >     /* ... */
> >
> >     .code32
> >
> >     ENTRY(_start32)
> >             cld
> >
> >             lgdt (gdt64_ptr)
> >             ljmp $0x10, $1f
> >
> >     1:      movl $0x18, %eax
> >             movl %eax, %ds
> >             movl %eax, %es
> >             movl %eax, %ss
> >
> >             xorl %eax, %eax
> >             movl %eax, %fs
> >             movl %eax, %gs
> >
> > I have verified, via xl -v create -c ..., that the domain builder appears
> > to be doing the right thing, and is interpreting the ELF NOTE correctly.
> > However, for some reason I cannot fathom, I get a triple fault on the ljmp
> > following the lgdt instruction above:
> >
> >     (XEN) d31v0 Triple fault - invoking HVM shutdown action 1
> >     (XEN) *** Dumping Dom31 vcpu#0 state: ***
> >     (XEN) ----[ Xen-4.11.4-pre  x86_64  debug=n   Not tainted ]----
> >     (XEN) CPU:    0
> >     (XEN) RIP:    0000:[<0000000000100028>]
> >     (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d31v0)
> >     (XEN) rax: 0000000000000000   rbx: 0000000000116000   rcx: 0000000000000000
> >     (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 0000000000000000
> >     (XEN) rbp: 0000000000000000   rsp: 0000000000000000   r8:  0000000000000000
> >     (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> >     (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> >     (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
> >     (XEN) cr3: 0000000000000000   cr2: 0000000000000000
> >     (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> >     (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0000
> 
> For extra help debugging this, you can dump the vmcs here:
> 
> andrewcoop@andrewcoop:/local/xen.git/xen$ git d
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 74c9f84462..8ae23545ae 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1687,6 +1687,7 @@ void hvm_triple_fault(void)
>              "Triple fault - invoking HVM shutdown action %d\n",
>              reason);
>      vcpu_show_execution_state(v);
> +    vmcs_dump_vcpu(v);
>      domain_shutdown(d, reason);
>  }
>  
> 
> which will include the segment cache, including the just loaded GDT details.

Thanks, I'll try that and report back.

> 
> > Cross-checking 0x100028 via gdb:
> >
> >     Dump of assembler code for function _start32:
> >        0x00100020 <+0>:	cld
> >        0x00100021 <+1>:	lgdtl  0x108040
> >        0x00100028 <+8>:	ljmp   $0x10,$0x10002f
> >        0x0010002f <+15>:	mov    $0x18,%eax
> >
> > I've spent a couple of days trying various things and cross-checking both
> > with the Mini-OS PVH/HVM startup [3] and the Intel SDM, but no joy. I've
> > also re-checked the GDT selector values used by the original virtio code
> > which this is based on, and they appear to be fine.
> >
> > This is not helped by the fact that the Xen domU PVH start-of-day VCPU
> > state does not seem to be documented anywhere, with the exception of
> > "struct hvm_start_info is passed in %ebx" as stated in
> > arch-x86/hvm/start_info.h.
> 
> https://xenbits.xen.org/docs/unstable/misc/pvh.html
> 
> The starting state is described there.  It is 32bit flat mode, very
> similar to multiboot's entry.
> 
> > In case it's relevant, I'm testing with Xen 4.11.4 as shipped with Debian
> > 10, on an Intel Broadwell CPU.
> >
> > Any ideas?
> 
> Sadly no.
> 
> From
> https://github.com/mato/solo5/commit/f2539d588883a2e8854998c75bdea9b10f113ed6
> 
> all data looks to be linked below the 4G boundary, so the 32/64bitness
> of lgdt shouldn't matter in this case.

That's correct, the virtio code this is based on doesn't use anything above
1GB.

> Reordering the logic as per MiniOS/XTF will avoid the need for a 32bit
> CS selector - it is safe to run on the ABI-provided %cs until you switch
> into 64bit mode.

I can try poking at the order some more, but was aiming for a minimal diff
against virtio to start with.

> It might also be interesting to see exactly what value is in gdt64_ptr,
> just to check that the base an limit are set sensibly.

Seems fine:

    (gdb) info address gdt64_ptr
    Symbol "gdt64_ptr" is at 0x108040 in a file compiled without debugging.
    (gdb) x /1xg 0x108040
    0x108040:	0x000000108000002f
    (gdb) p/x (struct gdtptr)gdt64_ptr
    $3 = {limit = 0x2f, base = 0x108000}

-mato

