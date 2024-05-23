Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCD8CDDC3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 01:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728944.1134030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHzo-0000mW-Nv; Thu, 23 May 2024 23:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728944.1134030; Thu, 23 May 2024 23:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHzo-0000kK-Ks; Thu, 23 May 2024 23:37:16 +0000
Received: by outflank-mailman (input) for mailman id 728944;
 Thu, 23 May 2024 23:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GulG=M2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAHzm-0000jy-U8
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 23:37:15 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a021ce2-195d-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 01:37:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 45217CE16DE;
 Thu, 23 May 2024 23:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C54C2BD10;
 Thu, 23 May 2024 23:36:57 +0000 (UTC)
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
X-Inumbo-ID: 5a021ce2-195d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716507418;
	bh=kHkeO9Fj3Fyo5IpsnSa8jWlvVs+nvEzXybD8jzMh25c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WllI793XLeK614a/otG82rIFNKD466NFp+PU16NevhA3gP0a2KNK0OR+nrzNswmcR
	 TzyT9Z6nwaDdCzp8dRx7gxocyRkz6HmobY8dTDD3r96Vei64lf0ZC63xoN9TeNJBrv
	 QOaLn6PKyYPfrnrr9Fgvxwvjw5uQ+KZNiIgwtUCcFaqrtEHOyU0qrOKL4x1EFsctXp
	 EuRxH4211sDzhBasK5dVLF5CGHpNV2L1goHYxiYeoPcjSqy5sLX7rqbXol2oogVos1
	 6gQadxcWEBv1ixAjkEYP5kdP9BqBy/FX+b0R4XbSfRxDE0xwsFCKvA+7eBIfRL658Z
	 /HD7+ZRllvIXA==
Date: Thu, 23 May 2024 16:36:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Sergiy Kibrik <sergiy_kibrik@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
In-Reply-To: <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405231634290.2557291@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com> <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com> <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
 <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Jan Beulich wrote:
> On 23.05.2024 15:07, Sergiy Kibrik wrote:
> > 16.05.24 14:12, Jan Beulich:
> >> On 15.05.2024 11:12, Sergiy Kibrik wrote:
> >>> --- a/xen/arch/x86/include/asm/cpufeature.h
> >>> +++ b/xen/arch/x86/include/asm/cpufeature.h
> >>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
> >>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
> >>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
> >>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
> >>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
> >>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
> >>> +                                  boot_cpu_has(X86_FEATURE_VMX))
> >>>   #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
> >>>   #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
> >>>   #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
> >>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
> >>>   
> >>>   /* CPUID level 0x80000001.ecx */
> >>>   #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
> >>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
> >>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
> >>> +                                  boot_cpu_has(X86_FEATURE_SVM))
> >>>   #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
> >>>   #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
> >>>   #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
> >>
> >> Hmm, leaving aside the style issue (stray blanks after opening parentheses,
> >> and as a result one-off indentation on the wrapped lines) I'm not really
> >> certain we can do this. The description goes into detail why we would want
> >> this, but it doesn't cover at all why it is safe for all present (and
> >> ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
> >> just to derive further knowledge from that, without them being directly
> >> related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
> >> for example. While it looks to be okay there, it may give you an idea of
> >> what I mean.
> >>
> >> Things might become better separated if instead for such checks we used
> >> host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
> >> that's still pretty far out, I'm afraid.
> > 
> > I've followed a suggestion you made for patch in previous series:
> > 
> > https://lore.kernel.org/xen-devel/8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com/
> 
> See the "If not, ..." that I had put there. Doing the change just mechanically
> isn't enough, you also need to make clear (in the description) that you
> verified it's safe to have this way.

What does it mean to "verified it's safe to have this way"? "Safe" in
what way?


> > yet if this approach can potentially be unsafe (I'm not completely sure 
> > it's safe), should we instead fallback to the way it was done in v1 
> > series? I.e. guard calls to vmx/svm-specific calls where needed, like in 
> > these 3 patches:
> > 
> > 1) 
> > https://lore.kernel.org/xen-devel/20240416063328.3469386-1-Sergiy_Kibrik@epam.com/
> > 
> > 2) 
> > https://lore.kernel.org/xen-devel/20240416063740.3469592-1-Sergiy_Kibrik@epam.com/
> > 
> > 3) 
> > https://lore.kernel.org/xen-devel/20240416063947.3469718-1-Sergiy_Kibrik@epam.com/
> 
> I don't like this sprinkling around of IS_ENABLED() very much. Maybe we want
> to have two new helpers (say using_svm() and using_vmx()), to be used in place
> of most but possibly not all cpu_has_{svm,vmx}? Doing such a transformation
> would then kind of implicitly answer the safety question above, as at every
> use site you'd need to judge whether the replacement is correct. If it's
> correct everywhere, the construct(s) as proposed in this version could then be
> considered to be used in this very shape (instead of introducing the two new
> helpers). But of course the transition could also be done gradually then,
> touching only those uses that previously you touched in 1), 2), and 3).


