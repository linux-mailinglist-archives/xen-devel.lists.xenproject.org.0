Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B923EB69
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 12:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3zVu-0000sS-7A; Fri, 07 Aug 2020 10:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cyjX=BR=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1k3zVs-0000sN-C5
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 10:22:12 +0000
X-Inumbo-ID: 40730464-e283-4997-9115-c691fb87e740
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40730464-e283-4997-9115-c691fb87e740;
 Fri, 07 Aug 2020 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=4/VCHM/wzhSgd4qyRAmAC4AWdDxulH6gS0+92poTPxI=; b=XJSka808E+4ltstGU3BqwdVOtZ
 hXkd+8kwG+mMF3YBC9gYdFKqQ0shdnwEeGlVgLK2rKX9zQM0cV+cX2kJ4LmaDy9pbGemoN/OFohKt
 qnuXOPc82zBE1eZRt+Hlbu7DoTyuXW9ud2aYWjPMUx5Dw/3JDO4mQ3YCdTM4HEoCeY/awHrW5ttq7
 yGPXiF6gmAUlT3tKwYWzxUSDGRDD8KGANnAswpVZO8evJINZiqIYWUR2sglBnT5anAp66EWDa3CPF
 1DOFDSa4vUFlAE+qdQ+8lQ3yc5sir2LRPdpMuROK+/SSyWXy9+HBgPYjDo4knnSw2IjRdxZeDX7ZH
 TrODYMfA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3zVg-0002mK-4n; Fri, 07 Aug 2020 10:22:00 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A12A33012DC;
 Fri,  7 Aug 2020 12:21:58 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 89ED32B84E245; Fri,  7 Aug 2020 12:21:58 +0200 (CEST)
Date: Fri, 7 Aug 2020 12:21:58 +0200
From: peterz@infradead.org
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [PATCH v3 4/7] x86/paravirt: remove 32-bit support from
 PARAVIRT_XXL
Message-ID: <20200807102158.GG2674@hirez.programming.kicks-ass.net>
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-5-jgross@suse.com>
 <20200807093916.GF2674@hirez.programming.kicks-ass.net>
 <3a0712ee-efca-5684-d321-3b789e01fc16@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0712ee-efca-5684-d321-3b789e01fc16@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 07, 2020 at 12:02:59PM +0200, Jürgen Groß wrote:
> On 07.08.20 11:39, peterz@infradead.org wrote:
> > On Fri, Aug 07, 2020 at 10:38:23AM +0200, Juergen Gross wrote:
> > 
> > > -# else
> > > -	const unsigned char	cpu_iret[1];
> > > -# endif
> > >   };
> > >   static const struct patch_xxl patch_data_xxl = {
> > > @@ -42,7 +38,6 @@ static const struct patch_xxl patch_data_xxl = {
> > >   	.irq_save_fl		= { 0x9c, 0x58 },	// pushf; pop %[re]ax
> > >   	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
> > >   	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
> > > -# ifdef CONFIG_X86_64
> > >   	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
> > >   	.irq_restore_fl		= { 0x57, 0x9d },	// push %rdi; popfq
> > >   	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
> > > @@ -50,19 +45,11 @@ static const struct patch_xxl patch_data_xxl = {
> > >   				    0x48, 0x0f, 0x07 },	// swapgs; sysretq
> > >   	.cpu_swapgs		= { 0x0f, 0x01, 0xf8 },	// swapgs
> > >   	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
> > > -# else
> > > -	.mmu_write_cr3		= { 0x0f, 0x22, 0xd8 },	// mov %eax, %cr3
> > > -	.irq_restore_fl		= { 0x50, 0x9d },	// push %eax; popf
> > > -	.cpu_iret		= { 0xcf },		// iret
> > > -# endif
> > 
> > I was looking at x86_64 paravirt the other day and found we actually
> > have pv_ops.cpu.iret users there..
> 
> On x86_64 we have (without PARAVIRT_XXL):
> 
> #define INTERRUPT_RETURN        jmp native_iret
> 
> and with PARAVIRT_XXL this is basically a jmp *pv_ops.cpu.iret which
> will then be patched to either jmp native_iret or jmp xen_iret.

Ah, okay. Clearly I didn't look hard enough. Thanks!

