Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E481737F11
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 11:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552599.862760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuIu-0003m5-V5; Wed, 21 Jun 2023 09:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552599.862760; Wed, 21 Jun 2023 09:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBuIu-0003kQ-S3; Wed, 21 Jun 2023 09:39:08 +0000
Received: by outflank-mailman (input) for mailman id 552599;
 Wed, 21 Jun 2023 09:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2n=CJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBuIs-0003kJ-Qr
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 09:39:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75fc8578-1017-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 11:39:04 +0200 (CEST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 70AD94EE0741
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 11:39:04 +0200 (CEST)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-440b66adc81so1145316137.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 02:39:04 -0700 (PDT)
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
X-Inumbo-ID: 75fc8578-1017-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDzhdV9Qqc1xe2Sbv8PmBYSGEqpFDxTNkNLbPcLpfIlHwVWHm8xc
	7p2Xzm8yKdnyUh3gZk4+6mIqYOWPLi7LmvrNQFY=
X-Google-Smtp-Source: ACHHUZ4EkVFWHwnmtDb7TW4ddyoFGnD6ANjrKueQLXuKBHRaT9zxkiB3fkpwv8GoB4ez0x52SNWa5eA6cX7segIs9zA=
X-Received: by 2002:a67:fc08:0:b0:440:af3c:4c18 with SMTP id
 o8-20020a67fc08000000b00440af3c4c18mr4661036vsq.5.1687340343292; Wed, 21 Jun
 2023 02:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <21337a20c5c8d66dff552c2f09054ea82b253dd6.1687250177.git.gianluca.luparini@bugseng.com>
 <7cdd53c7-4d57-39f2-10fa-2fa2ddc98389@suse.com> <37C5BC47-E735-4731-A6C6-F30189FA6B9D@arm.com>
 <alpine.DEB.2.22.394.2306201341070.897208@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2306201341070.897208@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 21 Jun 2023 11:38:51 +0200
X-Gmail-Original-Message-ID: <CAFHJcJttMh6+49K0mYQx0igoXuZW9jQw2fLZPy97H7Yvf0XFpA@mail.gmail.com>
Message-ID: <CAFHJcJttMh6+49K0mYQx0igoXuZW9jQw2fLZPy97H7Yvf0XFpA@mail.gmail.com>
Subject: Re: [XEN PATCH 02/13] AMD/IOMMU: fixed violations of MISRA C:2012
 Rule 7.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	"consulting@bugseng.com" <consulting@bugseng.com>, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar <ayan.kumar.halder@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000c7004205fea089fd"

--000000000000c7004205fea089fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno mar 20 giu 2023 alle ore 22:41 Stefano Stabellini <
sstabellini@kernel.org> ha scritto:

> On Tue, 20 Jun 2023, Luca Fancellu wrote:
> > > On 20 Jun 2023, at 13:39, Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > On 20.06.2023 12:34, Simone Ballarin wrote:
> > >> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> > >> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> > >> @@ -38,49 +38,49 @@
> > >>         ((uint64_t)(offset) << (12 + (PTE_PER_TABLE_SHIFT * ((level)
> - 1))))
> > >>
> > >> /* IOMMU Capability */
> > >> -#define PCI_CAP_ID_MASK 0x000000FF
> > >> +#define PCI_CAP_ID_MASK 0x000000FFU
> > >
> > > Seeing this and similar uses further down, I think there's a purely
> > > stylistic question to be resolved first (and hence I'm widening the T=
o:
> > > list here): Do we want to allow either case of U to be used
> > > interchangeably, leaving the choice up to the patch author?
> >
> > Because you ask to the list, my personal opinion is that we might want =
to
> > have only capital U, so that it=E2=80=99s consistent across the codebas=
e and we
> don=E2=80=99t
> > need to create too many rules for the developer, it stands out anyway a=
s
> it can=E2=80=99t
> > be an hex digit
>
> I agree with Luca


I also agree with Luca.
--=20
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000c7004205fea089fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore 22=
:41 Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabe=
llini@kernel.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Tue, 20 Jun 2023, Luca Fancellu wrote:<br>
&gt; &gt; On 20 Jun 2023, at 13:39, Jan Beulich &lt;<a href=3D"mailto:jbeul=
ich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On 20.06.2023 12:34, Simone Ballarin wrote:<br>
&gt; &gt;&gt; --- a/xen/drivers/passthrough/amd/iommu-defs.h<br>
&gt; &gt;&gt; +++ b/xen/drivers/passthrough/amd/iommu-defs.h<br>
&gt; &gt;&gt; @@ -38,49 +38,49 @@<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((uint64_t)(offset) &lt;&lt;=
 (12 + (PTE_PER_TABLE_SHIFT * ((level) - 1))))<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; /* IOMMU Capability */<br>
&gt; &gt;&gt; -#define PCI_CAP_ID_MASK 0x000000FF<br>
&gt; &gt;&gt; +#define PCI_CAP_ID_MASK 0x000000FFU<br>
&gt; &gt; <br>
&gt; &gt; Seeing this and similar uses further down, I think there&#39;s a =
purely<br>
&gt; &gt; stylistic question to be resolved first (and hence I&#39;m wideni=
ng the To:<br>
&gt; &gt; list here): Do we want to allow either case of U to be used<br>
&gt; &gt; interchangeably, leaving the choice up to the patch author?<br>
&gt; <br>
&gt; Because you ask to the list, my personal opinion is that we might want=
 to<br>
&gt; have only capital U, so that it=E2=80=99s consistent across the codeba=
se and we don=E2=80=99t<br>
&gt; need to create too many rules for the developer, it stands out anyway =
as it can=E2=80=99t<br>
&gt; be an hex digit<br>
<br>
I agree with Luca</blockquote></div><div><br></div><div>I also agree with L=
uca.</div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr">Simone Ballarin, M.Sc.<br><=
br><div>Field Application Engineer, BUGSENG (<a href=3D"http://bugseng.com"=
 target=3D"_blank">https://bugseng.com</a>)</div></div></div></div>

--000000000000c7004205fea089fd--

