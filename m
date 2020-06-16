Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F3A1FC0F7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 23:25:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlJ4h-0000rf-Pd; Tue, 16 Jun 2020 21:24:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jlJ4g-0000ra-MM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 21:24:54 +0000
X-Inumbo-ID: d1d0d132-b017-11ea-bca7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1d0d132-b017-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 21:24:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A02A2080D;
 Tue, 16 Jun 2020 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592342693;
 bh=8GZ3guWEpsb/L9wBXSoQdxYJ5sSygFGBEriRoxmrgUc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=soWQJSDHCE1ry72/QQH5eTg7/uZGgcwqhnqbSE/cplqrOEkkEo4BIPR2n1tYQReu0
 yrCRnZOsaoWqnm4d+pp5xKNQSfOHq2IY8+WXWa0IMZXI9rnQEP9OGQ6w0ChGP146b1
 e7wxYBx4395qsDyqPPCfazLx78TdCy+8kiqUgWWo=
Date: Tue, 16 Jun 2020 14:24:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
In-Reply-To: <20200616175913.7368-2-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 security@xenproject.org, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 16 Jun 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Some CPUs can speculate past a RET instruction and potentially perform
> speculative accesses to memory before processing the return.
> 
> There is no known gadget available after the RET instruction today.
> However some of the registers (such as in check_pending_guest_serror())
> may contain a value provided the guest.
                              ^ by


> In order to harden the code, it would be better to add a speculation
> barrier after each RET instruction. The performance is meant to be
> negligeable as the speculation barrier is not meant to be archicturally
> executed.
> 
> Note that on arm32, the ldmia instruction will act as a return from the
> function __context_switch(). While the whitepaper doesn't suggest it is
> possible to speculate after the instruction, add preventively a
> speculation barrier after it as well.
> 
> This is part of the work to mitigate straight-line speculation.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I did a compile-test on the patch too.


> ---
> 
> I am still unsure whether we preventively should add a speculation barrier
> preventively after all the RET instructions in arm*/lib/. The smc call be
> taken care in a follow-up patch.

SMC is great to have but it seems to be overkill to do the ones under
lib/.


> ---
>  xen/arch/arm/arm32/entry.S | 1 +
>  xen/arch/arm/arm64/entry.S | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
> index b228d44b190c..bd54fc43558b 100644
> --- a/xen/arch/arm/arm32/entry.S
> +++ b/xen/arch/arm/arm32/entry.S
> @@ -442,6 +442,7 @@ ENTRY(__context_switch)
>  
>          add     r4, r1, #VCPU_arch_saved_context
>          ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
> +        sb
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index 175ea2981e72..b37d8fe09dc2 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -522,6 +522,7 @@ abort_guest_exit_end:
>          cset    x19, ne
>  
>          ret
> +        sb
>  ENDPROC(check_pending_guest_serror)
>  
>  /*
> @@ -583,6 +584,7 @@ ENTRY(__context_switch)
>          ldr     lr, [x8]
>          mov     sp, x9
>          ret
> +        sb
>  
>  /*
>   * Local variables:
> -- 
> 2.17.1
> 

