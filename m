Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45B8FAE63
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 11:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735241.1141430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQAv-0007ew-Ei; Tue, 04 Jun 2024 09:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735241.1141430; Tue, 04 Jun 2024 09:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEQAv-0007dL-B0; Tue, 04 Jun 2024 09:09:49 +0000
Received: by outflank-mailman (input) for mailman id 735241;
 Tue, 04 Jun 2024 09:09:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LoY=NG=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1sEQAt-0007dF-Tf
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 09:09:48 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3035958f-2252-11ef-90a1-e314d9c70b13;
 Tue, 04 Jun 2024 11:09:46 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57a2f032007so5263836a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jun 2024 02:09:46 -0700 (PDT)
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
X-Inumbo-ID: 3035958f-2252-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1717492186; x=1718096986; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WCTEXu+M717i4W/ttVLdaRuQa6mebIqSuzX8/KvGncE=;
        b=hr+5EtFGTzBlpQMrTsF+ZVjYk6BOJIVC+EAbczrDIjj/m2tRIDSFL1uROc/lnWqKJP
         eguC+dHMMDJelNFfZXTQ0cWGR3xpP7hQOn4+V1VASRNldGLTk3sF6e/rPfUW923BXoiy
         tuIm4Cgp9IBeaHT4BIKuPUH2H1zxm0pONVf14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717492186; x=1718096986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCTEXu+M717i4W/ttVLdaRuQa6mebIqSuzX8/KvGncE=;
        b=FQb900CE3p7ZkMwzaCEkTq+OTOK2qTi1dAcReoigDJ56yKnQFf2HmA7FsnEzjU+cMG
         ylBPPsgb23uw372il8x6MGtBu+Ium/yuTzEUIZiZxQi9e371XhDmohtEdeufZ8RTFpEH
         ZKdNSxAAOYJWQDRBEjIcF3opGo4dbEZOkZ3SOeGgcen+E6O3McCoziyZCkUYEoezJg3M
         UhzkZxuGwqAInpDocAYXMpvBDRTR3VUrAzxewj3TIBpbhpcwfjBfVd1sgw7/5bYg67j2
         aCsWOsGaosGh1i9nzlRw2i3Kk7qmVZbxEWP+IZL5Sg3VYy0zbkWWrrOyJMdQeNXfUKlL
         hKbg==
X-Gm-Message-State: AOJu0YwOI9hA31vk/D+MN02zSnNCtnGKtZzILB9SRRx+whzurZ8USr6V
	FuNgV1Xz8Qp/6OePVxamt8ImpIdNp5ymVx3k8hpCu+2GHx1Zmca+wxjt5kPTA5RnMRGXQWaISf0
	+xkwRj5eNC7NOe5GGnWEA8KYOrEBEwPmOiDj+hZD15NJKrsfg/X8=
X-Google-Smtp-Source: AGHT+IFB+GEAE02O6tSCkAd5IDs5mAi/iQnQR9I3hAymaIC+Qvs7C1XNMn3NhvfFaHRt4Yy1q53/hQmMKeKOyTWKI0Q=
X-Received: by 2002:a50:8717:0:b0:574:eace:b7bd with SMTP id
 4fb4d7f45d1cf-57a36372cdemr8788700a12.11.1717492185460; Tue, 04 Jun 2024
 02:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=y+q2iUw-OHkHO96FSg1jfm8aQV-dFsMg4R0VS4+maOXg@mail.gmail.com>
In-Reply-To: <CAO-mL=y+q2iUw-OHkHO96FSg1jfm8aQV-dFsMg4R0VS4+maOXg@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 4 Jun 2024 10:09:09 +0100
Message-ID: <CAO-mL=wWSkzVEp7cVEdVafnOr+ZhneBfnvgVO2+yGigovFb_rw@mail.gmail.com>
Subject: [ANNOUNCE] Join us TODAY! Free virtual Xen Summit 2024
To: xen-devel <xen-devel@lists.xenproject.org>, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Cc: committers@xenproject.org
Content-Type: multipart/alternative; boundary="0000000000009e942a061a0ccf36"

--0000000000009e942a061a0ccf36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Don't forget to join us today using Jitsi for Xen Summit!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Fri, May 31, 2024 at 11:15=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> =
wrote:

> Hello Xen Community,
>
> Join us virtually at Xen Summit (4-6th June), for free using Jitsi!
>
> We want to encourage as many of you to participate in the Xen Summit as
> possible. Just because you are not physically attending, doesn't mean you
> can't get involved.
> *(Please note, there will be no professional AV or audio equipment, and i=
t
> is a community effort to enable others to get involved.) *
>
> On the day, please find the *schedule of talks listed here.*
> <https://events.linuxfoundation.org/xen-project-summit/program/schedule/>
> I've also included some FAQs at the bottom of this email.
>
> *Instructions:*
>
>    - Our team will help host the main presentation talk sessions
>    using Jitsi
>    - Either myself or one attendee volunteer will help host each design
>    session using Jitsi
>    - Ensure you are using the Lisbon timezone
>    - All sessions on Tuesday 4th June will be streamed using:
>       - *SESSION PRESENTATIONS LINK <https://meet.jit.si/XenSummit24Main>=
*
>       .
>    - All sessions on Wednesday 5th June and Thursday 6th June will use
>    the following links:
>    - *DESIGN SESSION A <https://meet.jit.si/XenDesignSessionsA> *(Liberda=
de
>       Room)
>       - *DESIGN SESSION B <https://meet.jit.si/XenDesignSessionsB> *(Augu=
sta
>       Room)
>       - Please look out on the schedule for the time and which session
>       room it takes place in
>
>
>    - Thursday design sessions will be finalized on the schedule by the
>    end of day on Wednesday
>    - The same links will be used throughout talks and sessions
>    - (Optional) Join our Xen Summit matrix channel for updates on the
>    day: https://matrix.to/#/#xen-project-summit:matrix.org
>
> *Some ground rules to follow:*
>
>    - Enter your full name on Jitsi so everyone knows who you are
>    - Please mute yourself upon joining
>    - Turning on cameras is optional, but we encourage doing this for
>    design sessions
>    - Do *not* shout out your questions during session presentations,
>    instead ask these on the chat function and we will do our best to ask =
on
>    behalf of you
>    - During design sessions, we encourage you to unmute and participate
>    freely
>    - If multiple people wish to speak, please use the 'raise hand'
>    function on Jitsi or chat
>    - Should there be a need, moderators will have permission to remove
>    anyone who is disruptive in sessions on Jitsi
>    - If you face issues on the day, please let us know via Matrix - we
>    will do our best to help, but please note this is a community effort
>
> *Jitsi links:*
>
> Session presentation link:
>
> https://meet.jit.si/XenSummit24Main
>
> Design Session A (Liberdade Room) link:
> https://meet.jit.si/XenDesignSessionsA
>
> Design Session B (Augusta Room) link:
> https://meet.jit.si/XenDesignSessionsB
>
> See meeting dial-in numbers:
> https://meet.jit.si/static/dialInInfo.html?room=3DXenSummit24Main
>
> If also dialing-in through a room phone, join without connecting to audio=
:
> https://meet.jit.si/XenSummit24Main#config.startSilent=3Dtrue
>
> See meeting dial-in numbers:
> https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsA
>
> If also dialing-in through a room phone, join without connecting to audio=
:
> https://meet.jit.si/XenDesignSessionsA#config.startSilent=3Dtrue
>
> See meeting dial-in numbers:
> https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB
>
> If also dialing-in through a room phone, join without connecting to audio=
:
> https://meet.jit.si/XenDesignSessionsB#config.startSilent=3Dtrue
>
> Schedule Example:
>
> Tuesday 4th & Wednesday 5th June 2024
>
> (Lisbon timezone)
>
> Schedule Example: Wednesday 5th & Thursday 6th June 2024
>
> (Lisbon timezone)
>
> Schedule Example:  Wednesday 5th & Thursday 6th June 2024
>
> (Lisbon timezone)
>
> 09:00
> Welcome & Opening Remarks - Kelly Choi, Community Manager, Cloud Software
> Group, XenServer
>
> 09:10
>
> Xen Project 2024 Weather Report - Kelly Choi, XenServer, Cloud Software
> Group.
>
> LIBERDADE I
>
> 09:10
>
> Challenges and Status of Enabling TrenchBoot in Xen Hypervisor - Micha=C5=
=82
> =C5=BBygowski & Piotr Kr=C3=B3l, 3mdeb
>
> 13:45
>
> The future of Xen Project physical events
> <https://design-sessions.xenproject.org/uid/discussion/disc_OlJce1uK3uI0O=
jS2cL55/view>
>
> LIBERDADE I
>
> 14:35
>
> IOMMU paravirtualization and Xen IOMMU subsystem rework
> <https://design-sessions.xenproject.org/uid/discussion/disc_PEgBNIXMyEkdJ=
oysE27O/view>
>
> LIBERDADE I
> 09:10
>
> Using Xenalyze for Performance Analysis - George Dunlap, Xen ServerAUGUST=
A
> I
>
>
>
>
>
> 13:45
>
> Downstream working group
> <https://design-sessions.xenproject.org/uid/discussion/disc_z78Lt2EIZt2qx=
aS3FSlQ/view>
>
> AUGUSTA I
>
> 14:35
>
> Xen Safety Requirements upstreaming
> <https://design-sessions.xenproject.org/uid/discussion/disc_01JE9EOi9zxxA=
U8lfB6Z/view>
>
> AUGUSTA I
>
>
>
> *How to filter the schedule:*
>
>
> *FAQs:*
>
>    - *My company would like to sponsor the next Xen Summit, how do I get
>    involved?*
>       - *Please email *@communitymanager
>       <community.manager@xenproject.org>* with your interest *
>    - *Are sessions recorded?*
>       - *Yes, all talks are recorded and will be available on YouTube
>       after the event. Design sessions on Day 3 are not recorded. *
>    - *Can I write about my experience at Xen Summit?*
>       - *Yes! We encourage the community to spread the word through
>       social media. Please tag us on X or LinkedIn so that we can reshare=
. *
>    -
> *Can we see the presenter's slides? *
>       - *Some presenters may have uploaded their slides in advance. If
>       available, you can view these by clicking on each session in the sc=
reenshot
>       above. *
>
> We look forward to seeing you there, both virtually and physically!
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>

--0000000000009e942a061a0ccf36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,</div><div dir=3D"ltr"><br></div><=
div dir=3D"ltr">Don&#39;t forget to join us today using Jitsi for Xen Summi=
t!=C2=A0</div><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Ch=
oi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Community=
 Manager</div><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></=
div></div></div></div></div><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, May 31, 2024 at 11:15=E2=80=AFAM Ke=
lly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Hello Xen Community,=C2=A0<div><br></div><div>Join us virtua=
lly at Xen Summit (4-6th June), for free using=C2=A0Jitsi!=C2=A0</div><div>=
<br></div><div>We want to encourage as many of you to participate in the Xe=
n Summit as possible. Just because you are not physically attending, doesn&=
#39;t mean you can&#39;t get involved.=C2=A0</div><div><i>(Please note, the=
re will be no professional AV or audio equipment, and it is a community eff=
ort to enable others to get involved.)=C2=A0</i></div><div><br></div><div>O=
n the day, please find the=C2=A0<a href=3D"https://events.linuxfoundation.o=
rg/xen-project-summit/program/schedule/" target=3D"_blank"><b>schedule=C2=
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
div><div><span id=3D"m_-1299433891387361475m_-3807238046455862930m_30172008=
69748370048gmail-docs-internal-guid-f9217878-7fff-07f7-1772-78aa156120b2"><=
div dir=3D"ltr" align=3D"left" style=3D"margin-left:0pt"><table style=3D"bo=
rder:none;border-collapse:collapse"><colgroup><col width=3D"208"><col width=
=3D"208"><col width=3D"208"></colgroup><tbody><tr style=3D"height:58.5pt"><=
td style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0=
,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D=
"line-height:1.728;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Session pre=
sentation link:</span></p><p dir=3D"ltr" style=3D"line-height:1.728;margin-=
top:0pt;margin-bottom:0pt"><a href=3D"https://meet.jit.si/XenSummit24Main" =
style=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-s=
ize:11pt;font-family:Arial,sans-serif;background-color:transparent;font-wei=
ght:700;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;text-decoration-line:underline;vertical-align:baseli=
ne">https://meet.jit.si/XenSummit24Main</span></a><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:700;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-variant-alternates:normal;vertical-align:baseline">=C2=A0</span><=
/p></td><td style=3D"border-width:0.681818pt;border-style:solid;border-colo=
r:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr"=
 style=3D"line-height:1.728;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:700;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=
Design Session A (Liberdade Room) link:=C2=A0</span><a href=3D"https://meet=
.jit.si/XenDesignSessionsA" style=3D"text-decoration-line:none" target=3D"_=
blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgroun=
d-color:transparent;font-weight:700;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-variant-alternates:normal;text-decoration-line:und=
erline;vertical-align:baseline">https://meet.jit.si/XenDesignSessionsA</spa=
n></a></p></td><td style=3D"border-width:0.681818pt;border-style:solid;bord=
er-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=
=3D"ltr" style=3D"line-height:1.728;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:700;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-variant-alternates:normal;vertical-align:base=
line">Design Session B (Augusta Room) link:=C2=A0</span><a href=3D"https://=
meet.jit.si/XenDesignSessionsB" style=3D"text-decoration-line:none" target=
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
n:baseline">See meeting dial-in numbers:=C2=A0</span><a href=3D"https://mee=
t.jit.si/static/dialInInfo.html?room=3DXenSummit24Main" style=3D"text-decor=
ation-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font-famil=
y:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-variant-alternates:normal;text-decorat=
ion-line:underline;vertical-align:baseline">https://meet.jit.si/static/dial=
InInfo.html?room=3DXenSummit24Main</span></a><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">=C2=A0</span></p><br><p dir=3D"ltr" style=3D"line-he=
ight:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial,sans-serif;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ve=
rtical-align:baseline">If also dialing-in through a room phone, join withou=
t connecting to audio:=C2=A0</span><a href=3D"https://meet.jit.si/XenSummit=
24Main#config.startSilent=3Dtrue" style=3D"text-decoration-line:none" targe=
t=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;text-decoration-line:underline;ver=
tical-align:baseline">https://meet.jit.si/XenSummit24Main#config.startSilen=
t=3Dtrue</span></a><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;font-variant-alternates:normal;vertical-align:baseline">=C2=
=A0</span></p></td><td style=3D"border-width:0.681818pt;border-style:solid;=
border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p =
dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;vertical-align:baseline">See meeting dial-in numb=
ers:=C2=A0</span><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=
=3DXenDesignSessionsA" style=3D"text-decoration-line:none" target=3D"_blank=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;text-decoration-line:underline;vertical-align=
:baseline">https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessi=
onsA</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.656;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
">If also dialing-in through a room phone, join without connecting to audio=
:=C2=A0</span><a href=3D"https://meet.jit.si/XenDesignSessionsA#config.star=
tSilent=3Dtrue" style=3D"text-decoration-line:none" target=3D"_blank"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-var=
iant-alternates:normal;text-decoration-line:underline;vertical-align:baseli=
ne">https://meet.jit.si/XenDesignSessionsA#config.startSilent=3Dtrue</span>=
</a></p></td><td style=3D"border-width:0.681818pt;border-style:solid;border=
-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D=
"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;font-varian=
t-alternates:normal;vertical-align:baseline">See meeting dial-in numbers:=
=C2=A0</span><a href=3D"https://meet.jit.si/static/dialInInfo.html?room=3DX=
enDesignSessionsB" style=3D"text-decoration-line:none" target=3D"_blank"><s=
pan style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;font-=
variant-alternates:normal;text-decoration-line:underline;vertical-align:bas=
eline">https://meet.jit.si/static/dialInInfo.html?room=3DXenDesignSessionsB=
</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-se=
rif;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;vertical-align:baseline">If=
 also dialing-in through a room phone, join without connecting to audio:=C2=
=A0</span><a href=3D"https://meet.jit.si/XenDesignSessionsB#config.startSil=
ent=3Dtrue" style=3D"text-decoration-line:none" target=3D"_blank"><span sty=
le=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;font-variant=
-alternates:normal;text-decoration-line:underline;vertical-align:baseline">=
https://meet.jit.si/XenDesignSessionsB#config.startSilent=3Dtrue</span></a>=
</p></td></tr><tr style=3D"height:82.5pt"><td style=3D"border-width:0.68181=
8pt;border-style:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5=
pt;overflow:hidden"><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;background-color:transparent;font-weight:700;font-style:italic;font-va=
riant-numeric:normal;font-variant-east-asian:normal;font-variant-alternates=
:normal;vertical-align:baseline">Schedule Example:=C2=A0</span></p><p dir=
=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-style:italic;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">Tuesday 4=
th &amp; Wednesday 5th June 2024</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial,sans-serif;background-color:transparent;font-style:italic;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alt=
ernates:normal;vertical-align:baseline">(Lisbon timezone)</span></p></td><t=
d style=3D"border-width:0.681818pt;border-style:solid;border-color:rgb(0,0,=
0);vertical-align:top;padding:5pt;overflow:hidden"><p dir=3D"ltr" style=3D"=
line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial,sans-serif;background-color:transparent;font-weigh=
t:700;font-style:italic;font-variant-numeric:normal;font-variant-east-asian=
:normal;font-variant-alternates:normal;vertical-align:baseline">Schedule Ex=
ample:=C2=A0</span><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;background-color:transparent;font-style:italic;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">Wednesday 5th &amp; Thursday 6th June 2024</span></p><p dir=
=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial,sans-serif;background-color:tran=
sparent;font-style:italic;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-variant-alternates:normal;vertical-align:baseline">(Lisbon t=
imezone)</span></p></td><td style=3D"border-width:0.681818pt;border-style:s=
olid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden=
"><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-co=
lor:transparent;font-weight:700;font-style:italic;font-variant-numeric:norm=
al;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-a=
lign:baseline">Schedule Example:=C2=A0=C2=A0</span><span style=3D"font-size=
:11pt;font-family:Arial,sans-serif;background-color:transparent;font-style:=
italic;font-variant-numeric:normal;font-variant-east-asian:normal;font-vari=
ant-alternates:normal;vertical-align:baseline">Wednesday 5th &amp; Thursday=
 6th June 2024</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,s=
ans-serif;background-color:transparent;font-style:italic;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-variant-alternates:normal;ver=
tical-align:baseline">(Lisbon timezone)</span></p><br></td></tr><tr style=
=3D"height:201.75pt"><td style=3D"border-width:0.681818pt;border-style:soli=
d;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:hidden"><=
h3 style=3D"box-sizing:border-box;font-family:Inter,&quot;Avenir Next&quot;=
,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-=
serif;font-weight:inherit;line-height:1.1;margin:17px 0px 0px;padding:0px;b=
order:0px;outline:0px;font-size:14px;vertical-align:baseline;clear:left;col=
or:rgb(153,153,153);float:left;text-align:right;width:90px;zoom:1">09:00</h=
3><div style=3D"box-sizing:border-box;padding:0px;border-width:0px 0px 0px =
1px;border-top-style:initial;border-right-style:initial;border-bottom-style=
:initial;border-left-style:solid;border-top-color:initial;border-right-colo=
r:initial;border-bottom-color:initial;border-left-color:rgba(0,0,0,0.1);out=
line:0px;font-size:16px;font-family:Inter,&quot;Avenir Next&quot;,&quot;Hel=
vetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-serif;vert=
ical-align:baseline;color:rgb(51,51,51)"><div style=3D"box-sizing:border-bo=
x;margin:0px;padding:10px 0px 5px 15px;border:0px;outline:0px;font-weight:i=
nherit;font-family:inherit;vertical-align:baseline"><span style=3D"box-sizi=
ng:border-box;margin:0px 12px 12px 0px;padding:0px;border-width:1px;border-=
style:solid;border-color:transparent rgba(0,0,0,0.15) rgba(0,0,0,0.15) tran=
sparent;outline:0px;font-weight:inherit;font-family:inherit;vertical-align:=
baseline;background-color:rgb(166,237,231);border-radius:4px;display:block;=
float:left"><a href=3D"https://xenprojectsummit2024.sched.com/event/1bCKF/w=
elcome-opening-remarks-kelly-choi-community-manager-cloud-software-group-xe=
nserver?iframe=3Dyes&amp;w=3D100%&amp;sidebar=3Dyes&amp;bg=3Dno" id=3D"m_-1=
299433891387361475gmail-69e373000a4da4d8e181cc54aa83e898" style=3D"box-sizi=
ng:border-box;text-decoration-line:none;margin:0px;padding:6px 10px 7px;bor=
der:0px;outline:0px;font-size:15px;font-family:inherit;vertical-align:basel=
ine;color:rgb(0,0,0);border-bottom-right-radius:3px;border-top-right-radius=
:3px;float:left;line-height:1.2;min-height:32px" target=3D"_blank">Welcome =
&amp; Opening Remarks - Kelly Choi, Community Manager, Cloud Software Group=
, XenServer<span style=3D"box-sizing:border-box;margin:5px 0px 0px;padding:=
0px;border:0px;outline:0px;font-size:12px;font-family:inherit;vertical-alig=
n:baseline;text-transform:uppercase;clear:left;display:none;opacity:0.8"></=
span></a></span></div></div><br><p dir=3D"ltr" style=3D"line-height:1.656;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-variant-alternates:normal;vertical-align=
:baseline">09:10=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.656;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;font-variant-alternates:normal;vertical-alig=
n:baseline">Xen Project 2024 Weather Report - Kelly Choi, XenServer, Cloud =
Software Group.</span></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,=
sans-serif;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;font-variant-alternates:normal;vertical-align:basel=
ine">LIBERDADE I</span></p><br></td><td style=3D"border-width:0.681818pt;bo=
rder-style:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;ove=
rflow:hidden"><h3 style=3D"box-sizing:border-box;font-family:Inter,&quot;Av=
enir Next&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvet=
ica,Arial,sans-serif;font-weight:inherit;line-height:1.1;margin:17px 0px 0p=
x;padding:0px;border:0px;outline:0px;font-size:14px;vertical-align:baseline=
;clear:left;color:rgb(153,153,153);float:left;text-align:right;width:90px;z=
oom:1">09:10=C2=A0</h3><p dir=3D"ltr" style=3D"line-height:1.656;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-variant-alternates:normal;vertical-align:baseline=
"></span></p><div style=3D"box-sizing:border-box;padding:0px;border-width:0=
px 0px 0px 1px;border-top-style:initial;border-right-style:initial;border-b=
ottom-style:initial;border-left-style:solid;border-top-color:initial;border=
-right-color:initial;border-bottom-color:initial;border-left-color:rgba(0,0=
,0,0.1);outline:0px;font-size:16px;font-family:Inter,&quot;Avenir Next&quot=
;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans=
-serif;vertical-align:baseline;color:rgb(51,51,51)"><div style=3D"box-sizin=
g:border-box;margin:0px;padding:10px 0px 5px 15px;border:0px;outline:0px;fo=
nt-weight:inherit;font-family:inherit;vertical-align:baseline"><span style=
=3D"box-sizing:border-box;margin:0px 12px 12px 0px;padding:0px;border-width=
:1px;border-style:solid;border-color:transparent rgba(0,0,0,0.15) rgba(0,0,=
0,0.15) transparent;outline:0px;font-weight:inherit;font-family:inherit;ver=
tical-align:baseline;background-color:rgb(109,209,61);border-radius:4px;dis=
play:block;float:left"><a href=3D"https://xenprojectsummit2024.sched.com/ev=
ent/1bCFO/challenges-and-status-of-enabling-trenchboot-in-xen-hypervisor-mi=
chal-zygowski-piotr-krol-3mdeb?iframe=3Dyes&amp;w=3D100%&amp;sidebar=3Dyes&=
amp;bg=3Dno" id=3D"m_-1299433891387361475gmail-875c64b7afbdbd049318b5585b91=
20f8" style=3D"box-sizing:border-box;text-decoration-line:none;margin:0px;p=
adding:6px 10px 7px;border:0px;outline:0px;font-size:15px;font-family:inher=
it;vertical-align:baseline;color:rgb(0,0,0);border-bottom-right-radius:3px;=
border-top-right-radius:3px;float:left;line-height:1.2;min-height:32px" tar=
get=3D"_blank">Challenges and Status of Enabling TrenchBoot in Xen Hypervis=
or - Micha=C5=82 =C5=BBygowski &amp; Piotr Kr=C3=B3l, 3mdeb<span style=3D"b=
ox-sizing:border-box;margin:5px 0px 0px;padding:0px;border:0px;outline:0px;=
font-size:12px;font-family:inherit;vertical-align:baseline;text-transform:u=
ppercase;clear:left;display:none;opacity:0.8"></span></a></span></div></div=
><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;f=
ont-variant-alternates:normal;vertical-align:baseline">13:45=C2=A0</span></=
p><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0p=
t"><a href=3D"https://design-sessions.xenproject.org/uid/discussion/disc_Ol=
Jce1uK3uI0OjS2cL55/view" style=3D"text-decoration-line:none" target=3D"_bla=
nk"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norm=
al;text-decoration-line:underline;vertical-align:baseline">The future of Xe=
n Project physical events</span></a></p><p dir=3D"ltr" style=3D"line-height=
:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;vertic=
al-align:baseline">LIBERDADE I</span></p><br><p dir=3D"ltr" style=3D"line-h=
eight:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial,sans-serif;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-variant-alternates:normal;v=
ertical-align:baseline">14:35=C2=A0</span></p><p dir=3D"ltr" style=3D"line-=
height:1.656;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://design-se=
ssions.xenproject.org/uid/discussion/disc_PEgBNIXMyEkdJoysE27O/view" style=
=3D"text-decoration-line:none" target=3D"_blank"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;font-variant-alternates:normal;text-decoration-line:underl=
ine;vertical-align:baseline">IOMMU paravirtualization and Xen IOMMU subsyst=
em rework</span></a></p><p dir=3D"ltr" style=3D"line-height:1.656;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-variant-alternates:normal;vertical-align:baselin=
e">LIBERDADE I</span></p></td><td style=3D"border-width:0.681818pt;border-s=
tyle:solid;border-color:rgb(0,0,0);vertical-align:top;padding:5pt;overflow:=
hidden"><h3 style=3D"box-sizing:border-box;font-family:Inter,&quot;Avenir N=
ext&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetica,Ar=
ial,sans-serif;font-weight:inherit;line-height:1.1;margin:17px 0px 0px;padd=
ing:0px;border:0px;outline:0px;font-size:14px;vertical-align:baseline;clear=
:left;color:rgb(153,153,153);text-align:right;width:90px;zoom:1">09:10=C2=
=A0</h3><p dir=3D"ltr" style=3D"line-height:1.656;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;font-variant-alternates:normal;vertical-align:baseline"><span style=
=3D"box-sizing:border-box;margin:0px 12px 12px 0px;padding:0px;border-width=
:1px;border-style:solid;border-color:transparent rgba(0,0,0,0.15) rgba(0,0,=
0,0.15) transparent;outline:0px;font-size:16px;font-family:Inter,&quot;Aven=
ir Next&quot;,&quot;Helvetica Neue&quot;,&quot;Lucida Grande&quot;,Helvetic=
a,Arial,sans-serif;vertical-align:baseline;background-color:rgb(109,209,61)=
;border-radius:4px;display:block;float:left;color:rgb(51,51,51)"><a href=3D=
"https://xenprojectsummit2024.sched.com/event/1bCFR/using-xenalyze-for-perf=
ormance-analysis-george-dunlap-xen-server?iframe=3Dyes&amp;w=3D100%&amp;sid=
ebar=3Dyes&amp;bg=3Dno" id=3D"m_-1299433891387361475gmail-0cf68d8b5cd7b1b5c=
490b568c76b39f5" style=3D"box-sizing:border-box;text-decoration-line:none;m=
argin:0px;padding:6px 10px 7px;border:0px;outline:0px;font-size:15px;font-f=
amily:inherit;vertical-align:baseline;color:rgb(0,0,0);border-bottom-right-=
radius:3px;border-top-right-radius:3px;float:left;line-height:1.2;min-heigh=
t:32px" target=3D"_blank">Using Xenalyze for Performance Analysis - George =
Dunlap, Xen Server<span style=3D"box-sizing:border-box;margin:5px 0px 0px;p=
adding:0px;border:0px;outline:0px;font-size:12px;font-family:inherit;vertic=
al-align:baseline;text-transform:uppercase;clear:left;display:none;opacity:=
0.8">AUGUSTA I</span></a></span><br></span></p><p dir=3D"ltr" style=3D"line=
-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial,sans-serif;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;font-variant-alternates:normal=
;vertical-align:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial,sans-serif;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;font-variant-alternates:normal;verti=
cal-align:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.65=
6;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-variant-alternates:normal;vertical-al=
ign:baseline"><br></span></p><p dir=3D"ltr" style=3D"line-height:1.656;marg=
in-top:0pt;margin-bottom:0pt"><br></p><p dir=3D"ltr" style=3D"line-height:1=
.656;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial,sans-serif;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;font-variant-alternates:normal;vertical=
-align:baseline">13:45=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:=
1.656;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://design-sessions.=
xenproject.org/uid/discussion/disc_z78Lt2EIZt2qxaS3FSlQ/view" style=3D"text=
-decoration-line:none" target=3D"_blank"><span style=3D"font-size:11pt;font=
-family:Arial,sans-serif;font-variant-numeric:normal;font-variant-east-asia=
n:normal;font-variant-alternates:normal;text-decoration-line:underline;vert=
ical-align:baseline">Downstream working group</span></a></p><p dir=3D"ltr" =
style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial,sans-serif;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;font-variant-alte=
rnates:normal;vertical-align:baseline">AUGUSTA I</span></p><br><p dir=3D"lt=
r" style=3D"line-height:1.656;margin-top:0pt;margin-bottom:0pt"><span style=
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
iv><span id=3D"m_-1299433891387361475m_-3807238046455862930m_30172008697483=
70048m_2927081184909999839m_-8370998895675947915gmail-docs-internal-guid-7c=
024368-7fff-f910-ae50-70b83521ee30"><div><br></div><b><u>How to filter the =
schedule:</u></b><br><span style=3D"border:none;display:inline-block;overfl=
ow:hidden;width:624px;height:411px"><img src=3D"https://lh7-us.googleuserco=
ntent.com/nJqdiQUkRhper7xaNfEg5kdR7Jsn_7Mb7Muwgz_IaImd4-ZOK0D5o9_jypDXHX2yb=
CsevBnzCISatQZxOIu5eEkBWWsYjYpXNCTw3khSi5qySJoq7hzZ5HPsoLxAJOQ5KjEzJXfvgVnL=
c4s_53AqXuE" width=3D"624" height=3D"411" style=3D"outline: 0px; margin-lef=
t: 0px; margin-top: 0px;"></span></span><br></div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div><b><u>FAQs:</u>=
</b></div><div><ul><li><b>My company would like to sponsor the next Xen Sum=
mit, how do I get involved?</b></li><ul><li><i>Please email=C2=A0</i><a cla=
ss=3D"gmail_plusreply" id=3D"m_-1299433891387361475m_8251240063996215973plu=
sReplyChip-1" href=3D"mailto:community.manager@xenproject.org" target=3D"_b=
lank">@communitymanager</a><i>=C2=A0with your interest=C2=A0</i></li></ul><=
li><b>Are sessions recorded?</b></li><ul><li><i>Yes, all talks are recorded=
 and will be available=C2=A0on YouTube after the event. Design sessions on =
Day 3 are not recorded.=C2=A0</i></li></ul><li><b>Can I write about my expe=
rience at Xen Summit?</b></li><ul><li><i>Yes! We encourage the community to=
 spread the word through social media. Please tag us on X or LinkedIn so th=
at we can reshare.=C2=A0</i></li></ul><li><i><b>Can we see the presenter&#3=
9;s slides?</b><br></i></li><ul><li><i>Some presenters may have uploaded th=
eir slides in advance. If available, you can view these by clicking on each=
 session in the screenshot above.=C2=A0</i></li></ul></ul></div><div>We loo=
k forward to seeing you there, both virtually and physically!</div><div><br=
></div></div></div></div><div><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><=
div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=
=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></=
div></div>
</blockquote></div></div>

--0000000000009e942a061a0ccf36--

