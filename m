Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E73A42F2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 15:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140389.259405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrh7M-0003rG-Vc; Fri, 11 Jun 2021 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140389.259405; Fri, 11 Jun 2021 13:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrh7M-0003oo-SR; Fri, 11 Jun 2021 13:22:36 +0000
Received: by outflank-mailman (input) for mailman id 140389;
 Fri, 11 Jun 2021 13:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBs1=LF=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1lrh7L-0003of-5R
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 13:22:35 +0000
Received: from mail-ot1-x334.google.com (unknown [2607:f8b0:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb131802-6ec8-4e34-8221-a528efc75d6f;
 Fri, 11 Jun 2021 13:22:34 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l15-20020a05683016cfb02903fca0eacd15so3099846otr.7
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 06:22:34 -0700 (PDT)
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
X-Inumbo-ID: cb131802-6ec8-4e34-8221-a528efc75d6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMkPtLnjfjBcMRUBIpL9t8lGJOfmiK+zsKjRUYJ9MSE=;
        b=LLLorqJCw5VddTYr7qLEz4B0H1/1vOziV+00oJRaOPGkNOipj8lGLauR1pymXocV95
         yPkOjjTAx4wutnveJ0pPYmjpdmS2UDlGCd1REjFRmvequPmrRbOdQIJKcQQsTir3SnLm
         bA4elxmTPRCzhjwZ8AZEz1nxpSJO+6gWPA/IK2bLPo/FXkwjGDVYSHqD6eqlMHpUrFCC
         DjztbKQujN0JFhq2yYlLlVcVNff4kXuaQKaRMhn+xpV0wGSEPV0FEBH8EaryN1BG324Y
         mPGt9GqDCVxG+vPSKUlkmKkFP3RBN4oXPVdhAxiv78fRUj851uPklk3C+jVltI1BNY/c
         cyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMkPtLnjfjBcMRUBIpL9t8lGJOfmiK+zsKjRUYJ9MSE=;
        b=LPZH4VqnNawlMlGYwOuisV4OYmiaig+fCkx8RBAXei2+Ta1YanNDRVh/2tZMh4GY79
         G90hE2+G4ZAvSo7Ir27x1chngzMdXbKlR8QbzZqU3AE1lhpUcLwzkIOi0kc2aJ002UOs
         JgNLW8Rm2usn9Xob5GaB+7Xvf8SkUBR6Cq8DkyKap/4GJQe/EsuQC/CnLrkk8jfqScy8
         X9eumqiWYVFBV4dxVMHFnT7y56ZxRJ4RxowcPE17GsiENDyBJlUhyIePVLptywztn3xz
         p1k1h94NruVxgwWry+3WVv+UowJG9UuuRiHf765/eoiUPYyj99GV74VfnyTnvm2utdJ8
         eOrg==
X-Gm-Message-State: AOAM532NPlXWKblKELlIIs8VLh9SO1HyLV2XXiWif1wm/W0XLsWSe+Dx
	4wxcEVfKrwxahn0hasaFLE5t8Q8dWR40P5tK5uQ=
X-Google-Smtp-Source: ABdhPJzWf8ciN41S0pKlGCesVgGbsXdNWI6G7QUTrlw8FWICn1UmEdx7VU+Kb05zgZONlyMQ5BeKMNLLeiyCnEHjohE=
X-Received: by 2002:a9d:7682:: with SMTP id j2mr3106147otl.299.1623417753606;
 Fri, 11 Jun 2021 06:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <e4946a69-bc1a-d54c-dadf-e71feecd99ab@suse.com>
 <CAJ=z9a07v-cnMhK=cVjjdN3-f4t8qGc3oQz17zRdLxOauBp=qA@mail.gmail.com>
 <af2f231a-5130-8e5f-b024-04f74e57d1ad@suse.com> <CAF3u54BrJ9MViXnBUMykukaOrpO=SyEV0KwE8Pbs8=tQiLb7wg@mail.gmail.com>
 <1dca7acd-8f37-b9a0-1ea5-dcd7afc62710@suse.com>
In-Reply-To: <1dca7acd-8f37-b9a0-1ea5-dcd7afc62710@suse.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 11 Jun 2021 14:22:21 +0100
Message-ID: <CAF3u54CRe9WnXob8a6-NnT76hfi55a=-9vjoFN2yyePHhQzKOA@mail.gmail.com>
Subject: Re: [PATCH] Arm32: MSR to SPSR needs qualification
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000869d1105c47d66d1"

--000000000000869d1105c47d66d1
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Jun 2021, 15:02 Jan Beulich, <jbeulich@suse.com> wrote:

> On 11.06.2021 12:41, Julien Grall wrote:
> > On Fri, 11 Jun 2021, 11:16 Jan Beulich, <jbeulich@suse.com> wrote:
> >
> >> On 11.06.2021 10:00, Julien Grall wrote:
> >>> On Fri, 11 Jun 2021, 08:55 Jan Beulich, <jbeulich@suse.com> wrote:
> >>>
> >>>> The Arm ARM's description of MSR doesn't even allow for plain "SPSR"
> >>>> here, and while gas accepts this, it takes it to mean SPSR_cf. Yet
> >>>> surely all of SPSR wants updating on this path, not just the lowest
> and
> >>>> highest 8 bits.
> >>>>
> >>>
> >>> Can you provide a reference to the Arm Arm? This would help to navigate
> >>> through the 8000 pages.
> >>
> >> Referencing the instruction page would be enough, I thought (as
> >> even I, not being an Arm person, have no difficulty locating it).
> >> If it isn't, how is a canonical doc ref supposed to look like on
> >> Arm? On x86, we avoid recording document versions, section
> >> numbers, or even page numbers in code comments or commit messages
> >> (which isn't to say we have none of these, but we try to avoid
> >> new ones to appear), as these tend to change with every new
> >> version of the doc. Therefore, to me, the offending commit's "ARM
> >> DDI 0487D.b page G8-5993" doesn't look like something I wanted to
> >> clone from. But if you tell me otherwise, then well - so be it.
> >
> >
> > The Arm website provides a link for nearly every revision on the specs.
> As
> > the wording can change between version, it is useful to know which spec
> the
> > understanding is based from.
> >
> >  Note that for Arm32 we should quote the Armv7 spec and not the Armv8 one
> > because we only follow the former (there are a few small differences).
>
> Thanks for having me dig out an up-to-date Armv7 spec. I find this
> puzzling in particular because you didn't care to have the earlier
> commit provide a v7 doc ref. Initially I did intentionally use (a
> newer version of) the doc that was pointed at there (which I also
> think is better structured than the v7 one).


Well Stefano replied past midnight UK time with the reference and committed
nearly afterwards. So I didn't really have time to object...

When I asked for the reference I didn't think I needed to mention it should
be the Armv7 as he should know we only support Armv7 for 32-bit.

I didn't bother to reply afterwards. But given there is a bug and you
quoted him, I chose to make clear that reference should be Armv7 only.

Cheers,



> Jan
>
>

--000000000000869d1105c47d66d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 11 Jun 2021, 15:02 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@su=
se.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 11.06.2021=
 12:41, Julien Grall wrote:<br>
&gt; On Fri, 11 Jun 2021, 11:16 Jan Beulich, &lt;<a href=3D"mailto:jbeulich=
@suse.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jbeulich@suse.co=
m</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 11.06.2021 10:00, Julien Grall wrote:<br>
&gt;&gt;&gt; On Fri, 11 Jun 2021, 08:55 Jan Beulich, &lt;<a href=3D"mailto:=
jbeulich@suse.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jbeulich=
@suse.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The Arm ARM&#39;s description of MSR doesn&#39;t even allo=
w for plain &quot;SPSR&quot;<br>
&gt;&gt;&gt;&gt; here, and while gas accepts this, it takes it to mean SPSR=
_cf. Yet<br>
&gt;&gt;&gt;&gt; surely all of SPSR wants updating on this path, not just t=
he lowest and<br>
&gt;&gt;&gt;&gt; highest 8 bits.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you provide a reference to the Arm Arm? This would help to=
 navigate<br>
&gt;&gt;&gt; through the 8000 pages.<br>
&gt;&gt;<br>
&gt;&gt; Referencing the instruction page would be enough, I thought (as<br=
>
&gt;&gt; even I, not being an Arm person, have no difficulty locating it).<=
br>
&gt;&gt; If it isn&#39;t, how is a canonical doc ref supposed to look like =
on<br>
&gt;&gt; Arm? On x86, we avoid recording document versions, section<br>
&gt;&gt; numbers, or even page numbers in code comments or commit messages<=
br>
&gt;&gt; (which isn&#39;t to say we have none of these, but we try to avoid=
<br>
&gt;&gt; new ones to appear), as these tend to change with every new<br>
&gt;&gt; version of the doc. Therefore, to me, the offending commit&#39;s &=
quot;ARM<br>
&gt;&gt; DDI 0487D.b page G8-5993&quot; doesn&#39;t look like something I w=
anted to<br>
&gt;&gt; clone from. But if you tell me otherwise, then well - so be it.<br=
>
&gt; <br>
&gt; <br>
&gt; The Arm website provides a link for nearly every revision on the specs=
. As<br>
&gt; the wording can change between version, it is useful to know which spe=
c the<br>
&gt; understanding is based from.<br>
&gt; <br>
&gt;=C2=A0 Note that for Arm32 we should quote the Armv7 spec and not the A=
rmv8 one<br>
&gt; because we only follow the former (there are a few small differences).=
<br>
<br>
Thanks for having me dig out an up-to-date Armv7 spec. I find this<br>
puzzling in particular because you didn&#39;t care to have the earlier<br>
commit provide a v7 doc ref. Initially I did intentionally use (a<br>
newer version of) the doc that was pointed at there (which I also<br>
think is better structured than the v7 one).</blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Well Stefano replied past midnight =
UK time with the reference and committed nearly afterwards. So I didn&#39;t=
 really have time to object...</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">When I asked for the reference I didn&#39;t think I needed to mentio=
n it should be the Armv7 as he should know we only support Armv7 for 32-bit=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t bother to=
 reply afterwards. But given there is a bug and you quoted him, I chose to =
make clear that reference should be Armv7 only.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Jan<br>
<br>
</blockquote></div></div></div>

--000000000000869d1105c47d66d1--

