Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1392728C5C
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 02:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545525.851997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7PwM-0004Yh-HE; Fri, 09 Jun 2023 00:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545525.851997; Fri, 09 Jun 2023 00:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7PwM-0004S3-CV; Fri, 09 Jun 2023 00:25:18 +0000
Received: by outflank-mailman (input) for mailman id 545525;
 Fri, 09 Jun 2023 00:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y/AC=B5=linux.intel.com=yunhong.jiang@srs-se1.protection.inumbo.net>)
 id 1q7PuD-0003ox-Px
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 00:23:06 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca83634d-065b-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 02:23:02 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 17:22:59 -0700
Received: from yjiang5-mobl.amr.corp.intel.com (HELO localhost)
 ([10.144.161.97])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 17:22:57 -0700
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
X-Inumbo-ID: ca83634d-065b-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686270182; x=1717806182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hfORcgQzuOPbSklLPJdOW8LVCo5d5Go2LF+sADUuhiU=;
  b=jMUdpbiwVMO+e60NkyZAr1CNJI9PrbStuflucU5ezMfmnjJ2HGSbMvTm
   PxYOgeICo1Tasf9osuP3KBxTp610pNOlGeTp6/mQ7PNp4rcONhtu9fQBH
   niVrIhJ1duaWarqTz+yYrrp8mJjD9wZy6B9VUpoGNo0Xb9Fo2qlMV+J3S
   gUxS1un9zo9RDZHB33tkoxmjPFzxbn0D38E/57N03ovEYr/gNbtrk/KiX
   8JHL2rpgLoCbq2lnk1xbY8fiLBNnLxCt3RchTT68CdGpQzdOSlaztZoQF
   DsNWF5WT3W/IO/upreRrWiO/Ac3z61mnsVUWchlyOB92WPqSeS0GPX1ja
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="421061870"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="421061870"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="884393196"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="884393196"
Date: Thu, 8 Jun 2023 17:22:57 -0700
From: Yunhong Jiang <yunhong.jiang@linux.intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Message-ID: <20230609002257.GA3661@yjiang5-mobl.amr.corp.intel.com>
References: <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx>
 <20230608233402.GA3430@yjiang5-mobl.amr.corp.intel.com>
 <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>

On Fri, Jun 09, 2023 at 12:57:46AM +0100, Andrew Cooper wrote:
> On 09/06/2023 12:34 am, Yunhong Jiang wrote:
> > On Tue, May 30, 2023 at 12:46:22PM +0200, Thomas Gleixner wrote:
> >> The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
> >> work when invoked from the 64bit trampoline entry point:
> >>
> >> trampoline_start64
> >>   trampoline_compat
> >>     LOAD_REALMODE_ESP <- lock
> > One possibly dumb question and hope get some hints.
> 
> There's a phrase.  "The only dumb question is the one not asked".
> 
> If you have this question, there's an excellent chance that someone else
> reading this thread has the same question.
> 
> >  The LOAD_REALMODE_ESP is
> > defined under .code16 directive and will be used by 32-bit mode caller also. Is
> > it ok because the instructions there will be same for both 16-bit and 32-bit? I
> > checked
> > https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_16.html#SEC205 and
> > don't find much information there.
> 
> The position of the LOAD_REALMODE_ESP .macro itself doesn't matter. 
> It's just some text which gets pasted elsewhere.  Imagine it just the
> same as running the C preprocessor on a file before compiling it.
> 
> As you note, some expansions of the macro are in .code16, and some are
> not.  This does result in different bytes being emitted.  The default
> operands size flips between .code16 and .code32, so there will be some
> 0x66 prefixes in one mode, and not in others.
> 
> The important point is the l suffix on btsl, which forces it to be long
> (32bit) irrespective of the default operand size.
> 
> So yes, it will work, but that's because gas is handling the differing
> encodings automatically based on the default operand size where the
> LOAD_REALMODE_ESP gets expanded.
> 
> Hope this helps,
Thank you for the explaination, it's quite clear now.
> 
> ~Andrew

