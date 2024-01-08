Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B68826C81
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663396.1033278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnij-0004rS-3m; Mon, 08 Jan 2024 11:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663396.1033278; Mon, 08 Jan 2024 11:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnij-0004pH-12; Mon, 08 Jan 2024 11:23:05 +0000
Received: by outflank-mailman (input) for mailman id 663396;
 Mon, 08 Jan 2024 11:23:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMnih-0004pB-FL
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:23:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 487a8ae9-ae18-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 12:23:01 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5576ca4119cso1646728a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:23:01 -0800 (PST)
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
X-Inumbo-ID: 487a8ae9-ae18-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704712981; x=1705317781; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0bqL+CEbwmYzRx+oNHYlXf016MtxfBfkDGBflAoNOE=;
        b=plJBMIvfF7hIUy+wvT1DLmMNAiC4aHzuWCpseAdGjDuIOG1swHSTAlGjajjYSh12nT
         0GuKsAVniDyUhs2ebhFjX0xy+ocfjfk+cWQy9zA2ViliVdAEziSlwSWYRp0nkT4iViVT
         4Z6zGTGffELVY3IWaoDPRY7+gLSoZPaHPb8hdWuC5951YXBChgNbSFPM83PQIiDQksUP
         Pkfh6sxyQKMirsxbWZU16EZINCth5rildwxz5IFEyI5QbdorIvryfS30gKPIXbj2nuqX
         kL7BMC1k9mJKNUcb1WIwLAEMK0X/0auw/ewBwSB5zdnWST3Aa9QJsJd4zaoL0gA63/7R
         VDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704712981; x=1705317781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0bqL+CEbwmYzRx+oNHYlXf016MtxfBfkDGBflAoNOE=;
        b=lpaTMA6sa4TrN3B8/oKR8btS5LdHwKmzLlj+76ml5xB8CGdUkofW/Tf0S5iYw7va5e
         bHF6+nOXA6Ey5dioNX+OLppu8mCQa/aaVRXmuC7sj9nPTO+IC9XVpPnpnDpRf4UiGYdK
         JANBeMNEHYVRRSYirz5b0K0LTGIOHQt+5iJ49H3DHL7r7wowDMQnCjng4ieDz6KPgeki
         0n2DNLo1suzvvCznkp292N403+1ZiTQJBpjG8J43rtcnJZ49KKY7FKbfPoTYXKw1hJTE
         GhyyWw3MsXtqz8ORgUYAFtU3TEE+S6HyAJ0UWwjH+clhOKaGktiTCLz1teiMSgCJGPzn
         0jSw==
X-Gm-Message-State: AOJu0Yw16tGQHyauZfZI5IYrcQifUAoEj/clFQ1FDWbbx+MzMqp6VF0z
	8eVPPv1eYjGqgn6tqx4lZXPWaZK+5xoRpOEP4JEs45aSZt/KrQ==
X-Google-Smtp-Source: AGHT+IGlWpbLE84nb3JtKPas+7DHcgn2nFO/IIdk1LNq0OwRN/f3qf8LtnBf+BQxT+ypGwW+m5IyzskYZQtCyaDgz1I=
X-Received: by 2002:a17:906:28d6:b0:a28:d0c4:a0dd with SMTP id
 p22-20020a17090628d600b00a28d0c4a0ddmr1493863ejd.85.1704712981034; Mon, 08
 Jan 2024 03:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <55c87867-8d1a-4bcf-92cc-f64a9960d1d8@suse.com>
In-Reply-To: <55c87867-8d1a-4bcf-92cc-f64a9960d1d8@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:22:50 +0100
Message-ID: <CAG+AhRUtTgwdZY7ykb_tUioqROVdXZeEpH2C0h0YPrF8_GxVUg@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Jan 8, 2024 at 9:43=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -9,6 +9,7 @@
> >   *    Carlo Nonato <carlo.nonato@minervasys.tech>
> >   */
> >  #include <xen/errno.h>
> > +#include <xen/guest_access.h>
> >  #include <xen/keyhandler.h>
> >  #include <xen/llc-coloring.h>
> >  #include <xen/param.h>
> > @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
> >      return domain_check_colors(d);
> >  }
> >
> > +int domain_set_llc_colors_domctl(struct domain *d,
> > +                                 const struct xen_domctl_set_llc_color=
s *config)
> > +{
> > +    if ( d->num_llc_colors )
> > +        return -EEXIST;
> > +
> > +    if ( domain_alloc_colors(d, config->num_llc_colors) )
> > +        return -ENOMEM;
> > +
> > +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> > +                         config->num_llc_colors) )
> > +        return -EFAULT;
> > +
> > +    return domain_check_colors(d);
> > +}
>
> What part of this is Arm-specific? I ask in particular because while you
> place this in an Arm-specific source file, ...
>
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <xen/types.h>
> >  #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/err.h>
> >  #include <xen/mm.h>
> >  #include <xen/sched.h>
> > @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t=
) u_domctl)
> >                  __HYPERVISOR_domctl, "h", u_domctl);
> >          break;
> >
> > +    case XEN_DOMCTL_set_llc_colors:
> > +        if ( !llc_coloring_enabled )
> > +            break;
> > +
> > +        ret =3D domain_set_llc_colors_domctl(d, &op->u.set_llc_colors)=
;
> > +        if ( ret =3D=3D -EEXIST )
> > +            printk(XENLOG_ERR
> > +                   "Can't set LLC colors on an already created domain\=
n");
> > +        break;
> > +
> >      default:
> >          ret =3D arch_do_domctl(op, d, u_domctl);
> >          break;
>
> ... you don't handle the new domctl in Arm's arch_do_domctl().

No arm specific code here. I need a new xen/common/llc-coloring.c file wher=
e
to put common stuff.

> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -21,7 +21,7 @@
> >  #include "hvm/save.h"
> >  #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>
> There's no need for such a bump when ...
>
> > @@ -1190,6 +1190,12 @@ struct xen_domctl_vmtrace_op {
> >  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> >
> > +struct xen_domctl_set_llc_colors {
> > +    /* IN LLC coloring parameters */
> > +    unsigned int num_llc_colors;
> > +    XEN_GUEST_HANDLE_64(uint) llc_colors;
> > +};
> > +
> >  struct xen_domctl {
> >      uint32_t cmd;
> >  #define XEN_DOMCTL_createdomain                   1
> > @@ -1277,6 +1283,7 @@ struct xen_domctl {
> >  #define XEN_DOMCTL_vmtrace_op                    84
> >  #define XEN_DOMCTL_get_paging_mempool_size       85
> >  #define XEN_DOMCTL_set_paging_mempool_size       86
> > +#define XEN_DOMCTL_set_llc_colors                87
> >  #define XEN_DOMCTL_gdbsx_guestmemio            1000
> >  #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> >  #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> > @@ -1339,6 +1346,7 @@ struct xen_domctl {
> >          struct xen_domctl_vuart_op          vuart_op;
> >          struct xen_domctl_vmtrace_op        vmtrace_op;
> >          struct xen_domctl_paging_mempool    paging_mempool;
> > +        struct xen_domctl_set_llc_colors    set_llc_colors;
> >          uint8_t                             pad[128];
> >      } u;
> >  };
>
> ... all you do is add a new domctl.
>
> As to the new struct - you'll want to use uint<N>_t there, not
> unsigned int.
>
> Jan

Thanks.

