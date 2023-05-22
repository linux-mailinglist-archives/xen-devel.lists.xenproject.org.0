Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496870BB95
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 13:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537863.837452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q13YT-00023I-0R; Mon, 22 May 2023 11:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537863.837452; Mon, 22 May 2023 11:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q13YS-00020g-Tw; Mon, 22 May 2023 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 537863;
 Mon, 22 May 2023 11:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eYX=BL=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1q13YP-00020a-J1
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 11:18:18 +0000
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5814b7f9-f892-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 13:18:15 +0200 (CEST)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59006)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q13XQ-0006UY-2o; Mon, 22 May 2023 12:17:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q13XE-0007tn-CU; Mon, 22 May 2023 12:17:04 +0100
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
X-Inumbo-ID: 5814b7f9-f892-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cQTiKEc/43ERh/RUjjvIJQkEsJdOq6qRkauNBfX0QXQ=; b=p9m/ILtgZZh20NKGMrXp1m9S79
	L3gjgt3hqJWh343H0TOYKs01/G2BPEuhvFC4TMuRPeU+MY+G/63vgoqDRNSKM39yVvKzOTaMjmZFK
	7LM8lsFJeYjGWosrrrGG5miTPAuK0YTizFt0WQTN+y4vi/M34EkH3zTVqOfVyGhSWIOf8ow6+E///
	7SsMn4KhRSRjr9A7KCnECWwdnNE+HTrXL6yLyaObfuKu+fRhMgUnrXcHYHyRgw+uyKRbUhZTX2eMd
	dspexsNkPMSmOqiOaZOzjcHaV7Or01naZ8gCOX7wKpbxrnL7eOBmMEZkr02uGpGm9yxIp2RZVNEOy
	4Up4YdGA==;
Date: Mon, 22 May 2023 12:17:04 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tglx@linutronix.de, James.Bottomley@hansenpartnership.com,
	arjan@linux.intel.com, arnd@arndb.de, boris.ostrovsky@oracle.com,
	brgerst@gmail.com, catalin.marinas@arm.com, deller@gmx.de,
	dwmw2@infradead.org, gpiccoli@igalia.com, guoren@kernel.org,
	jgross@suse.com, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, lucjan.lucjanov@gmail.com,
	mark.rutland@arm.com, mikelley@microsoft.com,
	oleksandr@natalenko.name, palmer@dabbelt.com,
	paul.walmsley@sifive.com, paulmck@kernel.org, pbonzini@redhat.com,
	pmenzel@molgen.mpg.de, ross.philipson@oracle.com,
	sabrapan@amazon.com, seanjc@google.com, thomas.lendacky@amd.com,
	tsbogend@alpha.franken.de, usama.arif@bytedance.com,
	will@kernel.org, x86@kernel.org, xen-devel@lists.xenproject.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] x86/apic: Fix use of X{,2}APIC_ENABLE in asm with older
 binutils
Message-ID: <ZGtPMHJM/TfklT+2@shell.armlinux.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230522105738.2378364-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522105738.2378364-1-andrew.cooper3@citrix.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

Please can you tell me what the relevance of this patch is to me, and
thus why I'm included in the Cc list? I have never touched this file,
not in its current path nor a previous path according to git.

Thanks.

On Mon, May 22, 2023 at 11:57:38AM +0100, Andrew Cooper wrote:
> "x86/smpboot: Support parallel startup of secondary CPUs" adds the first use
> of X2APIC_ENABLE in assembly, but older binutils don't tolerate the UL suffix.
> 
> Switch to using BIT() instead.
> 
> Fixes: 7e75178a0950 ("x86/smpboot: Support parallel startup of secondary CPUs")
> Reported-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  arch/x86/include/asm/apicdef.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
> index bf546dfb6e58..4b125e5b3187 100644
> --- a/arch/x86/include/asm/apicdef.h
> +++ b/arch/x86/include/asm/apicdef.h
> @@ -2,6 +2,8 @@
>  #ifndef _ASM_X86_APICDEF_H
>  #define _ASM_X86_APICDEF_H
>  
> +#include <linux/bits.h>
> +
>  /*
>   * Constants for various Intel APICs. (local APIC, IOAPIC, etc.)
>   *
> @@ -140,8 +142,8 @@
>  #define APIC_BASE (fix_to_virt(FIX_APIC_BASE))
>  #define APIC_BASE_MSR		0x800
>  #define APIC_X2APIC_ID_MSR	0x802
> -#define XAPIC_ENABLE	(1UL << 11)
> -#define X2APIC_ENABLE	(1UL << 10)
> +#define XAPIC_ENABLE		BIT(11)
> +#define X2APIC_ENABLE		BIT(10)
>  
>  #ifdef CONFIG_X86_32
>  # define MAX_IO_APICS 64
> 
> base-commit: 0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
> -- 
> 2.30.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

