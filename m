Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C69646F7B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 13:21:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457094.714930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FtT-0007cs-Mp; Thu, 08 Dec 2022 12:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457094.714930; Thu, 08 Dec 2022 12:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FtT-0007aB-Jz; Thu, 08 Dec 2022 12:20:51 +0000
Received: by outflank-mailman (input) for mailman id 457094;
 Thu, 08 Dec 2022 12:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAIj=4G=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1p3FtR-0007a5-Uw
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 12:20:50 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf8f7f82-76f2-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 13:20:48 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id d14so1807114edj.11
 for <xen-devel@lists.xenproject.org>; Thu, 08 Dec 2022 04:20:48 -0800 (PST)
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
X-Inumbo-ID: bf8f7f82-76f2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0qMOO401inG15fcbCoSr7Hv1Bgv5a1jfj7g5lS+NQ4=;
        b=YzTwmTmdF8/sIcFlYI7YumSzlINKgdzUQdj/iv7j8Q7W7Qp0GqmmKKZlW1Vq7ZV7HS
         JPtPhzCOQvjVwkPS51RpRqZSuIevY3goexmH4e8Oh+1FibYmGG9x+1ngpeWqZog60BKB
         jvOA2WiD6LJqHIN8Ok5sT2Xzhf7ocbhDPg0Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0qMOO401inG15fcbCoSr7Hv1Bgv5a1jfj7g5lS+NQ4=;
        b=JGQo+hkWuTdJYViujzroytdJP4KoinVAfcZ35DytLt2mE94XoCGOeKYbxKWsUKplHP
         3t+TH2uTfA0v//s6chqnxEcXCr3iEVsJ/MURT52uaG8LkTBlob/xJfUcKcIxhgF8elfS
         fE78nwpubktJUu6pGf7jWBYZIIyjUX756avP9OrjBmyvCMySEc9FFHtrs8tNMeoDa+/g
         rdFdSMZ+nBelHgQbFlt31sXc/NZGpv3t7M7wKkh32Tl1JEiT5SWXb2IL7t2OpjJbBnEI
         O0gpFA8Kc0KismMSn4O5/r0EjRtUvprJWQ9zdlwLhVGGur464V2TIwpjf+jrAUwlRrOP
         L3Bw==
X-Gm-Message-State: ANoB5plfQ8lrP46kht0ynNgau5m2cW/5SJ2YR8nc4v5GdeHaDqmk2j/w
	4ZYQ9JU6NJagCVIqcDIDkRmr6gcrcqylMxH6yL3fWg==
X-Google-Smtp-Source: AA0mqf5kHWxsixqnUdLtw3oiZGZbumWN1C7mQPmY+urHlPZk+bpN0tuAK2KbikCDWL3PpyR7p7Gr+MUyZ6/FuPiScFA=
X-Received: by 2002:a05:6402:3789:b0:467:7664:c7f4 with SMTP id
 et9-20020a056402378900b004677664c7f4mr4127911edb.99.1670502048241; Thu, 08
 Dec 2022 04:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20221208104924.76637-1-george.dunlap@cloud.com> <2650908d-ce90-3e11-a267-8ed4328d0ec5@citrix.com>
In-Reply-To: <2650908d-ce90-3e11-a267-8ed4328d0ec5@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Dec 2022 12:20:37 +0000
Message-ID: <CA+zSX=b_29u8H0EWji+ydTxZoWeySYEchPL5YKfK2Z-2VqpHFg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="0000000000002eb13d05ef501101"

--0000000000002eb13d05ef501101
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 12:02 PM Andrew Cooper <Andrew.Cooper3@citrix.com>
wrote:

> On 08/12/2022 10:49, George Dunlap wrote:
> > Concerns were raised about two maintainers from the same company
> > colluding to get a patch in from their company; but such maintainers
> > could already collude, by working on the patch in secret, and posting
> > it publicly with only a single author's SoB, and having the other
> > person review it.
>
> I know this was how the concern was voices, but it was fairly bogus even
> as stated.  "same company" or not has no bearing at all on two
> maintainers choosing to collude in secret.
>
> The mitigation to all of this is the fact that being a maintainer starts
> from having gained trust / reputation in the community, and comes with
> the responsibility to not violate that trust.  Furthermore, there are
> mechanisms in place to deal with issues around said trust being violated.
>

Right; this sort of "factionalism" might arise due to the shared
perspective of being at the same company; but it might just as well arise
from something else.  For instance, you could imagine pro-"server"
maintainers at different companies colluding to get a patch in that they
knew was objected to by the part of the community focused on embedded; or
pro-"automotive" maintainers at different companies colluding to get a
patch in that was objected to by the part of the community focusing on
"true embedded" use cases.

Each of these hypothetical cases are covered by requirements #3 and #4:
that "sufficient time" must be given to respond, and that there be no open
objections.  We have mechanisms in place to address whether such
requirements were violated.

If you think it's important to have that in the commit message, I can try
to re-send it with words to that effect.  Personally I think it's fine as
it is.


> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>

Thanks.
 -George

--0000000000002eb13d05ef501101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 8, 2022 at 12:02 PM Andre=
w Cooper &lt;<a href=3D"mailto:Andrew.Cooper3@citrix.com">Andrew.Cooper3@ci=
trix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 08/12/2022 10:49, George Dunlap wrote:<br>
&gt; Concerns were raised about two maintainers from the same company<br>
&gt; colluding to get a patch in from their company; but such maintainers<b=
r>
&gt; could already collude, by working on the patch in secret, and posting<=
br>
&gt; it publicly with only a single author&#39;s SoB, and having the other<=
br>
&gt; person review it.<br>
<br>
I know this was how the concern was voices, but it was fairly bogus even<br=
>
as stated.=C2=A0 &quot;same company&quot; or not has no bearing at all on t=
wo<br>
maintainers choosing to collude in secret.<br>
<br>
The mitigation to all of this is the fact that being a maintainer starts<br=
>
from having gained trust / reputation in the community, and comes with<br>
the responsibility to not violate that trust.=C2=A0 Furthermore, there are<=
br>
mechanisms in place to deal with issues around said trust being violated.<b=
r></blockquote><div><br></div><div>Right; this sort of &quot;factionalism&q=
uot; might arise due to the shared perspective of being at the same company=
; but it might just as well arise from something else.=C2=A0 For instance, =
you could imagine pro-&quot;server&quot; maintainers at different companies=
 colluding to get a patch in that they knew was objected to by the part of =
the community focused on embedded; or pro-&quot;automotive&quot; maintainer=
s at different companies colluding to get a patch in that was objected to b=
y the part of the community focusing on &quot;true embedded&quot; use cases=
.</div><div><br></div><div>Each of these hypothetical cases are covered by =
requirements #3 and #4: that &quot;sufficient time&quot; must be given to r=
espond, and that there be no open objections.=C2=A0 We have mechanisms in p=
lace to address whether such requirements were violated.</div><div><br></di=
v><div>If you think it&#39;s important to have that in the commit message, =
I can try to re-send it with words to that effect.=C2=A0 Personally I think=
 it&#39;s fine as it is.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; Signed-off-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@cloud=
.com" target=3D"_blank">george.dunlap@cloud.com</a>&gt;<br>
<br>
Acked-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" ta=
rget=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br></blockquote><div><br>=
</div><div>Thanks.</div><div>=C2=A0-George=C2=A0</div></div></div>

--0000000000002eb13d05ef501101--

