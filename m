Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9A7F4EE6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 19:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638953.996014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5rZV-00052b-Ht; Wed, 22 Nov 2023 18:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638953.996014; Wed, 22 Nov 2023 18:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5rZV-0004zF-Ey; Wed, 22 Nov 2023 18:03:33 +0000
Received: by outflank-mailman (input) for mailman id 638953;
 Wed, 22 Nov 2023 17:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFg3=HD=gmail.com=dzyuzin21@srs-se1.protection.inumbo.net>)
 id 1r5qpl-0006na-WB
 for xen-devel@lists.xen.org; Wed, 22 Nov 2023 17:16:18 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d836ed4a-895a-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:16:17 +0100 (CET)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-77d55e986ecso139486385a.2
 for <xen-devel@lists.xen.org>; Wed, 22 Nov 2023 09:16:16 -0800 (PST)
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
X-Inumbo-ID: d836ed4a-895a-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700673375; x=1701278175; darn=lists.xen.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MELkYOzplcPTEttvjP3Ol7h0KPf50HYqmemdYhuL/aA=;
        b=EMEFRFJjP4028F8PPfQ182NWXVVhTjWksyE1A/PThDb+z1U2FIgUkPFvA3GsR5ZseK
         52hjBzyIcwBUr0Efb04jySp3DkKqj8IqEK3/UHFcXvgTm03jt5gKCJlNJT4kh4O1Mw7p
         9QABYW0I4CE7+Nv8fXd76oT7Zv9uvpGbLC9aBKTEProzxlwUOX30f6Qw1xVmG8+ecTUb
         8VcDv/r5RdGWTA0lZZB5aK5KcjRz4pbcNgm/jMFOQ9hEtoKoZv5v4t38yl1NBkqzDX+j
         6sPpv8n5ZzT0bFhva/SFjxYJTI11r60ghEg5bTWFzmFva4qypsAhoakuNwTd6VztVTuh
         vI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673375; x=1701278175;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MELkYOzplcPTEttvjP3Ol7h0KPf50HYqmemdYhuL/aA=;
        b=sBw+Y4K7R5RQKtW9B7KG1GEC6rIWrlaaa/NTB4XrXnCbKLSH28o92r4xkhHaXAwlt1
         afgs80XOZeYI6UpkN65HwcjKka30zZJ11+xlCUaneQ3CCHj2sZ7P/o49TvliKvlgRF+I
         TMCprlcjPjjrdRoVbS07b1o9kV58BBSvnaCzZTD6oatV4Z88aR9ayDVo2tgVEEPlAE7A
         sR49MnJdw1ZkEkeepZORKhN5oGpEKUp2dFyXIIhqaPXCt6cVjUifxCLjZr7LaSjyk2Ue
         8mgtWyBeSNqgU4bs0wxsaG93kg/rpNGG1YBYoW4NC66GY7AysFPD2HG+pOLPDd53OAg3
         VDDw==
X-Gm-Message-State: AOJu0YysU/AvOsiSSlSNF85S4mdH5TA5NRvmXavtyX9IWHI/OZ/bb45p
	uvwzAkUXNdMLTxshu31iAGLZiedrORiDw9DxdhS7psknrkdmQw==
X-Google-Smtp-Source: AGHT+IEh/8yNJ9mgd3IsfqntqvwCJd8wseekweF5wlFhwoxl5u0yYSdhtHt34Iwo+S0/7FFGnz+cfyObBI9TAAhiZvg=
X-Received: by 2002:a05:6214:2a88:b0:679:f299:620d with SMTP id
 jr8-20020a0562142a8800b00679f299620dmr3677990qvb.4.1700673375490; Wed, 22 Nov
 2023 09:16:15 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Zyuzin <dzyuzin21@gmail.com>
Date: Wed, 22 Nov 2023 20:16:04 +0300
Message-ID: <CAPAcLADsTDNSw-vka=x25YdGSPi2P+YGZyjcECVoKqo-rJ+UkA@mail.gmail.com>
Subject: Testing Xen v4.17 on ARMv8
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000006cd901060ac0e067"

--0000000000006cd901060ac0e067
Content-Type: text/plain; charset="UTF-8"

Dear Sir or Madam,

I am a firmware developer working on ARM-based SoC. We have recently added
Xen support (v4.17) to our firmware. Now I am trying to find a test
framework for routine testing of Xen on our SoCs.

Unfortunately, wiki.xenproject.org is not very up-to-date, and the
situation with tests (https://wiki.xenproject.org/wiki/Testing_Xen,
https://wiki.xenproject.org/wiki/Category:Test_Day) is even worse.  As far
as I can see, the latest tested version of Xen mentioned there is 4.15. I
found the Smoke test (
https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test). It passes
successfully, but its coverage is quite low.
Besides that, I have found the Xen OSSTest framework (
http://xenbits.xen.org/gitweb/?p=osstest.git;a=summary). If I'm not
mistaken, it was written for internal use approximately in 2013. But
currently, I have not managed to make the framework usable for individual
ad-hoc testing in standalone mode for ARM64.
Also there is mentioned XenRT test (
https://wiki.xenproject.org/wiki/Category:XenRT), but there are no *working*
links for its source code.

Could you kindly tell me:
1. Which tests or test suites would you recommend for testing Xen
(including regression tests)?
2. Where can I find source code of the XenRT test framework?
3.  Is there any clear and up-to-date manual on using and porting the
Osstest?

Sincerely yours,
Dmitry Zyuzin, firmware developer.

--0000000000006cd901060ac0e067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"4"><span style=3D"font-family:arial,san=
s-serif">Dear Sir or Madam,</span></font></div><div><font size=3D"4"><span =
style=3D"font-family:arial,sans-serif"><br></span></font></div><div><font s=
ize=3D"4"><span style=3D"font-family:arial,sans-serif"><span>I am a firmwar=
e developer working on ARM-based SoC</span>. We have recently added Xen sup=
port (v4.17) to our firmware. Now I am trying to find a test framework for =
routine testing of Xen on our SoCs.</span></font></div><div><font size=3D"4=
"><span style=3D"font-family:arial,sans-serif"><br></span></font></div><div=
><font size=3D"4"><span style=3D"font-family:arial,sans-serif">Unfortunatel=
y, <a href=3D"http://wiki.xenproject.org">wiki.xenproject.org</a> is not ve=
ry up-to-date, and the situation with tests (<a href=3D"https://wiki.xenpro=
ject.org/wiki/Testing_Xen">https://wiki.xenproject.org/wiki/Testing_Xen</a>=
, <a href=3D"https://wiki.xenproject.org/wiki/Category:Test_Day">https://wi=
ki.xenproject.org/wiki/Category:Test_Day</a>) is even worse.=C2=A0<font siz=
e=3D"4"><span style=3D"font-family:arial,sans-serif"> As far as I can see, =
the latest tested version of Xen<span class=3D"gmail-Lm gmail-ng gmail-Vt g=
mail-Vs"> mentioned</span> there is 4.15. </span></font> I found the Smoke =
test (<a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test=
">https://wiki.xenproject.org/wiki/Xen_ARM_Manual_Smoke_Test</a>). It passe=
s successfully, but its coverage is quite low.</span></font></div><div><fon=
t size=3D"4"><span style=3D"font-family:arial,sans-serif">Besides that, I h=
ave found the Xen OSSTest framework (<a href=3D"http://xenbits.xen.org/gitw=
eb/?p=3Dosstest.git;a=3Dsummary">http://xenbits.xen.org/gitweb/?p=3Dosstest=
.git;a=3Dsummary</a>). If I&#39;m not mistaken, it was written for internal=
 use approximately in 2013. But currently, I have not managed to make the f=
ramework usable for individual ad-hoc testing in standalone mode for ARM64.=
 <br></span></font></div><div><font size=3D"4"><span style=3D"font-family:a=
rial,sans-serif">Also there is mentioned XenRT test (<a href=3D"https://wik=
i.xenproject.org/wiki/Category:XenRT">https://wiki.xenproject.org/wiki/Cate=
gory:XenRT</a>), but there are no <b>working</b> links for its source code.=
<br></span></font></div><div><font size=3D"4"><span style=3D"font-family:ar=
ial,sans-serif"><br></span></font></div><font size=3D"4"><span>Could you ki=
ndly tell me:</span></font><div><font size=3D"4"><span style=3D"font-family=
:arial,sans-serif">1. Which tests or test suites would you recommend for te=
sting Xen (including regression tests)?</span></font></div><div><font size=
=3D"4"><span style=3D"font-family:arial,sans-serif">2. Where can I find sou=
rce code of the XenRT test framework?</span></font></div><div><font size=3D=
"4"><span style=3D"font-family:arial,sans-serif">3.=C2=A0 Is there any clea=
r and up-to-date manual on using and porting the Osstest?<br><br></span></f=
ont></div><div><font size=3D"4"><span style=3D"font-family:arial,sans-serif=
">Sincerely yours,</span></font></div><div><font size=3D"4"><span style=3D"=
font-family:arial,sans-serif">Dmitry Zyuzin, firmware developer.</span></fo=
nt><br></div></div>

--0000000000006cd901060ac0e067--

