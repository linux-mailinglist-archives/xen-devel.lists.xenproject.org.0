Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910B57480C2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558876.873348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGylW-00047c-KP; Wed, 05 Jul 2023 09:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558876.873348; Wed, 05 Jul 2023 09:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGylW-00045D-HC; Wed, 05 Jul 2023 09:25:38 +0000
Received: by outflank-mailman (input) for mailman id 558876;
 Wed, 05 Jul 2023 09:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rv0Z=CX=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qGylU-000452-LB
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:25:36 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e490d042-1b15-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:25:33 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so9784305e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:25:33 -0700 (PDT)
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
X-Inumbo-ID: e490d042-1b15-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688549133; x=1691141133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0pJd0CkwnAImw3NilWU6OnypmhAU7YxkyhGF94aLpIE=;
        b=bwvZVb0GHtSzc+R9WMXphYf3E1H9MtpRux2UdqEc7qnLxbyAayr7P8f0DR0sGzhiGQ
         IlCS7+Ixns8vb+PG/ISsqXPUMl1QSd3T0lkbW4S+TmQuS/CoIN2UiUWIfSfq+AIu3kSz
         U0fF2Kq/5yKrOazrHv1OU3R/Y5NwsGID0X874=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549133; x=1691141133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pJd0CkwnAImw3NilWU6OnypmhAU7YxkyhGF94aLpIE=;
        b=K0zk8etgcMU2hgtHdzQja/hSysIOqMYe67iW78YCvGTIXSp10uAJl0AMOBs8qB3ToR
         7SwEnuKnv+kSG2bxdidB2SoqldjLBEFrop3Yr58rY7g2tXWdgRwPZdA97peIzif0nTCV
         OvabFAukdOXkQYAaMifLvC+c5GDsiHnUxRQp2//SVxeedcJk3RqrwjRkmOHv7aejlWbh
         nYxQuAggBcPemqOAfRD3AQWvLN8HgHrStJ/RtQm/lbnNef7JnSzCoofvjG7sgouLohMr
         L6Z01Lwo+iZiOF/iYCq0O8S5RZYXHmDodwZWjbv9T3BHcuLYRagQjVBQ07SkoEcVyFLw
         DaqA==
X-Gm-Message-State: ABy/qLZoR6RDCUdckpe0U6qT9WBPoglAiZNiW185fK2kECrIv5BwaAvj
	q1eLtEsDgM2co9a4H4lXrERDXVNgphezLXLqXBH+Cg==
X-Google-Smtp-Source: APBJJlF0J9mgg+iEe3+37ZZZKVPR9DjI6BJWb33J02eTDuwnjmrQUMZj1+/1VxR8NxjIt9PlzlcvyNYRNIyk8qT4iH8=
X-Received: by 2002:a05:6512:3a83:b0:4f9:92c7:4026 with SMTP id
 q3-20020a0565123a8300b004f992c74026mr13582462lfu.1.1688549133271; Wed, 05 Jul
 2023 02:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230630113756.672607-1-george.dunlap@cloud.com> <b046ddf8-d70b-e2db-f996-32e6a7164cd8@citrix.com>
In-Reply-To: <b046ddf8-d70b-e2db-f996-32e6a7164cd8@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 5 Jul 2023 10:25:22 +0100
Message-ID: <CA+zSX=bqf4QspF=ZW+rWwkfNp3u4xYjzDipsJX9_j2CpdtdhLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000004654a305ffb9fb06"

--0000000000004654a305ffb9fb06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 6:34=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> On 30/06/2023 12:37 pm, George Dunlap wrote:
> >
> >  docs/misc/xen-command-line.pandoc |  6 +++++
> >  xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
> >  xen/include/public/sysctl.h       |  6 +++++
>
> Given this filelist, why the sysctl change?
>
> There's no logic to drive this parameter in the xc/libxl param get/set.
>
> The only two in-tree users I can see are xenpm, along with an
> unconditional print to stderr saying it's deprecated and to use xl, and x=
l.
>

Yes.  I think unless someone objects then, I'll drop the sysctl interface
from this patch, and add it in a follow-up patch (perhaps at a later date,
depending on how much time I have this week).


> > diff --git a/docs/misc/xen-command-line.pandoc
> b/docs/misc/xen-command-line.pandoc
> > index 4060ebdc5d..369557020f 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instruction
> for TLB management if
> >  it is available.  This option can be used to cause Xen to fall back to
> >  older mechanisms, which are generally slower.
> >
> > +### load-balance-ratelimit
> > +> `=3D <integer>`
> > +
> > +The minimum interval between load balancing events on a given pcpu.
> > +At the moment only credit honors this parameter.
>
> So this is intended to be a global scheduler parameter?
>

Yes; nearly every scheduler does load balancing, and so any scheduler may
need this sort of limitation at some point.  It doesn't make sense to have
separate, nearly identical parameters for each scheduler.  At some point
this should probably be implemented for credit2, although perhaps with a
different default.

Ack on the two style comments.

 -George

--0000000000004654a305ffb9fb06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 4, 2023 at 6:34=E2=80=AFP=
M Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"=
_blank">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 30/06/2023 12:37 pm, George Dunlap wrot=
e:<br>
&gt;<br>
&gt;=C2=A0 docs/misc/xen-command-line.pandoc |=C2=A0 6 +++++<br>
&gt;=C2=A0 xen/common/sched/credit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 40 =
++++++++++++++++++++++++++-----<br>
&gt;=C2=A0 xen/include/public/sysctl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 =
+++++<br>
<br>
Given this filelist, why the sysctl change?<br>
<br>
There&#39;s no logic to drive this parameter in the xc/libxl param get/set.=
<br>
<br>
The only two in-tree users I can see are xenpm, along with an<br>
unconditional print to stderr saying it&#39;s deprecated and to use xl, and=
 xl.<br></blockquote><div><br></div><div>Yes.=C2=A0 I think unless someone =
objects then, I&#39;ll drop the sysctl interface from this patch, and add i=
t in a follow-up patch (perhaps at a later date, depending on how much time=
 I have this week).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; diff --git a/docs/misc/xen-command-line.pandoc b/docs=
/misc/xen-command-line.pandoc<br>
&gt; index 4060ebdc5d..369557020f 100644<br>
&gt; --- a/docs/misc/xen-command-line.pandoc<br>
&gt; +++ b/docs/misc/xen-command-line.pandoc<br>
&gt; @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instructio=
n for TLB management if<br>
&gt;=C2=A0 it is available.=C2=A0 This option can be used to cause Xen to f=
all back to<br>
&gt;=C2=A0 older mechanisms, which are generally slower.<br>
&gt;=C2=A0 <br>
&gt; +### load-balance-ratelimit<br>
&gt; +&gt; `=3D &lt;integer&gt;`<br>
&gt; +<br>
&gt; +The minimum interval between load balancing events on a given pcpu.<b=
r>
&gt; +At the moment only credit honors this parameter.<br>
<br>
So this is intended to be a global scheduler parameter?<br></blockquote><di=
v><br></div><div>Yes; nearly every scheduler does load balancing, and so an=
y scheduler may need this sort of limitation at some point.=C2=A0 It doesn&=
#39;t make sense to have separate, nearly identical parameters for each sch=
eduler.=C2=A0 At some point this should probably be implemented for credit2=
, although perhaps with a different default.</div><div>=C2=A0</div><div>Ack=
 on the two style comments.</div><div><br></div><div>=C2=A0-George</div></d=
iv></div>

--0000000000004654a305ffb9fb06--

