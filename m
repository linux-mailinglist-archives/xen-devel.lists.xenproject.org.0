Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98098CE3E9
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 11:56:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729236.1134363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAReN-00016g-T1; Fri, 24 May 2024 09:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729236.1134363; Fri, 24 May 2024 09:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAReN-00014U-QW; Fri, 24 May 2024 09:55:47 +0000
Received: by outflank-mailman (input) for mailman id 729236;
 Fri, 24 May 2024 09:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fH/U=M3=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sAReM-00014I-IG
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 09:55:46 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c960a540-19b3-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 11:55:44 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-574bf7ab218so13345231a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 02:55:44 -0700 (PDT)
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
X-Inumbo-ID: c960a540-19b3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716544543; x=1717149343; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L+g0FtDwU683l5qSvCAdrglSzPW3nPeatyB/ievqbjc=;
        b=RsTfL+sQcGh415aYJe6bHeC69eTdgMpPsZxL33IPmZ3lgJcbNbftGhPUqa+ldkLr9l
         BHo1FoxmNVBarHfP95iQ1pg0IEy8QiRg7nXYtcitb66LEARAdVr5XRVx42W6Jr3RtWxq
         nBuvPt3MOCXS2vZOmv+shuMoWVtczPh8toVho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716544543; x=1717149343;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L+g0FtDwU683l5qSvCAdrglSzPW3nPeatyB/ievqbjc=;
        b=QKBDXuLm9vkAgYVq6Jxek193/vZxD2U9lR6ARHXEsclSkZAMg5pfivauUfmybRM8mt
         AZJBOjKBBkIaLZDMaxo5D7SDdJEvJUWOfDdxscTdrVWYI79dAyj1jRncJGgjWUElsF9Y
         lwSwpG2RJWx9zwc6lxB8DD/Z8jLLTfCzyVytM8FwfvdIcyxdm3GWAfZAT1ix1Srt3Xti
         PGsroG4EBeKmDDBbkpV4LJgToRqVfa68LNWdGOwNdfkRR9SyvbBdS9lsQ0aHngYa5S+w
         ymj94TLj9DIQOc0nFb6GDu1l6bXWvq8zQB4RGwmpIzOoy/Qp5J2be/zw73adZL7EuKGV
         ZNxA==
X-Gm-Message-State: AOJu0YyzxqpbNNEHl70keww8dS6b38ikNA0FOS6iaGw5/d/NxcvBdgiD
	48C/dyjtgpk3l525HD7s8N4KFZRjdUeYnbZBtHeneDjv5MeayiMO3lL09t6FTEFkFwlpvXojAXb
	VC4QW6+9wB47MiACjrhTOMX0sO7kR2WxNr0CE4sK39Df/O8au5JQY0w==
X-Google-Smtp-Source: AGHT+IHlaRv6cTerqP7QEtIiYnEzFc4oSzkqG3Rk+qU9WCQTroJIZ/XqUtGHgXFaEESQOJpO59rKchgHBPKuMNDKkek=
X-Received: by 2002:a50:aa88:0:b0:578:341f:86b8 with SMTP id
 4fb4d7f45d1cf-57851a295f5mr982421a12.38.1716544543275; Fri, 24 May 2024
 02:55:43 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 24 May 2024 10:55:07 +0100
Message-ID: <CAO-mL=ytbLHE6QYfB9tTYepqqV_pcFbhgwXnQBbUH6=dhVVDkQ@mail.gmail.com>
Subject: [REMINDER] Xen Summit 2024 - Verification code for design sessions
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000be72de0619302be4"

--000000000000be72de0619302be4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Community,

Day 2 design sessions will be locked end of today, so get voting!
<https://design-sessions.xenproject.org/>
Day 3 design sessions are still open, and will be finalized 3 June 2024
after 5pm Lisbon Time.

*The verification code is 'LFXEN24'. *

The final schedule will be allocated and arranged by the highest-voted
sessions.

Virtual links for the community to join Xen Summit design sessions will be
shared next week.  For in-person tickets, click here
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
for
more information.


Best Regards,
Xen Project Events Team


Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000be72de0619302be4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Hello Xen Community,</div><div><br></div><div>Day 2 design se=
ssions will be locked end of today, <a href=3D"https://design-sessions.xenp=
roject.org/" style=3D"">so get voting!</a></div><div>Day 3 design sessions =
are still open, and=C2=A0will be finalized 3 June 2024 after 5pm Lisbon Tim=
e.</div><div><br></div><div><b>The verification code is &#39;LFXEN24&#39;.=
=C2=A0</b><br></div><div><b><br></b></div><div>The final schedule will be a=
llocated and arranged by the highest-voted=C2=A0<span class=3D"gmail-il">se=
ssions</span>.=C2=A0</div><div><br></div><div>Virtual links for the communi=
ty to join Xen Summit=C2=A0<span class=3D"gmail-il">design</span>=C2=A0<spa=
n class=3D"gmail-il">sessions</span>=C2=A0will be shared next week.=C2=A0 F=
or in-person tickets,=C2=A0<a href=3D"https://events.linuxfoundation.org/xe=
n-project-summit/register/" target=3D"_blank">click here</a>.=C2=A0</div><d=
iv><p class=3D"MsoNormal"><u></u></p><table border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" width=3D"100%" style=3D"width:949.612px"><tbody><tr><td s=
tyle=3D"padding:0.75pt"><div class=3D"MsoNormal" align=3D"center" style=3D"=
text-align:center"><hr size=3D"1" width=3D"100%" noshade align=3D"center" s=
tyle=3D"color:rgb(160,160,160)"></div><p class=3D"MsoNormal"></p></td></tr>=
</tbody></table></div><div><br></div></div></div></div><div class=3D"gmail_=
quote"><div><div lang=3D"EN-US" id=3D"m_-5551937392530054680m_6486684977004=
734091m_-2685003709366885060body"><div><div id=3D"m_-5551937392530054680m_6=
486684977004734091m_-2685003709366885060mail-editor-reference-message-conta=
iner"><div><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D=
"100%" style=3D"width:1051.99px;float:left"><tbody><tr><td style=3D"backgro=
und:rgb(239,240,242);padding:0in"><div align=3D"center"><table border=3D"0"=
 cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99p=
x;float:left"><tbody><tr><td style=3D"padding:0in"><div align=3D"center"><t=
able border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=
=3D"width:1051.99px;background:white"><tbody><tr><td style=3D"padding:0in">=
<div align=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"=
0" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td valign=3D"top" s=
tyle=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
" align=3D"left" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td st=
yle=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td style=3D"padding:0=
in"><div align=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td style=3D"pad=
ding:0in"><p class=3D"MsoNormal" align=3D"center" style=3D"text-align:cente=
r"><img border=3D"0" width=3D"699" id=3D"m_-5551937392530054680m_6486684977=
004734091m_-2685003709366885060_x0000_i1028" src=3D"https://custom.cvent.co=
m/64779B2AC74D4D2BBFF4459DE93A5253/pix/d770244914e047019777029a32e20c53.png=
?d=3D699" class=3D"gmail-CToWUd gmail-a6T" tabindex=3D"0" style=3D"cursor: =
pointer; outline: 0px; width: 7.2812in;"></p></td></tr></tbody></table></di=
v><p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"></p><=
div align=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0=
" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td style=3D"padding:=
0in"></td></tr></tbody></table></div><p class=3D"MsoNormal" align=3D"center=
" style=3D"text-align:center"><span style=3D"font-size:10pt;font-family:&qu=
ot;Times New Roman&quot;,serif"><u></u><u></u></span></p></td></tr></tbody>=
</table></td></tr></tbody></table></td></tr></tbody></table></div></td></tr=
></tbody></table></div></td></tr><tr><td style=3D"padding:0in;word-break:br=
eak-word"><div align=3D"center"><table border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" width=3D"100%" style=3D"width:1051.99px;background:white;float=
:left"><tbody><tr><td style=3D"padding:0in;float:left"><div align=3D"center=
"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" st=
yle=3D"width:1051.99px;float:left"><tbody><tr><td valign=3D"top" style=3D"p=
adding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=
=3D"left" width=3D"100%" style=3D"width:1051.99px;word-break:break-word"><t=
body><tr><td style=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td sty=
le=3D"padding:11.25pt 11.25pt 0in"><table border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0" width=3D"100%" style=3D"width:1021.99px"><tbody><tr><td sty=
le=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" =
width=3D"100%" style=3D"width:1021.99px"><tbody><tr><td style=3D"padding:3.=
75pt 0in"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black">We look forw=
ard to holding the=C2=A0<span class=3D"gmail-il">Design</span>=C2=A0<span c=
lass=3D"gmail-il">Sessions</span>=C2=A0at the upcoming Xen Project Summit. =
The=C2=A0<span class=3D"gmail-il">design</span>=C2=A0<span class=3D"gmail-i=
l">sessions</span>=C2=A0will be on Wednesday, 5 June, and Thursday, 6 June =
2024.<br><br>We encourage everyone to submit a=C2=A0<span class=3D"gmail-il=
">Design</span>=C2=A0<span class=3D"gmail-il">Session</span>, the=C2=A0</sp=
an><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(3=
3,33,33)">verification code</span><span style=3D"font-size:10.5pt;font-fami=
ly:Arial,sans-serif;color:black">=C2=A0is: =E2=80=9C</span><b><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,33,33)">LFXE=
N24</span></b><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;=
color:black">=E2=80=9D.<u></u><u></u></span></p></td></tr></tbody></table><=
/td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></tabl=
e></td></tr><tr><td valign=3D"top" style=3D"padding:0in"><table border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"100%" style=
=3D"width:1051.99px;float:left"><tbody><tr><td style=3D"padding:0in"><table=
 border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"w=
idth:1051.99px;border-radius:15px"><tbody><tr><td style=3D"padding:11.25pt"=
><div align=3D"center"><table border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"background:rgb(114,190,68);border:4.5pt solid rgb(114,190,68)"=
><tbody><tr><td style=3D"border:none;padding:3.75pt 15pt"><p class=3D"MsoNo=
rmal" align=3D"center" style=3D"text-align:center"><span style=3D"color:bla=
ck"><a href=3D"https://design-sessions.xenproject.org/" target=3D"_blank"><=
b><span style=3D"font-size:13pt;font-family:Arial,sans-serif;color:white;te=
xt-decoration-line:none">SUBMIT A=C2=A0<span class=3D"gmail-il">DESIGN</spa=
n>=C2=A0<span class=3D"gmail-il">SESSION</span></span></b></a></span></p></=
td></tr></tbody></table></div><p class=3D"MsoNormal" align=3D"center" style=
=3D"text-align:center"><span style=3D"font-size:1pt">=C2=A0</span></p></td>=
</tr></tbody></table></td></tr></tbody></table></td></tr><tr><td valign=3D"=
top" style=3D"padding:0in;word-break:break-word"><table border=3D"0" cellsp=
acing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"100%" style=3D"width:=
1051.99px;float:left"><tbody><tr><td style=3D"padding:0in;float:left"><tabl=
e border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"=
width:872.825px;word-break:break-word"><tbody><tr><td style=3D"padding:0in =
11.25pt 11.25pt"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" wi=
dth=3D"100%" style=3D"width:842.825px"><tbody><tr><td style=3D"padding:0in"=
><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" sty=
le=3D"width:842.825px"><tbody><tr><td style=3D"padding:3.75pt 0in"><p class=
=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:rgb(33,37,41)">The process involves the=
 following steps:</span><span style=3D"font-size:10.5pt;font-family:Arial,s=
ans-serif;color:black"><u></u><u></u></span></p></td></tr><tr><td style=3D"=
padding:3.75pt 0in;word-break:break-word"><ul type=3D"disc"><li class=3D"Ms=
oNormal" style=3D"margin-left:15px;color:black;line-height:13.5pt"><span st=
yle=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,37,41)">A=
nyone interested can=C2=A0</span><a href=3D"https://design-sessions.xenproj=
ect.org/discussion/new" target=3D"_blank"><span style=3D"font-size:10.5pt;f=
ont-family:Arial,sans-serif;color:rgb(13,110,253)">propose</span></a><span =
style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,37,41)"=
>=C2=A0a topic.</span><span style=3D"font-size:10.5pt;font-family:Arial,san=
s-serif"><u></u><u></u></span></li><li class=3D"MsoNormal" style=3D"margin-=
left:15px;color:black;line-height:13.5pt"><span style=3D"font-size:10.5pt;f=
ont-family:Arial,sans-serif;color:rgb(33,37,41)">All participants review th=
e=C2=A0</span><a href=3D"https://design-sessions.xenproject.org/list/discus=
sion" target=3D"_blank"><span style=3D"font-size:10.5pt;font-family:Arial,s=
ans-serif;color:rgb(13,110,253)">list of=C2=A0<span class=3D"gmail-il">sess=
ions</span></span></a><span style=3D"font-size:10.5pt;font-family:Arial,san=
s-serif;color:rgb(33,37,41)">, indicating their interest in attending each =
one.</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u=
></u><u></u></span></li><li class=3D"MsoNormal" style=3D"margin-left:15px;c=
olor:black;line-height:13.5pt"><span style=3D"font-size:10.5pt;font-family:=
Arial,sans-serif;color:rgb(33,37,41)">The=C2=A0<span class=3D"gmail-il">ses=
sion</span>=C2=A0scheduler optimizes the=C2=A0</span><a href=3D"https://des=
ign-sessions.xenproject.org/schedule" target=3D"_blank"><span style=3D"font=
-size:10.5pt;font-family:Arial,sans-serif;color:rgb(13,110,253)">schedule</=
span></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color=
:rgb(33,37,41)">=C2=A0to accommodate as many preferences as possible.</span=
><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><u></u><u></=
u></span></li></ul></td></tr><tr><td style=3D"padding:3.75pt 0in;word-break=
:break-word"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span styl=
e=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,37,41)">Par=
ticipants can also propose long-form talks by adding [TALK] to the=C2=A0<sp=
an class=3D"gmail-il">session</span>=C2=A0title.</span><span style=3D"font-=
size:10.5pt;font-family:Arial,sans-serif;color:black"><u></u><u></u></span>=
</p></td></tr><tr><td style=3D"padding:3.75pt 0in;word-break:break-word"><p=
 class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-size:=
10.5pt;font-family:Arial,sans-serif;color:black">For suggested topics, samp=
le=C2=A0<span class=3D"gmail-il">Design</span>=C2=A0<span class=3D"gmail-il=
">Session</span>=C2=A0submissions, and more tips check out the=C2=A0</span>=
<a href=3D"https://events.linuxfoundation.org/xen-project-summit/program/de=
sign-sessions/" target=3D"_blank"><span style=3D"font-size:10.5pt;font-fami=
ly:Arial,sans-serif">Xen=C2=A0<span class=3D"gmail-il">Design</span>=C2=A0<=
span class=3D"gmail-il">Session</span>=C2=A0page</span></a><span style=3D"f=
ont-size:10.5pt;font-family:Arial,sans-serif;color:black">=C2=A0for more in=
formation.<u></u><u></u></span></p></td></tr><tr><td style=3D"padding:3.75p=
t 0in;word-break:break-word"><p class=3D"MsoNormal" style=3D"line-height:13=
.5pt"><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:bl=
ack"><br>Best Regards,<br>Xen Project Events Team<u></u><u></u></span></p><=
/td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></tabl=
e></td></tr></tbody></table></td></tr></tbody></table></div></td></tr></tbo=
dy></table></div></td></tr><tr><td style=3D"padding:0in"><div align=3D"cent=
er"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"width:1051.99px;background:rgb(98,171,48);float:left"><tbody><tr><=
td style=3D"padding:0in"><div align=3D"center"><table border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px;float:l=
eft"><tbody><tr><td valign=3D"top" style=3D"padding:0in"><table border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"100%" style=
=3D"width:1051.99px"><tbody><tr><td style=3D"padding:0in"><table border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.9=
9px"><tbody><tr><td style=3D"padding:11.25pt"></td></tr></tbody></table></t=
d></tr></tbody></table></td></tr></tbody></table></div></td></tr></tbody></=
table></div></td></tr></tbody></table></div></td></tr></tbody></table><p cl=
ass=3D"MsoNormal"><u></u>=C2=A0<u></u></p><table border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px"><tbody><t=
r><td style=3D"padding:0.75pt"></td></tr></tbody></table></div></div></div>=
</div></div></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kell=
y Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Commu=
nity Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<b=
r></div></div></div></div></div></div>

--000000000000be72de0619302be4--

