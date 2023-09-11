Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5979A5A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599112.934380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbz1-0000ke-3M; Mon, 11 Sep 2023 08:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599112.934380; Mon, 11 Sep 2023 08:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbz0-0000hZ-Uh; Mon, 11 Sep 2023 08:09:22 +0000
Received: by outflank-mailman (input) for mailman id 599112;
 Mon, 11 Sep 2023 08:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gp74=E3=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1qfbyy-0000g6-Uc
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:09:20 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 814b1504-507a-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 10:09:18 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-500b66f8b27so7106217e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 01:09:18 -0700 (PDT)
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
X-Inumbo-ID: 814b1504-507a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694419757; x=1695024557; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RMObPANAVTF2OcBeGnJ2qRv65zU7kWJjvY0xrUK0r4A=;
        b=AZp8+wTjX9rIyJH79You+bGQYy0dtaPnjAAYBy3vD4YRQ7R9CteUTL0u8DYJalikoX
         YWsNh1H/QOT+HtUfI1XzZdH0FH/sRWr/CU4FwkmQEFpmaHei6bZEqyGgSeFfzUaFIobE
         9vgdirbF+0Nm7yUzRP4zmeSdrKkSclFG6cre6dFKCtcNHLIoxAS7gd9Zh5VOZvJfhxoy
         6Vdna/2Q/zvQY/WWzbbFaTv0VSArqpJ95KQ/LwD7rW3TzW8kynjtvsfw1p6Lea4SXr/b
         cd4+06OGZFSh2+3Q27jVd/jZFHLZSkWbat7jAKntJnw6i28f5RmVmmz6IW6z4PVM/z2f
         5WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694419757; x=1695024557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMObPANAVTF2OcBeGnJ2qRv65zU7kWJjvY0xrUK0r4A=;
        b=aka7IWTrUm6ihvSfHXNtz2VxC4w4Tat+hFra2aNG/GFMHrGRyQjn9NKZDfqhvPup1q
         jlODZQq5jyjOAwNziPrNGqR/inP0SYlmtgNH1teiyX+QHTj/L3VpV+cgZgldvFVqQ6qi
         +44R+aAAaCy88wvgb2Y42P+fTwRnolXUFeP+9ZT2mtgNkhWAGyVNqJK0SP5QH8eYMEPf
         88V/VYBvvnmYsmo+libceKr/aJDCxy6XZUV96jxrF67m6s3eOVLJLZTp7VTbX8Eo7h2Q
         2r9MnYtReZkqPRkEDMnQ2VHxYE71AX/7hMXgNQn4Z9WkTiKx216Tm9+vzLw+NMn+0bz+
         FoXQ==
X-Gm-Message-State: AOJu0YxKWTbozd50Dk2h/HLIeTW40YPIGtYTT3nDQmIFvrhPpJjpxAg+
	GBYfZoMepjIDQycStL3w4JrysDgzA2UGuQZCjTE=
X-Google-Smtp-Source: AGHT+IG5ZXGo9589Vj6DKhOkVTIAwhZLP+gAXuBuUcVb/mgMGfjs6WdO39OOp0Li4izgIOXPUHb9QRxew4G2mK6DcR8=
X-Received: by 2002:ac2:5287:0:b0:4fe:8ba9:4c4 with SMTP id
 q7-20020ac25287000000b004fe8ba904c4mr5835179lfm.59.1694419757196; Mon, 11 Sep
 2023 01:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com>
In-Reply-To: <3dc0a9b2-d690-b9c7-321f-008ba1fbf084@amd.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 11 Sep 2023 04:09:03 -0400
Message-ID: <CAJ=z9a2LpUe_9160PEChMG=pSLYcwLwETdrTN2zDrk21QP2qpw@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about feature/code freeze
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>, "jgross@suse.com" <jgross@suse.com>, 
	"sstabellini@kernel.org" <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000ba8f35060510d73a"

--000000000000ba8f35060510d73a
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Sep 2023 at 09:02, Ayan Kumar Halder <ayankuma@amd.com> wrote:

> Hi Henry,
>
> On 11/09/2023 02:08, Henry Wang wrote:
> > CAUTION: This message has originated from an External Source. Please
> > use proper judgment and caution when opening attachments, clicking
> > links, or responding to this email.
> >
> > Hi everyone,
> >
> > This is the reminder that we are currently in the feature freeze. I
> > apologise
> >
> > for the delay.
> >
> > I decided to make the code freeze date on Fri Sep 22, 2023, to give
> > people more
> >
> > time to react because of my late reminder about feature freeze. The
> > hard code
> >
> > freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So currently
> > we have 2
> >
> > weeks before code freeze and another 4 weeks before hard code freeze. If
> >
> > everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.
> >
> > Also, below is the critical items on my list for 4.18 release:
> >
> > 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
> >
> > https://gitlab.com/xen-project/xen/-/issues/114
> >
> > 2. tools: Switch to non-truncating XENVER_* ops
> >
> >
> https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/
> >
> > 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for
> > staging | 6a47ba2f
> >
> > https://marc.info/?l=xen-devel&m=168312468808977
> > <https://marc.info/?l=xen-devel&m=168312468808977>
> >
> > https://marc.info/?l=xen-devel&m=168312687610283
> > <https://marc.info/?l=xen-devel&m=168312687610283>
> >
> > 4. The proper eIBRS support for x86
> >
> >
> https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/
> >
> > 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
> >
> >
> https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@cloud.com/
> >
> > 6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI detach for
> > HVM guest
> >
> > https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/
> >
> > 7. [PATCH v2 0/8] Fixes to debugging facilities
> >
> >
> https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/
> >
>
> Did you miss "[PATCH v6 00/13] xen/arm: Split MMU code as the prepration
> of MPU work" ?


AFAIU Henry listed all the critical series for 4.18. Can you explain why do
you think this is one?

Cheers,


>
> It see that patches from [PATCH v6 06/13] xen/arm: Split page table
> related code to mmu/pt.c ... are yet to be reviewed and committed.
>
> - Ayan
>
> > Kind regards,
> >
> > Henry
> >
>

--000000000000ba8f35060510d73a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 11 Sep 2023 at 09:02, Ayan Kumar Halder &lt;<a href=
=3D"mailto:ayankuma@amd.com">ayankuma@amd.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Henry,<br>
<br>
On 11/09/2023 02:08, Henry Wang wrote:<br>
&gt; CAUTION: This message has originated from an External Source. Please <=
br>
&gt; use proper judgment and caution when opening attachments, clicking <br=
>
&gt; links, or responding to this email.<br>
&gt;<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt; This is the reminder that we are currently in the feature freeze. I <b=
r>
&gt; apologise<br>
&gt;<br>
&gt; for the delay.<br>
&gt;<br>
&gt; I decided to make the code freeze date on Fri Sep 22, 2023, to give <b=
r>
&gt; people more<br>
&gt;<br>
&gt; time to react because of my late reminder about feature freeze. The <b=
r>
&gt; hard code<br>
&gt;<br>
&gt; freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So currently =
<br>
&gt; we have 2<br>
&gt;<br>
&gt; weeks before code freeze and another 4 weeks before hard code freeze. =
If<br>
&gt;<br>
&gt; everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.<br>
&gt;<br>
&gt; Also, below is the critical items on my list for 4.18 release:<br>
&gt;<br>
&gt; 1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)<br>
&gt;<br>
&gt; <a href=3D"https://gitlab.com/xen-project/xen/-/issues/114" rel=3D"nor=
eferrer" target=3D"_blank">https://gitlab.com/xen-project/xen/-/issues/114<=
/a><br>
&gt;<br>
&gt; 2. tools: Switch to non-truncating XENVER_* ops<br>
&gt;<br>
&gt; <a href=3D"https://lore.kernel.org/xen-devel/20230117135336.11662-1-an=
drew.cooper3@citrix.com/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@citrix.com/</a>=
<br>
&gt;<br>
&gt; 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for <br=
>
&gt; staging | 6a47ba2f<br>
&gt;<br>
&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D168312468808977" r=
el=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=
=3D168312468808977</a> <br>
&gt; &lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D16831246880897=
7" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&am=
p;m=3D168312468808977</a>&gt;<br>
&gt;<br>
&gt; <a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D168312687610283" r=
el=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&amp;m=
=3D168312687610283</a> <br>
&gt; &lt;<a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D16831268761028=
3" rel=3D"noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&am=
p;m=3D168312687610283</a>&gt;<br>
&gt;<br>
&gt; 4. The proper eIBRS support for x86<br>
&gt;<br>
&gt; <a href=3D"https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-8=
54c446c974e@citrix.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/</a><b=
r>
&gt;<br>
&gt; 5. [PATCH 1/2] credit: Limit load balancing to once per millisecond<br=
>
&gt;<br>
&gt; <a href=3D"https://lore.kernel.org/xen-devel/20230630113756.672607-1-g=
eorge.dunlap@cloud.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@cloud.com/</a><b=
r>
&gt;<br>
&gt; 6. [PATCH 0/2]=C2=A0 Revoke IOMEM/IO port/IRQ permissions on PCI detac=
h for <br>
&gt; HVM guest<br>
&gt;<br>
&gt; <a href=3D"https://lore.kernel.org/xen-devel/20230809103305.30561-1-ju=
lien@xen.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org=
/xen-devel/20230809103305.30561-1-julien@xen.org/</a><br>
&gt;<br>
&gt; 7. [PATCH v2 0/8] Fixes to debugging facilities<br>
&gt;<br>
&gt; <a href=3D"https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-0=
0c44f3ec08e@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.k=
ernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/</a><br>
&gt;<br>
<br>
Did you miss &quot;[PATCH v6 00/13] xen/arm: Split MMU code as the preprati=
on <br>
of MPU work&quot; ?</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">AFAIU Henry listed all the critical series for 4.18. Can you explain why=
 do you think this is one?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Cheers,</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" =
dir=3D"auto"><br>
<br>
It see that patches from [PATCH v6 06/13] xen/arm: Split page table <br>
related code to mmu/pt.c ... are yet to be reviewed and committed.<br>
<br>
- Ayan<br>
<br>
&gt; Kind regards,<br>
&gt;<br>
&gt; Henry<br>
&gt;<br>
</blockquote></div></div>

--000000000000ba8f35060510d73a--

