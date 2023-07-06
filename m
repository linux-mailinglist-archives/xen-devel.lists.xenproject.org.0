Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34C74A6A5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 00:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560096.875727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXHt-0004Sp-NN; Thu, 06 Jul 2023 22:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560096.875727; Thu, 06 Jul 2023 22:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHXHt-0004Pl-K9; Thu, 06 Jul 2023 22:17:21 +0000
Received: by outflank-mailman (input) for mailman id 560096;
 Thu, 06 Jul 2023 22:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHXHs-0004Pf-IH
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 22:17:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de660dff-1c4a-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 00:17:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5AC7613F8;
 Thu,  6 Jul 2023 22:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48475C433C7;
 Thu,  6 Jul 2023 22:17:15 +0000 (UTC)
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
X-Inumbo-ID: de660dff-1c4a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688681837;
	bh=xKU78W4M7sg7q53K6fQXPkXMe0pKuJ2AIIDXFlFtnwc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M79WLVw643TqZ3UtMJVT5MHpK588qSfg9MjjB2F3l/1gWYPym+7oOzuD1b3s/KKvm
	 M0drkBvW1G3ZhsAed68+VslfmeSuiouADpmJJti5n4grikqDsTu+oQ6hyhSwTbHnsR
	 Y/ogFEfGS5IsTCFSY2Y1/EgGZKUYsxIUKBG2xyQ99+bQsV+uuEwF1d4iWyQKCpzCT8
	 ByuHmASAz2iHxhpWKa72FkTLMxRGGGwdX6OeIKieQPp75kvPfYF3papnxmc9udbi1r
	 eow21neUaKANvPg93HRbd1p1CQn0mc6QwKzLr8R3CnUpOqcuQRTXBo4HUgH51K47He
	 7rXjmTpo+JmKg==
Date: Thu, 6 Jul 2023 15:17:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 07/13] x86/vmx: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
Message-ID: <alpine.DEB.2.22.394.2307061515100.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <f30ef7c2cda2516d9ef07bb79e5da5513cd90c6c.1688559115.git.gianluca.luparini@bugseng.com> <f3b6170a-db0d-ef00-b3f8-7deba17b9fe2@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Jul 2023, Jan Beulich wrote:
> On 05.07.2023 17:26, Simone Ballarin wrote:
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -257,14 +257,14 @@ uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
> >  
> >      switch ( enc.width ) {
> >      case VVMCS_WIDTH_16:
> > -        res &= 0xffff;
> > +        res &= 0xffffU;
> 
> I don't think the suffix is needed in cases like this one, and ...
> 
> >          break;
> >     case VVMCS_WIDTH_64:
> >          if ( enc.access_type )
> >              res >>= 32;
> >          break;
> >      case VVMCS_WIDTH_32:
> > -        res &= 0xffffffff;
> > +        res &= 0xffffffffU;
> 
> ... while generally I'm suggesting to avoid casts I wonder whether
> casting to uint32_t here wouldn't make things more obviously match
> the purpose. (Same again further down then.)
> 
> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> > @@ -207,7 +207,7 @@ void vmx_vmcs_reload(struct vcpu *v);
> >  #define CPU_BASED_ACTIVATE_MSR_BITMAP         0x10000000
> >  #define CPU_BASED_MONITOR_EXITING             0x20000000
> >  #define CPU_BASED_PAUSE_EXITING               0x40000000
> > -#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
> > +#define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000U
> 
> Interesting - you don't change adjacent #define-s here, nor ...
> 
> > @@ -257,7 +257,7 @@ extern u32 vmx_vmentry_control;
> >  #define SECONDARY_EXEC_XSAVES                   0x00100000
> >  #define SECONDARY_EXEC_TSC_SCALING              0x02000000
> >  #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
> > -#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
> > +#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000U
> 
> ... here. May I ask why that is? (I'm not opposed, but the
> description suggests otherwise.)

Like I wrote in the other email, the requirement is only to add U where
the top bit is set (0x80000000). Adding U to the other constant is
optional and for us to decide.


> > --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> > @@ -136,7 +136,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
> >  /*
> >   * Exit Reasons
> >   */
> > -#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
> > +#define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000U
> >  #define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
> 
> Along the lines of the latter, perhaps switch to 1u << 31?
> 
> > @@ -246,15 +246,15 @@ typedef union cr_access_qual {
> >  /*
> >   * Access Rights
> >   */
> > -#define X86_SEG_AR_SEG_TYPE     0xf        /* 3:0, segment type */
> > -#define X86_SEG_AR_DESC_TYPE    (1u << 4)  /* 4, descriptor type */
> > -#define X86_SEG_AR_DPL          0x60       /* 6:5, descriptor privilege level */
> > -#define X86_SEG_AR_SEG_PRESENT  (1u << 7)  /* 7, segment present */
> > -#define X86_SEG_AR_AVL          (1u << 12) /* 12, available for system software */
> > -#define X86_SEG_AR_CS_LM_ACTIVE (1u << 13) /* 13, long mode active (CS only) */
> > -#define X86_SEG_AR_DEF_OP_SIZE  (1u << 14) /* 14, default operation size */
> > -#define X86_SEG_AR_GRANULARITY  (1u << 15) /* 15, granularity */
> > -#define X86_SEG_AR_SEG_UNUSABLE (1u << 16) /* 16, segment unusable */
> > +#define X86_SEG_AR_SEG_TYPE     0xfU       /* 3:0, segment type */
> > +#define X86_SEG_AR_DESC_TYPE    (1U << 4)  /* 4, descriptor type */
> > +#define X86_SEG_AR_DPL          0x60U      /* 6:5, descriptor privilege level */
> > +#define X86_SEG_AR_SEG_PRESENT  (1U << 7)  /* 7, segment present */
> > +#define X86_SEG_AR_AVL          (1U << 12) /* 12, available for system software */
> > +#define X86_SEG_AR_CS_LM_ACTIVE (1U << 13) /* 13, long mode active (CS only) */
> > +#define X86_SEG_AR_DEF_OP_SIZE  (1U << 14) /* 14, default operation size */
> > +#define X86_SEG_AR_GRANULARITY  (1U << 15) /* 15, granularity */
> > +#define X86_SEG_AR_SEG_UNUSABLE (1U << 16) /* 16, segment unusable */
> 
> How is this change related to rule 7.2? There are u suffixes already where
> needed (and 0xf and 0x60 don't strictly need one), so there's no violation
> here afaict. A mere style change to switch from u to U imo doesn't belong
> here (and, as mentioned while discussing the rule, is imo hampering
> readability in cases like these ones).

My understanding is that these are not MISRA violations so could be
dropped

