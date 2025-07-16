Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65104B070AD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 10:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044951.1414992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxb8-0003he-Qk; Wed, 16 Jul 2025 08:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044951.1414992; Wed, 16 Jul 2025 08:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubxb8-0003g2-OC; Wed, 16 Jul 2025 08:34:42 +0000
Received: by outflank-mailman (input) for mailman id 1044951;
 Wed, 16 Jul 2025 08:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFG0=Z5=bounce.vates.tech=bounce-md_30504962.6877641d.v1-05a0ad372f58408286f8c5d20831ec7d@srs-se1.protection.inumbo.net>)
 id 1ubxb6-0003fr-NN
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 08:34:40 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5d6db72-621f-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 10:34:39 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bhq9T41xLz8XRqhP
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:34:37 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 05a0ad372f58408286f8c5d20831ec7d; Wed, 16 Jul 2025 08:34:37 +0000
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
X-Inumbo-ID: b5d6db72-621f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1752654877; x=1752924877;
	bh=u3od19rekVXiF67E+RmFuqEYGSWLRc7VmgRmgnphynw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ToqlVHffMi0O+3SqcxYRGm/Zsdic2dkyHhLzgDLU+8N1JHdw84DWANCop4dOpozG5
	 DqqKc9AXkop3shgAMZbsRxHlwg6vVnKPkCtE4lIEbypE2sDLkbwPc+eme2Kb/8YDzu
	 RIiQ7PrkV2sM3HMMu8By+4U6edqcPLl/8KWu2KXzmZodK654FcywIvEuMUuG/Km61D
	 cRJiSxAIBxy8+7r3WBjDLFgEJGdLkiXq3yXezRsDx5WpdT++TNtyd5R5x4TTY1fMPP
	 WT+aL361tMqfxXAkVz1uUCplwfV0P+vrLhzi0pgkEDwGEjMOkzSllZaSj4IW87q4x3
	 yVP2Ozca077WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1752654877; x=1752915377; i=teddy.astie@vates.tech;
	bh=u3od19rekVXiF67E+RmFuqEYGSWLRc7VmgRmgnphynw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u7QRI5ae4DVoyuIlZ491EOfP0O+Z+Ybtqzmw69FUgKbT8MvCxfgpQ7Xyjc7a6YxbL
	 4zpBPThoQ8Sp8HOWYzyIxxmrhtY2MYV70RreUfd4rLLejwYzP9cGw8OTuQjlK08bAh
	 1nBO/IOH88QAHv8sVY4K/GixPjJaZ0DW+JcT1IfuBZKz9kmwWAVr6KdQPDJF5rXHSB
	 34E98YVGzR/Zsvx8Snx/QthEgmTSa8RKMqBLyhBjS7qxBZn4LQEWXv8yMQVUMJmrCB
	 6Oa2dJsMpTJky4a2QnwsXbkcB/5Q3z5qLOO8eTa0u7s6yEbFJLB782+K/tEHHN+7Kf
	 JenwFgchYh2uA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8]=20xen/console:=20introduce=20domain=5Fconsole=20struct?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1752654876131
Message-Id: <9ee0645e-2cf3-46b2-b35d-c8a37a0afb8b@vates.tech>
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
References: <20250716020447.1029992-1-dmukhin@ford.com>
In-Reply-To: <20250716020447.1029992-1-dmukhin@ford.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.05a0ad372f58408286f8c5d20831ec7d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250716:md
Date: Wed, 16 Jul 2025 08:34:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 16/07/2025 =C3=A0 07:11, dmukhin@ford.com a =C3=A9crit=C2=A0:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce domain_console for grouping data structures used for integratin=
g
> domain's diagnostic console with Xen's console driver.
> 
> Group all pbuf-related data structures under domain_console. Rename the m=
oved
> fields to plain .buf, .idx and .lock names, since all uses of the fields =
are
> touched.
> 
> Bump the domain console buffer allocation size to 256. No extra symbol fo=
r the
> value since it is used only once during data structure declaration. All s=
ize
> checks use ARRAY_SIZE().
> 
> Allocate domain_console from the heap so that the parent domain struct si=
ze
> stays below PAGE_SIZE boundary to account for more console-related fields
> added in the future.
> 
> Finally, update the domain_console allocation and initialization code.
> 
> No functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

> ---
> Changes since v7:
> - use ARRAY_SIZE() for cons->buf checks
> - update the commit message
> ---
>   xen/arch/arm/vpl011.c      |  2 +-
>   xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
>   xen/arch/x86/pv/shim.c     |  2 +-
>   xen/common/domain.c        | 19 +++++++++----------
>   xen/drivers/char/console.c | 21 +++++++++++----------
>   xen/include/xen/sched.h    | 22 ++++++++++++----------
>   6 files changed, 44 insertions(+), 40 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 480fc664fc62..d0d17c76b72c 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl01=
1_init_info *info)
>       }
>       else
>       {
> -        d->console.input_allowed =3D true;
> +        d->console->input_allowed =3D true;
>           vpl011->backend_in_domain =3D false;
>   
>           vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 56c7de39778b..684d2c0c195c 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>   static int cf_check hvm_print_line(
>       int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>   {
> -    struct domain *cd =3D current->domain;
> +    const struct domain *d =3D current->domain;
> +    struct domain_console *cons =3D d->console;
>       char c =3D *val;
>   
>       ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
>       if ( !is_console_printable(c) )
>           return X86EMUL_OKAY;
>   
> -    spin_lock(&cd->pbuf_lock);
> +    spin_lock(&cons->lock);
> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>       if ( c !=3D '\n' )
> -        cd->pbuf[cd->pbuf_idx++] =3D c;
> -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n')=
 )
> +        cons->buf[cons->idx++] =3D c;
> +    if ( (cons->idx =3D=3D (ARRAY_SIZE(cons->buf) - 1)) || (c =3D=3D '\n=
') )
>       {
> -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx =3D 0;
> +        cons->buf[cons->idx] =3D '\0';
> +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> +        cons->idx =3D 0;
>       }
> -    spin_unlock(&cd->pbuf_lock);
> +    spin_unlock(&cons->lock);
>   
>       return X86EMUL_OKAY;
>   }
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index bc2a7dd5fae5..bd29c53a2d34 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pg=
entry_t *l4start,
>        */
>       d->max_pages =3D domain_tot_pages(d);
>   
> -    d->console.input_allowed =3D true;
> +    d->console->input_allowed =3D true;
>   }
>   
>   static void write_start_info(struct domain *d)
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..caef4cc8d649 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>       BUG_ON(!d->is_dying);
>       BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
>   
> -    xfree(d->pbuf);
> +    xvfree(d->console);
>   
>       argo_destroy(d);
>   
> @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
>           flags |=3D CDF_hardware;
>           if ( old_hwdom )
>               old_hwdom->cdf &=3D ~CDF_hardware;
> -
> -        d->console.input_allowed =3D true;
>       }
>   
>       /* Holding CDF_* internal flags. */
> @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
>       spin_lock_init(&d->shutdown_lock);
>       d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
>   
> -    spin_lock_init(&d->pbuf_lock);
> -
>       rwlock_init(&d->vnuma_rwlock);
>   
>   #ifdef CONFIG_HAS_PCI
> @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
>   
>       /* All error paths can depend on the above setup. */
>   
> +    err =3D -ENOMEM;
> +    d->console =3D xvzalloc(typeof(*d->console));
> +    if ( !d->console )
> +        goto fail;
> +
> +    spin_lock_init(&d->console->lock);
> +    d->console->input_allowed =3D is_hardware_domain(d);
> +
>       /*
>        * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-do=
main
>        * resources want to be sized based on max_vcpus.
> @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
>       if ( (err =3D argo_init(d)) !=3D 0 )
>           goto fail;
>   
> -    err =3D -ENOMEM;
> -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> -        goto fail;
> -
>       if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
>           goto fail;
>   
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ba5a809a99fb..b0d50a910e27 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
>       if ( !d )
>           return NULL;
>   
> -    if ( d->console.input_allowed )
> +    if ( d->console->input_allowed )
>           return d;
>   
>       rcu_unlock_domain(d);
> @@ -564,7 +564,7 @@ static void console_switch_input(void)
>           {
>               rcu_unlock_domain(d);
>   
> -            if ( !d->console.input_allowed )
> +            if ( !d->console->input_allowed )
>                   continue;
>   
>               console_rx =3D next_rx;
> @@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
>           else
>           {
>               char *kin =3D kbuf, *kout =3D kbuf, c;
> +            struct domain_console *cons =3D cd->console;
>   
>               /* Strip non-printable characters */
>               do
> @@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
>               } while ( --kcount > 0 );
>   
>               *kout =3D '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cons->lock);
>               kcount =3D kin - kbuf;
>               if ( c !=3D '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1))=
 )
> +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1=
)) )
>               {
>                   /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx +=3D (kout - kbuf);
> +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> +                cons->idx +=3D kout - kbuf;
>               }
>               else
>               {
> -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf=
);
> -                cd->pbuf_idx =3D 0;
> +                cons->buf[cons->idx] =3D '\0';
> +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbu=
f);
> +                cons->idx =3D 0;
>               }
> -            spin_unlock(&cd->pbuf_lock);
> +            spin_unlock(&cons->lock);
>           }
>   
>           guest_handle_add_offset(buffer, kcount);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7ba..f7bb44328bbc 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,17 @@ struct evtchn_port_ops;
>   
>   #define MAX_NR_IOREQ_SERVERS 8
>   
> +/* Domain console settings. */
> +struct domain_console {
> +    /* Permission to take ownership of the physical console input. */
> +    bool input_allowed;
> +
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    unsigned int idx;
> +    spinlock_t lock;
> +    char buf[256];
> +};
> +
>   struct domain
>   {
>       domid_t          domain_id;
> @@ -562,12 +573,6 @@ struct domain
>       /* Control-plane tools handle for this domain. */
>       xen_domain_handle_t handle;
>   
> -    /* hvm_print_line() and guest_console_write() logging. */
> -#define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned int pbuf_idx;
> -    spinlock_t  pbuf_lock;
> -
>       /* OProfile support. */
>       struct xenoprof *xenoprof;
>   
> @@ -653,10 +658,7 @@ struct domain
>   #endif
>   
>       /* Console settings. */
> -    struct {
> -        /* Permission to take ownership of the physical console input. *=
/
> -        bool input_allowed;
> -    } console;
> +    struct domain_console *console;
>   } __aligned(PAGE_SIZE);
>   
>   static inline struct page_list_head *page_to_list(


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



