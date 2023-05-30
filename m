Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945D716A2A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541286.843882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42eJ-0000xr-JU; Tue, 30 May 2023 16:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541286.843882; Tue, 30 May 2023 16:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42eJ-0000vj-Gt; Tue, 30 May 2023 16:56:43 +0000
Received: by outflank-mailman (input) for mailman id 541286;
 Tue, 30 May 2023 16:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zKAq=BT=flex--seanjc.bounces.google.com=3wyp2ZAYKCRwK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@srs-se1.protection.inumbo.net>)
 id 1q42eH-0000vd-U8
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:56:41 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0568309-ff0a-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 18:56:37 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-53f44c2566dso2594688a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 09:56:37 -0700 (PDT)
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
X-Inumbo-ID: f0568309-ff0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685465796; x=1688057796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUIF7qczhJfL0tzqN+Wk4Y8s0fyjf+/encaeJ8i8zo8=;
        b=RbEfFAAf2kcBOjvt74s5UVZKgWrUGFDUy+sd7fobbo+fCQD0px8ov63e8OeZXSJ8fh
         HG4hHegtTrDVP700YjLnXteCxE6guE54Vbd8zH/t2rCli4QSiy5tmFSofJYIZgEMn1zj
         Qsp4LrQqCDZwVqc25d9x6Ot8kXQSMfXIZ9gqaurkMyf4wf+UYa4w1aAbMwazKXlrtuiS
         Kk616ydOwBRsdeEiUal2WEabr5ltpvlk9LlkPPxhELMLDRXHyhZJZ3Til0KRYe81otj+
         tS/p/kiytx6/XARdF4p/h7eKZckIQCkqvbC4w6UMN19z2FxazUFpiFD2Hr1ZsYeU6F4t
         XCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465796; x=1688057796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUIF7qczhJfL0tzqN+Wk4Y8s0fyjf+/encaeJ8i8zo8=;
        b=RHEdGEght3UPOQv0PilZND+qGeiHXiUJXHQWL1gDZsR3eCtdFXX1V7a/lUjwa133Jk
         7RVWt9zCjbhrCQ444p35hiHtPaSEqJQ/Y/ByW37mNTPY7+e/Fsg/1cAwLKui13+jbVXt
         /BzC47Jkv9KDkcnNppU3SKb+PaQ2jwtaPcFCyyHdCi+hTzNwoc1voRyvv6oXhTOrAt6p
         m+EMCVUFGgMUbq+g0rcpFzckQIbWsCoTBWoR7/YC8+8Q2H0VCft0RQOZ5VXtU88kRhkv
         OHn9ldyw0QOo0lrUQzDjqB/ZLX02jJ0k1C4C3YRRqjBkx/N4jZb9FfCFf+HHuNdortNa
         h0bg==
X-Gm-Message-State: AC+VfDykoNhAe5MvL1ApXQrlBrldix6qF28c1sCByi11kMUrVtG62oei
	tqzybxiHjD6Z6NA+anVe0zVvSLSsX6o=
X-Google-Smtp-Source: ACHHUZ6elIb9Xawt5kHr4iARsASD1eAmXyJrU7yMOnucjGsQDVEv6w8ENbA+wCa+rqHlmqnxd6WixqOcZs8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:512:0:b0:52c:9e55:61ee with SMTP id
 18-20020a630512000000b0052c9e5561eemr545525pgf.3.1685465795799; Tue, 30 May
 2023 09:56:35 -0700 (PDT)
Date: Tue, 30 May 2023 09:56:34 -0700
In-Reply-To: <87wn0pizbl.ffs@tglx>
Mime-Version: 1.0
References: <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx> <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx>
Message-ID: <ZHYqwsCURnrFdsVm@google.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Tom Lendacky <thomas.lendacky@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Brian Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, 
	Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>, 
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 30, 2023, Thomas Gleixner wrote:
> On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> > On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> >> The decision to allow parallel bringup of secondary CPUs checks
> >> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> >> parallel bootup because accessing the local APIC is intercepted and raises
> >> a #VC or #VE, which cannot be handled at that point.
> >> 
> >> The check works correctly, but only for AMD encrypted guests. TDX does not
> >> set that flag.
> >> 
> >> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> >> definitely works for both AMD and Intel.
> >
> > It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> > report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> > we want it.
> 
> Right. Did not think about that.
> 
> But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
> SEV-ES traps RDMSR if I'm understandig that maze correctly.

Ya, regular SEV doesn't encrypt register state.

