Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5BF80CD40
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652157.1017894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgxf-0001ZR-5C; Mon, 11 Dec 2023 14:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652157.1017894; Mon, 11 Dec 2023 14:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgxf-0001WN-1D; Mon, 11 Dec 2023 14:08:43 +0000
Received: by outflank-mailman (input) for mailman id 652157;
 Mon, 11 Dec 2023 14:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLR=HW=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rCgxd-0001Vs-O0
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:08:41 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c895b81d-982e-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 15:08:39 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a1e2f34467aso428035266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 06:08:39 -0800 (PST)
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
X-Inumbo-ID: c895b81d-982e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702303719; x=1702908519; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SIagXiUr9qcUjx+qV4QcL8eRgfLx3JAhDGQhMUNweiA=;
        b=LzQgd0H2+aksBspXF3BBQKEwxM5Z6qAQXa7C4VQccwpKlXliOdI1dyqMy8+n/NfoEl
         1G9Gprd0rkbk3eiz/LaR+WVP1TZxcCR/BixpzZn4/p/GONpRGnxBV/Y9EQZDleqBkeoI
         BATGurCr8MtGFxXpdAhsDXeF+J8vLBHpNTeuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702303719; x=1702908519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIagXiUr9qcUjx+qV4QcL8eRgfLx3JAhDGQhMUNweiA=;
        b=U2CtCIdCt5g2UWJMQLbsr36Rz4ZIiy0LB5kR6RlcJ2vjh54V+j0E5KNfFNLTkAW7i4
         7bi4WZacurfGHiFLoQ04xWFDnU4Srxi4ydQGZbjqzqkIPO7rpcPHkKfoi5noZNPN/ofe
         LAxmstyR3RGt23Q81ocquESJ8/XIDoNuA6jZp7iYbHvUjLV7hcH0nIcmBCF6SN5U0nFR
         JmdBP4D3LBnd9oJhejXpJ2QifbYNekthhgmWfTk7dNlzUWxquVf1y0ICyVhvrxt2pXh6
         032fQEbD5nWdJFhvMKQtzq1pODSv+IYuLS4qFjxZEwG1yFg24HFsANYk7+c+M1cIWhNX
         FJdA==
X-Gm-Message-State: AOJu0YwLIgAauWc5RjnLxgK1Qn1qwaflh+2UOVFe13be5qSqgsekS1xm
	7Ul6b9aiYvC63hPqUoWLr18KY51LbAkj8F841jxULw==
X-Google-Smtp-Source: AGHT+IGvVp1tdD936dtZA20B+fFOf1XZbgRhIxoIziRmRVvdVVmIdj41zHcNsfTVRZJKElBaQhGl4VNYqffMv3MqPCM=
X-Received: by 2002:a17:906:1010:b0:a19:4f2b:f76d with SMTP id
 16-20020a170906101000b00a194f2bf76dmr2204858ejm.13.1702303718951; Mon, 11 Dec
 2023 06:08:38 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com>
 <alpine.DEB.2.22.394.2312011253390.110490@ubuntu-linux-20-04-desktop>
 <1978d259-1531-4dcc-a106-d87f6f26885d@suse.com> <CA+zSX=YNcjDZHF-gx8C8owEpyyjSEtj-MKDAqRwp9woHzEFtUg@mail.gmail.com>
 <alpine.DEB.2.22.394.2312041524180.110490@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2312041524180.110490@ubuntu-linux-20-04-desktop>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 11 Dec 2023 14:08:02 +0000
Message-ID: <CAO-mL=ypSOeMPnXEeQJTAhZ2o3j5MPGCfXv0vM7Kje_syLmr8g@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>, 
	xen-devel@lists.xenproject.org, committers@xenproject.org
Content-Type: multipart/alternative; boundary="00000000000077fabe060c3c78ef"

--00000000000077fabe060c3c78ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As we haven't yet reached a consensus, let's see what the informal vote
looks like in the community by the end of the week.
Since the scope and context have changed slightly, anonymous voting is
permitted and I will be counting all votes made after Dec 4th. Please only
vote once.

Should you wish to change your answer you can do so using this link:
https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cY=
pZdluWo/

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Dec 4, 2023 at 11:51=E2=80=AFPM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Mon, 4 Dec 2023, George Dunlap wrote:
> > And how do we give people practical options to respond to a maintainer
> > who they think is being "picky"
>
> If a maintainer is too picky the contributor and the other maintainers
> should say that the patch is good enough in their view. If the
> maintainers disagree (on that topic or another) the new informal voting
> rule should help us move forward faster.
>
> The informal voting would have helped us move forward faster in the
> original thread.
>
>
> On Mon, 4 Dec 2023, George Dunlap wrote:
> > the chance of a vote of the committers being out of sync with the
> > community is fairly small. But of course, small is not impossible.
> > [...] Hence the community-wide survey.
>
> Yes. If someone cares about the outcome, and they are not happy with the
> informal vote, then they need to call for a formal vote.
>
> But maintainers/committers might not always be the right people to
> escalate the voting to.
>
> Yes committers' opinions should count, but certain things have more to
> do with our users and the way they understand our documentation than
> implementation correctness. For these things, our users' opinions should
> count as much as ours.
>
> So I can see that in those cases, if someone is not happy with the
> informal vote, the best next step would be a community-wide survey like
> Kelly did here. That's a good idea.
>
> I don't think that's written anywhere in our governance specifically,
> but I think it would be a good addition.
>

--00000000000077fabe060c3c78ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>As we haven&#39;t yet rea=
ched a consensus, let&#39;s see what the informal vote looks like in the co=
mmunity by the end of the week.=C2=A0</div><div>Since the scope and context=
 have changed slightly, anonymous voting is permitted and I will be countin=
g all votes made after Dec 4th. Please only vote once.=C2=A0</div><div><br>=
</div><div>Should you wish to change your answer you can do so using this l=
ink:=C2=A0<a href=3D"https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN=
4wjV5iUGlMuZbkVdwk7cYpZdluWo/">https://cryptpad.fr/form/#/2/form/view/7ByH9=
5Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/</a></div><div><br clear=3D"all"><di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br>=
</div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><di=
v style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div><=
/div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Dec 4, 2023 at 11:51=E2=80=AFPM Stefano Stabel=
lini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, 4 Dec 2023, George Dunlap wrote:<br>
&gt; And how do we give people practical options to respond to a maintainer=
<br>
&gt; who they think is being &quot;picky&quot;<br>
<br>
If a maintainer is too picky the contributor and the other maintainers<br>
should say that the patch is good enough in their view. If the<br>
maintainers disagree (on that topic or another) the new informal voting<br>
rule should help us move forward faster.<br>
<br>
The informal voting would have helped us move forward faster in the<br>
original thread.<br>
<br>
<br>
On Mon, 4 Dec 2023, George Dunlap wrote:<br>
&gt; the chance of a vote of the committers being out of sync with the<br>
&gt; community is fairly small. But of course, small is not impossible.<br>
&gt; [...] Hence the community-wide survey.<br>
<br>
Yes. If someone cares about the outcome, and they are not happy with the<br=
>
informal vote, then they need to call for a formal vote.<br>
<br>
But maintainers/committers might not always be the right people to<br>
escalate the voting to.<br>
<br>
Yes committers&#39; opinions should count, but certain things have more to<=
br>
do with our users and the way they understand our documentation than<br>
implementation correctness. For these things, our users&#39; opinions shoul=
d<br>
count as much as ours.<br>
<br>
So I can see that in those cases, if someone is not happy with the<br>
informal vote, the best next step would be a community-wide survey like<br>
Kelly did here. That&#39;s a good idea. <br>
<br>
I don&#39;t think that&#39;s written anywhere in our governance specificall=
y,<br>
but I think it would be a good addition.<br>
</blockquote></div>

--00000000000077fabe060c3c78ef--

