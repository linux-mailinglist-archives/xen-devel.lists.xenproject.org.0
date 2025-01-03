Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA726A00A85
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 15:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864580.1275789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTicY-00076i-0j; Fri, 03 Jan 2025 14:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864580.1275789; Fri, 03 Jan 2025 14:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTicX-00073t-U8; Fri, 03 Jan 2025 14:25:49 +0000
Received: by outflank-mailman (input) for mailman id 864580;
 Fri, 03 Jan 2025 14:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5mg=T3=inria.fr=fonyuy-asheri.caleb@srs-se1.protection.inumbo.net>)
 id 1tTicX-00073n-1m
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 14:25:49 +0000
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f6e58ca-c9de-11ef-a0de-8be0dac302b0;
 Fri, 03 Jan 2025 15:25:47 +0100 (CET)
Received: from zcs2-store8.inria.fr ([128.93.142.6])
 by mail2-relais-roc.national.inria.fr with ESMTP; 03 Jan 2025 15:25:46 +0100
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
X-Inumbo-ID: 9f6e58ca-c9de-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:message-id:subject:mime-version;
  bh=kt4M98Cy6jOnI51rllLEbPqEFW6bHVmTXKIBCBhaFSw=;
  b=dt8YoZtU3gEqPq4u7t1lMfBmf3bj7K6PdnjKzE3ZSQw/IZrKmNWQcOx2
   oeEYwDOBs0k3ljGs0f7R1yP0l6coLO90T3IypSL1s4/hlKKdz/8eSZtRM
   Wfr8kPLQXOxhZfiInjHw7crjuoK8cTVwbBhIQR/6TMrRyhgCSzxBMfjMP
   E=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=Pass smtp.mailfrom=fonyuy-asheri.caleb@inria.fr; spf=None smtp.helo=postmaster@zcs2-store8.inria.fr
Received-SPF: Pass (mail2-relais-roc.national.inria.fr: domain of
  fonyuy-asheri.caleb@inria.fr designates 128.93.142.6 as
  permitted sender) identity=mailfrom; client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="fonyuy-asheri.caleb@inria.fr";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 include:mailout.safebrands.com
  a:basic-mail.safebrands.com a:basic-mail01.safebrands.com
  a:basic-mail02.safebrands.com ip4:128.93.142.0/24
  ip4:192.134.164.0/24 ip4:128.93.162.160 ip4:128.93.162.3
  ip4:128.93.162.88 ip4:89.107.174.7 mx ~all"
Received-SPF: None (mail2-relais-roc.national.inria.fr: no sender
  authenticity information available from domain of
  postmaster@zcs2-store8.inria.fr) identity=helo;
  client-ip=128.93.142.6;
  receiver=mail2-relais-roc.national.inria.fr;
  envelope-from="fonyuy-asheri.caleb@inria.fr";
  x-sender="postmaster@zcs2-store8.inria.fr";
  x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="6.12,286,1728943200"; 
   d="scan'208,217";a="201340769"
X-MGA-submission: =?us-ascii?q?MDEckorXfVwRa+NVnxExk2KhM5sE//nkGUPG9B?=
 =?us-ascii?q?nV9gtLTczUfcAZUWsDdOmJ3+p1YUVaC+RhsJJKLgByboxMq0a/SR0cHE?=
 =?us-ascii?q?PHwLE8hOSRU5u9+wUVsWWYsniPk9O3YlaPK6oc4c2/zus2HIxTFe+GpI?=
 =?us-ascii?q?1LXP8XwhJZPml8Be34gw89uQ=3D=3D?=
Date: Fri, 3 Jan 2025 15:25:46 +0100 (CET)
From: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <944938302.6053932.1735914346495.JavaMail.zimbra@inria.fr>
Subject: Help With Identifying CPUID faulting logic in Xen code
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_87ed86ca-dcae-4c7f-b4d9-51ed8a12c060"
X-Originating-IP: [176.180.88.57]
X-Mailer: Zimbra 10.1.3_GA_4699 (ZimbraWebClient - GC131 (Linux)/10.1.3_GA_4703)
Thread-Index: /woCOpHH4VcfB1CDYgx0B/Ta9wD+cA==
Thread-Topic: Help With Identifying CPUID faulting logic in Xen code

--=_87ed86ca-dcae-4c7f-b4d9-51ed8a12c060
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello, 

I am interested in finding understanding how xen handles CPUID faulting and 
VM exits in general. Please can someone indicate to me the concerned files? 

I want to know how xen detects the execution of the CPUID instruction and 
ensures a guest only gets the features defined in cpuid-autogen.h file 
depending on the guest type. 

I started looking at the file xen/arch/x86/cpuid.c but don't really know which other 
files to check next. 

Thanks 

Caleb 

--=_87ed86ca-dcae-4c7f-b4d9-51ed8a12c060
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div style=3D"color: #000000; font-family: arial=
, helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whit=
e-space: normal; background-color: #fdfcfa; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial;" data-=
mce-style=3D"color: #000000; font-family: arial, helvetica, sans-serif; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-=
color: #fdfcfa; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;">Hello,</div><div style=3D"color: =
#000000; font-family: arial, helvetica, sans-serif; font-size: 16px; font-s=
tyle: normal; font-variant-ligatures: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text=
-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; white-space: normal; background-color: #fdfcfa; text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial;" data-mce-style=3D"color: #000000; font-family: arial,=
 helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-l=
igatures: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform=
: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white=
-space: normal; background-color: #fdfcfa; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;"><br></=
div><div style=3D"color: #000000; font-family: arial, helvetica, sans-serif=
; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2=
; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgr=
ound-color: #fdfcfa; text-decoration-thickness: initial; text-decoration-st=
yle: initial; text-decoration-color: initial;" data-mce-style=3D"color: #00=
0000; font-family: arial, helvetica, sans-serif; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: normal; background-color: #fdfcfa; text-de=
coration-thickness: initial; text-decoration-style: initial; text-decoratio=
n-color: initial;">I am interested in finding understanding how xen handles=
 CPUID faulting and&nbsp;</div><div style=3D"color: #000000; font-family: a=
rial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: normal; background-color: #fdfcfa; text-decoration-thickness: =
initial; text-decoration-style: initial; text-decoration-color: initial;" d=
ata-mce-style=3D"color: #000000; font-family: arial, helvetica, sans-serif;=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2;=
 text-align: start; text-indent: 0px; text-transform: none; widows: 2; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgro=
und-color: #fdfcfa; text-decoration-thickness: initial; text-decoration-sty=
le: initial; text-decoration-color: initial;">VM exits in general. Please c=
an someone indicate to me the concerned files?&nbsp;</div><div style=3D"col=
or: #000000; font-family: arial, helvetica, sans-serif; font-size: 16px; fo=
nt-style: normal; font-variant-ligatures: normal; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; white-space: normal; background-color: #fdfcfa; =
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" data-mce-style=3D"color: #000000; font-family: ar=
ial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #fdfcfa; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;"><b=
r></div><div style=3D"color: #000000; font-family: arial, helvetica, sans-s=
erif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphan=
s: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; ba=
ckground-color: #fdfcfa; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial;" data-mce-style=3D"color:=
 #000000; font-family: arial, helvetica, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: normal; background-color: #fdfcfa; tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;">I want to know how xen detects the execution of the =
CPUID instruction and&nbsp;</div><div style=3D"color: #000000; font-family:=
 arial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-va=
riant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette=
r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tr=
ansform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px=
; white-space: normal; background-color: #fdfcfa; text-decoration-thickness=
: initial; text-decoration-style: initial; text-decoration-color: initial;"=
 data-mce-style=3D"color: #000000; font-family: arial, helvetica, sans-seri=
f; font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: =
2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backg=
round-color: #fdfcfa; text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">ensures a guest only gets t=
he features defined in cpuid-autogen.h file&nbsp;</div><div style=3D"color:=
 #000000; font-family: arial, helvetica, sans-serif; font-size: 16px; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: normal; background-color: #fdfcfa; tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial;" data-mce-style=3D"color: #000000; font-family: arial=
, helvetica, sans-serif; font-size: 16px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whit=
e-space: normal; background-color: #fdfcfa; text-decoration-thickness: init=
ial; text-decoration-style: initial; text-decoration-color: initial;">depen=
ding on the guest type.&nbsp;</div><div style=3D"color: #000000; font-famil=
y: arial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-=
variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-=
transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; white-space: normal; background-color: #fdfcfa; text-decoration-thickne=
ss: initial; text-decoration-style: initial; text-decoration-color: initial=
;" data-mce-style=3D"color: #000000; font-family: arial, helvetica, sans-se=
rif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #fdfcfa; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial;"><br></div><div style=3D"c=
olor: #000000; font-family: arial, helvetica, sans-serif; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #fdfcfa=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;" data-mce-style=3D"color: #000000; font-family: =
arial, helvetica, sans-serif; font-size: 16px; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 white-space: normal; background-color: #fdfcfa; text-decoration-thickness:=
 initial; text-decoration-style: initial; text-decoration-color: initial;">=
I started looking at the file xen/arch/x86/cpuid.c but don't really know wh=
ich other&nbsp;</div><div style=3D"color: #000000; font-family: arial, helv=
etica, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; orphans: 2; text-align: start; text-indent: 0px; text-transform: non=
e; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-spac=
e: normal; background-color: #fdfcfa; text-decoration-thickness: initial; t=
ext-decoration-style: initial; text-decoration-color: initial;" data-mce-st=
yle=3D"color: #000000; font-family: arial, helvetica, sans-serif; font-size=
: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #fdfcfa; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;">files to check next.&nbsp;</div><div st=
yle=3D"color: #000000; font-family: arial, helvetica, sans-serif; font-size=
: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-alig=
n: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: =
0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color:=
 #fdfcfa; text-decoration-thickness: initial; text-decoration-style: initia=
l; text-decoration-color: initial;" data-mce-style=3D"color: #000000; font-=
family: arial, helvetica, sans-serif; font-size: 16px; font-style: normal; =
font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; white-space: normal; background-color: #fdfcfa; text-decoration-th=
ickness: initial; text-decoration-style: initial; text-decoration-color: in=
itial;"><br></div><div style=3D"color: #000000; font-family: arial, helveti=
ca, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: =
normal; background-color: #fdfcfa; text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial;" data-mce-style=
=3D"color: #000000; font-family: arial, helvetica, sans-serif; font-size: 1=
6px; font-style: normal; font-variant-ligatures: normal; font-variant-caps:=
 normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: =
start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: #f=
dfcfa; text-decoration-thickness: initial; text-decoration-style: initial; =
text-decoration-color: initial;">Thanks</div><div style=3D"color: #000000; =
font-family: arial, helvetica, sans-serif; font-size: 16px; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: normal; background-color: #fdfcfa; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial;" data-mce-style=3D"color: #000000; font-family: arial, helvetic=
a, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: n=
ormal; background-color: #fdfcfa; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial;"><br></div><div =
style=3D"color: #000000; font-family: arial, helvetica, sans-serif; font-si=
ze: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-colo=
r: #fdfcfa; text-decoration-thickness: initial; text-decoration-style: init=
ial; text-decoration-color: initial;" data-mce-style=3D"color: #000000; fon=
t-family: arial, helvetica, sans-serif; font-size: 16px; font-style: normal=
; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 4=
00; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px=
; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; white-space: normal; background-color: #fdfcfa; text-decoration-=
thickness: initial; text-decoration-style: initial; text-decoration-color: =
initial;">Caleb</div></div></body></html>
--=_87ed86ca-dcae-4c7f-b4d9-51ed8a12c060--

