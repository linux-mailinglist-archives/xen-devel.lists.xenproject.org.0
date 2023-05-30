Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A52715A0C
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541030.843313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vdC-0000DJ-BA; Tue, 30 May 2023 09:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541030.843313; Tue, 30 May 2023 09:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vdC-0000Ae-6v; Tue, 30 May 2023 09:27:06 +0000
Received: by outflank-mailman (input) for mailman id 541030;
 Tue, 30 May 2023 09:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q3vdA-0000AD-O0
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:27:04 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23103748-fecc-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:27:03 +0200 (CEST)
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
X-Inumbo-ID: 23103748-fecc-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685438823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1NMbaaXeWKdobW1XvAcSDK/dQsnYJNRF0z8NSxF7l9g=;
	b=3WlfyRf4MaHC/vnZ5XtmVOPXOLK+ZAlD6lhDlx3nxtYIx2aAF4vsyl4Fynj3non8rbgMrN
	sNrp+9JQLFYFbN/XqXCv9byGDKlv0RHWDCZwas9ku3sVJVgKghH6SR2F8V6+xNDQOkLcyD
	5qqJAyewlvw6f3Z/VcU7uuPM8NAolzMZEkhAvRU0VhntTSbYmIp8ge4zTpPWzrBil5oYlf
	DgeSLbc5m4g4ajmFKq5V5ym/tqWGbgOPaXXQPMUx1NtL/3KwVT8w9aL6e8LA+TS2nYZbmJ
	Q7LfBFEK9KhVtex48u51MPzAYtklC43xcJIdIGSYeuPXzECaBk3uOeXt5h/Wqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685438823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1NMbaaXeWKdobW1XvAcSDK/dQsnYJNRF0z8NSxF7l9g=;
	b=GRvc8oucVrh5HH/FHNK9eWoRJUeKKRlfRG0kkGtIqetJQ9TTAPtqn+q5w5PfQy3yr3tFYY
	syTijd9671JLttAA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
Date: Tue, 30 May 2023 11:26:52 +0200
Message-ID: <87mt1mjhk3.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 30 2023 at 03:54, Kirill A. Shutemov wrote:
> On Mon, May 29, 2023 at 11:31:29PM +0300, Kirill A. Shutemov wrote:
>> Disabling parallel bringup helps. I didn't look closer yet. If you have
>> an idea let me know.
>
> Okay, it crashes around .Lread_apicid due to touching MSRs that trigger #VE.
>
> Looks like the patch had no intention to enable parallel bringup on TDX.
>
> +        * Intel-TDX has a secure RDMSR hypercall, but that needs to be
> +        * implemented seperately in the low level startup ASM code.
>
> But CC_ATTR_GUEST_STATE_ENCRYPT that used to filter it out is
> SEV-ES-specific thingy and doesn't cover TDX. I don't think we have an
> attribute that fits nicely here.

Bah. That sucks.

