Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278CC1FF7E4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 17:48:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlwle-0000lZ-Ps; Thu, 18 Jun 2020 15:47:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FPuN=77=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jlwld-0000lN-BL
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 15:47:53 +0000
X-Inumbo-ID: 119b612e-b17b-11ea-8496-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 119b612e-b17b-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 15:47:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r15so6177289wmh.5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WGXKW0CHLmKn1eEWTHdkXEOrmpITF5JY9osaKifbsEM=;
 b=Z2FtwT4eSZnz+iLtE8XBR/74hRh+BWYXKxHyagfaQkrRutSl1+KqRPQKl1gl0gT4dP
 /W96riqNzlbWtjJDIOHrW2nfhVsk3FC5oP+0AfktM+A9h8/U7/pvtzzHbTpSe5wjJ+Zd
 UjFhp4MOUU4gHVa28vC5ruMi5Z8xjJWpRt79DZVWt5IB44MecnKM2CYGKpqvqd4axRxC
 GzRBd7L+08XinC1ZagqeWfdTMs9ZFD8o8ChCe2MSoVoATbGNdtLi0EmnIKrcjnqDi/Gl
 oNaD9lLBk5V61OkNc3gmeAORA+tIewTxQumhURRVl+H5eSP5+DRlHLa8kCHkwBDoL9CE
 971g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WGXKW0CHLmKn1eEWTHdkXEOrmpITF5JY9osaKifbsEM=;
 b=TKgVgJ/T/oIuyU2wzCBc1xwlk+QArVhi83G0LFsqnqCILCcrUwzQvKL9ZjurtDWwDj
 lJmLjoPItJdliZ7Afc1GHwmGlBH7R181ItdHV9h08W858F0RNvF+6ItfAB8xcWcQMYzc
 8JyqjNbx6vpSDMPX7n/gKZCdsTBJsxxKT1Sxll5KMj6KzZmorzmMc0rVj/bF3V/I6v00
 q5sVa6APqc2h+rxipGWZZzTiSX9abChmJJDhLSNx1shSDUzm8h4TIG6k8bQEH1+1MgEK
 3tuj3UsPA4adY1X3IfHFYGctK0TsiXpvxgDhmkRzC16qV9VJGnE7Lq8MlpsSU2gg5lqM
 kH3w==
X-Gm-Message-State: AOAM530lkOYsiMYjenZkLwHSgMvqBxwjropnjviaLIrV2KaFO4bjKreZ
 nJIHAC41G77txKaPbwj/M06FtbM8+ObVpokkv4U=
X-Google-Smtp-Source: ABdhPJy9hC7RLzyoHijRaKuppw4qDKT6RCdSgJ8qaqVRmcKDNimR2ogmdqssjrwgweUfmtOIJU68vt624ks1wzySvXc=
X-Received: by 2002:a1c:964d:: with SMTP id y74mr4945156wmd.154.1592495271700; 
 Thu, 18 Jun 2020 08:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
 <20200616172352.GT735@Air-de-Roger>
 <1599209169.9756264.1592493912556.JavaMail.zimbra@cert.pl>
 <e2e873a3-6050-d4bf-f74c-ba31d7eef2f0@suse.com>
In-Reply-To: <e2e873a3-6050-d4bf-f74c-ba31d7eef2f0@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 18 Jun 2020 09:47:16 -0600
Message-ID: <CABfawhk_Lx=An5BGO-pT=F3sk3dptpvkZ4dXed720sN4iAdKaQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 9:41 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.06.2020 17:25, Micha=C5=82 Leszczy=C5=84ski wrote:
> > ----- 16 cze 2020 o 19:23, Roger Pau Monn=C3=A9 roger.pau@citrix.com na=
pisa=C5=82(a):
> >> On Tue, Jun 16, 2020 at 05:22:06PM +0200, Micha=C5=82 Leszczy=C5=84ski=
 wrote:
> >>> --- a/xen/include/public/hvm/hvm_op.h
> >>> +++ b/xen/include/public/hvm/hvm_op.h
> >>> @@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
> >>>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
> >>>
> >>> +/* HVMOP_vmtrace: Perform VM tracing related operation */
> >>> +#define HVMOP_vmtrace 26
> >>> +
> >>> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
> >>> +
> >>> +struct xen_hvm_vmtrace_op {
> >>> +    /* IN variable */
> >>> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> >>> +    uint32_t cmd;
> >>> +/* Enable/disable external vmtrace for given domain */
> >>> +#define HVMOP_vmtrace_ipt_enable      1
> >>> +#define HVMOP_vmtrace_ipt_disable     2
> >>> +#define HVMOP_vmtrace_ipt_get_buf     3
> >>> +#define HVMOP_vmtrace_ipt_get_offset  4
> >>> +    domid_t domain;
> >>
> >> You are missing a padding field here AFAICT.
> >
> >
> > Could you point out what is the purpose of this padding field and what =
should be the size in this case? It's pretty unclear to me.
>
> In the public interface we aim at making all padding explicit.

Just to expand a bit on this: this is an ABI meaning the hypervisor
and the tool sending this structure communicate via memory only. Since
the hypervisor and the compiler can be compiled using different
compilers, using stuff that's not explicit in the C standard needs to
be avoided. For example using standard types like "int" or "long" is
no good since it's really up to the compiler to decide how much memory
those need. The C specification is great like that.. Same stands for
padding. Different compilers can decide to align things differently,
pack things or not pack things, so we have to manually add the padding
to take that choice away from the compiler.

As discussed many times on the list, using C struct as the base of the
ABI was a bad design decision to start with, but we are now stuck with
it. It would now make more sense to use something like JSON to pass
information like this between the hypervisor and the toolstack which
is what we opted to do in new hypervisors like Bareflank/Boxy.

Tamas

