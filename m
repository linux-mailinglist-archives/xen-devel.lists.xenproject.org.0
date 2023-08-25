Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E114B7884D6
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 12:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590790.923184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZTyJ-0001U0-0I; Fri, 25 Aug 2023 10:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590790.923184; Fri, 25 Aug 2023 10:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZTyI-0001SB-Th; Fri, 25 Aug 2023 10:23:18 +0000
Received: by outflank-mailman (input) for mailman id 590790;
 Fri, 25 Aug 2023 10:23:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpM3=EK=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qZTyH-0001S0-G3
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 10:23:17 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6766912d-4331-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 12:23:16 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a1132b685so1202334a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Aug 2023 03:23:16 -0700 (PDT)
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
X-Inumbo-ID: 6766912d-4331-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1692958995; x=1693563795;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHWuHjhyKqjEget8xzEwFqJ3R8QAO0E8k9+PMrDj86k=;
        b=AY1ymnjdg1ytRVaFOi3SdF9uiKi9cOEoynJC5vyTu+q2p2P/l2JL8IbfHGKkKVSHFY
         haAe2cE7R+hxMUKPlSdZX6SxW9RiHGVjOKicosQjsbZOSPuQXg310O4rdnfd66fP/8ca
         P7boRUEXxCzWuLbkA/CAmqVtrfi0OcDMJZsHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692958995; x=1693563795;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHWuHjhyKqjEget8xzEwFqJ3R8QAO0E8k9+PMrDj86k=;
        b=VT9GFy3igNiHXMzzQDYY6OlNPVqS93LZldwPp34SzA6X+q8xJDTBIj7ekVob7jbaBY
         PAHJsLysTIQThuMet57VK06g/q8mXpYnPIxuKFVubpa9H05EeUCLJezYNa92s30fmXr3
         ZbROCSc2Gtr+bjIT4L/+tEEp0yiQdtwFsS7MAUTgLUldP/78bOfRySpAtdOjXo9EhiH2
         IvYRwTzcel0UhT9Ipr6PDCTXYMaSWGgPtkkYPx39+856iBMgX5pJBvArPPm6HcTKwkW+
         9FpKbOO1QqVg1DSZaa0MWXDsKL1X0vrfbjkF5ch9+rBdXfvSB47fp5Di0qN0+AdRDY+3
         bjkg==
X-Gm-Message-State: AOJu0YxjsSTdd7W58/aykMchvbUa1DVIn8wptYv6H6q7BXa+GsIPBwGc
	m7qJ32F+FbXlPUIc9y98X0BPTrhOOSvtlUAl279mJAbTPY+hPK/4730=
X-Google-Smtp-Source: AGHT+IHV+GhYfuGW/YfEPi093ofauz+tQRIG3+Srh/wzQkUAhbCsfD1uqCvqJkI5KiFIOx9nnZQXSxRRDSiPmrvq8Ms=
X-Received: by 2002:a05:6402:120a:b0:525:46b7:40f2 with SMTP id
 c10-20020a056402120a00b0052546b740f2mr13576751edw.21.1692958995532; Fri, 25
 Aug 2023 03:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com>
In-Reply-To: <CAO-mL=zqZjGhPB7wDxcGM=FxU0-JCcc9AY7YSrPKV5Kpv3pDDw@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Fri, 25 Aug 2023 11:22:40 +0100
Message-ID: <CAO-mL=wy3PS7H5xoWtc29M5tkAS4DPLuV=5FiiRYN0wRN6bH_w@mail.gmail.com>
Subject: Re: Community Manager update - August 2023
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000008c5de70603bcbb6e"

--0000000000008c5de70603bcbb6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

Thank you for your feedback so far.

   - With no objections from the community - New Matrix only channels are
   now available to join. The reason for such a change is to
   improve communication and synchronization of messages which members of I=
RC
   have had issues with previously.

Please join using the following links:


   1. XenProject: https://matrix.to/#/#XenProject:matrix.org
      <https://matrix.to/#/%23XenProject:matrix.org>
      2. XenDevel: https://matrix.to/#/#XenDevel:matrix.org
      3. XenSocial: https://matrix.to/#/#XenSocial:matrix.org


   - IBM Softlayer wording has been updated to IBM Cloud
   - The addition of the words 'safe' and 'safety' are to be added to the
   Xen project goals and purpose, which will shortly be reflected on the
   website:
      - The project aims to enable innovation, scalability, safety, and
      security in virtualization solutions.
      - Transform embedded and automotive sectors with mature, safe, and
      secure solutions.

Many thanks,
Kelly Choi

Open Source Community Manager, XenServer
Cloud Software Group


On Fri, Aug 18, 2023 at 11:55=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> =
wrote:

> Hi everyone! :)
>
> I hope you're all well.
>
> If we haven't met before, I'd like to introduce myself. I'm Kelly, the
> Community Manager for The Xen Project. My role is to support everyone and
> make sure the project is healthy and thriving.
>
> *The latest update below requires your attention:*
>
>
>    - *We will be moving IRC channels fully to Matrix in September 2023.
>    Once the channels have been created, further information will be share=
d. *
>    - *New Mission Statement, goals, and purpose is attached to this email
>    and will be shared publicly.*
>
> *Should anyone have any concerns or feedback, please let me know*
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager, XenServer
> Cloud Software Group
>

--0000000000008c5de70603bcbb6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi everyone,<div><br></div><div>Thank you=
 for your feedback so far.</div><div><ul><li>With no objections from the co=
mmunity - New Matrix only channels are now available to join. The reason fo=
r such a change is to improve=C2=A0communication and synchronization of mes=
sages which members of IRC have had issues with previously.=C2=A0</li></ul>=
</div><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"=
><div>Please join using the following links:</div></blockquote><div><ol><ol=
><li>XenProject:=C2=A0<a href=3D"https://matrix.to/#/%23XenProject:matrix.o=
rg" target=3D"_blank">https://matrix.to/#/#XenProject:matrix.org=C2=A0</a><=
/li><li>XenDevel:=C2=A0<a href=3D"https://matrix.to/#/%23XenDevel:matrix.or=
g" target=3D"_blank">https://matrix.to/#/#XenDevel:matrix.org</a></li><li>X=
enSocial:=C2=A0<a href=3D"https://matrix.to/#/%23XenSocial:matrix.org" targ=
et=3D"_blank">https://matrix.to/#/#XenSocial:matrix.org</a></li></ol></ol><=
ul><li>IBM Softlayer wording has been updated to IBM Cloud</li><li>The addi=
tion of the words &#39;safe&#39; and &#39;safety&#39; are to be added to th=
e Xen project goals and purpose, which will shortly be reflected on the web=
site:=C2=A0</li><ul><li>The project aims to enable innovation, scalability,=
 <font color=3D"#ff0000">safety</font>, and security in virtualization solu=
tions.</li><li>Transform embedded and automotive sectors with mature, <font=
 color=3D"#ff0000">safe</font>, and secure solutions.</li></ul></ul></div><=
div><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>M=
any thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=3D"col=
or:rgb(136,136,136)">Open Source Community Manager, XenServer</div><div sty=
le=3D"color:rgb(136,136,136)">Cloud Software Group</div></div></div></div><=
/div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 18, 2023 at 11:55=E2=80=AFAM Kelly Choi &lt;<a =
href=3D"mailto:kelly.choi@cloud.com" target=3D"_blank">kelly.choi@cloud.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hi everyone! :)=C2=A0<div><br></div><div>I hope you&#39;re=
 all well.=C2=A0</div><div><br></div><div>If we haven&#39;t met before, I&#=
39;d like to introduce myself. I&#39;m Kelly, the Community=C2=A0Manager fo=
r The Xen Project. My role is to support everyone and make sure the project=
 is healthy and thriving.=C2=A0</div><div><br></div><div><b>The latest upda=
te below requires your attention:</b></div><div><b><br></b></div><div><ul><=
li><b>We will be moving IRC channels fully to Matrix in September 2023. Onc=
e the channels have been created, further information will be shared.=C2=A0=
</b></li><li><b>New Mission Statement, goals, and purpose is attached to th=
is email and will be shared publicly.</b></li></ul><div><b>Should anyone ha=
ve any concerns or feedback, please=C2=A0let me know</b></div></div><div><b=
r clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div =
style=3D"color:rgb(136,136,136)">Open Source Community Manager, XenServer</=
div><div style=3D"color:rgb(136,136,136)">Cloud Software Group</div></div><=
/div></div></div></div></div>
</blockquote></div>
</div>

--0000000000008c5de70603bcbb6e--

