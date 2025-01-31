Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01CA245AD
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 00:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880035.1290200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te0Zd-00035T-0z; Fri, 31 Jan 2025 23:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880035.1290200; Fri, 31 Jan 2025 23:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te0Zc-00032Z-Tm; Fri, 31 Jan 2025 23:37:20 +0000
Received: by outflank-mailman (input) for mailman id 880035;
 Fri, 31 Jan 2025 23:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyPN=UX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1te0Zb-00032T-Nc
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 23:37:19 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf2c0a0-e02c-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 00:37:16 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1738366630199446.59530756690776;
 Fri, 31 Jan 2025 15:37:10 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e58a90c6059so4418384276.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 15:37:10 -0800 (PST)
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
X-Inumbo-ID: 4cf2c0a0-e02c-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1738366633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n6SDlibQEZsUdYsWGSRsGCSug8Dh6DzgidXfvQ66BlKkd8CRBEKx3dLUHTYSOkzmu6AivD1je6RWMvBfEb+ZcgnABaPatO898VFcSbznx93RB/WMs6jrz1HjOzG+x2iXbfqGdet+7KYrwVeirEIkld89jolm8LkXp4dSaIFf1Nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738366633; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/F1F7S9JW3z+rec15MLaBGQV6OMlNjewyhuLpVQbeVM=; 
	b=lL+VTb5jwOEXT4usodH7rX4nEZ+o+C+c2w0gbSR6fGRLb5fOZNNeV1eMr+TDbUW6XtRi0XxvQMWKEt1fw4IkT3KTZBdV+SP/Bwu+0KWKXulXYf44sMzqwqAX/osGoX5V2iB+2s6RxCDIXCce7hXtNOGfl/sqVp66NDDKtEpDjW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738366633;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/F1F7S9JW3z+rec15MLaBGQV6OMlNjewyhuLpVQbeVM=;
	b=iOdzAhKPOQEXvx3/3jHLK1fBwjx94oo64w8OCm0HaMx41QsyRbJ7yVK5X+JKa7Jx
	URcpqIslaJaRDDc9QA/KgLs4tre13B5TYxpOVzXGCqLc8xyx7y9SjNV/JxwIQ5I/OaP
	Qx7L5YEAH+bO+PmBVPaDHi9JggiBxk3gCmO55XE0=
X-Forwarded-Encrypted: i=1; AJvYcCX4xv4JtWLkDOaowI0EX+Jqmbt9+ZuTcpecYmzutpE7QoY5hNH0I9qQ0IfVRU5YWyApJxeHbDA7iCI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIeD9xh6sTv0sF0e96ptXs8QgtkJCNRjdsIvQFLboAAoddiTZS
	dvmLG/a8/yHl9JJbLyp4zcD6tJw79CsSBlvpJ5e9wqCQFCilMe7rwII0pvxGKE49jTpXttuyJZx
	RUOn16R1bsMuNIMWnSMjD00Ehz60=
X-Google-Smtp-Source: AGHT+IEgWmwUuJOM8vimqGVJ6KGYtJ2xn9+Zofc643JIAkDgbaH8coTHWRn04BPMS95MfPEpr9CGpEvLtM9Dk7o+BAM=
X-Received: by 2002:a25:b006:0:b0:e5a:cc48:847d with SMTP id
 3f1490d57ef6-e5acc4884d8mr6030063276.20.1738366629403; Fri, 31 Jan 2025
 15:37:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com> <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
 <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com> <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
 <b850c2b1-5aa9-4e64-9161-ba55028b43a7@suse.com>
In-Reply-To: <b850c2b1-5aa9-4e64-9161-ba55028b43a7@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 31 Jan 2025 18:36:33 -0500
X-Gmail-Original-Message-ID: <CABfawhn8uhUbr4yRcSb=_Jw3y2Cgsh_ozXotTFkrDt12K8Cyog@mail.gmail.com>
X-Gm-Features: AWEUYZnFVlVSHAzmLOPA9B2OMZh_tGh9yJEsax242NIz3ZYe_YdecPGVr1K5L1A
Message-ID: <CABfawhn8uhUbr4yRcSb=_Jw3y2Cgsh_ozXotTFkrDt12K8Cyog@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] xen: kconfig: rename MEM_ACCESS -> VM_EVENT
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 1:30=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 31.01.2025 01:26, Tamas K Lengyel wrote:
> > On Thu, Jan 30, 2025 at 8:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 21.01.2025 11:19, Sergiy Kibrik wrote:
> >>> Use more generic CONFIG_VM_EVENT name throughout Xen code instead of
> >>> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher l=
evel
> >>> feature, with mem_access & monitor depending on it.
> >>>
> >>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> I don't think this is applicable; my suggestion went in a different di=
rection.
> >>
> >>> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> >>
> >> Before considering to ack this, I'd like you, Tamas, to confirm this i=
s really
> >> what you had thought of. In particular ...
> >>
> >>> --- a/xen/arch/arm/Makefile
> >>> +++ b/xen/arch/arm/Makefile
> >>> @@ -37,7 +37,7 @@ obj-y +=3D irq.o
> >>>  obj-y +=3D kernel.init.o
> >>>  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> >>>  obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >>> -obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
> >>> +obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
> >>
> >> ... changes like this one look somewhat odd to me.
> >>
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -92,7 +92,7 @@ config HAS_VMAP
> >>>  config MEM_ACCESS_ALWAYS_ON
> >>>       bool
> >>>
> >>> -config MEM_ACCESS
> >>> +config VM_EVENT
> >>>       def_bool MEM_ACCESS_ALWAYS_ON
> >>>       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> >>>       depends on HVM
> >>
> >> What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn't =
that
> >> become VM_EVENT_ALWAYS_ON then, too?
> >>
> >> Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at le=
ast
> >> documentation purposes, then also gain a dependency on VM_EVENT?
> >
> > MEM_PAGING, yes. MEM_SHARING, definitely not. MEM_SHARING is perfectly
> > functional without vm_event.
>
> Is it? I see e.g.
>
>     if ( sharing_enomem )
>     {
> #ifdef CONFIG_MEM_SHARING
>         if ( !vm_event_check_ring(currd->vm_event_share) )
>         {
>             gprintk(XENLOG_ERR, "Domain %pd attempt to unshare "
>                     "gfn %lx, ENOMEM and no helper\n",
>                     currd, gfn);
>             /* Crash the domain */
>             rc =3D 0;
>         }
> #endif
>     }

On x86 vm_event is always compiled in as per current setup. If we were
to make that dependent on the now renamed config option this here
should be converted to CONFIG_MEM_SHARING && CONFIG_VM_EVENT. The rest
of the mem_sharing codebase does not require vm_event to function,
this here is used only if there is a subscriber to the enomem
corner-case. It isn't normally used.

> in hvm_hap_nested_page_fault().
>
> Also - you responded only to a secondary remark here. What about the
> more basic points further up?

My recommendation to use CONFIG_VM_EVENT for the
vm_event/mem_access/monitor subsystems strictly only applies to ARM
where these three subsystems have a 1:1:1 dependency. On x86 the
dependency between the three can be more complex, I would not change
the x86 side of things unless we want to get the three subsystems
their own kconfig options.


Tamas

