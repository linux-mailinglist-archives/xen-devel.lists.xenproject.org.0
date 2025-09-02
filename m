Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB43B3FCF2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 12:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106050.1456839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOVG-0004Yh-GK; Tue, 02 Sep 2025 10:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106050.1456839; Tue, 02 Sep 2025 10:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utOVG-0004W5-Dd; Tue, 02 Sep 2025 10:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1106050;
 Tue, 02 Sep 2025 10:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4ch=3N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utOVF-0004Vz-M0
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 10:44:41 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d32d0d5e-87e9-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 12:44:39 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3cbe70a7923so4090720f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 03:44:39 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b661d87a7sm166248535e9.2.2025.09.02.03.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:44:37 -0700 (PDT)
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
X-Inumbo-ID: d32d0d5e-87e9-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756809878; x=1757414678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=636gbm3lbPMHlo/s+e6WvvL4SNwIpAErN7aQj4hde20=;
        b=Dn5p2p7czksmtXn2QeEPEJoKpZTuxQHQ8E52k4+hobqBuGTKb0VJn/4I63TtsYgJOG
         DlLlP4g3G1pCxxcyXt/ejFmOcY14CF5wj0qqZ1BsHZpfOYl/H455kbJKAYJ7noNdISrz
         Spgo66whY6pwYsM/EpPLvLAhbE/MVBYCsvEWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756809878; x=1757414678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=636gbm3lbPMHlo/s+e6WvvL4SNwIpAErN7aQj4hde20=;
        b=O1P508XFsQKiBGP62j5DxUoBjceivUK6dFmDBmabBX6cxZ4uyraVXyzv3XFQZ2dz5G
         PuMCAuwr51lQsxj6gD42o3+lCiHaeargTvlgAFW5nfX4ZhKjU7u9Q8DI1jc9sQcZZGTf
         PlqFh6mIvnf56J1+j7AAE/xgG0DWB3VfsOV9fATd2fuRAXuTJFSn/4XmWwG9aeODb4Ll
         oGkKB+TAaECse1qca0ozLDTBfFouo3qnp0HSt8dSgyrJBdCbhwzszMLqp5vn2kQwUsla
         nmVKJmbqUyiHMEikgwiwpIXjm848VMyyq3T5xJuKEYWscAApnpGH5DhAxZg1TiKs2xhO
         +l5A==
X-Forwarded-Encrypted: i=1; AJvYcCVOhH8HT3aSKybzHZogV+HJRWpdn54OxogQpFWRuH/wyh29T9vJfSaFGjFHdzXekBs/XEEFmpFf4v8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5JtyAF34AEdKwWdk9MCqOJINMFBcIJHTSPLkLKv+rAc1MHL+s
	E3hl0cJuOA2w5+BWc4uQKY+GBNXqGmt0GLrhQs02cyMpWEdWhR67Dh00zqSUDKGqBgO/96sBJkl
	5MoqA
X-Gm-Gg: ASbGnctmMuB/u963dlVSy2UCfNbL2AfiRepOAxs/Ypaep0BVVC/NjIovjil+fi3vV8P
	l3PCUKGDHl2QRGk5bAMtlfxdxHAGbTSeMYYyfnu6WhJUrbJMK+xOkArGCDtafyxauxBrPYA1NVz
	xBWmlwuhA16ovUT6xbxGfUUaLJ2KIeM9gssIg0NDQpZYeiBbtMXSOuUwiCYMK1P31vtMhUlXba9
	OwhBuRPLp6YuvG3mWJaBnpLn1PWmYFxgjB8x7FMk4voSJ36Fn2JrjRJ8k2DwOtD0FL6NIVhy+mA
	jRfwfsZOSC/5PzYKnWz69xoCkoFhtMU/a9GozqKCeTOl5RBPlVdkuBzhtY9TCDEwSSPREx7+7bO
	aw71DWYeJURPGy3LKtThcKneOH8g1eTpniUXjDyNnImxBas2eWh2b/azfxZK2QoyQSLN8umay7z
	K+1RQ=
X-Google-Smtp-Source: AGHT+IGGYKzyAUe/IaGXDhdL9woA7O3AIE1PoFVumpFrnd4Cmt2fMT2p1sFtOUU7tMBYElXU3abJgQ==
X-Received: by 2002:a05:6000:2908:b0:3ce:d43c:673c with SMTP id ffacd0b85a97d-3d1e03bffc3mr9104094f8f.46.1756809878224;
        Tue, 02 Sep 2025 03:44:38 -0700 (PDT)
Message-ID: <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
Date: Tue, 2 Sep 2025 11:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2025 11:17 am, Manuel Bouyer wrote:
> Hello,
> I'm trying to boot a NetBSD PVH dom0 on Xen 4.20.
> The same NetBSD kernel works fine with Xen 4.18
>
> The boot options are:
> menu=Boot netbsd-current PVH Xen420:dev hd0f:;load /netbsd-PVH console=com0 root=wd0f; multiboot /xen420-debug.gz dom0_mem=1024M console=com1 com1=38400,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1 dom0=pvh
>
> and the full log from serial console is attached.
>
> With 4.20 the boot fails with:
>
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 664kB init memory
> (XEN) d0v0 Triple fault - invoking HVM shutdown action 1
> (XEN) *** Dumping Dom0 vcpu#0 state: ***
> (XEN) ----[ Xen-4.20.2-pre_20250821nb0  x86_64  debug=y  Tainted:   C    ]----
> (XEN) CPU:    7
> (XEN) RIP:    0008:[<000000000020e268>]
> (XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d0v0)
> (XEN) rax: 000000002024c003   rbx: 000000000020e260   rcx: 00000000000dfeb7
> (XEN) rdx: 0000000000100000   rsi: 0000000000103000   rdi: 000000000013e000
> (XEN) rbp: 0000000080000000   rsp: 00000000014002e4   r8:  0000000000000000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
> (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
> (XEN) cr3: 0000000000000000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0010   es: 0010   fs: 0000   gs: 0000   ss: 0010   cs: 0008
>
> because of the triple fault the RIP above doens't point to the code.
>
> I tracked it down to this code:
>         cmpl    $0,%ecx                 ;       /* zero-sized? */       \
>         je      2f                      ; \
>         pushl   %ebp                    ; \
>         movl    RELOC(nox_flag),%ebp    ; \
> 1:      movl    %ebp,(PDE_SIZE-4)(%ebx) ;       /* upper 32 bits: NX */ \
>         movl    %eax,(%ebx)             ;       /* store phys addr */   \
>         addl    $PDE_SIZE,%ebx          ;       /* next PTE/PDE */      \
>         addl    $PAGE_SIZE,%eax         ;       /* next phys page */    \
>         loop    1b                      ; \
>         popl    %ebp                    ; \
> 2:                                      ;
>
> there are others pushl/popl before so I don't think that's the problem
> (in fact the exact same fragment is called just before with different
> inputs and it doesn't fault). So the culprit it probably the write to (%ebx),
> which would be 0x20e260
> This is in the range:
> (XEN)  [0000000000100000, 0000000040068e77] (usable)
> so I can't see why this would be a problem.
>
> Any idea, including how to debug this further, welcome

Even though triple fault's are aborts, they're generally accurate under
virt, so 0x20e268 is most likely where things die.

Your best bet is to instrument hvm_triple_fault().  e.g.

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 23bd7f078a1d..0f960576b3e6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1746,14 +1746,22 @@ void hvm_hlt(unsigned int eflags)
 
 void hvm_triple_fault(void)
 {
+    const struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
     struct domain *d = v->domain;
     u8 reason = d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON];
+    char insns[32];
 
     gprintk(XENLOG_ERR,
             "Triple fault - invoking HVM shutdown action %d\n",
             reason);
     vcpu_show_execution_state(v);
+
+    if ( copy_from_user_hvm(insns, _p(regs->rip), ARRAY_SIZE(insns)) )
+        printk("Guest code stream: %32ph\n", insns);
+    else
+        printk("Bad pagetables for %%rip\n");
+
     domain_shutdown(d, reason);
 }
 

will try and get you the instruction which finally caused the fault.
(compile tested only)

Given that 4.18 works and 4.20 doesn't, it's probably to do with the
initial memory map of the guest.  Do you have the full logs of both boots?

Just for sanity sake (I don't know if it's going to be relevant or not),
boot with dom0=pvh,pf-fixup  which just might highlight if we've got a
mixup with the memory map presented to the guest vs the system.

~Andrew

