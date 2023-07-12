Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B990F751417
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 01:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562878.879636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJisx-0001Rz-DZ; Wed, 12 Jul 2023 23:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562878.879636; Wed, 12 Jul 2023 23:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJisx-0001QN-B2; Wed, 12 Jul 2023 23:04:39 +0000
Received: by outflank-mailman (input) for mailman id 562878;
 Wed, 12 Jul 2023 23:04:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eU4r=C6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJisw-0001QH-Iq
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 23:04:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78bc041a-2108-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 01:04:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15E81618B3;
 Wed, 12 Jul 2023 23:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA2CC433C7;
 Wed, 12 Jul 2023 23:04:33 +0000 (UTC)
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
X-Inumbo-ID: 78bc041a-2108-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689203075;
	bh=U1fB1kfpXc4HvTZoE3th9aoKWcHY/FdcPG8yJzGQ30M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CxD0C+IzHd7rImrJpcYHgqv0KLVaxVZ3466RrUhCarfmsBwgqceBV+hH037Y+UZY8
	 qrCeFbuYIgLFlO8HD2/ZkG7+hrKpQSdMEvuq+iZfx3paXJqp1d3a8BJ3DjuHyCQwhH
	 yW6Tn1+F4oP9gDT7HUkQbd46D3cRC6/NqQPSwEjQAqVn1czMDirQeISlVkmHQpQ8BX
	 ncMonJNlY0ihmSCnZHiywvJ1/i8Pwuq0EiMiPVq9R7AY8FVxNCKkyssYJVyriWRSC/
	 FVGn6FWid2SBeWgkSqPdeT8bTaxQPHtafHOPUcLnXY+CiBnxF3fyATjg4j26H0SZ7r
	 5Ca9UI92PmHag==
Date: Wed, 12 Jul 2023 16:04:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v3 13/15] x86/viridian: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <925b70ccf1140945d6a1e73263c84e3b6db12ec8.1689152719.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307121604240.761183@ubuntu-linux-20-04-desktop>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com> <925b70ccf1140945d6a1e73263c84e3b6db12ec8.1689152719.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - create this commit for 'viridian.c' and 'hyperv-tlfs.h'
> ---
>  xen/arch/x86/hvm/viridian/viridian.c         |  2 +-
>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h | 28 ++++++++++----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index 7405c117bc..61171e3363 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -291,7 +291,7 @@ static void enable_hypercall_page(struct domain *d)
>       * calling convention) to differentiate Xen and Viridian hypercalls.
>       */
>      *(u8  *)(p + 0) = 0x0d; /* orl $0x80000000, %eax */
> -    *(u32 *)(p + 1) = 0x80000000;
> +    *(u32 *)(p + 1) = 0x80000000U;
>      *(u8  *)(p + 5) = 0x0f; /* vmcall/vmmcall */
>      *(u8  *)(p + 6) = 0x01;
>      *(u8  *)(p + 7) = (cpu_has_vmx ? 0xc1 : 0xd9);
> diff --git a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> index 38f997a0c8..a6915ad731 100644
> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {
>  
>  /* Define hypervisor message types. */
>  enum hv_message_type {
> -	HVMSG_NONE			= 0x00000000,
> +	HVMSG_NONE			= 0x00000000U,
>  
>  	/* Memory access messages. */
> -	HVMSG_UNMAPPED_GPA		= 0x80000000,
> -	HVMSG_GPA_INTERCEPT		= 0x80000001,
> +	HVMSG_UNMAPPED_GPA		= 0x80000000U,
> +	HVMSG_GPA_INTERCEPT		= 0x80000001U,
>  
>  	/* Timer notification messages. */
> -	HVMSG_TIMER_EXPIRED			= 0x80000010,
> +	HVMSG_TIMER_EXPIRED			= 0x80000010U,
>  
>  	/* Error messages. */
> -	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020,
> -	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021,
> -	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022,
> +	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020U,
> +	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021U,
> +	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022U,
>  
>  	/* Trace buffer complete messages. */
> -	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040,
> +	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040U,
>  
>  	/* Platform-specific processor intercept messages. */
> -	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000,
> -	HVMSG_X64_MSR_INTERCEPT		= 0x80010001,
> -	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002,
> -	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003,
> -	HVMSG_X64_APIC_EOI			= 0x80010004,
> -	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005
> +	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000U,
> +	HVMSG_X64_MSR_INTERCEPT		= 0x80010001U,
> +	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002U,
> +	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003U,
> +	HVMSG_X64_APIC_EOI			= 0x80010004U,
> +	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005U
>  };
>  
>  /* Define synthetic interrupt controller message flags. */
> -- 
> 2.41.0
> 

