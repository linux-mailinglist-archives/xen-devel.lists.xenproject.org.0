Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5439B6265
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828137.1242981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67LF-0004Ki-4O; Wed, 30 Oct 2024 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828137.1242981; Wed, 30 Oct 2024 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t67LF-0004I9-12; Wed, 30 Oct 2024 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 828137;
 Wed, 30 Oct 2024 11:58:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8xJ=R2=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1t67LE-0004I2-1Y
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:58:24 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 415fb12c-96b6-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:58:19 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb4fa17044so65528821fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:58:19 -0700 (PDT)
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
X-Inumbo-ID: 415fb12c-96b6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQxNWZiMTJjLTk2YjYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg5NDk5Ljc5NzU0LCJzZW5kZXIiOiJhbmRyaWkuc3VsdGFub3ZAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730289499; x=1730894299; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XpThXyDX988cmK9NZJyphkd5wgMOM+yc6RsGEfAYbmw=;
        b=DS/HjLNNnaExtFqEL73gd8IU7qsVYA4RHkXXw21XhncxhLPCFmOa8XFSH9kAyuXQqb
         a1aNKMDiOV7DJZFNmRHwptSb6bfEp+YrbQ/a3yPkdU1F2AFf+Gfr/cBORpI9oNMFm0tX
         GpPF4yD20tgbhTJz6kA35LVgp3jsfyXuHCE+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730289499; x=1730894299;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpThXyDX988cmK9NZJyphkd5wgMOM+yc6RsGEfAYbmw=;
        b=mMjwUE+05hjYGh2FnrQDm0GofqzT3WHzAgwNT2863fEJxSUV4vlL8GrqrbN3BK0izR
         wcb7VzZXVmbs9It5hixAxqIpssToWvypvIlsOEXG/8K2ouUc7vnRQM/Uzm3akK1lYl+4
         1YuogM+hMiJSt/b7yQsrrNFwAD9I51IMSalK1grpI1iQ9ADES4OIBcs9YgTRxsdrCwoM
         lImAPatABuPxQzJrIs02ojtp45Kf+gxsYGoGIhT9gyafK9xvV8draCBATPJVvTSEHa+U
         1rv6zXfAL7G5/CYlw6xd+dwscuno49iYAInGDypksRayKpTQzGkzm4YPgheCWZR/a7z8
         M3hw==
X-Gm-Message-State: AOJu0Yy0EzSSk3RZPiI2vj1l8uv7a4Vre9TQ5hNQoXgwdxPeK2I9KOWm
	EGihA2YWkks2qkYAVuXANF9N1u3cIJuryMrWgi1ZwMxzxc40Otk/RKrlC6Axkw6WEFX0kBYD/eP
	oeF7ubgsXPdjtaVpP0syKAG9bYQdg4BAO3R/3zrCbh40GJPD4T4IxuQ==
X-Google-Smtp-Source: AGHT+IFvrW00b3pEqfdoK30dDTlA38ocm0qUH+/TxxMw97B4jpUNIRlz/3dIteALgrkZ33li5Vxjsa1ial15CTdsJGQ=
X-Received: by 2002:a2e:9b42:0:b0:2fb:597e:28d9 with SMTP id
 38308e7fff4ca-2fcbdfbecbcmr60798611fa.14.1730289498499; Wed, 30 Oct 2024
 04:58:18 -0700 (PDT)
MIME-Version: 1.0
From: Andrii Sultanov <andrii.sultanov@cloud.com>
Date: Wed, 30 Oct 2024 11:58:07 +0000
Message-ID: <CAAa3AOOUDB4ZKAYSyXGdFsDzqpVfJd+oeRKR3XbVOSDkiaP_Yw@mail.gmail.com>
Subject: [QUESTION] tools/xenstored: Best way to proceed with the protocol modification
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com
Content-Type: multipart/alternative; boundary="000000000000ead7e30625b06a0d"

--000000000000ead7e30625b06a0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

(CC-ing J=C3=BCrgen as the original author of the xenstored partial directo=
ry
patches:
https://lore.kernel.org/xen-devel/20161205074853.13268-1-jgross@suse.com/)

I'm investigating implementing XS_DIRECTORY_PART support in Oxenstored, and
have come by a possible issue - the protocol specifies that the 'offset'
parameter for each call is a "byte offset into the list of children", and
so should be calculated on the user side. This makes sense for the C side
as children are stored in a single char array separated by null characters,
but OCaml stores children in a different structure, which can't be indexed
into this way (but is searched more efficiently, etc.)

What's the best way to proceed here?

Could the protocol be redefined to:
1) turn the 'offset' into an opaque id that needs to be re-sent as-is on
the next iteration? (it would keep being interpreted as an index into an
array on the C side, and as something else on the OCaml side)
2) return the opaque 'offset' on each call alongside the string and
generation id so that it wouldn't be calculated from strlen() on the user
side anymore?

Thank you,
Andrii

--000000000000ead7e30625b06a0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,=C2=A0</div><div><br></div><div>(CC-ing J=C3=BC=
rgen as the original author of the xenstored partial directory patches: <a =
href=3D"https://lore.kernel.org/xen-devel/20161205074853.13268-1-jgross@sus=
e.com/">https://lore.kernel.org/xen-devel/20161205074853.13268-1-jgross@sus=
e.com/</a>)</div><div><br></div><div>I&#39;m investigating implementing XS_=
DIRECTORY_PART support in Oxenstored, and have come by a possible issue - t=
he protocol specifies that the &#39;offset&#39; parameter for each call is =
a &quot;byte offset into the list of children&quot;, and so should be calcu=
lated on the user side. This makes sense for the C side as children are sto=
red in a single char array separated by null characters, but OCaml stores c=
hildren in a different structure, which can&#39;t be indexed into this way =
(but is searched more efficiently, etc.)<br></div><div><br></div><div>What&=
#39;s the best way to proceed here?<br></div><div><br></div><div>Could the =
protocol be redefined to:</div><div>1) turn the &#39;offset&#39; into an op=
aque id that needs to be re-sent as-is on the next iteration? (it would kee=
p being interpreted as an index into an array on the C side, and as somethi=
ng else on the OCaml side)</div><div>2) return the opaque &#39;offset&#39; =
on each call alongside the string and generation id so that it wouldn&#39;t=
 be calculated from strlen() on the user side anymore?</div><div><br></div>=
<div>Thank you, <br></div><div>Andrii<br></div></div>

--000000000000ead7e30625b06a0d--

