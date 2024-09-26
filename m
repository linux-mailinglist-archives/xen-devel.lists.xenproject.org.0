Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E198716D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805231.1216299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlfe-0004Rz-He; Thu, 26 Sep 2024 10:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805231.1216299; Thu, 26 Sep 2024 10:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlfe-0004Q9-Ef; Thu, 26 Sep 2024 10:24:26 +0000
Received: by outflank-mailman (input) for mailman id 805231;
 Thu, 26 Sep 2024 10:24:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4mB=QY=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1stlfd-0004Pj-8A
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:24:25 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8092f925-7bf1-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:24:24 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c46680a71bso909735a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:24:24 -0700 (PDT)
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
X-Inumbo-ID: 8092f925-7bf1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727346264; x=1727951064; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bg48u1uQd1pUehJ/hHMQ+MHq+B19qtPPewIAyiRk0g4=;
        b=Q42aaLOYEgxvqeH0AaFAhqPPROJfE9T4LkBtzpRs8JCHymAd4mf6Ys83YyJ4bTZD93
         /zumJuIZ42BNHWwMvZhN9S7UCi3YgkFpdawwsP4Mxli8doCmD74N3IcJyx6XoLjxz6QL
         MDzqYPLbXYFY6gQ27pKTV5xiGAwSciSBy86Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346264; x=1727951064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bg48u1uQd1pUehJ/hHMQ+MHq+B19qtPPewIAyiRk0g4=;
        b=xK/3qquhNHOnusT5gsoTKaMZC9Oiv+qmb/P3yTLLZETW3VbuYhjnPkCsnoAppQFQzR
         g7dxY0eJrqaX2fTbRr6hkpSFIdIqFVxy7YichAKR/5KYZ3Tbb1SJdGNCUVuAoGidCK3A
         piqHdJU3mfcOcZJMZX1K1OjDsUL/+iIKOiX6gQw/npjKs3/Z//Cgc503nFrRrRlScJpn
         4H545QP+RzRY1ciAFT2RAJEAEHdh/xr2qnRIQ1RtB5VbfYyM+mbKzeYwdluI7ANa+yYL
         VsI2OR0blG/Pu1Thb+tGMPR+BZOCWdW9X13c0A0qjebY6Pr92juFq3YKy6SfwKS7SOWQ
         Dung==
X-Gm-Message-State: AOJu0Yx8YedoLHOrL8FZJykIETKYdjP/hPjBGQRQE06hmpc56rCSw0oa
	qOmmqpLBPE7EwHTswO8ANbz+JSyAVd/q5gWFFTuPAEaQMm2Vcb3tZWm7IGUAjH9IvbNdgxPjkfp
	40lHEQXu54D3gZPO3xDGI7P0TU9oZ65kCgIKuoQ==
X-Google-Smtp-Source: AGHT+IEZqfE9s+ZTogVRznXAzR2tSui1onCPVzDwvupg205SuTpgzsQ4nF5wNMvRGnFLwHQS7pZSVx0jASZvKh/RUkw=
X-Received: by 2002:a05:6402:40c5:b0:5c5:c4e9:c8a2 with SMTP id
 4fb4d7f45d1cf-5c720608de8mr4710389a12.3.1727346264116; Thu, 26 Sep 2024
 03:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=wCxPT+QiDW0Cb-LTQrkcfNTT8Eo_2kWsWHLrKJkhs8Mw@mail.gmail.com>
 <PAXPR04MB8459A05A8841D93593D73DE2886A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459A05A8841D93593D73DE2886A2@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 26 Sep 2024 11:23:48 +0100
Message-ID: <CAO-mL=x3Twc+JtvZa9EeFEEri9bJKg=RHDjuooXxz41pTy+Aew@mail.gmail.com>
Subject: Re: [POLL] Interest in next Xen Project meetup (Cambridge)
To: Peng Fan <peng.fan@nxp.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000007a4f1a06230324fb"

--0000000000007a4f1a06230324fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

There are no current plans to record this as these types of meetups are
best in person.
However, If there's enough interest, we can consider adding a virtual or
recorded element where possible.

Kelly Choi
Community Manager
Xen Project <https://xenproject.org/>


On Thu, Sep 26, 2024 at 1:20=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> Hi Kelly,
>
>
>
> Wonder whether there will be recording or notes for this and public later=
?
>
>
>
> Thanks,
>
> Peng.
>
>
>
> *From:* Xen-users <xen-users-bounces@lists.xenproject.org> *On Behalf Of =
*Kelly
> Choi
> *Sent:* Wednesday, September 25, 2024 10:59 PM
> *To:* xen-devel <xen-devel@lists.xenproject.org>;
> xen-users@lists.xenproject.org
> *Subject:* [POLL] Interest in next Xen Project meetup (Cambridge)
>
>
>
> Hi all,
>
>
>
> Quick poll to gather interest for next Xen Project/Zephyr meetup in
> Cambridge.
>
> *Date: 24th October 2024*
>
>
>
> We are also seeking two speakers for demos/lightning talks.
>
>
>
> Could you reply with a +1 if interested in attending?
>
> Just looking to gather numbers for now.
>
>
>
> Kelly Choi
>
> Community Manager
>
> Xen Project <https://xenproject.org/>
>

--0000000000007a4f1a06230324fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peng,<div><br></div><div>There are no current plans to =
record this as these types of meetups are best in person.</div><div>However=
, If there&#39;s enough interest, we can consider=C2=A0adding a virtual or =
recorded element where possible.=C2=A0</div><div><div><div dir=3D"ltr" clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><br></div><div>Kelly Choi<br></div><div><div style=3D"color:rgb(136,136=
,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)"><a href=
=3D"https://xenproject.org/" target=3D"_blank">Xen Project</a><br></div></d=
iv></div></div></div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Sep 26, 2024 at 1:20=E2=80=AFAM Peng=
 Fan &lt;<a href=3D"mailto:peng.fan@nxp.com">peng.fan@nxp.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"=
msg-7682911502129946961">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-7682911502129946961WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Hi Kelly,<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Wonder whether ther=
e will be recording or notes for this and public later?<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><u></u>=C2=A0<u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Thanks,<u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt">Peng.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt"><u></u>=C2=A0<u></u=
></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Xen-users &lt;<a href=3D"mailto:xen-use=
rs-bounces@lists.xenproject.org" target=3D"_blank">xen-users-bounces@lists.=
xenproject.org</a>&gt;
<b>On Behalf Of </b>Kelly Choi<br>
<b>Sent:</b> Wednesday, September 25, 2024 10:59 PM<br>
<b>To:</b> xen-devel &lt;<a href=3D"mailto:xen-devel@lists.xenproject.org" =
target=3D"_blank">xen-devel@lists.xenproject.org</a>&gt;; <a href=3D"mailto=
:xen-users@lists.xenproject.org" target=3D"_blank">xen-users@lists.xenproje=
ct.org</a><br>
<b>Subject:</b> [POLL] Interest in next Xen Project meetup (Cambridge)<u></=
u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi all,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Quick poll to gather interest for next Xen Project/Z=
ephyr meetup in Cambridge.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><b>Date: 24th October 2024</b><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">We are also seeking two speakers for demos/lightning=
 talks.=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Could you reply with a +1 if interested in attending=
?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Just looking to gather numbers for now.=C2=A0<u></u>=
<u></u></p>
</div>
<div>
<div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Kelly Choi<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(136,136,136)">Community Man=
ager<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:rgb(136,136,136)"><a href=3D"ht=
tps://xenproject.org/" target=3D"_blank">Xen Project</a><u></u><u></u></spa=
n></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000007a4f1a06230324fb--

