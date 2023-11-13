Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D607E9932
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631470.984806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2TOg-0002SF-A3; Mon, 13 Nov 2023 09:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631470.984806; Mon, 13 Nov 2023 09:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2TOg-0002PR-51; Mon, 13 Nov 2023 09:38:22 +0000
Received: by outflank-mailman (input) for mailman id 631470;
 Mon, 13 Nov 2023 09:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yu24=G2=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1r2TOd-0002MF-5Z
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 09:38:20 +0000
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f646cdc-8208-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 10:38:16 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 216AA40E0032; 
 Mon, 13 Nov 2023 09:38:14 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yDn-4aWbgcao; Mon, 13 Nov 2023 09:38:12 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 96E9040E0171;
 Mon, 13 Nov 2023 09:37:48 +0000 (UTC)
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
X-Inumbo-ID: 5f646cdc-8208-11ee-98da-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1699868290; bh=pvZneiKXZP1AFwrVjpjgX9SfPXvcKcXDRiBYzBlWCUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ7yBNVNpQh+FSzVVPUvU1KiPOgYrTKreyHA8+5W4D1e1NVGVZU6gh4GtZqYjwac5
	 7mXHFs8411yRJlwvUxdWXR4tVSMr2V05ppNWa2jneFjQ76RZ8AiWkt0PTe9lQg53x8
	 StmLiD/0my+6PMYw1LCK/P7zdWALpzfMYgh1fVSmK/x+RNi+xjdK7e9F4pHZSH9V4N
	 //0C5YpGFuES/WJNPnwTymvdqteTiiXiFmAosHN3nDMvoaVE23uyvrUDBPYlXRZ2yC
	 zo/XBmjZafaL7zOQg8nuRRUMiWXsD3y/jtAA3OYjU1gzm+jLuEZk790OjLEW6BxlOV
	 PXMHE1ijr3rLunuaIe7wPDDckNuNcoWSlSjqaWjx3LQIC2/5bMXHEplkpaONiNXnU+
	 QLatLdlOoS0pqZJyyPEbMxm5Wrd5YQgTBx+RitlTVRTngSD/EyTPSPMFfwy30fjvs4
	 Ar55249kf9xxyEytyXCGcLBLIEGKahsFxSMl4aZujzNDDFedLNWet7qfiEmBEcMKA7
	 KY0o7bJF/2doThAtRXGMIWrb22pt8N88EcVVC99JIy6ziyh+gT7GxewGFeNSQhOJqz
	 LjbBfNVJw03e/S7CKwwgYIN6BgSrxS4DQA9buYUX3Z8XPsMTypEr9l2BooGtvGdtxZ
	 TSsh+cXS+Iag9abKXKBGqaBU=
Date: Mon, 13 Nov 2023 10:37:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
	seanjc@google.com, peterz@infradead.org, jgross@suse.com,
	ravi.v.shankar@intel.com, mhiramat@kernel.org,
	andrew.cooper3@citrix.com, jiangshanlai@gmail.com,
	nik.borisov@suse.com
Subject: Re: [PATCH v12 19/37] x86/fred: Update MSR_IA32_FRED_RSP0 during
 task switch
Message-ID: <20231113093742.GAZVHuZk9CGTRIfAWb@fat_crate.local>
References: <20231003062458.23552-1-xin3.li@intel.com>
 <20231003062458.23552-20-xin3.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003062458.23552-20-xin3.li@intel.com>

On Mon, Oct 02, 2023 at 11:24:40PM -0700, Xin Li wrote:
> From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
> 
> MSR_IA32_FRED_RSP0 is used during ring 3 event delivery, and needs to
> be updated to point to the top of next task stack during task switch.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> ---
>  arch/x86/include/asm/switch_to.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/switch_to.h b/arch/x86/include/asm/switch_to.h
> index f42dbf17f52b..c3bd0c0758c9 100644
> --- a/arch/x86/include/asm/switch_to.h
> +++ b/arch/x86/include/asm/switch_to.h
> @@ -70,9 +70,13 @@ static inline void update_task_stack(struct task_struct *task)
>  #ifdef CONFIG_X86_32
>  	this_cpu_write(cpu_tss_rw.x86_tss.sp1, task->thread.sp0);
>  #else
> -	/* Xen PV enters the kernel on the thread stack. */
> -	if (cpu_feature_enabled(X86_FEATURE_XENPV))
> +	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
> +		/* WRMSRNS is a baseline feature for FRED. */
> +		wrmsrns(MSR_IA32_FRED_RSP0, (unsigned long)task_stack_page(task) + THREAD_SIZE);

If this non-serializing write happens now and, AFAICT, the CR3 write
during the task switch has already happened in switch_mm* earlier, what
is the serialization point that's going to make sure that write is
committed before the new task starts executing?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

