Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A942A8479
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 18:11:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19945.45469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaim3-0005Bd-GJ; Thu, 05 Nov 2020 17:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19945.45469; Thu, 05 Nov 2020 17:10:11 +0000
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
	id 1kaim3-0005BE-Ch; Thu, 05 Nov 2020 17:10:11 +0000
Received: by outflank-mailman (input) for mailman id 19945;
 Thu, 05 Nov 2020 17:10:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dB6v=EL=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1kaim2-0005B9-5E
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:10:10 +0000
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d07617-8e2c-4002-9d6f-809dcf8c70dc;
 Thu, 05 Nov 2020 17:10:09 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id t20so1023270qvv.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:10:09 -0800 (PST)
Received: from [100.64.72.123] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id e186sm974816qkd.117.2020.11.05.09.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 09:10:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dB6v=EL=gmail.com=persaur@srs-us1.protection.inumbo.net>)
	id 1kaim2-0005B9-5E
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 17:10:10 +0000
X-Inumbo-ID: 40d07617-8e2c-4002-9d6f-809dcf8c70dc
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 40d07617-8e2c-4002-9d6f-809dcf8c70dc;
	Thu, 05 Nov 2020 17:10:09 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id t20so1023270qvv.8
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=1MfltUYu4JYwmtLM9x0pvlw+JF0xlahDh+KM1a24aic=;
        b=jahJVK41WT6o6pxs8NJeRMRUfna/GTPGrfJlajqI/QY3GA29NLhl4va3Gt9FrGnP2m
         V4GYtTSjaOqDNIe8OJrJKKxXQHE5VZmTMhKcI6FbeMy+Q7NzgEYqYZXRL571e6d9es5a
         7An7LZpKc2W9Y/XLT+IEZG8p/NDKxwwokKkdDDQHML8zqTjsoIEjbfK4EWV0D3hmLmO8
         HmSJmILdUtLfXx59CJReegXc/n6K6jHqMJ4uSq3NST/2mE5btuG6W4OdO3UE22FmtHsJ
         rvKGgrcLPJ3dhnqe2KVBYr6UaIbq5me0YfpHpeAEGusqHjvhRsZ2LMJdjsqh4wfbUwQS
         CinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=1MfltUYu4JYwmtLM9x0pvlw+JF0xlahDh+KM1a24aic=;
        b=J0HAR8x7YLNNRfbggmHiSkoerVYeswZViKdpVtoqa/E/1WHoCGEsHy86OJl1cqxKpr
         2ni2XVgpF/jfkTxWVexCeBmfRxonvD7If86cLjSiu65TUG7mleKaiHnafuIlt09Chp1w
         VbpbdGk4toz0302ON1APXi1CX24yY7WaXUHDjDRkn1o8X1WKuHtusdrHj1Ry1S/iNXwZ
         myqlb/s1HO6QwujdepQr5na+NrABt8pCcMpMzWfrXgBG6jNvHCqlNg6Y1910PsnpY4Xy
         SHM/JbhOgPWwcCHRMTxKDS/S3doFznwrffoOJ+HwLunmlioJYgvtjjzULgqkmE1kX9XD
         +DgQ==
X-Gm-Message-State: AOAM5335wmAtGkE+afA4s2ivdzw1COHOeWapCcHN0I1FoDiqo9w8+B6o
	XkS7ZAVui1j/xeG/WTpxO9naB1Y+Sbs=
X-Google-Smtp-Source: ABdhPJwp0H98O4ZUkioRarX30v5n+oA/aphQk+8XyC9rqbS4fCFdrsJvqTnJs8ueNbCO1RhCy8ppHg==
X-Received: by 2002:ad4:472c:: with SMTP id l12mr2981964qvz.42.1604596208784;
        Thu, 05 Nov 2020 09:10:08 -0800 (PST)
Received: from [100.64.72.123] ([173.245.215.240])
        by smtp.gmail.com with ESMTPSA id e186sm974816qkd.117.2020.11.05.09.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 09:10:08 -0800 (PST)
Content-Type: multipart/alternative; boundary=Apple-Mail-199D7F37-FF39-44C7-9AFD-02B8F8DB1304
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [ANNOUNCE] Call for agenda items for 5 November 2020 Community Call @ 16:00 UTC
Date: Thu, 5 Nov 2020 12:10:07 -0500
Message-Id: <BDAC6E73-9375-48E3-9840-4E990F01E165@gmail.com>
References: <50195240-8375-5f9b-d5b7-2a89ec8c99d0@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
In-Reply-To: <50195240-8375-5f9b-d5b7-2a89ec8c99d0@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: iPad Mail (18A8395)


--Apple-Mail-199D7F37-FF39-44C7-9AFD-02B8F8DB1304
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Nov 5, 2020, at 11:01, Jan Beulich <jbeulich@suse.com> wrote:
> =EF=BB=BFOn 30.10.2020 15:47, George Dunlap wrote:
>> Hi all,
>>=20
>> The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5=
SliLWrFRBwx49V/ and you can edit to add items.  Alternatively, you can reply=
 to this mail directly.
>>=20
>> Agenda items appreciated a few days before the call: please put your name=
 besides items if you edit the document.
>>=20
>> Note the following administrative conventions for the call:
>> * Unless, agreed in the pervious meeting otherwise, the call is on the 1s=
t Thursday of each month at 1600 British Time (either GMT or BST)
>> * I usually send out a meeting reminder a few days before with a provisio=
nal agenda
>>=20
>> * To allow time to switch between meetings, we'll plan on starting the ag=
enda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time to s=
ort out technical difficulties &c
>>=20
>> * If you want to be CC'ed please add or remove yourself from the sign-up-=
sheet at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
>>=20
>> Best Regards
>> George
>>=20
>>=20
>>=20
>> =3D=3D Dial-in Information =3D=3D
>> ## Meeting time
>> 16:00 - 17:00 UTC
>> Further International meeting times: https://www.timeanddate.com/worldclo=
ck/meetingdetails.html?year=3D2020&month=3D11&day=3D5&hour=3D16&min=3D0&sec=3D=
0&p1=3D1234&p2=3D37&p3=3D224&p4=3D179
>>=20
>>=20
>> ## Dial in details
>> Web: https://www.gotomeet.me/GeorgeDunlap
>>=20
>> You can also dial in using your phone.
>> Access Code: 168-682-109
>>=20
>> China (Toll Free): 4008 811084
>> Germany: +49 692 5736 7317
>=20
> FYI: This number continues to not work.
>=20
> Jan

This appears to be the new number since May 2020, based on [0].  I called an=
d confirmed that the number works and is expecting a number to be input, but=
 can't otherwise verify the German prompts:

   Germany: +49 721 9881 4161

Rich

[0] https://www.youtube.com/watch?v=3DEmbn9_JEqRo=

--Apple-Mail-199D7F37-FF39-44C7-9AFD-02B8F8DB1304
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><blockquote type=3D"cite">=
On Nov 5, 2020, at 11:01, Jan Beulich &lt;jbeulich@suse.com&gt; wrote:<br></=
blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>O=
n 30.10.2020 15:47, George Dunlap wrote:</span><br><blockquote type=3D"cite"=
><span>Hi all,</span><br></blockquote><blockquote type=3D"cite"><span></span=
><br></blockquote><blockquote type=3D"cite"><span>The proposed agenda is in h=
ttps://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/ and you can ed=
it to add items. &nbsp;Alternatively, you can reply to this mail directly.</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><span>Agenda items appreciated a few days before=
 the call: please put your name besides items if you edit the document.</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>Note the following administrative conventions=
 for the call:</span><br></blockquote><blockquote type=3D"cite"><span>* Unle=
ss, agreed in the pervious meeting otherwise, the call is on the 1st Thursda=
y of each month at 1600 British Time (either GMT or BST)</span><br></blockqu=
ote><blockquote type=3D"cite"><span>* I usually send out a meeting reminder a=
 few days before with a provisional agenda</span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>* To allow time to switch between meetings, we'll plan on starting the age=
nda at 16:05 sharp. &nbsp;Aim to join by 16:03 if possible to allocate time t=
o sort out technical difficulties &amp;c</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>*=
 If you want to be CC'ed please add or remove yourself from the sign-up-shee=
t at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/</span><b=
r></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>Best Regards</span><br></blockquote><blockquote t=
ype=3D"cite"><span>George</span><br></blockquote><blockquote type=3D"cite"><=
span></span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>=3D=3D Dial-in Information =3D=3D</span><br></blockquot=
e><blockquote type=3D"cite"><span>## Meeting time</span><br></blockquote><bl=
ockquote type=3D"cite"><span>16:00 - 17:00 UTC</span><br></blockquote><block=
quote type=3D"cite"><span>Further International meeting times: https://www.t=
imeanddate.com/worldclock/meetingdetails.html?year=3D2020&amp;month=3D11&amp=
;day=3D5&amp;hour=3D16&amp;min=3D0&amp;sec=3D0&amp;p1=3D1234&amp;p2=3D37&amp=
;p3=3D224&amp;p4=3D179</span><br></blockquote><blockquote type=3D"cite"><spa=
n></span><br></blockquote><blockquote type=3D"cite"><span></span><br></block=
quote><blockquote type=3D"cite"><span>## Dial in details</span><br></blockqu=
ote><blockquote type=3D"cite"><span>Web: https://www.gotomeet.me/GeorgeDunla=
p</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockq=
uote><blockquote type=3D"cite"><span>You can also dial in using your phone.<=
/span><br></blockquote><blockquote type=3D"cite"><span>Access Code: 168-682-=
109</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bloc=
kquote><blockquote type=3D"cite"><span>China (Toll Free): 4008 811084</span>=
<br></blockquote><blockquote type=3D"cite"><span>Germany: +49 692 5736 7317<=
/span><br></blockquote><span></span><br><span>FYI: This number continues to n=
ot work.</span><br><span></span><br><span>Jan</span><br></div></blockquote><=
br><div>This appears to be the new number since May 2020, based on [0]. &nbs=
p;I called and confirmed that the number works and is expecting a number to b=
e input, but can't otherwise verify the German prompts:</div><div><br></div>=
<div>&nbsp; &nbsp;Germany: +49 721 9881 4161</div><div><br></div><div>Rich</=
div><div><br></div><div>[0] <a href=3D"https://www.youtube.com/watch?v=3DEmb=
n9_JEqRo&amp;feature=3Demb_title">https://www.youtube.com/watch?v=3DEmbn9_JE=
qRo</a></div></body></html>=

--Apple-Mail-199D7F37-FF39-44C7-9AFD-02B8F8DB1304--

