Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9D8A030F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 00:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703665.1099436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugCh-0006D2-Up; Wed, 10 Apr 2024 22:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703665.1099436; Wed, 10 Apr 2024 22:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rugCh-0006BU-RS; Wed, 10 Apr 2024 22:14:03 +0000
Received: by outflank-mailman (input) for mailman id 703665;
 Wed, 10 Apr 2024 22:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcYN=LP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rugCf-00069p-Ua
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 22:14:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e5dbee-f787-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 00:14:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6C3FFCE1AAF;
 Wed, 10 Apr 2024 22:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76796C433C7;
 Wed, 10 Apr 2024 22:13:51 +0000 (UTC)
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
X-Inumbo-ID: a0e5dbee-f787-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712787232;
	bh=JszXjHBQ5GW6OameGhPMD+u4QZm+LdxWjTLbTcS5xfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bGAawdg1AJH+ouBqOfCL0GM6Y7eE3yYSLpe5tRpUnebfOv4Z6kqI+cBG02vdeDW8P
	 HmilV4Qrbgx38wLXjb5eW4q+nYJVS59+i8zs0RJa/G9yqqJPyz+BDqL2mlBMHGIcSI
	 p6QYDviuWsHLa2KXLLCvIsCfEAyu2K0NhDn8YZcNch5Fr/+fH1EfOumLOOTRwXoOLT
	 xwyWoc4HrH6iQITmZHX0S1qrGWC+7rKtdv0yIDiMiBljqtXGmNx5EXI4vxwalvpxLL
	 W07VLm8rmtmGwXuysVvImDRVBe++2COkRdP8E83wIvUJSD9Pvl7QWew9/Op0zuEEgG
	 DyYJvl13U3Wxg==
Date: Wed, 10 Apr 2024 15:13:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/hvm: Fix Misra Rule 19.1 regression
In-Reply-To: <20240410103721.593839-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404101513310.711344@ubuntu-linux-20-04-desktop>
References: <20240410103721.593839-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-378593374-1712787232=:711344"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-378593374-1712787232=:711344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Apr 2024, Andrew Cooper wrote:
> Despite noticing an impending Rule 19.1 violation, the adjustment made (the
> uint32_t cast) wasn't sufficient to avoid it.  Try again.
> 
> Fixes: 6a98383b0877 ("x86/HVM: clear upper halves of GPRs upon entry from 32-bit code")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/hvm/hvm.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 595253babeaf..899233fb257b 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -575,16 +575,16 @@ static inline void hvm_sanitize_regs_fields(struct cpu_user_regs *regs,
>      if ( compat )
>      {
>          /* Clear GPR upper halves, to counteract guests playing games. */
> -        regs->rbp = (uint32_t)regs->ebp;
> -        regs->rbx = (uint32_t)regs->ebx;
> -        regs->rax = (uint32_t)regs->eax;
> -        regs->rcx = (uint32_t)regs->ecx;
> -        regs->rdx = (uint32_t)regs->edx;
> -        regs->rsi = (uint32_t)regs->esi;
> -        regs->rdi = (uint32_t)regs->edi;
> -        regs->rip = (uint32_t)regs->eip;
> -        regs->rflags = (uint32_t)regs->eflags;
> -        regs->rsp = (uint32_t)regs->esp;
> +        regs->rbp = (uint32_t)regs->rbp;
> +        regs->rbx = (uint32_t)regs->rbx;
> +        regs->rax = (uint32_t)regs->rax;
> +        regs->rcx = (uint32_t)regs->rcx;
> +        regs->rdx = (uint32_t)regs->rdx;
> +        regs->rsi = (uint32_t)regs->rsi;
> +        regs->rdi = (uint32_t)regs->rdi;
> +        regs->rip = (uint32_t)regs->rip;
> +        regs->rflags = (uint32_t)regs->rflags;
> +        regs->rsp = (uint32_t)regs->rsp;
>      }
>  
>  #ifndef NDEBUG
> 
> base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
> -- 
> 2.30.2
> 
--8323329-378593374-1712787232=:711344--

