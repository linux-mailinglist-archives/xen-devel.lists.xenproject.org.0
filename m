Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6252321FD62
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 21:31:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvQdU-0004kW-OX; Tue, 14 Jul 2020 19:30:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hY5v=AZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jvQdS-0004kR-J1
 for xen-devel@lists.xen.org; Tue, 14 Jul 2020 19:30:38 +0000
X-Inumbo-ID: 7e6e73d0-c608-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e6e73d0-c608-11ea-bb8b-bc764e2007e4;
 Tue, 14 Jul 2020 19:30:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o11so24363703wrv.9
 for <xen-devel@lists.xen.org>; Tue, 14 Jul 2020 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T6z4+TdptBRLmJh0/2xDTJHl7ScuqKH20jtDl7baOmw=;
 b=eZLwx8TFnJQcpIqGLP+j7hmtUeweHdIkJOEx1BUvhL+kg5i+oaucDiqCgdmTnz/GSM
 Xg1e2MoIqX/LCzBE4emJ1NJSgvj9fvxvqGxNwFN31NbLGX/9oEP2VRNhXy9mRrFlEvNm
 Rxu0qEB5ShL9k8ELTfcqD9Ucz9gCbHSNS8dUC+dHRK7ONy207WFvLBZkDd1ttIlKzzwv
 GmICFFZwEJTwR0+mKX2yyhctWJlvnlffeoxOcRB4c07nNHLY0bevtILc1rAzkh2YT2di
 K3NlOYiAwOshYCOOa8AYFlzqW924GgYO56w6fMrtf+JWHdGmi1aiEwkB5S6dLVu/tXvF
 pisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T6z4+TdptBRLmJh0/2xDTJHl7ScuqKH20jtDl7baOmw=;
 b=SO8ytudoDT+QQeqIjHrMMbfko519cNhQmeQ68wMu1u25qgr543LaeS3F0YDWQvkVFn
 W4Dtg4SGd5+9VNdyHF0bU+kypJTZXZ54RVI1OLDtNTSm7plZbcn7dfPWWsPDpc1ZXY/1
 CgM3YIMR0AZ0NSM3IaZS5R0w4XQExTv9AcmtdH9eY4cUOPIm1h6+t2g7kaU1njs2eWwl
 hTeaqIJZPwbgFySY58a8G7dsLvnYaxnJuqgb4S7bi4WXgKt88vTrTOsisIWbchlAFnIB
 y8WZ5zsA52C6HejUOaN/E+v758tUfHxkEm749b0dXqLBSDFr95uBhC6Cof/sOeOCAVUO
 9k7A==
X-Gm-Message-State: AOAM5335+7jMkPr9GGB5auRlCf0W2nJyo1X+/mzkDRz9ED3ywOOQenhX
 VZowptq9w1Cg1pJNm5k6H+hcHtjwAgVKplKMcAQ=
X-Google-Smtp-Source: ABdhPJyKpFT5i87sa0gTIfu0IvoNb4zJVH186yGeMIjaj0+goz2JNy4abwmtfHqbqJmsBok8gLh1ev4ta8hP4+XbUxk=
X-Received: by 2002:a5d:4986:: with SMTP id r6mr7267166wrq.424.1594755036679; 
 Tue, 14 Jul 2020 12:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <1D0E7281-95D7-482E-BF6D-EE5B1FEE4876@arm.com>
 <ab84437081a346d6bf0f73581382c74e@in.bosch.com>
 <D84A5DA7-683C-480B-8837-C51D560FC2E1@arm.com>
 <139024a891324455a13a3d468908798d@in.bosch.com>
 <C3BCAA62-51EF-49DD-B978-6657BC6D5A21@arm.com>
 <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
In-Reply-To: <67b4454424c4485fb59d542d052aaf2d@in.bosch.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Tue, 14 Jul 2020 22:30:25 +0300
Message-ID: <CAPD2p-nZZpDBZ5yc=gVvVAW1oFdN0KZ2jMH-T59W_sntsENwxw@mail.gmail.com>
Subject: Re: [BUG] Xen build for RCAR failing
To: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
Content-Type: multipart/alternative; boundary="0000000000007710f805aa6bd79e"
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
Cc: nd <nd@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000007710f805aa6bd79e
Content-Type: text/plain; charset="UTF-8"

Hello

[Sorry for the possible format issues]

On Tue, Jul 14, 2020 at 4:44 PM Manikandan Chockalingam (RBEI/ECF3) <
Manikandan.Chockalingam@in.bosch.com> wrote:

> Hello Bertrand,
>
> I succeeded in building the core minimal image with dunfell and its
> compatible branches [except xen-troops (modified some files to complete the
> build)].
>
> But I face the following error while booting.
>
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Timer: Unable to retrieve IRQ 0 from the device tree
> (XEN) ****************************************
>


The reason for that problem *might* be in the arch timer node in your
device tree which contains "interrupts-extended" property instead of just
"interrupts". As far as I remember Xen v4.12 doesn't have required support
to handle "interrupts-extended".
It went in a bit later [1]. If this is the real reason, I think you should
either switch to the new Xen version or modify your arch timer node in a
way to use the "interrupts" property [2]. I would suggest using the new Xen
version if possible (at least v4.13).

[1]
https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg01775.html
[2]
https://github.com/otyshchenko1/linux/commit/c25044845f2c3678f5df789881e7a125556af6fc

-- 
Regards,

Oleksandr Tyshchenko

--0000000000007710f805aa6bd79e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><div><br></div><div>[Sorry for the possibl=
e format issues]</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 14, 2020 at 4:44 PM Manikandan Chockalingam (RB=
EI/ECF3) &lt;<a href=3D"mailto:Manikandan.Chockalingam@in.bosch.com">Manika=
ndan.Chockalingam@in.bosch.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hello Bertrand,<br>
<br>
I succeeded in building the core minimal image with dunfell and its compati=
ble branches [except xen-troops (modified some files to complete the build)=
].<br>
<br>
But I face the following error while booting.<br>
<br>
(XEN) ****************************************<br>
(XEN) Panic on CPU 0:<br>
(XEN) Timer: Unable to retrieve IRQ 0 from the device tree<br>
(XEN) ****************************************<br></blockquote><div><br></d=
iv><div><br></div></div><div>The reason for that problem *might* be in the =
arch timer node in your device tree which contains &quot;interrupts-extende=
d&quot; property instead of just &quot;interrupts&quot;. As far as I rememb=
er Xen v4.12 doesn&#39;t have required support to handle=C2=A0&quot;interru=
pts-extended&quot;.</div><div>It went in a bit later [1]. If this is the re=
al reason, I think you should either switch to the new Xen version or modif=
y your arch timer node in a way to use the=C2=A0&quot;interrupts&quot; prop=
erty [2]. I would suggest using the new Xen version if possible (at least v=
4.13).</div><div><br></div><div>[1] <a href=3D"https://lists.xenproject.org=
/archives/html/xen-devel/2019-05/msg01775.html">https://lists.xenproject.or=
g/archives/html/xen-devel/2019-05/msg01775.html</a><br></div><div>[2]=C2=A0=
<a href=3D"https://github.com/otyshchenko1/linux/commit/c25044845f2c3678f5d=
f789881e7a125556af6fc">https://github.com/otyshchenko1/linux/commit/c250448=
45f2c3678f5df789881e7a125556af6fc</a></div><div><br></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><fon=
t size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-seri=
f">Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div></div></di=
v></div></div>

--0000000000007710f805aa6bd79e--

