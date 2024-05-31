Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0B8D5F61
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 12:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733555.1139881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCzJD-0006jR-60; Fri, 31 May 2024 10:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733555.1139881; Fri, 31 May 2024 10:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCzJD-0006go-2p; Fri, 31 May 2024 10:16:27 +0000
Received: by outflank-mailman (input) for mailman id 733555;
 Fri, 31 May 2024 10:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6UXI=NC=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sCzJA-0006gX-TZ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 10:16:25 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5044e86-1f36-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 12:16:23 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a621cb07d8fso198895366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 03:16:23 -0700 (PDT)
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
X-Inumbo-ID: d5044e86-1f36-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717150583; x=1717755383; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r1zQbci+pBPtGfS2ZlOjlBggHLolg5OzHHjzXdDK/fk=;
        b=aA4Nu6wKOWxgGgk5DMyWUKyuYWX1OVXFbbgIW/tJgDSpKYOpNaIXPjtnn8Fccni0Kd
         NlXFAJiKGnxDADeX/hcn0I5COCf0f1bNhA/RWQZ8taLJyePPt+rnfEiQgQufyGaPEgL6
         /+qfGxIXftjnP6y4Sah/okiAxyDJw5Ckz7+EU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717150583; x=1717755383;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1zQbci+pBPtGfS2ZlOjlBggHLolg5OzHHjzXdDK/fk=;
        b=HU6nc433Ei8BSabiMbmSiUP1KWQvQ6PXcJGySwBUSTompCUxCrdez8inCEJbTRnsVK
         468GNSMFXQgSJC8rBV7YMDctOs+OkSvYFctuXHGrtH05T8uxFzjdOBxPgReL6Eti2+fe
         WzbrutTQcwTWuysk3EgGC9DnUCwBVC5PeDXuGSkvY1l3ooxjqzE0k4Lkc2nzgeru+NAi
         U0+4UOqzWSDFnADzgGbMEWDT0U3FCR6+SsinppYP9npubzn2dIKj3LucyU2tjaITB6+S
         L3ZyXG55hLdY+S2zRrQ/Esrs8aPmojjP0660y0PMk/IduWl4Wytc6bG25z2CegR6I1+C
         UYdA==
X-Gm-Message-State: AOJu0Yy3pvFeGlCzxT7DVwCab0T8burWymB4X1asGOvLst9j17E90u2m
	1BtwHbfESxyvLTsFuMyYAY4Fy/0H3V6UoSCtBIRZijDsFF385gSSBzGN+soIa7sNSUw51XpP6FE
	isaHDe8VMgl5SpnNqfJw4jOWUoADXpaAQZhS2tCPr8d4zSDA+oRY=
X-Google-Smtp-Source: AGHT+IFhbwaTJkbhiQyrp23HfVhvmGwAxDUup0p5pnzcDhRiG00LVxqhMHWsuWs4/cuTuxLxv3ygF4NjqNSY3EYmvWk=
X-Received: by 2002:a17:906:63d1:b0:a59:aa69:9791 with SMTP id
 a640c23a62f3a-a68208fe2ecmr93247566b.34.1717150582498; Fri, 31 May 2024
 03:16:22 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 31 May 2024 11:15:46 +0100
Message-ID: <CAO-mL=y+q2iUw-OHkHO96FSg1jfm8aQV-dFsMg4R0VS4+maOXg@mail.gmail.com>
Subject: [ANNOUNCE] Join us for free virtually at Xen Summit 2024 + FAQs!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000007f0a4f0619bd4676"

--0000000000007f0a4f0619bd4676
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen Community,

Join us virtually at Xen Summit (4-6th June), for free using Jitsi!

We want to encourage as many of you to participate in the Xen Summit as
possible. Just because you are not physically attending, doesn't mean you
can't get involved.
*(Please note, there will be no professional AV or audio equipment, and it
is a community effort to enable others to get involved.) *

On the day, please find the *schedule of talks listed here.*
<https://events.linuxfoundation.org/xen-project-summit/program/schedule/>
I've also included some FAQs at the bottom of this email.

*Instructions:*

   - Our team will help host the main presentation talk sessions
   using Jitsi
   - Either myself or one attendee volunteer will help host each design
   session using Jitsi
   - Ensure you are using the Lisbon timezone
   - All sessions on Tuesday 4th June will be streamed using:
      - *SESSION PRESENTATIONS LINK <https://meet.jit.si/XenSummit24Main>*.
   - All sessions on Wednesday 5th June and Thursday 6th June will use the
   following links:
   - *DESIGN SESSION A <https://meet.jit.si/XenDesignSessionsA> *(Liberdade
      Room)
      - *DESIGN SESSION B <https://meet.jit.si/XenDesignSessionsB> *(August=
a
      Room)
      - Please look out on the schedule for the time and which session room
      it takes place in


   - Thursday design sessions will be finalized on the schedule by the end
   of day on Wednesday
   - The same links will be used throughout talks and sessions
   - (Optional) Join our Xen Summit matrix channel for updates on the day:
   https://matrix.to/#/#xen-project-summit:matrix.org

*Some ground rules to follow:*

   - Enter your full name on Jitsi so everyone knows who you are
   - Please mute yourself upon joining
   - Turning on cameras is optional, but we encourage doing this for design
   sessions
   - Do *not* shout out your questions during session presentations,
   instead ask these on the chat function and we will do our best to ask on
   behalf of you
   - During design sessions, we encourage you to unmute and participate
   freely
   - If multiple people wish to speak, please use the 'raise hand' function
   on Jitsi or chat
   - Should there be a need, moderators will have permission to remove
   anyone who is disruptive in sessions on Jitsi
   - If you face issues on the day, please let us know via Matrix - we will
   do our best to help, but please note this is a community effort

*Jitsi links:*

Session presentation link:

https://meet.jit.si/XenSummit24Main

Design Session A (Liberdade Room) link:
https://meet.jit.si/XenDesignSessionsA

Design Session B (Augusta Room) link: https://meet.jit.si/XenDesignSessions=
B

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=3DXenSummit24Main

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenSummit24Main#config.startSilent=3Dtrue

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsA

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenDesignSessionsA#config.startSilent=3Dtrue

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenDesignSessionsB#config.startSilent=3Dtrue

Schedule Example:

Tuesday 4th & Wednesday 5th June 2024

(Lisbon timezone)

Schedule Example: Wednesday 5th & Thursday 6th June 2024

(Lisbon timezone)

Schedule Example:  Wednesday 5th & Thursday 6th June 2024

(Lisbon timezone)

09:00
Welcome & Opening Remarks - Kelly Choi, Community Manager, Cloud Software
Group, XenServer

09:10

Xen Project 2024 Weather Report - Kelly Choi, XenServer, Cloud Software
Group.

LIBERDADE I

09:10

Challenges and Status of Enabling TrenchBoot in Xen Hypervisor - Micha=C5=
=82
=C5=BBygowski & Piotr Kr=C3=B3l, 3mdeb

13:45

The future of Xen Project physical events
<https://design-sessions.xenproject.org/uid/discussion/disc_OlJce1uK3uI0OjS=
2cL55/view>

LIBERDADE I

14:35

IOMMU paravirtualization and Xen IOMMU subsystem rework
<https://design-sessions.xenproject.org/uid/discussion/disc_PEgBNIXMyEkdJoy=
sE27O/view>

LIBERDADE I
09:10

Using Xenalyze for Performance Analysis - George Dunlap, Xen ServerAUGUSTA =
I





13:45

Downstream working group
<https://design-sessions.xenproject.org/uid/discussion/disc_z78Lt2EIZt2qxaS=
3FSlQ/view>

AUGUSTA I

14:35

Xen Safety Requirements upstreaming
<https://design-sessions.xenproject.org/uid/discussion/disc_01JE9EOi9zxxAU8=
lfB6Z/view>

AUGUSTA I



*How to filter the schedule:*


*FAQs:*

   - *My company would like to sponsor the next Xen Summit, how do I get
   involved?*
      - *Please email *@communitymanager
<community.manager@xenproject.org>* with
      your interest *
   - *Are sessions recorded?*
      - *Yes, all talks are recorded and will be available on YouTube after
      the event. Design sessions on Day 3 are not recorded. *
   - *Can I write about my experience at Xen Summit?*
      - *Yes! We encourage the community to spread the word through social
      media. Please tag us on X or LinkedIn so that we can reshare. *
   -
*Can we see the presenter's slides? *
      - *Some presenters may have uploaded their slides in advance. If
      available, you can view these by clicking on each session in the
screenshot
      above. *

We look forward to seeing you there, both virtually and physically!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--0000000000007f0a4f0619bd4676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community,=C2=A0<div><br></div><div>Join us virt=
ually at Xen Summit (4-6th June), for free using=C2=A0Jitsi!=C2=A0</div><di=
v><br></div><div>We want to encourage as many of you to participate in the =
Xen Summit as possible. Just because you are not physically attending, does=
n&#39;t mean you can&#39;t get involved.=C2=A0</div><div><i>(Please note, t=
here will be no professional AV or audio equipment, and it is a community e=
ffort to enable others to get involved.)=C2=A0</i></div><div><br></div><div=
>On the day, please find the=C2=A0<a href=3D"https://events.linuxfoundation=
.org/xen-project-summit/program/schedule/" target=3D"_blank"><b>schedule=C2=
=A0of talks listed here.</b></a></div><div>I&#39;ve also included some FAQs=
 at the bottom of this email.</div><div><br></div><div><b><u>Instructions:<=
/u></b></div><div><ul><li style=3D"margin-left:15px">Our team will help hos=
t the main presentation talk sessions using=C2=A0Jitsi=C2=A0</li><li style=
=3D"margin-left:15px">Either myself or one attendee volunteer will help hos=
t each design session using=C2=A0Jitsi=C2=A0</li><li style=3D"margin-left:1=
5px">Ensure you are using the Lisbon timezone</li><li style=3D"margin-left:=
15px">All sessions on Tuesday 4th June will be streamed using:</li><ul><li =
style=3D"margin-left:15px"><b><a href=3D"https://meet.jit.si/XenSummit24Mai=
n" target=3D"_blank">SESSION PRESENTATIONS LINK</a></b>.=C2=A0</li></ul><li=
 style=3D"margin-left:15px">All sessions on Wednesday 5th June and Thursday=
 6th June will use the following links:<br></li><ul><li style=3D"margin-lef=
t:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsA" target=3D"_bl=
ank">DESIGN SESSION A</a>=C2=A0</b>(Liberdade Room)=C2=A0</li><li style=3D"=
margin-left:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsB" tar=
get=3D"_blank">DESIGN SESSION=C2=A0B</a>=C2=A0</b>(Augusta Room)</li><li st=
yle=3D"margin-left:15px">Please look out on the schedule for the time and w=
hich session room it takes place in<br></li></ul></ul><ul><li style=3D"marg=
in-left:15px">Thursday design sessions will be finalized on the schedule by=
 the end of day on Wednesday</li><li style=3D"margin-left:15px">The same li=
nks will be used throughout talks and sessions</li><li style=3D"margin-left=
:15px">(Optional) Join our Xen Summit matrix channel for updates on the day=
:=C2=A0<a href=3D"https://matrix.to/#/%23xen-project-summit:matrix.org" tar=
get=3D"_blank">https://matrix.to/#/#xen-project-summit:matrix.org</a>=C2=A0=
=C2=A0</li></ul><div><div><b><u>Some ground rules to follow:</u></b></div><=
div><ul><li style=3D"margin-left:15px">Enter your full name on Jitsi so eve=
ryone knows who you are</li><li style=3D"margin-left:15px">Please mute your=
self upon joining=C2=A0</li><li style=3D"margin-left:15px">Turning on camer=
as is optional, but we encourage doing this for design sessions</li><li sty=
le=3D"margin-left:15px">Do=C2=A0<u>not</u>=C2=A0shout out your questions du=
ring session presentations, instead ask these on the chat function and we w=
ill do our best to ask on behalf of you</li><li style=3D"margin-left:15px">=
During design sessions, we encourage you to unmute and participate freely</=
li><li style=3D"margin-left:15px">If multiple people wish to speak, please =
use the &#39;raise hand&#39; function on=C2=A0Jitsi or chat</li><li style=
=3D"margin-left:15px">Should there be a need, moderators will have permissi=
on to remove anyone who is disruptive in sessions on=C2=A0Jitsi</li><li sty=
le=3D"margin-left:15px">If you face issues on the day, please let us know v=
ia Matrix - we will do our best to help, but please note this is a communit=
y effort=C2=A0</li></ul><div><b><u>Jitsi links:</u></b></div></div></div></=
div><div><span id=3D"m_-3807238046455862930m_3017200869748370048gmail-docs-=
internal-guid-f9217878-7fff-07f7-1772-78aa156120b2"><div dir=3D"ltr" align=
=3D"left" style=3D"margin-left:0pt"><table style=3D"border:none;border-coll=
apse:collapse"><colgroup><col width=3D"208"><col width=3D"208"><col width=
=3D"208"></colgroup><tbody><tr style=3D"height:58.5pt"><td style=3D"border-=
width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:=
top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.728;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight=
:700;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">Session presentation link:</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.728;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"https://meet.jit.si/XenSummit24Main" target=3D"_blank" s=
tyle=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;background-color:transparent;font-weight:700;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;text-decoration-line:underline;vertical-align:baseline">https://meet.ji=
t.si/XenSummit24Main</span></a><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:70=
0;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">=C2=A0</span></p></td><td style=
=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vert=
ical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-he=
ight:1.728;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-weight:700;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;vertical-align:baseline">Design Session A (L=
iberdade Room) link:=C2=A0</span><a href=3D"https://meet.jit.si/XenDesignSe=
ssionsA" target=3D"_blank" style=3D"text-decoration-line:none"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:norma=
l;font-variant-alternates:normal;text-decoration-line:underline;vertical-al=
ign:baseline">https://meet.jit.si/XenDesignSessionsA</span></a></p></td><td=
 style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0=
);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"l=
ine-height:1.728;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">Design Sessio=
n B (Augusta Room) link:=C2=A0</span><a href=3D"https://meet.jit.si/XenDesi=
gnSessionsB" target=3D"_blank" style=3D"text-decoration-line:none"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;text-decoration-line:underline;vertical=
-align:baseline">https://meet.jit.si/XenDesignSessionsB</span></a></p></td>=
</tr><tr style=3D"height:171.75pt"><td style=3D"border-width:0.681818pt;bor=
der-style:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;over=
flow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-variant-alternates:normal;vertical-align:baseline">See meet=
ing dial-in numbers:=C2=A0</span><a href=3D"https://meet.jit.si/static/dial=
InInfo.html?room=3DXenSummit24Main" target=3D"_blank" style=3D"text-decorat=
ion-line:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;font-variant-alternates:normal;text-decoration-line:underline;v=
ertical-align:baseline">https://meet.jit.si/static/dialInInfo.html?room=3DX=
enSummit24Main</span></a><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:1.656;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">If also dialing-in through a room phone, join without connecting to audi=
o:=C2=A0</span><a href=3D"https://meet.jit.si/XenSummit24Main#config.startS=
ilent=3Dtrue" target=3D"_blank" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;text-decoration-line:underline;vertical-align:baseline=
">https://meet.jit.si/XenSummit24Main#config.startSilent=3Dtrue</span></a><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;font=
-variant-alternates:normal;vertical-align:baseline">=C2=A0</span></p></td><=
td style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0=
,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D=
"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">See meeting dial-in numbers:=C2=A0</span><a =
href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessions=
A" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;text-decoration-line:underline;vertical-align:baseline">https://m=
eet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsA</span></a></p><=
br><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">If also dialing-in=
 through a room phone, join without connecting to audio:=C2=A0</span><a hre=
f=3D"https://meet.jit.si/XenDesignSessionsA#config.startSilent=3Dtrue" targ=
et=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;text-decoration-line:underline;vertical-align:baseline">https://meet.jit=
.si/XenDesignSessionsA#config.startSilent=3Dtrue</span></a></p></td><td sty=
le=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);ve=
rtical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-=
height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;font-family:Arial,sans-serif;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;=
vertical-align:baseline">See meeting dial-in numbers:=C2=A0</span><a href=
=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB" t=
arget=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;text-decoration-line:underline;vertical-align:baseline">https://meet.=
jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB</span></a></p><br><=
p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">If also dialing-in thr=
ough a room phone, join without connecting to audio:=C2=A0</span><a href=3D=
"https://meet.jit.si/XenDesignSessionsB#config.startSilent=3Dtrue" target=
=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;text-decoration-line:underline;vertical-align:baseline">https://meet.jit.s=
i/XenDesignSessionsB#config.startSilent=3Dtrue</span></a></p></td></tr><tr =
style=3D"height:82.5pt"><td style=3D"border-width:0.681818pt;border-style:s=
olid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden=
"><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-co=
lor:transparent;font-weight:700;font-style:italic;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">Schedule Example:=C2=A0</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-style:i=
talic;font-variant-numeric:normal;font-variant-east-asian:normal;font-varia=
nt-alternates:normal;vertical-align:baseline">Tuesday 4th &amp; Wednesday 5=
th June 2024</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-style:italic;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">(Lisbon timezone)</span></p></td><td style=3D"border-wi=
dth:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:to=
p;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;background-color:transparent;font-weight:700;font-style:ita=
lic;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;vertical-align:baseline">Schedule Example:=C2=A0</span><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:=
transparent;font-style:italic;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">Wedne=
sday 5th &amp; Thursday 6th June 2024</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-style:it=
alic;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">(Lisbon timezone)</span></p></=
td><td style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb=
(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" styl=
e=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-=
weight:700;font-style:italic;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline">Schedu=
le Example:=C2=A0=C2=A0</span><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;background-color:transparent;font-style:italic;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">Wednesday 5th &amp; Thursday 6th June 2024</span>=
</p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-=
color:transparent;font-style:italic;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline"=
>(Lisbon timezone)</span></p><br></td></tr><tr style=3D"height:201.75pt"><t=
d style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,=
0);vertical-align:top;padding:5pt;overflow:hidden"><h3 style=3D"box-sizing:=
border-box;font-family:Inter,&quot;Avenir Next&quot;,&quot;Helvetica Neue&q=
uot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-serif;font-weight:inher=
it;line-height:1.1;margin:17px 0px 0px;padding:0px;border:0px;outline:0px;f=
ont-size:14px;vertical-align:baseline;clear:left;color:rgb(153,153,153);flo=
at:left;text-align:right;width:90px;zoom:1">09:00</h3><div class=3D"gmail-s=
ched-container" style=3D"box-sizing:border-box;padding:0px;border-width:0px=
 0px 0px 1px;border-top-style:initial;border-right-style:initial;border-bot=
tom-style:initial;border-left-style:solid;border-top-color:initial;border-r=
ight-color:initial;border-bottom-color:initial;border-left-color:rgba(0,0,0=
,0.1);outline:0px;font-size:16px;font-family:Inter,&quot;Avenir Next&quot;,=
&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-s=
erif;vertical-align:baseline;color:rgb(51,51,51)"><div class=3D"gmail-sched=
-container-inner" style=3D"box-sizing:border-box;margin:0px;padding:10px 0p=
x 5px 15px;border:0px;outline:0px;font-weight:inherit;font-family:inherit;v=
ertical-align:baseline"><span class=3D"event ev_3" style=3D"box-sizing:bord=
er-box;margin:0px 12px 12px 0px;padding:0px;border-width:1px;border-style:s=
olid;border-color:transparent rgba(0,0,0,0.15) rgba(0,0,0,0.15) transparent=
;outline:0px;font-weight:inherit;font-family:inherit;vertical-align:baselin=
e;background-color:rgb(166,237,231);border-radius:4px;display:block;float:l=
eft"><a href=3D"https://xenprojectsummit2024.sched.com/event/1bCKF/welcome-=
opening-remarks-kelly-choi-community-manager-cloud-software-group-xenserver=
?iframe=3Dyes&amp;w=3D100%&amp;sidebar=3Dyes&amp;bg=3Dno" class=3D"gmail-na=
me" id=3D"gmail-69e373000a4da4d8e181cc54aa83e898" style=3D"box-sizing:borde=
r-box;text-decoration-line:none;margin:0px;padding:6px 10px 7px;border:0px;=
outline:0px;font-size:15px;font-family:inherit;vertical-align:baseline;colo=
r:rgb(0,0,0);border-bottom-right-radius:3px;border-top-right-radius:3px;flo=
at:left;line-height:1.2;min-height:32px">Welcome &amp; Opening Remarks - Ke=
lly Choi, Community Manager, Cloud Software Group, XenServer<span class=3D"=
gmail-vs" style=3D"box-sizing:border-box;margin:5px 0px 0px;padding:0px;bor=
der:0px;outline:0px;font-size:12px;font-family:inherit;vertical-align:basel=
ine;text-transform:uppercase;clear:left;display:none;opacity:0.8"></span></=
a></span></div></div><br><p dir=3D"ltr" style=3D"line-height:1.656;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">09:10=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">Xen Project 2024 Weather Report - Kelly Choi, XenServer, Cloud Softwar=
e Group.</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">LI=
BERDADE I</span></p><br></td><td style=3D"border-width:0.681818pt;border-st=
yle:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:h=
idden"><h3 style=3D"box-sizing:border-box;font-family:Inter,&quot;Avenir Ne=
xt&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Ari=
al,sans-serif;font-weight:inherit;line-height:1.1;margin:17px 0px 0px;paddi=
ng:0px;border:0px;outline:0px;font-size:14px;vertical-align:baseline;clear:=
left;color:rgb(153,153,153);float:left;text-align:right;width:90px;zoom:1">=
09:10=C2=A0</h3><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline"></spa=
n></p><div class=3D"gmail-sched-container" style=3D"box-sizing:border-box;p=
adding:0px;border-width:0px 0px 0px 1px;border-top-style:initial;border-rig=
ht-style:initial;border-bottom-style:initial;border-left-style:solid;border=
-top-color:initial;border-right-color:initial;border-bottom-color:initial;b=
order-left-color:rgba(0,0,0,0.1);outline:0px;font-size:16px;font-family:Int=
er,&quot;Avenir Next&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&q=
uot;,Helvetica,Arial,sans-serif;vertical-align:baseline;color:rgb(51,51,51)=
"><div class=3D"gmail-sched-container-inner" style=3D"box-sizing:border-box=
;margin:0px;padding:10px 0px 5px 15px;border:0px;outline:0px;font-weight:in=
herit;font-family:inherit;vertical-align:baseline"><span class=3D"event ev_=
5" style=3D"box-sizing:border-box;margin:0px 12px 12px 0px;padding:0px;bord=
er-width:1px;border-style:solid;border-color:transparent rgba(0,0,0,0.15) r=
gba(0,0,0,0.15) transparent;outline:0px;font-weight:inherit;font-family:inh=
erit;vertical-align:baseline;background-color:rgb(109,209,61);border-radius=
:4px;display:block;float:left"><a href=3D"https://xenprojectsummit2024.sche=
d.com/event/1bCFO/challenges-and-status-of-enabling-trenchboot-in-xen-hyper=
visor-michal-zygowski-piotr-krol-3mdeb?iframe=3Dyes&amp;w=3D100%&amp;sideba=
r=3Dyes&amp;bg=3Dno" class=3D"gmail-name" id=3D"gmail-875c64b7afbdbd049318b=
5585b9120f8" style=3D"box-sizing:border-box;text-decoration-line:none;margi=
n:0px;padding:6px 10px 7px;border:0px;outline:0px;font-size:15px;font-famil=
y:inherit;vertical-align:baseline;color:rgb(0,0,0);border-bottom-right-radi=
us:3px;border-top-right-radius:3px;float:left;line-height:1.2;min-height:32=
px">Challenges and Status of Enabling TrenchBoot in Xen Hypervisor - Micha=
=C5=82 =C5=BBygowski &amp; Piotr Kr=C3=B3l, 3mdeb<span class=3D"gmail-vs" s=
tyle=3D"box-sizing:border-box;margin:5px 0px 0px;padding:0px;border:0px;out=
line:0px;font-size:12px;font-family:inherit;vertical-align:baseline;text-tr=
ansform:uppercase;clear:left;display:none;opacity:0.8"></span></a></span></=
div></div><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">13:45=C2=A0=
</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-=
bottom:0pt"><a href=3D"https://design-sessions.xenproject.org/uid/discussio=
n/disc_OlJce1uK3uI0OjS2cL55/view" target=3D"_blank" style=3D"text-decoratio=
n-line:none"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;text-decoration-line:underline;vertical-align:baseline">The fut=
ure of Xen Project physical events</span></a></p><p dir=3D"ltr" style=3D"li=
ne-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;vertical-align:baseline">LIBERDADE I</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">14:35=C2=A0</span></p><p dir=3D"ltr" styl=
e=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><a href=3D"https:/=
/design-sessions.xenproject.org/uid/discussion/disc_PEgBNIXMyEkdJoysE27O/vi=
ew" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;text-decoration-li=
ne:underline;vertical-align:baseline">IOMMU paravirtualization and Xen IOMM=
U subsystem rework</span></a></p><p dir=3D"ltr" style=3D"line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">LIBERDADE I</span></p></td><td style=3D"border-width:0.681818pt=
;border-style:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;=
overflow:hidden"><h3 style=3D"box-sizing:border-box;font-family:Inter,&quot=
;Avenir Next&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Hel=
vetica,Arial,sans-serif;font-weight:inherit;line-height:1.1;margin:17px 0px=
 0px;padding:0px;border:0px;outline:0px;font-size:14px;vertical-align:basel=
ine;clear:left;color:rgb(153,153,153);text-align:right;width:90px;zoom:1">0=
9:10=C2=A0</h3><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-variant-alternates:normal;vertical-align:baseline"><span =
class=3D"event ev_5" style=3D"box-sizing:border-box;margin:0px 12px 12px 0p=
x;padding:0px;border-width:1px;border-style:solid;border-color:transparent =
rgba(0,0,0,0.15) rgba(0,0,0,0.15) transparent;outline:0px;font-size:16px;fo=
nt-family:Inter,&quot;Avenir Next&quot;,&quot;Helvetica Neue&quot;,&quot;Lu=
cida Grande&quot;,Helvetica,Arial,sans-serif;vertical-align:baseline;backgr=
ound-color:rgb(109,209,61);border-radius:4px;display:block;float:left;color=
:rgb(51,51,51)"><a href=3D"https://xenprojectsummit2024.sched.com/event/1bC=
FR/using-xenalyze-for-performance-analysis-george-dunlap-xen-server?iframe=
=3Dyes&amp;w=3D100%&amp;sidebar=3Dyes&amp;bg=3Dno" class=3D"gmail-name" id=
=3D"gmail-0cf68d8b5cd7b1b5c490b568c76b39f5" style=3D"box-sizing:border-box;=
text-decoration-line:none;margin:0px;padding:6px 10px 7px;border:0px;outlin=
e:0px;font-size:15px;font-family:inherit;vertical-align:baseline;color:rgb(=
0,0,0);border-bottom-right-radius:3px;border-top-right-radius:3px;float:lef=
t;line-height:1.2;min-height:32px">Using Xenalyze for Performance Analysis =
- George Dunlap, Xen Server<span class=3D"gmail-vs" style=3D"box-sizing:bor=
der-box;margin:5px 0px 0px;padding:0px;border:0px;outline:0px;font-size:12p=
x;font-family:inherit;vertical-align:baseline;text-transform:uppercase;clea=
r:left;display:none;opacity:0.8">AUGUSTA I</span></a></span><br class=3D"gm=
ail-Apple-interchange-newline"></span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.6=
56;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.656;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-to=
p:0pt;margin-bottom:0pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">13:45=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.656=
;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://design-sessions.xenpr=
oject.org/uid/discussion/disc_z78Lt2EIZt2qxaS3FSlQ/view" target=3D"_blank" =
style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;font-variant-alternates:normal;text-decoration-line:underline;vertical-=
align:baseline">Downstream working group</span></a></p><p dir=3D"ltr" style=
=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;font-variant-alternate=
s:normal;vertical-align:baseline">AUGUSTA I</span></p><br><p dir=3D"ltr" st=
yle=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">14:35=C2=A0</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><a href=3D"http=
s://design-sessions.xenproject.org/uid/discussion/disc_01JE9EOi9zxxAU8lfB6Z=
/view" target=3D"_blank" style=3D"text-decoration-line:none"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-variant-alternates:normal;text-decoration=
-line:underline;vertical-align:baseline">Xen Safety Requirements upstreamin=
g</span></a></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;font-variant-alternates:normal;vertical-align:baseline">AUGUS=
TA I</span></p><br><br></td></tr></tbody></table></div></span></div><div><s=
pan id=3D"m_-3807238046455862930m_3017200869748370048m_2927081184909999839m=
_-8370998895675947915gmail-docs-internal-guid-7c024368-7fff-f910-ae50-70b83=
521ee30"><div><br></div><b><u>How to filter the schedule:</u></b><br><span =
style=3D"border:none;display:inline-block;overflow:hidden;width:624px;heigh=
t:411px"><img src=3D"https://lh7-us.googleusercontent.com/nJqdiQUkRhper7xaN=
fEg5kdR7Jsn_7Mb7Muwgz_IaImd4-ZOK0D5o9_jypDXHX2ybCsevBnzCISatQZxOIu5eEkBWWsY=
jYpXNCTw3khSi5qySJoq7hzZ5HPsoLxAJOQ5KjEzJXfvgVnLc4s_53AqXuE" width=3D"624" =
height=3D"411" class=3D"gmail-CToWUd gmail-a6T" tabindex=3D"0" style=3D"cur=
sor: pointer; outline: 0px; margin-left: 0px; margin-top: 0px;"></span></sp=
an><br></div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"lt=
r"><div><br></div><div><b><u>FAQs:</u></b></div><div><ul><li><b>My company =
would like to sponsor the next Xen Summit, how do I get involved?</b></li><=
ul><li><i>Please email=C2=A0</i><a class=3D"gmail_plusreply" id=3D"m_825124=
0063996215973plusReplyChip-1" href=3D"mailto:community.manager@xenproject.o=
rg" target=3D"_blank">@communitymanager</a><i>=C2=A0with your interest=C2=
=A0</i></li></ul><li><b>Are sessions recorded?</b></li><ul><li><i>Yes, all =
talks are recorded and will be available=C2=A0on YouTube after the event. D=
esign sessions on Day 3 are not recorded.=C2=A0</i></li></ul><li><b>Can I w=
rite about my experience at Xen Summit?</b></li><ul><li><i>Yes! We encourag=
e the community to spread the word through social media. Please tag us on X=
 or LinkedIn so that we can reshare.=C2=A0</i></li></ul><li><i><b>Can we se=
e the presenter&#39;s slides?</b><br></i></li><ul><li><i>Some presenters ma=
y have uploaded their slides in advance. If available, you can view these b=
y clicking on each session in the screenshot above.=C2=A0</i></li></ul></ul=
></div><div>We look forward to seeing you there, both virtually and physica=
lly!</div><div><br></div></div></div></div><div><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ma=
ny thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"colo=
r:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,=
136)">Xen Project=C2=A0<br></div></div></div></div></div></div>

--0000000000007f0a4f0619bd4676--

