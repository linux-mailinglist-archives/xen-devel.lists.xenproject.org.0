Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A006F79CC52
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:49:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600233.935895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01T-0001iq-Pa; Tue, 12 Sep 2023 09:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600233.935895; Tue, 12 Sep 2023 09:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg01T-0001fy-MS; Tue, 12 Sep 2023 09:49:31 +0000
Received: by outflank-mailman (input) for mailman id 600233;
 Tue, 12 Sep 2023 09:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6uSu=E4=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1qg01R-00015x-M7
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:49:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa82e7c5-5151-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:49:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so6910627a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 02:49:29 -0700 (PDT)
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
X-Inumbo-ID: aa82e7c5-5151-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694512168; x=1695116968; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSkpXD60mkMKp1LVoMvHl+kL8s8XTU2xlXGHwshSDAM=;
        b=APnStUGlZVHBA6WwjLIRmBRf1TYsKZ+J1CCRcNJtNa/oNFBU5eOIBT3pIqDAJevURv
         B5Th2kmlz4us8t6BJN1a1yGCqv6sqiZkKdHaFzAT3FCkIde1whAwsxB5NROOwgrBzVSX
         oVzz9GFvINBqDfODFEv1BgBS8DNmKp9/fJgnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694512168; x=1695116968;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSkpXD60mkMKp1LVoMvHl+kL8s8XTU2xlXGHwshSDAM=;
        b=DsDMc6k7uCayXbDTqbqhbLonJMJfCkpXANVlo1Q3e2LaQgDcvAnKzDZGPv7NQGwgYd
         uR9FXM72tf5vw+B4Ok07Phn9l0/eNGKGD2M/kWCFht+oQYo8nx9nfZWUlxKHqpYa09Yu
         GPAkI2EZp66/Nu9FVTctX0jFTnLERNSzOh3hxuWOIkjtpYYK8Q+QTzcZ3CgZUKiDU8Zv
         JGkC5CLkWShLKHpsT0o4cKRHk/OlernYt6XDIiYg2V7yO9XzURpWTZ8F+825wZ9a9o/D
         UUX1gK/amtf+esj4yxpvs6EDWgFK1iMSCPDGDhqJ7Bj2RP387v9fRxjt61WK0xcfeg5t
         tkfQ==
X-Gm-Message-State: AOJu0Yz97Nv3PYpsG7fq8YS8apqlp8lQix9ImL7SsjFQ0vLll4V9Ue9r
	bvDNUfDsC8rGam9POkIJXsrRffurvyY6Sj+cuY1J6g==
X-Google-Smtp-Source: AGHT+IF7XzCl2BgjK+0G9+wV4YYA8f6eAw6Q6zFHHNK+tmRPx6gwzLEuyxSlAIxeFIoJLbom4aA3ZWD62c9/cFEPITI=
X-Received: by 2002:aa7:d806:0:b0:522:3849:48db with SMTP id
 v6-20020aa7d806000000b00522384948dbmr9618039edq.3.1694512168579; Tue, 12 Sep
 2023 02:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAO-mL=zvA8WYjPoKM2t961dEC3unb_eHW=GNLhkX3Gra3Hoi4A@mail.gmail.com>
In-Reply-To: <CAO-mL=zvA8WYjPoKM2t961dEC3unb_eHW=GNLhkX3Gra3Hoi4A@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 12 Sep 2023 10:48:53 +0100
Message-ID: <CAO-mL=z7nx5KQ7Y3XejYNW+f+NSYFCmOrYxAsS4_rbo-pBhPtQ@mail.gmail.com>
Subject: Re: Documentation survey
To: xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e045de0605265b50"

--000000000000e045de0605265b50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning all!

This is a reminder you have until *Friday 15th September* to fill out the
documentation survey below, if you haven't done so already!

Many thanks,
Kelly Choi

Open Source Community Manager, XenServer
Cloud Software Group


On Mon, Sep 4, 2023 at 1:48=E2=80=AFPM Kelly Choi <kelly.choi@cloud.com> wr=
ote:

> Hey everyone,
>
> Hope you've all had a good weekend!
>
> I know that documentation is an important part of The Xen Project, and I
> have received feedback from a number of users on this topic. Currently,
> there are some barriers to entry and improvements that can be made.
>
> In order to understand further, please could you answer the following
> survey (~5-10 mins) on your thoughts around the existing documentation.
> This feedback will help achieve a plan of action.
>
> *All responses will be anonymous. *
>
>
> *https://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+V=
l3k2APoP-U/ *
>
> <https://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+V=
l3k2APoP-U/>
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager, XenServer
> Cloud Software Group
>

--000000000000e045de0605265b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Good morning all!=C2=A0<div><br></div><di=
v>This is a reminder you have until <b><u>Friday 15th September</u></b> to =
fill out the documentation survey below, if you haven&#39;t done so already=
!<br><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><di=
v><div style=3D"color:rgb(136,136,136)">Open Source Community Manager, XenS=
erver</div><div style=3D"color:rgb(136,136,136)">Cloud Software Group</div>=
</div></div></div></div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 4, 2023 at 1:48=E2=80=AFPM Ke=
lly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com">kelly.choi@cloud.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr">Hey everyone,=C2=A0<div><br></div><div>Hope you&#39;ve all h=
ad a good weekend!</div><div><br></div><div>I know that documentation=C2=A0=
is an important part of The Xen Project, and I have received feedback from =
a number of users on this topic. Currently, there are some barriers to entr=
y and improvements that can be made.=C2=A0</div><div><br></div><div>In orde=
r to understand further, please could you answer the following survey (~5-1=
0 mins) on your thoughts around the existing documentation. This feedback w=
ill help achieve a plan of action.</div><div><br></div><div><b>All response=
s will be anonymous.=C2=A0</b></div><div><b><br></b></div><div><a href=3D"h=
ttps://cryptpad.fr/form/#/2/form/view/aIaNqMdkkV85YkQSzM0+ddwMY36XSTf+Vl3k2=
APoP-U/" target=3D"_blank"><b>https://cryptpad.fr/form/#/2/form/view/aIaNqM=
dkkV85YkQSzM0+ddwMY36XSTf+Vl3k2APoP-U/=C2=A0</b><br></a></div><div><br clea=
r=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
<div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div style=
=3D"color:rgb(136,136,136)">Open Source Community Manager, XenServer</div><=
div style=3D"color:rgb(136,136,136)">Cloud Software Group</div></div></div>=
</div></div></div></div>
</blockquote></div></div>

--000000000000e045de0605265b50--

