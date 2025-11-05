Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831ACC34A4F
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 10:01:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156046.1485357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZOK-0007Z9-PT; Wed, 05 Nov 2025 09:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156046.1485357; Wed, 05 Nov 2025 09:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGZOK-0007XQ-Ms; Wed, 05 Nov 2025 09:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1156046;
 Wed, 05 Nov 2025 09:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfi=5N=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vGZOJ-0007XK-Lg
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 09:01:19 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd404c5a-ba25-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 10:01:18 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3407f385dd0so4241102a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 01:01:18 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341a68c822dsm2153637a91.8.2025.11.05.01.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Nov 2025 01:01:15 -0800 (PST)
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
X-Inumbo-ID: fd404c5a-ba25-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762333277; x=1762938077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=Khg9v/IbaFHgrCKQnU59BQuLvjLGUp1rT5SRzGwxR9OHxaty0Jc5gBxHjsmXtpzKCQ
         xSJc8QjStvN4MbuowwOchgN1Pkqj8XIs5op/kaBevJs2tQ+GYbINr5G5vySaxcfCJGMV
         HY5IM/3i2z56XDxi2B8JsCwhT1liTiCKVnfY9fIN/OYsgvqw75UOzRoZPINJyJBQecOp
         clVS3qePEFh4qB9H+GubujAfi8LDHLpF6lPrhSTSLjqR8E05PbPoXRU4TWr1UkhV4pLg
         2nsusZf2NHe1QngNvm8t8kQYQGxk/F6DPPiJcOnuaCyno4KzMQ4WXO30piDtZzVsl7q/
         hJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333277; x=1762938077;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqwAluvFQHR3rGs29bqhyFCcj3SAHqQXu+Y8BdSkuwM=;
        b=TfYfLCgTaH3sZGvUWakb5a3+x007rOTJ/rcUUlvfN3fZRqm8E7shEjtpnOzPMdHF6J
         M5Qcz57UPigoPpK+QXbYovl9YXaBX/SSi71XI0ta0cq7kga0fFtG0pyyrqFyUzXWb64e
         keUcqcpBpmSApux1KmycWUvkfOw58MYrdPZw1rRwXUlmc2ZAjOpQWU/qTEKr9U+EtDeN
         sDnEQsTHBfRIVXirK6TUeoS8iKZvyN1vaWRee+160gnOOIVV3oCJw3Gf0v56YHPCQsm5
         LZIFewbNWSCjKtnlA2tr6ChECTb3TnzH1ZZf5WZnU+M2//JUJUFStyYmXgBUScF2RdhM
         mUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcBRucgAQOaiCGNSNH6ETefc4CBezNY1uWHUc8d4xrTaI1LQzyC4h8nzyfSx1dnEcBPsiyRfy/hFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHpbYf+TJugpcP7mQsG5V4oU+QaXleaN3ZKWZ9Q2ovKPekOdjo
	2V86izqeikhNFwZVOh1EBsXsdL/pcPfUfO6jxHrgaip9LNJCCxAqXJER
X-Gm-Gg: ASbGncsNLzbH4QfOqMPEL8/b8ahXFixz5QKUuw2qsG2oafVsmY/LqBMNkkyOM+LJEM3
	9SrahLLlHT5q58VPkA6sOfp75WKow9hrJA2qBl7v5Qh/nPxWVIWF7ahZIaptFQEBiyUEUgmhG++
	VwK3AlZJWoRu9p1ZnlqZUxUjtQCsWg0iYzJSTP7hNnPwKh5p+2/jNRDJ5FSXRllKj6kUpDIAkwk
	hC4y3RaHyvwjfzYNU4sw/5+D41qsRhAotU/86HbPMbzpLx3HJ/8dD2MctdBiK3n9T6VHtFrdHxy
	kKv92TJxO+bcXOc2/o9ecBdq3/zO77m7utDCD8hrgvAeQlQoxAMevQd9Qp4t2g3v/YRISDg0Bl2
	Yf8ZfR9xzzZ1eVGas61iukL0zBP171VTkkM78H7C0VVKq6rjLxrjkCvkC1dhoY41Zix5U5dRgLP
	eiQOzR
X-Google-Smtp-Source: AGHT+IHHv+LyuTSVYYYzkbgRnz7hULJzgzWM0oNnTXqbUlny/y0AGDg1tLVk5Pgi5QjOwQ4eknTvSQ==
X-Received: by 2002:a17:90b:51c8:b0:340:f05a:3ed1 with SMTP id 98e67ed59e1d1-341a6dc8735mr2732523a91.21.1762333276313;
        Wed, 05 Nov 2025 01:01:16 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <20251029100909.3381140-8-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 14:19:03 +0530
Message-ID: <87ms5050g0.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
>
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
>
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
>
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>   calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
>
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>   to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>   the assumption is that these callbacks are not relevant. However,
>   existing code may rely on a call to disable() to flush any batched
>   state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>   therefore called in that situation.
>
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
>
> Whether the mode is actually enabled or not at any point is tracked
> by a separate "active" field in task_struct; this makes it possible
> to check invariants in the generic API, and to expose a new
> in_lazy_mmu_mode() helper to replace the various ways arch's
> currently track whether the mode is enabled (this will be done in
> later patches).
>
> In summary (nesting/active represent the values *after* the call):
>
> lazy_mmu_mode_enable()		-> arch_enter()	    nesting=3D1 active=3D1
>     lazy_mmu_mode_enable()	-> =C3=B8		    nesting=3D2 active=3D1
> 	lazy_mmu_mode_pause()	-> arch_leave()     nesting=3D2 active=3D0
> 	lazy_mmu_mode_resume()	-> arch_enter()     nesting=3D2 active=3D1
>     lazy_mmu_mode_disable()	-> arch_flush()     nesting=3D1 active=3D1
> lazy_mmu_mode_disable()		-> arch_leave()     nesting=3D0 active=3D0
>
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ------
>  include/linux/mm_types_task.h    |  5 +++
>  include/linux/pgtable.h          | 67 ++++++++++++++++++++++++++++++--
>  include/linux/sched.h            | 16 ++++++++
>  4 files changed, 84 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
> index 54f8d6bb6f22..535435248923 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
>=20=20
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
>=20=20
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a82aa80c0ba4..632d404f8191 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>  #endif
>  };
>=20=20
> +struct lazy_mmu_state {
> +	u8 nesting_level;
> +	bool active;
> +};
> +
>  #endif /* _LINUX_MM_TYPES_TASK_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b5fdf32c437f..e6064e00b22d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be=
 enabled
>   * and cpu migration is possible; it must take steps to be robust agains=
t this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s=
) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not pe=
rmitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode cannot b=
e used
> + * in interrupt context.
> + *
> + * The lazy MMU mode is enabled for a given block of code using:
> + *
> + *   lazy_mmu_mode_enable();
> + *   <code>
> + *   lazy_mmu_mode_disable();
> + *
> + * Nesting is permitted: <code> may itself use an enable()/disable() pai=
r.
> + * A nested call to enable() has no functional effect; however disable()=
 causes
> + * any batched architectural state to be flushed regardless of nesting. =
After a
> + * call to disable(), the caller can therefore rely on all previous page=
 table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy M=
MU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * This sequence must only be used if the lazy MMU mode is already enabl=
ed.
> + * pause() ensures that the mode is exited regardless of the nesting lev=
el;
> + * resume() re-enters the mode at the same nesting level. <code> must no=
t modify
> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
> + * helpers).
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.
>   */
>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void lazy_mmu_mode_enable(void)
>  {
> -	arch_enter_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
> +	/* enable() must not be called while paused */
> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> +
> +	if (state->nesting_level++ =3D=3D 0) {
> +		state->active =3D true;
> +		arch_enter_lazy_mmu_mode();
> +	}
>  }

Some architectures disables preemption in their
arch_enter_lazy_mmu_mode(). So shouldn't the state->active =3D true should
happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.

  static inline void lazy_mmu_mode_enable(void)
  {
 -	arch_enter_lazy_mmu_mode();
 +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
 +
 +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D U8_MAX);
 +	/* enable() must not be called while paused */
 +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
 +
 +	if (state->nesting_level++ =3D=3D 0) {
 +		arch_enter_lazy_mmu_mode();
 +		state->active =3D true;
 +	}
  }

... I think it make more sense to enable the state after the arch_**
call right.

>=20=20
>  static inline void lazy_mmu_mode_disable(void)
>  {
> -	arch_leave_lazy_mmu_mode();
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level =3D=3D 0);
> +	VM_WARN_ON(!state->active);
> +
> +	if (--state->nesting_level =3D=3D 0) {
> +		state->active =3D false;
> +		arch_leave_lazy_mmu_mode();
> +	} else {
> +		/* Exiting a nested section */
> +		arch_flush_lazy_mmu_mode();
> +	}
>  }

This looks ok though.

>=20=20
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || !state->active);
> +
> +	state->active =3D false;
>  	arch_leave_lazy_mmu_mode();
>  }
>=20=20
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state =3D &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level =3D=3D 0 || state->active);
> +
> +	state->active =3D true;
>  	arch_enter_lazy_mmu_mode();
>  }

Ditto.

-ritesh


>  #else
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cbb7340c5866..11566d973f42 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1441,6 +1441,10 @@ struct task_struct {
>=20=20
>  	struct page_frag		task_frag;
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +	struct lazy_mmu_state		lazy_mmu_state;
> +#endif
> +
>  #ifdef CONFIG_TASK_DELAY_ACCT
>  	struct task_delay_info		*delays;
>  #endif
> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_=
struct *tsk)
>  	return task_index_to_char(task_state_index(tsk));
>  }
>=20=20
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return current->lazy_mmu_state.active;
> +}
> +#else
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return false;
> +}
> +#endif
> +
>  extern struct pid *cad_pid;
>=20=20
>  /*
> --=20
> 2.47.0

