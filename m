Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31E2DDBD9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56227.98306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2dn-0003P0-WA; Thu, 17 Dec 2020 23:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56227.98306; Thu, 17 Dec 2020 23:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2dn-0003Ob-Sd; Thu, 17 Dec 2020 23:24:59 +0000
Received: by outflank-mailman (input) for mailman id 56227;
 Thu, 17 Dec 2020 23:24:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2dm-0003OV-Ft
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:24:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ff1c2d5-9da5-4ae5-aed4-47f894e3e0a0;
 Thu, 17 Dec 2020 23:24:57 +0000 (UTC)
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
X-Inumbo-ID: 1ff1c2d5-9da5-4ae5-aed4-47f894e3e0a0
Date: Thu, 17 Dec 2020 15:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608247497;
	bh=EAnYLRRwGyHq1agi3f6Usn0mIWXXHh/yRHTA4076Mxc=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=tF0JUMTSa58k3VUW5ZmbRlK75dvK1/Yc9uaNTLcqhSGNqVx34716cvknINAuw9qyo
	 hA0iiZ7cLs/WQDuM8z8YzWGxCFumADPQqoUufXPIY0qVGmWIOdpIzGMMrIP5o5Bz0j
	 j/MystMVlDFj0IZwsVZxUJCkzIE+PoTF2PmosWqt/D7XfWeHxdWJ3lnEANuU/40HCT
	 o00yJKOwOyJY2uu9Maa5t1qYyg7pRZnI5/MYsB2zJ8zZIs/rPZpMaRfvIBxNeN8597
	 MUSfPsV/HZz/fG9CDJ/XsNxoJzZDplzJ6/unaemsGo5dIkOQ8N/nkhBiSTd/2XVOsQ
	 uVgo+UXg8cong==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/8] xen/arm: Add arm64 ID registers definitions
In-Reply-To: <905822b31f5494bf20e1e2a0a56f935db0550aef.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171523290.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <905822b31f5494bf20e1e2a0a56f935db0550aef.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> Add coprocessor registers definitions for all ID registers trapped
> through the TID3 bit of HSR.
> Those are the one that will be emulated in Xen to only publish to guests
> the features that are supported by Xen and that are accessible to
> guests.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V2: Rebase
> Changes in V3:
>   Add case definition for reserved registers.
> Changes in V4:
>   Remove case definition for reserved registers and move it to the code
>   directly.
> 
> ---
>  xen/include/asm-arm/arm64/hsr.h | 37 +++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/asm-arm/arm64/hsr.h
> index ca931dd2fe..e691d41c17 100644
> --- a/xen/include/asm-arm/arm64/hsr.h
> +++ b/xen/include/asm-arm/arm64/hsr.h
> @@ -110,6 +110,43 @@
>  #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
>  #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
>  
> +/* Those registers are used when HCR_EL2.TID3 is set */
> +#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
> +#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
> +#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
> +#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
> +#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
> +#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
> +#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
> +#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
> +#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
> +#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
> +#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
> +#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
> +#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
> +#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
> +#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
> +#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
> +#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
> +#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
> +#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
> +#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
> +#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
> +#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
> +
> +#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
> +#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
> +#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
> +#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
> +#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
> +#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
> +#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
> +#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
> +#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
> +#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
> +#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
> +#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
> +
>  #endif /* __ASM_ARM_ARM64_HSR_H */
>  
>  /*
> -- 
> 2.17.1
> 

