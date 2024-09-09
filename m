Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A99719A0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794418.1203340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snddo-00010w-85; Mon, 09 Sep 2024 12:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794418.1203340; Mon, 09 Sep 2024 12:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snddo-0000yy-58; Mon, 09 Sep 2024 12:37:12 +0000
Received: by outflank-mailman (input) for mailman id 794418;
 Mon, 09 Sep 2024 12:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s02V=QH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1snddm-0000ys-WE
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:37:11 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b140fb1-6ea8-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:37:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so244705566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:37:10 -0700 (PDT)
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
X-Inumbo-ID: 3b140fb1-6ea8-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725885429; x=1726490229; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBHNMenNM00L+7GtS/XvobYbctWVMDVuvkCU1tJumXY=;
        b=Jwbc4ooi1ykW1wHUQLrL1qULg8GvOIFgqwYZw3UD462PAIyvBgGGuaTzpKlRCD0Ex1
         XfLvx3Iwm1vOLzGujNDnY1PoY/Q3oBIZ5r5vmvNsSoV2QLBAEV8XWZ5gR/rJa4KHnskB
         T3qAtFpI+PDXCPtQBfEgEi29/t0JAPxqOZLB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725885429; x=1726490229;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBHNMenNM00L+7GtS/XvobYbctWVMDVuvkCU1tJumXY=;
        b=ILSXOVN2B42EhMj9PthB+6BvyDn4KKTg0z6xi33OTvKbR3k+5NJSv2RjM0CdcAT3ro
         XD3k00QRxwnkvF/CAmk7k7C8cVfjWYABjEZj12V9mjMkBKAVKUtaimXZULkqfUscS2Pb
         oB+70TQeHndRoB6xEqRS1t5cngOn9PIvRcpA85arzKPfK2BtZbCSYAwFovWf9z3oJhbx
         klk/5YIA1jzTSWTmGX/5/xeheXkCKwtgaJHSbyTYjgh32WUV4E+fONNGcbMNLvmvlp1y
         H1zK08kI6HsTMKOoMly+sIxZRV3ypkp5VWj9K4yILl+EAxYa14gP+Tl6RGwZ2wEcyjhe
         6QJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkjU8lpJtiuQCVzbpvsIiBRiiTxnitAzQes8W0AJUracJgKONsM5K/A3jqZIqBXx7ZYlB8+6CSfTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0VxxC8czYTJMYoHGmTFbp98h2BOQtM3g7pwAAz33nq1iBehEQ
	YeHiTTIsXKoGge+pXvTzEpdJYj0/pF9XZEJ/EsuBODXRxgEe2rFSanXO0tfGKw1VbcRq2D6EF/7
	hvYXjt6jwKZ6/L2G+nR63XigQUZVHZw/RQVsoGg==
X-Google-Smtp-Source: AGHT+IFc/H9WL474AQNKzKnz1e4zaICJgCouRLNQIh51pebTU5m9sPrSn1t02ZIJSc1J/f7MF8Wi8kVGV7tsv/2namY=
X-Received: by 2002:a17:907:7b9e:b0:a86:9107:4c2f with SMTP id
 a640c23a62f3a-a8d2464e9camr552968266b.41.1725885428982; Mon, 09 Sep 2024
 05:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=y+AGD7Yw2WNK7GWKBEYvcHXTHFbRSSJLFREHMG_KGwZg@mail.gmail.com>
 <95f1d300de710c568f55669b160d72f6746d4456.camel@gmail.com> <64e9b214-280c-44f9-afdc-62f5a1ed3d4c@citrix.com>
In-Reply-To: <64e9b214-280c-44f9-afdc-62f5a1ed3d4c@citrix.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 9 Sep 2024 13:36:33 +0100
Message-ID: <CAO-mL=zY-5UFAgZR+2TnQ1LPftLX2d+36A-HFVYjvP3SWoAwHQ@mail.gmail.com>
Subject: Re: Call for next release manager
To: Andrew Cooper <andrew.cooper3@citrix.com>, oleksii.kurochko@gmail.com, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000eb06300621af037e"

--000000000000eb06300621af037e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As confirmed on last week's community call, Oleksii is happy to continue as
the RM.
If you have any questions or concerns, please reply to the thread.

I look forward to working with you on the next release, Oleksii!

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Tue, Sep 3, 2024 at 2:42=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com>
wrote:

> On 03/09/2024 9:16 am, oleksii.kurochko@gmail.com wrote:
> > Hello everyone,
> >
> > On Thu, 2024-08-29 at 12:05 +0100, Kelly Choi wrote:
> >> Hi all,
> >>
> >> I'd like to thank Oleksii for his hard work as the release manager
> >> for 4.19.
> >>
> >> As we prepare for our next release, we welcome any interest from the
> >> community in becoming the next release manager.
> >>
> >> Feel free to reply directly with your interest, or you can raise this
> >> in the community call.
> >
> > I would be happy to continue as the release manager if no one minds.
>
>
> It is common for people to have multiple goes; it should be easier the
> second time around because it's not all new.
>
> As the prior RM, you get first refusal on doing it again.
>
> ~Andrew
>

--000000000000eb06300621af037e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>As confirmed on last week&#39;s=
 community call, Oleksii is happy to continue as the RM.</div><div>If you h=
ave any questions or concerns, please reply to the thread.</div><div><br></=
div><div>I look forward to working with you on the next release, Oleksii!=
=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Many thank=
s,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(13=
6,136,136)">Community Manager</div><div style=3D"color:rgb(136,136,136)">Xe=
n Project=C2=A0<br></div></div></div></div></div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2=
024 at 2:42=E2=80=AFPM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@c=
itrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On 03/09/2024 9:16 am, <a href=3D"mailt=
o:oleksii.kurochko@gmail.com" target=3D"_blank">oleksii.kurochko@gmail.com<=
/a> wrote:<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; On Thu, 2024-08-29 at 12:05 +0100, Kelly Choi wrote:<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to thank Oleksii for his hard work as the release man=
ager<br>
&gt;&gt; for 4.19.<br>
&gt;&gt;<br>
&gt;&gt; As we prepare for our next release, we welcome any interest from t=
he<br>
&gt;&gt; community in becoming the next release manager.<br>
&gt;&gt;<br>
&gt;&gt; Feel free to reply directly with your interest, or you can raise t=
his<br>
&gt;&gt; in the community call.=C2=A0<br>
&gt;<br>
&gt; I would be happy to continue as the release manager if no one minds.<b=
r>
<br>
<br>
It is common for people to have multiple goes; it should be easier the<br>
second time around because it&#39;s not all new.<br>
<br>
As the prior RM, you get first refusal on doing it again.<br>
<br>
~Andrew<br>
</blockquote></div>

--000000000000eb06300621af037e--

