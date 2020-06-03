Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA781EC789
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 04:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgJNc-0006zL-Tz; Wed, 03 Jun 2020 02:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azRW=7Q=gmail.com=hydrapolic@srs-us1.protection.inumbo.net>)
 id 1jgJNb-0006zG-A1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 02:43:47 +0000
X-Inumbo-ID: 0bb5b0a4-a544-11ea-8993-bc764e2007e4
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bb5b0a4-a544-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 02:43:46 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w90so819927qtd.8;
 Tue, 02 Jun 2020 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N6goEOlN4qAAs1j28VEI7Cco90TR2wupjCzPlDjwyLg=;
 b=jxnE/6HFKMC+fI8zc/aNqgCoenD1lUbYQhf4wDZvaS1LpMRtQfWdpD3sUq+u+OEekI
 kFhr8CMwc1UFKIjQ7b3PUKpbX8zKu0TMIxuFS9saT8DnoMYu7xavDuVSN2Pd1wLWD+p5
 YDYl1UboIfLlydCgx2gpxi+gkHIGSljEu+wSsdOZjHvpIKFmjGrcsimU9L2DDEhJ7JMJ
 lHpacabHmhIev8XU9Wh5PFHLZCLf2oRyMG6ROlh0VYVv8wqnlUQ9Fes0wsCWUnHDyz3k
 cpK75fB3YrovIzmo710eIVqldcXR1fIA5k/AHrLiHGx1APs/uIbm7WHHuqGf9aPl75x/
 2ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N6goEOlN4qAAs1j28VEI7Cco90TR2wupjCzPlDjwyLg=;
 b=EHvdaDrthjwMIBMdx62vnX2ygNBARHe9Cuy/MHtAftIRrURdoI9qg53/9JFJVio5u4
 mMasK2DdMDF+BIWVztYdeeisVtmo8HODKjfhCxYLhaGE4iQ4SDP+RxUf2qtwj68wGjGk
 YpDzwlxF6NvstEpO+sRbUF6s8bBLHSgmVF/ePu5Kp3GJk4YNZs6xF6UDUELTMOyqoMur
 6Mu8yn/QErFzRhuUVjyqUg9lekjFgWryJYYEYLTrhD9x170hbSjQRn/13IoiU8QUy55f
 uJpHMD9TKNt7zdrjkiL+EjfSQMiVqtk2hVMEH4vc76INTePIWOe/FIALF4nKXWwNAEhO
 ZmBg==
X-Gm-Message-State: AOAM533cTTpqheW6nqBQ5gIrMgnLKo7eFdSE61Q51CD8p997qTWAPQDf
 QM9cmNQuVmhHN+iIwcYwybNrL0jOTSKcXHWNNh4=
X-Google-Smtp-Source: ABdhPJzNA3JJZVwAjiZDa6wCmDh/nFa8ofCf4SoppoFs1xgAJx5/q1QjgOIKaNU6JshSXpTtTe4abFWF3ULH9HFnPFI=
X-Received: by 2002:aed:2ca5:: with SMTP id g34mr15152669qtd.13.1591152225678; 
 Tue, 02 Jun 2020 19:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAG6MAzRcvUifqf=m7EE98bz0w_s2+Z=0Nx7YT0SVv75ek0Mc2Q@mail.gmail.com>
 <CAG6MAzR_bU5qnCLKpuUAt-S_dfxjnxgh12gUjnXfsfC7Fw2qMw@mail.gmail.com>
 <CAG6MAzSS0Kw2KHWZpb6O9kfoDKK2spn_WHfy9gnZcZLvES0wnQ@mail.gmail.com>
 <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
 <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
 <CAG6MAzQ4QQjre7o5iLN5gX9=mRkJzy_pDM+aRgXi999yfp0srg@mail.gmail.com>
In-Reply-To: <CAG6MAzQ4QQjre7o5iLN5gX9=mRkJzy_pDM+aRgXi999yfp0srg@mail.gmail.com>
From: Tomas Mozes <hydrapolic@gmail.com>
Date: Wed, 3 Jun 2020 04:43:33 +0200
Message-ID: <CAG6MAzQfX13KuaWtmJb_3Srdt5FTV+nvKmnNVXq5j8QF44NhTw@mail.gmail.com>
Subject: Re: [Xen-users] xen domU stall on 4.12.1
To: Glen <glenbarney@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000031fb0805a724ff8c"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000031fb0805a724ff8c
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 6:02 PM Tomas Mozes <hydrapolic@gmail.com> wrote:

>
>
> On Mon, Feb 24, 2020 at 4:55 PM Glen <glenbarney@gmail.com> wrote:
>
>> On Sun, Feb 23, 2020 at 11:12 PM Tomas Mozes <hydrapolic@gmail.com>
>> wrote:
>> > As reported in
>> https://lists.xenproject.org/archives/html/xen-devel/2020-01/msg00361.html
>> and
>> https://lists.xenproject.org/archives/html/xen-users/2020-02/msg00042.html,
>> switching back to credit1 scheduler seems to make it working again. I've
>> migrated 6 machines to Xen 4.12 with sched=credit xen option and haven't
>> observed a hang for more than a week now.
>>
>> My experience is the same.  I have migrated all 16 of my physical
>> hosts back to OpenSuse 15.1 with Xen 4.12.1 with sched=credit .  All
>> guests are now running perfectly, without any issues at all.  Over
>> this past week I performed directed stress-testing against several of
>> my guests, and they all survived without any problems at all.  I've
>> now completely my migration to the new guests, and everyone is happy.
>>
>> I'm now going to bring one of the previously-live guests on its own
>> host back to credit2 so I can crash it and try to capture debugging
>> output for xen-devel as requested.  But sched=credit is definitely
>> what we needed to solve this problem!  Thank you all for helping us
>> get there!
>>
>> Glen
>>
>
> Thank you too for your report. Hope we'll find the reason why credit2
> misbehaves.
>
> Tomas
>

Just tested Xen 4.12.3, but a domU hanged again with credit2. It works rock
solid with credit1.

Tomas

--00000000000031fb0805a724ff8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2020 at 6:02 PM Tomas=
 Mozes &lt;<a href=3D"mailto:hydrapolic@gmail.com">hydrapolic@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2020 at 4:55 PM Glen &lt;=
<a href=3D"mailto:glenbarney@gmail.com" target=3D"_blank">glenbarney@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Sun, Feb 23, 2020 at 11:12 PM Tomas Mozes &lt;<a href=3D"mailto:hydra=
polic@gmail.com" target=3D"_blank">hydrapolic@gmail.com</a>&gt; wrote:<br>
&gt; As reported in <a href=3D"https://lists.xenproject.org/archives/html/x=
en-devel/2020-01/msg00361.html" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.xenproject.org/archives/html/xen-devel/2020-01/msg00361.html</a> an=
d <a href=3D"https://lists.xenproject.org/archives/html/xen-users/2020-02/m=
sg00042.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject=
.org/archives/html/xen-users/2020-02/msg00042.html</a>, switching back to c=
redit1 scheduler seems to make it working again. I&#39;ve migrated 6 machin=
es to Xen 4.12 with sched=3Dcredit xen option and haven&#39;t observed a ha=
ng for more than a week now.<br>
<br>
My experience is the same.=C2=A0 I have migrated all 16 of my physical<br>
hosts back to OpenSuse 15.1 with Xen 4.12.1 with sched=3Dcredit .=C2=A0 All=
<br>
guests are now running perfectly, without any issues at all.=C2=A0 Over<br>
this past week I performed directed stress-testing against several of<br>
my guests, and they all survived without any problems at all.=C2=A0 I&#39;v=
e<br>
now completely my migration to the new guests, and everyone is happy.<br>
<br>
I&#39;m now going to bring one of the previously-live guests on its own<br>
host back to credit2 so I can crash it and try to capture debugging<br>
output for xen-devel as requested.=C2=A0 But sched=3Dcredit is definitely<b=
r>
what we needed to solve this problem!=C2=A0 Thank you all for helping us<br=
>
get there!<br>
<br>
Glen<br></blockquote><div><br></div><div>Thank you too for your report. Hop=
e we&#39;ll find the reason why credit2 misbehaves.<br></div><div><br></div=
><div>Tomas<br></div></div></div></blockquote><div><br></div><div>Just test=
ed Xen 4.12.3, but a domU hanged again with credit2. It works rock solid wi=
th credit1.<br></div><div><br></div><div>Tomas=C2=A0 <br></div></div></div>

--00000000000031fb0805a724ff8c--

