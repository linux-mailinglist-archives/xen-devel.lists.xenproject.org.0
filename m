Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BE964271
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 12:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785647.1195126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcqt-0001tz-IU; Thu, 29 Aug 2024 10:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785647.1195126; Thu, 29 Aug 2024 10:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcqt-0001qo-Em; Thu, 29 Aug 2024 10:58:07 +0000
Received: by outflank-mailman (input) for mailman id 785647;
 Thu, 29 Aug 2024 10:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ugx=P4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sjcqs-0001qe-Ed
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 10:58:06 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ffb36a2-65f5-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 12:58:03 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c0a9ae3665so465802a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 03:58:03 -0700 (PDT)
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
X-Inumbo-ID: 8ffb36a2-65f5-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724929082; x=1725533882; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/6CBlYePOkvF5FsLWKMWCnZEaLFgbgH1XcB164VcwJg=;
        b=KEvT1u26W8p+R/rSY6bfKrl+uF6b2rso2JUEndHe6/7aeYtbKLkoJkD3691epSySMP
         8hUB2k2esBEg0xaUJxWU6Ffgh1O7/efbAeTIKM9PSMe91LneiCmrKgtML2brcdRsKWjg
         yki1HHq4EN+HUUZqUHGS07SBVIPHMFG8W/EtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929082; x=1725533882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6CBlYePOkvF5FsLWKMWCnZEaLFgbgH1XcB164VcwJg=;
        b=nRCTa3OSE649qmpy4FtNOAbZVldzO7Rx0llehjs7j9n9sXeCnYWpN/r+xTPF2Mr9lg
         Yfo0hPupExGDVwnGuL5aKcsz9maLTqMtfRZEEabAgnGfqdQ3bzBhBCldJUHv8PHX6giO
         5s4r+ZuBYu13LTXihIjxfmx7QRUJn4+AzL66OoFM/+RXwD1MKgfTUiLi5pWjD3NQAFUj
         YNHzq0eyMotmRzDswAP/YAbJ4mSyG2Ob6FqwLh+RzLsPZsCmyulGEh1zgd+qLqX5b24L
         vchFCRXitJMbP7jS6S3zDAtbRBYZo7fCRRWC6dGkyag3NA9JJcLg1XN6FrHWPKjOLO75
         Qh0A==
X-Forwarded-Encrypted: i=1; AJvYcCXWoT3/8uOi4eqzmplwAjEl+z6KGPzMDZOErkeMWWCI4Sub0i+Jj4NNHDPZ7gtTALa++9bxLM8vSWQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzllZIb7gfPjkLm75EDCcX+LMKnxq1ZRF03dUOoDwmPom70rkjK
	dl8ajJgt7TPmHosB/SqXxG2VDTGCFMqXCYckgbuu8dNkNSZdbBKvLxAYHdP3KCAvM3iIB6MzymR
	HuUyhipgVrreOY7hzX1gyrXgg/ko6RlEmuprLQ2JNcbkGTNjJ
X-Google-Smtp-Source: AGHT+IFqRxu0NDBTvUxw+egd/griYRSV2N2DKuQcEwrKlm1gwdKbdqspnc2BtSr1Cj+nbc6dVvjQcZUhW5M91nn3xOM=
X-Received: by 2002:a05:6402:13d5:b0:5bf:f1:908 with SMTP id
 4fb4d7f45d1cf-5c21ed86a9bmr2149089a12.24.1724929082009; Thu, 29 Aug 2024
 03:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=zWYsDGkBoDtc8erGfAFnaR1y+FaLKsx3pEJ3MgxKAy0Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2408161111160.298534@ubuntu-linux-20-04-desktop> <c5e23ad4-5415-4ea9-9b9d-806cd93fd742@suse.com>
In-Reply-To: <c5e23ad4-5415-4ea9-9b9d-806cd93fd742@suse.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 29 Aug 2024 11:57:26 +0100
Message-ID: <CAO-mL=wE_mK1JkV4=M7hkcM-y1p-JAZawbvLiVp18CwzeW4i1Q@mail.gmail.com>
Subject: Re: Xen Project statistics help
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003250b20620d0595a"

--0000000000003250b20620d0595a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks both.
I'll look to see what's possible, although if anyone could help automate
this monthly that would be greatly helpful!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Aug 19, 2024 at 9:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 16.08.2024 20:25, Stefano Stabellini wrote:
> > xen.biterg.io was created by a company called Bitergia. Bitergia was
> > later contracted by the Linux Foundation to create a generic dashboard
> > for all their Open Source projects. Getting access to the Linux
> > Foundation dashboard is the best way to go (if it comes to no cost to
> > our project).
> >
> > I have used scripts like these in the past to get some data out of a
> > release. You can copy/paste the output to an Excel datasheet to do
> > further calculations there.
> >
> > # List of contributors by name (using the commit "Author" tag) for the
> > # 4.19 release. One name per commit.
> > git log 4.18.0-rc4...4.19.0-rc4 --format=3D'%aN' | sort | uniq -c | sor=
t
> -rn
> >
> > # List of reviewers (using the Reviewed-by and Acked-by tags) for the
> > # 4.19 release. One name per review.
> > git log 4.18.0-rc4...4.19.0-rc4 --pretty=3Dformat:%b | grep -E
> "Reviewed-by|Acked-by" | sed -E
> 's/.*(Reviewed-by|Acked-by):\s*(.*)\s*<.*/\2/' | sort | uniq -c | sort -r=
n
>
> Just to mention it: Going by tags here doesn't come anywhere close to the
> actual work put into reviewing, even when leaving aside the obvious
> difference between small, large but mechanical, and large+intrusive
> changes. Imo unlike commit stats, review stats would better be collected
> from the mailing list.
>
> Jan
>

--0000000000003250b20620d0595a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks both.=C2=A0<div>I&#39;ll look to see what&#39;s pos=
sible, although if anyone could help automate this monthly that would be gr=
eatly helpful!=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Aug 19, 2024 at 9:38=E2=80=AFAM Jan Beulich &lt;<a href=3D"mailto:j=
beulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 16.08.2024 20:25, Stefano Stabellini =
wrote:<br>
&gt; <a href=3D"http://xen.biterg.io" rel=3D"noreferrer" target=3D"_blank">=
xen.biterg.io</a> was created by a company called Bitergia. Bitergia was<br=
>
&gt; later contracted by the Linux Foundation to create a generic dashboard=
<br>
&gt; for all their Open Source projects. Getting access to the Linux<br>
&gt; Foundation dashboard is the best way to go (if it comes to no cost to<=
br>
&gt; our project).<br>
&gt; <br>
&gt; I have used scripts like these in the past to get some data out of a<b=
r>
&gt; release. You can copy/paste the output to an Excel datasheet to do<br>
&gt; further calculations there.<br>
&gt; <br>
&gt; # List of contributors by name (using the commit &quot;Author&quot; ta=
g) for the<br>
&gt; # 4.19 release. One name per commit.<br>
&gt; git log 4.18.0-rc4...4.19.0-rc4 --format=3D&#39;%aN&#39; | sort | uniq=
 -c | sort -rn<br>
&gt; <br>
&gt; # List of reviewers (using the Reviewed-by and Acked-by tags) for the<=
br>
&gt; # 4.19 release. One name per review.<br>
&gt; git log 4.18.0-rc4...4.19.0-rc4 --pretty=3Dformat:%b | grep -E &quot;R=
eviewed-by|Acked-by&quot; | sed -E &#39;s/.*(Reviewed-by|Acked-by):\s*(.*)\=
s*&lt;.*/\2/&#39; | sort | uniq -c | sort -rn<br>
<br>
Just to mention it: Going by tags here doesn&#39;t come anywhere close to t=
he<br>
actual work put into reviewing, even when leaving aside the obvious<br>
difference between small, large but mechanical, and large+intrusive<br>
changes. Imo unlike commit stats, review stats would better be collected<br=
>
from the mailing list.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000003250b20620d0595a--

