Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD454EC312
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 14:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296296.504304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXMK-00041y-Ru; Wed, 30 Mar 2022 12:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296296.504304; Wed, 30 Mar 2022 12:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZXMK-0003zw-Oi; Wed, 30 Mar 2022 12:23:32 +0000
Received: by outflank-mailman (input) for mailman id 296296;
 Wed, 30 Mar 2022 12:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x//1=UJ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nZXMI-0003zq-Lg
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 12:23:30 +0000
Received: from MTA-10-3.privateemail.com (mta-10-3.privateemail.com
 [198.54.127.62]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a1a87a-b024-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 14:23:29 +0200 (CEST)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id B0C7318000AB
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 08:23:26 -0400 (EDT)
Received: from mail-oi1-f180.google.com (unknown [10.20.151.187])
 by mta-10.privateemail.com (Postfix) with ESMTPA id 8BE4D18000AA
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 08:23:26 -0400 (EDT)
Received: by mail-oi1-f180.google.com with SMTP id e189so21870599oia.8
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 05:23:26 -0700 (PDT)
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
X-Inumbo-ID: 33a1a87a-b024-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648643006;
	bh=BWLGM4TaaOB5S+Z6LyE/DIBHfPx4N7kbvBvRQzqHlZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGBuYgnpdX2Jvi8bAb/9gFjH1x3E/j4vZTCqcz/kaIwtD+NdLNfjiQTCyQAHnSeK+
	 9DbproIBjyB+8W6ixLsP5KWKbOikE1EUNgatzfhfdVG8aIduoN2/UcqtgtVcNhnN/s
	 aA99EIb2XmtdTG5KqXVdhr/tVTicbwSXwBXJGJC6WoD2wcoO7M116OheB8s2BbctPY
	 vBCZiNrNOXb+8FwKOfA65bwSDdSFWsusJdjo0HiBNfBrntV0M9Pr1k1DSehsT+4ALK
	 j2V/fazkne5Vakl4MvVxrUBm0o87cVi7pUWCx6PIrGwMvFAMd8hwRRFwf4NPQ3+VEV
	 PcQHYcpEngZ8A==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1648643006;
	bh=BWLGM4TaaOB5S+Z6LyE/DIBHfPx4N7kbvBvRQzqHlZI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGBuYgnpdX2Jvi8bAb/9gFjH1x3E/j4vZTCqcz/kaIwtD+NdLNfjiQTCyQAHnSeK+
	 9DbproIBjyB+8W6ixLsP5KWKbOikE1EUNgatzfhfdVG8aIduoN2/UcqtgtVcNhnN/s
	 aA99EIb2XmtdTG5KqXVdhr/tVTicbwSXwBXJGJC6WoD2wcoO7M116OheB8s2BbctPY
	 vBCZiNrNOXb+8FwKOfA65bwSDdSFWsusJdjo0HiBNfBrntV0M9Pr1k1DSehsT+4ALK
	 j2V/fazkne5Vakl4MvVxrUBm0o87cVi7pUWCx6PIrGwMvFAMd8hwRRFwf4NPQ3+VEV
	 PcQHYcpEngZ8A==
X-Gm-Message-State: AOAM531//ZRevy7QGQBm74lKBxVE4wYFAL9NTnRXevrCCSTFVvloPh+k
	N8l4XR22Xnkhi0Nu35fipckZ8zoZ8T+2yNuY1sQ=
X-Google-Smtp-Source: ABdhPJyRHCjmMa9r1NhtmZat0Yig7HRsCNC6gUNSKYuj8wQekX3UyNN2MnxpDYEOwE11Yb1JShrZ2p6KAC+YKcejTC8=
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr1671814oin.128.1648643005935; Wed, 30
 Mar 2022 05:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <ab6bb88e90e5649c60e08a1680b3a2390441031b.1648561546.git.tamas.lengyel@intel.com>
 <04459197-458b-8d10-2692-981495c0e243@suse.com> <CABfawhnKL_7iBiOAHLjtKhH6sCDRfrLcNS_kr3YSLr=XdQdUGg@mail.gmail.com>
 <b20fd202-0fd2-ad8a-58dc-1ca83b8da444@suse.com>
In-Reply-To: <b20fd202-0fd2-ad8a-58dc-1ca83b8da444@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 30 Mar 2022 08:23:14 -0400
X-Gmail-Original-Message-ID: <CABfawhnTxuMr7T02B=0thy8h_P4KnCC2zc+Q-Ej==WZdh-Te9A@mail.gmail.com>
Message-ID: <CABfawhnTxuMr7T02B=0thy8h_P4KnCC2zc+Q-Ej==WZdh-Te9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] x86/mem_sharing: option to enforce fork starting
 with empty p2m
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000baf69d05db6e9cc8"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000baf69d05db6e9cc8
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022, 2:47 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 29.03.2022 18:10, Tamas K Lengyel wrote:
> > On Tue, Mar 29, 2022 at 11:42 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 29.03.2022 16:03, Tamas K Lengyel wrote:
> >>> Add option to the fork memop to enforce a start with an empty p2m.
> >>> Pre-populating special pages to the fork tend to be necessary only
> when setting
> >>> up forks to be fully functional with a toolstack or if the fork makes
> use of
> >>> them in some way. For short-lived forks these pages are optional and
> starting
> >>> with an empty p2m has advantages both in terms of reset performance as
> well as
> >>> easier reasoning about the state of the fork after creation.
> >>
> >> I'm afraid I don't consider this enough of an explanation: Why would
> these
> >> page be optional? Where does the apriori knowledge come from that the
> guest
> >> wouldn't manage to access the vCPU info pages or the APIC access one?
> >
> > By knowing what code you are fuzzing. The code you are fuzzing is
> > clearly marked by harnesses and that's the only code you execute while
> > fuzzing. If you know the code doesn't use them, no need to map them
> > in. They haven't been needed in any of the fuzzing setups we had so
> > far so I'm planning to be this the default when fuzzing.
>
> But isn't it the very nature of what you do fuzzing for that unexpected
> code paths may be taken? By not having in place what is expected to be
> there, yet more unexpected behavior might then result.
>

You don't get totally arbitrary execution, no. If you do then that means
having instability and non-reproducible runs which makes the fuzzing
inefficient. So if you know that the part of code has no reasonable path to
reach code using these pages then you can get rid of them. This is an
option for cases where you can make that call. That's all, just an option.


> Plus - how do you bound how far the guest executes in a single attempt?
>

We use a cpuid or breakpoint to signal where the code reached the end
point. The start point is where the parent got paused (also usually using a
magic cpuid).

Tamas

>

--000000000000baf69d05db6e9cc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 30, 2022, 2:47 AM Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 29.03.2022 18:10, Tamas K Lengyel wrote:<br>
&gt; On Tue, Mar 29, 2022 at 11:42 AM Jan Beulich &lt;<a href=3D"mailto:jbe=
ulich@suse.com" target=3D"_blank" rel=3D"noreferrer">jbeulich@suse.com</a>&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 29.03.2022 16:03, Tamas K Lengyel wrote:<br>
&gt;&gt;&gt; Add option to the fork memop to enforce a start with an empty =
p2m.<br>
&gt;&gt;&gt; Pre-populating special pages to the fork tend to be necessary =
only when setting<br>
&gt;&gt;&gt; up forks to be fully functional with a toolstack or if the for=
k makes use of<br>
&gt;&gt;&gt; them in some way. For short-lived forks these pages are option=
al and starting<br>
&gt;&gt;&gt; with an empty p2m has advantages both in terms of reset perfor=
mance as well as<br>
&gt;&gt;&gt; easier reasoning about the state of the fork after creation.<b=
r>
&gt;&gt;<br>
&gt;&gt; I&#39;m afraid I don&#39;t consider this enough of an explanation:=
 Why would these<br>
&gt;&gt; page be optional? Where does the apriori knowledge come from that =
the guest<br>
&gt;&gt; wouldn&#39;t manage to access the vCPU info pages or the APIC acce=
ss one?<br>
&gt; <br>
&gt; By knowing what code you are fuzzing. The code you are fuzzing is<br>
&gt; clearly marked by harnesses and that&#39;s the only code you execute w=
hile<br>
&gt; fuzzing. If you know the code doesn&#39;t use them, no need to map the=
m<br>
&gt; in. They haven&#39;t been needed in any of the fuzzing setups we had s=
o<br>
&gt; far so I&#39;m planning to be this the default when fuzzing.<br>
<br>
But isn&#39;t it the very nature of what you do fuzzing for that unexpected=
<br>
code paths may be taken? By not having in place what is expected to be<br>
there, yet more unexpected behavior might then result.<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">You don&#39;t get tot=
ally arbitrary execution, no. If you do then that means having instability =
and non-reproducible runs which makes the fuzzing inefficient. So if you kn=
ow that the part of code has no reasonable path to reach code using these p=
ages then you can get rid of them. This is an option for cases where you ca=
n make that call. That&#39;s all, just an option.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Plus - how do you bound how far the guest executes in a single attempt?<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">We u=
se a cpuid or breakpoint to signal where the code reached the end point. Th=
e start point is where the parent got paused (also usually using a magic cp=
uid).</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tamas</div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000baf69d05db6e9cc8--

