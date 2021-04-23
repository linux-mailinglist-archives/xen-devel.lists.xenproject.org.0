Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DFA3692CC
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116324.222027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvbf-0003gu-H7; Fri, 23 Apr 2021 13:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116324.222027; Fri, 23 Apr 2021 13:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvbf-0003gY-E4; Fri, 23 Apr 2021 13:12:27 +0000
Received: by outflank-mailman (input) for mailman id 116324;
 Fri, 23 Apr 2021 13:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfSa=JU=gmail.com=zaytsevgu@srs-us1.protection.inumbo.net>)
 id 1lZvZo-0003fL-QL
 for xen-devel@lists.xen.org; Fri, 23 Apr 2021 13:10:32 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2761864-c43b-44c2-81a7-4d828b693ec7;
 Fri, 23 Apr 2021 13:10:31 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j18so77507396lfg.5
 for <xen-devel@lists.xen.org>; Fri, 23 Apr 2021 06:10:31 -0700 (PDT)
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
X-Inumbo-ID: a2761864-c43b-44c2-81a7-4d828b693ec7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qim/xd+dyVhY6p+nuOeryKb6VLdsnTW9Mf7s5wO5EIg=;
        b=bRALVV6R3OiQ9uPNW21emkIGSScr/6WMoMa/5PNAwUBsG6PZGf2AEAQr8OABvenIm6
         WF/Hv0gt/aYi1A69Xz/BT2SzudlZmIAFuwKHqM82QPhYLB8bR6vLcv482UPXdrfVa14F
         cGWPYj2lLSA9PPqdVStIK9R9MrRcOWrm8UEpuXEy+vauvRe90olZy3+jSFRWyy6cxkes
         dHPBj1ToA+LCdH2vWLQ+/cTHFJ8jRxlgFZHrTOcBTYkk6fbMS4RYOn554T5U5e5+OzP7
         OCN1gxP9gOk1Lt1zZ4IBPTZs6pQrNj5+m9g9fbp2436exSfhs/Bu16LDqKKJubrvm5Ho
         MKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qim/xd+dyVhY6p+nuOeryKb6VLdsnTW9Mf7s5wO5EIg=;
        b=Cc6rKZ+MfQqG5yMgoFkR3OlMWwNEynU4I7GdPKvy65fwtppsojXP5NujWfe1icFbRt
         EqmuQDsY5j6ALsN8hmEZKcr+2a2HpaG43o+/ORF2c7pIYySddXyzfFqWiKEDCY1VIb7i
         7bUfRrScpP1xIPKlg8WdVhK80aBLl2Xvk+UL7EAWzqpkUd2d1m3SJVwP47a+/Jfyab65
         UlRiQU+9KXZKEQAVBs2ld1XFfaSRNXCHdf9ya45U26uuLtMV+aiYxnv0zy0fAnnj/PqZ
         bBd13qDA23IsVZ1vXE1topawpfZ4SRmMebnQFf7I3cQkUurk8h3ftGoiXjrP1KQ/yO85
         pjHw==
X-Gm-Message-State: AOAM530oSo3QgRRF+oJv5Qjm5QpKCAKDI6P0YxCvApW3ecEzRPzR4+I6
	5sMSghow7FnMowoNaC3h6kcXBjC8QL4/fwSpF+c=
X-Google-Smtp-Source: ABdhPJyPuNlr9/u6dFmY6X6aZEz26DXwqmCl1cRQjWQRIPf9NB4r3e1f8VD29BzoKNiPr+QAiCrKaDCL+pXT66i3leU=
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr2731208lfg.559.1619183430436;
 Fri, 23 Apr 2021 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <6237e102-f2cf-a66e-09b6-954ebfe28f8c@list.ru> <46f8bf3e-cd6e-e2de-94c1-c8a55fb10648@list.ru>
 <57478641-ed64-32bd-a577-428a50c880e2@suse.com> <33f08c57-08f7-b6c3-02ed-2b66c35665f2@list.ru>
In-Reply-To: <33f08c57-08f7-b6c3-02ed-2b66c35665f2@list.ru>
From: =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JfQsNC50YbQtdCy?= <zaytsevgu@gmail.com>
Date: Fri, 23 Apr 2021 16:10:19 +0300
Message-ID: <CADyHojEFuM8mrdyBpQCO+_OJsijfi6nR5YjbHxE3dkTqbAq23Q@mail.gmail.com>
Subject: Re: Fwd: [BUG] Windows is frozen after restore from snapshot
To: Sergey Kovalev <valor@list.ru>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000328bd105c0a3857e"

--000000000000328bd105c0a3857e
Content-Type: text/plain; charset="UTF-8"

>
> Since
> you've taken apart saved state, could you supply the full set of
> values (ideally multiple ones, if you happen to have them, plus
> ones where the problem didn't occur, to allow someone perhaps
> spot a pattern)?
>

Here is full HPET state from "frozen" snapshot according to hvm_hw_hpet
structure:

capabiliy: f424008086a201
res0: 0
config: 3
res1: 0
isr: 0
res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0]
mc64: 97b90bc74
res3: 0
timer0:
        config: f0000000002934
        cmp: fd4aa84c
        fsb: 0
        res4: 0
timer1:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
timer2:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
period[0] = ee6b2
period[1] = 0
period[2] = 0

This one taken from snapshot of "unfrozen" one:

capabiliy: f424008086a201
res0: 0
config: 3
res1: 0
isr: 0
res2: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0]
mc64: acbd23c57
res3: 0
timer0:
        config: f000000000293c
        cmp: acbd3761b
        fsb: 0
        res4: 0
timer1:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
timer2:
        config: f0000000000130
        cmp: ffffffff
        fsb: 0
        res4: 0
period[0] = ee6b2
period[1] = 0
period[2] = 0

The only difference is HPET_TN_PERIODIC flag for timers[0].config value

--000000000000328bd105c0a3857e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><font color=3D"#888888">
 Since<br>
you&#39;ve taken apart saved state, could you supply the full set of<br>
values (ideally multiple ones, if you happen to have them, plus<br>
ones where the problem didn&#39;t occur, to allow someone perhaps<br>
spot a pattern)?<font color=3D"#888888"><br>
</font>

</font>

</div></blockquote><br><div class=3D"gmail_quote">Here is full HPET state f=
rom &quot;frozen&quot; snapshot according to=20
hvm_hw_hpet structure:</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote" style=3D"margin-left:40px">capabiliy: f424008086a201<br>re=
s0: 0<br>config: 3<br>res1: 0<br>isr: 0<br>res2: [0, 0, 0, 0, 0, 0, 0, 0, 0=
, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]<br>mc64: 97b90bc74<br>res=
3: 0<br>timer0:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f0000000002934<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: fd4aa84c<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs=
b: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>timer1:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config: f0000000000130<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: fffff=
fff<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 re=
s4: 0<br>timer2:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f0000000000130<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: ffffffff<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fs=
b: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>period[0] =3D ee6b2<br>perio=
d[1] =3D 0<br>period[2] =3D 0</div><div class=3D"gmail_quote" style=3D"marg=
in-left:40px"><br></div><div class=3D"gmail_quote">This one taken from snap=
shot of &quot;unfrozen&quot; one:</div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote" style=3D"margin-left:40px">capabiliy: f42400808=
6a201<br>res0: 0<br>config: 3<br>res1: 0<br>isr: 0<br>res2: [0, 0, 0, 0, 0,=
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]<br>mc64: acbd2=
3c57<br>res3: 0<br>timer0:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f00000000=
0293c<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: acbd3761b<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>timer1:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 config: f0000000000130<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
cmp: ffffffff<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 res4: 0<br>timer2:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 config: f00000000=
00130<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp: ffffffff<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fsb: 0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 res4: 0<br>period[0] =3D ee6b2=
<br>period[1] =3D 0<br>period[2] =3D 0</div><div class=3D"gmail_quote" styl=
e=3D"margin-left:40px"><br></div><div class=3D"gmail_quote">The only differ=
ence is=20
HPET_TN_PERIODIC flag for timers[0].config value</div><br></div>

--000000000000328bd105c0a3857e--

