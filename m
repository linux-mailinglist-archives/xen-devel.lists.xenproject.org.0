Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F836EAF7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 14:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119981.226852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6E3-0007mn-JZ; Thu, 29 Apr 2021 12:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119981.226852; Thu, 29 Apr 2021 12:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6E3-0007mM-GJ; Thu, 29 Apr 2021 12:57:03 +0000
Received: by outflank-mailman (input) for mailman id 119981;
 Thu, 29 Apr 2021 12:57:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMrA=J2=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lc6E1-0007mH-Qq
 for xen-devel@lists.xen.org; Thu, 29 Apr 2021 12:57:01 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa1b4cf6-8934-4dd5-91a0-67a28d5ae673;
 Thu, 29 Apr 2021 12:57:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so6606751wmn.2
 for <xen-devel@lists.xen.org>; Thu, 29 Apr 2021 05:57:00 -0700 (PDT)
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
X-Inumbo-ID: fa1b4cf6-8934-4dd5-91a0-67a28d5ae673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AM+E5CxDZ0NC7cA7sp5jX6WZqHaLGbGHMU22EPjieRE=;
        b=Cv7auC2OtmosvjXpx4kJe2a/fh37//zKWUwGPcgz6GkpmtbhWZhDIlrN+7OpIwysCr
         mfPzeaq5XG5yuoJXYY80ETkI2e7FPrjvJpvUJYXmtNOE2w5h1O2RotIeCuw9V7BtW7fP
         5WQwb/O9nRbTyaZOYxkJo7uK5KCTkMQQ7PRf7Uui/9H4/mrUmpFQymZvDRExgVymI84e
         muxef4LIRqb/4r0lsLsQ5JsXg/JEfbRejG/LKrHcZpbGoOTGjBBtdXrq2FwyjYxfRhV1
         bEY9s6fqJM8XmP0di8iFRr/Og9FuUhARkpthP1HOEvWcfXV2VmosP1yW2LISSLt+yHHd
         3abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AM+E5CxDZ0NC7cA7sp5jX6WZqHaLGbGHMU22EPjieRE=;
        b=LZ4qRdwtcszScLko8CuHALOaGNHXsbuXA2n0CXYxH3FCgmBJcDMjDgRtNM+t8erlkQ
         AqjiVwBvWD3iHKdd7FO9+UNwLWZLo0wg+i6J50whdDppTPvDUoIC/kjd3Bt+o16UXEeY
         M2N4ic33Z9bFl1YWfpLnDnx655F5ICNv0P0Hhl6RUuJDtcVoqKonwKK4RBVjqIQ349Kv
         oC1DlAZgdPBPljtzokoYlgApRbfvYy3CsQx0iLY8fMQrr/YPyvUuVZWXQekT4a6RkECt
         JTax7A3DxHxbdfdfbPDk9DnV+S3EdYZUC8CjsHIUw696ecicicA/dcYxbHXe2gDATXLR
         HOfA==
X-Gm-Message-State: AOAM532Wp6Yrnq5CYutjXfgEDLeQJQJuxJT88tSGjvQnJi6loyZrnElx
	iIzAFyjK5cJYb8jzrQwoCa/zqlg4+Tn/SuTfC/o=
X-Google-Smtp-Source: ABdhPJyyZfOAGdLl0/kOA++jcC2L5Q3YtxMaX+9G+jDXZjUpv2dwVc3StZ+rO5PAe9YJo3clfvB0xvISH06HQzVN/Vk=
X-Received: by 2002:a05:600c:4a17:: with SMTP id c23mr22211694wmp.78.1619701019868;
 Thu, 29 Apr 2021 05:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQRGoBi4tC+K_FHJceXxEqC6wy79qX0aE60OOeBWSo8tTEbjg@mail.gmail.com>
 <37488d5d-eec9-53f2-4ba7-157a7f9f5a9d@suse.com>
In-Reply-To: <37488d5d-eec9-53f2-4ba7-157a7f9f5a9d@suse.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Thu, 29 Apr 2021 13:56:24 +0100
Message-ID: <CAAQRGoA+5_LQ+QFZmg0yoBrQR+X_m_im58DAN6cujZ4yvqoZMg@mail.gmail.com>
Subject: Re: Serial Console : SOL vs Physical Port
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000ee832f05c11c077d"

--000000000000ee832f05c11c077d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks @Jan Beulich <JBeulich@suse.com>

On Thu, Apr 29, 2021 at 10:35 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 28.04.2021 20:49, Charles Gon=C3=A7alves wrote:
> > Is there any difference between both?
> > I'm trying to debug an issue using a SOL but the host crashes before an=
y
> > meaningful message.
> >
> > The SOL is working properly when I can debug some crashes perfectly. Bu=
t
> > for a specific case I'm wondering if I could be losing some messages.
>
> Well, without having an explanation, experience tells me that SOL in
> some cases is more fragile. Do you have "sync_console" in place?

I was missing the options  `sync_console console_to_ring`.
But this did not help either.


> Does
> the crash perhaps happen too early for the serial output to have got
> configured in Xen yet?
>
This is not the case, I trigger  intentionally the "bug" invoking an HC

But thanks for your help!


> Jan
>

--000000000000ee832f05c11c077d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks=C2=A0<a class=3D"gmail_plusreply" =
id=3D"plusReplyChip-0" href=3D"mailto:JBeulich@suse.com" tabindex=3D"-1">@J=
an Beulich</a>=C2=A0<div><br></div></div><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Apr 29, 2021 at 10:35 AM Jan Beulich=
 &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 28.04.2021 20=
:49, Charles Gon=C3=A7alves wrote:<br>
&gt; Is there any difference between both?<br>
&gt; I&#39;m trying to debug an issue using a SOL but the host crashes befo=
re any<br>
&gt; meaningful message.<br>
&gt; <br>
&gt; The SOL is working properly when I can debug some crashes perfectly. B=
ut<br>
&gt; for a specific case I&#39;m wondering if I could be losing some messag=
es.<br>
<br>
Well, without having an explanation, experience tells me that SOL in<br>
some cases is more fragile. Do you have &quot;sync_console&quot; in place? =
</blockquote><div>I was missing the options=C2=A0 `<span style=3D"backgroun=
d-color:rgb(248,249,250);color:rgb(0,0,0);font-family:monospace,monospace;f=
ont-size:12.7px;white-space:pre-wrap">sync_console console_to_ring`. </span=
></div><div>But this did not help either.=C2=A0</div><div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Does<br>
the crash perhaps happen too early for the serial output to have got<br>
configured in Xen yet?<br></blockquote><div>This is not the case, I trigger=
=C2=A0 intentionally the &quot;bug&quot; invoking an HC</div><div><br></div=
><div>But thanks for your help!</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Jan<br>
</blockquote></div></div>

--000000000000ee832f05c11c077d--

