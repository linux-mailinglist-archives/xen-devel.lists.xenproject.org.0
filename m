Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A158A2A1AA5
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 22:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17033.41805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYy9H-0004J2-KR; Sat, 31 Oct 2020 21:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17033.41805; Sat, 31 Oct 2020 21:10:55 +0000
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
	id 1kYy9H-0004Id-HO; Sat, 31 Oct 2020 21:10:55 +0000
Received: by outflank-mailman (input) for mailman id 17033;
 Sat, 31 Oct 2020 21:10:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJr3=EG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kYy9G-0004IY-AW
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 21:10:54 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc467fe9-9d91-4afe-854f-1a8051b7c388;
 Sat, 31 Oct 2020 21:10:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a9so10181426wrg.12
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2020 14:10:52 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TJr3=EG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kYy9G-0004IY-AW
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 21:10:54 +0000
X-Inumbo-ID: dc467fe9-9d91-4afe-854f-1a8051b7c388
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dc467fe9-9d91-4afe-854f-1a8051b7c388;
	Sat, 31 Oct 2020 21:10:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a9so10181426wrg.12
        for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2020 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLkdRm8luG3Y/TaJy2hbja3zVLCKJ9ijfgMi5tCNaGA=;
        b=ofbIPN4tff2jsWRZLQ/I5kVvTVlsl0yq7sasoRBjWLOkf/+q1Pd9mc2B61Cuu6otEm
         bECnyMx81yPgKwny9q9pSbK3F84SxDJ4xQsuiGcL6vz99cD6r6OLZU4nqV0CfTGRlYap
         vDw8RpQqUFp6l5imV6FwgUhqQs231GzXvnY/YJx4gVeTTzqZmD6xmmFG6tLN2SwLEZhb
         EW/hcDACuPYD0KgDpPnsg0fYVkJiX+bCtoESTZu9vw36v85jbBiT+zaUZGZDJvCHYNKR
         caQeXOe3CvNpetLqPuJaUfgXPSx8GyUPkwIQxrQa/gIchww4CJSPdLSKz4UdnHF3C+FB
         idaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLkdRm8luG3Y/TaJy2hbja3zVLCKJ9ijfgMi5tCNaGA=;
        b=ZMyLjKM8B7g4brqxSMd2+wncXJ8aTaQbq+t9bqJHE+SbgaPWuj+VsOg2h95e8sSP5W
         pVZmo0FBW87pShYwCVC5XhcZ/oHW59yUicT6JRsXodECuT73yV8WCMEBjDuwM3VS0/5E
         H3KKQds5hOsRnZge0JpE2vDJsz6SFV4BBZ/nTo9ZBW9TbYp/6peiuJzynWjTsbGWXKHe
         jigSO+6RvBUB+cY5DVxzdS1KzyLBsnis51GJKAdCXxxVOXmJ6I1c34wRDP5pjvGvRlm6
         pERoxTxAx5WivQTS7NL0hEG5225SUvANZyvqwgSy8P2c0yDn6sk03CeWf1jbEgyx+2ge
         UwpA==
X-Gm-Message-State: AOAM5310hf/SCAHEMEO6aYplupbpU86VsslgI9AhIiihbbmUBDTQHDtm
	eMRtFZCdcjwzyhrKA47msbK0MLjc+IbZr3r4kD8=
X-Google-Smtp-Source: ABdhPJyk9AmXhk1tgcBqa9mfjrBGXwM3Cj1CVpcntjIaKgimQRpet4ZicGCzbgxEPBEJLe1Ab+VRDMonM5rEUI7ekdY=
X-Received: by 2002:adf:8b92:: with SMTP id o18mr11511603wra.54.1604178651915;
 Sat, 31 Oct 2020 14:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com> <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
In-Reply-To: <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sat, 31 Oct 2020 23:10:40 +0200
Message-ID: <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000b42afe05b2fdf2e1"

--000000000000b42afe05b2fdf2e1
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 1:34 PM Masami Hiramatsu <
masami.hiramatsu@linaro.org> wrote:

> Hi Oleksandr,
>

Hi Masami, all

[sorry for the possible format issue]


> >> >
> >> >       Could you tell me how can I test it?
> >> >
> >> >
> >> > I assume it is due to the lack of the virtio-disk backend (which I
> haven't shared yet as I focused on the IOREQ/DM support on Arm in the
> >> > first place).
> >> > Could you wait a little bit, I am going to share it soon.
> >>
> >> Do you have a quick-and-dirty hack you can share in the meantime? Even
> >> just on github as a special branch? It would be very useful to be able
> >> to have a test-driver for the new feature.
> >
> > Well, I will provide a branch on github with our PoC virtio-disk backend
> by the end of this week. It will be possible to test this series with it.
>
> Great! OK I'll be waiting for the PoC backend.
>
> Thank you!
>

You can find the virtio-disk backend PoC (shared as is) at [1].

Brief description...

The virtio-disk backend PoC is a completely standalone entity (IOREQ
server) which emulates a virtio-mmio disk device.
It is based on code from DEMU [2] (for IOREQ server purposes) and some code
from kvmtool [3] to implement virtio protocol,
disk operations over underlying H/W and Xenbus code to be able to read
configuration from the Xenstore
(it is configured via domain config file). Last patch in this series
(marked as RFC) actually adds required bits to the libxl code.

Some notes...

Backend could be used with current V2 IOREQ series [4] without any
modifications, all what you need is to enable
CONFIG_IOREQ_SERVER on Arm [5], since it is disabled by default within this
series.

Please note that in our system we run backend in DomD (driver domain). I
haven't tested it in Dom0,
since in our system the Dom0 is thin (without any H/W) and only used to
launch VMs, so there is no underlying block H/W.
But, I hope, it is possible to run it in Dom0 as well (at least there is
nothing specific to a particular domain in the backend itself, nothing
hardcoded).
If you are going to run a backend in other than Dom0 domain you need to
write your own policy (FLASK) for the backend (running in that domain)
to be able to issue DM related requests, etc. Only for test purposes you
could use this patch [6] that tweeks Xen dummy policy (not for upstream).

As I mentioned elsewhere you don't need to modify Guest Linux (DomU), just
enable VirtIO related configs.
If I remember correctly, the following would be enough:
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_VIRTIO_BLK=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MMIO=y
If I remember correctly, if your Host Linux (Dom0 or DomD) version >= 4.17
you don't need to modify it as well.
Otherwise, you need to cherry-pick "xen/privcmd: add
IOCTL_PRIVCMD_MMAP_RESOURCE" from the upstream to be able
to use the acquire interface for the resource mapping.

We usually build a backend in the context of the Yocto build process and
run it as a systemd service,
but you can also build and run it manually (it should be launched before
DomU creation).

There are no command line options at all. Everything is configured via
domain configuration file:
# This option is mandatory, it shows that VirtIO is going to be used by
guest
virtio=1
# Example of domain configuration (two disks are assigned to the guest, the
latter is in readonly mode):
vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]

Hope that helps. Feel free to ask questions if any.

[1] https://github.com/xen-troops/virtio-disk/commits/ioreq_v3
[2] https://xenbits.xen.org/gitweb/?p=people/pauldu/demu.git;a=summary
[3] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/
[4] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml3
[5]
https://github.com/otyshchenko1/xen/commit/ee221102193f0422a240832edc41d73f6f3da923
[6]
https://github.com/otyshchenko1/xen/commit/be868a63014b7aa6c9731d5692200d7f2f57c611

-- 
Regards,

Oleksandr Tyshchenko

--000000000000b42afe05b2fdf2e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 1:34 PM Masam=
i Hiramatsu &lt;<a href=3D"mailto:masami.hiramatsu@linaro.org" target=3D"_b=
lank">masami.hiramatsu@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Oleksandr,<br></blockquote><div>=C2=A0<=
/div><div>Hi Masami, all</div><div><br></div><div>[sorry for the possible f=
ormat issue]</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Could you tell me how can I test it=
?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I assume it is due to the lack of the virtio-disk backend (wh=
ich I haven&#39;t shared yet as I focused on the IOREQ/DM support on Arm in=
 the<br>
&gt;&gt; &gt; first place).<br>
&gt;&gt; &gt; Could you wait a little bit, I am going to share it soon.<br>
&gt;&gt;<br>
&gt;&gt; Do you have a quick-and-dirty hack you can share in the meantime? =
Even<br>
&gt;&gt; just on github as a special branch? It would be very useful to be =
able<br>
&gt;&gt; to have a test-driver for the new feature.<br>
&gt;<br>
&gt; Well, I will provide a branch on github with our PoC virtio-disk backe=
nd by the end of this week. It will be possible to test this series with it=
.<br>
<br>
Great! OK I&#39;ll be waiting for the PoC backend.<br>
<br>
Thank you!<br></blockquote><div><br></div><div>You can find the virtio-disk=
 backend PoC (shared as is) at [1].=C2=A0<br><br></div><div>Brief descripti=
on...</div><div><br>The virtio-disk backend PoC is a completely standalone =
entity (IOREQ server) which emulates a virtio-mmio disk device.<br>It is ba=
sed on code from DEMU [2] (for IOREQ server purposes) and some code from kv=
mtool [3] to implement virtio protocol,<br>disk operations over underlying =
H/W and Xenbus code to be able to read configuration from the Xenstore<br>(=
it is configured via domain config file). Last patch in this series (marked=
 as RFC) actually adds required bits to the libxl code.=C2=A0 =C2=A0<br></d=
iv><div><br></div><div>Some notes...</div><div><br></div><div>Backend could=
 be used with current V2 IOREQ series [4] without any modifications, all wh=
at you need is to enable</div><div>CONFIG_IOREQ_SERVER on Arm [5], since it=
 is disabled by default within this series.</div></div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">Please note that in our system =
we run backend in DomD (driver domain). I haven&#39;t tested it in Dom0,<br=
>since in our system the Dom0 is thin (without any H/W) and only used to la=
unch VMs, so there is no underlying block H/W. <br>But, I hope, it is possi=
ble to run it in Dom0 as well (at least there is nothing specific to a part=
icular domain in the backend itself, nothing hardcoded).</div><div class=3D=
"gmail_quote">If you are going to run a backend in other than Dom0 domain y=
ou need to write your own policy (FLASK) for the backend (running in that=
=C2=A0domain)<br></div><div class=3D"gmail_quote">to be able to issue DM re=
lated requests, etc. Only for test purposes you could use this patch [6] th=
at tweeks Xen dummy policy (not for upstream).</div><div class=3D"gmail_quo=
te">=C2=A0=C2=A0<br></div><div class=3D"gmail_quote">As I mentioned elsewhe=
re you don&#39;t need to modify Guest Linux (DomU), just enable VirtIO rela=
ted configs.</div><div class=3D"gmail_quote">If I remember correctly, the f=
ollowing would be enough:</div><div class=3D"gmail_quote">CONFIG_BLK_MQ_VIR=
TIO=3Dy<br>CONFIG_VIRTIO_BLK=3Dy<br>CONFIG_VIRTIO=3Dy<br>CONFIG_VIRTIO_BALL=
OON=3Dy<br>CONFIG_VIRTIO_MMIO=3Dy</div><div class=3D"gmail_quote">If I reme=
mber correctly, if your Host Linux (Dom0 or DomD) version &gt;=3D 4.17 you =
don&#39;t need to modify it as well.</div><div class=3D"gmail_quote">Otherw=
ise, you need to cherry-pick &quot;xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESO=
URCE&quot; from the upstream to be able<br>to use the acquire interface for=
 the resource mapping.</div><br clear=3D"all"><div>We usually build a backe=
nd in the context of the Yocto build process and run it as a systemd servic=
e,</div><div>but you can also build and run it manually (it should be launc=
hed before DomU creation).<br></div><div><br></div><div>There are no comman=
d line options at all. Everything is configured via domain configuration fi=
le:<br># This option is mandatory, it shows that VirtIO is going to be used=
 by guest<br>virtio=3D1<br># Example of domain configuration (two disks are=
 assigned to the guest, the latter is in readonly mode):<br>vdisk =3D [ &#3=
9;backend=3DDomD, disks=3Drw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3&#39; ]<br></d=
iv><div><br></div><div>Hope that helps. Feel free to ask questions if any.<=
br><br>[1]=C2=A0<a href=3D"https://github.com/xen-troops/virtio-disk/commit=
s/ioreq_v3">https://github.com/xen-troops/virtio-disk/commits/ioreq_v3</a><=
br></div><div>[2] <a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeople/pau=
ldu/demu.git;a=3Dsummary">https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu=
/demu.git;a=3Dsummary</a><br>[3] <a href=3D"https://git.kernel.org/pub/scm/=
linux/kernel/git/will/kvmtool.git/">https://git.kernel.org/pub/scm/linux/ke=
rnel/git/will/kvmtool.git/</a><br></div><div>[4] <a href=3D"https://github.=
com/otyshchenko1/xen/commits/ioreq_4.14_ml3">https://github.com/otyshchenko=
1/xen/commits/ioreq_4.14_ml3</a></div><div>[5]=C2=A0<a href=3D"https://gith=
ub.com/otyshchenko1/xen/commit/ee221102193f0422a240832edc41d73f6f3da923">ht=
tps://github.com/otyshchenko1/xen/commit/ee221102193f0422a240832edc41d73f6f=
3da923</a></div><div>[6]=C2=A0<a href=3D"https://github.com/otyshchenko1/xe=
n/commit/be868a63014b7aa6c9731d5692200d7f2f57c611">https://github.com/otysh=
chenko1/xen/commit/be868a63014b7aa6c9731d5692200d7f2f57c611</a></div><div><=
br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><di=
v><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font =
size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif"=
>Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"=
ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2=
">Oleksandr Tyshchenko</font></span></div></div></div></div></div></div></d=
iv></div>

--000000000000b42afe05b2fdf2e1--

