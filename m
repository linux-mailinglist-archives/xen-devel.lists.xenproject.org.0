Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39684B783
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 15:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676961.1053331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMAK-0001o4-BW; Tue, 06 Feb 2024 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676961.1053331; Tue, 06 Feb 2024 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXMAK-0001lR-8C; Tue, 06 Feb 2024 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 676961;
 Tue, 06 Feb 2024 14:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+UH4=JP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXMAJ-0001lL-8b
 for xen-devel@lists.xen.org; Tue, 06 Feb 2024 14:11:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929d3896-c4f9-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 15:11:08 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so7870439e87.0
 for <xen-devel@lists.xen.org>; Tue, 06 Feb 2024 06:11:08 -0800 (PST)
Received: from [10.80.67.148] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h21-20020a170906111500b00a372330e834sm1191468eja.102.2024.02.06.06.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:11:07 -0800 (PST)
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
X-Inumbo-ID: 929d3896-c4f9-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707228667; x=1707833467; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJiZybQedixqXPT0Vc0ESISL14VktV+tIavcWkYU7D0=;
        b=ascs5k/SoYFDShJtQ3xXG171jy/DxlwVwq8nZWg3Hp2LoLmACn7HJQ1TYsGA9dDpu3
         PeL9nY+hwwF2iZ5nPbVETHOW8NghWoQ+8nO4Hgkom7IIAb9cx7p9iNGE9VMpTzNQZ/Si
         OCXVsAQy1HiBzHD7lwRrP2NXuRSFzIu3ApDik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707228667; x=1707833467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJiZybQedixqXPT0Vc0ESISL14VktV+tIavcWkYU7D0=;
        b=tplZCn+2yeaRqBuVqH0xv+B7ExRaMmEAqr4iGd3DZzqxDCscEwp6ZSRQF/jPTeJPUE
         9W25zn902X+x3TI5m2Z/WmyY+hwwrRZq5gTtilunI3KYwHBWLcaDEnFXSM2DQDlnkTYs
         +EC0Y50+719fMBwk0gbzwLZAodfm8XdD9Mux54nsNpzxbs4wUbGgoalZWmEDklalMpxL
         HfMKgWIwJurCym2Jmnbv8vh/yGm1UEzmeBuiLRB4dYQDgukuYVDXAoGg3Ml2mDG2i0IR
         1X0NH3ohN6qDXA9+N8u0IEjJtR5ICJtKYMpXStv7+S605q5iAt7lMUo8ipwAL1yFi6GS
         QsqA==
X-Gm-Message-State: AOJu0Ywn2yFmjRk3/NL5fGcNFCKXlAfozibvnVWOThMivMzFIdPS5PC1
	Nv2xArrQWpzIB8cYqQC/OFs+SBXLTkW90GK43oiEwdENUzJTiJTiCc3BsyoT4RI=
X-Google-Smtp-Source: AGHT+IHK/53MGzQSVJi5PfK3MxK+WFR6s1o2EDVIlNbabm3AYvW2eoKqD5jsPkyPfUYWgS1ERvFBrQ==
X-Received: by 2002:a19:641c:0:b0:511:add:cfe9 with SMTP id y28-20020a19641c000000b005110addcfe9mr1750375lfb.26.1707228667478;
        Tue, 06 Feb 2024 06:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUvLAdHhJCqsTMn2UfIFWPH1dxxAsJgkTCh1loRe4b1KUEakqHLQbG6fcOyqGODu/okONeaqgNjARtsqQtQzWOK3ZRw4vKwJg==
Message-ID: <5cb25d4f-c3be-4c45-a434-421e1bf54be3@citrix.com>
Date: Tue, 6 Feb 2024 14:11:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Possible FATAL PAGE FAULT in domain_crash function on Xen
 4.14.6
Content-Language: en-GB
To: Giuseppe De Rosa <giuseppe.de.rosa@outlook.it>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <DB9P192MB1434AD2FD1069E39FB480068A6462@DB9P192MB1434.EURP192.PROD.OUTLOOK.COM>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <DB9P192MB1434AD2FD1069E39FB480068A6462@DB9P192MB1434.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2024 12:14 pm, Giuseppe De Rosa wrote:
> Bug detailed description:
> 
> ----------------
> 
> While booting a Linux Debian 7 "Wheezy" VM, Xen crashes with a FATAL
> PAGE FAULT. 
> 
>  
> 
> Environment :
> 
> ----------------
> 
> HW: Intel(R) Xeon(R) CPU E5-1620 v2 @ 3.70GHz (2 CPU, Xen in nested
> virtualization upon QEMU/KVM), 4GB RAM
> 
> Xen: Xen 4.14.6 (xen-hypervisor-4.14-amd64 package)
> 
> Dom0: Linux 5.10.0-26-amd64 (Debian 11 "Bullseye"), 1 CPU, 1024GB RAM
> 
>  
> 
> Reproduce steps:
> 
> ----------------
> 
> 1.      Install debian 11 and xen package
> 
> 2.      Boot a clean debian 7 image in hardware-assisted virtualization
> 
> 3.      Single bit-flip bit number 2 of VMCS field
> "VM_EXIT_QUALIFICATION" (field number 6400). In my case, value changed
> from [100049] -> [10004d]
> 
> 4.      Leave the debian7 guest executing after the bit flip.
> 
>  
> 
> Current result:
> 
> ----------------
> 
> Xen crash
> 
>  
> 
> Console error log:
> 
> ----------------
> 
> (XEN) d1v0 Unexpected PIO status 1, port 0x10 read 0x00000000ffff
> 
> (XEN) domain_crash called from io.c:166
> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> (XEN) ----[ Xen-4.14.6  x86_64  debug=n   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    0010:[<ffffffff8100712e>]
> (XEN) RFLAGS: 0000000000000046   CONTEXT: hvm guest (d1v0)
> (XEN) rax: 0000000000000000   rbx: 0000000040000000   rcx: 0000000000000001
> (XEN) rdx: 0000000000000000   rsi: ffffffff81666a80   rdi: ffffffff81617830
> (XEN) rbp: 0000000000000020   rsp: ffffffff81601e78   r8:  0000000000000200
> (XEN) r9:  ffffffff8168f2a0   r10: 0000000000000007   r11: 0000000000000007
> (XEN) r12: ffffffff81601f58   r13: ffffffffffffffff   r14: 000000000008c800
> (XEN) r15: 0000000000001000   cr0: 0000000080050033   cr4: 00000000001000a0
> (XEN) cr3: 0000000001605000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: ffffffff81696000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0010
> (XEN) d1v0 Bad rIP ffffffff8100712e for mode 0
> (XEN) domain_crash called from vmx.c:4413
> (XEN) ----[ Xen-4.14.6  x86_64  debug=n   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d040206fa9>] __domain_crash+0x9/0x80
> (XEN) RFLAGS: 0000000000010296   CONTEXT: hypervisor (d1v0)
> (XEN) rax: ffff830139c0506c   rbx: ffff8301308a0000   rcx: 0000000000000000
> (XEN) rdx: ffff830136ddffff   rsi: 000000000000000a   rdi: 0000000000000000
> (XEN) rbp: 0000000000000000   rsp: ffff830136ddfee0   r8:  0000000000000001
> (XEN) r9:  0000000000004000   r10: 0000000000000001   r11: ffff82d040372d40
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000001526e0
> (XEN) cr3: 0000000136da6000   cr2: 0000000000000208
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040206fa9> (__domain_crash+0x9/0x80):
> (XEN)  0f 1e fa 55 48 89 fd 53 <80> bf 08 02 00 00 00 75 2d 48 89 e3 0f
> b7 37 48
> (XEN) Xen stack trace from rsp=ffff830136ddfee0:
> (XEN)    ffff8301308a0000 0000000000000000 ffff82d0402a1798 0000000000001000
> (XEN)    000000000008c800 ffffffffffffffff ffffffff81601f58 0000000000000020
> (XEN)    0000000040000000 0000000000000007 0000000000000007 ffffffff8168f2a0
> (XEN)    0000000000000200 0000000000000000 0000000000000001 0000000000000000
> (XEN)    ffffffff81666a80 ffffffff81617830 000000fa00000000 ffffffff8100712e
> (XEN)    0000000000000000 0000000000000046 ffffffff81601e78 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000e01000000001 ffff8301308a0000 00000030f9686000 00000000001526e0
> (XEN)    0000000000000000 0000000000000000 0006020200000000 0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040206fa9>] R __domain_crash+0x9/0x80
> (XEN)    [<ffff82d0402a1798>] S vmx_asm_vmexit_handler+0xf8/0x210
> (XEN)
> (XEN) Pagetable walk from 0000000000000208:
> (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: 0000000000000208
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
>  
> 
> HVM guest config file:
> 
> --------------------------------
> 
> name = "debian7"
> 
> builder= "hvm"
> memory = 1024
> vcpus = 1
> cpus= ["1"]
> disk=["qcow2:/home/test/debian7.qcow2,xvda,w"]
> vnc = 1
> vnclisten = '127.0.0.1'
> vncdisplay = 1
> boot = "d"
> serial = "pty"
> 
> Discussion
> --------------------------------
> 
> Hello, i am conducting robustness tests on Xen 4.14. I bit flipped the
> field VM_EXIT_QUALIFICATION during the exit handling of an
> IO_INSTRUCTION. After a VM Read on that field, Xen crashes with this
> error log. This is my (possible) explanation:
> 
> Xen correctly detects an error in the field, resulting in a domain crash
> (Unexpected PIO status 1) called from this point in the code:
> 
> xen/arch/x86/hvm/io.c
> ```
> gprintk(XENLOG_ERR, "Unexpected PIO status %d, port %#x %s 0x%0*x\n",
>                 rc, port, dir == IOREQ_WRITE ? "write" : "read",
>                 size * 2, data & ((1u << (size * 8)) - 1));
> domain_crash(curr->domain);
> return false;
> ```
> 
> In the `handle_pio` function, in the handling of the `IO_INSTRUCTION`
> exit reason. However, the code continues and ends here for an issue in
> the processor mode:
> 
> /xen/arch/x86/hvm/vmx/vmx.c
> ```
> mode = vmx_guest_x86_mode(v);
>     if ( mode == 8 ? !is_canonical_address(regs->rip)
>                    : regs->rip != regs->eip )
>     {
>         gprintk(XENLOG_WARNING, "Bad rIP %lx for mode %u\n", regs->rip,
> mode);
> 
>         if ( vmx_get_cpl() )
>         {
>             __vmread(VM_ENTRY_INTR_INFO, &intr_info);
>             if ( !(intr_info & INTR_INFO_VALID_MASK) )
>                 hvm_inject_hw_exception(TRAP_gp_fault, 0);
>             /* Need to fix rIP nevertheless. */
>             if ( mode == 8 )
>                 regs->rip = (long)(regs->rip << (64 - VADDR_BITS)) >>
>                             (64 - VADDR_BITS);
>             else
>                 regs->rip = regs->eip;
>         }
>         else
>             domain_crash(v->domain);
>     }
> ```
> 
> However, the domain pointer has already been deallocated due to the
> previous domain crash, resulting in a page fault that leads to Xen crashing.
> 
> I would like to report this crash and ask for your opinion. Based on
> previous research, I do not believe it has been reported before. I am
> unsure if it could potentially be a security issue, hence I am posting
> it here. Let me know if I should provide other results. Thank you for
> your kind response in advance.


Answering somewhat out of order.

You've posted this publicly so the cat is out of the bag regardless.  If
you have concerns about security, please email security@xen.org as your
first point of contact.

That said, nested virt is not security supported.  It's still an
experimental feature, so bugs like this are fine to come straight to the
public mailing list.

The "Bad rIP" logic is buggy and has since been deleted.  Xen 4.14 is a
very old version of Xen, and is outside of general bugfix support.

It is quite likely that this bug still exists, but please use an
up-to-date version of Xen.  Fixes need developing against master and are
unlikely to be backported in this case, given its experimental status.

Also, you should be using a debug build of Xen generally for work like
this.  (I have no idea if it would alter your observations.)


I'm not sure what I think about bitflipping the exit qualification.  In
other places, that will definitely cause more severe crashes, and Xen
won't be getting in the game of auditing the VMX implementation against
the VMX spec.


For this crash you've got, there should be no way for the domain pointer
to have been freed in the sequence you've described.  While the vCPU is
still scheduled, the structures will remain.

Looking at the second backtrace, It looks suspiciously like a NULL
pointer was passed into __domain_crash() from vmx_asm_vmexit_handler()
but there's no such call call, nor a tailcall out of the handler, even
taking a peek at the 4.14 code.

If you have local changes, I'd look at those first.

~Andrew

