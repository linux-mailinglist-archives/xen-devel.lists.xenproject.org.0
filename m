Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BFC442A02
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 09:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219804.380811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpcj-0002AP-9r; Tue, 02 Nov 2021 08:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219804.380811; Tue, 02 Nov 2021 08:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpcj-00027c-55; Tue, 02 Nov 2021 08:58:29 +0000
Received: by outflank-mailman (input) for mailman id 219804;
 Tue, 02 Nov 2021 08:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TliJ=PV=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1mhpcY-00026X-2e
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 08:58:28 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf4cb180-65e7-4a4a-9f78-0583d79e47bb;
 Tue, 02 Nov 2021 08:58:15 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f62005f026b777d4e743c.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:6200:5f02:6b77:7d4e:743c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DF4561EC0399;
 Tue,  2 Nov 2021 09:58:14 +0100 (CET)
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
X-Inumbo-ID: bf4cb180-65e7-4a4a-9f78-0583d79e47bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1635843495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=1uNXrjMg71tsOxKJhJFEEkWxKIgfWGBG7bqJii3XBpE=;
	b=HEFGYp55Jr0ZE18+k8Z9i4P3QR5dpxJqyEv8zk0g8j7dshvQzAzEBxdF6AY4bOcC09Gxjy
	z22/ciISUsTjJuKnR0VVa+nLj+O5zs2S5hO2Aeu7MGti0kXOYdB+1f+JOgxg5+7TD195kf
	YhmSJURBLMPsKTRlAMH6xdkZAaPO/Ik=
Date: Tue, 2 Nov 2021 09:58:10 +0100
From: Borislav Petkov <bp@alien8.de>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Jan Beulich <jbeulich@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Juergen Gross <jgross@suse.com>, Peter Anvin <hpa@zytor.com>,
	xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V4 04/50] x86/xen: Add
 xenpv_restore_regs_and_return_to_usermode()
Message-ID: <YYD9ohN2Zcy4EdMb@zn.tnic>
References: <20211026141420.17138-1-jiangshanlai@gmail.com>
 <20211026141420.17138-5-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211026141420.17138-5-jiangshanlai@gmail.com>

On Tue, Oct 26, 2021 at 10:13:34PM +0800, Lai Jiangshan wrote:
> From: Lai Jiangshan <laijs@linux.alibaba.com>
> 
> While in the native case, PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is the
> trampoline stack.  But XEN pv doesn't use trampoline stack, so
> PER_CPU_VAR(cpu_tss_rw + TSS_sp0) is also the kernel stack.  Hence source
> and destination stacks are identical in that case, which means reusing
> swapgs_restore_regs_and_return_to_usermode() in XEN pv would cause %rsp
> to move up to the top of the kernel stack and leave the IRET frame below
> %rsp, which is dangerous to be corrupted if #NMI / #MC hit as either of
> these events occurring in the middle of the stack pushing would clobber
> data on the (original) stack.
> 
> And swapgs_restore_regs_and_return_to_usermode() pushing the IRET frame
> on to the original address is useless and error-prone when there is any
> future attempt to modify the code.
> 
> Fixes: 7f2590a110b8 ("x86/entry/64: Use a per-CPU trampoline stack for IDT entries")
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Peter Anvin <hpa@zytor.com>
> Cc: xen-devel@lists.xenproject.org>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> ---
>  arch/x86/entry/entry_64.S        |  9 ++++++---
>  arch/x86/entry/entry_64_compat.S |  7 ++++---
>  arch/x86/xen/xen-asm.S           | 27 +++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> index 9d468c8877e2..0dde5a253dda 100644
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -119,7 +119,7 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
>  	 * In the Xen PV case we must use iret anyway.
>  	 */
>  
> -	ALTERNATIVE "", "jmp	swapgs_restore_regs_and_return_to_usermode", \
> +	ALTERNATIVE "", "jmp xenpv_restore_regs_and_return_to_usermode", \

Instead of sprinkling all those ALTERNATIVE calls everywhere,
why don't you simply jump to the xenpv-one at the
swapgs_restore_regs_and_return_to_usermode label itself and have a
single ALTERNATIVE there?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

