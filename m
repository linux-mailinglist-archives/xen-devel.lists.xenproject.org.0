Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2DD2B352C
	for <lists+xen-devel@lfdr.de>; Sun, 15 Nov 2020 15:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27482.56149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keIdD-0002O1-5f; Sun, 15 Nov 2020 14:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27482.56149; Sun, 15 Nov 2020 14:03:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keIdD-0002Nc-2M; Sun, 15 Nov 2020 14:03:51 +0000
Received: by outflank-mailman (input) for mailman id 27482;
 Sun, 15 Nov 2020 14:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1c3=EV=gmail.com=james.dutton@srs-us1.protection.inumbo.net>)
 id 1keIbv-0002Kf-NA
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 14:02:31 +0000
Received: from mail-yb1-xb2a.google.com (unknown [2607:f8b0:4864:20::b2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78ad5877-1c27-4d9a-9a30-acd3291397c2;
 Sun, 15 Nov 2020 14:02:30 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 2so13216046ybc.12
 for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2020 06:02:30 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A1c3=EV=gmail.com=james.dutton@srs-us1.protection.inumbo.net>)
	id 1keIbv-0002Kf-NA
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 14:02:31 +0000
X-Inumbo-ID: 78ad5877-1c27-4d9a-9a30-acd3291397c2
Received: from mail-yb1-xb2a.google.com (unknown [2607:f8b0:4864:20::b2a])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 78ad5877-1c27-4d9a-9a30-acd3291397c2;
	Sun, 15 Nov 2020 14:02:30 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 2so13216046ybc.12
        for <xen-devel@lists.xenproject.org>; Sun, 15 Nov 2020 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uaycsh/Ik3XAEZXuyRKHaZonhS0PXqRf8Lf2yU3Fxgo=;
        b=A0HmQ68LadjwBsod6T+kmY2sq1lSPfafa6jFAgDmtv5rFQKjPm86LpSz1h6LWe3ZbL
         CaBjivk9NGMOg30aZr3ywwHe8/UZyT5kvm7hM1029NH39X4EF0au1h+3+fLprSe+Skfl
         T6MTzpvClUnutdqBRO8Bqu+M11q5DXvUa3VSXqVPi/7aHjJJWDZyp+9F0CbSX52gRLbL
         bzAfuxVxwROT+1BcPT7UOFqqZMPOExONA5GgdO2yVYjaGcs3Tp7/6gz6axNg7hwvHnV5
         4Nm8nhyZLfLsw4TjiQKxTifYZocL4LlIVRLT3FwOdDXQfOc0rh0upgp5SvG9KbBgSYBD
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uaycsh/Ik3XAEZXuyRKHaZonhS0PXqRf8Lf2yU3Fxgo=;
        b=DmiGnrXQ8/uKhMaWFRrPnY3SuVw+cqLh3H66XnV3OdE2FYGq04dj/5ROsb9PS8BKPt
         IkhhRrLnvUhsvuRw96yzpfxbBES24rV9cQQ18L4S5RDxrVEMOB9wGiAupMaxlAAX/aaq
         8HdniN1O8uGz467F6QxIPzJYxY1lzEEF//sFFR5f26oscGTML8Obd02uKDLBAvuH0YZ+
         DZRlnLO9kuIvkPLoyF8zn2jYg+PI0l5bRi2UjstIIHS4r2o+jPxEgVaXFZcVeEAM9Awm
         GV3IScbRb165HWRCWuLulQTshAQpDymV2bqwQDxg4S+vQGHgFxiGW0S00fW+9QrjHs4A
         Lesw==
X-Gm-Message-State: AOAM531dB+/h9v4RdNZrBnQXZnb5TTUSKxyjywjH2EyfXjFOcORJ/3II
	mub1Q7sqRoR90gHBW5KUa3nkqn92ODv32K6HGKs=
X-Google-Smtp-Source: ABdhPJyz078fmC/gcvQOY9gCbfhitY+RBefdLUghubVKwOgJOu1RJeEwaK8xNmYWk9EHX3AUrqmYWVeMQQd3EEofU7g=
X-Received: by 2002:a25:1886:: with SMTP id 128mr15241593yby.163.1605448949742;
 Sun, 15 Nov 2020 06:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20201113235242.k6fzlwmwm2xqhqsi@tomti.i.net-space.pl> <f0845d6b-deab-957f-0807-1e989a6648ac@gmx.de>
In-Reply-To: <f0845d6b-deab-957f-0807-1e989a6648ac@gmx.de>
From: James Courtier-Dutton <james.dutton@gmail.com>
Date: Sun, 15 Nov 2020 14:01:53 +0000
Message-ID: <CAAMvbhFeuzEihOGan6r90CWxgshin3APvnLPCzJxXD-aJhF20g@mail.gmail.com>
Subject: Re: [SPECIFICATION RFC] The firmware and bootloader log specification
To: Nico Huber <nico.h@gmx.de>
Cc: Daniel Kiper <daniel.kiper@oracle.com>, coreboot@coreboot.org, 
	grub-devel <grub-devel@gnu.org>, LKML Mailing List <linux-kernel@vger.kernel.org>, 
	systemd-devel@lists.freedesktop.org, trenchboot-devel@googlegroups.com, 
	u-boot@lists.denx.de, x86@kernel.org, xen-devel@lists.xenproject.org, 
	alecb@umass.edu, alexander.burmashev@oracle.com, allen.cryptic@gmail.com, 
	andrew.cooper3@citrix.com, ard.biesheuvel@linaro.org, btrotter@gmail.com, 
	dpsmith@apertussolutions.com, eric.devolder@oracle.com, 
	eric.snowberg@oracle.com, "H. Peter Anvin" <hpa@zytor.com>, hun@n-dimensional.de, 
	javierm@redhat.com, joao.m.martins@oracle.com, kanth.ghatraju@oracle.com, 
	konrad.wilk@oracle.com, krystian.hebel@3mdeb.com, leif@nuviainc.com, 
	lukasz.hawrylko@intel.com, luto@amacapital.net, michal.zygowski@3mdeb.com, 
	Matthew Garrett <mjg59@google.com>, mtottenh@akamai.com, phcoder@gmail.com, 
	piotr.krol@3mdeb.com, pjones@redhat.com, pmenzel@molgen.mpg.de, 
	roger.pau@citrix.com, ross.philipson@oracle.com, tyhicks@linux.microsoft.com
Content-Type: multipart/alternative; boundary="0000000000005ac01e05b425b6c0"

--0000000000005ac01e05b425b6c0
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Nov 2020 at 12:37, Nico Huber <nico.h@gmx.de> wrote:

> > (I think
> >     newer spec versions should not change anything in first 5 bf_log
> members;
> >     this way older log parsers will be able to traverse/copy all logs
> regardless
> >     of version used in one log or another),
>
> Good point, which brings me to another good practice regarding such
> data formats: A length field for the header. In this case the length
> from the start of `bf_log` to the start of `msgs`. This would give
> us backwards compatibility in case additional fields are added in
> the future. And would also allow the various implementation to add
> custom fields (not for communication with log parser but for their
> own use).
>
> A fairly future proof approach is to use a TLV.
Type, Length, Value.
The approach can be nested, so other TLVs within the bytes of the value of
the parent TLV.
It makes it very easy for the reader of the message to skip any Types it
does not understand.
For example, the structure you describe could go in the "Value" part of the
TLV.
This is a common approach used by RADIUS, Protobuf, Avro etc.
If anyone wishes to add extra parameters, they can create a new Type, and
put the new parameters in the Value.
TLV is also already used elsewhere in the kernel, in the ALSA sound
interface to pass extra information about a sound control, e.g. dB values,
min/max values etc.

Kind Regards

James

--0000000000005ac01e05b425b6c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 14 Nov 2020 at 12:37, Nico Huber &lt;<a href=3D"mailto:nico.=
h@gmx.de">nico.h@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; (I think<br>
&gt;=C2=A0 =C2=A0 =C2=A0newer spec versions should not change anything in f=
irst 5 bf_log members;<br>
&gt;=C2=A0 =C2=A0 =C2=A0this way older log parsers will be able to traverse=
/copy all logs regardless<br>
&gt;=C2=A0 =C2=A0 =C2=A0of version used in one log or another),<br>
<br>
Good point, which brings me to another good practice regarding such<br>
data formats: A length field for the header. In this case the length<br>
from the start of `bf_log` to the start of `msgs`. This would give<br>
us backwards compatibility in case additional fields are added in<br>
the future. And would also allow the various implementation to add<br>
custom fields (not for communication with log parser but for their<br>
own use).<br>
<br></blockquote><div>A fairly future proof approach is to use a TLV.</div>=
<div>Type, Length, Value.</div><div>The approach can be nested, so other TL=
Vs within the bytes of the value of the parent TLV.<br></div><div>It makes =
it very easy for the reader of the message to skip any Types it does not un=
derstand.</div><div>For example, the structure you describe could go in the=
 &quot;Value&quot; part of the TLV.</div><div>This is a common approach use=
d by RADIUS, Protobuf, Avro etc.</div><div>If anyone wishes to add extra pa=
rameters, they can create a new Type, and put the new parameters in the Val=
ue.</div><div>TLV is also already used elsewhere in the kernel, in the ALSA=
 sound interface to pass extra information about a sound control, e.g. dB v=
alues, min/max values etc.</div><div><br></div><div>Kind Regards</div><div>=
<br></div><div>James</div><div><br></div><div><br></div><div><br></div></di=
v></div>

--0000000000005ac01e05b425b6c0--

