Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA19826B8F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 11:27:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663303.1033185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmr0-0003HM-Ly; Mon, 08 Jan 2024 10:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663303.1033185; Mon, 08 Jan 2024 10:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmr0-0003Fn-J4; Mon, 08 Jan 2024 10:27:34 +0000
Received: by outflank-mailman (input) for mailman id 663303;
 Mon, 08 Jan 2024 10:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMmqy-0003EH-Mq
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 10:27:32 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86800eab-ae10-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 11:27:29 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e7f58c5fbso1859894e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 02:27:29 -0800 (PST)
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
X-Inumbo-ID: 86800eab-ae10-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704709649; x=1705314449; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnixoJzZqyIR+tL67AVkRGdvUC6fntVBwqNGzlsgaQU=;
        b=BL2YwrsOvaTLahKxJBzccBE3GmJryR6hb6m9S03YVzcp/XLkjPDo45bBTGds1aKXdi
         hOPPyGVZmeOJL/I1A7d9sTWkmag2gMAYPCfQNZhIizqkuky1GWcXX4I5r9nd4euSk2tP
         wPgoYGy6aEPGgB1fYE9VA5G/g1djnVKAZianC44cPBeIsDRttrwIf7FfHFDgrFh+4l1N
         bN5L1os9aGy2ysdJn/6YRooUiYrMYV8MHQ08JgwdeO8p6psQxLD0KE2tdj5SVpDfKmFX
         Vo1EP4A4KRHAe7AFvNserRFNlgp4CQQz6XejquCUwukE0XTGl5dsXi9QYJme8gtJEBgy
         SSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709649; x=1705314449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnixoJzZqyIR+tL67AVkRGdvUC6fntVBwqNGzlsgaQU=;
        b=h8A3KtS1YFkNhDcCszX+uiK3lC1ICHI3aapgrvcZVx8knIy65UGnpXQ/bs6dRFhT96
         3IPms4VYs5jGPbCyspCgmpq7HgPaRfCoFdG+E2pU8bxhKUNzRGYsf8RUX9VvsjKejq2V
         GbdD1vJfDR4P4AxM3Hp5WLeo23xEjlxYtX+7OT48lz51K4ToE8mpL9HidsR4lc+qVPZ8
         ytqciMN5UBjzaYT3B0UPKd3E6l4yzAKS3XCyK3lXwN1laPvtfrNENIuRijiplsZ5LfQV
         H1H+fIg4qnN7qr8azn88ggPOZ9m/TB6B8YN8b+dR+U4vABdm98lFaASjZQTWZfeB3uJg
         wCZg==
X-Gm-Message-State: AOJu0YyKHwt3/lzOHO3nBCt0SwuHaaHphjUEf5vDuwJCK4zYkQmEQgFt
	8To6tsBGfUWYSjXlYjhEZUo1cWHVIgXselCpz/nLrZcINnacig==
X-Google-Smtp-Source: AGHT+IF+6+iBUDA3b0GnoX2j4dgGIZuplso7Rlc3dShDn0mEaAyAFVOfBFZgIb6KGUobxxRu/NjSBk14QTjmaezt0rU=
X-Received: by 2002:a05:6512:224b:b0:50e:76bb:fc82 with SMTP id
 i11-20020a056512224b00b0050e76bbfc82mr1452146lfu.69.1704709648942; Mon, 08
 Jan 2024 02:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech> <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
In-Reply-To: <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 11:27:17 +0100
Message-ID: <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Fri, Jan 5, 2024 at 6:26=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Carlo,
>
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This commit updates the domctl interface to allow the user to set cache
> > coloring configurations from the toolstack.
> > It also implements the functionality for arm64.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v5:
> > - added a new hypercall to set colors
> > - uint for the guest handle
> > v4:
> > - updated XEN_DOMCTL_INTERFACE_VERSION
> > ---
> >   xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
> >   xen/common/domctl.c            | 11 +++++++++++
> >   xen/include/public/domctl.h    | 10 +++++++++-
> >   xen/include/xen/llc-coloring.h |  3 +++
> >   4 files changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> > index 5ce58aba70..a08614ec36 100644
> > --- a/xen/arch/arm/llc-coloring.c
> > +++ b/xen/arch/arm/llc-coloring.c
> > @@ -9,6 +9,7 @@
> >    *    Carlo Nonato <carlo.nonato@minervasys.tech>
> >    */
> >   #include <xen/errno.h>
> > +#include <xen/guest_access.h>
> >   #include <xen/keyhandler.h>
> >   #include <xen/llc-coloring.h>
> >   #include <xen/param.h>
> > @@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
> >       return domain_check_colors(d);
> >   }
> >
> > +int domain_set_llc_colors_domctl(struct domain *d,
> > +                                 const struct xen_domctl_set_llc_color=
s *config)
> > +{
> > +    if ( d->num_llc_colors )
> > +        return -EEXIST;
> > +
> > +    if ( domain_alloc_colors(d, config->num_llc_colors) )
>
> domain_alloc_colors() doesn't sanity check config->num_llc_colors before
> allocating the array. You want a check the size before so we would not
> try to allocate an arbitrary amount of memory.
>
> > +        return -ENOMEM;
> > +
> > +    if ( copy_from_guest(d->llc_colors, config->llc_colors,
> > +                         config->num_llc_colors) )
> > +        return -EFAULT;
> > +
> > +    return domain_check_colors(d);
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> > index f5a71ee5f7..b6867d0602 100644
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -8,6 +8,7 @@
> >
> >   #include <xen/types.h>
> >   #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >   #include <xen/err.h>
> >   #include <xen/mm.h>
> >   #include <xen/sched.h>
> > @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t=
) u_domctl)
> >                   __HYPERVISOR_domctl, "h", u_domctl);
> >           break;
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
>
> To me, the message doesn't match the check in
> domain_set_llc_colors_domctl(). But I think you want to check that no
> memory was yet allocated to the domain. Otherwise, you coloring will be
> wrong.
>
> Also, it is a bit unclear why you print a message for -EEXIST but not
> the others. In this instance, I would consider to print nothing at all.

The problem here is that we don't support recoloring. When a domain is
created it receives a coloring configuration and it can't change. If this
hypercall is called twice I have to stop the second time somehow. I'm ok
with printing nothing, but -EEXIST to me seems logical.

> > +        break;
> > +
> >       default:
> >           ret =3D arch_do_domctl(op, d, u_domctl);
> >           break;
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index a33f9ec32b..2b12069294 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -21,7 +21,7 @@
> >   #include "hvm/save.h"
> >   #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> >
> >   /*
> >    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> > @@ -1190,6 +1190,12 @@ struct xen_domctl_vmtrace_op {
> >   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> >
> > +struct xen_domctl_set_llc_colors {
> > +    /* IN LLC coloring parameters */
> > +    unsigned int num_llc_colors;
>
> I think there will be a padding here. So can you make it explicit?
>
> > +    XEN_GUEST_HANDLE_64(uint) llc_colors;
> > +};
> > +
> >   struct xen_domctl {
> >       uint32_t cmd;
> >   #define XEN_DOMCTL_createdomain                   1
> > @@ -1277,6 +1283,7 @@ struct xen_domctl {
> >   #define XEN_DOMCTL_vmtrace_op                    84
> >   #define XEN_DOMCTL_get_paging_mempool_size       85
> >   #define XEN_DOMCTL_set_paging_mempool_size       86
> > +#define XEN_DOMCTL_set_llc_colors                87
> >   #define XEN_DOMCTL_gdbsx_guestmemio            1000
> >   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> >   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> > @@ -1339,6 +1346,7 @@ struct xen_domctl {
> >           struct xen_domctl_vuart_op          vuart_op;
> >           struct xen_domctl_vmtrace_op        vmtrace_op;
> >           struct xen_domctl_paging_mempool    paging_mempool;
> > +        struct xen_domctl_set_llc_colors    set_llc_colors;
> >           uint8_t                             pad[128];
> >       } u;
> >   };
> > diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-color=
ing.h
> > index cedd97d4b5..fa2edc8ad8 100644
> > --- a/xen/include/xen/llc-coloring.h
> > +++ b/xen/include/xen/llc-coloring.h
> > @@ -33,6 +33,9 @@ extern bool llc_coloring_enabled;
> >   void domain_llc_coloring_free(struct domain *d);
> >   void domain_dump_llc_colors(struct domain *d);
> >
> > +int domain_set_llc_colors_domctl(struct domain *d,
> > +                                 const struct xen_domctl_set_llc_color=
s *config);
> > +
> >   #endif /* __COLORING_H__ */
> >
> >   /*
>
> Cheers,
>
> --
> Julien Grall

Thanks.

