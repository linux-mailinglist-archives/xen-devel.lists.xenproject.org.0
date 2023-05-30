Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20071686A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 18:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541259.843832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41mE-0001P9-Kz; Tue, 30 May 2023 16:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541259.843832; Tue, 30 May 2023 16:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41mE-0001MR-Hz; Tue, 30 May 2023 16:00:50 +0000
Received: by outflank-mailman (input) for mailman id 541259;
 Tue, 30 May 2023 16:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q41mD-000149-1l
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 16:00:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2467e5e0-ff03-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 18:00:48 +0200 (CEST)
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
X-Inumbo-ID: 2467e5e0-ff03-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685462447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m93yS995VjAenJm1Tq30bXHcCehNtX8a6hAD3sks2W4=;
	b=AfBAWRGV89Mc653n/xLqy7vteib+6M5/l2mZj+wR8AGKO3PMoCQnprQPz2JjGFxvFh3npR
	75LwJDM0EE4g+P7BnJV6fDBo0D5A2wsMq2qcoO+Epgc1++GT/hm/IsyZQlfl88sd3wNdLj
	HacEZyX2iikiKMUlVpHMaBRfI2+ABpbUurQzM9ir/bGUnTaJbVHwLys+6ejBpuK/Ql2gfK
	8t5edlP2m1H7BWSDdUEp+QUPxhedXZYO6JcbMtV5DS0rwT2VI36zKlSE9ot+0iGtjPkQ+7
	L4moXOZFPonmdPVRaj68CTj/NyhRRfgqXsWZ04Esn64uoqL2rtpo8bp2DKqCyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685462447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m93yS995VjAenJm1Tq30bXHcCehNtX8a6hAD3sks2W4=;
	b=kHOcw6J0QHtLvp0yEL0d0xC3npNrA5vZH/XdZXuEI3If84/jq/yLIElk56Kjr2Nz9yF9mV
	nI3pJZIHdR0bsSDw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Tom Lendacky
 <thomas.lendacky@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, Russell King
 <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
References: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx> <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name> <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
Date: Tue, 30 May 2023 18:00:46 +0200
Message-ID: <87wn0pizbl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
>> The decision to allow parallel bringup of secondary CPUs checks
>> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
>> parallel bootup because accessing the local APIC is intercepted and raises
>> a #VC or #VE, which cannot be handled at that point.
>> 
>> The check works correctly, but only for AMD encrypted guests. TDX does not
>> set that flag.
>> 
>> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
>> definitely works for both AMD and Intel.
>
> It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> we want it.

Right. Did not think about that.

But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
SEV-ES traps RDMSR if I'm understandig that maze correctly.

Thanks,

        tglx

