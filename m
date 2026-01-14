Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE00D228BF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 07:25:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203823.1518923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgGm3-00086j-H3; Thu, 15 Jan 2026 06:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203823.1518923; Thu, 15 Jan 2026 06:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgGm3-00083c-Cv; Thu, 15 Jan 2026 06:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1203823;
 Wed, 14 Jan 2026 20:31:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAzU=7T=oasis-open.org=kelly.cullinane@srs-se1.protection.inumbo.net>)
 id 1vg7WU-0000yJ-C2
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 20:31:22 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8fbc09-f187-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 21:31:18 +0100 (CET)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-8c530866cf0so19845985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 12:31:18 -0800 (PST)
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
X-Inumbo-ID: fa8fbc09-f187-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oasis-open-org.20230601.gappssmtp.com; s=20230601; t=1768422677; x=1769027477; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2fYIETUaxvUJwN836Uu55NyXtFf/1P28/mpSnbMK4bA=;
        b=iMaUW4Oi7JbHLzbQtRYFJT5lPeAzfernodteg7jeetrFd4UQ8b8baRoklKtvurqQ0I
         Dr1+Z6X/eQsy1gVZqi6OfV/kDqCi4D/MnMWH9BVegSd6U13BAt+VyZ0Vj1UdqwusHFXB
         pbyK9HGMu6mol6UwHEbyiaApI79SyIaEtZtuzewdqSxjus+VuplNljOYEe28IWO5KWvn
         yGU/UwVUb6nE1wGtutQfxhaSR8J/xadRN9qR2UByQnTLq9SRQbjGGYvupN0tOiI80RIP
         EIFXi5Sdu+Tm1L6U9TI/PZzC3eaZLU6eFNVQoxkmkQOL0Tb6qPgTuwdFlPZ5hrcq/kio
         mWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422677; x=1769027477;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fYIETUaxvUJwN836Uu55NyXtFf/1P28/mpSnbMK4bA=;
        b=RwBTQ9P7PryT9hBJ4pRg0RyD0oOHL3ex4DRxloi9E/mXtDMS82tWBpc3+HOsFKhpw+
         xvHKS0ZExuyi5gyDCUmwVaMOaObCGv1ikhXgjowARfWHxMIzwGESqBTOPrF9iMxYef2s
         yhOHQW/QsFkjqaOk4JDwHBC9SCSobHZktjh8A23fRFRP2TTdhQrtTQj+SsNotVvbuvhg
         XM0cJYYNEfBtvs+orx9ob9wynJP1lw6pxV5k2aaH6JzzLHdI/dUVxA4hrcdmhcrirZoC
         /r76+M1qZtt2xGsUOCG+p+kmkbDMyD5mXSf7IDsA6uD73C9pnW1n5fRt+1dvRJu18Vwz
         /uag==
X-Forwarded-Encrypted: i=1; AJvYcCUAIsJn6037FGu5zqPsUSTWP0x8yQ2GLoeBMwsEY3xhqE4OyPvousNfZ+kdn9FNP2ypi7BgfFB5Dgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yye3Xc60ucJnyBM87jvg+Vp0tCaSnHOzRN5vIN4luaSvglAA9OL
	p2iMkCQ4usx8ChjedWadnfsqiiqfOEtKGQ08mCddWx5cuFhOTMF7YEL2UF3COzGLMwi54m4N9dP
	KEKO9pihqawBJs/xRz9hinl3JPUNDHv3NLKHdtrB7YuOkrMFSGCEl
X-Gm-Gg: AY/fxX5Y6W9CfOa0mLeurVpiFBJgT5+cVokcWAx03Yj5jmhQ/BtY8HpPpINYEvHff+b
	8GsrQ43Jh6D8z6XCuEBEn4uWMCTP4VwnbLD4RHBB65OCNpVbFyq2VypsSjlFq/dCX5iajq3tmDi
	vvHSc00vyw6nCvujkXEO2s/bwJPjFrXtBom7jbTNQq+wL4zldYWi90PsYThyNi+kF3/kvr5mXvA
	9DcKVeHzBxaz9jOmDqA2wvBAw1kPdC9j7znhlxscOheBVNg3W2ZO5BfF4r6oH/Zum10ba+HGVOa
	5bBPUBrpLf1xfhTmqqC0HGGHBzOAY4lmCRuo8fWaNqfNIad57bPSzoh1B+TZRRRyfOkZr9U=
X-Received: by 2002:a05:620a:29ce:b0:8bb:9f02:489e with SMTP id
 af79cd13be357-8c52fbcf15dmr558224785a.74.1768422676863; Wed, 14 Jan 2026
 12:31:16 -0800 (PST)
MIME-Version: 1.0
References: <CAAiF602+5JxVHEfZo-JaQ8rT3_E-ZLOw6unSpCY8Y_Fd3YJWmA@mail.gmail.com>
In-Reply-To: <CAAiF602+5JxVHEfZo-JaQ8rT3_E-ZLOw6unSpCY8Y_Fd3YJWmA@mail.gmail.com>
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Wed, 14 Jan 2026 15:30:39 -0500
X-Gm-Features: AZwV_QiCqCxANNz1udCuWC7xOZO9m8PtoTX-mt0_iIp4ME__ZtZZBHdr7BoO8PI
Message-ID: <CAAiF603Jc=DbVM3YPc8TGWXbtNEtdxwQkorLqYgVWMY_1wbw6g@mail.gmail.com>
Subject: Fwd: Invitation to comment on VIRTIO v1.4 CSD01
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000077ac2606485efdac"

--00000000000077ac2606485efdac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Kelly Cullinane <kelly.cullinane@oasis-open.org>
Date: Wed, Jan 14, 2026 at 3:28=E2=80=AFPM
Subject: Invitation to comment on VIRTIO v1.4 CSD01
To: <virtio-dev@lists.linux.dev>, <OASIS-virtio@connectedcommunity.org>, <
virtio-comment@lists.linux.dev>


OASIS members and other interested parties,


OASIS and the VIRTIO TC are pleased to announce that VIRTIO v1.4 CSD01 is
now available for public review and comment.


VIRTIO TC aims to enhance the performance of virtual devices by
standardizing key features of the VIRTIO (Virtual I/O) Device Specification=
.


Virtual I/O Device (VIRTIO) Version 1.4

Committee Specification Draft 01 / Public Review Draft 01

09 December 2025


TEX:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html
(Authoritative)

HTML:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
html

PDF:
https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
pdf


The ZIP containing the complete files of this release is found in the
directory:

https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.=
zip


How to Provide Feedback


OASIS and the VIRTIO TC value your feedback. We solicit input from
developers, users and

others, whether OASIS members or not, for the sake of improving the
interoperability and quality of its technical work.


The public review is now open and ends Friday, February 13 2026 at 23:59
UTC.


Comments may be submitted to the project=E2=80=99s comment mailing list at
virtio-comment@lists.linux.dev. You can subscribe to the list by sending an
email to

virtio-comment+subscribe@lists.linux.dev.


All comments submitted to OASIS are subject to the OASIS Feedback License,
which ensures that the feedback you provide carries the same obligations at
least as the obligations of the TC members. In connection with this public
review, we call your attention to the OASIS IPR Policy
<https://www.oasis-open.org/policies-guidelines/ipr/> applicable especially
to the work of this technical committee. All members of the TC should be
familiar with this document, which may create obligations regarding the
disclosure and availability of a member's patent, copyright, trademark and
license rights that read on an approved OASIS specification.


OASIS invites any persons who know of any such claims to disclose these if
they may be essential to the implementation of the above specification, so
that notice of them may be posted to the notice page for this TC's work.


Additional information about the specification and the VIRTIO TC can be
found at the TC=E2=80=99s public home page located here.
<https://groups.oasis-open.org/communities/tc-community-home2?CommunityKey=
=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c>

--00000000000077ac2606485efdac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------=
<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Kelly Cullinane</=
strong> <span dir=3D"auto">&lt;<a href=3D"mailto:kelly.cullinane@oasis-open=
.org">kelly.cullinane@oasis-open.org</a>&gt;</span><br>Date: Wed, Jan 14, 2=
026 at 3:28=E2=80=AFPM<br>Subject: Invitation to comment on VIRTIO v1.4 CSD=
01<br>To:  &lt;<a href=3D"mailto:virtio-dev@lists.linux.dev">virtio-dev@lis=
ts.linux.dev</a>&gt;,  &lt;<a href=3D"mailto:OASIS-virtio@connectedcommunit=
y.org">OASIS-virtio@connectedcommunity.org</a>&gt;,  &lt;<a href=3D"mailto:=
virtio-comment@lists.linux.dev">virtio-comment@lists.linux.dev</a>&gt;<br><=
/div><br><br><div dir=3D"ltr"><span id=3D"m_246052869587821151gmail-docs-in=
ternal-guid-f6a972b0-7fff-ad21-49fe-70c594d02e18"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre-wrap">OASIS members and other =
interested parties,=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal" id=3D"m=
_246052869587821151gmail-docs-internal-guid-525989c3-7fff-0844-0483-60dd162=
6f22d"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre-wrap">OASIS and the VIRTIO TC are pleased to announce that VI=
RTIO v1.4 CSD01 is now available for public review and comment.=C2=A0</span=
></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre-wrap">VIRTIO TC aims to </span>=
<span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(41,41,=
41);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wr=
ap">enhance the performance of virtual devices by standardizing key feature=
s of the VIRTIO (Virtual I/O) Device Specification.</span></p><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"f=
ont-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial,sans-serif;color:rgb(34,34,34);background-color:rgb(255,255,255);font-w=
eight:700;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Virtual I/O Device (VIRTIO) Version=
 1.4</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;c=
olor:rgb(34,34,34);background-color:rgb(255,255,255);font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">Committee Specification Draft 01 / Public Review Dr=
aft 01</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap">09 December 2025</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal=
"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre-wrap">TEX: </span><a href=3D"https://docs.oasis-open.org/virtio/vi=
rtio/v1.4/csprd01/virtio-v1.4-csprd01.html" style=3D"text-decoration:none" =
target=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-seri=
f;color:rgb(17,85,204);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1.4/=
csprd01/virtio-v1.4-csprd01.html</span></a><span style=3D"font-size:11pt;fo=
nt-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre-wrap"> (Authoritative)</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">HTM=
L: </span><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01=
/virtio-v1.4-csprd01.html" style=3D"text-decoration:none" target=3D"_blank"=
><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85=
,204);background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:underline;vertical-align:baseline;white-space=
:pre-wrap">https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1=
.4-csprd01.html</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">PDF: </span><a href=3D"https://docs.oasis-op=
en.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01.pdf" style=3D"text-de=
coration:none" target=3D"_blank"><span style=3D"font-size:11pt;font-family:=
Arial,sans-serif;color:rgb(17,85,204);background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://docs.oasis-open.org/virt=
io/virtio/v1.4/csprd01/virtio-v1.4-csprd01.pdf</span></a></p><p dir=3D"ltr"=
 style=3D"line-height:1.2;background-color:rgb(255,255,255);margin-top:0pt;=
margin-bottom:0pt"><br></p><p dir=3D"ltr" style=3D"line-height:1.2;backgrou=
nd-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre-wrap">The ZIP contai=
ning the complete files of this release is found in the directory:</span></=
p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><a href=3D"https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-=
v1.4-csprd01.zip" style=3D"text-decoration:none" target=3D"_blank"><span st=
yle=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:underline;vertical-align:baseline;white-space:pre-wrap=
">https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd0=
1.zip</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:700;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">How to Pro=
vide Feedback</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">OASIS=
 and the VIRTIO TC value your feedback. We solicit input from developers, u=
sers and=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial,sa=
ns-serif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre-wrap">others, whether OASIS members or not, for the sak=
e of improving the interoperability and quality of its technical work.</spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre-wrap">The public review is now=
 open</span><span style=3D"font-size:11pt;font-family:Arial,sans-serif;colo=
r:rgb(0,0,0);background-color:transparent;font-weight:700;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre-wrap"> </span><span style=3D"font-size:11pt;font-family:Arial,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre-wrap">and ends </span><span style=3D"font-size:11pt;font-fa=
mily:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-we=
ight:700;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre-wrap">Friday, February 13 2026 at 23:59 UT=
C.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">Comments may be s=
ubmitted to the project=E2=80=99s comment mailing list at </span><a href=3D=
"mailto:virtio-comment@lists.linux.dev" style=3D"text-decoration:none" targ=
et=3D"_blank"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;co=
lor:rgb(17,85,204);background-color:rgb(255,255,255);font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap">virtio-comment@lists.linux.dev</span></a><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(34,34,34);backgr=
ound-color:rgb(255,255,255);font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">.=
 You can subscribe to the list by sending an email to</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,204);backgr=
ound-color:rgb(255,255,255);font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><=
a href=3D"mailto:virtio-comment%2Bsubscribe@lists.linux.dev" target=3D"_bla=
nk">virtio-comment+subscribe@lists.linux.dev</a>.</span></p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"fon=
t-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;back=
ground-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre-wrap">All commen=
ts submitted to OASIS are subject to the OASIS Feedback License, which ensu=
res that the feedback you provide carries the same obligations at least as =
the obligations of the TC members. In connection with this public review, w=
e call your attention to the </span><a href=3D"https://www.oasis-open.org/p=
olicies-guidelines/ipr/" style=3D"text-decoration:none" target=3D"_blank"><=
span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(17,85,2=
04);background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:underline;vertical-align:baseline;white-space:p=
re-wrap">OASIS IPR Policy</span></a><span style=3D"font-size:11pt;font-fami=
ly:Arial,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre-wrap"> applicable especially to the work of =
this technical committee. All members of the TC should be familiar with thi=
s document, which may create obligations regarding the disclosure and avail=
ability of a member&#39;s patent, copyright, trademark and license rights t=
hat read on an approved OASIS specification.=C2=A0</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><b style=3D"fo=
nt-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line-height:1.656;bac=
kground-color:rgb(255,255,255);margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre-wrap">OASIS inv=
ites any persons who know of any such claims to disclose these if they may =
be essential to the implementation of the above specification, so that noti=
ce of them may be posted to the notice page for this TC&#39;s work.</span><=
/p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><b style=3D"font-weight:normal"><br></b></p><p dir=3D"ltr" style=3D"line=
-height:1.656;background-color:rgb(255,255,255);margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">Additional information about the specification and the VIRTIO TC ca=
n be found at the </span><a href=3D"https://groups.oasis-open.org/communiti=
es/tc-community-home2?CommunityKey=3Db3f5efa5-0e12-4320-873b-018dc7d3f25c" =
style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-size:1=
1pt;font-family:Arial,sans-serif;color:rgb(17,85,204);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:underline;vertical-align:baseline;white-space:pre-wrap">TC=E2=80=99s pub=
lic home page located here.</span></a></p><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><br><br></p></span></div>
</div></div>

--00000000000077ac2606485efdac--

