Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37467A53E7F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 00:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902920.1310873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpyBz-0004cf-QJ; Wed, 05 Mar 2025 23:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902920.1310873; Wed, 05 Mar 2025 23:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpyBz-0004a9-Ms; Wed, 05 Mar 2025 23:30:23 +0000
Received: by outflank-mailman (input) for mailman id 902920;
 Wed, 05 Mar 2025 23:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ysEN=VY=malwation.com=kagan.isildak@srs-se1.protection.inumbo.net>)
 id 1tpyBy-0004CL-K9
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 23:30:22 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd1fc30f-fa19-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 00:30:20 +0100 (CET)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-72726025fa5so5938a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 15:30:20 -0800 (PST)
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
X-Inumbo-ID: cd1fc30f-fa19-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malwation.com; s=google; t=1741217419; x=1741822219; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTd8hOx6xiqwGKVo4Wa2y2yMQTGx9NRrzd5ctSx/1fw=;
        b=aq5lRPlLW9QaujcfccBjjeQCbL9iRM87xFSNURgbuiNY/tOk1cbNy1wSec25vP5jXo
         qWTkK9mEu0WzDOEEQaJ+gs6F0TdMxNUD5FS4eWuLkLJ1fw+0Wnu/N7xGQ66Pwk5kYb3k
         IJ0tZW4TX0kNqM1ZKzXCaoJlbVOxzkToNSiXYVJcpCCgStcDbgO6MCVvcr+eEmMfKdjK
         lGkUPzO2lC1YdxtH0EvtLdYyTqzl9x2icM1HnMuY5edQ/aS9KYv1RAzevdojmIu9XIn3
         kCIAKOdWJv6QuS6+VW4A1r9P0WagagqjO5RhRkS9pdtml+vPy4OwXtKP/HbJ8GuIaMX4
         ZyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741217419; x=1741822219;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTd8hOx6xiqwGKVo4Wa2y2yMQTGx9NRrzd5ctSx/1fw=;
        b=JLYVNUVP3XiUVJrY/Qv45nbBmNmtB4nyrUnAqa6AFv762KRmQt7yd5IWd3wSi+eLya
         CJwuwKwp9QxGfnmRcLWR1Zxj4DwOrObwFOl5rZp2ZDqEM8II3FruJaPL12L5VugIbp1R
         e2QgAiQU6ius0C3TC/C/GotvK2geZaVhJ4RSsgBpNMG41wGG8JWbQa4D6HZxRZ7l1rfE
         7Z46IOgEVoNCraOY9OTFMe9OxSuaGhiyKTlvJZW4PYX4k9YngocLP3corKDkhd+TFR1D
         xpaRHJWO6878bDjA3E1EFBiu99ZMMJOc5rfvLlTz5OsIQkvW+G+9EJ2ve9RLeTSSFrY9
         VQuA==
X-Gm-Message-State: AOJu0Yw9wW8l3XFmCpkXuxuKSE/qUV77fnT65jhxcXGiIm918gUfP9bW
	KAWwcRWb0q7cdZP/qlquSh0BpntRcH1dDQYsf8VgYpaHYsrYLrtMJJpwOWyZkRp35BVzO8QpaKX
	j/Qhr5nM37Dab39NCWmH/4rgAFloz2i1I5j6pddpv2p+j97h/ZVm0cQ==
X-Gm-Gg: ASbGncvgF1jh8wItFnCiVkN7n9sSad7WvDYQPJzBM0v27pMa8LM5q1GLFx7qVLubeBc
	Ypah8iAn8QQLU+CMhSCHzKJ0RBctWP8cmZSrlVTkWpLPAXRurSbDZgRh8BP2jVu0LvNoc4Dcfhd
	VG+iLrYXa4kKW7gtBhD4bkZTKA
X-Google-Smtp-Source: AGHT+IFr/OY62XosZ47UtBhuRB9uM6LIrzPnztlSOOfPwjsPfvzPS0bPzsEzQqDITP/S2eIruGpFktXTsszJl2ru1zA=
X-Received: by 2002:a05:6870:9110:b0:29e:69d9:8834 with SMTP id
 586e51a60fabf-2c21be86ea2mr2768323fac.0.1741217418760; Wed, 05 Mar 2025
 15:30:18 -0800 (PST)
MIME-Version: 1.0
References: <CABDHFN7uk0JdehT3R0f_PvRgT-thdNyywppekmjLWfSq13dNKQ@mail.gmail.com>
 <c145ee1e-91e9-491e-bd21-7bb0a04ab0a1@citrix.com>
In-Reply-To: <c145ee1e-91e9-491e-bd21-7bb0a04ab0a1@citrix.com>
From: =?UTF-8?B?S0HEnkFOIEnFnklMREFL?= <kagan.isildak@malwation.com>
Date: Thu, 6 Mar 2025 02:30:07 +0300
X-Gm-Features: AQ5f1JpcfCkb-k5pDbYy_u7335C7x4D-whHrZR-059hO4UhAdX0_AId8s4U7TmY
Message-ID: <CABDHFN66hPJC+0kc-nvC7hd-kLOWgYpo33FKYT6STFqaCg5y2w@mail.gmail.com>
Subject: Re: BUG - running new version on nested virtualization
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b8f3d1062fa0c5d5"

--000000000000b8f3d1062fa0c5d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Andrew

I know but as i said at 4.18 theres no problem, im mounting at /etc/fstab
succ.
Im facing this issue on newer versions (4.19, 4.20)
These installation also same with 4.18(same /etc/fstab config) but main
problem is why it raise error and cant mount

Andrew Cooper <andrew.cooper3@citrix.com>, 6 Mar 2025 Per, 01:44 tarihinde
=C5=9Funu yazd=C4=B1:

> On 05/03/2025 10:05 pm, KA=C4=9EAN I=C5=9EILDAK wrote:
> > Hey there
> >
> > I'm facing weird issue. At my lab env. i'm building xen 4.18 and make
> > deb package than i use it on virtual machine which running on esxi
> > with CPU features for nested virtualization and there's no problem. (I
> > can create vm and able to do all operational things etc.)
> >
> > Last week i tried to migrate 4.19 and 4.20 but Xen get stuck on
> > booting and at debug log i just see error about mounting /proc/xen
> > (mount: /proc/xen: mount point does not exist.) I've no f... idea why
> > it caused. (At my all tries, i used fresh install of ubuntu server
> > 22.04, 24.04)
> >
> > Is there any one faced issue and is there special things to do in
> > build phase for nested virtualization? (I didn't change anything while
> > building 4.18, i'm just using stable branch)
>
> /proc/xen isn't getting mounted, and that's necessary for the Xen
> tooling to work.  It's a custom filesystem of type "xenfs" in Linux.
>
> Check the status of proc-xen.mount
>
> ~Andrew
>


--=20

Ka=C4=9Fan I=C5=9EILDAK
Co-Founder

0553 839 2887

www.malwation.com <https://malwation.com/>   kagan.isildak@malwation.com

<https://twitter.com/gaissecurity>
<https://www.linkedin.com/company/gais-siber-g%C3%BCvenlik-teknolojileri/>



 Bu e-posta mesaj=C4=B1 ve eklerinde yer alan i=C3=A7erikler g=C3=B6nderild=
i=C4=9Fi ki=C5=9Fi ya da
firmaya =C3=B6zeldir. Ayr=C4=B1ca hukuken de gizli olabilir. Hi=C3=A7bir =
=C5=9Fekilde =C3=BC=C3=A7=C3=BCnc=C3=BC
ki=C5=9Filere a=C3=A7=C4=B1klanamaz ve yay=C4=B1nlanamaz. E=C4=9Fer bu mesa=
j=C4=B1 hataen ald=C4=B1ysan=C4=B1z
l=C3=BCtfen durumu g=C3=B6nderen ki=C5=9Fiye derhal bildiriniz ve mesaj=C4=
=B1 sisteminizden
siliniz. Mesaj=C4=B1n yetkili al=C4=B1c=C4=B1s=C4=B1 de=C4=9Filseniz hi=C3=
=A7bir k=C4=B1sm=C4=B1n=C4=B1 kopyalayamaz,
ba=C5=9Fkas=C4=B1na g=C3=B6nderemez veya hi=C3=A7bir =C5=9Fekilde bu mesaj=
=C4=B1 kullanamazs=C4=B1n=C4=B1z. E=C4=9Fer
mesaj=C4=B1n yetkili al=C4=B1c=C4=B1s=C4=B1 veya yetkili al=C4=B1c=C4=B1s=
=C4=B1na iletmekten sorumlu ki=C5=9Fi siz
de=C4=9Filseniz, l=C3=BCtfen mesaj=C4=B1 sisteminizden siliniz ve g=C3=B6nd=
ereni uyar=C4=B1n=C4=B1z.
=C4=B0nternet ileti=C5=9Fiminde tam g=C3=BCvenlik ve hatas=C4=B1z g=C3=B6nd=
erim garanti
edilemeyece=C4=9Finden; mesaj=C4=B1n yerine ula=C5=9Fmamas=C4=B1, ge=C3=A7 =
ula=C5=9Fmas=C4=B1 ya da i=C3=A7eri=C4=9Finin
bozulmas=C4=B1 gibi problemler de olu=C5=9Fabilir. G=C3=B6nderen ve Malwati=
on (Malwation Siber
G=C3=BCvenlik Teknolojileri A.=C5=9E.) bu mesaj=C4=B1n i=C3=A7erdi=C4=9Fi b=
ilgilerin do=C4=9Frulu=C4=9Fu,
b=C3=BCt=C3=BCnl=C3=BC=C4=9F=C3=BC ve g=C3=BCncelli=C4=9Fi konusunda bir ga=
ranti vermemektedir. Mesaj=C4=B1n
i=C3=A7eri=C4=9Finden, iletilmesinden, al=C4=B1nmas=C4=B1ndan, saklanmas=C4=
=B1ndan, gizlili=C4=9Finin
korunmamas=C4=B1ndan, vir=C3=BCs i=C3=A7ermesinden ve sisteminizde yaratabi=
lece=C4=9Fi olas=C4=B1
zararlardan Malwation sorumlu tutulamaz.

--000000000000b8f3d1062fa0c5d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e">Hey Andrew</div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace"=
>I know but as i said at 4.18 theres no problem, im mounting at /etc/fstab =
succ.</div><div class=3D"gmail_default" style=3D"font-family:monospace">Im =
facing this issue on newer versions (4.19, 4.20)</div><div class=3D"gmail_d=
efault" style=3D"font-family:monospace">These installation also same with 4=
.18(same /etc/fstab config) but main problem is why it raise error and cant=
 mount</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">Andrew Cooper &lt;<a href=3D"mailto:andre=
w.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt;, 6 Mar 2025 Per, 01=
:44 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 05/03/2025 10:05 pm, KA=C4=9EAN I=C5=9EILDAK wrote:<=
br>
&gt; Hey there<br>
&gt;<br>
&gt; I&#39;m facing weird issue. At my lab env. i&#39;m building xen 4.18 a=
nd make<br>
&gt; deb package than i use it on virtual machine which running on esxi<br>
&gt; with CPU features for nested virtualization and there&#39;s no problem=
. (I<br>
&gt; can create vm and able to do all operational things etc.)<br>
&gt;<br>
&gt; Last week i tried to migrate 4.19 and 4.20 but Xen get stuck on<br>
&gt; booting and at debug log i just see error about mounting /proc/xen<br>
&gt; (mount: /proc/xen: mount point does not exist.) I&#39;ve no f... idea =
why<br>
&gt; it caused. (At my all tries, i used fresh install of ubuntu server<br>
&gt; 22.04, 24.04)<br>
&gt;<br>
&gt; Is there any one faced issue and is there special things to do in<br>
&gt; build phase for nested virtualization? (I didn&#39;t change anything w=
hile<br>
&gt; building 4.18, i&#39;m just using stable branch)<br>
<br>
/proc/xen isn&#39;t getting mounted, and that&#39;s necessary for the Xen<b=
r>
tooling to work.=C2=A0 It&#39;s a custom filesystem of type &quot;xenfs&quo=
t; in Linux.<br>
<br>
Check the status of proc-xen.mount<br>
<br>
~Andrew<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><br><div><table border=3D"0" cellspacing=3D"0" c=
ellpadding=3D"0" style=3D"color:rgb(34,34,34)"><tbody><tr><td valign=3D"top=
" style=3D"border-top:none;border-bottom:none;border-left:none;border-right=
:2.25pt solid rgb(32,160,180);padding:0cm 5.25pt 0cm 0cm"><img width=3D"96"=
 height=3D"95" src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4zXKD=
IUp1B8sAuA-UJySlziCIlcmv_GGa_bxnfd_BWf5cZHbkfd8ZT_Yy5y9l35ciP3gNI-OB1MwZXt"=
></td><td style=3D"padding:0cm 0cm 0cm 9pt"><table border=3D"0" cellspacing=
=3D"0" cellpadding=3D"0"><tbody><tr><td style=3D"padding:0cm 0cm 3.75pt"><p=
 class=3D"MsoNormal"><span style=3D"font-size:13.5pt;font-family:Arial,sans=
-serif;color:rgb(32,160,180)">Ka=C4=9Fan I=C5=9EILDAK</span></p></td></tr><=
tr><td style=3D"padding:2.85pt 0cm 0cm"><font color=3D"#333333" face=3D"Ari=
al, sans-serif"><span style=3D"font-size:14px">Co-Founder</span></font></td=
></tr><tr><td style=3D"padding:2.85pt 0cm 0cm"><p class=3D"MsoNormal"><span=
 style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51)=
">0553 839 2887</span></p></td></tr><tr><td style=3D"padding:2.85pt 0cm 0cm=
"><p class=3D"MsoNormal"><a href=3D"https://malwation.com/" target=3D"_blan=
k"><span style=3D"color:rgb(29,161,219)">www.malwation.com</span></a>=C2=A0=
=C2=A0<span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:rg=
b(32,160,180)">=C2=A0</span><span style=3D"font-size:10.5pt;font-family:Ari=
al,sans-serif;color:rgb(51,51,51)"><a href=3D"mailto:kagan.isildak@malwatio=
n.com" target=3D"_blank"><span style=3D"color:rgb(29,161,219)">kagan.isilda=
k@malwation.com</span></a></span></p></td></tr><tr><td style=3D"padding:3.7=
5pt 0cm 0cm"><p class=3D"MsoNormal"><a href=3D"https://twitter.com/gaissecu=
rity" target=3D"_blank"><span style=3D"font-size:12pt;font-family:&quot;Tim=
es New Roman&quot;,serif;color:rgb(149,79,114);border:1pt none windowtext;p=
adding:0cm"></span></a><span style=3D"font-size:12pt;font-family:&quot;Time=
s New Roman&quot;,serif">=C2=A0=C2=A0</span><a href=3D"https://www.linkedin=
.com/company/gais-siber-g%C3%BCvenlik-teknolojileri/" target=3D"_blank"><sp=
an style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,serif;co=
lor:rgb(149,79,114);border:1pt none windowtext;padding:0cm"></span></a><spa=
n style=3D"font-size:12pt;font-family:&quot;Times New Roman&quot;,serif">=
=C2=A0=C2=A0</span><span style=3D"font-size:12pt;font-family:&quot;Times Ne=
w Roman&quot;,serif;color:rgb(149,79,114);border:1pt none windowtext;paddin=
g:0cm"></span></p></td></tr></tbody></table></td></tr></tbody></table><p cl=
ass=3D"MsoNormal" style=3D"color:rgb(34,34,34)"><span style=3D"color:black"=
>=C2=A0</span></p><p class=3D"MsoNormal" style=3D"color:rgb(34,34,34)"><spa=
n style=3D"color:black">=C2=A0</span><span lang=3D"EN-US" style=3D"font-siz=
e:8pt">Bu e-posta mesaj=C4=B1 ve eklerinde yer alan i=C3=A7erikler g=C3=B6n=
derildi=C4=9Fi ki=C5=9Fi ya da firmaya =C3=B6zeldir. Ayr=C4=B1ca hukuken de=
 gizli olabilir. Hi=C3=A7bir =C5=9Fekilde =C3=BC=C3=A7=C3=BCnc=C3=BC ki=C5=
=9Filere a=C3=A7=C4=B1klanamaz ve yay=C4=B1nlanamaz. E=C4=9Fer bu mesaj=C4=
=B1 hataen ald=C4=B1ysan=C4=B1z l=C3=BCtfen durumu g=C3=B6nderen ki=C5=9Fiy=
e derhal bildiriniz ve mesaj=C4=B1 sisteminizden siliniz. Mesaj=C4=B1n yetk=
ili al=C4=B1c=C4=B1s=C4=B1 de=C4=9Filseniz hi=C3=A7bir k=C4=B1sm=C4=B1n=C4=
=B1 kopyalayamaz, ba=C5=9Fkas=C4=B1na g=C3=B6nderemez veya hi=C3=A7bir =C5=
=9Fekilde bu mesaj=C4=B1 kullanamazs=C4=B1n=C4=B1z. E=C4=9Fer mesaj=C4=B1n =
yetkili al=C4=B1c=C4=B1s=C4=B1 veya yetkili al=C4=B1c=C4=B1s=C4=B1na iletme=
kten sorumlu ki=C5=9Fi siz de=C4=9Filseniz, l=C3=BCtfen mesaj=C4=B1 sistemi=
nizden siliniz ve g=C3=B6ndereni uyar=C4=B1n=C4=B1z. =C4=B0nternet ileti=C5=
=9Fiminde tam g=C3=BCvenlik ve hatas=C4=B1z g=C3=B6nderim garanti edilemeye=
ce=C4=9Finden; mesaj=C4=B1n yerine ula=C5=9Fmamas=C4=B1, ge=C3=A7 ula=C5=9F=
mas=C4=B1 ya da i=C3=A7eri=C4=9Finin bozulmas=C4=B1 gibi problemler de olu=
=C5=9Fabilir. G=C3=B6nderen ve Malwation (<span style=3D"font-size:10.6667p=
x">Malwation=C2=A0</span>Siber G=C3=BCvenlik Teknolojileri A.=C5=9E.) bu me=
saj=C4=B1n i=C3=A7erdi=C4=9Fi bilgilerin do=C4=9Frulu=C4=9Fu, b=C3=BCt=C3=
=BCnl=C3=BC=C4=9F=C3=BC ve g=C3=BCncelli=C4=9Fi konusunda bir garanti verme=
mektedir. Mesaj=C4=B1n i=C3=A7eri=C4=9Finden, iletilmesinden, al=C4=B1nmas=
=C4=B1ndan, saklanmas=C4=B1ndan, gizlili=C4=9Finin korunmamas=C4=B1ndan, vi=
r=C3=BCs i=C3=A7ermesinden ve sisteminizde yaratabilece=C4=9Fi olas=C4=B1 z=
ararlardan=C2=A0<span style=3D"font-size:10.6667px">Malwation=C2=A0</span>s=
orumlu tutulamaz.</span></p></div></div></div>

--000000000000b8f3d1062fa0c5d5--

