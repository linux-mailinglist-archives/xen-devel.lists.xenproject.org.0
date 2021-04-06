Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71144355AF7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106186.203087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTq2t-0004NJ-Sx; Tue, 06 Apr 2021 18:03:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106186.203087; Tue, 06 Apr 2021 18:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTq2t-0004Mu-Ph; Tue, 06 Apr 2021 18:03:23 +0000
Received: by outflank-mailman (input) for mailman id 106186;
 Tue, 06 Apr 2021 18:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMKf=JD=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lTq2r-0004Mp-NU
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:03:21 +0000
Received: from mail-qt1-x836.google.com (unknown [2607:f8b0:4864:20::836])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b21b281b-f7f0-4bd2-80dd-2098291879e1;
 Tue, 06 Apr 2021 18:03:20 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id i19so11834729qtv.7
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 11:03:20 -0700 (PDT)
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
X-Inumbo-ID: b21b281b-f7f0-4bd2-80dd-2098291879e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uXOQHdoNbkPYHgW/BhybWZufm6QjZjyBs0RSbcQ92+c=;
        b=cah/k8LvmVI6szqS5zoIM7qXkf37FiujQrMKhKE0fDQYfd5KBF4+4t7tZkSwj6goi1
         TqpGxu01L276V1FkYtbfKmx6XW8ZNHRuo+IQ4o5kFqxtWn0BdzQTh2Mt41+xlKfPPqIe
         1BS+2+SNIIFYp968t+D3pWXUrazZMt2Wg50c1+pRpeq1VYBTeMXw8ElND4ijjbbRYS9s
         4gh20M50/faC2ISS57FOS/hNDAhUXME+jkzHtpQVsXrdMzxHxsOtlMLGPWj+ipVV4tkf
         SPfKhOWY2h3iU58fmVpf4P1QK65Z15arsNsmKBCT8V8LU4y/idMiSe2fGz9jYTCWZdY3
         bEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uXOQHdoNbkPYHgW/BhybWZufm6QjZjyBs0RSbcQ92+c=;
        b=lBVduQrGN7GTtKfsIZrZWmrAbXn4lrT9O4F42esUAo9mgXJPK+TpOrq7AHq9MpsXNO
         G2YY/fGaRX38M4OHhiyFWWfXk6OUa2ZUFPOhrQFVd9FfRV0eCnXZ1GOaFL1kHL2tNarK
         NZHdYDsp99sBVPXj3i2POCKdWVBocoJItAtxylvnL5z2e25psUx8M+Xe3s12YYxL87Kp
         M41SDWc+fVJBny3cNaRNa8mHfVRMZFNHW/6ekYk1o20TDTHDMRf8cl3WqNhQGvoXH4GJ
         VoPhO3S180C269kUsdqAWXaRWSRHAmbWqnQaE+3R6p5eK6P52bL3iEVPI+C+MkDj1Dut
         55uw==
X-Gm-Message-State: AOAM533mImIbpr7CJEpkYPxenPGdRlZdJSpoJfalLZtGm+JXXc4rZjyz
	zRXcvnse+HQ6fDQn/n8rVepLLVeK8GrV/VId6KwnrQ==
X-Google-Smtp-Source: ABdhPJw1Ufm+2D7a320Wce9LADVSJtq0nqaLEh7x797LBFnO5XL3PX4W20TQM3ODPXZZwmy1isjomQvgwUzTRMyYGO8=
X-Received: by 2002:aed:32c6:: with SMTP id z64mr28709656qtd.77.1617732200309;
 Tue, 06 Apr 2021 11:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com> <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com> <YGWH89ubVe104Tnl@Air-de-Roger>
 <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com> <f800ac60-7d49-fa08-ca8d-1c75408dd2de@suse.com>
 <f835e433-368c-b107-9963-9107d3432ce6@citrix.com>
In-Reply-To: <f835e433-368c-b107-9963-9107d3432ce6@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 6 Apr 2021 11:03:12 -0700
Message-ID: <CAMmSBy9w3VZpKdkSkpCAgDsRk0K24_Ssx-YvF9d_mpA8WetUkg@mail.gmail.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	grub-devel@gnu.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000002435f505bf51a182"

--0000000000002435f505bf51a182
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 6, 2021 at 10:51 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 06/04/2021 09:19, Jan Beulich wrote:
> > On 01.04.2021 21:43, Andrew Cooper wrote:
> >> On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:
> >>> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
> >>>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
> >>>>> And the obvious next question: is my EVE usecase esoteric enough th=
at
> >>>>> I should just go ahead and do a custom GRUB patch or is there a mor=
e
> >>>>> general interest in this?
> >>>> Not sure if it ought to be a grub patch - the issue could as well
> >>>> be dealt with in Xen, by concatenating modules to form a monolithic
> >>>> initrd.
> >>> I would rather have it done in the loader than Xen, mostly because
> >>> it's a Linux boot specific format, and hence I don't think Xen should
> >>> have any knowledge about it.
> >>>
> >>> If it turns out to be impossible to implement on the loader side we
> >>> should consider doing it in Xen, but that's not my first option.
> >> Concatenating random things which may or may not be initrds is
> >> absolutely not something Xen should do.  We don't have enough context =
to
> >> do it safely/sensibly.
> > Well, I wasn't suggesting anywhere to concatenate random things.
> > Instead I was envisioning a command line option giving us the
> > context we need (e.g. "initrd=3D3+5").
>
> That's a massive layering violation, and incredibly fragile to the order
> of lines in the boot stanza.
>

Don't have enough karma to argue Xen architectural side of things, but...


> Either fix it by using a single monolithic initrd, which has worked
> perfectly well for the past 2 decades
>

...just to point out the obvious here:  even Debian who can HARDLY be
blamed for tracking the bleeding edge has been recommending this
for quite some time:

https://wiki.debian.org/DebianInstaller/NetbootFirmware#The_Solution:_Add_F=
irmware_to_Initramfs
Obviously there's no way to do that with Xen today out of the box.

Now, you can turn around and say "well, how hard could it be to
concatenate?". That's fair. But it is also fair to point out that everytime
we do that we portray Xen as "not quite as user friendly as X" (and
this is, of course, pure perception -- but if we want users to stick
perception matters a lot).

Thanks,
Roman.

P.S. Curiously enough, saying that -- I'm undermining my own case -- it is
actually
*easier* for me to hack GRUB in EVE. But I felt like stating the obvious
anyway.

--0000000000002435f505bf51a182
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 6, 2021 at 1=
0:51 AM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andr=
ew.cooper3@citrix.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 06/04/2021 09:19, Jan Be=
ulich wrote:<br>
&gt; On 01.04.2021 21:43, Andrew Cooper wrote:<br>
&gt;&gt; On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:<br>
&gt;&gt;&gt; On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:<b=
r>
&gt;&gt;&gt;&gt; On 01.04.2021 03:06, Roman Shaposhnik wrote:<br>
&gt;&gt;&gt;&gt;&gt; And the obvious next question: is my EVE usecase esote=
ric enough that<br>
&gt;&gt;&gt;&gt;&gt; I should just go ahead and do a custom GRUB patch or i=
s there a more<br>
&gt;&gt;&gt;&gt;&gt; general interest in this?<br>
&gt;&gt;&gt;&gt; Not sure if it ought to be a grub patch - the issue could =
as well<br>
&gt;&gt;&gt;&gt; be dealt with in Xen, by concatenating modules to form a m=
onolithic<br>
&gt;&gt;&gt;&gt; initrd.<br>
&gt;&gt;&gt; I would rather have it done in the loader than Xen, mostly bec=
ause<br>
&gt;&gt;&gt; it&#39;s a Linux boot specific format, and hence I don&#39;t t=
hink Xen should<br>
&gt;&gt;&gt; have any knowledge about it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; If it turns out to be impossible to implement on the loader si=
de we<br>
&gt;&gt;&gt; should consider doing it in Xen, but that&#39;s not my first o=
ption.<br>
&gt;&gt; Concatenating random things which may or may not be initrds is<br>
&gt;&gt; absolutely not something Xen should do.=C2=A0 We don&#39;t have en=
ough context to<br>
&gt;&gt; do it safely/sensibly.<br>
&gt; Well, I wasn&#39;t suggesting anywhere to concatenate random things.<b=
r>
&gt; Instead I was envisioning a command line option giving us the<br>
&gt; context we need (e.g. &quot;initrd=3D3+5&quot;).<br>
<br>
That&#39;s a massive layering violation, and incredibly fragile to the orde=
r<br>
of lines in the boot stanza.<br></blockquote><div><br></div><div>Don&#39;t =
have enough karma to argue Xen architectural side of things, but...</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Either fix it by using a single monolithic initrd, which has worked<br>
perfectly well for the past 2 decades<br></blockquote><div><br></div><div>.=
..just to point out the obvious here:=C2=A0 even Debian who can HARDLY be</=
div><div>blamed for tracking the bleeding edge has been recommending this</=
div><div>for quite some time:</div><div>=C2=A0 =C2=A0=C2=A0<a href=3D"https=
://wiki.debian.org/DebianInstaller/NetbootFirmware#The_Solution:_Add_Firmwa=
re_to_Initramfs">https://wiki.debian.org/DebianInstaller/NetbootFirmware#Th=
e_Solution:_Add_Firmware_to_Initramfs</a></div><div>Obviously there&#39;s n=
o way to do that with Xen today out of the box.</div><div><br></div><div>No=
w, you can turn around and say &quot;well, how hard could it be to</div><di=
v>concatenate?&quot;. That&#39;s fair. But it is also fair to point out tha=
t everytime</div><div>we do that we portray Xen as &quot;not quite as user =
friendly as X&quot; (and</div><div>this is, of course, pure perception -- b=
ut if we want users to stick</div><div>perception matters a lot).</div><div=
><br></div><div>Thanks,<br>Roman.</div><div><br></div><div>P.S. Curiously e=
nough, saying that -- I&#39;m undermining my own case -- it is actually</di=
v><div>*easier* for me to hack GRUB in EVE. But I felt like stating the obv=
ious anyway.</div></div></div></div>

--0000000000002435f505bf51a182--

