Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EE2728C5D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 02:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545508.851989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7PwM-0004S0-7T; Fri, 09 Jun 2023 00:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545508.851989; Fri, 09 Jun 2023 00:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7PwM-0004PP-4W; Fri, 09 Jun 2023 00:25:18 +0000
Received: by outflank-mailman (input) for mailman id 545508;
 Thu, 08 Jun 2023 23:34:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KhJ2=B4=linux.intel.com=yunhong.jiang@srs-se1.protection.inumbo.net>)
 id 1q7P8t-0005aS-KW
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 23:34:12 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4c77fff-0654-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 01:34:06 +0200 (CEST)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 16:34:03 -0700
Received: from yjiang5-mobl.amr.corp.intel.com (HELO localhost)
 ([10.144.161.97])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 16:34:03 -0700
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
X-Inumbo-ID: f4c77fff-0654-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686267246; x=1717803246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sN7dvQMQ+/TpXG6CIcwf0XKyIcjODwPRfKZrLnuiPSY=;
  b=W6Eb4O2hS3W67gc5Deu1Phca8nByLkStwMEpSAfK10zpuoqhYmxnWQLq
   o79Dj6Fa+/GiIIb7e7mIVoKDaN5fKsvNfhnWfMBvOpuA1aXPMJJtT7z3t
   3q5PsEHkiySrRqb28J//oJ3o85hrr2u/EIXJMP1fQWzEdzDbMEFzvP6Z9
   AMaSGmJvWASebkjo/2xrkHVTlGE/fv1byoHx9jNS4EBQaIEy5ddH2V2cr
   NgAhDouXQqx776x04+lBmJ5x7ywxA4VPTBcrnA9CQFeB7S3bCsOIjalem
   cdWL4vXCyndyxw/47bGVGFkh4agjSDO5Rg18txKEMApc0GP6hKge31YeN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337097732"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="337097732"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="822822455"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="822822455"
Date: Thu, 8 Jun 2023 16:34:02 -0700
From: Yunhong Jiang <yunhong.jiang@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
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
Message-ID: <20230608233402.GA3430@yjiang5-mobl.amr.corp.intel.com>
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
One possibly dumb question and hope get some hints. The LOAD_REALMODE_ESP is
defined under .code16 directive and will be used by 32-bit mode caller also. Is
it ok because the instructions there will be same for both 16-bit and 32-bit? I
checked
https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_16.html#SEC205 and
don't find much information there.


