Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F2715D64
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541119.843513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xfh-0007Ta-Lq; Tue, 30 May 2023 11:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541119.843513; Tue, 30 May 2023 11:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xfh-0007RC-I4; Tue, 30 May 2023 11:37:49 +0000
Received: by outflank-mailman (input) for mailman id 541119;
 Tue, 30 May 2023 11:37:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m7B1=BT=shutemov.name=kirill@srs-se1.protection.inumbo.net>)
 id 1q3xff-0007R4-9k
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:37:47 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 649a52d8-fede-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:37:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E3DF45C017D;
 Tue, 30 May 2023 07:37:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 30 May 2023 07:37:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 07:37:42 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 177A51098DC; Tue, 30 May 2023 14:37:40 +0300 (+03)
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
X-Inumbo-ID: 649a52d8-fede-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685446663; x=
	1685533063; bh=O6qShh+asEKKf+CBp8F6HZvUgA+aseK9FX7RcXKq70E=; b=T
	PxfL1LB8q81/rUHg2XvMW3/4dxt+oSWRPKcAA/VfwYJOvqRMkuXbP9hfoQUPlVSO
	3soZ2+X/mMLCpkpE36IZk2R8xohb+JFPwPG226Er1VdHwSTvTSzW4L1L4BfMdTAl
	cyvBNn8WObkCH3dHEG0vdM9jEvph3Kqx1tVbGsUe3WZ44vXaE8v5maJ2RJe+YrSC
	GX5joEHfNuuIsxFWMg4QoCYDUUuSy4hBfDCbYL5QS75GdWcak7oLD0I/A7g5ySLZ
	97gbvYvfHV4/mUcIJk6wxGA0aOki4z2l3aOHQ/J9CG6pEcuQByuQm5NukOQOPZXq
	vPq3NVhuEDvhWnhHty/kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685446663; x=1685533063; bh=O6qShh+asEKKf
	+CBp8F6HZvUgA+aseK9FX7RcXKq70E=; b=l0ULuSdSAZxz4Id4NCjNDvSuSOjMi
	QqSMBgGatnuAwLmz3fq+W4g/oun3yPwfK//TkFcZ6Qq+DMdNuFKSZkR/czNaanZ3
	gznyzrlaJqmjlULYXIN7dHt3y127wCGCkXO0rr+NHuFgCc4N3xN5GwyOadZlstUV
	a3o1mniuANA9XqsFbG+jwBgNe/OGqk/sN44MUk+0RSsbIyYvHHYSTkvoRnOn6SeF
	rv4hWOEyn4GZwmVgc+SFsnrI01HOSbZcYCrd6IFT0pqXMDUW4Vmh2gZ04tO5eISK
	EoKkp0YR75uKBoU43kRStRyPv6JkVt6WDRCdPoFTo8MuPbZ66elW67kDQ==
X-ME-Sender: <xms:BuB1ZOy_Q46awEmN2n8G6kx8lsnsXgrIxRUOpUzTmTdMa1-A14ViIw>
    <xme:BuB1ZKTbzE4D__kHwieS6qeKhQFl4uQ6IxouuMedEdB1YUPeLzq8gSfMAkpVKHfMg
    QLPoAR-6feJERNRsXc>
X-ME-Received: <xmr:BuB1ZAU1H0WyeO0sWr9ctDyadG9xs8jMn7SxVF4JQokcsMi1YeZCk5CAfCZUAhfjSHSbbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:BuB1ZEh9a_Nx2KnEl0bxE_6wFFsAAHJjtQ7tVuZLckQsjbx72eMOOw>
    <xmx:BuB1ZADM9mF7NSxqOPQgVmbPy_3aGLmt_VDiuZpBghOrn8S6GDODfQ>
    <xmx:BuB1ZFJ4QwIW-3zwUMfEScRRvHHBGJkOJozaJp0tgTSGdiBfitkTXw>
    <xmx:B-B1ZGgs54qOEGkAg2SG46XGOwz7zUTLzQh2fKV_ve3nUjRgpDEsOg>
Feedback-ID: ie3994620:Fastmail
Date: Tue, 30 May 2023 14:37:40 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,	Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
Message-ID: <20230530113740.lbvg4to747xo32a7@box.shutemov.name>
References: <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
 <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzwqjeey.ffs@tglx>

On Tue, May 30, 2023 at 12:34:45PM +0200, Thomas Gleixner wrote:
> On Tue, May 30 2023 at 11:26, Thomas Gleixner wrote:
> > On Tue, May 30 2023 at 03:54, Kirill A. Shutemov wrote:
> >> On Mon, May 29, 2023 at 11:31:29PM +0300, Kirill A. Shutemov wrote:
> >>> Disabling parallel bringup helps. I didn't look closer yet. If you have
> >>> an idea let me know.
> >>
> >> Okay, it crashes around .Lread_apicid due to touching MSRs that trigger #VE.
> >>
> >> Looks like the patch had no intention to enable parallel bringup on TDX.
> >>
> >> +        * Intel-TDX has a secure RDMSR hypercall, but that needs to be
> >> +        * implemented seperately in the low level startup ASM code.
> >>
> >> But CC_ATTR_GUEST_STATE_ENCRYPT that used to filter it out is
> >> SEV-ES-specific thingy and doesn't cover TDX. I don't think we have an
> >> attribute that fits nicely here.
> >
> > Bah. That sucks.
> 
> Can we have something consistent in this CC space or needs everything to
> be extra magic per CC variant?

IIUC, CC_ATTR_GUEST_MEM_ENCRYPT should cover all AMD SEV flavours and
Intel TDX. But the name is confusing in this context: memory encryption
has nothing to do with the APIC.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

