Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D6429E5C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:11:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206775.362425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maBvr-0005KP-4K; Tue, 12 Oct 2021 07:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206775.362425; Tue, 12 Oct 2021 07:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maBvr-0005Ic-1J; Tue, 12 Oct 2021 07:10:39 +0000
Received: by outflank-mailman (input) for mailman id 206775;
 Tue, 12 Oct 2021 06:55:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WKCD=PA=gmail.com=ryancaicse@srs-us1.protection.inumbo.net>)
 id 1maBgl-0003Y3-PA
 for xen-devel@lists.xen.org; Tue, 12 Oct 2021 06:55:03 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12b90e37-6251-44b2-956f-cdc3ac6b83cf;
 Tue, 12 Oct 2021 06:55:02 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id oa4so14279052pjb.2
 for <xen-devel@lists.xen.org>; Mon, 11 Oct 2021 23:55:02 -0700 (PDT)
Received: from [30.135.82.253] ([23.98.35.75])
 by smtp.gmail.com with ESMTPSA id r5sm1517362pjd.13.2021.10.11.23.55.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Oct 2021 23:55:01 -0700 (PDT)
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
X-Inumbo-ID: 12b90e37-6251-44b2-956f-cdc3ac6b83cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:date:subject:from:to:message-id:thread-topic
         :mime-version;
        bh=R/vIZ5wUWsewvsCHSMp/LZJQsRQ5v5ylj55ne08rR6Q=;
        b=TNUENUnXsW0uSysSIqkqkFDEu8cl7aANF/3cEfW17wjWDoYS5IBjB2m0HQIRNUVXjn
         a8QD4gyqCNYxu55hNjB4SEFQKZJvjWPfUQge9Vd2qUbt7WnSLujlzcwi50Ee3tjBuA4g
         Giokn+qA13rNbuvsKyNeSRwTGr2z4VwLYJNKGyGux97Rxyv32NnX2iwER02O7JexmnMc
         9MyL20AOMGE1orpsLyADng/B9Gty/IoWgpZuMOXXKHBiVRx2N70nzuKI0M9pfy9FZebV
         rEumN2smv4iEz4nh0N3Zp6Y/jlDqi0etywvCcZSH6rD7x6ULEMPOMigcy8Kqy6Fr/Ujw
         JnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:user-agent:date:subject:from:to:message-id
         :thread-topic:mime-version;
        bh=R/vIZ5wUWsewvsCHSMp/LZJQsRQ5v5ylj55ne08rR6Q=;
        b=296yA5DBKy0iHo4x5leig1ShVzzdy9YvjNotsa+xAgRmNGmZ0Vfy6qGZ1KABDD8NZC
         T9wXMsUliTy9nx2rVrLKaQo5ICx+uj8M4GjcZNVlw+s/nO+ZxDj9msip6WzTX5sAQmWs
         LRmK49ylWD8Yk6htFiMCV9xXT0LSTvBIi7LaAEWJ4gsJyWDMwwN7mgDwh0Sb2jfotmjl
         /P3gZgKsAVl5HxdNCTtfSRey3C7m90q5/eIlFgC67ad1IBwk9NBtwqOIeZ1e9noWkF6x
         7UrcnWlAkqbzr0WisbZiRX/KvGWfdDcrWNS/4MFdH+tfjpYMDHDtrFmvmKqYVp6WiEVK
         gxhg==
X-Gm-Message-State: AOAM533gGhzXqIIIUgk1230v0BBtXI29f/4HU63OGKgvJJ6G9mT1Apyo
	lmeOoo82to9IGyLt8f957EcnQktQ/vI=
X-Google-Smtp-Source: ABdhPJzx0x4B57V5RuX/vFxRy1ULjPQX3pzLyOJiKPcgIDKIKf6LZDli68ooKofdWe3bFHs0WocvEA==
X-Received: by 2002:a17:90a:df91:: with SMTP id p17mr4041156pjv.185.1634021701612;
        Mon, 11 Oct 2021 23:55:01 -0700 (PDT)
User-Agent: Microsoft-MacOutlook/16.53.21091200
Date: Tue, 12 Oct 2021 14:54:57 +0800
Subject: [BUG] improper locking due to the unreleased lock
From: Ryan Cai <ryancaicse@gmail.com>
To: <xen-devel@lists.xen.org>,
	<ian.jackson@eu.citrix.com>
Message-ID: <747C0632-F341-4716-8B4A-10428A39A07D@gmail.com>
Thread-Topic: [BUG] improper locking due to the unreleased lock
Mime-version: 1.0
Content-type: multipart/alternative;
	boundary="B_3716895300_1494279762"

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3716895300_1494279762
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Dear maintainers for Xen Project,

=20

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am writing you to report a bug due to the unrele=
ased lock. The impact could be deadlock or memory consumption. In the functi=
on of read_watch_internal, the mutex lock h->watch_mutex (Line901) is not re=
leased correctly when read_message(h,nonblocking)=3D=3D -1(Line 923). Looking fo=
rward to your feedback. Thank for checking.

=20

=20

Locations, https://github.com/xen-project/xen/blob/master/tools/libs/store/=
xs.c#L902-L924

=20

Best,

Ryan Cai

=20


--B_3716895300_1494279762
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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
-US style=3D'font-size:14.0pt'>Dear maintainers for Xen Project,<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:14.0pt'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:14=
.0pt'>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am writing you to report a bug due to the u=
nreleased lock. The impact could be deadlock or memory consumption. In the f=
unction of <i>read_watch_internal</i>, the mutex lock <i>h-&gt;watch_mutex</=
i> (<b>Line901</b>) is not released correctly when </span><i><span style=3D'fo=
nt-size:14.0pt'>read_message(h,nonblocking)=3D=3D -1</span></i><span style=3D'font=
-size:14.0pt'>(<b>Line 923</b>). Looking forward to your feedback. Thank for=
 checking</span><span lang=3DEN-US style=3D'font-size:14.0pt'>.<o:p></o:p></span=
></p><p class=3DMsoNormal><span style=3D'font-size:14.0pt'><o:p>&nbsp;</o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:14.0pt'><o:p>&nb=
sp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-size:14.=
0pt'>Locations, https://github.com/xen-project/xen/blob/master/tools/libs/st=
ore/xs.c#L902-L924<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:14.0pt'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><spa=
n style=3D'font-size:14.0pt'>Best,<o:p></o:p></span></p><p class=3DMsoNormal><sp=
an style=3D'font-size:14.0pt'>Ryan Cai<o:p></o:p></span></p><p class=3DMsoNormal=
><span lang=3DEN-US style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p></div=
></body></html>

--B_3716895300_1494279762--



