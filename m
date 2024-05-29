Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4EE8D3893
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731945.1137730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJt9-0001sB-KN; Wed, 29 May 2024 14:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731945.1137730; Wed, 29 May 2024 14:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCJt9-0001qA-GM; Wed, 29 May 2024 14:02:47 +0000
Received: by outflank-mailman (input) for mailman id 731945;
 Wed, 29 May 2024 14:02:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tF9l=NA=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sCJt7-0001pt-HJ
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:02:45 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e35a604-1dc4-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:02:43 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52ac0c4b62cso892771e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:02:43 -0700 (PDT)
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
X-Inumbo-ID: 1e35a604-1dc4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716991362; x=1717596162; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZYzRlzTLzEjtaMe1Xvod3sHOTprCiFQ7vhrNGjOUgJw=;
        b=i+8ISP2umVv4RqNej59Ru6T4bmD+FLZNaSYQdV0rJFl5ROXhW7VCIRUzWyGh2xjVkk
         WgOf9L0OcMYxa7j2uaf8/EKvwSKF6+yiDGKbnaSMpnC+3UbbHB7BXjHmsTcZ5XKK7T7o
         yuiQYio2VlyyCOWA232tE1yN5fqkUfVkm5akw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716991362; x=1717596162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYzRlzTLzEjtaMe1Xvod3sHOTprCiFQ7vhrNGjOUgJw=;
        b=vbKc21QJtwv/ho7LjfIskMRsBTarqnevMeZCmfKOshPHU2xv6by2tk7hsKGIJTTOzu
         EVzNbocrHbB9SAgpgRzFgglR/RJ7UX8bmztVjSKfsJVN8x9m6r8jEHigrFZmxa4uWHDM
         gHz3RPttTsjSqwl8TUeJ1eNgXZFCUEcEblIUQvGCagz6c1hYfg8ZdVBWkOOtROZsxLAK
         blDDbW+6eQ6cNYgZyO2u8epaHBFkd0ZJXuzBhCfSX/fkSTdFG57E6UDL7NaWbAOS2Q1+
         O4wNq2OMaxYgOIQ2VXuA4mq4Kgx13Dm+26bn48+EfpL7u0KgzedINQux+I7TYmBe2kOn
         4Upg==
X-Gm-Message-State: AOJu0Ywd0rBG4Eq922Gnuj5+la2hSNmRVs6+3wNmSCQtFNRv/fLqAosC
	/98WW3RZDANQb6V19r6jzLOK6oaKHHVZnA8JvRDs36c+gS125U3X5VhyHw8BOI65vx8pAZ0ukel
	D/7zTOZZUrKt7hxLahD2EU/fojkOIb3AxwcmqNvPXMtB09IjZ
X-Google-Smtp-Source: AGHT+IGaZRiwUIWmLWB9uh5JxA0BzSTXgoQlGWOpGvePkNO4yaTDjiC7u5vIYIE5ALkU9qUOQSWgNqqn54W6h8keMbw=
X-Received: by 2002:ac2:4833:0:b0:51e:1bed:13a8 with SMTP id
 2adb3069b0e04-52964caa1e1mr8378853e87.29.1716991361899; Wed, 29 May 2024
 07:02:41 -0700 (PDT)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 29 May 2024 15:02:05 +0100
Message-ID: <CAO-mL=w0OCCnt+x_8oyv4MvZ-SjcN1M5sGUJzU-buK1vusgyUw@mail.gmail.com>
Subject: [ANNOUNCE] Join us for free virtually at Xen Summit 2024!
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org, advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000035af2506199834af"

--00000000000035af2506199834af
Content-Type: text/plain; charset="UTF-8"

Hello Xen Community,

Join us virtually at Xen Summit (4-6th June), for free using Jitsi!

We want to encourage as many of you to participate in the Xen Summit as
possible. Just because you are not physically attending, doesn't mean you
can't get involved.
*(Please note, there will be no professional AV or audio equipment, and it
is a community effort to enable others to get involved.) *

On the day, please find the *schedule of talks listed here.*
<https://events.linuxfoundation.org/xen-project-summit/program/schedule/>

*Instructions:*

   - Our team will help host the main presentation talk sessions using Jitsi

   - Either myself or one attendee volunteer will help host each design
   session using Jitsi
   - Ensure you are using the Lisbon timezone
   - All keynotes and session presentation talks will be streamed using:
      - *SESSION PRESENTATIONS LINK <https://meet.jit.si/XenSummit24Main>*.
   - Two design sessions will happen simultaneously (from Wednesday, June
   5th @ 13:45).
   Please look out on the schedule for the time and whether the session
   you'd like to attend is:
      - *DESIGN SESSION A <https://meet.jit.si/XenDesignSessionsA> *(Liberdade
      Room)
      - *DESIGN SESSION B <https://meet.jit.si/XenDesignSessionsB> *(Augusta
      Room)


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

Design Session B (Augusta Room) link: https://meet.jit.si/XenDesignSessionsB

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=XenSummit24Main

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenSummit24Main#config.startSilent=true

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=XenDesignSessionsA

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenDesignSessionsA#config.startSilent=true

See meeting dial-in numbers:
https://meet.jit.si/static/dialInInfo.html?room=XenDesignSessionsB

If also dialing-in through a room phone, join without connecting to audio:
https://meet.jit.si/XenDesignSessionsB#config.startSilent=true

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

LIBERDADE I

09:10

Xen Project 2024 Weather Report - Kelly Choi, XenServer, Cloud Software
Group.

LIBERDADE I

13:45

The future of Xen Project physical events
<https://design-sessions.xenproject.org/uid/discussion/disc_OlJce1uK3uI0OjS2cL55/view>

LIBERDADE I

14:35

IOMMU paravirtualization and Xen IOMMU subsystem rework
<https://design-sessions.xenproject.org/uid/discussion/disc_PEgBNIXMyEkdJoysE27O/view>

LIBERDADE I

13:45

Downstream working group
<https://design-sessions.xenproject.org/uid/discussion/disc_z78Lt2EIZt2qxaS3FSlQ/view>

AUGUSTA I

14:35

Xen Safety Requirements upstreaming
<https://design-sessions.xenproject.org/uid/discussion/disc_01JE9EOi9zxxAU8lfB6Z/view>

AUGUSTA I



*How to filter the schedule:*



We look forward to seeing you there, both virtually and physically!

Many thanks,
Kelly Choi

Community Manager
Xen Project

--00000000000035af2506199834af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen Community,=C2=A0<div><br></div><div>Join us virt=
ually at Xen Summit (4-6th June), for free using=C2=A0<span>Jitsi</span>!=
=C2=A0</div><div><br></div><div>We want to encourage as many of you to part=
icipate in the Xen Summit as possible. Just because you are not physically =
attending, doesn&#39;t mean you can&#39;t get involved.=C2=A0</div><div><i>=
(Please note, there will be no professional AV or audio equipment, and it i=
s a community effort to enable others to get involved.)=C2=A0</i></div><div=
><br></div><div>On the day, please find the=C2=A0<a href=3D"https://events.=
linuxfoundation.org/xen-project-summit/program/schedule/" target=3D"_blank"=
><b>schedule=C2=A0of talks listed here.</b></a></div><div><br></div><div><b=
><u>Instructions:</u></b></div><div><ul><li style=3D"margin-left:15px">Our =
team will help host the main presentation talk sessions using=C2=A0<span>Ji=
tsi</span>=C2=A0</li><li style=3D"margin-left:15px">Either myself or one at=
tendee volunteer will help host each design session using=C2=A0<span>Jitsi<=
/span>=C2=A0</li><li style=3D"margin-left:15px">Ensure you are using the Li=
sbon timezone</li><li style=3D"margin-left:15px">All keynotes and session p=
resentation talks will be streamed using:</li><ul><li style=3D"margin-left:=
15px"><b><a href=3D"https://meet.jit.si/XenSummit24Main" target=3D"_blank">=
SESSION PRESENTATIONS LINK</a></b>.=C2=A0</li></ul><li style=3D"margin-left=
:15px">Two design sessions will happen simultaneously (from Wednesday, June=
 5th @ 13:45).<br>Please look out on the schedule for the time and whether =
the session you&#39;d like to attend is:=C2=A0</li><ul><li style=3D"margin-=
left:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsA" target=3D"=
_blank">DESIGN SESSION A</a>=C2=A0</b>(Liberdade Room)=C2=A0</li><li style=
=3D"margin-left:15px"><b><a href=3D"https://meet.jit.si/XenDesignSessionsB"=
 target=3D"_blank">DESIGN SESSION=C2=A0B</a>=C2=A0</b>(Augusta Room)</li></=
ul></ul><ul><li style=3D"margin-left:15px">Thursday design sessions will be=
 finalized on the schedule by the end of day on Wednesday</li><li style=3D"=
margin-left:15px">The same links will be used throughout talks and sessions=
</li><li style=3D"margin-left:15px">(Optional) Join our Xen Summit matrix c=
hannel for updates on the day:=C2=A0<a href=3D"https://matrix.to/#/%23xen-p=
roject-summit:matrix.org" target=3D"_blank">https://matrix.to/#/#xen-projec=
t-summit:matrix.org</a>=C2=A0=C2=A0</li></ul><div><div><b><u>Some ground ru=
les to follow:</u></b></div><div><ul><li style=3D"margin-left:15px">Enter y=
our full name on Jitsi so everyone knows who you are</li><li style=3D"margi=
n-left:15px">Please mute yourself upon joining=C2=A0</li><li style=3D"margi=
n-left:15px">Turning on cameras is optional, but we encourage doing this fo=
r design sessions</li><li style=3D"margin-left:15px">Do <u>not</u> shout ou=
t your questions during session presentations, instead ask these on the cha=
t function and we will do our best to ask on behalf of you</li><li style=3D=
"margin-left:15px">During design sessions, we encourage you to unmute and p=
articipate freely</li><li style=3D"margin-left:15px">If multiple people wis=
h to speak, please use the &#39;raise hand&#39; function on=C2=A0<span>Jits=
i or chat</span></li><li style=3D"margin-left:15px">Should there be a need,=
 moderators will have permission to remove anyone who is disruptive in sess=
ions on=C2=A0<span>Jitsi</span></li><li style=3D"margin-left:15px"><span>If=
 you face issues on the day, please let us know via Matrix - we will do our=
 best to help, but please note this is a community effort=C2=A0</span></li>=
</ul><div><b><u>Jitsi links:</u></b></div></div></div></div><div><span id=
=3D"m_3017200869748370048gmail-docs-internal-guid-f9217878-7fff-07f7-1772-7=
8aa156120b2"><div dir=3D"ltr" style=3D"margin-left:0pt" align=3D"left"><tab=
le style=3D"border:none;border-collapse:collapse"><colgroup><col width=3D"2=
08"><col width=3D"208"><col width=3D"208"></colgroup><tbody><tr style=3D"he=
ight:58.5pt"><td style=3D"border-width:0.681818pt;border-style:solid;border=
-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.728;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgro=
und-color:transparent;font-weight:700;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">Session presentation link:</span></p><p dir=3D"ltr" style=3D"line-height=
:1.728;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://meet.jit.si/Xen=
Summit24Main" style=3D"text-decoration-line:none" target=3D"_blank"><span s=
tyle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transp=
arent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;text-decoration-line:underline;vertica=
l-align:baseline">https://meet.jit.si/XenSummit24Main</span></a><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:700;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
=C2=A0</span></p></td><td style=3D"border-width:0.681818pt;border-style:sol=
id;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden">=
<p dir=3D"ltr" style=3D"line-height:1.728;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-weight:700;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Design Session A (Liberdade Room) link: </span><a href=3D"https=
://meet.jit.si/XenDesignSessionsA" style=3D"text-decoration-line:none" targ=
et=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;ba=
ckground-color:transparent;font-weight:700;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;text-decoration-l=
ine:underline;vertical-align:baseline">https://meet.jit.si/XenDesignSession=
sA</span></a></p></td><td style=3D"border-width:0.681818pt;border-style:sol=
id;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden">=
<p dir=3D"ltr" style=3D"line-height:1.728;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0=
);background-color:transparent;font-weight:700;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Design Session B (Augusta Room) link: </span><a href=3D"https:/=
/meet.jit.si/XenDesignSessionsB" style=3D"text-decoration-line:none" target=
=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;back=
ground-color:transparent;font-weight:700;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;text-decoration-lin=
e:underline;vertical-align:baseline">https://meet.jit.si/XenDesignSessionsB=
</span></a></p></td></tr><tr style=3D"height:171.75pt"><td style=3D"border-=
width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:=
top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">See meeting dial-in numbers: </span><a href=3D"https://meet.jit=
.si/static/dialInInfo.html?room=3DXenSummit24Main" style=3D"text-decoration=
-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;text-decoration-l=
ine:underline;vertical-align:baseline">https://meet.jit.si/static/dialInInf=
o.html?room=3DXenSummit24Main</span></a><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-height:=
1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial,sans-serif;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;font-variant-alternates:normal;vertica=
l-align:baseline">If also dialing-in through a room phone, join without con=
necting to audio: </span><a href=3D"https://meet.jit.si/XenSummit24Main#con=
fig.startSilent=3Dtrue" style=3D"text-decoration-line:none" target=3D"_blan=
k"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;text-decoration-line:underline;vertical-alig=
n:baseline">https://meet.jit.si/XenSummit24Main#config.startSilent=3Dtrue</=
span></a><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline">=C2=A0</span>=
</p></td><td style=3D"border-width:0.681818pt;border-style:solid;border-col=
or:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr=
" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">See meeting dial-in numbers: </sp=
an><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSe=
ssionsA" style=3D"text-decoration-line:none" target=3D"_blank"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;text-decoration-line:underline;vertical-align:baseline">ht=
tps://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsA</span></=
a></p><br><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-b=
ottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">If also dia=
ling-in through a room phone, join without connecting to audio: </span><a h=
ref=3D"https://meet.jit.si/XenDesignSessionsA#config.startSilent=3Dtrue" st=
yle=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:no=
rmal;text-decoration-line:underline;vertical-align:baseline">https://meet.j=
it.si/XenDesignSessionsA#config.startSilent=3Dtrue</span></a></p></td><td s=
tyle=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);=
vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"lin=
e-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">See meeting dial-in numbers: </span><a href=3D"h=
ttps://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB" style=
=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;text-decoration-line:underline;vertical-align:baseline">https://meet.jit.=
si/static/dialInInfo.html?room=3DXenDesignSessionsB</span></a></p><br><p di=
r=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-va=
riant-alternates:normal;vertical-align:baseline">If also dialing-in through=
 a room phone, join without connecting to audio: </span><a href=3D"https://=
meet.jit.si/XenDesignSessionsB#config.startSilent=3Dtrue" style=3D"text-dec=
oration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;text-decor=
ation-line:underline;vertical-align:baseline">https://meet.jit.si/XenDesign=
SessionsB#config.startSilent=3Dtrue</span></a></p></td></tr><tr style=3D"he=
ight:82.5pt"><td style=3D"border-width:0.681818pt;border-style:solid;border=
-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-weight:700;font-style:italic;font-variant-numeric:normal;font-var=
iant-east-asian:normal;font-variant-alternates:normal;vertical-align:baseli=
ne">Schedule Example:=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1=
.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-style:italic;font-=
variant-numeric:normal;font-variant-east-asian:normal;font-variant-alternat=
es:normal;vertical-align:baseline">Tuesday 4th &amp; Wednesday 5th June 202=
4</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-style:italic;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:b=
aseline">(Lisbon timezone)</span></p></td><td style=3D"border-width:0.68181=
8pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5=
pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-weight:700;font-style:italic;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">Schedule Example: </span><span style=3D"fo=
nt-size:11pt;font-family:Arial,sans-serif;background-color:transparent;font=
-style:italic;font-variant-numeric:normal;font-variant-east-asian:normal;fo=
nt-variant-alternates:normal;vertical-align:baseline">Wednesday 5th &amp; T=
hursday 6th June 2024</span></p><p dir=3D"ltr" style=3D"line-height:1.656;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-style:italic;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:nor=
mal;vertical-align:baseline">(Lisbon timezone)</span></p></td><td style=3D"=
border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical=
-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height=
:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;background-color:transparent;font-weight:700;font-=
style:italic;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">Schedule Example:=C2=
=A0 </span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backg=
round-color:transparent;font-style:italic;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;vertical-align:bas=
eline">Wednesday 5th &amp; Thursday 6th June 2024</span></p><p dir=3D"ltr" =
style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-style:italic;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-variant-alternates:normal;vertical-align:baseline">(Lisbon timezone)<=
/span></p><br></td></tr><tr style=3D"height:201.75pt"><td style=3D"border-w=
idth:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:t=
op;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline">09:00=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Welcome &amp; Opening Remarks - Kelly Choi, Community Manager, =
Cloud Software Group, XenServer</span></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;font-variant-alternates:normal;vert=
ical-align:baseline">LIBERDADE I</span></p><br><p dir=3D"ltr" style=3D"line=
-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline">09:10=C2=A0</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;vertical-align:baseline">Xen Project 2024 Weather Report - Kelly Choi, Xe=
nServer, Cloud Software Group.</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline">LIBERDADE I</span></p><br></td><td style=3D"border-widt=
h:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:top;=
padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;font-variant-alternates:normal;vertical-align:ba=
seline">13:45=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.656;mar=
gin-top:0pt;margin-bottom:0pt"><a href=3D"https://design-sessions.xenprojec=
t.org/uid/discussion/disc_OlJce1uK3uI0OjS2cL55/view" style=3D"text-decorati=
on-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:A=
rial,sans-serif;font-variant-numeric:normal;font-variant-east-asian:normal;=
font-variant-alternates:normal;text-decoration-line:underline;vertical-alig=
n:baseline">The future of Xen Project physical events</span></a></p><p dir=
=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;vertical-align:baseline">LIBERDADE I</span></p><br><=
p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;fon=
t-variant-alternates:normal;vertical-align:baseline">14:35=C2=A0</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"=
><a href=3D"https://design-sessions.xenproject.org/uid/discussion/disc_PEgB=
NIXMyEkdJoysE27O/view" style=3D"text-decoration-line:none" target=3D"_blank=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;text-decoration-line:underline;vertical-align:baseline">IOMMU paravirtuali=
zation and Xen IOMMU subsystem rework</span></a></p><p dir=3D"ltr" style=3D=
"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:n=
ormal;vertical-align:baseline">LIBERDADE I</span></p></td><td style=3D"bord=
er-width:0.681818pt;border-style:solid;border-color:rgb(0,0,0);vertical-ali=
gn:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.6=
56;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial,sans-serif;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">13:45=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.=
656;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://design-sessions.xe=
nproject.org/uid/discussion/disc_z78Lt2EIZt2qxaS3FSlQ/view" style=3D"text-d=
ecoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-variant-alternates:normal;text-decoration-line:underline;vertic=
al-align:baseline">Downstream working group</span></a></p><p dir=3D"ltr" st=
yle=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial,sans-serif;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-variant-altern=
ates:normal;vertical-align:baseline">AUGUSTA I</span></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-a=
lternates:normal;vertical-align:baseline">14:35=C2=A0</span></p><p dir=3D"l=
tr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><a href=3D=
"https://design-sessions.xenproject.org/uid/discussion/disc_01JE9EOi9zxxAU8=
lfB6Z/view" style=3D"text-decoration-line:none" target=3D"_blank"><span sty=
le=3D"font-size:11pt;font-family:Arial,sans-serif;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;text-decor=
ation-line:underline;vertical-align:baseline">Xen Safety Requirements upstr=
eaming</span></a></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-=
serif;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
AUGUSTA I</span></p><br><br></td></tr></tbody></table></div></span></div><d=
iv><span id=3D"m_3017200869748370048m_2927081184909999839m_-837099889567594=
7915gmail-docs-internal-guid-7c024368-7fff-f910-ae50-70b83521ee30"><div><sp=
an><br></span></div><b><u>How to filter the schedule:</u></b><br><span styl=
e=3D"border:none;display:inline-block;overflow:hidden;width:624px;height:41=
1px"><img src=3D"https://lh7-us.googleusercontent.com/nJqdiQUkRhper7xaNfEg5=
kdR7Jsn_7Mb7Muwgz_IaImd4-ZOK0D5o9_jypDXHX2ybCsevBnzCISatQZxOIu5eEkBWWsYjYpX=
NCTw3khSi5qySJoq7hzZ5HPsoLxAJOQ5KjEzJXfvgVnLc4s_53AqXuE" width=3D"624" heig=
ht=3D"411" style=3D"margin-left:0px;margin-top:0px"></span></span><br></div=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><br></div><div><br></div><div>We look forwar=
d to seeing you there, both virtually and physically!</div><div><br></div><=
div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=
=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color:rgb(=
136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div></div>

--00000000000035af2506199834af--

