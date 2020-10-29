Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078529F760
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 23:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15192.38182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYG4S-0002no-91; Thu, 29 Oct 2020 22:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15192.38182; Thu, 29 Oct 2020 22:07:00 +0000
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
	id 1kYG4S-0002nP-5Y; Thu, 29 Oct 2020 22:07:00 +0000
Received: by outflank-mailman (input) for mailman id 15192;
 Thu, 29 Oct 2020 22:06:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kYG4Q-0002nK-Lc
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 22:06:58 +0000
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1257bab-c4f6-4c3f-b9b5-7e4b672cec8a;
 Thu, 29 Oct 2020 22:06:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id a72so1201328wme.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 15:06:57 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wm+X=EE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kYG4Q-0002nK-Lc
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 22:06:58 +0000
X-Inumbo-ID: c1257bab-c4f6-4c3f-b9b5-7e4b672cec8a
Received: from mail-wm1-x32d.google.com (unknown [2a00:1450:4864:20::32d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1257bab-c4f6-4c3f-b9b5-7e4b672cec8a;
	Thu, 29 Oct 2020 22:06:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id a72so1201328wme.5
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6NI7kaC3nQvvPszH00Re27/NRj1bjVvJ2D9vN+soQk=;
        b=Gj+ihPQLepNvdi5vjCkRgdNBkRk5+W9+kLux/YayXm6wTUyETKPptSkTiTHP5XrLdS
         tg8CgojEQMXGDbCrcK4roym516+PZu+qntmSPV+C3VkR1xi/Dk0rBV09D0mwT5lok5s9
         bQORyln6MAKLEKB3dtmcNrsocmRgJcwI9I9mnz2uBZsC+YTe/BJuBljU63pRk3h0q2hj
         rjUxLoNRJn2oCwQcZcTgsFh0cbjJFbb9HPxAKyqPtfsdJesp5pNHw2eSv7SZR4Ccmig9
         NXC64eVtPkpWgGJiF165lr/O+p0eMuZeEsv+PlvqJZuqjQ+OAiZvTvQhTn5yDNmCbxFn
         NBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6NI7kaC3nQvvPszH00Re27/NRj1bjVvJ2D9vN+soQk=;
        b=oOsfwcQs5kwGz9/XRSlpYDBGWb7IlTb8u0YUO4mCJudck65BfK7owB2JF1tO7uttCz
         Xj4LvSM0dYnZKbf8a9DvJ1IihtVBepi43mIVzgNYFieSF11gXsrkdPdtvsjLOEnYpDQI
         Zx7KQmM+JI/H/PtPTpFQjTs1Wt2RicJ4/sKXKnnUVsTZoQDEc5vm6tcl1X6e6uwWpr4C
         SRhsbztUi2HvboPyVslxK1VXnl678ovWpFtUZ9USNmHTeBZkuMQoidxgRSExFGJYOmhM
         ELboCRHfdrRSTllH8XjHAtTrPpg7jgRjxbPoFdiWuHBhGW1mfJcS/qWHL39oN0/2WEF6
         RVTw==
X-Gm-Message-State: AOAM5331g/UjOVRnwWsQ+l1MQoDJstTa9aq4P81khmP5nwWsXmYhAtjC
	5HL7HTtMK1oE6beZXioYn9CuoVhTU3/CsjtaLgs=
X-Google-Smtp-Source: ABdhPJwl4hqDlAIrif301IXHfdIGb0UQv4GoF7FPVWET3aTgf3iz6lYAE16EhvKvANBWW9qGGYK4SSBB1c7oiB+pBV8=
X-Received: by 2002:a1c:4646:: with SMTP id t67mr1133470wma.40.1604009216860;
 Thu, 29 Oct 2020 15:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com> <871rhgn6j4.fsf@linaro.org>
In-Reply-To: <871rhgn6j4.fsf@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Fri, 30 Oct 2020 00:06:45 +0200
Message-ID: <CAPD2p-mD-7=zZAPV8u4Ya67haJFbCuGoDVAT8ZqfVyJSW8GDJw@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000966a0805b2d67f62"

--000000000000966a0805b2d67f62
Content-Type: text/plain; charset="UTF-8"

Hi Alex.

[sorry for the possible format issues]


> I assume this is wiring up the required bits of support to handle the
> IOREQ requests in QEMU?


No, it is not related to QEMU. We don't run QEMU in our system. Being
honest I have never tried to run it)
virtio-disk backend PoC is a completely standalone entity (IOREQ server)
which emulates a virtio-mmio disk device.
It is based on code from DEMU (for IOREQ server purposes) and some code
from kvmtool to implement virtio protocol,
disk operations over underlying H/W and Xenbus code to be able to read
configuration from the Xenstore
(it is configured via domain config file). Last patch in this series
(marked as RFC) actually adds required bits to the libxl code.


> We are putting together a PoC demo to show
> a virtio enabled image (AGL) running on both KVM and Xen hypervisors so
> we are keen to see your code as soon as you can share it.


Thank you. Sure, I will provide a branch with code by the end of this week.



>
> I'm currently preparing a patch series for QEMU which fixes the recent
> breakage caused by changes to the build system. As part of that I've
> separated CONFIG_XEN and CONFIG_XEN_HVM so it's possible to build
> i386-softmmu with unneeded for ARM bits. Hopefully this will allow me to
> create a qemu-aarch64-system binary with just the PV related models in
> it.
>
Does it mean that it will be possible to use QEMU in Xen on Arm just for
"backend provider" purposes?


>
> Talking to Stefano it probably makes sense going forward to introduce a
> new IOREQ aware machine type for QEMU that doesn't bring in the rest of
> the x86 overhead. I was thinking maybe xenvirt?
>
> You've tested with virtio-block but we'd also like to extend this to
> other arbitrary virtio devices. I guess we will need some sort of
> mechanism to inform the QEMU command line where each device sits in the
> virtio-mmio bus so the FDT Xen delivers to the guest matches up with
> what QEMU is ready to serve requests for?
>

I am sorry, I can't provide ideas here, not familiar with QEMU.
But, completely agree, that other virtio devices should be supported.

-- 
Regards,

Oleksandr Tyshchenko

--000000000000966a0805b2d67f62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hi Alex.</div><div><br></d=
iv><div>[sorry for the possible format issues]</div><br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I assume this is wiring up the required bits of support to handle the<br>
IOREQ requests in QEMU?</blockquote><div>=C2=A0</div><div>No, it is not rel=
ated to QEMU. We don&#39;t run QEMU in our system. Being honest I have neve=
r tried to run it)</div><div>virtio-disk backend PoC is a completely standa=
lone entity (IOREQ server) which emulates a virtio-mmio disk device.</div><=
div>It is based on code from DEMU (for IOREQ server purposes) and=C2=A0some=
 code from kvmtool to implement virtio protocol,</div><div>disk operations =
over underlying=C2=A0H/W and Xenbus code to be able to read configuration f=
rom the Xenstore</div><div>(it is configured via domain config file). Last =
patch in this series (marked as RFC) actually adds required bits to the lib=
xl code.=C2=A0 =C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">We are putting together a PoC demo to show<br>
a virtio enabled image (AGL) running on both KVM and Xen hypervisors so<br>
we are keen to see your code as soon as you can share it.</blockquote><div>=
=C2=A0</div><div>Thank you. Sure, I will provide a branch with code by the =
end of this week.</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
I&#39;m currently preparing a patch series for QEMU which fixes the recent<=
br>
breakage caused by changes to the build system. As part of that I&#39;ve<br=
>
separated CONFIG_XEN and CONFIG_XEN_HVM so it&#39;s possible to build<br>
i386-softmmu with unneeded for ARM bits. Hopefully this will allow me to<br=
>
create a qemu-aarch64-system binary with just the PV related models in<br>
it.<br></blockquote><div>Does it mean that it will be possible to use QEMU =
in Xen on Arm just for &quot;backend provider&quot; purposes?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Talking to Stefano it probably makes sense going forward to introduce a<br>
new IOREQ aware machine type for QEMU that doesn&#39;t bring in the rest of=
<br>
the x86 overhead. I was thinking maybe xenvirt?<br>
<br>
You&#39;ve tested with virtio-block but we&#39;d also like to extend this t=
o<br>
other arbitrary virtio devices. I guess we will need some sort of<br>
mechanism to inform the QEMU command line where each device sits in the<br>
virtio-mmio bus so the FDT Xen delivers to the guest matches up with<br>
what QEMU is ready to serve requests for?<br></blockquote><div>=C2=A0</div>=
<div>I am sorry, I can&#39;t provide ideas here, not familiar with QEMU.</d=
iv><div>But, completely agree, that other virtio devices should be supporte=
d.=C2=A0=C2=A0</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"backgro=
und-color:rgb(255,255,255)"><font size=3D"2"><span style=3D"color:rgb(51,51=
,51);font-family:Arial,sans-serif">Regards,</span></font></span></div><div =
dir=3D"ltr"><br></div><div dir=3D"ltr"><div><span style=3D"background-color=
:rgb(255,255,255)"><font size=3D"2">Oleksandr Tyshchenko</font></span></div=
></div></div></div></div></div></div></div>

--000000000000966a0805b2d67f62--

