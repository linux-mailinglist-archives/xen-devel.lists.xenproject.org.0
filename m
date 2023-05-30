Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA3716F0C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 22:48:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541484.844293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q46Fk-00042S-LE; Tue, 30 May 2023 20:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541484.844293; Tue, 30 May 2023 20:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q46Fk-00040U-I4; Tue, 30 May 2023 20:47:36 +0000
Received: by outflank-mailman (input) for mailman id 541484;
 Tue, 30 May 2023 20:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q468B-00009z-1m
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 20:39:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9a7cc1-ff2a-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 22:39:45 +0200 (CEST)
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
X-Inumbo-ID: 1c9a7cc1-ff2a-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685479184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulmrcImbtRvzqGgwE3a2VNEOCnRPGxt2UYSBYI3GTxQ=;
	b=4qWCcJKQCkNkGPqM/Rfcb/VSCOwDyDojxTr5YkT3yoCg+h+F4OXwKDoF2GjtKdG3kd2wY8
	L6bWsrD3kwGyYxrBlWcx8MzjAlMZB6uXNTfvj3b9vg3gdFNgUQPGfyCbjSp51zbj1DtDUf
	ZjhuZVqHtZUcqLZbFThMCPsY5zK/aJ3WXndEd7hP4OxuJTEM55rjMY4KMg2bFxvvHz6wsE
	N9v3mPnUudrr0MrxZTNc1yl0Htt+qivGdQJImDDVV7QN/OKhjJMU+C93JgoYjKHuK5xZ6E
	cCzobMUk50hG/fjlycbXB22hdFz/Ih2wozkyllmdvsLBgk3kP7tJ+RO+prCUDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685479184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ulmrcImbtRvzqGgwE3a2VNEOCnRPGxt2UYSBYI3GTxQ=;
	b=OCsvGQbDF6UOTjQKlqYKNmvbthDBtxG8seNlKDn/Ru8sYGzf7Qdj9re6e3JcMKWoHbPnwS
	H9C/y8wZ1kg41FCA==
To: Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, LKML
 <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel
 <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama Arif
 <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com>
References: <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name> <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name> <87wn0pizbl.ffs@tglx>
 <ZHYqwsCURnrFdsVm@google.com> <87leh5iom8.ffs@tglx>
 <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com>
Date: Tue, 30 May 2023 22:39:44 +0200
Message-ID: <871qiximen.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 30 2023 at 15:03, Tom Lendacky wrote:
> On 5/30/23 14:51, Thomas Gleixner wrote:
>> That aside. From a semantical POV making this decision about parallel
>> bootup based on some magic CC encryption attribute is questionable.
>> 
>> I'm tending to just do the below and make this CC agnostic (except that
>> I couldn't find the right spot for SEV-ES to clear that flag.)
>
> Maybe in sme_sev_setup_real_mode() in arch/x86/realmode/init.c? You could 
> clear the flag within the CC_ATTR_GUEST_STATE_ENCRYPT check.

Eeew.

Can we please have a AMD SEV-ES init specific place and not hijack some
random code which has to check CC_ATTR_GUEST_STATE_ENCRYPT?

Thanks,

        tglx

