Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C31A295BAB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 11:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10298.27350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWpv-0002Ms-P4; Thu, 22 Oct 2020 09:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10298.27350; Thu, 22 Oct 2020 09:24:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVWpv-0002MU-Lf; Thu, 22 Oct 2020 09:24:43 +0000
Received: by outflank-mailman (input) for mailman id 10298;
 Thu, 22 Oct 2020 09:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVWpu-0002MO-AZ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:24:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b05557c5-060e-4f8c-898c-6b503bf7bbc2;
 Thu, 22 Oct 2020 09:24:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F8D1AC3C;
 Thu, 22 Oct 2020 09:24:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVWpu-0002MO-AZ
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 09:24:42 +0000
X-Inumbo-ID: b05557c5-060e-4f8c-898c-6b503bf7bbc2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b05557c5-060e-4f8c-898c-6b503bf7bbc2;
	Thu, 22 Oct 2020 09:24:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603358680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvoA3+uVzibS3Bv3IS1AE3ffCg+FdCpAtcx7xV/jTjQ=;
	b=qHxb0cXD8V947WK/zTGCy4JRPTiiPnWbfjoUGIGDV7kIGwcQV3wtHATNop4KSafd8Iyz7r
	dBJYSt86g9B3azGQnNR+okxaki8tQWdFxwj+3+cWV+URNQDUZ0IsvxcYdKnXDvEJFSlUs+
	jbrllajztgztGwWmyQ26pACn0y2fEX0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8F8D1AC3C;
	Thu, 22 Oct 2020 09:24:40 +0000 (UTC)
Subject: Re: [PATCH] x86/alternative: don't call text_poke() in lazy TLB mode
To: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>
References: <20201009144225.12019-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <28ccccfe-b95b-5c4d-af27-5004e9f02c40@suse.com>
Date: Thu, 22 Oct 2020 11:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009144225.12019-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.10.20 16:42, Juergen Gross wrote:
> When running in lazy TLB mode the currently active page tables might
> be the ones of a previous process, e.g. when running a kernel thread.
> 
> This can be problematic in case kernel code is being modified via
> text_poke() in a kernel thread, and on another processor exit_mmap()
> is active for the process which was running on the first cpu before
> the kernel thread.
> 
> As text_poke() is using a temporary address space and the former
> address space (obtained via cpu_tlbstate.loaded_mm) is restored
> afterwards, there is a race possible in case the cpu on which
> exit_mmap() is running wants to make sure there are no stale
> references to that address space on any cpu active (this e.g. is
> required when running as a Xen PV guest, where this problem has been
> observed and analyzed).
> 
> In order to avoid that, drop off TLB lazy mode before switching to the
> temporary address space.
> 
> Fixes: cefa929c034eb5d ("x86/mm: Introduce temporary mm structs")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Can anyone look at this, please? It is fixing a real problem which has
been seen several times.


Juergen

> ---
>   arch/x86/kernel/alternative.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index cdaab30880b9..cd6be6f143e8 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -807,6 +807,15 @@ static inline temp_mm_state_t use_temporary_mm(struct mm_struct *mm)
>   	temp_mm_state_t temp_state;
>   
>   	lockdep_assert_irqs_disabled();
> +
> +	/*
> +	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
> +	 * with a stale address space WITHOUT being in lazy mode after
> +	 * restoring the previous mm.
> +	 */
> +	if (this_cpu_read(cpu_tlbstate.is_lazy))
> +		leave_mm(smp_processor_id());
> +
>   	temp_state.mm = this_cpu_read(cpu_tlbstate.loaded_mm);
>   	switch_mm_irqs_off(NULL, mm, current);
>   
> 


