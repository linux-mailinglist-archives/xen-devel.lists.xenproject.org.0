Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D097AD6D4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 13:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607828.946150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjYO-0003AY-Sg; Mon, 25 Sep 2023 11:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607828.946150; Mon, 25 Sep 2023 11:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkjYO-00038c-Ov; Mon, 25 Sep 2023 11:15:04 +0000
Received: by outflank-mailman (input) for mailman id 607828;
 Mon, 25 Sep 2023 11:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D6T=FJ=actia.se=jonas.blixt@srs-se1.protection.inumbo.net>)
 id 1qkjYN-00038W-3B
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 11:15:03 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c56138b0-5b94-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 13:15:02 +0200 (CEST)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 25 Sep
 2023 13:15:01 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.032; Mon, 25 Sep 2023 13:15:01 +0200
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
X-Inumbo-ID: c56138b0-5b94-11ee-878a-cb3800f73035
From: Jonas Blixt <jonas.blixt@actia.se>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xen(arm64)  hang on suspend/resume
Thread-Topic: Xen(arm64)  hang on suspend/resume
Thread-Index: Adnvmnpoa5ryhO19Q7aaxFF2dGz1TQ==
Date: Mon, 25 Sep 2023 11:15:01 +0000
Message-ID: <3c79ea2fec984e21b07d9365c08a5862@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.144]
x-esetresult: clean, is OK
x-esetid: 37303A294A191A5C6C7262
Content-Type: multipart/alternative;
	boundary="_000_3c79ea2fec984e21b07d9365c08a5862actiase_"
MIME-Version: 1.0

--_000_3c79ea2fec984e21b07d9365c08a5862actiase_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I've encountered a strange behavior with Xen on arm64 with regards to suspe=
nd/resume.

My setup:
Version: Xen 4.13.1
Target: NXP imx8x SoC

We also use a set of patches from Aggios (https://xen-devel.narkive.com/yGp=
s0HKG/rfc-v2-xen-arm-suspend-to-ram-support-in-xen-for-arm)

Occasionally xen gets stuck on resume. We know that the lower levels wake u=
p and xen starts to resume because xen's debug console is available. When w=
e're in this state dom0 does not resume and both pCPU's are in idle loops. =
If we at this point issue debug console commands (like 'h' for the help men=
u) that schedule tasklets dom0 wakes up and continues. Debug function that =
run in the irq-handler does not have the same effect.

This is what the run queue looks like:

sched_smt_power_savings: disabled
NOW=3D490275382125
Online Cpus: 0-1
Cpupool 0:
Cpus: 0-1
Scheduler: SMP Credit Scheduler rev2 (credit2)
Active queues: 1
    default-weight     =3D 256
Runqueue 0:
    ncpus              =3D 2
    cpus               =3D 0-1
    max_weight         =3D 256
    pick_bias          =3D 1
    instload           =3D 1
    aveload            =3D 282294 (~107%)
    idlers: 0
    tickled: 0
    fully idle cores: 0
Domain info:
    Domain: 0 w 256 c 0 v 2
      1: [0.0] flags=3D2 cpu=3D1 credit=3D984625 [w=3D256] load=3D208781 (~=
79%)
      2: [0.1] flags=3D0 cpu=3D1 credit=3D9742375 [w=3D256] load=3D25693 (~=
9%)
    Domain: 1 w 256 c 0 v 1
      3: [1.0] flags=3D0 cpu=3D1 credit=3D10447250 [w=3D256] load=3D7835 (~=
2%)
Runqueue 0:
CPU[00] runq=3D0, sibling=3D{0}, core=3D{0}
CPU[01] runq=3D0, sibling=3D{1}, core=3D{1}
    run: [0.0] flags=3D2 cpu=3D1 credit=3D-1543000 [w=3D256] load=3D208781 =
(~79%)
RUNQ:
      0: [0.1] flags=3D0 cpu=3D1 credit=3D10275375 [w=3D256] load=3D25279 (=
~9%)
[t: display multi-cpu clock info]
Synced stime skew: max=3D125ns avg=3D125ns samples=3D1 current=3D125ns
Synced cycles skew: max=3D1 avg=3D1 samples=3D1 current=3D1

I would be grateful if I could get some hint's on how to debug this.

Best Regards
Jonas



--_000_3c79ea2fec984e21b07d9365c08a5862actiase_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I&#8217;ve encountered a strang=
e behavior with Xen on arm64 with regards to suspend/resume.<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">My setup:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white">Vers=
ion:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#172B4D;background:white">Xen 4.13.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white">Targ=
et: NXP imx8x SoC<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white">We a=
lso use a set of patches from Aggios (<a href=3D"https://xen-devel.narkive.=
com/yGps0HKG/rfc-v2-xen-arm-suspend-to-ram-support-in-xen-for-arm">https://=
xen-devel.narkive.com/yGps0HKG/rfc-v2-xen-arm-suspend-to-ram-support-in-xen=
-for-arm</a>)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Segoe UI&quot;,sans-serif;color:#172B4D;background:white">Occa=
sionally xen gets stuck on resume. We know that the lower levels wake up an=
d xen starts to resume because xen&#8217;s debug console
 is available. When we&#8217;re in this state dom0 does not resume and both=
 pCPU&#8217;s are in idle loops. If we at this point issue debug console co=
mmands (like &#8216;h&#8217; for the help menu) that schedule tasklets dom0=
 wakes up and continues. Debug function that run in the
 irq-handler does not have the same effect.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This is what the run queue look=
s like:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">sched_smt_power_savings: disabl=
ed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">NOW=3D490275382125<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Online Cpus: 0-1<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cpupool 0:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Cpus: 0-1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Scheduler: SMP Credit Scheduler=
 rev2 (credit2)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Active queues: 1<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; default-weig=
ht&nbsp;&nbsp;&nbsp;&nbsp; =3D 256<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Runqueue 0:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; ncpus&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; cpus&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; =3D 0-1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; max_weight&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 256<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; pick_bias&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 1<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; instload&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 1<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; aveload&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D 282294 (~=
107%)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; idlers: 0<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; tickled: 0<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; fully idle c=
ores: 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Domain info:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Domain: 0 w =
256 c 0 v 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1: [0.0] flags=3D2 cpu=3D1 credit=3D984625 [w=3D256] load=3D208781 (~79%)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2: [0.1] flags=3D0 cpu=3D1 credit=3D9742375 [w=3D256] load=3D25693 (~9%)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; Domain: 1 w =
256 c 0 v 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
3: [1.0] flags=3D0 cpu=3D1 credit=3D10447250 [w=3D256] load=3D7835 (~2%)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Runqueue 0:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU[00] runq=3D0, sibling=3D{0}=
, core=3D{0}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU[01] runq=3D0, sibling=3D{1}=
, core=3D{1}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; run: [0.0] f=
lags=3D2 cpu=3D1 credit=3D-1543000 [w=3D256] load=3D208781 (~79%)<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RUNQ:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0: [0.1] flags=3D0 cpu=3D1 credit=3D10275375 [w=3D256] load=3D25279 (~9%)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[t: display multi-cpu clock inf=
o]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Synced stime skew: max=3D125ns =
avg=3D125ns samples=3D1 current=3D125ns<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Synced cycles skew: max=3D1 avg=
=3D1 samples=3D1 current=3D1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would be grateful if I could =
get some hint&#8217;s on how to debug this.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jonas<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_3c79ea2fec984e21b07d9365c08a5862actiase_--

