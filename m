Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A22490F6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 00:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8ABK-0006eS-Kx; Tue, 18 Aug 2020 22:34:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kyle=B4=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8ABJ-0006eN-Dl
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 22:34:13 +0000
X-Inumbo-ID: 0ccf1dd3-eea0-456e-a353-78f739ae6fbf
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ccf1dd3-eea0-456e-a353-78f739ae6fbf;
 Tue, 18 Aug 2020 22:34:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id v22so16437571qtq.8
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2020 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y2ECG4sdAtdxS6azw7bk+yXAfNVbiH0KONUo0yH6osA=;
 b=YH1R5JDYpVxoqBr7mm3RQJUSfQbYaFejjL0GMmh0k04UYVwP9tgIUaxTndqJK1RNRC
 hy+KhAuMJfgLJCQpQSmN3SODjyOTMTyKy7yOPDRk8hYxZWlB+hmOSaWLomZX28ojyYhs
 6AQQ4KXF6fhl0GHtky4fZ/ddD3LhQPYUVxjFIQIH0OsrT8pihwB+xd/1Msvn1g09ujdp
 9xNoyWCYM3rdlGG1OyMi/n2o8UMMD6VxPQM6RalGl1CSrexXoiOwuHufcET+9cgD8O26
 V4JlEIfQqrm/LTYw5VRXTR0OIJB/c6aRHs1WdAkduh+CrrICYL0Z18ejGulwNE6UmZmy
 6w0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y2ECG4sdAtdxS6azw7bk+yXAfNVbiH0KONUo0yH6osA=;
 b=bGFje3kEgDa1LFzefm8RtmLUhzIxwOtnTd/dVRv0Bmdf4zWLfubAxHkaic+rtB+g1X
 VoQKyukFDozYvNFleMAFLmGl+oa3XlPC1UDg2lvqcXxw3ddrq/FM4CZilL29U9C/RPe0
 zbEQHgOX6F1rC1j9j1rKHOxL3mC0CDLA2WxGHTDOesd+VewvMduVj/gM0ZOLGuX62vZx
 3EUNrXXW/idtCFnCVfQwc4+m59Wix8Mfl8NoOF8Bo/OiyRNj8TJxuv4fQElvG7DxMEck
 yhamT71MQtBkALSI6kKk8/VtpiUfHQ3yxdlT+miw7DkNXlJ17zvWsrC6I459BuvRuBC0
 pXzQ==
X-Gm-Message-State: AOAM531wXMhaFgRTKpz023CV3qTKBjkRmrZrtNEFynSkPPCAeG2XY7F8
 GtSeQlBOW9BX5KXbfp9axQE0x7+6JdqWjMZzvHvfcw==
X-Google-Smtp-Source: ABdhPJzTOOJPen0qAEappqskiUhQCt0jpZ8fzfSAH+LjXnFdJJcHFnkB5WpLRuR3PUDTazuzxx5dWwgq/D1USQ4k5OE=
X-Received: by 2002:ac8:4b69:: with SMTP id g9mr19755416qts.113.1597790051890; 
 Tue, 18 Aug 2020 15:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <0f6b9a9d-e25f-c2ae-ea2b-fd13107a3b06@citrix.com>
In-Reply-To: <0f6b9a9d-e25f-c2ae-ea2b-fd13107a3b06@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 18 Aug 2020 15:34:01 -0700
Message-ID: <CAMmSBy8TQuF2qqVUBv1=LyA_tcDC-c_z80NgiXnDPo2OJCzg7g@mail.gmail.com>
Subject: Re: Xen 4.14.0 is busted on Dell 300x IoT Gateways
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007817e205ad2e7cef"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000007817e205ad2e7cef
Content-Type: text/plain; charset="UTF-8"

Hi Andrew!

thanks for replying so quickly -- much appreciated.

On Tue, Aug 18, 2020 at 3:20 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 18/08/2020 23:09, Roman Shaposhnik wrote:
> > Hi!
> >
> > first things first -- booting on those devices have always
> > required efi=no-rs
>
> That is a bug.  Please start a separate thread about it.  EFI Runtime
> Services are de-facto mandatory on modern systems, and it is totally
> unacceptable (from a users perspective) that Xen just doesn't work by
> default.
>
> It needs fixing.
>

Sure, but right now it is tough to start that thread on account of not
having
anything functional on these devices -- I can remove byt_gpio support from
the linux kernel -- but that doesn't seem right to me.

IOW, I don't really have a functional Dom0. If someone can help with that
-- I can
then start the thread.

Also, just as an observation, I wouldn't surprised if UEFI implementation
on these devices pushes the envelope on what it means to be standard
compliant UEFI so to speak -- but you're 100% right -- if we can make
Xen run on them without tweaks -- that'd be awesome.


> > -- but it seems that Xen 4.14 is now
> > busted at a more fundamental level. I'm attaching two
> > boot sequences (one with kernel 4.19.5 and one with 5.4.51)
> > in the hopes that this may provide some clues right away.
>
> As a note, from your logs:
>
> Kernel command line: console=hvc0 root=(hd0,gpt1)/rootfs.img
> dom0_mem=1024M,max:1024M dom0_max_vcpus=1 dom0_vcpus_pin
> eve_mem=650M,max:650M eve_max_vcpus=1 ctrd_mem=300M,max:300M
> ctrd_max_vcpus=1 rootdelay=3 setup_loops eve_installer
>
You've got some Xen command line parameters on the Kernel command line,
> which won't be helping matters.
>

That's actually on purpose -- Project EVE uses Xen syntax for setting
up these values for cases where we are not running under Xen and need
to tickle other hypervisors (like KVM or ACRN) just so from the Dom0 itself.

See below on running without Xen.


> >
> > Any help would be greatly appreciated!
> >
> > Oh, and finally it appears that this is NOT a regression from
> > Xen 4.13 -- it fails the same way. I haven't tried Xen's earlier
> > than that.
>
> This is a Linux issue, not a Xen issue.
>

It seems like a combination of both frankly -- note that very same kernels
have no trouble booting without Xen and work perfectly with KVM.


> It is hitting a BUG_ON() while setting up interrupts.
>
> Interestingly, they are both in byt_gpio_runtime_resume() which I guess
> is BayTrail as the Intel platform, which probably means that something
> pertaining to GPIO interrupts isn't being initialised normally.
>

Or Xen isn't passing some vital info to the Linux kernel. Or setting up some
weird memory mapping, etc. Like I said -- there's no issue with running
these kernels by themselves.

Thanks,
Roman.

--0000000000007817e205ad2e7cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Andrew!</div><div><br></div><div>=
thanks for replying so quickly -- much appreciated.</div><div dir=3D"ltr"><=
br></div><div dir=3D"ltr">On Tue, Aug 18, 2020 at 3:20 PM Andrew Cooper &lt=
;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">On 18/08/2=
020 23:09, Roman Shaposhnik wrote:<br>
&gt; Hi!<br>
&gt;<br>
&gt; first things first -- booting on those devices have always<br>
&gt; required efi=3Dno-rs<br>
<br>
That is a bug.=C2=A0 Please start a separate thread about it.=C2=A0 EFI Run=
time<br>
Services are de-facto mandatory on modern systems, and it is totally<br>
unacceptable (from a users perspective) that Xen just doesn&#39;t work by<b=
r>
default.<br>
<br>
It needs fixing.<br></blockquote><div><br></div><div>Sure, but right now it=
 is tough to start that thread on account of not having</div><div>anything =
functional on these devices -- I can remove byt_gpio support from</div><div=
>the linux kernel -- but that doesn&#39;t seem right to me.</div><div><br><=
/div><div>IOW, I don&#39;t really have a functional Dom0. If someone can he=
lp with that -- I can</div><div>then start the thread.</div><div><br></div>=
<div>Also, just as an observation, I wouldn&#39;t surprised if UEFI impleme=
ntation</div><div>on these devices pushes the envelope on what it means to =
be standard</div><div>compliant UEFI so to speak -- but you&#39;re 100% rig=
ht -- if we can make</div><div>Xen run on them without tweaks -- that&#39;d=
 be awesome.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">&gt; -- but it seems t=
hat Xen 4.14 is now=C2=A0<br>
&gt; busted at a more fundamental level. I&#39;m attaching two<br>
&gt; boot sequences (one with kernel=C2=A04.19.5 and one with 5.4.51)<br>
&gt; in the hopes that this may provide some clues right away.<br>
<br>
As a note, from your logs:<br>
<br>
Kernel command line: console=3Dhvc0 root=3D(hd0,gpt1)/rootfs.img<br>
dom0_mem=3D1024M,max:1024M dom0_max_vcpus=3D1 dom0_vcpus_pin<br>
eve_mem=3D650M,max:650M eve_max_vcpus=3D1 ctrd_mem=3D300M,max:300M<br>
ctrd_max_vcpus=3D1 rootdelay=3D3 setup_loops eve_installer<br></blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex">You&#39;ve got some Xen command line parameters on the Ker=
nel command line,<br>
which won&#39;t be helping matters.<br></blockquote><div><br></div><div><di=
v style=3D"color:rgb(0,0,0)">That&#39;s actually on purpose -- Project EVE =
uses Xen syntax for setting</div><div style=3D"color:rgb(0,0,0)">up these v=
alues for cases where we are not running under Xen and need</div><div style=
=3D"color:rgb(0,0,0)">to tickle other hypervisors (like KVM or ACRN) just s=
o from the Dom0 itself.</div></div><div style=3D"color:rgb(0,0,0)"><br></di=
v><div style=3D"color:rgb(0,0,0)">See below on running without Xen.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex">&gt;<br>
&gt; Any help would=C2=A0be greatly appreciated!<br>
&gt;<br>
&gt; Oh, and finally it appears that this is NOT a regression from<br>
&gt; Xen 4.13 -- it fails the same way. I haven&#39;t tried Xen&#39;s earli=
er<br>
&gt; than that.<br>
<br>
This is a Linux issue, not a Xen issue.<br></blockquote><div><br></div><div=
>It seems like a combination of both frankly -- note that very same kernels=
</div><div>have no trouble booting without Xen and work perfectly with KVM.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">It is hitting a BUG_ON() while sett=
ing up interrupts.<br>
<br>
Interestingly, they are both in byt_gpio_runtime_resume() which I guess<br>
is BayTrail as the Intel platform, which probably means that something<br>
pertaining to GPIO interrupts isn&#39;t being initialised normally.<br></bl=
ockquote><div><br></div><div>Or Xen isn&#39;t passing some vital info to th=
e Linux kernel. Or setting up some</div><div>weird memory mapping, etc. Lik=
e I said -- there&#39;s no issue with running</div><div>these kernels by th=
emselves.</div><div><br></div><div>Thanks,</div><div>Roman.=C2=A0</div></di=
v></div></div>

--0000000000007817e205ad2e7cef--

