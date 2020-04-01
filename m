Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145419AD0A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 15:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJddf-0001jC-F5; Wed, 01 Apr 2020 13:42:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJddd-0001j7-TI
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 13:42:37 +0000
X-Inumbo-ID: a567295a-741e-11ea-bacd-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a567295a-741e-11ea-bacd-12813bfff9fa;
 Wed, 01 Apr 2020 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EDTbYLlvg351W5Iqba13qxknwu4V1mwbBXYBfKgreDc=; b=JAtDJ8kss5CKeDuQDfMvuiOXmy
 5sCP+1BoWjTGan+axgpeRq7AvmAuXtvn9PKUgG+VEShl+mHDvcNyPS6g7fN4T9oWdC0DUDwtx+OsB
 Io9KOBO4K2K1DR4/CCI5CVFmN9Y/av+Pr5BvVpew73kw/yQaqnJo+MnN0aSzcBGhpJiw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJddV-0003X4-AJ; Wed, 01 Apr 2020 13:42:29 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJddU-0001ab-Uk; Wed, 01 Apr 2020 13:42:29 +0000
Subject: Re: [PATCH 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-3-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <fc193a54-5d25-ffff-2234-9c0079c605d8@xen.org>
Date: Wed, 1 Apr 2020 14:42:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327185012.1795-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 27/03/2020 18:50, Paul Durrant wrote:
> These domctls provide a mechanism to get and set domain context from
> the toolstack.
> 
> Signed-off-by: Paul Durrant <paul@xen.org>
> ---
> Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   tools/flask/policy/modules/xen.if   |   4 +-
>   tools/libxc/include/xenctrl.h       |  11 +++
>   tools/libxc/xc_domain.c             |  52 +++++++++++++
>   xen/common/domctl.c                 | 115 ++++++++++++++++++++++++++++
>   xen/include/public/domctl.h         |  41 +++++++++-
>   xen/xsm/flask/hooks.c               |   6 ++
>   xen/xsm/flask/policy/access_vectors |   4 +
>   7 files changed, 230 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
> index 8eb2293a52..2bc9db4f64 100644
> --- a/tools/flask/policy/modules/xen.if
> +++ b/tools/flask/policy/modules/xen.if
> @@ -53,7 +53,7 @@ define(`create_domain_common', `
>   	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
>   			set_vnumainfo get_vnumainfo cacheflush
>   			psr_cmt_op psr_alloc soft_reset
> -			resource_map get_cpu_policy };
> +			resource_map get_cpu_policy setcontext };
>   	allow $1 $2:security check_context;
>   	allow $1 $2:shadow enable;
>   	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
> @@ -97,7 +97,7 @@ define(`migrate_domain_out', `
>   	allow $1 $2:hvm { gethvmc getparam };
>   	allow $1 $2:mmu { stat pageinfo map_read };
>   	allow $1 $2:domain { getaddrsize getvcpucontext pause destroy };
> -	allow $1 $2:domain2 gettsc;
> +	allow $1 $2:domain2 { gettsc getcontext };
>   	allow $1 $2:shadow { enable disable logdirty };
>   ')
>   
> diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
> index fc6e57a1a0..5c0d0d27a4 100644
> --- a/tools/libxc/include/xenctrl.h
> +++ b/tools/libxc/include/xenctrl.h
> @@ -867,6 +867,17 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
>                                uint8_t *hvm_ctxt,
>                                uint32_t size);
>   
> +int xc_domain_getcontext(xc_interface *xch,
> +                         uint32_t domid,
> +                         uint32_t mask,
> +                         uint8_t *ctxt_buf,

Why do you use uint8_t rather than void here?

> +                         uint32_t size);
> +int xc_domain_setcontext(xc_interface *xch,
> +                         uint32_t domid,
> +                         uint32_t mask,
> +                         uint8_t *ctxt_buf,
> +                         uint32_t size);
> +
>   /**
>    * This function will return guest IO ABI protocol
>    *
> diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
> index 71829c2bce..15bcf671fc 100644
> --- a/tools/libxc/xc_domain.c
> +++ b/tools/libxc/xc_domain.c
> @@ -537,6 +537,58 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
>       return ret;
>   }
>   
> +int xc_domain_getcontext(xc_interface *xch,
> +                         uint32_t domid,
> +                         uint32_t mask,
> +                         uint8_t *ctxt_buf,
> +                         uint32_t size)
> +{
> +    int ret;
> +    DECLARE_DOMCTL;
> +    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
> +
> +    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
> +        return -1;
> +
> +    domctl.cmd = XEN_DOMCTL_getdomaincontext;
> +    domctl.domain = domid;
> +    domctl.u.domaincontext.mask = mask;
> +    domctl.u.domaincontext.size = size;
> +    set_xen_guest_handle(domctl.u.domaincontext.buffer, ctxt_buf);
> +
> +    ret = do_domctl(xch, &domctl);
> +
> +    xc_hypercall_bounce_post(xch, ctxt_buf);
> +
> +    return !ret ? domctl.u.domaincontext.size : -1;

Looking at the domctl interface, size would be a 32-bit unsigned value. 
However the return is a 32-bit signed value. This is a call for trouble 
if the size is too big.

> +}
> +
> +int xc_domain_setcontext(xc_interface *xch,
> +                         uint32_t domid,
> +                         uint32_t mask,
> +                         uint8_t *ctxt_buf,

The context is not meant to be modified. So this should really be const.

> +                         uint32_t size)
> +{
> +    int ret;
> +    DECLARE_DOMCTL;
> +    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, size, XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +
> +    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
> +        return -1;
> +
> +    domctl.cmd = XEN_DOMCTL_setdomaincontext;
> +    domctl.domain = domid;
> +    domctl.u.domaincontext.mask = mask;
> +    domctl.u.domaincontext.size = size;
> +    set_xen_guest_handle(domctl.u.domaincontext.buffer, ctxt_buf);
> +
> +    ret = do_domctl(xch, &domctl);
> +
> +    xc_hypercall_bounce_post(xch, ctxt_buf);
> +
> +    return ret;
> +}
> +
>   int xc_vcpu_getcontext(xc_interface *xch,
>                          uint32_t domid,
>                          uint32_t vcpu,
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index a69b3b59a8..9c39519b04 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -25,6 +25,7 @@
>   #include <xen/hypercall.h>
>   #include <xen/vm_event.h>
>   #include <xen/monitor.h>
> +#include <xen/save.h>
>   #include <asm/current.h>
>   #include <asm/irq.h>
>   #include <asm/page.h>
> @@ -358,6 +359,111 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
>       return ERR_PTR(ret);
>   }
>   
> +struct domctl_context
> +{
> +    void *buffer;
> +    size_t len;
> +    size_t cur;
> +};
> +
> +static int accumulate_size(void *priv, void *data, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    c->len += len;

What does prevent overflow?

> +
> +    return 0;
> +}
> +
> +static int save_data(void *priv, void *data, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    if ( c->len - c->cur < len )
> +        return -ENOSPC;
> +
> +    memcpy(c->buffer + c->cur, data, len);
> +    c->cur += len;
> +
> +    return 0;
> +}
> +
> +static int getdomaincontext(struct domain *d,
> +                            struct xen_domctl_domaincontext *dc)
> +{
> +    struct domctl_context c = { };
> +    int rc;
> +
> +    if ( d == current->domain )
> +        return -EPERM;
> +
> +    if ( guest_handle_is_null(dc->buffer) ) /* query for buffer size */
> +
> +    {
> +        if ( dc->size )
> +            return -EINVAL;
> +
> +        /* dry run to acquire buffer size */
> +        rc = domain_save(d, accumulate_size, &c, dc->mask, true);
> +        if ( rc )
> +            return rc;
> +
> +        dc->size = c.len;

len is a size_t (so 64-bit on 64-bit arch) value, but size is 32-bit. So 
we return an error if the stream is going to be bigger than 4G?

> +        return 0;
> +    }
> +
> +    c.len = dc->size;
> +    c.buffer = xmalloc_bytes(c.len);
> +    if ( !c.buffer )
> +        return -ENOMEM;
> +
> +    rc = domain_save(d, save_data, &c, dc->mask, false);
> +
> +    dc->size = c.cur;
> +    if ( !rc && copy_to_guest(dc->buffer, c.buffer, dc->size) )
> +        rc = -EFAULT;
> +
> +    xfree(c.buffer);
> +
> +    return rc;
> +}
> +
> +static int load_data(void *priv, void *data, size_t len)
> +{
> +    struct domctl_context *c = priv;
> +
> +    if ( c->len - c->cur < len )
> +        return -ENODATA;
> +
> +    if ( data )
> +        memcpy(data, c->buffer + c->cur, len);
> +
> +    c->cur += len;
> +
> +    return 0;
> +}
> +
> +static int setdomaincontext(struct domain *d,
> +                            const struct xen_domctl_domaincontext *dc)
> +{
> +    struct domctl_context c = { .len = dc->size };
> +    int rc;
> +
> +    if ( d == current->domain )
> +        return -EPERM;
> +
> +    c.buffer = xmalloc_bytes(c.len);
> +    if ( !c.buffer )
> +        return -ENOMEM;
> +
> +    rc = !copy_from_guest(c.buffer, dc->buffer, c.len) ?
> +        domain_load(d, load_data, &c, dc->mask) : -EFAULT;
> +
> +    xfree(c.buffer);
> +
> +    return rc;
> +}
> +
>   long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>   {
>       long ret = 0;
> @@ -942,6 +1048,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>               copyback = 1;
>           break;
>   
> +    case XEN_DOMCTL_getdomaincontext:
> +        ret = getdomaincontext(d, &op->u.domaincontext);
> +        copyback = !ret;
> +        break;
> +
> +    case XEN_DOMCTL_setdomaincontext:
> +        ret = setdomaincontext(d, &op->u.domaincontext);
> +        break;
> +
>       default:
>           ret = arch_do_domctl(op, d, u_domctl);
>           break;
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 1ad34c35eb..24ed6852cf 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>   #include "hvm/save.h"
>   #include "memory.h"
>   
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> @@ -1129,6 +1129,42 @@ struct xen_domctl_vuart_op {
>                                    */
>   };
>   
> +/*
> + * Get/Set domain PV context. The same struct xen_domctl_domaincontext
> + * is used for both commands but with slightly different field semantics
> + * as follows:
> + *
> + * XEN_DOMCTL_getdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer into which the context data should be
> + *                copied, or NULL to query the buffer size that should
> + *                be allocated.
> + * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
> + *                zero, and the value passed out will be the size of the
> + *                buffer to allocate.
> + *                If 'buffer' is non-NULL then the value passed in must
> + *                be the size of the buffer into which data may be copied.
> + * mask (IN):     See comment on domain_save/load() in xen/save.h.
> + *
> + * XEN_DOMCTL_setdomaincontext
> + * ---------------------------
> + *
> + * buffer (IN):   The buffer from which the context data should be
> + *                copied.
> + * size (IN):     The size of the buffer from which data may be copied.
> + *                This data must include DOMAIN_SAVE_CODE_HEADER at the
> + *                start and terminate with a DOMAIN_SAVE_CODE_END record.
> + *                Any data beyond the DOMAIN_SAVE_CODE_END record will be
> + *                ignored.
> + * mask (IN):     See comment on domain_save/load() in xen/save.h.
> + */
> +struct xen_domctl_domaincontext {
> +    uint32_t size;
> +    uint32_t mask;
> +    XEN_GUEST_HANDLE_64(uint8) buffer;

Should not it be a void handle?

Also, in the case of XEN_DOMCTL_setdomaincontext, the buffer is not 
meant to be modified by the hypervisor. So I would rather introduce two 
separate structure so we can enforce the const.

> +};
> +
>   struct xen_domctl {
>       uint32_t cmd;
>   #define XEN_DOMCTL_createdomain                   1
> @@ -1210,6 +1246,8 @@ struct xen_domctl {
>   #define XEN_DOMCTL_vuart_op                      81
>   #define XEN_DOMCTL_get_cpu_policy                82
>   #define XEN_DOMCTL_set_cpu_policy                83
> +#define XEN_DOMCTL_getdomaincontext              84
> +#define XEN_DOMCTL_setdomaincontext              85
>   #define XEN_DOMCTL_gdbsx_guestmemio            1000
>   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
>   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> @@ -1270,6 +1308,7 @@ struct xen_domctl {
>           struct xen_domctl_monitor_op        monitor_op;
>           struct xen_domctl_psr_alloc         psr_alloc;
>           struct xen_domctl_vuart_op          vuart_op;
> +        struct xen_domctl_domaincontext     domaincontext;
>           uint8_t                             pad[128];
>       } u;
>   };
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 8af8602b46..d94d0fc125 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -744,6 +744,12 @@ static int flask_domctl(struct domain *d, int cmd)
>       case XEN_DOMCTL_get_cpu_policy:
>           return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
>   
> +    case XEN_DOMCTL_setdomaincontext:
> +        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SETCONTEXT);
> +
> +    case XEN_DOMCTL_getdomaincontext:
> +        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GETCONTEXT);
> +
>       default:
>           return avc_unknown_permission("domctl", cmd);
>       }
> diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
> index c055c14c26..fccfb9de82 100644
> --- a/xen/xsm/flask/policy/access_vectors
> +++ b/xen/xsm/flask/policy/access_vectors
> @@ -245,6 +245,10 @@ class domain2
>       resource_map
>   # XEN_DOMCTL_get_cpu_policy
>       get_cpu_policy
> +# XEN_DOMCTL_setdomaincontext
> +    setcontext
> +# XEN_DOMCTL_getdomaincontext
> +    getcontext
>   }
>   
>   # Similar to class domain, but primarily contains domctls related to HVM domains
> 

Cheers,

-- 
Julien Grall

