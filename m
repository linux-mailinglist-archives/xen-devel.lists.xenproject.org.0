Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6503F2B67B1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:43:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29043.58245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2Cu-00026O-57; Tue, 17 Nov 2020 14:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29043.58245; Tue, 17 Nov 2020 14:43:44 +0000
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
	id 1kf2Cu-00025z-1q; Tue, 17 Nov 2020 14:43:44 +0000
Received: by outflank-mailman (input) for mailman id 29043;
 Tue, 17 Nov 2020 14:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+iwA=EX=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
 id 1kf2Cs-00025u-F5
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:43:42 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01e943a0-a0b4-4d3f-99d2-0adf996cd279;
 Tue, 17 Nov 2020 14:43:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u19so24197957lfr.7
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 06:43:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+iwA=EX=gmail.com=cheyenne.wills@srs-us1.protection.inumbo.net>)
	id 1kf2Cs-00025u-F5
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:43:42 +0000
X-Inumbo-ID: 01e943a0-a0b4-4d3f-99d2-0adf996cd279
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 01e943a0-a0b4-4d3f-99d2-0adf996cd279;
	Tue, 17 Nov 2020 14:43:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id u19so24197957lfr.7
        for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2020 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QeNFXaMRbG0TXRdf1BcLhaiZbUvGLStAY3jmHGSDROA=;
        b=sR46a+KE8aZl+yy4j2I6SVx+VPjarZiC9qTGTt86igNaBpN4+QrtMYfpqqSBBvJ0lp
         uWPkzjtQoGRRXqOsogIqlYcmw12FP1H7164YHU5IJJbm8NTo9/eSOJqXNALdyM4pJSQ1
         zOxJKq2WMl/MH1pqVqS6AXvCEHLBfhKFE24t+pMMrWPQkH10RA5vWfNkCvx/U+F42qHq
         BVq/ldRpATNc+VGqTK4uS6OphxqMKOcsycKLAP071aWkEqdMhQ8PU/vL8mG6yCub2vKr
         TD7tE+LBzIxOz5jKqka4THrVqOJ6l3UNb+a0/IC5z7VvOZV7blHMq82U9pGmTH90/lzq
         jaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QeNFXaMRbG0TXRdf1BcLhaiZbUvGLStAY3jmHGSDROA=;
        b=YFgPXUnF+IqaZKLtOYBk8GAy3n1sJ8GY50y83EVwLGX4dXpb5tTJQ0bzPLJFQ4SPpK
         znJhIBsrecNGJWdHrei509aoLJHr3i7lcYfsDO7jZdTdTMqddN61dzCJags3zwZLLZih
         zAPR+wlRWXB8l88r4ZXOOZZnUrdJ2MWM4OXULg0q23cCuGBGbG4VcFCUchYly6pA8jgJ
         0fmvyaH+AlGgmouMs39ffMerfOpPt/jmLiS3aocaIyXwjBf5tzoa0gOkkWgbisXn2+u8
         TYsg3lM92MV3Gy0Nxp1awjgxIjrvyRjAO4NHtJAFooRCZJn1fG+wJRlBJrHc4W6zN61g
         gd3Q==
X-Gm-Message-State: AOAM530ebr/w39aPndSVi9GEONvzpTId6moiUp1yvgUkvddGR8j1CAzL
	Z7gWoYPKmPZ/WqzTeF3HKyMsb3nDJkfcwiv/wOc=
X-Google-Smtp-Source: ABdhPJxqpGr8/kTWAmL7nf9+ebHPt8dVNKc+PwoLvFN1e17IVHFWFSDz77lXhlevDMmTRZJKQs2P8fdNLaPxG58jnq8=
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr1830382lfg.309.1605624220457;
 Tue, 17 Nov 2020 06:43:40 -0800 (PST)
MIME-Version: 1.0
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
In-Reply-To: <7bca24cb-a3af-b54d-b224-3c2a316859dd@suse.com>
From: Cheyenne Wills <cheyenne.wills@gmail.com>
Date: Tue, 17 Nov 2020 07:43:29 -0700
Message-ID: <CAHpsFVcy2n2Sr845mPw4txH5UTbtKrbezRtgdmDaDX0T2r5wog@mail.gmail.com>
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000004d9f1605b44e851c"

--0000000000004d9f1605b44e851c
Content-Type: text/plain; charset="UTF-8"

The Solaris version reported in the copyright banner on the ISO is SunOS
Release 5.11 Version 11.4.0.15.0 64-bit

My existing guest solaris systems are also at the same release/version level

At the time of the panic, the panic log reports that the rcx register
contains '0606' (this was from my notes yesterday).  If additional
information is needed, I will need a bit more time to set up my system
again.

On Tue, Nov 17, 2020 at 1:12 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 16.11.2020 22:57, Cheyenne Wills wrote:
> > Running Xen with XSA-351 is causing Solaris 11 systems to panic during
> > boot.  The panic screen is showing the failure to be coming from
> > "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
> > and the  booting from an install ISO image.
> >
> > I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
> > requested that I report it here.
>
> Thanks. What we need though is information on the specific MSR(s) that
> will need to have workarounds added: We surely would want to avoid
> blindly doing this for all that the XSA change disallowed access to.
> Reproducing the panic screen here might already help; proper full logs
> would be even better.
>
> Jan
>

--0000000000004d9f1605b44e851c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The Solaris version reported in the copyright banner on th=
e ISO is SunOS Release 5.11 Version 11.4.0.15.0 64-bit<div><br></div><div>M=
y existing guest solaris systems are also at the same release/version level=
</div><div><br></div><div>At the time of the panic, the panic log reports t=
hat the rcx register contains &#39;0606&#39; (this was from my notes yester=
day).=C2=A0 If additional information is needed, I will need a bit more tim=
e to set up=C2=A0my system again.</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 1:12 AM Jan =
Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16.11.=
2020 22:57, Cheyenne Wills wrote:<br>
&gt; Running Xen with XSA-351 is causing Solaris 11 systems to panic during=
<br>
&gt; boot.=C2=A0 The panic screen is showing the failure to be coming from<=
br>
&gt; &quot;unix:rdmsr&quot;.=C2=A0 The panic occurs with existing guests (b=
ooting off a disk)<br>
&gt; and the=C2=A0 booting from an install ISO image.<br>
&gt; <br>
&gt; I discussed the problem with &quot;andyhhp__&quot; in the &quot;#xen&q=
uot; IRC channel and he<br>
&gt; requested that I report it here.<br>
<br>
Thanks. What we need though is information on the specific MSR(s) that<br>
will need to have workarounds added: We surely would want to avoid<br>
blindly doing this for all that the XSA change disallowed access to.<br>
Reproducing the panic screen here might already help; proper full logs<br>
would be even better.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000004d9f1605b44e851c--

