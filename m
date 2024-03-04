Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7886FFCB
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:07:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688278.1072337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6AR-0000ex-5I; Mon, 04 Mar 2024 11:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688278.1072337; Mon, 04 Mar 2024 11:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh6AR-0000cd-19; Mon, 04 Mar 2024 11:07:35 +0000
Received: by outflank-mailman (input) for mailman id 688278;
 Mon, 04 Mar 2024 11:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYM3=KK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rh6AP-0000bp-07
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:07:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 650a675d-da17-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 12:07:31 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so7144951a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:07:31 -0800 (PST)
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
X-Inumbo-ID: 650a675d-da17-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709550450; x=1710155250; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngYdvlWyfWzO1QUcZvif0PwpVR1L5y8LDTfKl/i6E/A=;
        b=cTrXFQHhffM1Bpy32YqGab4jRH9t6ae6ZGbIGwZwMk/OhqnNvxTPynZB2GQ6oyrQbQ
         WbvWvap+Grl1OW7ZbrB/w/bNyfMiUxt5/Q99ORloD5MCVTLUuQ9GAxSVYEjW/ITTyIdA
         GU4Jmu3NL3PoVnZK8EyiBi4CeorqN6DzKMNoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550450; x=1710155250;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngYdvlWyfWzO1QUcZvif0PwpVR1L5y8LDTfKl/i6E/A=;
        b=jkHRElXo1eqBfPnGoz/as79DMM/gxgzuh9Kr1p/2qGBPlCuTXher6uLJUrfgH2w01C
         CrNkhqCm/LPtNLsQUZIs3i89rw5DBsOfKYNERGvsKC6PNp3mvc6KgUbjPNr9hhLLlq7f
         o1jfSlf5xUNWWhB7dIac0Ny3ncKOfMRzgppOUtmIgVVZFUXscgCqoAg7M/xkO9Q0x2oU
         zi18Q4/o43SMQG8uMdNeyHjekftEUZ5kAyKd9pqjyLZz40DcTSfjUWSMAj8KPfcVLgUH
         ZWFtcsJYLYMVe0Xez4Gof9mkMH7mx1EOemVnCoqN3MsigSzRNd1N0vAXZM5J0KDU++6O
         fXmw==
X-Gm-Message-State: AOJu0Yx0KpteHktVTrzNIZ0Gi4LX8Wwjw3L4WZ8+HPosQns/yO81hDU6
	vihYaXlT3KjM3mRTb4Ixr54fIcrvhNy9sse/Ouhqc4NURDcVk9ahIFqYBoa4ge/95HrkOwqawHy
	NNCnSr7b/PxCQYn5wNxLwIEnNuOubSd4QT7FmMYhd9aZEDf4TPIc=
X-Google-Smtp-Source: AGHT+IEWv6w3/q8sAraSB7FqtnNsI3jd1QwtOUuaIJzm3oXS2DMLoT+WHaTN2b6uNrmFqLyxG4Z82tCet8OW94GMCHc=
X-Received: by 2002:a05:6402:4312:b0:567:e0e:dda5 with SMTP id
 m18-20020a056402431200b005670e0edda5mr6024953edc.17.1709550450107; Mon, 04
 Mar 2024 03:07:30 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=zCVa+bbp3ft9GrnaJ0nVHa-9NbjJP_0uR7c4xGjAkn=A@mail.gmail.com>
In-Reply-To: <CAO-mL=zCVa+bbp3ft9GrnaJ0nVHa-9NbjJP_0uR7c4xGjAkn=A@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 4 Mar 2024 11:06:54 +0000
Message-ID: <CAO-mL=zn=dYp9tJ3bZeJ01fwYK7=SzmrH_TJzEPjKxyzmdbqEw@mail.gmail.com>
Subject: XEN SUMMIT CFP DEADLINE EXTENDED BY 1 WEEK!
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004e005d0612d3bb18"

--0000000000004e005d0612d3bb18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Good news, our CFP deadline for Xen Summit has been extended by one week to
Sunday 10th March 2024.

Please submit your talks before then!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, Feb 27, 2024 at 10:22=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> =
wrote:

> Hi everyone,
>
> *Just a reminder that our CFP for Xen Summit 2024 is at the end of this
> week! *
>
> Please submit your talks before then:
> https://events.linuxfoundation.org/xen-project-summit/program/cfp/
>
> We look forward to seeing you.
>
> Many thanks,
> Kelly Choi
>
> Community Manager
> Xen Project
>

--0000000000004e005d0612d3bb18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi everyone,</div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">Good news, our CFP deadline for Xen Summit has been ex=
tended by one week to Sunday 10th March 2024.</div><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr">Please submit your talks before then!=C2=A0</div><div d=
ir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></d=
iv><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><div s=
tyle=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></di=
v></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Feb 27, 2024 at 10:22=E2=80=AFAM Kelly Choi &lt;<a href=
=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi ev=
eryone,<div><br></div><div><b><font color=3D"#ff0000">Just a reminder that =
our CFP for Xen Summit 2024 is at the end of this week!=C2=A0</font></b></d=
iv><div><b><font color=3D"#ff0000"><br></font></b></div><div>Please submit =
your talks before then:</div><div><a href=3D"https://events.linuxfoundation=
.org/xen-project-summit/program/cfp/" target=3D"_blank">https://events.linu=
xfoundation.org/xen-project-summit/program/cfp/</a><br></div><div><br></div=
><div>We look=C2=A0forward to seeing you.</div><div><br></div><div><div><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,<=
/div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,1=
36,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen P=
roject=C2=A0<br></div></div></div></div></div></div></div>
</blockquote></div></div>

--0000000000004e005d0612d3bb18--

