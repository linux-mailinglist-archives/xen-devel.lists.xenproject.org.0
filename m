Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB616B8F8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 06:23:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Sbf-0006yj-Pj; Tue, 25 Feb 2020 05:18:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+g/m=4M=gmail.com=hydrapolic@srs-us1.protection.inumbo.net>)
 id 1j6H8l-0007wP-T3
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:03:31 +0000
X-Inumbo-ID: 955dde00-5727-11ea-aba8-bc764e2007e4
Received: from mail-qt1-x833.google.com (unknown [2607:f8b0:4864:20::833])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 955dde00-5727-11ea-aba8-bc764e2007e4;
 Mon, 24 Feb 2020 17:03:31 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id p34so7018592qtb.6;
 Mon, 24 Feb 2020 09:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JayXpjrdzEbyTeT7CiXxd3NAz9kk1xAna0fYzDVFaAE=;
 b=J5ieMfc+L+r3FUi/0SVh8r13MQ//dYAlfcXqg+CBZgzZtuti0vM4MCaf9B84hc6JKs
 0BYyyU05H0pxq+wvfj5YNESZ7kqZIv4KgN38gqEcYhzCgYbrjaWDdu9ANw9YnKyIgSxt
 3WmVkcYNNbZlgvi7QU2vW+sIvBs2uK9A5MMLLPxlvXRIUC/sCLzhasIyZ9+9X2E6zjcQ
 yqaWx3M0ZonJrUFEKRPBSLcR+q/RGiyD4HFRydHQx2YmOps82LiOEP/ktTlFAXkBfJBO
 DqfvGp2oItLZFClXon7gal48Vz5mneOQ5xm4Kt87J9YK/mkb5OpFTP4jXwVZiQyHf+WT
 VGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JayXpjrdzEbyTeT7CiXxd3NAz9kk1xAna0fYzDVFaAE=;
 b=j1syaQZCqxTwgctoZFvLcnOTv2VVs7TDGQAkP8sU7oogRikj9q6lNoJb9qLSQEQQDW
 fI4WikaO6OZs1cq/6bQyPsGGiSJBQKGN9UAvr7zyQmjc8fAaw7fvZr5wXukMgMe00Zzz
 kOPQ4TgwR3ThPDrUd8FSQ8RJ+MwirLD64Eu1xIKlzBr0+5QFjM+ATosyZA3FQiQMsJf8
 rX8za47QoEcz3poslxUXMNokQ47zfUJfvS79oBNl0G6ajfMRQHzKvgivd900aiBcBbk7
 s65H0kreDI51lV+nBYWbprpB/je7CD06jRz4H42+whaexGfOWdL0ykvmOAV/SQtgt0EX
 k0KQ==
X-Gm-Message-State: APjAAAVXzEdLJvmLTaiaGEv8CofFn2iAtor8lL4KnHogvnhr5J16JATZ
 /i+eQN/F6+gXRap1nXfLZjkRokOQ6+jhaSb9bR8=
X-Google-Smtp-Source: APXvYqz7Ceda56aGHWTMFyL0g7AwJiVaq69WgwF84eCAGvW5RGv1HIzy99Qy9Vmc6H00KcgdR+kOmRLJICfszsB5Thw=
X-Received: by 2002:ac8:6f0b:: with SMTP id g11mr48229297qtv.308.1582563810536; 
 Mon, 24 Feb 2020 09:03:30 -0800 (PST)
MIME-Version: 1.0
References: <CAG6MAzRcvUifqf=m7EE98bz0w_s2+Z=0Nx7YT0SVv75ek0Mc2Q@mail.gmail.com>
 <CAG6MAzR_bU5qnCLKpuUAt-S_dfxjnxgh12gUjnXfsfC7Fw2qMw@mail.gmail.com>
 <CAG6MAzSS0Kw2KHWZpb6O9kfoDKK2spn_WHfy9gnZcZLvES0wnQ@mail.gmail.com>
 <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
 <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
In-Reply-To: <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
From: Tomas Mozes <hydrapolic@gmail.com>
Date: Mon, 24 Feb 2020 18:02:14 +0100
Message-ID: <CAG6MAzQ4QQjre7o5iLN5gX9=mRkJzy_pDM+aRgXi999yfp0srg@mail.gmail.com>
To: Glen <glenbarney@gmail.com>
X-Mailman-Approved-At: Tue, 25 Feb 2020 05:18:06 +0000
Subject: Re: [Xen-devel] [Xen-users] xen domU stall on 4.12.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0466196589885921317=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0466196589885921317==
Content-Type: multipart/alternative; boundary="000000000000c2efc5059f55599c"

--000000000000c2efc5059f55599c
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 24, 2020 at 4:55 PM Glen <glenbarney@gmail.com> wrote:

> On Sun, Feb 23, 2020 at 11:12 PM Tomas Mozes <hydrapolic@gmail.com> wrote:
> > As reported in
> https://lists.xenproject.org/archives/html/xen-devel/2020-01/msg00361.html
> and
> https://lists.xenproject.org/archives/html/xen-users/2020-02/msg00042.html,
> switching back to credit1 scheduler seems to make it working again. I've
> migrated 6 machines to Xen 4.12 with sched=credit xen option and haven't
> observed a hang for more than a week now.
>
> My experience is the same.  I have migrated all 16 of my physical
> hosts back to OpenSuse 15.1 with Xen 4.12.1 with sched=credit .  All
> guests are now running perfectly, without any issues at all.  Over
> this past week I performed directed stress-testing against several of
> my guests, and they all survived without any problems at all.  I've
> now completely my migration to the new guests, and everyone is happy.
>
> I'm now going to bring one of the previously-live guests on its own
> host back to credit2 so I can crash it and try to capture debugging
> output for xen-devel as requested.  But sched=credit is definitely
> what we needed to solve this problem!  Thank you all for helping us
> get there!
>
> Glen
>

Thank you too for your report. Hope we'll find the reason why credit2
misbehaves.

Tomas

--000000000000c2efc5059f55599c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2020 at 4:55 PM Glen =
&lt;<a href=3D"mailto:glenbarney@gmail.com">glenbarney@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Feb=
 23, 2020 at 11:12 PM Tomas Mozes &lt;<a href=3D"mailto:hydrapolic@gmail.co=
m" target=3D"_blank">hydrapolic@gmail.com</a>&gt; wrote:<br>
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
><div>Tomas<br></div></div></div>

--000000000000c2efc5059f55599c--


--===============0466196589885921317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0466196589885921317==--

