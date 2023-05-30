Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DAD715CC3
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541105.843484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xHg-0003lv-CX; Tue, 30 May 2023 11:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541105.843484; Tue, 30 May 2023 11:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xHg-0003ix-7n; Tue, 30 May 2023 11:13:00 +0000
Received: by outflank-mailman (input) for mailman id 541105;
 Tue, 30 May 2023 11:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m7B1=BT=shutemov.name=kirill@srs-se1.protection.inumbo.net>)
 id 1q3xHe-0003ir-KF
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:12:58 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5bc31e-feda-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 13:12:55 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E5085C010B;
 Tue, 30 May 2023 07:12:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 30 May 2023 07:12:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 07:12:51 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 3A8FC10CE6B; Tue, 30 May 2023 14:12:48 +0300 (+03)
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
X-Inumbo-ID: ec5bc31e-feda-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685445173; x=
	1685531573; bh=jzxR1ScglUhfxqqGJjgvOS5NAqJpfFc/FG469x51F+w=; b=z
	Gm7H8q2xAwH65t7g76y5CpNRNA5QhcTT9CVh8xcZZdtfZF7xTv87d7VZCAAC/TEk
	ggEOsQ0d0JIIol5LaBUgMQPQGyyrsBk+MQRBvYZ8pzb0V1hZ+o8+a0kCFt4nMBVi
	DLzwKpOEDjkVtg8s4OlRz2e20pJZ/fwWcSqsVwRSlWLupRb6L8t3scy1jBdt+w58
	H4dOxL5cdxo5A2z1zjta/UDnxuIDN5al4owNBMvK5avlfyNWjfjgnHrYuUWsxjca
	YIUFnkT6n2B1y7mZnyFLTJy4jGY7MofSeCiX3Ash7A71fm447OX0Nrg2/sSqQhHc
	7lxckU497HvK26OalRNAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685445173; x=1685531573; bh=jzxR1ScglUhfx
	qqGJjgvOS5NAqJpfFc/FG469x51F+w=; b=IGCHqhWWcbyh6MB/CW4j9E5nOLkNc
	MB5S7AG5+9Uao8lFbpTrQFWDCxAgeAz50TkB7sSIqfCZe4GJqucU4q2of+fNzkAZ
	ozqucMxrSsKk8D4vwBp0M3nOXWfV55tZ+BwneK280TDjbxLiTaJ04HPIW2zPIAzi
	QzLxwlWrF7USZaAaKKXFYwDt4taOmxnalJUHUqeeb5tBFH5OcyG/0aW3BAk2IrsU
	OTU0Fx6sm6GJ4r1ZrQShU6ReUHcyoxDjL+s0xU4PF/zfeUk6T4mjxgMP+QeS1d22
	+L+cEp2vpyKyphRpU18a5qW3k8RyRCCLLIP2NVTJQFY/VyVoSdg5pTTFA==
X-ME-Sender: <xms:M9p1ZLUzh5h-xIjt6EAne-fkiWy-kfD7ehnMMU_n6uQ0E_sH7qrIXw>
    <xme:M9p1ZDm-11Kzq75g9bzZ4p8Bi8CqYoAD14uu63oHoN1nDRaGTkH9tbS6Rn2eXj1TR
    VcIvL-6SC1XJjuj0OE>
X-ME-Received: <xmr:M9p1ZHaMr9z-1bjaM9Y_FvwiQDZ_vreipQ5XsEQ_ONZ948J3EC_eQlPIq8aNlT8QB7lFHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:M9p1ZGU-nMSgIfCHDflrZ16Mmf4jTfAlm-Zv1KLq8HvnripwLe3DCg>
    <xmx:M9p1ZFkT9W3_xU5ax-ZWYNbzzY95_f0M5iBw8JZc7bVNl4xwOKbMPQ>
    <xmx:M9p1ZDfPrYWia5RjOy_0Tv69hBZV6AtJ3i_LBbPY9C8gWBh8gDMEvg>
    <xmx:Ndp1ZImdm_XgLH-WrJ7Wtzk8AriLHd8rHSyyZMbNAkgODwQ0ohRd5A>
Feedback-ID: ie3994620:Fastmail
Date: Tue, 30 May 2023 14:12:48 +0300
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
Subject: Re: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Message-ID: <20230530111248.lzt77sydi7x3wau7@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6rujdvl.ffs@tglx>

On Tue, May 30, 2023 at 12:46:22PM +0200, Thomas Gleixner wrote:
> The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
> work when invoked from the 64bit trampoline entry point:
> 
> trampoline_start64
>   trampoline_compat
>     LOAD_REALMODE_ESP <- lock
> 
> Accessing tr_lock is only possible from 16bit mode. For the compat entry
> point this needs to be pa_tr_lock so that the required relocation entry is
> generated. Otherwise it locks the non-relocated address which is
> aside of being wrong never cleared in secondary_startup_64() causing all
> but the first CPU to get stuck on the lock.
> 
> Make the macro take an argument lock_pa which defaults to 0 and rename it
> to LOCK_AND_LOAD_REALMODE_ESP to make it clear what this is about.
> 
> Fixes: f6f1ae9128d2 ("x86/smpboot: Implement a bit spinlock to protect the realmode stack")
> Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

