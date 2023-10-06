Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F287BAFFC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 03:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613198.953573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoZNs-00047d-QW; Fri, 06 Oct 2023 01:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613198.953573; Fri, 06 Oct 2023 01:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoZNs-00045C-Nm; Fri, 06 Oct 2023 01:12:04 +0000
Received: by outflank-mailman (input) for mailman id 613198;
 Fri, 06 Oct 2023 01:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehtw=FU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoZNq-000456-EL
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 01:12:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59519057-63e5-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 03:12:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76D21CE2541;
 Fri,  6 Oct 2023 01:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB5AC433C7;
 Fri,  6 Oct 2023 01:11:52 +0000 (UTC)
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
X-Inumbo-ID: 59519057-63e5-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696554713;
	bh=reDSiwWo+WZI9vFfeu8DROlP66Dy6+X3INKaa8OPLp8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pq//4YcbU2FKg1zY/rd/oFiTD06Yytnfaxn+Iu2iWeI5Cb4Btc9U5ypM1Cysc6iqs
	 Ji+TgQut1Cn/lTOlixah5PgNreJynf02soIuh2iWbUAybXNpmcIRXB1eTANBJSAuNU
	 vhgXRMEMOO4w1KNB5zhprfTZR/bqWiGywOmgxuQOPEVEWvpfc/zhQe2f/L8Rj5uZqM
	 jXEPdApxrDFmGtP2NZ5ZEWdNYJBS0vLz5uEa5iB/iBvDJyoYpKX57FQYzZMi1+/U5S
	 nHy7hb4tpU4pj2RLY5enGTZ+w2gD6yXuKuy/6dCbHlA/NdZJ2HTQt+IDx3i3eiiKyz
	 J7tPkfME5E5lw==
Date: Thu, 5 Oct 2023 18:11:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH] xen/sched: address violations of MISRA C:2012 Rule
 8.2
In-Reply-To: <142049155775072b2a43eb2f052ffd0ab322867e.1696497380.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310051809190.2348112@ubuntu-linux-20-04-desktop>
References: <142049155775072b2a43eb2f052ffd0ab322867e.1696497380.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/common/sched/private.h | 93 ++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index c516976c37..68de469537 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -280,59 +280,64 @@ struct scheduler {
>  
>      int          (*global_init)    (void);
>  
> -    int          (*init)           (struct scheduler *);
> -    void         (*deinit)         (struct scheduler *);
> +    int          (*init)           (struct scheduler *s);
> +    void         (*deinit)         (struct scheduler *s);

I only checked 2 schedulers but it looks like they are using "ops" not
"s" everywhere in this function pointers parameters.


> -    void         (*free_udata)     (const struct scheduler *, void *);
> -    void *       (*alloc_udata)    (const struct scheduler *,
> -                                    struct sched_unit *, void *);
> -    void         (*free_pdata)     (const struct scheduler *, void *, int);
> -    void *       (*alloc_pdata)    (const struct scheduler *, int);
> -    void         (*deinit_pdata)   (const struct scheduler *, void *, int);
> +    void         (*free_udata)     (const struct scheduler *s, void *data);
> +    void *       (*alloc_udata)    (const struct scheduler *s,
> +                                    struct sched_unit *unit, void *data);

here they use "dd" instead of "data"


> +    void         (*free_pdata)     (const struct scheduler *s,
> +                                    void *data, int cpu);

pcpu instead of cpu

I won't go through the whole list but if you look at
xen/common/sched/credit2.c and xen/common/sched/credit.c you'll see that
the naming scheme is pretty aligned



> +    void *       (*alloc_pdata)    (const struct scheduler *s, int cpu);
> +    void         (*deinit_pdata)   (const struct scheduler *s,
> +                                    void *pcpu, int cpu);
>  
>      /* Returns ERR_PTR(-err) for error, NULL for 'nothing needed'. */
> -    void *       (*alloc_domdata)  (const struct scheduler *, struct domain *);
> +    void *       (*alloc_domdata)  (const struct scheduler *s,
> +                                    struct domain *d);
>      /* Idempotent. */
> -    void         (*free_domdata)   (const struct scheduler *, void *);
> +    void         (*free_domdata)   (const struct scheduler *s, void *data);
>  
> -    spinlock_t * (*switch_sched)   (struct scheduler *, unsigned int,
> -                                    void *, void *);
> +    spinlock_t * (*switch_sched)   (struct scheduler *s, unsigned int cpu,
> +                                    void *pdata, void *vdata);
>  
>      /* Activate / deactivate units in a cpu pool */
> -    void         (*insert_unit)    (const struct scheduler *,
> -                                    struct sched_unit *);
> -    void         (*remove_unit)    (const struct scheduler *,
> -                                    struct sched_unit *);
> -
> -    void         (*sleep)          (const struct scheduler *,
> -                                    struct sched_unit *);
> -    void         (*wake)           (const struct scheduler *,
> -                                    struct sched_unit *);
> -    void         (*yield)          (const struct scheduler *,
> -                                    struct sched_unit *);
> -    void         (*context_saved)  (const struct scheduler *,
> -                                    struct sched_unit *);
> -
> -    void         (*do_schedule)    (const struct scheduler *,
> -                                    struct sched_unit *, s_time_t,
> +    void         (*insert_unit)    (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +    void         (*remove_unit)    (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +
> +    void         (*sleep)          (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +    void         (*wake)           (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +    void         (*yield)          (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +    void         (*context_saved)  (const struct scheduler *s,
> +                                    struct sched_unit *unit);
> +
> +    void         (*do_schedule)    (const struct scheduler *s,
> +                                    struct sched_unit *unit, s_time_t now,
>                                      bool tasklet_work_scheduled);
>  
> -    struct sched_resource *(*pick_resource)(const struct scheduler *,
> -                                            const struct sched_unit *);
> -    void         (*migrate)        (const struct scheduler *,
> -                                    struct sched_unit *, unsigned int);
> -    int          (*adjust)         (const struct scheduler *, struct domain *,
> -                                    struct xen_domctl_scheduler_op *);
> -    void         (*adjust_affinity)(const struct scheduler *,
> -                                    struct sched_unit *,
> -                                    const struct cpumask *,
> -                                    const struct cpumask *);
> -    int          (*adjust_global)  (const struct scheduler *,
> -                                    struct xen_sysctl_scheduler_op *);
> -    void         (*dump_settings)  (const struct scheduler *);
> -    void         (*dump_cpu_state) (const struct scheduler *, int);
> -    void         (*move_timers)    (const struct scheduler *,
> -                                    struct sched_resource *);
> +    struct sched_resource *(*pick_resource)(const struct scheduler *s,
> +                                            const struct sched_unit *unit);
> +    void         (*migrate)        (const struct scheduler *s,
> +                                    struct sched_unit *unit, unsigned int cpu);
> +    int          (*adjust)         (const struct scheduler *s,
> +                                    struct domain *d,
> +                                    struct xen_domctl_scheduler_op *op);
> +    void         (*adjust_affinity)(const struct scheduler *s,
> +                                    struct sched_unit *unit,
> +                                    const struct cpumask *hard,
> +                                    const struct cpumask *soft);
> +    int          (*adjust_global)  (const struct scheduler *s,
> +                                    struct xen_sysctl_scheduler_op *op);
> +    void         (*dump_settings)  (const struct scheduler *s);
> +    void         (*dump_cpu_state) (const struct scheduler *s, int cpu);
> +    void         (*move_timers)    (const struct scheduler *s,
> +                                    struct sched_resource *sr);
>  };
>  
>  static inline int sched_init(struct scheduler *s)
> -- 
> 2.34.1
> 

