Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9CA5C2DA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908160.1315308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzqN-0006MA-RI; Tue, 11 Mar 2025 13:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908160.1315308; Tue, 11 Mar 2025 13:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trzqN-0006J2-OY; Tue, 11 Mar 2025 13:40:27 +0000
Received: by outflank-mailman (input) for mailman id 908160;
 Tue, 11 Mar 2025 13:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gv3n=V6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1trzqM-0006Iw-2T
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:40:26 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6203001f-fe7e-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:40:25 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1741700419011527.3349630498233;
 Tue, 11 Mar 2025 06:40:19 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6f6ae4846c7so51178527b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 06:40:18 -0700 (PDT)
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
X-Inumbo-ID: 6203001f-fe7e-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; t=1741700422; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aZ4aGQR+/lwThdYxdPKpVhDA4YD0RVXy4GWewc+YatxaIciYa6lz31ev1R6VPxpQXE58bemylJ9xv64Xh2DR7RHAkGGh0ppS1is7I0rKH/zcqecpWbfZ9GNw3s+4e37UscJH+8Gfo1lh6EFwlN8gepdj498nw3XHdgYiADWjfN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741700422; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ropjuOrtlKTIQ5l9s9klP6ltBqFVvqKwMXaQP+BEcW0=; 
	b=PMl7rsJZJr1b2g5HdH4nmBj650Sfk/uGSPD7nLKlHPLELeERKNiVhf7/bD3wi/3vwyX1hPGyqm4050iowITl+I5/BAXhN+Y8/g5p3pbxVjWvvoUQEhIFs2eN/MmqOT2ZdDYdilt7fNDZCfaMmW3nRFn809Y89LqcGlqCrhxkRHg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741700422;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ropjuOrtlKTIQ5l9s9klP6ltBqFVvqKwMXaQP+BEcW0=;
	b=NGFPTY59dem9/DDEKkIbuQ5J4L8BE6t/sC6JEOm9lhyCJ/DM2rhOFUvJUh8+Liwp
	4FA89pfJuXwMqBjNcp+xOBJCYwq8z830Q/dPPh9I2GQ4Sep6E3LgyRGNptjT3Af9Lei
	F6+wFT7YfSSeUH+T1pltgf/adbWcYWX/clL4Uo8I=
X-Forwarded-Encrypted: i=1; AJvYcCUcdNRMVCmWdWPQQco+sFl6TloY9ygvqG7P4suOElQzO0nb5+OAg0/YPoH/cXb9fkJZ4CsMUm6ii60=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVktrVjl/xevzsCjc+ovCNYZUp/jc1SrndSalFnyo+IDT3lz4m
	Za6/W/YusQquAVcRPCwJnrWVaKEcq2e1QH+m+wppPzc6JbNS3k6+p/xDbv0liqVs7DzxL9sRLqC
	CTFQgxaErvZQ/0yUtH3ofrIuA/E0=
X-Google-Smtp-Source: AGHT+IEHReOH1s+cVnJo5ip8ZwEahmuFMrm/Sh7yX74pkouvAoWBrM1FZwCbGWTYQdDIby8C79He4I7NWpNcqWJXvtg=
X-Received: by 2002:a05:690c:6e0a:b0:6fd:4473:5184 with SMTP id
 00721157ae682-6ff092b483emr51589077b3.35.1741700418114; Tue, 11 Mar 2025
 06:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741687645.git.Sergiy_Kibrik@epam.com> <e37da57b94fd3bd4f314e6fbd7b6b94aee4b4607.1741687645.git.Sergiy_Kibrik@epam.com>
 <ebef450c-280e-43a4-9a48-e4d1f754ba03@suse.com>
In-Reply-To: <ebef450c-280e-43a4-9a48-e4d1f754ba03@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 11 Mar 2025 09:39:41 -0400
X-Gmail-Original-Message-ID: <CABfawhn2+CpxZx50oYXbi1NPkqJqT7=tMrhYbPZCGsCoQjkfAA@mail.gmail.com>
X-Gm-Features: AQ5f1JqJPDGUHz90JbENlsVVdDPCoHlzWmpzAQkdyF4oQCYWHLurXvOVPce3GOE
Message-ID: <CABfawhn2+CpxZx50oYXbi1NPkqJqT7=tMrhYbPZCGsCoQjkfAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Stefano Stabellini <stefano.stabellini@amd.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 7:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.03.2025 11:27, Sergiy Kibrik wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> >
> > Extend coverage of CONFIG_VM_EVENT option and make the build of VM even=
ts
> > and monitoring support optional. Also make MEM_PAGING option depend on =
VM_EVENT
> > to document that mem_paging is relying on vm_event.
> > This is to reduce code size on Arm when this option isn't enabled.
> >
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Tamas K Lengyel <tamas@tklengyel.com>
> > Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>
> Please can tags be kept in chronological order? It's impossible to review
> a patch that wasn't first signed-off on by the author(s).
>
> > ---
> > changes in v3:
> >  - add dependency MEM_PAGING -> VM_EVENT

This seems to be largely unnecessary since on x86 selecting HVM
already selects it but I guess it also doesn't hurt to explicitly mark
it like this either.

> >  - monitor_domctl() stub returns -EOPNOTSUPP
>
> Seeing this, i.e. ...
>
> > --- a/xen/include/xen/monitor.h
> > +++ b/xen/include/xen/monitor.h
> > @@ -27,8 +27,17 @@
> >  struct domain;
> >  struct xen_domctl_monitor_op;
> >
> > +#ifdef CONFIG_VM_EVENT
> >  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop=
);
> >  void monitor_guest_request(void);
> > +#else
> > +static inline int monitor_domctl(struct domain *d,
> > +                                 struct xen_domctl_monitor_op *mop)
> > +{
> > +    return -EOPNOTSUPP;
>
> ... this, why ...
>
> > @@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct v=
m_event_domain *ved);
> >  void vm_event_put_request(struct domain *d, struct vm_event_domain *ve=
d,
> >                            vm_event_request_t *req);
> >
> > +#ifdef CONFIG_VM_EVENT
> > +/* Clean up on domain destruction */
> > +void vm_event_cleanup(struct domain *d);
> >  int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *v=
ec);
> > +#else
> > +static inline void vm_event_cleanup(struct domain *d) {}
> > +static inline int vm_event_domctl(struct domain *d,
> > +                                  struct xen_domctl_vm_event_op *vec)
> > +{
> > +    return -EINVAL;
>
> ... is it EINVAL here?

I would prefer if it was consistent too with -EOPNOTSUPP for both when
the subsystems are compiled out.

Thanks,
Tamas

