Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FB29EB37C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852573.1266331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1L0-0004qk-0v; Tue, 10 Dec 2024 14:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852573.1266331; Tue, 10 Dec 2024 14:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1Kz-0004oR-Ua; Tue, 10 Dec 2024 14:35:45 +0000
Received: by outflank-mailman (input) for mailman id 852573;
 Tue, 10 Dec 2024 14:35:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVUM=TD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tL1Kz-0004oL-7L
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:35:45 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08b6a268-b704-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:35:43 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5f2d7868ef0so45888eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:35:43 -0800 (PST)
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
X-Inumbo-ID: 08b6a268-b704-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733841342; x=1734446142; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPQWL52sDB07hxUgxfqzaFDxM5n8BY42D5DBK04WM8Q=;
        b=CQrceG/ECeD0JWL86ieAxgBdLXg+Kj6powVzP0/fQ+OemooVt5Tk0h2KqG3aEAUDp/
         TPKnL1bnffqxkEnZPQyg4ynQWpcTUIJ3FWDQ2rzegeg8XwObA0UCK7aYCFhTHYIRgg+N
         L9FMQb7QtJNMNo1dpHVSNSD+HxnbiXBbqNXVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841342; x=1734446142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPQWL52sDB07hxUgxfqzaFDxM5n8BY42D5DBK04WM8Q=;
        b=mKWSBTbkygg6lgpKUfigCw+ZQE+i6Mbtl44iwswM59GoL0aB2ngByHDxqjRoZ4SV0B
         xdf8PRfSiuaJYY9/dckcq/ydjpng8UUWcU8/5IRFE4XpIq0HHSRIqzNb+tKYZnOtnVS4
         pK2bQerTqPjA2UX0REWCoFi06GKSMhIX6fesW45s1RnOvLMCBNcpjO+ulWomwLE3vhtw
         t7dkBqqWAcSK9YSiDKuNiY5jW3PJeeeJqTxQapYZkdVWyTNMBxlDj14xmNfuc9oRh5z4
         8tqCLZ9sMxMX9xq7GN515Xiuy3qnHXg8pYC2NeunLpgBN0EOZ7uF4LUlxvkMAypbNFA5
         w6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB5LlJrqmM87br5gz1zwaUsiMr44fjY+83Y1Vqsv/wipvtsnF97sFDj6RE/TQ9C9zDhcM870TP1aE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPKni7ZkuZXIkPUekgROeE4kToS2oBrhs3H4vyXvNa19bj2OkT
	/cx6yJfuVQOS6/aPjvKy/7gkDrpHOoVXULGIKaM7AARfC8yW+OzA5dfnwON6SuZcbZdDZTjqvpB
	oefHJtXkcPfjSJ47nuj7xQQWBU8VH2xVuPUux3b34PpZ0ah4wyWY=
X-Gm-Gg: ASbGncsGtjrmLJe9qU83zXYnSCG4GaU5Sr+K/qf0tGwzcvdY3JcyrMRUynSy7QJL0sP
	j2LOlum6SaR8/1bYMEEC0ivwoSAA211V/ppd7cQ==
X-Google-Smtp-Source: AGHT+IEKBIjJp8JJXKee7DpZlhntVYlevga4jcE585kWN92/1T9MtcBBqzHDusVgi7H9JdcIk7FlRhHGjiLKhKPZNhE=
X-Received: by 2002:a05:6871:4185:b0:297:27b5:4d30 with SMTP id
 586e51a60fabf-29fee506fd7mr2901909fac.2.1733841341998; Tue, 10 Dec 2024
 06:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-3-frediano.ziglio@cloud.com> <7f74b7a9-1869-4efa-a213-04d56ba48fb1@suse.com>
In-Reply-To: <7f74b7a9-1869-4efa-a213-04d56ba48fb1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 10 Dec 2024 14:35:30 +0000
Message-ID: <CACHz=Zhpk7HOULDjoK1==mLz-G8qcFLjo4ihWTuQxGqJ1u+zQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/boot: Use header to allows inclusion of public
 xen.h header
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 10:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 22.11.2024 10:33, Frediano Ziglio wrote:
> > This allows to include other headers and avoid duplicated declarations.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Again it's left unclear what the purpose / goal is.
>

Reduce duplication avoiding duplicate declarations. The alternative
would be to duplicate them, which was proposed already and refused as
duplication was not good.

> > --- /dev/null
> > +++ b/xen/arch/x86/include/boot/public/xen.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +/* This header allows the inclusion of public xen.h */
> > +
> > +#ifndef BOOT__PUBLIC__XEN_H
> > +#define BOOT__PUBLIC__XEN_H
> > +
> > +#if !defined(__XEN__) || defined(__XEN_TOOLS__) || __XEN__ !=3D 1
> > +#error Unexpected defines
> > +#endif
>
> What is this to guard against? We're in the Xen tree, building Xen.
>

In include/public/arch-x86/xen.h file there are these declarations:

#if defined(__i386__)
# ifdef __XEN__
__DeFiNe__ __DECL_REG_LO8(which) uint32_t e ## which ## x
__DeFiNe__ __DECL_REG_LO16(name) union { uint32_t e ## name; }
# endif
#include "xen-x86_32.h"
# ifdef __XEN__
__UnDeF__ __DECL_REG_LO8
__UnDeF__ __DECL_REG_LO16
__DeFiNe__ __DECL_REG_LO8(which) e ## which ## x
__DeFiNe__ __DECL_REG_LO16(name) e ## name
# endif
#elif defined(__x86_64__)
#include "xen-x86_64.h"
#endif

This header allows us to include that part without compiler errors due
to __DeFiNe__ and __UnDeF__ not being C code.

> > +#include <xen/types.h>
> > +
> > +#ifdef __i386__
> > +
> > +# define __XEN_TOOLS__ 1
> > +# undef __XEN__
> > +# include <public/arch-x86/xen.h>
> > +# define __XEN__ 1
> > +# undef __XEN_TOOLS__
>
> Why would __XEN__ need un-defining and __XEN_TOOLS__ (seemingly wrongly)
> need defining? (As an aside, I don't think the expansion of either macro
> really matters. IOW I don#t see the need for the two 1-s.)
>
> Jan

The "1"-s are the default definitions, simply I define them
temporarily and then restore them.

Frediano

