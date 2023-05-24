Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C870FF73
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 22:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539213.839858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vPO-0003Ug-SO; Wed, 24 May 2023 20:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539213.839858; Wed, 24 May 2023 20:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1vPO-0003St-Pf; Wed, 24 May 2023 20:48:34 +0000
Received: by outflank-mailman (input) for mailman id 539213;
 Wed, 24 May 2023 20:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7M2=BN=shutemov.name=kirill@srs-se1.protection.inumbo.net>)
 id 1q1vPN-0003Sn-5w
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 20:48:33 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55f7fe42-fa74-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 22:48:30 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 564803200B1C;
 Wed, 24 May 2023 16:48:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 24 May 2023 16:48:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 May 2023 16:48:21 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 49820109F9F; Wed, 24 May 2023 23:48:18 +0300 (+03)
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
X-Inumbo-ID: 55f7fe42-fa74-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1684961303; x=
	1685047703; bh=GIQrYXVIJfghlyJeZVTwMC4NvSXNZTZ81GeVUDK35vA=; b=t
	V78D8AQWQriaLyjLryKXcRouM18sDnenIWh1Yu+0MLtrKqbfxYSkYAP7Ah45z0C0
	wqrRshdZnP8Fzs3Y74J2dEDBmVYWYkp0Dr1xsrl5u5j90fMLI6BY4GxnFIanI2ra
	ZHoNHyFdoiSeY0hssG0uaEFpYzR9Lz3q64/uyyqR22r9Bp9R7utjmhCAN40FS5yl
	LMsNTY7sC/uKblPAscJfx1OowRzqDWvUUksw9EcLsmJ5dxmskbo1njKOtT/uAEJb
	p8CBABZQSKnGrDpi9R3ukiBCGNRVKr8j1xz53Ydve6A5EMl4OC/qVLH06zs0pCt+
	L7IqaBqFdMvHDowOKkSCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684961303; x=1685047703; bh=GIQrYXVIJfghl
	yJeZVTwMC4NvSXNZTZ81GeVUDK35vA=; b=YXeLdPNcTaSCsiCsBeJv2f5p9SuP4
	8PNIAd5OHvvHh0zi0J6sHQ2iDxJi3KUZPgxTwHgsCiBnsG4iFJMa5e9VSO/9SRsp
	1uf6gxH+qkDhvA2KvyiORL0inPnSLCOCJ7W/hgwUyUdJI1MHVbrXnbq8uhCmMqay
	QCl1ZWzVXrCzb30GT0XC1Wta3d7Y3WxRKULau+sNOAow3o6ZJP+eHzUVYtEPFdUO
	SEJPLcn5mgVKhWahWT0mp2x4brRIS3jKZQ5jeti0GnxZf5j3AV7cUWQLho6bY9Hg
	bJgTAAYblxZs0e6yU12BJKusEGvIJR9TETpkuLHQittJSabdfnNE4zZlw==
X-ME-Sender: <xms:FnhuZDTH2VncK0GAbUd4QSuubawcVJEemEMmfWagwDdFrmymqbynRw>
    <xme:FnhuZEylmO4WOFyEi63qXNPS7KmYBZh0Oi4Ko1ah2WyXbPpIb5vWyfJ0rtnlScPMf
    YwGNKBrFecAJTAStLU>
X-ME-Received: <xmr:FnhuZI0B8fy9Ol2lnVR91k-mp_zuw1fzrmbcod9KqT-pVjgXEb11Z3-99qaxPUeQ45cz-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejhedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttddttddttddvnecuhfhrohhmpedfmfhi
    rhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrd
    hnrghmvgeqnecuggftrfgrthhtvghrnhephfeigefhtdefhedtfedthefghedutddvueeh
    tedttdehjeeukeejgeeuiedvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:FnhuZDDD4TIO_TlTLMdLlTBKIBaI4Z9lylnIe3wBeaO4FVJJxTQ0FA>
    <xmx:FnhuZMj_AEyzunCa7U0nUvY822b_W_v3y-MdIwmWBPCWgqMitbF1og>
    <xmx:FnhuZHo0gf_JVrLFUK-EgR8w02dXTQBT2P7OqLOR94f80xY3JTy1xg>
    <xmx:F3huZHB2sQNsFiPjk9M0j2hsG8Xww7Nt8oC4qQnHLKoB8ZE2QQW6hQ>
Feedback-ID: ie3994620:Fastmail
Date: Wed, 24 May 2023 23:48:18 +0300
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
Message-ID: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508185218.962208640@linutronix.de>

On Mon, May 08, 2023 at 09:44:17PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Make the primary thread tracking CPU mask based in preparation for simpler
> handling of parallel bootup.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> 
> 
> ---
>  arch/x86/include/asm/apic.h     |    2 --
>  arch/x86/include/asm/topology.h |   19 +++++++++++++++----
>  arch/x86/kernel/apic/apic.c     |   20 +++++++++-----------
>  arch/x86/kernel/smpboot.c       |   12 +++---------
>  4 files changed, 27 insertions(+), 26 deletions(-)
> ---
> 

...

> @@ -2386,20 +2386,16 @@ bool arch_match_cpu_phys_id(int cpu, u64
>  }
>  
>  #ifdef CONFIG_SMP
> -/**
> - * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
> - * @apicid: APIC ID to check
> - */
> -bool apic_id_is_primary_thread(unsigned int apicid)
> +static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
>  {
> -	u32 mask;
> -
> -	if (smp_num_siblings == 1)
> -		return true;
>  	/* Isolate the SMT bit(s) in the APICID and check for 0 */
> -	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
> -	return !(apicid & mask);
> +	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
> +
> +	if (smp_num_siblings == 1 || !(apicid & mask))
> +		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
>  }
> +#else
> +static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
>  #endif
>  
>  /*

This patch causes boot regression on TDX guest. The guest crashes on SMP
bring up.

The change makes use of smp_num_siblings earlier than before: the mask get
constructed in acpi_boot_init() codepath. Later on smp_num_siblings gets
updated in detect_ht().

In my setup with 16 vCPUs, smp_num_siblings is 16 before detect_ht() and
set to 1 in detect_ht().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

