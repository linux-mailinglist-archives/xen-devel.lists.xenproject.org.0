Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90BB1B291
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 13:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070347.1433999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujFkT-0004FK-Fj; Tue, 05 Aug 2025 11:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070347.1433999; Tue, 05 Aug 2025 11:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujFkT-0004Dw-CO; Tue, 05 Aug 2025 11:22:29 +0000
Received: by outflank-mailman (input) for mailman id 1070347;
 Tue, 05 Aug 2025 11:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujFkS-0004Dq-7a
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 11:22:28 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 777e563b-71ee-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 13:22:27 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so3710328f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 04:22:27 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3c33fesm19083698f8f.29.2025.08.05.04.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 04:22:25 -0700 (PDT)
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
X-Inumbo-ID: 777e563b-71ee-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754392946; x=1754997746; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vb12vK4YDW6kaP7yHCW2OjLcwlaEqIPC8aHdGQ+Wcuc=;
        b=KdZR/AYylKQivBr0wqN9wAvyt/XNEP6NdMkgkUS534tMVDiNqrrjlf+EScitBbgiAN
         vihgkuQPxJJnwqZESs477d/fi+BsqGS7cEiSuEQ1eDkfq6m18FFV/2DY5ppqToiEROum
         +p7aXZbpR4+ZGxEahMHjP9OVhWrxqZpeTE4sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754392946; x=1754997746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb12vK4YDW6kaP7yHCW2OjLcwlaEqIPC8aHdGQ+Wcuc=;
        b=MQEQpVyx1YbwFN//0AsKmvmxCMpqyLXz4pO4Fn0nDXvnPvf/2QKgQi1DYI1dSsxtCx
         zy363S90iKxkdqwmnZvFLA5oZN7+zv+Py2COK4ML2NrZUeOmeQXz7faouuZP44/l3un7
         KIGY20c8fMW15Q9k0tcoI1ZpPYlp5Ckf3R+uACIGiKeHiDRuqb76vymtbdz+GhanJNog
         SYfUK+NB32jvv5W92/vQHvEKJFt39D2LX/5GzRrPYdtiIsE+qR7V6Lzvb3/3Ht+Y5biQ
         vIqtgYkx4AcNzs8YCJBBKgu+yPSXioAk9rMIs3wSTsLAkJN06agpkgzHIESPuiqQEXlr
         VhPg==
X-Gm-Message-State: AOJu0YzmmOTTyjVKNaDFekI3uEs8Tm5SFjtaxJ29OxZsAUmpbPnF5U7Z
	Heu/ANTCt9hkXBDZ1R3TwebtHbNFJEwjYAY3IB6SPPLkiZdbiEtoVvuGuoOnQSOqWaU=
X-Gm-Gg: ASbGncvz1SHXVkUaYXnJFF16dXSDEuSupMh0UVDB4r1I14ni/06IoB1IPs4KFX7XIO9
	+TPAZUKr0y3Q5C001HkJbLXfTKSxK2fGbuu1/266ccTlZBsP//+mtJ6TdGsOvDYGdK/VvUALISr
	iTqotq5uawMsM/1swYQyJmWXQ+XhsZD3DfHF9BiCHwaZsfh0mfbBtXfVStxSIH9y++ZecRvOrFX
	OnBOyZc0U8clkKzPUB+o6Dkm10Qw0bQDHUvsSbMMXFwsll/r4ljCeGjXY7wxISIfNMEKyCYRGMl
	urfByvhWuKMKqQZc57yfRXDtQpzflKZZQEsIUkKbCsC5mzS+5GELDxouyUlaOFfKQohjB5X5mEq
	V0QtYOP4ZxZIxpQg2VxgOfWSufPeFO0GpydBwvXLBs4LuA3cVgDUqgt5X9yy/0RI3jmP1RsRYGG
	Mm
X-Google-Smtp-Source: AGHT+IEFKgjtnVjHMthObN55/fEtKtyZ6Lt2uHRrtFggXnXt569vwoQY1lMtONYvBgupTDiGb8XM5A==
X-Received: by 2002:a5d:64ec:0:b0:3ab:27f9:e51 with SMTP id ffacd0b85a97d-3b8d94bbb3amr9646808f8f.31.1754392946288;
        Tue, 05 Aug 2025 04:22:26 -0700 (PDT)
Date: Tue, 5 Aug 2025 13:22:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	teddy.astie@vates.tech, dmukhin@ford.com
Subject: Re: [PATCH v10] xen/console: introduce domain_console struct
Message-ID: <aJHpcVCuMcXmXejj@macbook.local>
References: <20250725210525.736706-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250725210525.736706-1-dmukhin@ford.com>

On Fri, Jul 25, 2025 at 09:08:02PM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Introduce domain_console for grouping data structures used for integrating
> domain's diagnostic console with Xen's console driver.
> 
> Group all pbuf-related data structures under domain_console. Rename the moved
> fields to plain .buf, .idx and .lock names, since all uses of the fields are
> touched.
> 
> Ensure accesses to domain_console pointer are valid in console_switch_input().
> 
> Bump the domain console buffer allocation size to 256. No extra symbol for the
> value since it is used only once during data structure declaration. All size
> checks use ARRAY_SIZE().
> 
> Allocate domain_console from the heap so that the parent domain struct size
> stays below PAGE_SIZE boundary to account for more console-related fields
> added in the future.
> 
> Finally, update the domain_console allocation and initialization code.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Just one request about the allocation of the domain_console in
domain_create().

> ---
> Changes since v9:
> - kept cd as is in hvm_print_line() as requested
> - dropped domain lock in hvm_print_line()
> 
> Link to v9: https://lore.kernel.org/xen-devel/20250723001116.186009-1-dmukhin@ford.com/
> ---
>  xen/arch/arm/vpl011.c      |  2 +-
>  xen/arch/x86/hvm/hvm.c     | 16 +++++++++-------
>  xen/arch/x86/pv/shim.c     |  2 +-
>  xen/common/domain.c        | 19 +++++++++----------
>  xen/drivers/char/console.c | 28 ++++++++++++++++------------
>  xen/include/xen/sched.h    | 24 +++++++++++++-----------
>  6 files changed, 49 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 480fc664fc62..d0d17c76b72c 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>      }
>      else
>      {
> -        d->console.input_allowed = true;
> +        d->console->input_allowed = true;
>          vpl011->backend_in_domain = false;
>  
>          vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 56c7de39778b..37af507a8d90 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -560,6 +560,7 @@ static int cf_check hvm_print_line(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
>      struct domain *cd = current->domain;
> +    struct domain_console *cons = cd->console;
>      char c = *val;
>  
>      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
> @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;
>  
> -    spin_lock(&cd->pbuf_lock);
> +    spin_lock(&cons->lock);
> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>      if ( c != '\n' )
> -        cd->pbuf[cd->pbuf_idx++] = c;
> -    if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
> +        cons->buf[cons->idx++] = c;
> +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
>      {
> -        cd->pbuf[cd->pbuf_idx] = '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx = 0;
> +        cons->buf[cons->idx] = '\0';
> +        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cons->buf);
> +        cons->idx = 0;
>      }
> -    spin_unlock(&cd->pbuf_lock);
> +    spin_unlock(&cons->lock);
>  
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index bc2a7dd5fae5..bd29c53a2d34 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
>       */
>      d->max_pages = domain_tot_pages(d);
>  
> -    d->console.input_allowed = true;
> +    d->console->input_allowed = true;
>  }
>  
>  static void write_start_info(struct domain *d)
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..caef4cc8d649 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>      BUG_ON(!d->is_dying);
>      BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
>  
> -    xfree(d->pbuf);
> +    xvfree(d->console);

Nit: even if the struct if being freed just a couple of lines below, I
would use XVFREE() here.

>  
>      argo_destroy(d);
>  
> @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
>          flags |= CDF_hardware;
>          if ( old_hwdom )
>              old_hwdom->cdf &= ~CDF_hardware;
> -
> -        d->console.input_allowed = true;
>      }
>  
>      /* Holding CDF_* internal flags. */
> @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
>      spin_lock_init(&d->shutdown_lock);
>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>  
> -    spin_lock_init(&d->pbuf_lock);
> -
>      rwlock_init(&d->vnuma_rwlock);
>  
>  #ifdef CONFIG_HAS_PCI
> @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
>  
>      /* All error paths can depend on the above setup. */
>  
> +    err = -ENOMEM;
> +    d->console = xvzalloc(typeof(*d->console));
> +    if ( !d->console )
> +        goto fail;
> +
> +    spin_lock_init(&d->console->lock);
> +    d->console->input_allowed = is_hardware_domain(d);

That's too early to do the allocation of the console buffer AFAICT.
It needs to be done after the:

    if ( is_system_domain(d) )
        return d;

check, as allocating a console buffer for system domains is pointless.

> +
>      /*
>       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
>       * resources want to be sized based on max_vcpus.
> @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
>      if ( (err = argo_init(d)) != 0 )
>          goto fail;
>  
> -    err = -ENOMEM;
> -    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> -        goto fail;
> -
>      if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
>          goto fail;
>  
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 963c7b043cd8..75fa033ce74d 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -526,7 +526,7 @@ struct domain *console_get_domain(void)
>      if ( !d )
>          return NULL;
>  
> -    if ( d->console.input_allowed )
> +    if ( d->console->input_allowed )
>          return d;
>  
>      rcu_unlock_domain(d);
> @@ -567,10 +567,13 @@ static void console_switch_input(void)
>          d = rcu_lock_domain_by_id(domid);
>          if ( d )
>          {
> -            rcu_unlock_domain(d);
> -
> -            if ( !d->console.input_allowed )
> +            if ( !d->console->input_allowed )
> +            {
> +                rcu_unlock_domain(d);
>                  continue;
> +            }
> +
> +            rcu_unlock_domain(d);
>  
>              console_rx = next_rx;
>              printk("*** Serial input to DOM%u", domid);
> @@ -749,6 +752,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>          else
>          {
>              char *kin = kbuf, *kout = kbuf, c;
> +            struct domain_console *cons = cd->console;
>  
>              /* Strip non-printable characters */
>              do
> @@ -761,22 +765,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>              } while ( --kcount > 0 );
>  
>              *kout = '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cons->lock);
>              kcount = kin - kbuf;
>              if ( c != '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
> +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
>              {
>                  /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx += (kout - kbuf);
> +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> +                cons->idx += kout - kbuf;
>              }
>              else
>              {
> -                cd->pbuf[cd->pbuf_idx] = '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
> -                cd->pbuf_idx = 0;
> +                cons->buf[cons->idx] = '\0';
> +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);
> +                cons->idx = 0;
>              }
> -            spin_unlock(&cd->pbuf_lock);
> +            spin_unlock(&cons->lock);
>          }
>  
>          guest_handle_add_offset(buffer, kcount);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7ba..c828d5626dea 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,17 @@ struct evtchn_port_ops;
>  
>  #define MAX_NR_IOREQ_SERVERS 8
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
>  struct domain
>  {
>      domid_t          domain_id;
> @@ -562,12 +573,6 @@ struct domain
>      /* Control-plane tools handle for this domain. */
>      xen_domain_handle_t handle;
>  
> -    /* hvm_print_line() and guest_console_write() logging. */
> -#define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned int pbuf_idx;
> -    spinlock_t  pbuf_lock;
> -
>      /* OProfile support. */
>      struct xenoprof *xenoprof;
>  
> @@ -652,11 +657,8 @@ struct domain
>      const unsigned int *llc_colors;
>  #endif
>  
> -    /* Console settings. */
> -    struct {
> -        /* Permission to take ownership of the physical console input. */
> -        bool input_allowed;
> -    } console;
> +    /* Pointer to console settings; NULL for system Xen domains. */

Nit: I would drop Xen from the sentence above, "system domains" is a
well known entity in this context.

Thanks, Roger.

