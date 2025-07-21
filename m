Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A96B0C592
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 15:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051545.1419894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqxZ-0004GW-Kn; Mon, 21 Jul 2025 13:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051545.1419894; Mon, 21 Jul 2025 13:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udqxZ-0004Ec-H1; Mon, 21 Jul 2025 13:53:41 +0000
Received: by outflank-mailman (input) for mailman id 1051545;
 Mon, 21 Jul 2025 13:53:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQHN=2C=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1udqxX-0004ER-Fs
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 13:53:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d846e6-663a-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 15:53:37 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso33001585e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 06:53:37 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4563b74f8a9sm103045155e9.26.2025.07.21.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 06:53:36 -0700 (PDT)
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
X-Inumbo-ID: 19d846e6-663a-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753106017; x=1753710817; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8w7ZUzksc2+/fYCBIFzirVRcz2VYGHJC3/dP2b4+1w=;
        b=lPW5CPMJLsoS7wEkC2TZBFdMzQcv65lcUIbqbHOFyauLb9VLQ2JDWotaCfmKoxDKrp
         XlH+4uh6dE/hkK5fYYNDVb/AUOxtNxOS1WhbrC5Womzk3+Jfh6atepLji6oCcTQCXePU
         MN1kVNhGnw1Iihr1pqKjmsuw64uzkLXl7y1UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753106017; x=1753710817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8w7ZUzksc2+/fYCBIFzirVRcz2VYGHJC3/dP2b4+1w=;
        b=WyNN1UjVk0Q0q3JWUiTqC5CJa3gTHfFCj32LVrPQ6eJQZ4UVLUzi/m5I/VIV5Kd0zN
         zdujfQN1h5iu3K0Udjy7Wb1S3fDmQQa+q9/Mg1nt3MP307P2Xzmv6YXMvENRo55Jmu02
         +q3G+MHG9b6HPlhFYkk0q8RmZ8avgw6fU3dCyEw3Xzwunj2By0fpEuIHwK5ciVZxBlIA
         iHLW5+0r/yXg9YouTpJyslPvCG5SYIboLV4zby7JIhaH79L0xYRZW8slm9iE66z6Ruuq
         N4ogVjCfTThP5MwKiZGXfasHH0gY838/tWJe8YK3EvWSVT2CW9p07A7JSHb2xCdQLIX/
         yjhA==
X-Gm-Message-State: AOJu0Yw4YqWFXXddRJMbMXijCN2dqjoMMMVDielcMVxog2MymnQzGrmd
	FCLerJWelny8nVf4LcrIkUf+K99Wb+f5zSDmkaj01QPwYaMfSLpcQfJl1gd+4ntdgzM=
X-Gm-Gg: ASbGncskokZGT15AQI6/419x1JKCWgIUz25S+ZONbCWbv/9VXagLBPZqbtlsawjQeQy
	1eY25Zr5C37cRKposy+KUsT1EhKCfSPrHtUrGNHF9sr+zT8EVy6lboYII5QE836hh70kaOr683t
	a+NpWUUT4dQrIm8swcZr3Hf170FlL7ikkDvShLw457lrrWfvyQBW7Scn18665/I298PFHL7bynO
	8SpaM3c9DzeYCcivOKtB0Oco8xB1GT+t9sJTAQvHAZ96xB4b5egYPRVQriqzLQHXWOO++Rm29Fk
	PzWRM2oixOFzku2vuEz/3OyD3sUjU0wnmd7NxyOo2g+ytUuGx8qz4XYwqWEN5r614/kzk2UMhYh
	js8wfhK509oX/sS3htaRd4wrMZTEYWQT6LcmKi9UjHW/6SYRD4ot9OPLzcgQESU0KAA==
X-Google-Smtp-Source: AGHT+IFgcELBpTo0MvkY4ay9xg53Ypkcnmw4i4TPKw3r/zng6j00Mkcs9ppg7BSaP6DbHYPcgZK+0A==
X-Received: by 2002:a05:600c:310b:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-4562e29c33emr174989585e9.29.1753106016864;
        Mon, 21 Jul 2025 06:53:36 -0700 (PDT)
Date: Mon, 21 Jul 2025 15:53:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v8] xen/console: introduce domain_console struct
Message-ID: <aH5GX8kYIPBvb10c@macbook.local>
References: <20250716020447.1029992-1-dmukhin@ford.com>
 <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com>

On Fri, Jul 18, 2025 at 01:04:56PM +0200, Alejandro Vallejo wrote:
> Hi,
> 
> I like the new encapsulation, but I have a few questions.
> 
> On Wed Jul 16, 2025 at 4:04 AM CEST, dmukhin wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> >
> > Introduce domain_console for grouping data structures used for integrating
> > domain's diagnostic console with Xen's console driver.
> >
> > Group all pbuf-related data structures under domain_console. Rename the moved
> > fields to plain .buf, .idx and .lock names, since all uses of the fields are
> > touched.
> >
> > Bump the domain console buffer allocation size to 256. No extra symbol for the
> > value since it is used only once during data structure declaration. All size
> > checks use ARRAY_SIZE().
> >
> > Allocate domain_console from the heap so that the parent domain struct size
> > stays below PAGE_SIZE boundary to account for more console-related fields
> > added in the future.
> >
> > Finally, update the domain_console allocation and initialization code.
> >
> > No functional change.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v7:
> > - use ARRAY_SIZE() for cons->buf checks
> > - update the commit message
> > ---
> >  xen/arch/arm/vpl011.c      |  2 +-
> >  xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
> >  xen/arch/x86/pv/shim.c     |  2 +-
> >  xen/common/domain.c        | 19 +++++++++----------
> >  xen/drivers/char/console.c | 21 +++++++++++----------
> >  xen/include/xen/sched.h    | 22 ++++++++++++----------
> >  6 files changed, 44 insertions(+), 40 deletions(-)
> >
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 480fc664fc62..d0d17c76b72c 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
> >      }
> >      else
> >      {
> > -        d->console.input_allowed = true;
> > +        d->console->input_allowed = true;
> >          vpl011->backend_in_domain = false;
> >  
> >          vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index 56c7de39778b..684d2c0c195c 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
> >  static int cf_check hvm_print_line(
> >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> >  {
> > -    struct domain *cd = current->domain;
> > +    const struct domain *d = current->domain;
> > +    struct domain_console *cons = d->console;
> >      char c = *val;
> >  
> >      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
> > @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
> >      if ( !is_console_printable(c) )
> >          return X86EMUL_OKAY;
> >  
> > -    spin_lock(&cd->pbuf_lock);
> > +    spin_lock(&cons->lock);
> > +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
> >      if ( c != '\n' )
> > -        cd->pbuf[cd->pbuf_idx++] = c;
> > -    if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
> > +        cons->buf[cons->idx++] = c;
> > +    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
> >      {
> > -        cd->pbuf[cd->pbuf_idx] = '\0';
> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > -        cd->pbuf_idx = 0;
> > +        cons->buf[cons->idx] = '\0';
> > +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> > +        cons->idx = 0;
> >      }
> > -    spin_unlock(&cd->pbuf_lock);
> > +    spin_unlock(&cons->lock);
> >  
> >      return X86EMUL_OKAY;
> >  }
> > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> > index bc2a7dd5fae5..bd29c53a2d34 100644
> > --- a/xen/arch/x86/pv/shim.c
> > +++ b/xen/arch/x86/pv/shim.c
> > @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
> >       */
> >      d->max_pages = domain_tot_pages(d);
> >  
> > -    d->console.input_allowed = true;
> > +    d->console->input_allowed = true;
> >  }
> >  
> >  static void write_start_info(struct domain *d)
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 303c338ef293..caef4cc8d649 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
> >      BUG_ON(!d->is_dying);
> >      BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
> >  
> > -    xfree(d->pbuf);
> > +    xvfree(d->console);
> 
> XVFREE() to avoid a dangling pointer. But look at the end. I'd just remove the
> pointer altogether.
> 
> >  
> >      argo_destroy(d);
> >  
> > @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
> >          flags |= CDF_hardware;
> >          if ( old_hwdom )
> >              old_hwdom->cdf &= ~CDF_hardware;
> > -
> > -        d->console.input_allowed = true;
> >      }
> >  
> >      /* Holding CDF_* internal flags. */
> > @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
> >      spin_lock_init(&d->shutdown_lock);
> >      d->shutdown_code = SHUTDOWN_CODE_INVALID;
> >  
> > -    spin_lock_init(&d->pbuf_lock);
> > -
> >      rwlock_init(&d->vnuma_rwlock);
> >  
> >  #ifdef CONFIG_HAS_PCI
> > @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
> >  
> >      /* All error paths can depend on the above setup. */
> >  
> > +    err = -ENOMEM;
> > +    d->console = xvzalloc(typeof(*d->console));
> > +    if ( !d->console )
> > +        goto fail;
> > +
> > +    spin_lock_init(&d->console->lock);
> > +    d->console->input_allowed = is_hardware_domain(d);
> > +
> >      /*
> >       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
> >       * resources want to be sized based on max_vcpus.
> > @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
> >      if ( (err = argo_init(d)) != 0 )
> >          goto fail;
> >  
> > -    err = -ENOMEM;
> > -    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > -    if ( !d->pbuf )
> > -        goto fail;
> > -
> >      if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
> >          goto fail;
> >  
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index ba5a809a99fb..b0d50a910e27 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
> >      if ( !d )
> >          return NULL;
> >  
> > -    if ( d->console.input_allowed )
> > +    if ( d->console->input_allowed )
> >          return d;
> >  
> >      rcu_unlock_domain(d);
> > @@ -564,7 +564,7 @@ static void console_switch_input(void)
> >          {
> >              rcu_unlock_domain(d);
> >  
> > -            if ( !d->console.input_allowed )
> > +            if ( !d->console->input_allowed )

Is there a chance that domain being destroyed can also get here with
proper timing?  I don't think it's currently possible, as the freeing
of the buffer is done in the last leg of domain destruction, which is
not preemptible.

However there might a race in console_switch_input(), as the rcu lock
is dropped before checking d->console.input_allowed, which could allow
for the domain to be destroyed in the middle?  I don't think this is
realistic under a normal scenario, but could be possible if running
Xen nested or similar, where Xen CPUs can get de-scheduled.

> >                  continue;
> >  
> >              console_rx = next_rx;
> > @@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >          else
> >          {
> >              char *kin = kbuf, *kout = kbuf, c;
> > +            struct domain_console *cons = cd->console;
> >  
> >              /* Strip non-printable characters */
> >              do
> > @@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >              } while ( --kcount > 0 );
> >  
> >              *kout = '\0';
> > -            spin_lock(&cd->pbuf_lock);
> > +            spin_lock(&cons->lock);
> >              kcount = kin - kbuf;
> >              if ( c != '\n' &&
> > -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
> > +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
> >              {
> >                  /* buffer the output until a newline */
> > -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> > -                cd->pbuf_idx += (kout - kbuf);
> > +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> > +                cons->idx += kout - kbuf;
> >              }
> >              else
> >              {
> > -                cd->pbuf[cd->pbuf_idx] = '\0';
> > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
> > -                cd->pbuf_idx = 0;
> > +                cons->buf[cons->idx] = '\0';
> > +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);
> > +                cons->idx = 0;
> >              }
> > -            spin_unlock(&cd->pbuf_lock);
> > +            spin_unlock(&cons->lock);
> >          }
> >  
> >          guest_handle_add_offset(buffer, kcount);
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index fe53d4fab7ba..f7bb44328bbc 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -371,6 +371,17 @@ struct evtchn_port_ops;
> >  
> >  #define MAX_NR_IOREQ_SERVERS 8
> >  
> > +/* Domain console settings. */
> > +struct domain_console {
> > +    /* Permission to take ownership of the physical console input. */
> > +    bool input_allowed;
> > +
> > +    /* hvm_print_line() and guest_console_write() logging. */
> > +    unsigned int idx;
> > +    spinlock_t lock;
> > +    char buf[256];
> 
> I'd rather see things a bit shuffled. Like:
> 
>       /* hvm_print_line() and guest_console_write() logging. */
>       spinlock_t lock;
>       unsigned int idx;
>       char buf[255];
> 
>       /* Permission to take ownership of the physical console input. */
>       bool input_allowed;
> 	
> That way the struct is fully packed (note the s/256/255/) and input_allowed
> remains visually away from the other group of fields.
> input_allowed remains away from the lock, indicating that input_allowed
> 
> Note that the lock is 64bit aligned when CONFIG_DEBUG_LOCK_PROFILE is set.
> 
> Thoughts?
> 
> > +};
> > +
> >  struct domain
> >  {
> >      domid_t          domain_id;
> > @@ -562,12 +573,6 @@ struct domain
> >      /* Control-plane tools handle for this domain. */
> >      xen_domain_handle_t handle;
> >  
> > -    /* hvm_print_line() and guest_console_write() logging. */
> > -#define DOMAIN_PBUF_SIZE 200
> > -    char       *pbuf;
> > -    unsigned int pbuf_idx;
> > -    spinlock_t  pbuf_lock;
> > -
> >      /* OProfile support. */
> >      struct xenoprof *xenoprof;
> >  
> > @@ -653,10 +658,7 @@ struct domain
> >  #endif
> >  
> >      /* Console settings. */
> > -    struct {
> > -        /* Permission to take ownership of the physical console input. */
> > -        bool input_allowed;
> > -    } console;
> > +    struct domain_console *console;
> 
> Why a pointer? domain_console is a fixed-size type, so unless the domain is
> overflowing PAGE_SIZE (which we very definitely don't want either) I'd consider
> making it a regular member Simplifies memory management too. No alloc/free nor
> potential dangling pointers.

The buffer can be variable in size in principle, so we should better
keep that as a separate allocation.  Also note that system domains
avoid allocating this buffer altogether, which we want to keep doing.
I don't have a strong opinion whether to allocate all the fields, or
just the buffer, but at least the buffer needs to be kept as an
external allocation from struct domain.

Thanks, Roger.

