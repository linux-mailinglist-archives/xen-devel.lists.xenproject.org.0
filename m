Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932DA2693A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 02:09:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881016.1291128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf7QN-0004Q4-TE; Tue, 04 Feb 2025 01:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881016.1291128; Tue, 04 Feb 2025 01:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf7QN-0004O8-QZ; Tue, 04 Feb 2025 01:08:23 +0000
Received: by outflank-mailman (input) for mailman id 881016;
 Tue, 04 Feb 2025 01:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXmP=U3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1tf7QN-0004O2-0z
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 01:08:23 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83cb885a-e294-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 02:08:18 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1738631291745282.4803734328266;
 Mon, 3 Feb 2025 17:08:11 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6f9625c0fccso13844507b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 17:08:11 -0800 (PST)
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
X-Inumbo-ID: 83cb885a-e294-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1738631295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mqtjjw4WT/ZT2IjpaWX4TIyLmvQzKPyV4u4j0jefFK07EtL3gz/YJiuYYlkMGm7f+0qPmWHXGoXadxUBHtlArOriL4PK20kAu3RnZIxBaW8JG+dFyHGOnP0ERpZHxeZMc9Ml26lSLHim3bAGDfbX/w8RrVcoT4bPgPQc/fjpq5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738631295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t9OQZAEDF3gVYJ0V4k66wrEvzYSH5auyndHpy3VxpZI=; 
	b=jEsmWwzBdusZJ1wP7YBbfqtJv/HIssYpp4roLsR7Jkte6tqGw/Z2qnOeIajruPejtcyvI7pHbknSNTTWs7Jv5Cgw+NG6nyEOrpEK2PNMyNAJsGjeEDH0e0nXmJyM5Uesz5JEhBz8ij7qsER0n3c9R06Sq8U6hEH00LGZPh88agU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738631295;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=t9OQZAEDF3gVYJ0V4k66wrEvzYSH5auyndHpy3VxpZI=;
	b=SJ5NDz9iBa+lWmwJcBetOmRz4e1XPXRdlehppKMrYcWOAIyzJzxpEz6k9X71hpTk
	W8oi75cVaSOL9IkVSA3iZDfD+qf5PgG5EphsrfYnS42sGK6Er3laJG++G7G9DL0nhRe
	glV9hugf1QiwLHOx0Yc9kauHkoW48P1cld9SqmHI=
X-Forwarded-Encrypted: i=1; AJvYcCV2PpK6ybet15+4tUL0ITQbj9MQBNx7UABGIVcTh9jxJKbK1CiyMKu6tDOiUoShWv2sbi52BkOw5Y4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8cw0MjDcxikPIhagghMx861HWh3Hf68ks88+EH/+PZiV1uw5q
	bKfHsW0KXaw5bH5hO+TD5b7aA2ncgOLDj1JATQczzX6qVbr6eyhw0owlVkMkE9pK273HVwy6ly8
	MJ9wCBn/Pc8aAeEEtq5y5j++5/cc=
X-Google-Smtp-Source: AGHT+IFytmffq45x8Wjkq7zdzUGe4kfq9HoBGT6vJpY5lq+0EtYQlO1ouKbSiwBbwsDcw5QoBaPvh3WYM9b4NT3US0s=
X-Received: by 2002:a05:690c:6e93:b0:6f5:2793:2897 with SMTP id
 00721157ae682-6f7a8407d9bmr196946377b3.30.1738631291210; Mon, 03 Feb 2025
 17:08:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com> <ff22f35dafd04b16165e1caec038e5a5fcf2aeee.1737452864.git.Sergiy_Kibrik@epam.com>
 <c74d334e-6e33-4a58-bf94-936249244cb0@suse.com> <CABfawhm8Cb3xz8Fv=YhA1TSKtvA3ThWHMcqJCFDarwSuYKQ5ZA@mail.gmail.com>
 <b850c2b1-5aa9-4e64-9161-ba55028b43a7@suse.com> <CABfawhn8uhUbr4yRcSb=_Jw3y2Cgsh_ozXotTFkrDt12K8Cyog@mail.gmail.com>
 <02cbd163-9048-45dc-9951-c8f2febb8b5f@suse.com>
In-Reply-To: <02cbd163-9048-45dc-9951-c8f2febb8b5f@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 3 Feb 2025 20:07:34 -0500
X-Gmail-Original-Message-ID: <CABfawhnA91Yn4zN2Pz5n0Gengie6Au4zAjxu3_owr-0BAiNZUg@mail.gmail.com>
X-Gm-Features: AWEUYZnSkfHt_HyjL7i6HsS6-FwSQAPBoU2ZSF0NBdxji8lXXrjLpZrW9zKP9Tg
Message-ID: <CABfawhnA91Yn4zN2Pz5n0Gengie6Au4zAjxu3_owr-0BAiNZUg@mail.gmail.com>
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

On Mon, Feb 3, 2025 at 2:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.02.2025 00:36, Tamas K Lengyel wrote:
> > On Fri, Jan 31, 2025 at 1:30=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 31.01.2025 01:26, Tamas K Lengyel wrote:
> >>> On Thu, Jan 30, 2025 at 8:24=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 21.01.2025 11:19, Sergiy Kibrik wrote:
> >>>>> Use more generic CONFIG_VM_EVENT name throughout Xen code instead o=
f
> >>>>> CONFIG_MEM_ACCESS. This reflects the fact that vm_event is a higher=
 level
> >>>>> feature, with mem_access & monitor depending on it.
> >>>>>
> >>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> I don't think this is applicable; my suggestion went in a different =
direction.
> >>>>
> >>>>> Suggested-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> >>>>
> >>>> Before considering to ack this, I'd like you, Tamas, to confirm this=
 is really
> >>>> what you had thought of. In particular ...
> >>>>
> >>>>> --- a/xen/arch/arm/Makefile
> >>>>> +++ b/xen/arch/arm/Makefile
> >>>>> @@ -37,7 +37,7 @@ obj-y +=3D irq.o
> >>>>>  obj-y +=3D kernel.init.o
> >>>>>  obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o
> >>>>>  obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >>>>> -obj-$(CONFIG_MEM_ACCESS) +=3D mem_access.o
> >>>>> +obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
> >>>>
> >>>> ... changes like this one look somewhat odd to me.
> >>>>
> >>>>> --- a/xen/common/Kconfig
> >>>>> +++ b/xen/common/Kconfig
> >>>>> @@ -92,7 +92,7 @@ config HAS_VMAP
> >>>>>  config MEM_ACCESS_ALWAYS_ON
> >>>>>       bool
> >>>>>
> >>>>> -config MEM_ACCESS
> >>>>> +config VM_EVENT
> >>>>>       def_bool MEM_ACCESS_ALWAYS_ON
> >>>>>       prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
> >>>>>       depends on HVM
> >>>>
> >>>> What about MEM_ACCESS_ALWAYS_ON (visible in patch context)? Shouldn'=
t that
> >>>> become VM_EVENT_ALWAYS_ON then, too?
> >>>>
> >>>> Further, what about MEM_PAGING and MEM_SHARING? Shouldn't those, at =
least
> >>>> documentation purposes, then also gain a dependency on VM_EVENT?
> >>>
> >>> MEM_PAGING, yes. MEM_SHARING, definitely not. MEM_SHARING is perfectl=
y
> >>> functional without vm_event.
> >>
> >> Is it? I see e.g.
> >>
> >>     if ( sharing_enomem )
> >>     {
> >> #ifdef CONFIG_MEM_SHARING
> >>         if ( !vm_event_check_ring(currd->vm_event_share) )
> >>         {
> >>             gprintk(XENLOG_ERR, "Domain %pd attempt to unshare "
> >>                     "gfn %lx, ENOMEM and no helper\n",
> >>                     currd, gfn);
> >>             /* Crash the domain */
> >>             rc =3D 0;
> >>         }
> >> #endif
> >>     }
> >
> > On x86 vm_event is always compiled in as per current setup. If we were
> > to make that dependent on the now renamed config option this here
> > should be converted to CONFIG_MEM_SHARING && CONFIG_VM_EVENT. The rest
> > of the mem_sharing codebase does not require vm_event to function,
> > this here is used only if there is a subscriber to the enomem
> > corner-case. It isn't normally used.
>
> I see.
>
> >> in hvm_hap_nested_page_fault().
> >>
> >> Also - you responded only to a secondary remark here. What about the
> >> more basic points further up?
> >
> > My recommendation to use CONFIG_VM_EVENT for the
> > vm_event/mem_access/monitor subsystems strictly only applies to ARM
> > where these three subsystems have a 1:1:1 dependency. On x86 the
> > dependency between the three can be more complex, I would not change
> > the x86 side of things unless we want to get the three subsystems
> > their own kconfig options.
>
> Then why did you ack the patch, which clearly extends things to x86 as
> well? Iirc my suggestion was to indeed go with separate options (hence
> why I think the Suggested-by: here is wrong; see context near the top).

Because I'm fine with the level of impact this single renaming has on
the x86 codebase. I just don't want to start renaming other x86
specific config options or combining them into a single one because
the interactions between the sharing/paging/access/monitor/vm_event is
fairly tangled and would require a bit more careful consideration.

Tamas

