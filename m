Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6271F3E80
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 16:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jifSH-0007I9-DT; Tue, 09 Jun 2020 14:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjqw=7W=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jifSG-0007I4-AO
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 14:42:20 +0000
X-Inumbo-ID: 6b7fdada-aa5f-11ea-8496-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b7fdada-aa5f-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 14:42:19 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id mb16so22676827ejb.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ki+xtFzrVQ5beBnZloSaLFJth1P9xZ3c7hTehpR30zI=;
 b=aXzAnSPrw3hH829dvi2JYMl9VAwnMDzkS9G3iYxLBRo0ll+c0HdgbhotibPEIsMRDS
 kF3n2++F6m8NiOkBnW2pOsht9vbiLIp6twY8dZ6uUqDb45OV/O/3whCD9K+pKi8v2gwf
 HteJln8RP8YZi8NOcWzzem4OQeqSSqyOc65qL23he3yD9O+kcQD8aMmiNoM5kCmU8Gq2
 TTOIeTZWCMuaGtfGY7x6yyH83QXMZ7bQGdJqBpRPRdT9ZQQmjAqzW6lIOTfRpv7vKFfU
 nw/v3XwYy+G5GVMwb/y85T6HUyPWCny3gb6K6WkIJbXsciotOitfYwMy+L/LM0AjlbfI
 BvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ki+xtFzrVQ5beBnZloSaLFJth1P9xZ3c7hTehpR30zI=;
 b=SmXmmhFlaGatsUpdPTvPOruXIxFdjwySvgLYBGu4iAD41O5VWdMKBHizePn2bXRACf
 9TFRiM+1nxqe6/jgKXwKJE0Glr+ox85V6uzKyVVbtKVWpm7j4zWs4ots2USbtMaPfLKK
 lz6yXLpYyLcZEPF/eOGE/SG6a7NWKWgzQ7qLEHovGN2RFGvV9oAOKPH8BDP72ZW8n76/
 y9N2xhdLcjvK+X7nAqjLeZL/wMV1xDN2vkfO4bKivupJRrECmG0S/apa0FuJ8JIjlw71
 g7pL0DMQwC7PXIi9vt+UB8jV3hA45SSMiHDIsXSpdZvtt+b9jADqdR4vGbGxYbtZtbLX
 YNyw==
X-Gm-Message-State: AOAM532MSGDVSAAvfiOsllcTdqrtU5vF5u8+nheU8vMzp+qT4qSiMwS/
 Y/cm39xG3FVb1EU+XtZKzb3YrGmDhvPySXVNX60=
X-Google-Smtp-Source: ABdhPJzOmZo/yNpZsRiQLsQ/s2UhYQo8JdBADxgQtgGm7kiGusFc3m963OrV5Pl75e4gJ42yEy7SJmRLyjaugEDwqWI=
X-Received: by 2002:a17:906:5203:: with SMTP id
 g3mr25058979ejm.58.1591713738725; 
 Tue, 09 Jun 2020 07:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191114045543.6759-1-julian.tuminaro@gmail.com>
 <CACCGGhBUhdLkh7x=Uf8=d=73DH-CAiNw0YcSwbzZG+0nEj3hRQ@mail.gmail.com>
In-Reply-To: <CACCGGhBUhdLkh7x=Uf8=d=73DH-CAiNw0YcSwbzZG+0nEj3hRQ@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Tue, 9 Jun 2020 15:42:07 +0100
Message-ID: <CAFLBxZZ3k_U1zrs977PJCO8jEGL=+6e9-thChUwFUi4_ukbJPw@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH V2] kdd.c: Add support for initial handshake
 in KD protocol for Win 7, 8 and 10 (64 bit)
To: Paul Durrant <pdurrant@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fb1f0005a7a7bb78"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>,
 Jenish Rakholiya <rjenish@cmu.edu>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Julian Tuminaro <jtuminar@andrew.cmu.edu>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julian Tuminaro <julian.tuminaro@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000fb1f0005a7a7bb78
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 1:31 PM Paul Durrant <pdurrant@gmail.com> wrote:

> On Thu, 14 Nov 2019 at 04:57, Julian Tuminaro <julian.tuminaro@gmail.com>
> wrote:
> >
> > From: Julian Tuminaro and Jenish Rakholiya <julian.tuminaro@gmail.com
> and rakholiyajenish.07@gmail.com>
> >
> > Current implementation of find_os is based on the hard-coded values for
> > different Windows version. It uses the value for get the address to
> > start looking for DOS header in the given specified range. However, this
> > is not scalable to all version of Windows as it will require us to keep
> > adding new entries and also due to KASLR, chances of not hitting the PE
> > header is significant. We implement a way for 64-bit systems to use IDT
> > entry to get a valid exception/interrupt handler and then move back into
> > the memory to find the valid DOS header. Since IDT entries are protected
> > by PatchGuard, we think our assumption that IDT entries will not be
> > corrupted is valid for our purpose. Once we have the image base, we
> > search for the DBGKD_GET_VERSION64 structure type in .data section to
> > get information required for handshake.
> >
> > Currently, this is a work in progress feature and current patch only
> > supports the handshake and memory read/write on 64-bit systems.
> >
> > NOTE: This is the Updated version of the previous patch submitted
> > NOTE: This has currently been only tested when debugging was not enabled
> > on the guest Windows.
> >
> > Signed-off-by: Jenish Rakholiya <rjenish@cmu.edu>
> > Signed-off-by: Julian Tuminaro <jtuminar@andrew.cmu.edu>
>
> LGTM.
>
> Reviewed-by: Paul Durrant <paul@xen.org>
>

Paul, is this something worth adding a line to CHANGELOG about?

 -George

--000000000000fb1f0005a7a7bb78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 15, 2019 at 1:31 PM Paul =
Durrant &lt;<a href=3D"mailto:pdurrant@gmail.com">pdurrant@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 14 Nov 2019 at 04:57, Julian Tuminaro &lt;<a href=3D"mailto:julian.tuminar=
o@gmail.com" target=3D"_blank">julian.tuminaro@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Julian Tuminaro and Jenish Rakholiya &lt;<a href=3D"mailto:julia=
n.tuminaro@gmail.com" target=3D"_blank">julian.tuminaro@gmail.com</a> and <=
a href=3D"mailto:rakholiyajenish.07@gmail.com" target=3D"_blank">rakholiyaj=
enish.07@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Current implementation of find_os is based on the hard-coded values fo=
r<br>
&gt; different Windows version. It uses the value for get the address to<br=
>
&gt; start looking for DOS header in the given specified range. However, th=
is<br>
&gt; is not scalable to all version of Windows as it will require us to kee=
p<br>
&gt; adding new entries and also due to KASLR, chances of not hitting the P=
E<br>
&gt; header is significant. We implement a way for 64-bit systems to use ID=
T<br>
&gt; entry to get a valid exception/interrupt handler and then move back in=
to<br>
&gt; the memory to find the valid DOS header. Since IDT entries are protect=
ed<br>
&gt; by PatchGuard, we think our assumption that IDT entries will not be<br=
>
&gt; corrupted is valid for our purpose. Once we have the image base, we<br=
>
&gt; search for the DBGKD_GET_VERSION64 structure type in .data section to<=
br>
&gt; get information required for handshake.<br>
&gt;<br>
&gt; Currently, this is a work in progress feature and current patch only<b=
r>
&gt; supports the handshake and memory read/write on 64-bit systems.<br>
&gt;<br>
&gt; NOTE: This is the Updated version of the previous patch submitted<br>
&gt; NOTE: This has currently been only tested when debugging was not enabl=
ed<br>
&gt; on the guest Windows.<br>
&gt;<br>
&gt; Signed-off-by: Jenish Rakholiya &lt;<a href=3D"mailto:rjenish@cmu.edu"=
 target=3D"_blank">rjenish@cmu.edu</a>&gt;<br>
&gt; Signed-off-by: Julian Tuminaro &lt;<a href=3D"mailto:jtuminar@andrew.c=
mu.edu" target=3D"_blank">jtuminar@andrew.cmu.edu</a>&gt;<br>
<br>
LGTM.<br>
<br>
Reviewed-by: Paul Durrant &lt;<a href=3D"mailto:paul@xen.org" target=3D"_bl=
ank">paul@xen.org</a>&gt;<br></blockquote></div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Paul, is this something worth adding a=
 line to CHANGELOG about?</div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">=C2=A0-George<br></div></div>

--000000000000fb1f0005a7a7bb78--

