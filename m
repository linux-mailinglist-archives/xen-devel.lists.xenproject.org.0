Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FFBBECCBC
	for <lists+xen-devel@lfdr.de>; Sat, 18 Oct 2025 11:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145542.1478416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vA3Ls-000793-Hi; Sat, 18 Oct 2025 09:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145542.1478416; Sat, 18 Oct 2025 09:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vA3Ls-00076A-Ap; Sat, 18 Oct 2025 09:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1145542;
 Sat, 18 Oct 2025 09:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxYo=43=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vA3Lq-00075v-Pe
 for xen-devel@lists.xenproject.org; Sat, 18 Oct 2025 09:35:50 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4be4e06-ac05-11f0-9d15-b5c5bf9af7f9;
 Sat, 18 Oct 2025 11:35:50 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-783fa3aa582so12802577b3.3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Oct 2025 02:35:50 -0700 (PDT)
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
X-Inumbo-ID: d4be4e06-ac05-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760780148; x=1761384948; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RW+I+33Ql2he7tob3Olq7Ib97t5xvt8Xh7P8ba7KoXo=;
        b=YutKY/rJbacsA+119CyI2yd5fYZrd7zhBtJVUfsLWHjJN+KmF4PtQMWdpCX7p7N9s4
         Wn4uypsX/C1gM4ZDy/2g8nFzhcBtSTMwVOU8liYF/jPa7sOCfIhtThzmvPqgtoYLJOlu
         KHcrzA7GP/S9hhSa/WxZX0zHBc0iY8NqIZ5ALZF+x3iAF3KLhAbZoFuML4QBUhSjU5wO
         FyAbANRO8cxJk2i9hu2u/63nQkDe844EWUvHNWd0Z8UR34qbvxBNe+k2PzWPZB8XkcXr
         KF/oRA207mem/3NTjZ1CCyFWmaiZRx4wKoHAgtdRjOpO51/fG/nws40RAH2OZhlq/3nC
         fKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760780148; x=1761384948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RW+I+33Ql2he7tob3Olq7Ib97t5xvt8Xh7P8ba7KoXo=;
        b=ITIM7YnCnpchYedzM+YS8sMU/G1tOVB2Hyl1+w5gcEu+wXB4+ezNnJ/9jTjiZul6Gd
         hp09rBhkiq+qmZuiwwKUvr8uqXJbsoJYtdHcADEfO9r3JNaj1eYfiR5ljcFL2Xrv0lPm
         RVc99f6PRS/8nE4m29TYfmfexNeMnw9hU0RYPFnKjf74OrSDct6ChKYTGhfKwxsvG2cn
         2BuisJEuoWUaG9A42UPbZJWiYO1Qeo8uRdxh1C3EgCthwdB/ZmzOfCNYx1rGq/xrwmEI
         0wF23lLoCVE9TH8gXsKVtMtR9qtHeGx1XZD5PropBOpm06FG3T4y05iEwVf0qWt1XT8H
         jXkg==
X-Gm-Message-State: AOJu0Yw2Ym6coakt2Jjbzz5mWsZIz84H6OU1k/BEgy6+BdrYX1hoeuZ2
	Oaaeo6rgEvpJtUOiLkskz//FvA7GN+wT0erKCrg8cYocrtvr99J24U4ZBv6QAkqmVT/uD9PJ7b8
	aU+Yh9TVBhu/xWZJ0DDPws4jcZ3tsMxE=
X-Gm-Gg: ASbGncstJ8Ohd2r3kn7eQcGSn/to9bPQKzzSMnDbt9d0ejeZl0WoNf0B6vy5GNc3KoS
	g+r12W3zL2JUS/AMigN//1ZIpk3YgTGtf2pIauZ/X2uu9CL7WZEnsnW4P4a2yXLvPu8luoaEkTj
	UiCbyeMP6f0sl57zhC6Dh2wI/cK2xcGL4HRSdyUiOjVbpFyEGEAwCMbSVGHW+i/UAtkb76I5Kpb
	f11RwRgdsGSMmmslpTfJiGLTxUc/Vp+T1Ot9LExUR2J8vOg76X3prU72IPywXAIJXwJIpI=
X-Google-Smtp-Source: AGHT+IHYJL5xMsX+BgYBHxoEWqbbwEC42Y8gtQSyT/RUtdCtAjkDqe7AhrupqcENFtkHT0YgvVHx/p/jcWh3E9Uk1tE=
X-Received: by 2002:a05:690e:d2:b0:633:abda:fce3 with SMTP id
 956f58d0204a3-63e161c6211mr4015034d50.36.1760780148554; Sat, 18 Oct 2025
 02:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com>
In-Reply-To: <bdead1be-cd8f-4cca-ae70-e9744ae8b556@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Sat, 18 Oct 2025 10:35:37 +0100
X-Gm-Features: AS18NWD_oC4YxC2w5uLMXgtCdrP2EUBFHUAzjzsM07uRAELgF5Ptyz38CPIJVF8
Message-ID: <CAHt6W4dFp_No7O+gLsM1a=xL4fGKbzwN2hP24rV2TtAkDO6kCw@mail.gmail.com>
Subject: Re: lost serial characters on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Denis Mukhin <dmkhn@proton.me>
Content-Type: multipart/alternative; boundary="00000000000048414f06416b934f"

--00000000000048414f06416b934f
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Oct 2025, 18:16 Andrew Cooper, <andrew.cooper3@citrix.com> wrote:

> Hi,
>
> I think we've got a bug with the serial console.  I'm reliably loosing a
> small part of the boot message. e.g.:
>
> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
> (XEN) build-id: d1536ff6698b3e3ba307d551abf
>  Family 25 (0x19 Stepping 1 (raw 00a00f11)
> (XEN) BSP microcode revision: 0x0a001137
>
> whereas from xl dmesg after the system boots, we see things correctly:
>
> (XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100
> (XEN) build-id: d1536ff6698b3b8968e883fc39e3ba307d551abf
> (XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw
> 00a00f11)
> (XEN) BSP microcode revision: 0x0a001137
>
>
> The lost bit of text differs even when rebooting the same Xen binary,
> but it's always around this area, very early on boot.
>
> I've been seeing this for a little while, but one of my common dev
> machines is showing it fairly reliably at the moment.
>
> Checking a transcript of the terminal, we're missing characters, rather
> than having additional control characters causing the corruption.
>
> I suppose I need to stare at console_init_preirq() some more, but if
> anyone has ideas, I'm all ears.
>
> ~Andrew
>
Hi,
   I would guess the code for early boot is different and is not waiting
correctly if the serial is able to accept new characters so the hardware
buffer is overwritten.

Frediano

>

--00000000000048414f06416b934f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">On Fri, 17 Oct 2025, 18:16 Andrew Coope=
r, &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.c=
om</a>&gt; wrote:</div><div class=3D"gmail_quote gmail_quote_container" dir=
=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I think we&#39;ve got a bug with the serial console.=C2=A0 I&#39;m reliably=
 loosing a<br>
small part of the boot message. e.g.:<br>
<br>
(XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100<br>
(XEN) build-id: d1536ff6698b3e3ba307d551abf<br>
=C2=A0Family 25 (0x19 Stepping 1 (raw 00a00f11)<br>
(XEN) BSP microcode revision: 0x0a001137<br>
<br>
whereas from xl dmesg after the system boots, we see things correctly:<br>
<br>
(XEN) Latest ChangeSet: Fri Oct 17 17:24:59 2025 git:5e79cfcd2100<br>
(XEN) build-id: d1536ff6698b3b8968e883fc39e3ba307d551abf<br>
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 1 (0x1), Stepping 1 (raw<br>
00a00f11)<br>
(XEN) BSP microcode revision: 0x0a001137<br>
<br>
<br>
The lost bit of text differs even when rebooting the same Xen binary,<br>
but it&#39;s always around this area, very early on boot.<br>
<br>
I&#39;ve been seeing this for a little while, but one of my common dev<br>
machines is showing it fairly reliably at the moment.<br>
<br>
Checking a transcript of the terminal, we&#39;re missing characters, rather=
<br>
than having additional control characters causing the corruption.<br>
<br>
I suppose I need to stare at console_init_preirq() some more, but if<br>
anyone has ideas, I&#39;m all ears.<br>
<br>
~Andrew<br></blockquote></div><div dir=3D"auto">Hi,</div><div dir=3D"auto">=
=C2=A0 =C2=A0I would guess the code for early boot is different and is not =
waiting correctly if the serial is able to accept new characters so the har=
dware buffer is overwritten.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Frediano</div><div class=3D"gmail_quote gmail_quote_container" dir=3D"=
auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"></blockquote></div></div>

--00000000000048414f06416b934f--

