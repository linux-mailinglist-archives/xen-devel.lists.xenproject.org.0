Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C232B0F2C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 21:45:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26043.54168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdJSS-0002PS-7L; Thu, 12 Nov 2020 20:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26043.54168; Thu, 12 Nov 2020 20:44:40 +0000
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
	id 1kdJSS-0002P4-1w; Thu, 12 Nov 2020 20:44:40 +0000
Received: by outflank-mailman (input) for mailman id 26043;
 Thu, 12 Nov 2020 20:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYe4=ES=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1kdJSQ-0002Oz-Eo
 for xen-devel@lists.xen.org; Thu, 12 Nov 2020 20:44:38 +0000
Received: from mail-vk1-xa34.google.com (unknown [2607:f8b0:4864:20::a34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27781b78-cd97-418b-a217-0eb5b57b7551;
 Thu, 12 Nov 2020 20:44:37 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id b190so1651114vka.0
 for <xen-devel@lists.xen.org>; Thu, 12 Nov 2020 12:44:37 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=AYe4=ES=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
	id 1kdJSQ-0002Oz-Eo
	for xen-devel@lists.xen.org; Thu, 12 Nov 2020 20:44:38 +0000
X-Inumbo-ID: 27781b78-cd97-418b-a217-0eb5b57b7551
Received: from mail-vk1-xa34.google.com (unknown [2607:f8b0:4864:20::a34])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27781b78-cd97-418b-a217-0eb5b57b7551;
	Thu, 12 Nov 2020 20:44:37 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id b190so1651114vka.0
        for <xen-devel@lists.xen.org>; Thu, 12 Nov 2020 12:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1Dv/sJJ3IkoBJcevrIhmR5U4he/z6g+Aj4JE4i0rih4=;
        b=ViarK4P6ndu5K7y9ppo+Ndl0Da2uyGzmA2EZiaaxjpDQ6r/BxLQLOZLFMAePwCKLUE
         pBaR9oPKd5Wju/H+5JgjEx915+9/dZcffml0bHYINGyHDVkuHgIic10nBfM6YQe0zD8g
         Kbc+xT4NulPZu8aLQPKCBx7XUsbr0Bbja2NiIQLl0VHvM2be3qnIcF043MW2xIBQBTyP
         E8mSjAts6RC4zblixtgMnZZERp16VC8c/3E71mUjk7WBbfl4fCIVWuyztUyHGiu+CY1s
         WIyS5/mlu5Eris8La+R4AHoNbP+rhUxA80KV69DvZ8aTy6h9P1W6PuCLBHOy7+r+zQ7a
         W0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1Dv/sJJ3IkoBJcevrIhmR5U4he/z6g+Aj4JE4i0rih4=;
        b=hSq1euPzUxk4izdvbAOGaclabow8TugW7UmrM8mvKEM2V9tqx9SO/Vq1lwI7vQh30q
         WiIAzY8MtTzFMAtDJSJffZQ7e4mhzAwzwBRnlrFBfYzqMZiSlXSqY3ZqgrkmGMKlbYmy
         grgPtE9kePF1LU2erLQtftvjDj1uCxBy6hvX6q5ma7KzMQe/0MsZiBYBJS0AQSQncxG9
         N+nV449yS+NeMiMQ64IsyBvIOa3HGLlYnwRT74GbyHz+gB7/doeoAPOGRvMKlrgmCOuD
         EtXDwRjgW+D1IDEn/uE6jcl8wQiGGtf7Xq1BQwPyBJib66sOOjm5kB3vIJk1eMeEpxCk
         wsAg==
X-Gm-Message-State: AOAM531FgC4eqLo4rqsfCxiy0LAroIxmAehi4Z+3LDRTZJO/qrKhsq/e
	/MUmHKl0BOg6rT9PXiQSbl6CoUP5qeh1K5+1Af7mWvvB/+G1RA==
X-Google-Smtp-Source: ABdhPJzFCEtn7ji7EZ5nECRND30Rnub41uq1wPqmPB+hOIwcim6cV41D48iIDwNeXNxsuM3jywta7ktbgRDaXJbmjho=
X-Received: by 2002:ac5:c952:: with SMTP id s18mr1078333vkm.5.1605213876474;
 Thu, 12 Nov 2020 12:44:36 -0800 (PST)
MIME-Version: 1.0
References: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
 <CACJ1ZNupvRX_fcGPWn3mm+3Lm4gT38M088tUc_sSUu8JeQg3Fg@mail.gmail.com>
In-Reply-To: <CACJ1ZNupvRX_fcGPWn3mm+3Lm4gT38M088tUc_sSUu8JeQg3Fg@mail.gmail.com>
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Thu, 12 Nov 2020 21:44:25 +0100
Message-ID: <CACJ1ZNu5Kdf72j1eTtdgTuSOjgkpeEWFM0cKB-54pxqwXuWCDQ@mail.gmail.com>
Subject: Re: Schedule for OpenPOWER/Xen meeting
To: "<xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000e5562105b3eefac8"

--000000000000e5562105b3eefac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Okay so before having the meeting webex/whatever link, I think it would be
more efficient to plan a kind of agenda, something we can pass to the
OpenPOWER team in the next few days. This way, they could have some answers
ready, allowing us to explore more things interactively during the meeting.

Feel free to participate in this thread (even if you won't be at the
meeting!), so we can gather and then organize a bit of what we'd like to
know/discuss during this meeting.

So go ahead and start to throw questions :)


Thanks,

OIivier.


Le jeu. 12 nov. 2020 =C3=A0 09:26, Olivier Lambert <lambert.olivier@gmail.c=
om> a
=C3=A9crit :

> Thanks to everyone who participated in the poll. Due to the limited numbe=
r
> of answers, I think it's wiser to go for the second option (Thursday the
> 19th), because everyone who already answered seems available that day. I'=
ll
> confirm that to OpenPOWER. When it's confirmed, I'll do a recap here
> ideally with the meeting place.
>
> Thanks,
>
> Olivier.
>
>
> Le mar. 10 nov. 2020 =C3=A0 13:41, Olivier Lambert <lambert.olivier@gmail=
.com>
> a =C3=A9crit :
>
>> Hi everyone,
>>
>> We got 2 potential dates for the initial tech meeting with at least one
>> OpenPOWER expert, so we can discuss the effort needed to port Xen on thi=
s
>> architecture.
>>
>> Because of time zones (on OpenPower side, there's one guy in Australia),
>> we got 2 possible schedules in November:
>>
>> 1. 3pm CT on this Thursday the 12th (! this week)
>> 2. Or next week Thursday the 19th
>>
>> I made a doodle-like so everyone can vote on their preferred schedule:
>> https://framadate.org/QQu5rYEOEYr4ZHc4
>>
>> Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me if I'm
>> wrong.
>>
>> Reminder: the Cryptpad of the last Xen Community meeting contains the
>> list of people interested. If you are aware of someone interested that
>> could miss this email on this devel list, feel free to forward it. Crypt=
pad
>> link: https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/
>>
>> Thank you and see you soon!
>>
>> Olivier.
>>
>

--000000000000e5562105b3eefac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Okay so before having the meeting webex/whatever link=
, I think it would be more efficient to plan a kind of agenda, something we=
 can pass to the OpenPOWER team in the next few days. This way, they could =
have some answers ready, allowing us to explore more things interactively d=
uring the meeting.</div><div><br></div><div>Feel free to participate in thi=
s thread (even if you won&#39;t be at the meeting!), so we can gather and t=
hen organize a bit of what we&#39;d like to know/discuss during this meetin=
g.</div><div><br></div><div>So go ahead and start to throw questions :)<br>=
</div><div><div><br></div><div><br></div><div>Thanks,</div><div><br></div><=
div>OIivier.<br></div><br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 12 nov. 2020 =C3=A0=C2=A009:26=
, Olivier Lambert &lt;<a href=3D"mailto:lambert.olivier@gmail.com">lambert.=
olivier@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks to everyone who =
participated in the poll. Due to the limited number of answers, I think it&=
#39;s wiser to go for the second option (Thursday the 19th), because everyo=
ne who already answered seems available that day. I&#39;ll confirm that to =
OpenPOWER. When it&#39;s confirmed, I&#39;ll do a recap here ideally with t=
he meeting place.</div><div><br></div><div>Thanks,</div><div><br></div><div=
>Olivier.<br></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">Le=C2=A0mar. 10 nov. 2020 =C3=A0=C2=A013:41, Olivier=
 Lambert &lt;<a href=3D"mailto:lambert.olivier@gmail.com" target=3D"_blank"=
>lambert.olivier@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi everyone,</=
div><div><br></div><div>We got 2 potential dates for the initial tech meeti=
ng with at least one OpenPOWER expert, so we can discuss the effort needed =
to port Xen on this architecture.</div><div><br></div><div>Because of time =
zones (on OpenPower side, there&#39;s one guy in Australia), we got 2 possi=
ble schedules in November:</div><div><br></div><div>1. 3pm CT on this Thurs=
day the 12th (! this week)<br></div><div>2. Or next week Thursday the 19th<=
/div><div><br></div><div>I made a doodle-like so everyone can vote on their=
 preferred schedule: <a href=3D"https://framadate.org/QQu5rYEOEYr4ZHc4" tar=
get=3D"_blank">https://framadate.org/QQu5rYEOEYr4ZHc4</a></div><div><br></d=
iv><div>Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me i=
f I&#39;m wrong.</div><div><br></div><div>Reminder: the Cryptpad of the las=
t Xen Community meeting contains the list of people interested. If you are =
aware of someone interested that could miss this email on this devel list, =
feel free to forward it. Cryptpad link: <a href=3D"https://cryptpad.fr/pad/=
#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/" target=3D"_blank">https://cryptpad.=
fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/</a></div><div><br></div><div>=
Thank you and see you soon!</div><div><br></div><div>Olivier.<br></div></di=
v>
</blockquote></div>
</blockquote></div>

--000000000000e5562105b3eefac8--

