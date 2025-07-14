Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877B9B04600
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 18:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043012.1413123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubMWE-00022O-FA; Mon, 14 Jul 2025 16:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043012.1413123; Mon, 14 Jul 2025 16:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubMWE-00020l-C6; Mon, 14 Jul 2025 16:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1043012;
 Mon, 14 Jul 2025 16:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqzr=Z3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ubMWD-00020f-6Q
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 16:59:09 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db50f076-60d3-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 18:59:08 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3127171f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 09:59:08 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4561d19a21dsm28812335e9.24.2025.07.14.09.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 09:59:07 -0700 (PDT)
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
X-Inumbo-ID: db50f076-60d3-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752512348; x=1753117148; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ohNr81ePIC25Anf5PFniS4vay6NOZUnKWNwoo32QrGg=;
        b=AiogZxdWcOzPwUodHehf5tftHwEcmYsIAcVs3oWZayUg7vVCYVv8KTswZZUNz5NQ6j
         H0b0z4Jq0W3nWHAFJFjKYwHUltRFYjGtvqg00cXWyiJvxZj0IxC/gEy8uE2zWyPx2yHj
         Q5sRqwFUwlc5RQDP25vSheE+qaLXn9k//67bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512348; x=1753117148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohNr81ePIC25Anf5PFniS4vay6NOZUnKWNwoo32QrGg=;
        b=PHXXOsJ4rxJ638N28cHPazgFxXV4savx7p4KVMKeNsDVtOTuVB8/SBsXFa/OFd50B+
         S/Fd265YZYvqd2klodIUE4EPiv37TrGylLDfcAbxphzUi8Jvvx4Kp3XkRB/DZpErWfTz
         cGC4ltzuIRSOp53JcmFTQ8OuB4JCl3JqdNffQ+IO564ESDxcVIGGDbzgMF/wH3bQuFVy
         ydGh7AvDBErt55iytHgw5SkcWUR483pMtz2kcRYpU9JH3Xu5wefVfEQnWR3C3EejU8E7
         9wgj+f2JIHr2KkotxU9Wz5K9XkR7N/cPrtPHmHhMu5RQYJBH5dyeWzv8xCB5TnhM+g/i
         BDYg==
X-Gm-Message-State: AOJu0YzL5bghVscYZyGJpMsMFZrNdatYU5NQQYx8vD0r+uGPoE0BIod+
	CLV4xCf3YwNzuEVr5ZuJY7jZO9fXcBGuKTsQBOaVrLaeSVX98FO1GDHxpvS8H/RsOEI=
X-Gm-Gg: ASbGnct71rajequLf6RCDSPKlnUe300stBfY7KgIZo83rxdbn11S1tr7Dy4kTHHip4G
	TBwgRB8mN0JxJJWVs9vsadpwPJW4kWUrRCSFCInGCA49/CQMLQKNfLIwgoiM2ZY5xU8GATE7izP
	LG2ZNXKZcvSWamWRwdXN/q7TC9m3atSS01Qxt/YwZgK+4bK4UGoqewrxd0yqQBwhbBIc/aFaPJJ
	jbowORN3Vq4G7FyT5EJs4tmFhLfZNDk/T1ZZTRGecJMZowzsd7HQN2xVgCI5aLMUWA74pa7lSBN
	KWwDsOg1jWiFDVm/Oo7VUP7Z0VCIC106rybQYa7BofkEHRGwUc5qhjqACfvgjC2SW5yq6E1UfLH
	VycA8u+Nc/UIgG6VlfXN3Qv2iyzxABVGGx9JjpobdcTCebLJoM9Wc6ly8aX/Wf9ErIg==
X-Google-Smtp-Source: AGHT+IF0tchMcRC8Au4rhshcImHKqFy2ZtrufAjYTxDJOrNIhE79aZMsdVCKOCQ/AhL6FBOKveZ/Tw==
X-Received: by 2002:a05:6000:43d8:b0:3b5:dc05:79b with SMTP id ffacd0b85a97d-3b5f188e8f5mr7902672f8f.14.1752512347560;
        Mon, 14 Jul 2025 09:59:07 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:59:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v7] xen/console: introduce domain_console struct
Message-ID: <aHU3WnxH-cKxrlFO@macbook.local>
References: <20250711004003.23920-1-dmukhin@ford.com>
 <aHDtU-9NOCb7UmSl@macbook.local>
 <aHFgVsxsVLKM1tE2@kraken>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHFgVsxsVLKM1tE2@kraken>

On Fri, Jul 11, 2025 at 07:04:59PM +0000, dmkhn@proton.me wrote:
> On Fri, Jul 11, 2025 at 12:54:11PM +0200, Roger Pau Monné wrote:
> > On Fri, Jul 11, 2025 at 12:40:11AM +0000, dmkhn@proton.me wrote:
> > > From: Denis Mukhin <dmukhin@ford.com>
> > >
> > > Introduce domain_console for grouping data structures used for integrating
> > > domain's diagnostic console with Xen's console driver.
> > >
> > > Group all pbuf-related data structures under domain_console. Rename the moved
> > > fields to plain .buf, .idx and .lock names, since all uses of the fields are
> > > touched.
> > >
> > > Bump the domain console buffer allocation size to 256.
> > >
> > > Rename domain console buffer size symbol to DOMAIN_CONSOLE_BUF_SIZE.
> > >
> > > Finally, update the domain_console allocation and initialization code.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > > ---
> > > Changes since v6:
> > > - reverted allocation of domain_console as in v5
> > > - dropped the commentary for DOMAIN_CONSOLE_BUF_SIZE
> > >
> > > Link to v6: https://lore.kernel.org/xen-devel/20250710013421.2321353-1-dmukhin@ford.com/
> > > CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1919473093
> > > ---
> > >  xen/arch/arm/vpl011.c      |  2 +-
> > >  xen/arch/x86/hvm/hvm.c     | 17 +++++++++--------
> > >  xen/arch/x86/pv/shim.c     |  2 +-
> > >  xen/common/domain.c        | 19 +++++++++----------
> > >  xen/drivers/char/console.c | 21 +++++++++++----------
> > >  xen/include/xen/sched.h    | 24 ++++++++++++++----------
> > >  6 files changed, 45 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > > index 2b6f2a09bca6..f4a840da10c5 100644
> > > --- a/xen/arch/arm/vpl011.c
> > > +++ b/xen/arch/arm/vpl011.c
> > > @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
> > >      }
> > >      else
> > >      {
> > > -        d->console.input_allowed = true;
> > > +        d->console->input_allowed = true;
> > >          vpl011->backend_in_domain = false;
> > >
> > >          vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index 56c7de39778b..2be98f6ccbd1 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
> > >  static int cf_check hvm_print_line(
> > >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
> > >  {
> > > -    struct domain *cd = current->domain;
> > > +    const struct domain *d = current->domain;
> > > +    struct domain_console *cons = d->console;
> > >      char c = *val;
> > >
> > >      ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
> > > @@ -571,16 +572,16 @@ static int cf_check hvm_print_line(
> > >      if ( !is_console_printable(c) )
> > >          return X86EMUL_OKAY;
> > >
> > > -    spin_lock(&cd->pbuf_lock);
> > > +    spin_lock(&cons->lock);
> > >      if ( c != '\n' )
> > > -        cd->pbuf[cd->pbuf_idx++] = c;
> > > -    if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
> > > +        cons->buf[cons->idx++] = c;
> > > +    if ( (cons->idx == (DOMAIN_CONSOLE_BUF_SIZE - 1)) || (c == '\n') )
> > >      {
> > > -        cd->pbuf[cd->pbuf_idx] = '\0';
> > > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> > > -        cd->pbuf_idx = 0;
> > > +        cons->buf[cons->idx] = '\0';
> > > +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> > > +        cons->idx = 0;
> > >      }
> > > -    spin_unlock(&cd->pbuf_lock);
> > > +    spin_unlock(&cons->lock);
> > >
> > >      return X86EMUL_OKAY;
> > >  }
> > > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> > > index bc2a7dd5fae5..bd29c53a2d34 100644
> > > --- a/xen/arch/x86/pv/shim.c
> > > +++ b/xen/arch/x86/pv/shim.c
> > > @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
> > >       */
> > >      d->max_pages = domain_tot_pages(d);
> > >
> > > -    d->console.input_allowed = true;
> > > +    d->console->input_allowed = true;
> > >  }
> > >
> > >  static void write_start_info(struct domain *d)
> > > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > > index 303c338ef293..caef4cc8d649 100644
> > > --- a/xen/common/domain.c
> > > +++ b/xen/common/domain.c
> > > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
> > >      BUG_ON(!d->is_dying);
> > >      BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
> > >
> > > -    xfree(d->pbuf);
> > > +    xvfree(d->console);
> > >
> > >      argo_destroy(d);
> > >
> > > @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
> > >          flags |= CDF_hardware;
> > >          if ( old_hwdom )
> > >              old_hwdom->cdf &= ~CDF_hardware;
> > > -
> > > -        d->console.input_allowed = true;
> > >      }
> > >
> > >      /* Holding CDF_* internal flags. */
> > > @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
> > >      spin_lock_init(&d->shutdown_lock);
> > >      d->shutdown_code = SHUTDOWN_CODE_INVALID;
> > >
> > > -    spin_lock_init(&d->pbuf_lock);
> > > -
> > >      rwlock_init(&d->vnuma_rwlock);
> > >
> > >  #ifdef CONFIG_HAS_PCI
> > > @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
> > >
> > >      /* All error paths can depend on the above setup. */
> > >
> > > +    err = -ENOMEM;
> > > +    d->console = xvzalloc(typeof(*d->console));
> > > +    if ( !d->console )
> > > +        goto fail;
> > > +
> > > +    spin_lock_init(&d->console->lock);
> > > +    d->console->input_allowed = is_hardware_domain(d);
> > > +
> > >      /*
> > >       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
> > >       * resources want to be sized based on max_vcpus.
> > > @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
> > >      if ( (err = argo_init(d)) != 0 )
> > >          goto fail;
> > >
> > > -    err = -ENOMEM;
> > > -    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
> > > -    if ( !d->pbuf )
> > > -        goto fail;
> > > -
> > >      if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
> > >          goto fail;
> > >
> > > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > > index f54632bc0811..469f5e8832da 100644
> > > --- a/xen/drivers/char/console.c
> > > +++ b/xen/drivers/char/console.c
> > > @@ -526,7 +526,7 @@ struct domain *console_get_domain(void)
> > >      if ( !d )
> > >          return NULL;
> > >
> > > -    if ( d->console.input_allowed )
> > > +    if ( d->console->input_allowed )
> > >          return d;
> > >
> > >      rcu_unlock_domain(d);
> > > @@ -569,7 +569,7 @@ static void console_switch_input(void)
> > >          {
> > >              rcu_unlock_domain(d);
> > >
> > > -            if ( !d->console.input_allowed )
> > > +            if ( !d->console->input_allowed )
> > >                  continue;
> > >
> > >              console_rx = next_rx;
> > > @@ -788,6 +788,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> > >          else
> > >          {
> > >              char *kin = kbuf, *kout = kbuf, c;
> > > +            struct domain_console *cons = cd->console;
> > >
> > >              /* Strip non-printable characters */
> > >              do
> > > @@ -800,22 +801,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> > >              } while ( --kcount > 0 );
> > >
> > >              *kout = '\0';
> > > -            spin_lock(&cd->pbuf_lock);
> > > +            spin_lock(&cons->lock);
> > >              kcount = kin - kbuf;
> > >              if ( c != '\n' &&
> > > -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
> > > +                 (cons->idx + (kout - kbuf) < (DOMAIN_CONSOLE_BUF_SIZE - 1)) )
> > >              {
> > >                  /* buffer the output until a newline */
> > > -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> > > -                cd->pbuf_idx += (kout - kbuf);
> > > +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> > > +                cons->idx += kout - kbuf;
> > >              }
> > >              else
> > >              {
> > > -                cd->pbuf[cd->pbuf_idx] = '\0';
> > > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
> > > -                cd->pbuf_idx = 0;
> > > +                cons->buf[cons->idx] = '\0';
> > > +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);
> > > +                cons->idx = 0;
> > >              }
> > > -            spin_unlock(&cd->pbuf_lock);
> > > +            spin_unlock(&cons->lock);
> > >          }
> > >
> > >          guest_handle_add_offset(buffer, kcount);
> > > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > > index fe53d4fab7ba..8771b7f22b48 100644
> > > --- a/xen/include/xen/sched.h
> > > +++ b/xen/include/xen/sched.h
> > > @@ -371,6 +371,19 @@ struct evtchn_port_ops;
> > >
> > >  #define MAX_NR_IOREQ_SERVERS 8
> > >
> > > +#define DOMAIN_CONSOLE_BUF_SIZE (256)
> > > +
> > > +/* Domain console settings. */
> > > +struct domain_console {
> > > +    /* Permission to take ownership of the physical console input. */
> > > +    bool input_allowed;
> > > +
> > > +    /* hvm_print_line() and guest_console_write() logging. */
> > > +    unsigned int idx;
> > > +    spinlock_t lock;
> > > +    char buf[DOMAIN_CONSOLE_BUF_SIZE];
> > > +};
> > > +
> > >  struct domain
> > >  {
> > >      domid_t          domain_id;
> > > @@ -562,12 +575,6 @@ struct domain
> > >      /* Control-plane tools handle for this domain. */
> > >      xen_domain_handle_t handle;
> > >
> > > -    /* hvm_print_line() and guest_console_write() logging. */
> > > -#define DOMAIN_PBUF_SIZE 200
> > > -    char       *pbuf;
> > > -    unsigned int pbuf_idx;
> > > -    spinlock_t  pbuf_lock;
> > > -
> > >      /* OProfile support. */
> > >      struct xenoprof *xenoprof;
> > >
> > > @@ -653,10 +660,7 @@ struct domain
> > >  #endif
> > >
> > >      /* Console settings. */
> > > -    struct {
> > > -        /* Permission to take ownership of the physical console input. */
> > > -        bool input_allowed;
> > > -    } console;
> > > +    struct domain_console *console;
> > 
> > I assume I'm missing some context, what's the reason for converting
> > this field into a pointer, instead of moving the existing fields
> > inside and allocate the buffer at domain_create()?
> 
> The reason is avoid crossing PAGE_SIZE boundary for domain structure *if* more
> console-related fields are added to the "domain console settings" (which will
> happen for console focus management and probably for vUARTs).

Oh, I see, maybe worth adding to the commit message, as otherwise
there's not much context as to why moving into a separately allocated
structure is done.

Thanks, Roger.

