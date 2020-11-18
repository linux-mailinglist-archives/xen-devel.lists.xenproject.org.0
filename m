Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE32B8041
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30034.59748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPDY-00021a-QX; Wed, 18 Nov 2020 15:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30034.59748; Wed, 18 Nov 2020 15:17:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPDY-00021B-Mf; Wed, 18 Nov 2020 15:17:56 +0000
Received: by outflank-mailman (input) for mailman id 30034;
 Wed, 18 Nov 2020 15:17:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMMN=EY=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1kfPDW-000210-GH
 for xen-devel@lists.xen.org; Wed, 18 Nov 2020 15:17:54 +0000
Received: from mail-ua1-x92c.google.com (unknown [2607:f8b0:4864:20::92c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daf8d629-c3ee-41d7-8ea4-6c26c984edc5;
 Wed, 18 Nov 2020 15:17:53 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id q68so783575uaq.3
 for <xen-devel@lists.xen.org>; Wed, 18 Nov 2020 07:17:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uMMN=EY=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
	id 1kfPDW-000210-GH
	for xen-devel@lists.xen.org; Wed, 18 Nov 2020 15:17:54 +0000
X-Inumbo-ID: daf8d629-c3ee-41d7-8ea4-6c26c984edc5
Received: from mail-ua1-x92c.google.com (unknown [2607:f8b0:4864:20::92c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id daf8d629-c3ee-41d7-8ea4-6c26c984edc5;
	Wed, 18 Nov 2020 15:17:53 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id q68so783575uaq.3
        for <xen-devel@lists.xen.org>; Wed, 18 Nov 2020 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=AifqwwU6opvqQ+dbP3YRrILce8AKsWgnI+JIoG1/g0g=;
        b=VYG+6N7P+JQKeCBD9r4Rn97ZPiyiWhmsp9hCD7gWSDuKQVTQDyQCIIgdPb5V3fHtXJ
         uQTufJ82yi/CR+pi7c3VbjcQN+Ledd3/0WURV3T7NXjatPRCgfm660/OD9RwQ7OxSpdQ
         oL7k4vLeiJlvNXdEvrYuaJ0lhEfOS+seGLYeV6PCrMk6Yof1+Ds70qInARxuUo95QNBS
         ht//r/PXBVrs6zNaqFfHxqxvpV6PKnTPa4rZYvUluH9UpPuDXwEekTO0khXNTrbXkV/W
         HUEbVpAZL1CNJhXfTi4H7kR8tJ/CmJ5Ywu1woNwq2DwfiCM05zJMJo+iF8MCCI7W7it4
         36qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=AifqwwU6opvqQ+dbP3YRrILce8AKsWgnI+JIoG1/g0g=;
        b=FSv+4WsBYdDu/Oz56PeSFPyg16YF9wr8ScbIcGswTYNmzTawAOGImDBefj4GxPg5z4
         gOVHeVrUo94BLv680QCXa8z4ezyFslhP2byBRPJUJkwz1E4LI3kq1ieC6OepcdC9sQZc
         ojKBz9QaqyHICBNUFTCpETA2+Ck0iGLj8pzn7COsQeQyxKuvHoN+OJih+JYpTLZNnkUK
         qwroLDS9j1Esxykcq3cjg5UAXEeHVdjhRn37K2hdUI3JAg4rdagqqUhD0mPqdsDnnt4B
         do902MyezFA3UCa6jfA5kiymCoYQ+nshnA3QJNXP5dBJHyBvhdNY1k+n68Zd5KrbatV+
         odGA==
X-Gm-Message-State: AOAM5301pLFv1u4klErVrCAPu6eVxyzfd0ElsypswN016ov9XL8DuFXx
	Z8OR4YhQU15uNviTsoGcEzgQmgRVfk2p1U9bcmnkEO+3BnwpueBi
X-Google-Smtp-Source: ABdhPJxXSHfeaUd3SLJ956z1ZIY2oKEFuGexNNAX13RANWFzh8SjDYKbexe4S0QrZgulHURmm7IcEhp9uRZSQcrqniQ=
X-Received: by 2002:ab0:6994:: with SMTP id t20mr3586689uaq.111.1605712672482;
 Wed, 18 Nov 2020 07:17:52 -0800 (PST)
MIME-Version: 1.0
References: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
 <CACJ1ZNupvRX_fcGPWn3mm+3Lm4gT38M088tUc_sSUu8JeQg3Fg@mail.gmail.com> <CACJ1ZNu5Kdf72j1eTtdgTuSOjgkpeEWFM0cKB-54pxqwXuWCDQ@mail.gmail.com>
In-Reply-To: <CACJ1ZNu5Kdf72j1eTtdgTuSOjgkpeEWFM0cKB-54pxqwXuWCDQ@mail.gmail.com>
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Wed, 18 Nov 2020 16:17:41 +0100
Message-ID: <CACJ1ZNtfgNr9oz7stE=2iwijjAUtZLWR2u_xihFZeEk3Y7gYRQ@mail.gmail.com>
Subject: Re: Schedule for OpenPOWER/Xen meeting
To: "<xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000746d0105b4631da0"

--000000000000746d0105b4631da0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

So I managed to get an agenda with basic questions. The meeting is at the
planned time (Nov the 19th, at 3PM central time, which is 9PM in UK and
10PM in Europe).

Meeting place will be: https://ibm.webex.com/meet/mendy

Don't forget to ping your colleagues/friends that aren't watching this
mailing list actively, so they won't miss the meeting :)

See you tomorrow!

Olivier.

Le jeu. 12 nov. 2020 =C3=A0 21:44, Olivier Lambert <lambert.olivier@gmail.c=
om> a
=C3=A9crit :

> Okay so before having the meeting webex/whatever link, I think it would b=
e
> more efficient to plan a kind of agenda, something we can pass to the
> OpenPOWER team in the next few days. This way, they could have some answe=
rs
> ready, allowing us to explore more things interactively during the meetin=
g.
>
> Feel free to participate in this thread (even if you won't be at the
> meeting!), so we can gather and then organize a bit of what we'd like to
> know/discuss during this meeting.
>
> So go ahead and start to throw questions :)
>
>
> Thanks,
>
> OIivier.
>
>
> Le jeu. 12 nov. 2020 =C3=A0 09:26, Olivier Lambert <lambert.olivier@gmail=
.com>
> a =C3=A9crit :
>
>> Thanks to everyone who participated in the poll. Due to the limited
>> number of answers, I think it's wiser to go for the second option (Thurs=
day
>> the 19th), because everyone who already answered seems available that da=
y.
>> I'll confirm that to OpenPOWER. When it's confirmed, I'll do a recap her=
e
>> ideally with the meeting place.
>>
>> Thanks,
>>
>> Olivier.
>>
>>
>> Le mar. 10 nov. 2020 =C3=A0 13:41, Olivier Lambert <lambert.olivier@gmai=
l.com>
>> a =C3=A9crit :
>>
>>> Hi everyone,
>>>
>>> We got 2 potential dates for the initial tech meeting with at least one
>>> OpenPOWER expert, so we can discuss the effort needed to port Xen on th=
is
>>> architecture.
>>>
>>> Because of time zones (on OpenPower side, there's one guy in Australia)=
,
>>> we got 2 possible schedules in November:
>>>
>>> 1. 3pm CT on this Thursday the 12th (! this week)
>>> 2. Or next week Thursday the 19th
>>>
>>> I made a doodle-like so everyone can vote on their preferred schedule:
>>> https://framadate.org/QQu5rYEOEYr4ZHc4
>>>
>>> Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me if I'=
m
>>> wrong.
>>>
>>> Reminder: the Cryptpad of the last Xen Community meeting contains the
>>> list of people interested. If you are aware of someone interested that
>>> could miss this email on this devel list, feel free to forward it. Cryp=
tpad
>>> link: https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/
>>>
>>> Thank you and see you soon!
>>>
>>> Olivier.
>>>
>>

--000000000000746d0105b4631da0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div><br></div><div>So I managed to get an a=
genda with basic questions. The meeting is at the planned time (Nov the 19t=
h, at 3PM central time, which is 9PM in UK and 10PM in Europe).</div><div><=
br></div><div>Meeting place will be: <a href=3D"https://ibm.webex.com/meet/=
mendy">https://ibm.webex.com/meet/mendy</a></div><div><br></div><div>Don&#3=
9;t forget to ping your colleagues/friends that aren&#39;t watching this ma=
iling list actively, so they won&#39;t miss the meeting :)</div><div><br></=
div><div>See you tomorrow!</div><div><br></div><div>Olivier.<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0jeu. 12 nov. 2020 =C3=A0=C2=A021:44, Olivier Lambert &lt;<a href=3D"mail=
to:lambert.olivier@gmail.com">lambert.olivier@gmail.com</a>&gt; a =C3=A9cri=
t=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Okay so before having the meeting webex/whatever link, I thi=
nk it would be more efficient to plan a kind of agenda, something we can pa=
ss to the OpenPOWER team in the next few days. This way, they could have so=
me answers ready, allowing us to explore more things interactively during t=
he meeting.</div><div><br></div><div>Feel free to participate in this threa=
d (even if you won&#39;t be at the meeting!), so we can gather and then org=
anize a bit of what we&#39;d like to know/discuss during this meeting.</div=
><div><br></div><div>So go ahead and start to throw questions :)<br></div><=
div><div><br></div><div><br></div><div>Thanks,</div><div><br></div><div>OIi=
vier.<br></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Le=C2=A0jeu. 12 nov. 2020 =C3=A0=C2=A009:26, Olivi=
er Lambert &lt;<a href=3D"mailto:lambert.olivier@gmail.com" target=3D"_blan=
k">lambert.olivier@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks to ev=
eryone who participated in the poll. Due to the limited number of answers, =
I think it&#39;s wiser to go for the second option (Thursday the 19th), bec=
ause everyone who already answered seems available that day. I&#39;ll confi=
rm that to OpenPOWER. When it&#39;s confirmed, I&#39;ll do a recap here ide=
ally with the meeting place.</div><div><br></div><div>Thanks,</div><div><br=
></div><div>Olivier.<br></div><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 10 nov. 2020 =C3=A0=C2=A013:=
41, Olivier Lambert &lt;<a href=3D"mailto:lambert.olivier@gmail.com" target=
=3D"_blank">lambert.olivier@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi =
everyone,</div><div><br></div><div>We got 2 potential dates for the initial=
 tech meeting with at least one OpenPOWER expert, so we can discuss the eff=
ort needed to port Xen on this architecture.</div><div><br></div><div>Becau=
se of time zones (on OpenPower side, there&#39;s one guy in Australia), we =
got 2 possible schedules in November:</div><div><br></div><div>1. 3pm CT on=
 this Thursday the 12th (! this week)<br></div><div>2. Or next week Thursda=
y the 19th</div><div><br></div><div>I made a doodle-like so everyone can vo=
te on their preferred schedule: <a href=3D"https://framadate.org/QQu5rYEOEY=
r4ZHc4" target=3D"_blank">https://framadate.org/QQu5rYEOEYr4ZHc4</a></div><=
div><br></div><div>Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But c=
orrect me if I&#39;m wrong.</div><div><br></div><div>Reminder: the Cryptpad=
 of the last Xen Community meeting contains the list of people interested. =
If you are aware of someone interested that could miss this email on this d=
evel list, feel free to forward it. Cryptpad link: <a href=3D"https://crypt=
pad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/" target=3D"_blank">https:=
//cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/</a></div><div><br>=
</div><div>Thank you and see you soon!</div><div><br></div><div>Olivier.<br=
></div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000746d0105b4631da0--

