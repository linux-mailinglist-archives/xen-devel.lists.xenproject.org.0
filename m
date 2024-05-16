Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A478C7479
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723035.1127578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Y7l-0005bA-6j; Thu, 16 May 2024 10:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723035.1127578; Thu, 16 May 2024 10:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Y7k-0005TO-V9; Thu, 16 May 2024 10:14:08 +0000
Received: by outflank-mailman (input) for mailman id 723035;
 Thu, 16 May 2024 10:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yRp+=MT=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s7Y7j-00052e-QL
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:14:07 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06f97efc-136d-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:14:06 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso4312011a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:14:06 -0700 (PDT)
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
X-Inumbo-ID: 06f97efc-136d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715854445; x=1716459245; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GKCXxpkICfYIaEzaewiT1/VwlZgIz/HgNpx+JI+R2Dw=;
        b=Cy1CMp1EFNyCihcD2IzC+X5CE93FlI4+k/a4YQzHA6seYLN89477dxErd48T8CGEjc
         OmnxaKegSeUkNS4xTzqg81GiVzHJz/dCm/nbG8CvL2tWUJj+GbUOrFw/JW+5sKijRh7z
         krMIthF7E0SH36+8F+Yf6VTOMAJTbfKD85B2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715854445; x=1716459245;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKCXxpkICfYIaEzaewiT1/VwlZgIz/HgNpx+JI+R2Dw=;
        b=lVQnrqSAY+ykuA9w9ZkMjqGR0LSh8pKLk+a7toRubQ0IRGiEhJptBMt+JjnkNcE66Z
         SVrAxdwEkh1QErkKw2OjASHT7j/kN1EplCjCeNRYZO7oVz9zRFvELthrJ96x+LpUqX0X
         5eksBQ02MJu1wY5vQgMPxAT1iDEihxCc+IsTixbheWLmyIZ0jQUi5/CABLI4DpoyaetM
         dKIFCya9JbZTNl9+4JfnKkJ9Mjb5tdIiv0ZBvuYUuZNIBTgwnzIXmlH1dWZ3djVrGyim
         GvmNwNEyl3VsCSxF3llTjR055h7P5GKfWeLQ4rHvKeJ34Qs3Gfks/2kPWr1wpR7OtFor
         PkPA==
X-Gm-Message-State: AOJu0YxQuwqvKbcSG9BPSGr5Su/zWrf7gmEqIU6q2rIrh3EZk66KK56j
	eM/IVa1wnlpLhUKDa4rdJnuYdPivTks45qWXuJf45eRrTJrgdiJji+3HkSmjhXMmLsKF3T2MKYC
	DH0EQelFmWA0J5+czKJjsK5FzErpXSGt+950moa2jUH5sWPzVcEt4qA==
X-Google-Smtp-Source: AGHT+IHbJX3233x6N0PE+zLEyio0aEicm/SjprHbvZjU4WLUo+mgh4vXxvCguS/gJNFXLbdE5KwPqS89fxek76MTXVE=
X-Received: by 2002:a50:d55e:0:b0:574:f09a:e7aa with SMTP id
 4fb4d7f45d1cf-574f09ae8dbmr4047615a12.21.1715854445248; Thu, 16 May 2024
 03:14:05 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Thu, 16 May 2024 11:13:29 +0100
Message-ID: <CAO-mL=y4b1N8hDenjNo9JWw9Pu+xR14=5RHrwb0fzystKTr1Ww@mail.gmail.com>
Subject: [REMINDER] - Submit your Design Sessions for Xen Summit!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b21f1706188f7eaf"

--000000000000b21f1706188f7eaf
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

We aim to have design sessions with a virtual element (using Jitsi). This
is free for the community to join in and listen, and will be hosted by an
attendee in the session.

If you're going to be an *in-person attendee*, you can propose a session an=
d
vote on sessions you would like to see discussed.
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
for
more information.


Best Regards,
Xen Project Events Team


------------------------------


Many thanks,
Kelly Choi

Community Manager
Xen Project

--000000000000b21f1706188f7eaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Hello Xen Community,</div><div><b><br></b></div><div><b>Our=
=C2=A0<span class=3D"gmail-il">design</span>=C2=A0<span class=3D"gmail-il">=
sessions</span>=C2=A0are now open for Xen Summit!=C2=A0</b></div><div><br><=
/div><div>If you&#39;ve attended Xen Summit before, you might be familiar w=
ith the process.=C2=A0</div><div><br></div><div>For anyone who hasn&#39;t d=
one so before, please follow the instructions below, using the=C2=A0<a href=
=3D"https://design-sessions.xenproject.org/" target=3D"_blank">link to crea=
te an account</a>.=C2=A0</div><div>Once you&#39;ve created your account, yo=
u&#39;ll be asked to verify using the code below. That&#39;s it, you&#39;re=
 in!</div><div><br></div><div>We aim to have=C2=A0<span class=3D"gmail-il">=
design</span>=C2=A0<span class=3D"gmail-il">sessions</span>=C2=A0with a vir=
tual element (using Jitsi). This is free for the community to join in and l=
isten, and will be hosted by an attendee in the=C2=A0<span class=3D"gmail-i=
l">session</span>.=C2=A0<br></div><div><br></div><div>If you&#39;re going t=
o be an=C2=A0<b><i>in-person attendee</i></b>, you can propose a=C2=A0<span=
 class=3D"gmail-il">session</span>=C2=A0and vote on=C2=A0<span class=3D"gma=
il-il">sessions</span>=C2=A0you would like to see discussed.=C2=A0</div><di=
v>If you&#39;re going to be a=C2=A0<b><i>virtual attendee</i></b>, you can =
vote on=C2=A0<span class=3D"gmail-il">sessions</span>=C2=A0you would like t=
o see discussed. You can still propose a=C2=A0<span class=3D"gmail-il">sess=
ion</span>, but please note there will be no professional audio or visual e=
quipment in person for these=C2=A0<span class=3D"gmail-il">sessions</span>.=
=C2=A0</div><div><br></div><div>The final schedule will be allocated and ar=
ranged by the highest-voted=C2=A0<span class=3D"gmail-il">sessions</span>.=
=C2=A0</div><div><br></div><div>Virtual links for the community to join Xen=
 Summit=C2=A0<span class=3D"gmail-il">design</span>=C2=A0<span class=3D"gma=
il-il">sessions</span>=C2=A0will be shared closer to the event.=C2=A0=C2=A0=
<br></div><div><br></div><div>If you=C2=A0have any questions,=C2=A0please l=
et me know.</div><div><p class=3D"MsoNormal">For in-person tickets,=C2=A0<a=
 href=3D"https://events.linuxfoundation.org/xen-project-summit/register/" t=
arget=3D"_blank">click here</a>.=C2=A0</p><p class=3D"MsoNormal"><u></u></p=
><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" sty=
le=3D"width:949.612px"><tbody><tr><td style=3D"padding:0.75pt"><div class=
=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><hr size=3D"1" =
width=3D"100%" noshade align=3D"center" style=3D"color:rgb(160,160,160)"></=
div><p class=3D"MsoNormal"></p></td></tr></tbody></table></div><div><br></d=
iv></div></div></div><div class=3D"gmail_quote"><div><div lang=3D"EN-US" id=
=3D"m_6486684977004734091m_-2685003709366885060body" style=3D"overflow-wrap=
: break-word;"><div><div id=3D"m_6486684977004734091m_-2685003709366885060m=
ail-editor-reference-message-container"><div><table border=3D"0" cellspacin=
g=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px;float:lef=
t"><tbody><tr><td style=3D"background:rgb(239,240,242);padding:0in"><div al=
ign=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" widt=
h=3D"100%" style=3D"width:1051.99px;float:left"><tbody><tr><td style=3D"pad=
ding:0in"><div align=3D"center"><table border=3D"0" cellspacing=3D"0" cellp=
adding=3D"0" width=3D"100%" style=3D"width:1051.99px;background:white"><tbo=
dy><tr><td style=3D"padding:0in"><div align=3D"center"><table border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px=
"><tbody><tr><td valign=3D"top" style=3D"padding:0in"><table border=3D"0" c=
ellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"100%" style=3D"w=
idth:1051.99px"><tbody><tr><td style=3D"padding:0in"><table border=3D"0" ce=
llspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px">=
<tbody><tr><td style=3D"padding:0in"><div align=3D"center"><table border=3D=
"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.=
99px"><tbody><tr><td style=3D"padding:0in"><p class=3D"MsoNormal" align=3D"=
center" style=3D"text-align:center"><img border=3D"0" width=3D"699" id=3D"m=
_6486684977004734091m_-2685003709366885060_x0000_i1028" src=3D"https://cust=
om.cvent.com/64779B2AC74D4D2BBFF4459DE93A5253/pix/d770244914e047019777029a3=
2e20c53.png?d=3D699" class=3D"gmail-CToWUd gmail-a6T" tabindex=3D"0" style=
=3D"cursor: pointer; outline: 0px; width: 7.2812in;"></p></td></tr></tbody>=
</table></div><p class=3D"MsoNormal" align=3D"center" style=3D"text-align:c=
enter"></p><div align=3D"center"><table border=3D"0" cellspacing=3D"0" cell=
padding=3D"0" width=3D"100%" style=3D"width:1051.99px"><tbody><tr><td style=
=3D"padding:0in"></td></tr></tbody></table></div><p class=3D"MsoNormal" ali=
gn=3D"center" style=3D"text-align:center"><span style=3D"font-size:10pt;fon=
t-family:&quot;Times New Roman&quot;,serif"><u></u><u></u></span></p></td><=
/tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></d=
iv></td></tr></tbody></table></div></td></tr><tr><td style=3D"padding:0in;w=
ord-break:break-word"><div align=3D"center"><table border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px;background=
:white;float:left"><tbody><tr><td style=3D"padding:0in;float:left"><div ali=
gn=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=
=3D"100%" style=3D"width:1051.99px;float:left"><tbody><tr><td valign=3D"top=
" style=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:1051.99px;word-break:br=
eak-word"><tbody><tr><td style=3D"padding:0in"><table border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.99px"><tbody=
><tr><td style=3D"padding:11.25pt 11.25pt 0in"><table border=3D"0" cellspac=
ing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1021.99px"><tbody=
><tr><td style=3D"padding:0in"><table border=3D"0" cellspacing=3D"0" cellpa=
dding=3D"0" width=3D"100%" style=3D"width:1021.99px"><tbody><tr><td style=
=3D"padding:3.75pt 0in"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"=
><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black">=
We look forward to holding the=C2=A0<span class=3D"gmail-il">Design</span>=
=C2=A0<span class=3D"gmail-il">Sessions</span>=C2=A0at the upcoming Xen Pro=
ject Summit. The=C2=A0<span class=3D"gmail-il">design</span>=C2=A0<span cla=
ss=3D"gmail-il">sessions</span>=C2=A0will be on Wednesday, 5 June, and Thur=
sday, 6 June 2024.<br><br>We encourage everyone to submit a=C2=A0<span clas=
s=3D"gmail-il">Design</span>=C2=A0<span class=3D"gmail-il">Session</span>, =
the=C2=A0</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-seri=
f;color:rgb(33,33,33)">verification code</span><span style=3D"font-size:10.=
5pt;font-family:Arial,sans-serif;color:black">=C2=A0is: =E2=80=9C</span><b>=
<span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,3=
3,33)">LFXEN24</span></b><span style=3D"font-size:10.5pt;font-family:Arial,=
sans-serif;color:black">=E2=80=9D.<u></u><u></u></span></p></td></tr></tbod=
y></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></t=
body></table></td></tr><tr><td valign=3D"top" style=3D"padding:0in"><table =
border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"10=
0%" style=3D"width:1051.99px;float:left"><tbody><tr><td style=3D"padding:0i=
n"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" s=
tyle=3D"width:1051.99px;border-radius:15px"><tbody><tr><td style=3D"padding=
:11.25pt"><div align=3D"center"><table border=3D"1" cellspacing=3D"0" cellp=
adding=3D"0" style=3D"background:rgb(114,190,68);border:4.5pt solid rgb(114=
,190,68)"><tbody><tr><td style=3D"border:none;padding:3.75pt 15pt"><p class=
=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span style=3D"=
color:black"><a href=3D"https://design-sessions.xenproject.org/" target=3D"=
_blank"><b><span style=3D"font-size:13pt;font-family:Arial,sans-serif;color=
:white;text-decoration-line:none">SUBMIT A=C2=A0<span class=3D"gmail-il">DE=
SIGN</span>=C2=A0<span class=3D"gmail-il">SESSION</span></span></b></a></sp=
an></p></td></tr></tbody></table></div><p class=3D"MsoNormal" align=3D"cent=
er" style=3D"text-align:center"><span style=3D"font-size:1pt">=C2=A0</span>=
</p></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td v=
align=3D"top" style=3D"padding:0in;word-break:break-word"><table border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=3D"100%" style=
=3D"width:1051.99px;float:left"><tbody><tr><td style=3D"padding:0in;float:l=
eft"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%"=
 style=3D"width:872.825px;word-break:break-word"><tbody><tr><td style=3D"pa=
dding:0in 11.25pt 11.25pt"><table border=3D"0" cellspacing=3D"0" cellpaddin=
g=3D"0" width=3D"100%" style=3D"width:842.825px"><tbody><tr><td style=3D"pa=
dding:0in"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D=
"100%" style=3D"width:842.825px"><tbody><tr><td style=3D"padding:3.75pt 0in=
"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D"font-s=
ize:10.5pt;font-family:Arial,sans-serif;color:rgb(33,37,41)">The process in=
volves the following steps:</span><span style=3D"font-size:10.5pt;font-fami=
ly:Arial,sans-serif;color:black"><u></u><u></u></span></p></td></tr><tr><td=
 style=3D"padding:3.75pt 0in;word-break:break-word"><ul type=3D"disc"><li c=
lass=3D"MsoNormal" style=3D"margin-left:15px;color:black;line-height:13.5pt=
"><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33=
,37,41)">Anyone interested can=C2=A0</span><a href=3D"https://design-sessio=
ns.xenproject.org/discussion/new" target=3D"_blank"><span style=3D"font-siz=
e:10.5pt;font-family:Arial,sans-serif;color:rgb(13,110,253)">propose</span>=
</a><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(=
33,37,41)">=C2=A0a topic.</span><span style=3D"font-size:10.5pt;font-family=
:Arial,sans-serif"><u></u><u></u></span></li><li class=3D"MsoNormal" style=
=3D"margin-left:15px;color:black;line-height:13.5pt"><span style=3D"font-si=
ze:10.5pt;font-family:Arial,sans-serif;color:rgb(33,37,41)">All participant=
s review the=C2=A0</span><a href=3D"https://design-sessions.xenproject.org/=
list/discussion" target=3D"_blank"><span style=3D"font-size:10.5pt;font-fam=
ily:Arial,sans-serif;color:rgb(13,110,253)">list of=C2=A0<span class=3D"gma=
il-il">sessions</span></span></a><span style=3D"font-size:10.5pt;font-famil=
y:Arial,sans-serif;color:rgb(33,37,41)">, indicating their interest in atte=
nding each one.</span><span style=3D"font-size:10.5pt;font-family:Arial,san=
s-serif"><u></u><u></u></span></li><li class=3D"MsoNormal" style=3D"margin-=
left:15px;color:black;line-height:13.5pt"><span style=3D"font-size:10.5pt;f=
ont-family:Arial,sans-serif;color:rgb(33,37,41)">The=C2=A0<span class=3D"gm=
ail-il">session</span>=C2=A0scheduler optimizes the=C2=A0</span><a href=3D"=
https://design-sessions.xenproject.org/schedule" target=3D"_blank"><span st=
yle=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(13,110,253)"=
>schedule</span></a><span style=3D"font-size:10.5pt;font-family:Arial,sans-=
serif;color:rgb(33,37,41)">=C2=A0to accommodate as many preferences as poss=
ible.</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif"><=
u></u><u></u></span></li></ul></td></tr><tr><td style=3D"padding:3.75pt 0in=
;word-break:break-word"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"=
><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(33,=
37,41)">Participants can also propose long-form talks by adding [TALK] to t=
he=C2=A0<span class=3D"gmail-il">session</span>=C2=A0title.</span><span sty=
le=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black"><u></u><u>=
</u></span></p></td></tr><tr><td style=3D"padding:3.75pt 0in;word-break:bre=
ak-word"><p class=3D"MsoNormal" style=3D"line-height:13.5pt"><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black">For suggested t=
opics, sample=C2=A0<span class=3D"gmail-il">Design</span>=C2=A0<span class=
=3D"gmail-il">Session</span>=C2=A0submissions, and more tips check out the=
=C2=A0</span><a href=3D"https://events.linuxfoundation.org/xen-project-summ=
it/program/design-sessions/" target=3D"_blank"><span style=3D"font-size:10.=
5pt;font-family:Arial,sans-serif">Xen=C2=A0<span class=3D"gmail-il">Design<=
/span>=C2=A0<span class=3D"gmail-il">Session</span>=C2=A0page</span></a><sp=
an style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black">=C2=
=A0for more information.<u></u><u></u></span></p></td></tr><tr><td style=3D=
"padding:3.75pt 0in;word-break:break-word"><p class=3D"MsoNormal" style=3D"=
line-height:13.5pt"><span style=3D"font-size:10.5pt;font-family:Arial,sans-=
serif;color:black"><br>Best Regards,<br>Xen Project Events Team<u></u><u></=
u></span></p></td></tr></tbody></table></td></tr></tbody></table></td></tr>=
</tbody></table></td></tr></tbody></table></td></tr></tbody></table></div><=
/td></tr></tbody></table></div></td></tr><tr><td style=3D"padding:0in"><div=
 align=3D"center"><table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" w=
idth=3D"100%" style=3D"width:1051.99px;background:rgb(98,171,48);float:left=
"><tbody><tr><td style=3D"padding:0in"><div align=3D"center"><table border=
=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:10=
51.99px;float:left"><tbody><tr><td valign=3D"top" style=3D"padding:0in"><ta=
ble border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left" width=
=3D"100%" style=3D"width:1051.99px"><tbody><tr><td style=3D"padding:0in"><t=
able border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=
=3D"width:1051.99px"><tbody><tr><td style=3D"padding:11.25pt"></td></tr></t=
body></table></td></tr></tbody></table></td></tr></tbody></table></div></td=
></tr></tbody></table></div></td></tr></tbody></table></div></td></tr></tbo=
dy></table><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><table border=3D"=
0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" style=3D"width:1051.9=
9px"><tbody><tr><td style=3D"padding:0.75pt"><div class=3D"MsoNormal" align=
=3D"center" style=3D"text-align:center"><hr size=3D"1" width=3D"100%" nosha=
de align=3D"center" style=3D"color:rgb(160,160,160)"></div><p class=3D"MsoN=
ormal"><br></p></td></tr></tbody></table></div></div></div></div></div></di=
v><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div=
><br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</di=
v><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></=
div></div></div></div>

--000000000000b21f1706188f7eaf--

