Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E738D19F211
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 11:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNje-0006zR-2I; Mon, 06 Apr 2020 09:08:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLNjd-0006zM-49
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 09:08:01 +0000
X-Inumbo-ID: 1c97f390-77e6-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c97f390-77e6-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 09:07:59 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o1so18337610edv.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2020 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=IfL/XX9GkpiX/cPju57u0wHepVMIT6Ru2TzDa6jdcUE=;
 b=WY6VAeVsE0LmMnXdolNJMD8OTecWtVcQCmbVKADyzX7uzVzKPDePpvP4N6un2qqMIZ
 KxvSZbVC91KzbB5KpDCES8YiTx+NMvcFlf/nfMB+4jEnoK9p8+hytH5yTxSldfExcj0F
 PFVmCs3suEYzeoGNlZM5ysjLL9Q/igMR+Q+4/EXb6DBP3kEX+mJVxPbNhqoOQKWy1i7Y
 t2Ic+U2IW5apR2bSvoRzXSL80qoikIEJ5/SGaJ9ZK7MkkOckRXjrwDCRlz0PLa3CYL0j
 h/7zhVocK9b4wIj8kKtRIq+h9HGFf+mbijhRF6wWTXf77osXDhL6H4uh7EHwKxSSQN9j
 uOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=IfL/XX9GkpiX/cPju57u0wHepVMIT6Ru2TzDa6jdcUE=;
 b=nGo/8CJ5Mn/O1ozsswau+gTodQ/7LRY29juMps3YLwwsjXH3q3pNrQU665WYu2S5HI
 q/Zey7sTosgVaq9GEOy4cXjBcSkE0SARlQ4HrT8WYlyoC7EkJ1tF5FjOPoTiEEiIGVNU
 +eHpMXd/7e0uyCBEiHAeMfwLLdkGbwAg4r37n4vgIcmwpuR70tBmDCjdM5XNA3Sd7pcZ
 akfb0tSgGegRqn70/I1uO3AoWE2LyX7xTPJP2tR3ObDANxQ9gpJMqyHVeebS8kyq33lm
 zMtu5izYYf89YxOE97bC9zGjoY9wef9B2ZZ/uLCcRQPVeA+uUNU8nsV01Cc2HNoJ6UIJ
 VfuQ==
X-Gm-Message-State: AGi0PuaVTOWArMh7/hGc0FzYOOKGKecwhl6LM3M4OFPB42l4XT98q1qh
 QJJFqXF0Tv/dRJKIbuk2VHg=
X-Google-Smtp-Source: APiQypLf0/qysZZEtWDSufajWJuXRlIkZ90c85i2/B2V6SVJeZxkBqPYQcPMRqvxuZ7hQ0eAj6ydiw==
X-Received: by 2002:a17:906:a94a:: with SMTP id
 hh10mr20076968ejb.338.1586164078870; 
 Mon, 06 Apr 2020 02:07:58 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id j6sm265275ejs.88.2020.04.06.02.07.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:07:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-3-paul@xen.org>
 <fc193a54-5d25-ffff-2234-9c0079c605d8@xen.org>
In-Reply-To: <fc193a54-5d25-ffff-2234-9c0079c605d8@xen.org>
Subject: RE: [PATCH 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Date: Mon, 6 Apr 2020 10:07:57 +0100
Message-ID: <002501d60bf2$dda86480$98f92d80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AMpgZPTAkjvhuWofgieMA==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 01 April 2020 14:42
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu
> <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Jan
> Beulich <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH 2/5] xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
> 
> Hi Paul,
> 
> On 27/03/2020 18:50, Paul Durrant wrote:
> > These domctls provide a mechanism to get and set domain context from
> > the toolstack.
> >
> > Signed-off-by: Paul Durrant <paul@xen.org>
> > ---
> > Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >   tools/flask/policy/modules/xen.if   |   4 +-
> >   tools/libxc/include/xenctrl.h       |  11 +++
> >   tools/libxc/xc_domain.c             |  52 +++++++++++++
> >   xen/common/domctl.c                 | 115 ++++++++++++++++++++++++++++
> >   xen/include/public/domctl.h         |  41 +++++++++-
> >   xen/xsm/flask/hooks.c               |   6 ++
> >   xen/xsm/flask/policy/access_vectors |   4 +
> >   7 files changed, 230 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
> > index 8eb2293a52..2bc9db4f64 100644
> > --- a/tools/flask/policy/modules/xen.if
> > +++ b/tools/flask/policy/modules/xen.if
> > @@ -53,7 +53,7 @@ define(`create_domain_common', `
> >   	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
> >   			set_vnumainfo get_vnumainfo cacheflush
> >   			psr_cmt_op psr_alloc soft_reset
> > -			resource_map get_cpu_policy };
> > +			resource_map get_cpu_policy setcontext };
> >   	allow $1 $2:security check_context;
> >   	allow $1 $2:shadow enable;
> >   	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
> > @@ -97,7 +97,7 @@ define(`migrate_domain_out', `
> >   	allow $1 $2:hvm { gethvmc getparam };
> >   	allow $1 $2:mmu { stat pageinfo map_read };
> >   	allow $1 $2:domain { getaddrsize getvcpucontext pause destroy };
> > -	allow $1 $2:domain2 gettsc;
> > +	allow $1 $2:domain2 { gettsc getcontext };
> >   	allow $1 $2:shadow { enable disable logdirty };
> >   ')
> >
> > diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> > index fc6e57a1a0..5c0d0d27a4 100644
> > --- a/tools/libxc/include/xenctrl.h
> > +++ b/tools/libxc/include/xenctrl.h
> > @@ -867,6 +867,17 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
> >                                uint8_t *hvm_ctxt,
> >                                uint32_t size);
> >
> > +int xc_domain_getcontext(xc_interface *xch,
> > +                         uint32_t domid,
> > +                         uint32_t mask,
> > +                         uint8_t *ctxt_buf,
> 
> Why do you use uint8_t rather than void here?
> 
> > +                         uint32_t size);
> > +int xc_domain_setcontext(xc_interface *xch,
> > +                         uint32_t domid,
> > +                         uint32_t mask,
> > +                         uint8_t *ctxt_buf,
> > +                         uint32_t size);
> > +
> >   /**
> >    * This function will return guest IO ABI protocol
> >    *
> > diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
> > index 71829c2bce..15bcf671fc 100644
> > --- a/tools/libxc/xc_domain.c
> > +++ b/tools/libxc/xc_domain.c
> > @@ -537,6 +537,58 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
> >       return ret;
> >   }
> >
> > +int xc_domain_getcontext(xc_interface *xch,
> > +                         uint32_t domid,
> > +                         uint32_t mask,
> > +                         uint8_t *ctxt_buf,
> > +                         uint32_t size)
> > +{
> > +    int ret;
> > +    DECLARE_DOMCTL;
> > +    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
> > +
> > +    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
> > +        return -1;
> > +
> > +    domctl.cmd = XEN_DOMCTL_getdomaincontext;
> > +    domctl.domain = domid;
> > +    domctl.u.domaincontext.mask = mask;
> > +    domctl.u.domaincontext.size = size;
> > +    set_xen_guest_handle(domctl.u.domaincontext.buffer, ctxt_buf);
> > +
> > +    ret = do_domctl(xch, &domctl);
> > +
> > +    xc_hypercall_bounce_post(xch, ctxt_buf);
> > +
> > +    return !ret ? domctl.u.domaincontext.size : -1;
> 
> Looking at the domctl interface, size would be a 32-bit unsigned value.
> However the return is a 32-bit signed value. This is a call for trouble
> if the size is too big.
> 
> > +}
> > +
> > +int xc_domain_setcontext(xc_interface *xch,
> > +                         uint32_t domid,
> > +                         uint32_t mask,
> > +                         uint8_t *ctxt_buf,
> 
> The context is not meant to be modified. So this should really be const.
> 

All of the above were basically inherited via cut'n'paste from the HVM save code. I'll re-work it.

> > +                         uint32_t size)
> > +{
> > +    int ret;
> > +    DECLARE_DOMCTL;
> > +    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
> > +
> > +    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
> > +        return -1;
> > +
> > +    domctl.cmd = XEN_DOMCTL_setdomaincontext;
> > +    domctl.domain = domid;
> > +    domctl.u.domaincontext.mask = mask;
> > +    domctl.u.domaincontext.size = size;
> > +    set_xen_guest_handle(domctl.u.domaincontext.buffer, ctxt_buf);
> > +
> > +    ret = do_domctl(xch, &domctl);
> > +
> > +    xc_hypercall_bounce_post(xch, ctxt_buf);
> > +
> > +    return ret;
> > +}
> > +
> >   int xc_vcpu_getcontext(xc_interface *xch,
> >                          uint32_t domid,
> >                          uint32_t vcpu,
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index a69b3b59a8..9c39519b04 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -25,6 +25,7 @@
> >   #include <xen/hypercall.h>
> >   #include <xen/vm_event.h>
> >   #include <xen/monitor.h>
> > +#include <xen/save.h>
> >   #include <asm/current.h>
> >   #include <asm/irq.h>
> >   #include <asm/page.h>
> > @@ -358,6 +359,111 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
> >       return ERR_PTR(ret);
> >   }
> >
> > +struct domctl_context
> > +{
> > +    void *buffer;
> > +    size_t len;
> > +    size_t cur;
> > +};
> > +
> > +static int accumulate_size(void *priv, void *data, size_t len)
> > +{
> > +    struct domctl_context *c = priv;
> > +
> > +    c->len += len;
> 
> What does prevent overflow?
> 

Good point. That needs to be checked.

> > +
> > +    return 0;
> > +}
> > +
> > +static int save_data(void *priv, void *data, size_t len)
> > +{
> > +    struct domctl_context *c = priv;
> > +
> > +    if ( c->len - c->cur < len )
> > +        return -ENOSPC;
> > +
> > +    memcpy(c->buffer + c->cur, data, len);
> > +    c->cur += len;
> > +
> > +    return 0;
> > +}
> > +
> > +static int getdomaincontext(struct domain *d,
> > +                            struct xen_domctl_domaincontext *dc)
> > +{
> > +    struct domctl_context c = { };
> > +    int rc;
> > +
> > +    if ( d == current->domain )
> > +        return -EPERM;
> > +
> > +    if ( guest_handle_is_null(dc->buffer) ) /* query for buffer size */
> > +
> > +    {
> > +        if ( dc->size )
> > +            return -EINVAL;
> > +
> > +        /* dry run to acquire buffer size */
> > +        rc = domain_save(d, accumulate_size, &c, dc->mask, true);
> > +        if ( rc )
> > +            return rc;
> > +
> > +        dc->size = c.len;
> 
> len is a size_t (so 64-bit on 64-bit arch) value, but size is 32-bit. So
> we return an error if the stream is going to be bigger than 4G?
> 

I'd hope a 4G stream is unlikely but I'll expand size to 64 bits.

> > +        return 0;
> > +    }
> > +
> > +    c.len = dc->size;
> > +    c.buffer = xmalloc_bytes(c.len);
> > +    if ( !c.buffer )
> > +        return -ENOMEM;
> > +
> > +    rc = domain_save(d, save_data, &c, dc->mask, false);
> > +
> > +    dc->size = c.cur;
> > +    if ( !rc && copy_to_guest(dc->buffer, c.buffer, dc->size) )
> > +        rc = -EFAULT;
> > +
> > +    xfree(c.buffer);
> > +
> > +    return rc;
> > +}
> > +
> > +static int load_data(void *priv, void *data, size_t len)
> > +{
> > +    struct domctl_context *c = priv;
> > +
> > +    if ( c->len - c->cur < len )
> > +        return -ENODATA;
> > +
> > +    if ( data )
> > +        memcpy(data, c->buffer + c->cur, len);
> > +
> > +    c->cur += len;
> > +
> > +    return 0;
> > +}
> > +
> > +static int setdomaincontext(struct domain *d,
> > +                            const struct xen_domctl_domaincontext *dc)
> > +{
> > +    struct domctl_context c = { .len = dc->size };
> > +    int rc;
> > +
> > +    if ( d == current->domain )
> > +        return -EPERM;
> > +
> > +    c.buffer = xmalloc_bytes(c.len);
> > +    if ( !c.buffer )
> > +        return -ENOMEM;
> > +
> > +    rc = !copy_from_guest(c.buffer, dc->buffer, c.len) ?
> > +        domain_load(d, load_data, &c, dc->mask) : -EFAULT;
> > +
> > +    xfree(c.buffer);
> > +
> > +    return rc;
> > +}
> > +
> >   long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >   {
> >       long ret = 0;
> > @@ -942,6 +1048,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >               copyback = 1;
> >           break;
> >
> > +    case XEN_DOMCTL_getdomaincontext:
> > +        ret = getdomaincontext(d, &op->u.domaincontext);
> > +        copyback = !ret;
> > +        break;
> > +
> > +    case XEN_DOMCTL_setdomaincontext:
> > +        ret = setdomaincontext(d, &op->u.domaincontext);
> > +        break;
> > +
> >       default:
> >           ret = arch_do_domctl(op, d, u_domctl);
> >           break;
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 1ad34c35eb..24ed6852cf 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -38,7 +38,7 @@
> >   #include "hvm/save.h"
> >   #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
> >
> >   /*
> >    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> > @@ -1129,6 +1129,42 @@ struct xen_domctl_vuart_op {
> >                                    */
> >   };
> >
> > +/*
> > + * Get/Set domain PV context. The same struct xen_domctl_domaincontext
> > + * is used for both commands but with slightly different field semantics
> > + * as follows:
> > + *
> > + * XEN_DOMCTL_getdomaincontext
> > + * ---------------------------
> > + *
> > + * buffer (IN):   The buffer into which the context data should be
> > + *                copied, or NULL to query the buffer size that should
> > + *                be allocated.
> > + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> > + *                zero, and the value passed out will be the size of the
> > + *                buffer to allocate.
> > + *                If 'buffer' is non-NULL then the value passed in must
> > + *                be the size of the buffer into which data may be copied.
> > + * mask (IN):     See comment on domain_save/load() in xen/save.h.
> > + *
> > + * XEN_DOMCTL_setdomaincontext
> > + * ---------------------------
> > + *
> > + * buffer (IN):   The buffer from which the context data should be
> > + *                copied.
> > + * size (IN):     The size of the buffer from which data may be copied.
> > + *                This data must include DOMAIN_SAVE_CODE_HEADER at the
> > + *                start and terminate with a DOMAIN_SAVE_CODE_END record.
> > + *                Any data beyond the DOMAIN_SAVE_CODE_END record will be
> > + *                ignored.
> > + * mask (IN):     See comment on domain_save/load() in xen/save.h.
> > + */
> > +struct xen_domctl_domaincontext {
> > +    uint32_t size;
> > +    uint32_t mask;
> > +    XEN_GUEST_HANDLE_64(uint8) buffer;
> 
> Should not it be a void handle?
>

Perhaps.
 
> Also, in the case of XEN_DOMCTL_setdomaincontext, the buffer is not
> meant to be modified by the hypervisor. So I would rather introduce two
> separate structure so we can enforce the const.
> 

Can handles be meaningfully const?

  Paul


