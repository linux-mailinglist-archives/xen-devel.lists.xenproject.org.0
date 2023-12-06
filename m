Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C991F806574
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 04:10:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648797.1012786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiIk-0003gM-3d; Wed, 06 Dec 2023 03:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648797.1012786; Wed, 06 Dec 2023 03:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAiIk-0003dW-0s; Wed, 06 Dec 2023 03:10:18 +0000
Received: by outflank-mailman (input) for mailman id 648797;
 Wed, 06 Dec 2023 03:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAiIj-0003dP-4L
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 03:10:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa07e7bb-93e4-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 04:10:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1E04608C0;
 Wed,  6 Dec 2023 03:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B3BC433C7;
 Wed,  6 Dec 2023 03:10:13 +0000 (UTC)
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
X-Inumbo-ID: fa07e7bb-93e4-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701832214;
	bh=y29qUYa5AmFDM3XI0hWka6TCb/np57otshggx7s5hK4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mEclSlE0mZ+zqL+kKNr0Yb11vzQyxS0lVC/BBXTrd071+3fvKrznCcQoNsFOBKiEC
	 jStgIamIBWrAzlM10tPFmu7WiiMEHeA3nAKfFfzMGrv+ElKzFOjawk8E0noUvmDxn8
	 UW9OsWbS67sq1+KRRqadVldGmVNOpStwXHyB/c+3/010lybODvLWFakYHZAi0VvVOn
	 gRYZUKKdo5ttbgJdjesytrxXsFLW6Hjna6RwWEJE0OftvKLO+jribTtgTRLW/XoqYL
	 waNmVyfh7P+jdh5hRJ8u+wnA8rHQqN6gcsO2xLakwmqcY6o7a1P79EiF7nmHr2Hnbj
	 EI3/jQX11d73Q==
Date: Tue, 5 Dec 2023 19:10:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/6] x86/mm: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <461a97a14a530286a8b8d0d30a1a8ed63690bc26.1701764980.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312051908470.110490@ubuntu-linux-20-04-desktop>
References: <cover.1701764980.git.federico.serafini@bugseng.com> <461a97a14a530286a8b8d0d30a1a8ed63690bc26.1701764980.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/mm.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 05dfe35502..a270f8ddd6 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -406,7 +406,7 @@ void put_page_type(struct page_info *page);
>  int  get_page_type(struct page_info *page, unsigned long type);
>  int  put_page_type_preemptible(struct page_info *page);
>  int  get_page_type_preemptible(struct page_info *page, unsigned long type);
> -int  put_old_guest_table(struct vcpu *);
> +int  put_old_guest_table(struct vcpu *v);
>  int  get_page_from_l1e(
>      l1_pgentry_t l1e, struct domain *l1e_owner, struct domain *pg_owner);
>  void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner);
> @@ -557,7 +557,7 @@ void audit_domains(void);
>  
>  void make_cr3(struct vcpu *v, mfn_t mfn);
>  pagetable_t update_cr3(struct vcpu *v);
> -int vcpu_destroy_pagetables(struct vcpu *);
> +int vcpu_destroy_pagetables(struct vcpu *v);
>  void *do_page_walk(struct vcpu *v, unsigned long addr);
>  
>  /* Allocator functions for Xen pagetables. */
> @@ -572,20 +572,20 @@ int __sync_local_execstate(void);
>  /* Arch-specific portion of memory_op hypercall. */
>  long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>  long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> -int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void));
> -int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void));
> +int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
> +int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);

Also for compat_subarch_memory_op I cannot find the definition

everything else looks fine


