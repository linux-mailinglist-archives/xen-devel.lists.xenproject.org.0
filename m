Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC50847CDD6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 09:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250688.431715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzwdB-0001Ny-Kt; Wed, 22 Dec 2021 08:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250688.431715; Wed, 22 Dec 2021 08:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzwdB-0001LO-HP; Wed, 22 Dec 2021 08:05:49 +0000
Received: by outflank-mailman (input) for mailman id 250688;
 Wed, 22 Dec 2021 08:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtqY=RH=gmail.com=ryancaicse@srs-se1.protection.inumbo.net>)
 id 1mzwdA-0001LH-00
 for xen-devel@lists.xen.org; Wed, 22 Dec 2021 08:05:48 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6944d37-62fd-11ec-bb0b-79c175774b5d;
 Wed, 22 Dec 2021 09:05:46 +0100 (CET)
Received: by mail-pg1-x533.google.com with SMTP id m15so1437428pgu.11
 for <xen-devel@lists.xen.org>; Wed, 22 Dec 2021 00:05:46 -0800 (PST)
Received: from [30.135.82.253] ([8.218.232.85])
 by smtp.gmail.com with ESMTPSA id c2sm1509154pfl.200.2021.12.22.00.05.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Dec 2021 00:05:43 -0800 (PST)
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
X-Inumbo-ID: f6944d37-62fd-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:date:subject:from:to:message-id:thread-topic
         :mime-version;
        bh=92tAYZJCH+R0jJnZ+FpbLB7ckqn85Vv7DdOdKvJSnNU=;
        b=PnNELN0IAm8UAxJ0y8Qq/9FJzVSSnK2lyHzCeFRsDCCibQ3+oAN3wQnRBpBoIZIm1m
         DAzbO23CRcPI4stwzbifdBWm3JcmbEpvIwCsmwOgXEahLGEqd/lfKRZ9TLg2cWXqvEvT
         IMvZ15jI6gvlDCCJD9ijikqzlceK0HndprpFjLI7pItZGfz8nyd+xUPZ+7IWwV8kmOzz
         1hxHoLFbmW/7PuzG2BaFEfRt1vJ8mTg/f6Lrm9rsWagCwqD5ryCXf6Nh5EQTBcrnNBji
         hq5hGvvmdjC2ZwMNF0BkS7Zr0Ocsl3fOJFpuloibC71U9hp7+px2XSPYlP5FllQf2+EC
         rndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:date:subject:from:to:message-id
         :thread-topic:mime-version;
        bh=92tAYZJCH+R0jJnZ+FpbLB7ckqn85Vv7DdOdKvJSnNU=;
        b=poymvZvviq/W8EQSHM7F4COHL1dHJCMU1oLEFqurUL2NisS78vYbY9CH32aSx4lMmm
         2ohFaNr/7QbtYw1uN3kO05aiiXhooCZtirz251bdMlBE+ViWvlsQkM3susYubAxh2Pcg
         h09dTyfDdJHf7iW1QFgo3iRQiapavVt3LviIN78Du+MW6oJLg0JGwxWNSroD65nTRJfd
         IIEQpu0AX4plceh6aG4r9NINtTzFu160595sdwl9+ZkmhOYVePHnCUsuvRH/rgVOQjRW
         LUcTcDvzcnMuaUORgYQyo20Q2ZjLVajNF4CR3KA44wRdpjWXWh7n2+Ne7lL1b1+uAZ9r
         bAMg==
X-Gm-Message-State: AOAM533MSp7ivWjG/Q8I/+L9CAWvs+28FWmEAiSjLDTMDbfun8Js3rDd
	DaSQN5ZluoR5n41+7fLQ0i9psuxLg7lt7mwM
X-Google-Smtp-Source: ABdhPJwSnwULjY7vc364YWVlZSH3tOLhV8PPuOCDhiL/ZKdSHzTlClwXjsEb2LE7v1CPAruC34pzrg==
X-Received: by 2002:a63:657:: with SMTP id 84mr1706685pgg.399.1640160344145;
        Wed, 22 Dec 2021 00:05:44 -0800 (PST)
User-Agent: Microsoft-MacOutlook/16.56.21121100
Date: Wed, 22 Dec 2021 16:05:40 +0800
Subject: [BUG] Resource leaks in Xen
From: Ryan Cai <ryancaicse@gmail.com>
To: <xen-devel@lists.xen.org>,
	<keir@xen.org>,
	<dgdegra@tycho.nsa.gov>
Message-ID: <62B51AB1-2C2B-402A-A7C8-5ADACE265DA4@gmail.com>
Thread-Topic: [BUG] Resource leaks in Xen
Mime-version: 1.0
Content-type: multipart/alternative;
	boundary="B_3723033942_215283608"

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3723033942_215283608
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Dear maintainers for Xen Project,

 

             I am writing you to report potential resource leak bugs. In the file /xen/tools/flask/utils/label-pci.c, the methods fopen and fclose may not matched when returning at Line 76, resulting in a resource leak. Looking forward to your feedback. Thank for checking.

 

 

Locations, https://github.com/xen-project/xen/blame/25849c8b16f2a5b7fcd0a823e80a5f1b590291f9/tools/flask/utils/label-pci.c#L63-L76

 

 

Best,

Ryan Cai

 


--B_3723033942_215283608
Content-type: text/html;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:schema=
s-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/office/20=
04/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta http-equiv=3DC=
ontent-Type content=3D"text/html; charset=3Dutf-8"><meta name=3DGenerator content=3D=
"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-HK link=3D"#0563C1" vlink=3D"#954F72" style=3D'wo=
rd-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN=
-US style=3D'font-size:14.0pt;font-family:"Times New Roman",serif;color:black'=
>Dear maintainers for<span class=3Dapple-converted-space>&nbsp;</span></span><=
span lang=3DEN-US style=3D'font-size:14.0pt;font-family:"Times New Roman",serif;=
color:#070706;background:#FFEE94'>Xen</span><span class=3Dapple-converted-spac=
e><span lang=3DEN-US style=3D'font-size:14.0pt;font-family:"Times New Roman",ser=
if;color:black'>&nbsp;</span></span><span lang=3DEN-US style=3D'font-size:14.0pt=
;font-family:"Times New Roman",serif;color:black'>Project,</span><span style=
=3D'font-family:"Times New Roman",serif;color:black'><o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'caret-color: rgb(0, 0, 0);font-variant-caps: normal;o=
rphans: auto;text-align:start;widows: auto;-webkit-text-size-adjust: auto;-w=
ebkit-text-stroke-width: 0px;word-spacing:0px'><span lang=3DEN-US style=3D'font-=
size:14.0pt;font-family:"Times New Roman",serif;color:black'>&nbsp;</span><s=
pan style=3D'font-family:"Times New Roman",serif;color:black'><o:p></o:p></spa=
n></p><p class=3DMsoNormal style=3D'caret-color: rgb(0, 0, 0);font-variant-caps:=
 normal;orphans: auto;text-align:start;widows: auto;-webkit-text-size-adjust=
: auto;-webkit-text-stroke-width: 0px;word-spacing:0px'><span lang=3DEN-US sty=
le=3D'font-size:14.0pt;font-family:"Times New Roman",serif;color:black'>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am writ=
ing you to report potential resource leak bugs. In the file /xen/tools/flask=
/utils/label-pci.c, the methods fopen and fclose may not matched when return=
ing at Line 76, resulting in a resource leak. </span><span style=3D'font-size:=
14.0pt;font-family:"Times New Roman",serif;color:black'>Looking forward to y=
our feedback. Thank for checking</span><span lang=3DEN-US style=3D'font-size:14.=
0pt;font-family:"Times New Roman",serif;color:black'>.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:14.0pt;font-family:"Times New Roma=
n",serif;color:black'>&nbsp;</span><span style=3D'font-family:"Times New Roman=
",serif;color:black'><o:p></o:p></span></p><p class=3DMsoNormal style=3D'caret-c=
olor: rgb(0, 0, 0);font-variant-caps: normal;orphans: auto;text-align:start;=
widows: auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width: 0px;w=
ord-spacing:0px'><span lang=3DEN-US style=3D'font-size:14.0pt;font-family:"Times=
 New Roman",serif;color:black'>&nbsp;</span><span style=3D'font-family:"Times =
New Roman",serif;color:black'><o:p></o:p></span></p><p class=3DMsoNormal style=
=3D'caret-color: rgb(0, 0, 0);font-variant-caps: normal;orphans: auto;text-ali=
gn:start;widows: auto;-webkit-text-size-adjust: auto;-webkit-text-stroke-wid=
th: 0px;word-spacing:0px'><span lang=3DEN-US style=3D'font-size:14.0pt;font-fami=
ly:"Times New Roman",serif;color:black'>Locations,<span class=3Dapple-converte=
d-space>&nbsp;</span><a href=3D"https://github.com/xen-project/xen/blame/25849=
c8b16f2a5b7fcd0a823e80a5f1b590291f9/tools/flask/utils/label-pci.c#L63-L76">h=
ttps://github.com/xen-project/xen/blame/25849c8b16f2a5b7fcd0a823e80a5f1b5902=
91f9/tools/flask/utils/label-pci.c#L63-L76</a><o:p></o:p></span></p><p class=
=3DMsoNormal><span style=3D'font-family:"Times New Roman",serif;color:black'><o:=
p>&nbsp;</o:p></span></p><p class=3DMsoNormal style=3D'caret-color: rgb(0, 0, 0)=
;font-variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webk=
it-text-size-adjust: auto;-webkit-text-stroke-width: 0px;word-spacing:0px'><=
span lang=3DEN-US style=3D'font-size:14.0pt;font-family:"Times New Roman",serif;=
color:black'>&nbsp;</span><span style=3D'font-family:"Times New Roman",serif;c=
olor:black'><o:p></o:p></span></p><p class=3DMsoNormal style=3D'caret-color: rgb=
(0, 0, 0);font-variant-caps: normal;orphans: auto;text-align:start;widows: a=
uto;-webkit-text-size-adjust: auto;-webkit-text-stroke-width: 0px;word-spaci=
ng:0px'><span style=3D'font-size:14.0pt;font-family:"Times New Roman",serif;co=
lor:black'>Best,</span><span style=3D'font-family:"Times New Roman",serif;colo=
r:black'><o:p></o:p></span></p><p class=3DMsoNormal style=3D'caret-color: rgb(0,=
 0, 0);font-variant-caps: normal;orphans: auto;text-align:start;widows: auto=
;-webkit-text-size-adjust: auto;-webkit-text-stroke-width: 0px;word-spacing:=
0px'><span style=3D'font-size:14.0pt;font-family:"Times New Roman",serif;color=
:black'>Ryan Cai</span><span style=3D'font-family:"Times New Roman",serif;colo=
r:black'><o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.=
0pt'><o:p>&nbsp;</o:p></span></p></div></body></html>

--B_3723033942_215283608--



