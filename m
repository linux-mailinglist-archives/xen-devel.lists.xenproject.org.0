Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24A79A603
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599143.934421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcJs-0007kw-FU; Mon, 11 Sep 2023 08:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599143.934421; Mon, 11 Sep 2023 08:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcJs-0007jG-CN; Mon, 11 Sep 2023 08:30:56 +0000
Received: by outflank-mailman (input) for mailman id 599143;
 Mon, 11 Sep 2023 08:30:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gp74=E3=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1qfcJq-0007iu-FY
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:30:54 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8487be80-507d-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:30:52 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-502b0d23f28so2044863e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 01:30:52 -0700 (PDT)
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
X-Inumbo-ID: 8487be80-507d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694421051; x=1695025851; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+pzeKfJgALmefiRyVtW2rISspxsjUq606l16rY5xsXY=;
        b=beyijVmsu/uVr88uFY9jNYuWc5lK/s32YrZ3ioMHwkRP/57UPt50Hi5Z6ZPXCsf2yQ
         oeGOwL2Fmd8Nki+Je4R6tMI1eTn9f1E6q9TteL5cPDTnDovkjQ8C38b3WFzoaGCgZv+5
         7GvfEu1ghtZSaamcJJu6ZIIOSCz31BgfZQ38xIKloOSL3zSZ9J4DBWEyvELMKpPFaCbl
         Re7U2VXuxQfPxYQOoN3aCsTtr3hv4QAhCcMex2rbiLntq6I8tzcYnGDqT7OQNTgSAARm
         52g6vYcNzLoPiSpQ6Y43hnNvYta0EooBoUN9D+SBSi90NVEV/aG69nsrQ8C8HVL/+tyW
         B9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694421051; x=1695025851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pzeKfJgALmefiRyVtW2rISspxsjUq606l16rY5xsXY=;
        b=XjnL9k2I1vtolSRu888InkZJ4v26VyTPcAJPq2T7x2MzybVpAKB6JKvq0h08MHGYJz
         XrajbygEFkpb2hy0TPu+/187g83m5wMDDm939ZXk5/rRQwuQoC8h9H2JFNIDZSaYwGfJ
         Dseigia0JxkmbLyQSXWiifUynBQWbl/udLBvHvG7jm+J4zjMxL7MlxvMSUYswSY3LQvC
         kbE1+RroqVSuEv7knSk0aOhZrVphhtOCU0cPL/0fWbcx3raiRRE0idL27//urUCET5OX
         TPeosJmciItAkn4/WCXcGhSVnWGhqKDuJhDhfi3TQIcItC1JCuzS05efc3GT85ef0xrd
         IZ9g==
X-Gm-Message-State: AOJu0Yzipdfe5OImLs9HCL8vwOpkEuyKHd3MXuXhaUKKblnya2nHldUn
	veRLHD29M95aVde2Y9BkcCT0Iq2StNCZlsJJu10=
X-Google-Smtp-Source: AGHT+IEIssaOTYvPuRIjEZpvzDOC5NGkYC1dyTF4Xs4yJw546FJ2U6zYbu8qeJvSq6vPkzmyV/z37Jz8RbwPvl8Ku9I=
X-Received: by 2002:a05:6512:340d:b0:4fb:89e2:fc27 with SMTP id
 i13-20020a056512340d00b004fb89e2fc27mr7543308lfr.54.1694421051021; Mon, 11
 Sep 2023 01:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com> <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
 <23604843-555f-4e34-fd6a-53bbe7f94d68@amd.com>
In-Reply-To: <23604843-555f-4e34-fd6a-53bbe7f94d68@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 11 Sep 2023 04:30:37 -0400
Message-ID: <CAJ=z9a0Z3RsEE+-xoKtMfveKCCk98OWmzgvXJMFo=QOaeO8OPQ@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>, "jgross@suse.com" <jgross@suse.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000d89f94060511246e"

--000000000000d89f94060511246e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Sep 2023 at 09:23, Ayan Kumar Halder <ayankuma@amd.com> wrote:

> Hi Julien,
>
> On 11/09/2023 09:09, Julien Grall wrote:
> >
> >
> > On Mon, 11 Sep 2023 at 09:02, Ayan Kumar Halder <ayankuma@amd.com>
> wrote:
> >
> >     Hi Henry,
> >
> >     On 11/09/2023 02:08, Henry Wang wrote:
> >     > CAUTION: This message has originated from an External Source.
> >     Please
> >     > use proper judgment and caution when opening attachments, clickin=
g
> >     > links, or responding to this email.
> >     >
> >     > Hi everyone,
> >     >
> >     > This is the reminder that we are currently in the feature freeze.=
 I
> >     > apologise
> >     >
> >     > for the delay.
> >     >
> >     > I decided to make the code freeze date on Fri Sep 22, 2023, to gi=
ve
> >     > people more
> >     >
> >     > time to react because of my late reminder about feature freeze. T=
he
> >     > hard code
> >     >
> >     > freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So
> >     currently
> >     > we have 2
> >     >
> >     > weeks before code freeze and another 4 weeks before hard code
> >     freeze. If
> >     >
> >     > everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.
> >     >
> >     > Also, below is the critical items on my list for 4.18 release:
> >     >
> >     > 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
> >     >
> >     > https://gitlab.com/xen-project/xen/-/issues/114
> >     >
> >     > 2. tools: Switch to non-truncating XENVER_* ops
> >     >
> >     >
> >
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@c=
itrix.com/
> >     >
> >     > 3. dom0less vs xenstored setup race Was: xen | Failed pipeline fo=
r
> >     > staging | 6a47ba2f
> >     >
> >     > https://marc.info/?l=3Dxen-devel&m=3D168312468808977
> >     <https://marc.info/?l=3Dxen-devel&m=3D168312468808977>
> >     > <https://marc.info/?l=3Dxen-devel&m=3D168312468808977
> >     <https://marc.info/?l=3Dxen-devel&m=3D168312468808977>>
> >     >
> >     > https://marc.info/?l=3Dxen-devel&m=3D168312687610283
> >     <https://marc.info/?l=3Dxen-devel&m=3D168312687610283>
> >     > <https://marc.info/?l=3Dxen-devel&m=3D168312687610283
> >     <https://marc.info/?l=3Dxen-devel&m=3D168312687610283>>
> >     >
> >     > 4. The proper eIBRS support for x86
> >     >
> >     >
> >
> https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@ci=
trix.com/
> >     >
> >     > 5. [PATCH 1/2] credit: Limit load balancing to once per milliseco=
nd
> >     >
> >     >
> >
> https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@c=
loud.com/
> >     >
> >     > 6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI
> >     detach for
> >     > HVM guest
> >     >
> >     >
> >
> https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/
> >     >
> >     > 7. [PATCH v2 0/8] Fixes to debugging facilities
> >     >
> >     >
> >
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gm=
ail.com/
> >     >
> >
> >     Did you miss "[PATCH v6 00/13] xen/arm: Split MMU code as the
> >     prepration
> >     of MPU work" ?
> >
> >
> > AFAIU Henry listed all the critical series for 4.18. Can you explain
> > why do you think this is one?
>
> Sorry, if I misunderstood something.
>
> I assumed we were aiming for R82 MMU rework to be included in 4.18 releas=
e.


That was the aim. But due to timing, it didn=E2=80=99t get reviewed before =
the
feature freeze.

Even if technically this is not a new feature, I am a bit cautious in
trying to refactor the code too late. They are large patches and therefore
not entirely risk free.

I am happy to continue to review them in order to merge them when the tree
re-open.

Cheers,


>
> - Ayan
>
> >
> > Cheers,
> >
> >
> >
> >     It see that patches from [PATCH v6 06/13] xen/arm: Split page table
> >     related code to mmu/pt.c ... are yet to be reviewed and committed.
> >
> >     - Ayan
> >
> >     > Kind regards,
> >     >
> >     > Henry
> >     >
> >
>

--000000000000d89f94060511246e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 11 Sep 2023 at 09:23, Ayan Kumar Halder &lt;<a href=
=3D"mailto:ayankuma@amd.com">ayankuma@amd.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Julien,<br>
<br>
On 11/09/2023 09:09, Julien Grall wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, 11 Sep 2023 at 09:02, Ayan Kumar Halder &lt;<a href=3D"mailto:=
ayankuma@amd.com" target=3D"_blank">ayankuma@amd.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Henry,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/09/2023 02:08, Henry Wang wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; CAUTION: This message has originated from an E=
xternal Source.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Please<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; use proper judgment and caution when opening a=
ttachments, clicking<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; links, or responding to this email.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi everyone,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is the reminder that we are currently in =
the feature freeze. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; apologise<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for the delay.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I decided to make the code freeze date on Fri =
Sep 22, 2023, to give<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; people more<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; time to react because of my late reminder abou=
t feature freeze. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; hard code<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; freeze date will remain unchanged, i.e. Fri Oc=
t 6, 2023. So<br>
&gt;=C2=A0 =C2=A0 =C2=A0currently<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; we have 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; weeks before code freeze and another 4 weeks b=
efore hard code<br>
&gt;=C2=A0 =C2=A0 =C2=A0freeze. If<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; everything goes well, we can cut 4.18 rc1 at F=
ri Sep 29, 2023.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Also, below is the critical items on my list f=
or 4.18 release:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. [PATCH 0/7] tools: More Python 3 fixes (par=
t 1 of N)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://gitlab.com/xen-project/xen/=
-/issues/114" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/xen-p=
roject/xen/-/issues/114</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. tools: Switch to non-truncating XENVER_* op=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/202301=
17135336.11662-1-andrew.cooper3@citrix.com/" rel=3D"noreferrer" target=3D"_=
blank">https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.coop=
er3@citrix.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 3. dom0less vs xenstored setup race Was: xen |=
 Failed pipeline for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; staging | 6a47ba2f<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&am=
p;m=3D168312468808977" rel=3D"noreferrer" target=3D"_blank">https://marc.in=
fo/?l=3Dxen-devel&amp;m=3D168312468808977</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp=
;m=3D168312468808977" rel=3D"noreferrer" target=3D"_blank">https://marc.inf=
o/?l=3Dxen-devel&amp;m=3D168312468808977</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"https://marc.info/?l=3Dxen-deve=
l&amp;m=3D168312468808977" rel=3D"noreferrer" target=3D"_blank">https://mar=
c.info/?l=3Dxen-devel&amp;m=3D168312468808977</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp=
;m=3D168312468808977" rel=3D"noreferrer" target=3D"_blank">https://marc.inf=
o/?l=3Dxen-devel&amp;m=3D168312468808977</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&am=
p;m=3D168312687610283" rel=3D"noreferrer" target=3D"_blank">https://marc.in=
fo/?l=3Dxen-devel&amp;m=3D168312687610283</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp=
;m=3D168312687610283" rel=3D"noreferrer" target=3D"_blank">https://marc.inf=
o/?l=3Dxen-devel&amp;m=3D168312687610283</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"https://marc.info/?l=3Dxen-deve=
l&amp;m=3D168312687610283" rel=3D"noreferrer" target=3D"_blank">https://mar=
c.info/?l=3Dxen-devel&amp;m=3D168312687610283</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp=
;m=3D168312687610283" rel=3D"noreferrer" target=3D"_blank">https://marc.inf=
o/?l=3Dxen-devel&amp;m=3D168312687610283</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 4. The proper eIBRS support for x86<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/ec8e75=
da-743b-50dc-4665-854c446c974e@citrix.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974=
e@citrix.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 5. [PATCH 1/2] credit: Limit load balancing to=
 once per millisecond<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/202306=
30113756.672607-1-george.dunlap@cloud.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunl=
ap@cloud.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 6. [PATCH 0/2]=C2=A0 Revoke IOMEM/IO port/IRQ =
permissions on PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0detach for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; HVM guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/202308=
09103305.30561-1-julien@xen.org/" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 7. [PATCH v2 0/8] Fixes to debugging facilitie=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lore.kernel.org/xen-devel/21cc28=
b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/" rel=3D"noreferrer" target=3D"_bl=
ank">https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e=
@gmail.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Did you miss &quot;[PATCH v6 00/13] xen/arm: Split =
MMU code as the<br>
&gt;=C2=A0 =C2=A0 =C2=A0prepration<br>
&gt;=C2=A0 =C2=A0 =C2=A0of MPU work&quot; ?<br>
&gt;<br>
&gt;<br>
&gt; AFAIU Henry listed all the critical series for 4.18. Can you explain <=
br>
&gt; why do you think this is one?<br>
<br>
Sorry, if I misunderstood something.<br>
<br>
I assumed we were aiming for R82 MMU rework to be included in 4.18 release.=
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That was the aim=
. But due to timing, it didn=E2=80=99t get reviewed before the feature free=
ze.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Even if technically =
this is not a new feature, I am a bit cautious in trying to refactor the co=
de too late. They are large patches and therefore not entirely risk free.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">I am happy to continue to=
 review them in order to merge them when the tree re-open.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
- Ayan<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It see that patches from [PATCH v6 06/13] xen/arm: =
Split page table<br>
&gt;=C2=A0 =C2=A0 =C2=A0related code to mmu/pt.c ... are yet to be reviewed=
 and committed.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Ayan<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Kind regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Henry<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000d89f94060511246e--

