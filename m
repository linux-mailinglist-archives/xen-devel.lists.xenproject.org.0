Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3697F15AB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636818.992532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55FG-0003vo-AS; Mon, 20 Nov 2023 14:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636818.992532; Mon, 20 Nov 2023 14:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55FG-0003u9-7E; Mon, 20 Nov 2023 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 636818;
 Mon, 20 Nov 2023 14:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/O0h=HB=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r55FF-0003sS-7K
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:27:25 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec280426-87b0-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 15:27:24 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so6394686a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 06:27:24 -0800 (PST)
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
X-Inumbo-ID: ec280426-87b0-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700490444; x=1701095244; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qNFYmDZfbRBhs93gK4+zGEZ63y8cCEjejgetHSWadjQ=;
        b=cz9ItTJj5Hv3DjfB2x1aMdy1NztZ3fVuSq1Kp+2inPwn2DlPjSswkZ3dAr4jW9J4zC
         aJ55KpRUEEZf4KNCtevQ4gYbqvHk8+OuPcCInzspVp2i1tl/Qjm4+xGqoPGZas4lg9eL
         5ZqL4tgZR0kR6yIECSrHQbzrmb3APA4MT5bew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700490444; x=1701095244;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNFYmDZfbRBhs93gK4+zGEZ63y8cCEjejgetHSWadjQ=;
        b=AAMCR1iGHf4yBxl7N3e4SL8x5jS3tlxxd8bzndSSGBcmnbnJUh7FF6ojz3bxaCjjfI
         IgS2XPc3S4VwOVyEsE6gqrezmiuevoiPKLdoChP+AMY8kcZhYy1wTqlFU+Sm3y0PwPMe
         Kyi9+3Q7ecnZtwxe3zquwLWRAXT+Jo31qzbTKvt8gp0QHRoqgdKWXU/n3D13WEEGpxlM
         vBRiOWicQbK3mYLI66ZJWAdIlG3pXskUqqri6H/h7LXVLBiC1Mc5+EZJevlcViMrTbKm
         7rtuaBY9tSKJCN9uP8B2AxmNbfksafdLpYLQK4JZ5WIhDnf4QCk0g7W1kaMByjYyRv50
         Suhg==
X-Gm-Message-State: AOJu0YwSyu8Ttfmk5Qs7LEg4hnbPC9VbB9g54/ZZAHBtd7YcOXf17/dQ
	eQb89ZBvuulKA07pu6YIUnYEL/+rw/sTXqoS3+2+Ew==
X-Google-Smtp-Source: AGHT+IHvoF8KIOAWCqE286MZx99mLdLqM4ZlEvzC37WX3r2khLxJUuBetrQi+RXgDD31qw+qHTWeAluewX80ggsXcEM=
X-Received: by 2002:aa7:d755:0:b0:547:9ebd:c0ab with SMTP id
 a21-20020aa7d755000000b005479ebdc0abmr5821401eds.13.1700490443683; Mon, 20
 Nov 2023 06:27:23 -0800 (PST)
MIME-Version: 1.0
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 20 Nov 2023 14:26:47 +0000
Message-ID: <CAO-mL=x0wpaERs7jTK2GmfEhq-EJ4X4wyHERVyoQpfQXQYjUcA@mail.gmail.com>
Subject: Xen Project Releases Version 4.18
To: =?UTF-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLSGVucnkgV2FuZw==?= <Henry.Wang@arm.com>, 
	George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org, 
	xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org, 
	advisory-board@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d71711060a9648dd"

--000000000000d71711060a9648dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It's with great pleasure that I announce our 4.18 PR release!

*Please find the PR article attached here
<https://www.businesswire.com/news/home/20231120045533/en/Xen-Project-Relea=
ses-Version-4.18-with-New-Security-Performance-and-Architecture-Enhancement=
s-for-AIML-Applications>,
and information on our blog here
<https://xenproject.org/2023/11/20/xen-project-releases-version-4-18-with-n=
ew-security-performance-and-architecture-enhancements-for-ai-ml-application=
s/>.*

I want to thank the whole community for their efforts in getting this
release published.

In particular, I'd like to express gratitude to @Henry Wang
<Henry.Wang@arm.com> for his help as the release manager, @George Dunlap
<george.dunlap@cloud.com> for collating the downloads, and the Advisory
Board for their continued support and quotes in the article.

*Some notable features:*

   - *Arm*
      - *The Scalable Vector Extension (SVE) is now merged in upstream Xen
      as a tech preview.*
      - *The Arm=C2=AE Firmware Framework for Arm A-profile (FF-A) framewor=
k
      support is now merged in upstream Xen as a tech preview.*
      - *The memory subsystem in Xen on Arm64 is now more compliant with
      the Arm architecture.*
   - *x86*
      - *On all Intel systems, MSR_ARCH_CAPS is now visible in guests, and
      controllable from the VM's config file. For CPUs from 2019 onwards, t=
his
      allows guest kernels to see details about hardware fixes for speculat=
ive
      mitigations.*
      - *Support for features new in 4th Gen AMD EPYC Processors:*
         - *CPUID_USER_DIS (CPUID Faulting) used by Xen to control PV
         guest's view of CPUID data*
      - *Support for features new in Intel Sapphire Rapids CPUs:*
         - *PKS (Protection Key Supervisor) available to HVM/PVH guests*
         - *VM-Notify used by Xen to mitigate certain micro-architectural
         pipeline livelocks, instead of crashing the entire server*
         - *Bus-lock detection, used by Xen to mitigate (by rate-limiting)
         the systemwide impact of a guest misusing atomic instructions*
      - *Support for features new in Intel Granite Rapids CPUs:*
         - *AVX512-FP16*
      - *Add Intel Hardware P-States (HWP) cpufreq driver*
      - *Support for enforcing system-wide operation in Data Operand
      Independent Timing Mode*
   - *RISC-V and PowerPC*
      - *Upstream Xen GitLab CI has been set up with full Xen build and a
      message printed from Xen early printk*
   - *Security*
      - *20 XSAs has been published, enhancing the security of the project
      to keep it safe from common vulnerabilities*
   - *MISRA-C*
      - *The project has officially adopted more MISRA-C rules, from four
      directives and 24 rules in 4.17 to 6 directives and 65 rules of MISRA=
-C*

We are doing great things in The Xen Project, and this wouldn't have been
possible without the community working together.

I look forward to seeing what we can all achieve in the future!

Many thanks,
Kelly Choi

Come join the conversation on Matrix:

XenProject: https://matrix.to/#/#XenProject:matrix.org

XenDevel: https://matrix.to/#/#XenDevel:matrix.org

XenSocial: https://matrix.to/#/#XenSocial:matrix.org


Open Source Community Manager
XenServer, Cloud Software Group

--000000000000d71711060a9648dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><br></div><div>It&#39;s with great pleasu=
re that I announce our 4.18 PR release!=C2=A0</div><div><br></div><div><b>P=
lease find the <a href=3D"https://www.businesswire.com/news/home/2023112004=
5533/en/Xen-Project-Releases-Version-4.18-with-New-Security-Performance-and=
-Architecture-Enhancements-for-AIML-Applications">PR article attached here<=
/a>, and information on our <a href=3D"https://xenproject.org/2023/11/20/xe=
n-project-releases-version-4-18-with-new-security-performance-and-architect=
ure-enhancements-for-ai-ml-applications/">blog here</a>.</b></div><div><br>=
</div><div>I want to thank the whole community for their efforts in getting=
 this release published.</div><div><br></div><div>In particular, I&#39;d li=
ke to express gratitude to=C2=A0<a class=3D"gmail_plusreply" id=3D"plusRepl=
yChip-1" href=3D"mailto:Henry.Wang@arm.com" tabindex=3D"-1" style=3D"">@Hen=
ry Wang</a>=C2=A0for his help as the release manager,=C2=A0<a class=3D"gmai=
l_plusreply" id=3D"plusReplyChip-2" href=3D"mailto:george.dunlap@cloud.com"=
 tabindex=3D"-1">@George Dunlap</a>=C2=A0for collating the downloads,=C2=A0=
and the Advisory Board for their continued support and quotes in the articl=
e.=C2=A0</div><div><br></div><div><b>Some notable features:</b></div><div><=
ul class=3D"gmail-bwlistdisc" style=3D"margin:0px 0px 1.5em;padding:0px 0px=
 0px 24px;overflow:hidden;color:rgb(68,68,68);font-family:&quot;Helvetica N=
eue&quot;,Helvetica,Arial,&quot;Lucida Grande&quot;,sans-serif;background-c=
olor:rgb(254,254,254)"><li style=3D"list-style-type:disc;margin:0px 0px 5px=
"><b><i>Arm</i></b><ul class=3D"gmail-bwlistcircle" style=3D"margin:0px;pad=
ding:0px 0px 0px 24px;overflow:hidden"><li style=3D"list-style-type:circle;=
margin:0px"><i>The Scalable Vector Extension (SVE) is now merged in upstrea=
m Xen as a tech preview.</i></li><li style=3D"list-style-type:circle;margin=
:0px"><i>The Arm=C2=AE Firmware Framework for Arm A-profile (FF-A) framewor=
k support is now merged in upstream Xen as a tech preview.</i></li><li styl=
e=3D"list-style-type:circle;margin:0px"><i>The memory subsystem in Xen on A=
rm64 is now more compliant with the Arm architecture.</i></li></ul></li><li=
 style=3D"list-style-type:disc;margin:0px 0px 5px"><b><i>x86</i></b><ul cla=
ss=3D"gmail-bwlistcircle" style=3D"margin:0px;padding:0px 0px 0px 24px;over=
flow:hidden"><li style=3D"list-style-type:circle;margin:0px"><i>On all Inte=
l systems, MSR_ARCH_CAPS is now visible in guests, and controllable from th=
e VM&#39;s config file. For CPUs from 2019 onwards, this allows guest kerne=
ls to see details about hardware fixes for speculative mitigations.</i></li=
><li style=3D"list-style-type:circle;margin:0px"><i>Support for features ne=
w in 4<span style=3D"line-height:0;vertical-align:baseline">th</span>=C2=A0=
Gen AMD EPYC Processors:</i><ul class=3D"gmail-bwlistsquare" style=3D"margi=
n:0px;padding:0px 0px 0px 24px;overflow:hidden"><li style=3D"list-style-typ=
e:square;margin:0px"><i>CPUID_USER_DIS (CPUID Faulting) used by Xen to cont=
rol PV guest&#39;s view of CPUID data</i></li></ul></li><li style=3D"list-s=
tyle-type:circle;margin:0px"><i>Support for features new in Intel Sapphire =
Rapids CPUs:</i><ul class=3D"gmail-bwlistsquare" style=3D"margin:0px;paddin=
g:0px 0px 0px 24px;overflow:hidden"><li style=3D"list-style-type:square;mar=
gin:0px"><i>PKS (Protection Key Supervisor) available to HVM/PVH guests</i>=
</li><li style=3D"list-style-type:square;margin:0px"><i>VM-Notify used by X=
en to mitigate certain micro-architectural pipeline livelocks, instead of c=
rashing the entire server</i></li><li style=3D"list-style-type:square;margi=
n:0px"><i>Bus-lock detection, used by Xen to mitigate (by rate-limiting) th=
e systemwide impact of a guest misusing atomic instructions</i></li></ul></=
li><li style=3D"list-style-type:circle;margin:0px"><i>Support for features =
new in Intel Granite Rapids CPUs:</i><ul class=3D"gmail-bwlistsquare" style=
=3D"margin:0px;padding:0px 0px 0px 24px;overflow:hidden"><li style=3D"list-=
style-type:square;margin:0px"><i>AVX512-FP16</i></li></ul></li><li style=3D=
"list-style-type:circle;margin:0px"><i>Add Intel Hardware P-States (HWP) cp=
ufreq driver</i></li><li style=3D"list-style-type:circle;margin:0px"><i>Sup=
port for enforcing system-wide operation in Data Operand Independent Timing=
 Mode</i></li></ul></li><li style=3D"list-style-type:disc;margin:0px 0px 5p=
x"><b><i>RISC-V and PowerPC</i></b><ul class=3D"gmail-bwlistcircle" style=
=3D"margin:0px;padding:0px 0px 0px 24px;overflow:hidden"><li style=3D"list-=
style-type:circle;margin:0px"><i>Upstream Xen GitLab CI has been set up wit=
h full Xen build and a message printed from Xen early printk</i></li></ul><=
/li><li style=3D"list-style-type:disc;margin:0px 0px 5px"><b><i>Security</i=
></b><ul class=3D"gmail-bwlistcircle" style=3D"margin:0px;padding:0px 0px 0=
px 24px;overflow:hidden"><li style=3D"list-style-type:circle;margin:0px"><i=
>20 XSAs has been published, enhancing the security of the project to keep =
it safe from common vulnerabilities</i></li></ul></li><li style=3D"list-sty=
le-type:disc;margin:0px 0px 5px"><b><i>MISRA-C</i></b><ul class=3D"gmail-bw=
listcircle" style=3D"margin:0px;padding:0px 0px 0px 24px;overflow:hidden"><=
li style=3D"list-style-type:circle;margin:0px"><i>The project has officiall=
y adopted more MISRA-C rules, from four directives and 24 rules in 4.17 to =
6 directives and 65 rules of MISRA-C</i></li></ul></li></ul><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div>We are doing great things in The Xen Project, and this wou=
ldn&#39;t have been possible without the community working together.=C2=A0<=
/div><div><br></div><div>I look forward to seeing what we can all achieve i=
n the future!=C2=A0</div><div><br></div><div>Many thanks,</div><div>Kelly C=
hoi</div><div><br></div><div>Come join the conversation on Matrix:</div><di=
v>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:13px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;">XenProject: <a href=3D"http=
s://matrix.to/#/#XenProject:matrix.org">https://matrix.to/#/#XenProject:mat=
rix.org</a></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:13px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;">XenDevel: <a href=3D"https:=
//matrix.to/#/#XenDevel:matrix.org">https://matrix.to/#/#XenDevel:matrix.or=
g</a></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:13px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;">XenSocial: <a href=3D"https=
://matrix.to/#/#XenSocial:matrix.org">https://matrix.to/#/#XenSocial:matrix=
.org</a></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-variant-alternates:normal;font-k=
erning:auto;font-feature-settings:normal;font-stretch:normal;font-size:13px=
;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p></div><=
div><div style=3D"color:rgb(136,136,136)">Open Source Community Manager</di=
v><div style=3D"color:rgb(136,136,136)">XenServer, Cloud Software Group</di=
v></div></div></div></div></div></div>

--000000000000d71711060a9648dd--

