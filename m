Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0F8B3643
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 13:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712656.1113501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JNC-0008VG-4p; Fri, 26 Apr 2024 11:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712656.1113501; Fri, 26 Apr 2024 11:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0JNC-0008SW-0O; Fri, 26 Apr 2024 11:04:10 +0000
Received: by outflank-mailman (input) for mailman id 712656;
 Fri, 26 Apr 2024 11:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLQV=L7=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s0JNA-00084D-Gv
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 11:04:08 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e90175-03bc-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 13:04:06 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57255e89facso600374a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 04:04:06 -0700 (PDT)
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
X-Inumbo-ID: b2e90175-03bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714129445; x=1714734245; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y6YcNctRX5knL74w+4wjmbrTytIBttjArAywtNz6fE=;
        b=cthuDGIajiMNK4aSbPgcVOQtLmpq5AGonwr8sWTcQ/Q4ctEYJ7ZGs0iOHgV6SMT7nc
         zz/I5y+uS0TzYt6TfTTHWgu7Jcbf8Y5buTd3rX2KVy7U/rFbTYWNLIeAeUBajbOx9pNo
         bYWtVeP+UY7B7E8oicRX9JV/cOOv+SpihBZho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714129445; x=1714734245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y6YcNctRX5knL74w+4wjmbrTytIBttjArAywtNz6fE=;
        b=sDRQGBWjRYUw8ybYqHhm01N+8aQaf/G7Qt/Oh//45gMbrCV4cOyCoSiHnigVsHD6Qu
         ZtJnBlPStC3wKN8empQV2Fgmrs/EZ2l49qy/n1SmkAxOIcJiXrO4KvTUiUl/j1vrf1PK
         6uLbNTYijLGC9CJ5q0WM4rw7WtAgsQTDC6nGxFzSR8rq11SteAS66bDUK3y2kE12UaPQ
         eoFYfoqSFSZEQV1hbL8Dhvk9IyIP6/5erij9qNn1/bBQElfI2oWLMDrTv54AWGr6gD8T
         npuv92F4wJrxUJANa9oYeulT+gKpDLYjlOO+W2nqHP1WeLf+wM1ti5QY1g3JeN8d4i0A
         vtRw==
X-Gm-Message-State: AOJu0YzXLdgPlOH+VJzYaPzFZoQdo1jdaTLStQCFsDcjuMyFIYCP8l+n
	5m+ea36gGFTF2t6lEFaM6qWNhocHakJ1phDhKtPa3KIidgrEeVMgHsUIG08R8DLHdVxMGC0/h0X
	Bji/+mwlTVzgVgEgJDrpBce0AuGuk8On8STUd6mM10RL0eoiN5hHSIA==
X-Google-Smtp-Source: AGHT+IE2ITVoL8eSEaqHF7trlWM7wsd0GCiJD66VxG2iQ3bHsoGb3jynbFV1UtYh2p55AidCstvC5YwmJ69VuC8hT6s=
X-Received: by 2002:a05:6402:40c2:b0:572:53d5:62e0 with SMTP id
 z2-20020a05640240c200b0057253d562e0mr1435600edb.4.1714129445268; Fri, 26 Apr
 2024 04:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <p2-q466qgwwlqfn4m-qx47948p-a01-2x6n-0011N000017qoUMQAY@cvent-planner.com>
 <LV8PR84MB3654E4FE6C656979B4A47A78A6172@LV8PR84MB3654.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <LV8PR84MB3654E4FE6C656979B4A47A78A6172@LV8PR84MB3654.NAMPRD84.PROD.OUTLOOK.COM>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 26 Apr 2024 12:03:29 +0100
Message-ID: <CAO-mL=wM8siytp7hQezY8mm1AyL0tJc0Y-Za8wt1ebhAjbiOyQ@mail.gmail.com>
Subject: [ANNOUNCE] Xen Project Summit 2024 Design Sessions
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000af4fca0616fddc69"

--000000000000af4fca0616fddc69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Community,

*Our design sessions are now open for Xen Summit! *

If you've attended Xen Summit before, you might be familiar with the
process.

For anyone who hasn't done so before, please follow the instructions below,
using the link to create an account
<https://design-sessions.xenproject.org/>.
Once you've created your account, you'll be asked to verify using the code
below. That's it, you're in!

We aim to have design sessions with a virtual element (using Jitsi/Zoom).
This is free for the community to join in and listen, and will be hosted by
an attendee in the session.

If you're going to be an *in-person attendee*, you can propose a session
and vote on sessions you would like to see discussed.
If you're going to be a *virtual attendee*, you can vote on sessions you
would like to see discussed. You can still propose a session, but please
note there will be no professional audio or visual equipment in person for
these sessions.

The final schedule will be allocated and arranged by the highest-voted
sessions.

Virtual links for the community to join Xen Summit design sessions will be
shared closer to the event.

If you have any questions, please let me know.

For in-person tickets, click here
<https://events.linuxfoundation.org/xen-project-summit/register/>.

------------------------------




We look forward to holding the Design Sessions at the upcoming Xen Project
Summit. The design sessions will be on Wednesday, 5 June, and Thursday, 6
June 2024.

We encourage everyone to submit a Design Session, the verification code is:
=E2=80=9C*LFXEN24*=E2=80=9D.

*SUBMIT A DESIGN SESSION* <https://design-sessions.xenproject.org/>



The process involves the following steps:

   - Anyone interested can propose
   <https://design-sessions.xenproject.org/discussion/new> a topic.
   - All participants review the list of sessions
   <https://design-sessions.xenproject.org/list/discussion>, indicating
   their interest in attending each one.
   - The session scheduler optimizes the schedule
   <https://design-sessions.xenproject.org/schedule> to accommodate as many
   preferences as possible.

Participants can also propose long-form talks by adding [TALK] to the
session title.

For suggested topics, sample Design Session submissions, and more tips
check out the Xen Design Session page
<https://events.linuxfoundation.org/xen-project-summit/program/design-sessi=
ons/>
for more information.


Best Regards,
Xen Project Events Team


------------------------------

--000000000000af4fca0616fddc69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div>Hello Xen Community,</div><d=
iv><b><br></b></div><div><b>Our design sessions are now open for Xen Summit=
!=C2=A0</b></div><div><br></div><div>If you&#39;ve attended Xen Summit befo=
re, you might be familiar with the process.=C2=A0</div><div><br></div><div>=
For anyone who hasn&#39;t done so before, please follow the instructions be=
low, using the=C2=A0<a href=3D"https://design-sessions.xenproject.org/">lin=
k to create an account</a>.=C2=A0</div><div>Once you&#39;ve created your ac=
count, you&#39;ll be asked to verify using the code below. That&#39;s it, y=
ou&#39;re in!</div><div><br></div><div>We aim to have design sessions with =
a virtual element (using Jitsi/Zoom). This is free for the community to joi=
n in and listen, and will be hosted by an attendee in the session.=C2=A0<br=
></div><div><br></div><div>If you&#39;re going to be an <b><i>in-person att=
endee</i></b>, you can propose a session and vote on sessions you would lik=
e to see discussed.=C2=A0</div><div>If you&#39;re going to be a <b><i>virtu=
al attendee</i></b>, you can vote on sessions you would like to see discuss=
ed. You can still propose a session, but please note there will be no profe=
ssional audio or visual equipment in person for these sessions.=C2=A0</div>=
<div><br></div><div>The final schedule will be allocated and arranged by th=
e highest-voted sessions.=C2=A0</div><div><br></div><div>Virtual links for =
the community to join Xen Summit design sessions will be shared closer to t=
he event.=C2=A0=C2=A0<br></div><div><br></div><div>If you=C2=A0have any que=
stions,=C2=A0please let me know.</div><div><p class=3D"MsoNormal">For in-pe=
rson tickets, <a href=3D"https://events.linuxfoundation.org/xen-project-sum=
mit/register/">click here</a>.=C2=A0</p><p class=3D"MsoNormal"><u></u></p><=
table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=
=3D"width:949.612px"><tbody><tr><td style=3D"padding:0.75pt"><div class=3D"=
MsoNormal" align=3D"center" style=3D"text-align:center"><hr size=3D"1" widt=
h=3D"100%" noshade align=3D"center" style=3D"color:rgb(160,160,160)"></div>=
<p class=3D"MsoNormal"></p></td></tr></tbody></table></div><div><br></div><=
/div></div></div><div class=3D"gmail_quote"><div class=3D"msg-2685003709366=
885060"><div lang=3D"EN-US" link=3D"#0099E0" vlink=3D"#0099E0" style=3D"wor=
d-wrap:break-word" id=3D"m_-2685003709366885060body"><div class=3D"m_-26850=
03709366885060WordSection1"><div id=3D"m_-2685003709366885060mail-editor-re=
ference-message-container"><div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;float:left">
<tbody>
<tr>
<td style=3D"background:#eff0f2;padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;float:left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;background:white">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><img bo=
rder=3D"0" width=3D"699" style=3D"width:7.2812in" id=3D"m_-2685003709366885=
060_x0000_i1028" src=3D"https://custom.cvent.com/64779B2AC74D4D2BBFF4459DE9=
3A5253/pix/d770244914e047019777029a32e20c53.png?d=3D699"></p>
</td>
</tr>
</tbody>
</table>
</div>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"display:none"><u></u>=C2=A0<u></u></span></p>
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in"></td>
</tr>
</tbody>
</table>
</div>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"font-size:10.0pt;font-family:&quot;Times New Roman&quot;,serif"><u>=
</u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0in 0in 0in 0in;word-break:break-word">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;background:white;float:left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in;float:left">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;float:left">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100.0%;word-break:break-word">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:11.25pt 11.25pt 0in 11.25pt">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black">We look forw=
ard to holding the Design Sessions at the upcoming Xen Project Summit. The =
design sessions will be on Wednesday, 5 June, and
 Thursday, 6 June 2024.<br>
<br>
We encourage everyone to submit a Design Session, the </span><span style=3D=
"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#212121">v=
erification code</span><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black"> is: =E2=80=9C</span><b><span style=3D"fo=
nt-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#212121">LFXE=
N24</span></b><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black">=E2=80=9D.<u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100.0%;float:left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;border-radius:15px;border-collapse:separate!important">
<tbody>
<tr>
<td style=3D"padding:11.25pt 11.25pt 11.25pt 11.25pt">
<div align=3D"center">
<table border=3D"1" cellspacing=3D"0" cellpadding=3D"0" style=3D"background=
:#72be44;border:solid #72be44 4.5pt">
<tbody>
<tr>
<td style=3D"border:none;padding:3.75pt 15.0pt 3.75pt 15.0pt">
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"color:black"><a href=3D"https://design-sessions.xenproject.org/" ta=
rget=3D"_blank"><b><span style=3D"font-size:13.0pt;font-family:&quot;Arial&=
quot;,sans-serif;color:white;text-decoration:none">SUBMIT
 A DESIGN SESSION</span></b></a></span></p>
</td>
</tr>
</tbody>
</table>
</div>
<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span s=
tyle=3D"font-size:1.0pt">=C2=A0</span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in;word-break:break-word">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100.0%;float:left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in;float:left">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;word-break:break-word">
<tbody>
<tr>
<td style=3D"padding:0in 11.25pt 11.25pt 11.25pt">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in">
<p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#212529">The proces=
s involves the following steps:</span><span style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in;word-break:break-word">
<ul type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;line-height:13.5pt">
<span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#212529">Anyone interested can=C2=A0</span><a href=3D"https://design-se=
ssions.xenproject.org/discussion/new" target=3D"_blank"><span style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#0d6efd">propos=
e</span></a><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:#212529">=C2=A0a
 topic.</span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif"><u></u><u></u></span></li><li class=3D"MsoNormal" style=3D"col=
or:black;line-height:13.5pt">
<span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#212529">All participants review the=C2=A0</span><a href=3D"https://des=
ign-sessions.xenproject.org/list/discussion" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#0d6efd=
">list
 of sessions</span></a><span style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#212529">, indicating their interest in attendin=
g each one.
</span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-s=
erif"><u></u><u></u></span></li><li class=3D"MsoNormal" style=3D"color:blac=
k;line-height:13.5pt">
<span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#212529">The session scheduler optimizes the=C2=A0</span><a href=3D"htt=
ps://design-sessions.xenproject.org/schedule" target=3D"_blank"><span style=
=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#0d6efd=
">schedule</span></a><span style=3D"font-size:10.5pt;font-family:&quot;Aria=
l&quot;,sans-serif;color:#212529">=C2=A0to
 accommodate as many preferences as possible.</span><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif"><u></u><u></u></span></l=
i></ul>
</td>
</tr>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in;word-break:break-word">
<p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:#212529">Participan=
ts can also propose long-form talks by adding [TALK] to the session title.<=
/span><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><u></u><u></u></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in;word-break:break-word">
<p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black">For suggeste=
d topics, sample Design Session submissions, and more tips check out the
</span><a href=3D"https://events.linuxfoundation.org/xen-project-summit/pro=
gram/design-sessions/" target=3D"_blank"><span style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:#1155cc">Xen Design Session pa=
ge</span></a><span style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,=
sans-serif;color:black">
 for more information.<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:3.75pt 0in 3.75pt 0in;word-break:break-word">
<p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-siz=
e:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><br>
Best Regards,<br>
Xen Project Events Team<u></u><u></u></span></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;background:#62ab30;float:left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div align=3D"center">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%;float:left">
<tbody>
<tr>
<td valign=3D"top" style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" widt=
h=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:11.25pt 11.25pt 11.25pt 11.25pt"></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" styl=
e=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"padding:.75pt .75pt .75pt .75pt">
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"100%" noshade style=3D"color:#a0a0a0" align=3D"cent=
er">
</div>
<p class=3D"MsoNormal"><br></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><img border=3D"0" id=3D"m_-2685003709366885060_x0000=
_i1025" src=3D"https://www.cvent.com/api/email/dispatch/v1/open/q466qgwwlqf=
n4m/qx47948p/transparent.gif"></p>
</div>
</div>
</div>
</div>

</div></div></div>

--000000000000af4fca0616fddc69--

