Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E42E8847
	for <lists+xen-devel@lfdr.de>; Sat,  2 Jan 2021 20:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60852.106726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvmSU-00057h-0A; Sat, 02 Jan 2021 19:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60852.106726; Sat, 02 Jan 2021 19:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kvmST-00057I-Ss; Sat, 02 Jan 2021 19:21:01 +0000
Received: by outflank-mailman (input) for mailman id 60852;
 Sat, 02 Jan 2021 19:21:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/2Y1=GF=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1kvmSS-00057D-1k
 for xen-devel@lists.xen.org; Sat, 02 Jan 2021 19:21:00 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7ad8e0-fd35-46bc-9cbc-3b19036d0003;
 Sat, 02 Jan 2021 19:20:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m5so26918701wrx.9
 for <xen-devel@lists.xen.org>; Sat, 02 Jan 2021 11:20:59 -0800 (PST)
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
X-Inumbo-ID: 6c7ad8e0-fd35-46bc-9cbc-3b19036d0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WI0J5nROitwv2X5/k/anZ7URVNwkjPJJDTc2iKDew/Y=;
        b=u/gEWNyHyaLOxOdjmL0CvA1gI/QwL6iZr/U2beh4CJmLhIJZlGY0FY1+qWF+J/Yova
         YqyW4ckJrf3dTU4BgAXV6MjQhZRGneI0Q+lyCYGn2wgBzrkHtPr4LU9CMKlMK01svSdS
         BnQHcyZalIViPv9RotvjUTrUzjzGuXji3svp7+4KLGQ3bB6Kn9scV/Lai8zjFWd39Yl4
         vmViaFOoA42QiKZVatFntQtM9QPFr1ThC8PEbSM28S0JHNGj4DiEVW0DfmClXftoTZth
         Skdlem+ZZ5DQYqObkY7DSRlE55V/Nu/RuehujykxRedaxflo1RlD6ocqu0Xz6HPkQXs3
         i5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WI0J5nROitwv2X5/k/anZ7URVNwkjPJJDTc2iKDew/Y=;
        b=KoGCROHQJw2R+qWwyYCNjTkaL0x53+4ysIOh54RUqDZI6gNeTE/ZvimriWIEucRRDR
         MloNwiWdBl6Vpn++e2w6r2dIaobgaii1kHKljKcoZIC1jzMwO/2HmWr4m9cDjFdJFJnh
         KIgFcnuj2Dy9XsdpehCQbgFlQnPshWohBayJJKIk8+9eUZzzvoedOnFH8BlSsS1gJoXZ
         5scp22cuq+efD06Co9bsTrk95cvjmym2/SNAblZYmpZHNpnRzrBpHqN3YCVgYI304xKk
         zfJ3vIx9bPkKOBUygLIkeq28PGKkg4gkkDtrN3fvKBcHaOHXl4vR9Mwdi+fk947CICli
         kNEA==
X-Gm-Message-State: AOAM533v/auLaWPYou0QFZ1U5JIrdtYAHqFvLPqBFpGKsYSdd0If14f5
	mJqMl9B3kmOgj3A1hYOVodOyhgXsCZ2sijGPKAc=
X-Google-Smtp-Source: ABdhPJyOr8dmt6z1a15nYZWDc2yuVX22ffqUNDQRGx/RIY4zNLGFd06nEIrJnP2B9lDtP+FhVjEgqGqN3cyITeKDvHw=
X-Received: by 2002:adf:8b15:: with SMTP id n21mr71405136wra.426.1609615258412;
 Sat, 02 Jan 2021 11:20:58 -0800 (PST)
MIME-Version: 1.0
References: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
 <21be2d74-a1d9-176f-70fb-7f86724a965b@citrix.com>
In-Reply-To: <21be2d74-a1d9-176f-70fb-7f86724a965b@citrix.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Sat, 2 Jan 2021 19:20:22 +0000
Message-ID: <CAAQRGoDcTxDyQh_2gES6L7wEEn8YES0MHp4zS5mLhhjC5j0w5g@mail.gmail.com>
Subject: Re: Identify an specific DomU inpecting all pages in memory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000b3e77d05b7efc18d"

--000000000000b3e77d05b7efc18d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure.

The goal is to emulate a scenario where a compromised guest attacks another
tenant in the same physical host reading/changing the memory content.
E.g., extract the RSA key.

I'll be in the domU kernel space. I'm assuming that the guest is able to
exploit
any vulnerability possible.
Effectively I'll be changing Xen's code (at least possible) to *emulate* a
vulnerability
(e.g., undo a patch).



Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *




On Sat, Jan 2, 2021 at 7:06 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 02/01/2021 17:02, Charles Gon=C3=A7alves wrote:
> > Hi,
> >
> > I'm building some attack loads targeting  Xen to my PhD and need to
> > identify the pages for a specific guest.
> > Assuming that I'm able to traverse the pages in memory, how do I
> > identify a guest (by ID or Name)?
> >
> > The dom0 is easy since I can inspect the start_info looking
> > for SIF_INITDOMAIN but I have no idea to identify a specific domU.
>
> Hello,
>
> Could you provide rather more details about what exactly you're trying
> to do?
>
> In particular, what context are you in when trying to identify the pages?
>
> ~Andrew
>

--000000000000b3e77d05b7efc18d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure.=C2=A0<div><br></div><div>The goal is to emulate a sc=
enario where a compromised guest attacks another=C2=A0</div><div>tenant in =
the same physical host reading/changing the memory content.=C2=A0=C2=A0</di=
v><div>E.g., extract the RSA key.<br><div><br></div><div>I&#39;ll be in the=
 domU kernel space. I&#39;m assuming that the guest is able to exploit=C2=
=A0</div><div>any vulnerability possible.=C2=A0</div><div>Effectively I&#39=
;ll be changing Xen&#39;s code (at least possible) to *emulate* a vulnerabi=
lity=C2=A0</div><div>(e.g., undo a patch).</div><div><br></div><div><br></d=
iv><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><br></div><div>Atenciosamente,</div><=
b>Charles Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"><br></fon=
t><font color=3D"#666666" size=3D"1"><br></font></div></div></div><br></div=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, Jan 2, 2021 at 7:06 PM Andrew Cooper &lt;<a href=3D"mailto:a=
ndrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 02/01/2021 17:02, Cha=
rles Gon=C3=A7alves wrote:<br>
&gt; Hi,=C2=A0<br>
&gt; <br>
&gt; I&#39;m building some attack loads targeting=C2=A0 Xen to my PhD and n=
eed to<br>
&gt; identify the pages for a specific guest.=C2=A0<br>
&gt; Assuming that I&#39;m able to traverse the pages in memory, how do I<b=
r>
&gt; identify a guest (by ID or Name)?=C2=A0<br>
&gt; <br>
&gt; The dom0 is easy since I can inspect the start_info looking<br>
&gt; for=C2=A0SIF_INITDOMAIN=C2=A0but I have no idea to identify a specific=
 domU.<br>
<br>
Hello,<br>
<br>
Could you provide rather more details about what exactly you&#39;re trying<=
br>
to do?<br>
<br>
In particular, what context are you in when trying to identify the pages?<b=
r>
<br>
~Andrew<br>
</blockquote></div>

--000000000000b3e77d05b7efc18d--

