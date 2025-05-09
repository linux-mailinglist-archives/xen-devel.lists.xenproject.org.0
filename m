Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8558AB1F5A
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 23:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980385.1366844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVbH-0002dZ-JO; Fri, 09 May 2025 21:49:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980385.1366844; Fri, 09 May 2025 21:49:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVbH-0002ah-GY; Fri, 09 May 2025 21:49:47 +0000
Received: by outflank-mailman (input) for mailman id 980385;
 Fri, 09 May 2025 21:49:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdUm=XZ=kernel.org=wei.liu@srs-se1.protection.inumbo.net>)
 id 1uDVbF-0002ab-PV
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 21:49:45 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837951b9-2d1f-11f0-9eb5-5ba50f476ded;
 Fri, 09 May 2025 23:49:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 707854410B;
 Fri,  9 May 2025 21:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02004C4CEE4;
 Fri,  9 May 2025 21:49:40 +0000 (UTC)
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
X-Inumbo-ID: 837951b9-2d1f-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746827381;
	bh=SiJ264L76W+iNGxah+QR+bqOGeUBSZ7lji/MNG6Rk4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYAhK1H/3ajc/630iBxlSZwFpfs7YQjH28MoAy/PNXdDe5ceNI2Ycnxt1dn+GTZ7d
	 Q3lsLH2TxYfYHz+IrJ3qB14PQJo3sJspgtFfVNbI8W2CuG4oyBhBZo1LP2UragiUPj
	 05tToUJo/K4GRvFE3hrbtcl3cCcwJhJZC4jMwKYPF//w+q7XKUk9iIZy2B6/5BbqAG
	 M+Q4oMqDgbf7hrL7a1JZuLFLOXpo9VdqQytFBt5g+A+xD4/yEJFMVJhJlxUAT4iNI7
	 afH+/8ACTMWKfAKZI6z5+xaLPzbvrXLxWPccl6Lm0FzuU4aNnm+LbWIiQpfIhxEwsf
	 i5CWn2npgfs4Q==
Date: Fri, 9 May 2025 21:49:39 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, xin@zytor.com,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/6] x86/msr: minimize usage of native_*() msr access
 functions
Message-ID: <aB54c5ajYkGZ1sPi@liuwe-devbox-ubuntu-v2.tail21d00.ts.net>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506092015.1849-4-jgross@suse.com>

On Tue, May 06, 2025 at 11:20:12AM +0200, Juergen Gross wrote:
> In order to prepare for some MSR access function reorg work, switch
> most users of native_{read|write}_msr[_safe]() to the more generic
> rdmsr*()/wrmsr*() variants.
> 
> For now this will have some intermediate performance impact with
> paravirtualization configured when running on bare metal, but this
> is a prereq change for the planned direct inlining of the rdmsr/wrmsr
> instructions with this configuration.
> 
> The main reason for this switch is the planned move of the MSR trace
> function invocation from the native_*() functions to the generic
> rdmsr*()/wrmsr*() variants. Without this switch the users of the
> native_*() functions would lose the related tracing entries.
> 
> Note that the Xen related MSR access functions will not be switched,
> as these will be handled after the move of the trace hooks.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/hyperv/ivm.c      |  2 +-

Acked-by: Wei Liu <wei.liu@kernel.org>

> 
> diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
> index 09a165a3c41e..fe177a6be581 100644
> --- a/arch/x86/hyperv/ivm.c
> +++ b/arch/x86/hyperv/ivm.c
> @@ -319,7 +319,7 @@ int hv_snp_boot_ap(u32 cpu, unsigned long start_ip)
>  	asm volatile("movl %%ds, %%eax;" : "=a" (vmsa->ds.selector));
>  	hv_populate_vmcb_seg(vmsa->ds, vmsa->gdtr.base);
>  
> -	vmsa->efer = native_read_msr(MSR_EFER);
> +	rdmsrq(MSR_EFER, vmsa->efer);
>  

