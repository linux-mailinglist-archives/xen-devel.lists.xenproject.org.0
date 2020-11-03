Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 499A82A4831
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 15:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18354.43357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZxKQ-0008FQ-Hj; Tue, 03 Nov 2020 14:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18354.43357; Tue, 03 Nov 2020 14:30:30 +0000
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
	id 1kZxKQ-0008F1-Ea; Tue, 03 Nov 2020 14:30:30 +0000
Received: by outflank-mailman (input) for mailman id 18354;
 Tue, 03 Nov 2020 14:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OHVE=EJ=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kZxKP-0008Ew-9w
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:30:29 +0000
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea921a48-e733-47ec-9adb-c0389390518f;
 Tue, 03 Nov 2020 14:30:28 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id o70so15018120ybc.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:30:28 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OHVE=EJ=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kZxKP-0008Ew-9w
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:30:29 +0000
X-Inumbo-ID: ea921a48-e733-47ec-9adb-c0389390518f
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ea921a48-e733-47ec-9adb-c0389390518f;
	Tue, 03 Nov 2020 14:30:28 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id o70so15018120ybc.1
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wAq5NZ6AIfbVNF6x0628HtJVRbDZ70m+AsEhKikldfE=;
        b=SCqKreICtHxu9tfvcert9PvuT1zMJOQwUO/jpc5PPM+Vkj3r8YLyiu90Jsi269w24v
         xFNJMmL1tHhplayxiyl1FzNHlwrGjy5zVgA/e3fnampf4VJjWPsH3YJ1DPiFrvATGhuR
         ghgzIiFFehwGFofiHRnk80IxukqjdCRqRjinfaRC6W7WXHW4SpRJDscKXuZxacEB26+h
         xdTbWln85QCCPYHeMpaG/292KlyFTLCgsdUzYcXGOTPJUKCLizvayb95vafONJqFxijV
         LCOgNYEZWlriYQ1So+cfN2zM51aqkVIcFXrWkOPAlhdmpRlqWHpTiTzoiwhfv8jqLUqy
         sB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wAq5NZ6AIfbVNF6x0628HtJVRbDZ70m+AsEhKikldfE=;
        b=tb2ZDknGXDdn8/LDbdcIOMSUSDhGo6HZkHewzTjDvU3fcmAXz6XlmNiZeS4Jw0YefF
         SAnSCl3x+VxMxI8p9kHSnCiF7ql7rk+1DM7q8aDi6kjcTNEocCM+txYFfztt1BU1G+Rg
         WeuB0NfF4Ki3qGAr1StTVJ//0nmn2DJFAus4VxaCKuyGPnxuBdkriEoDqx52ypTgUEiA
         +35yQjLParNfRJpV3rMWSf6cGmW17XHv8+MSiBH7jqxsZlRZ6gu3BLIZKAr9QXvDaROH
         1hmlhulPg1e418GN8UX/W2Ulh7jEX97GZ26YBKzHMjQyQuqcQwS0e1VSuvL5tIHzjFEn
         meZA==
X-Gm-Message-State: AOAM532b3cC3A9dTTTc3RTkxKcF4ymbPSie5mDnA6BA8zd1vQPEa3f0Z
	jOC+KF/T74lI6/kQYwlL3J6/RoipmzwmSQpjmUQtLw==
X-Google-Smtp-Source: ABdhPJxdZrQ3p66qfaPjSfvDDL8bDFYstlPsHVpbA79lF+3WjNQuxp7JYGBUTjjhRPUmFh0QmlTS2xsu34cuKyfYvr8=
X-Received: by 2002:a25:d0cb:: with SMTP id h194mr26939162ybg.52.1604413827690;
 Tue, 03 Nov 2020 06:30:27 -0800 (PST)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
 <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
 <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com> <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
In-Reply-To: <CAPD2p-=2UimQy6VHKw1FgyVi2R94Ux_HFdPYk7=FR3KWSEqiHw@mail.gmail.com>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Tue, 3 Nov 2020 23:30:16 +0900
Message-ID: <CAA93ih3LcHPLbL7dPof-OAbM2HRJv0neQtMuYDYcYAOYDhVbKA@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Julien Grall <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

Thanks for sharing the virtio-disk server, I also tested with a real usb di=
sk.

In config file:

virtio =3D 1
vdisk =3D [ 'backend=3DDomain-0, disks=3Dro:/dev/sda1' ]

And it can be mounted in DomU

[    2.892874] virtio_blk virtio0: [vda] 1875382927 512-byte logical
blocks (960 GB/894 GiB)
[    2.892925] vda: detected capacity change from 0 to 960196058624
...
root@develbox:~# cat /proc/partitions
major minor  #blocks  name

 254        0  937691463 vda
...
root@develbox:~# mount /dev/vda /mnt/
[  192.260968] EXT4-fs (vda): mounted filesystem with ordered data
mode. Opts: (null)
mount: /mnt: WARNING: source write-protected, mounted read-only.

So "ro" flag also correctly works.
Great!

Thank you!

2020=E5=B9=B411=E6=9C=881=E6=97=A5(=E6=97=A5) 6:10 Oleksandr Tyshchenko <ol=
ekstysh@gmail.com>:
>
>
>
> On Fri, Oct 30, 2020 at 1:34 PM Masami Hiramatsu <masami.hiramatsu@linaro=
.org> wrote:
>>
>> Hi Oleksandr,
>
>
> Hi Masami, all
>
> [sorry for the possible format issue]
>
>>
>> >> >
>> >> >       Could you tell me how can I test it?
>> >> >
>> >> >
>> >> > I assume it is due to the lack of the virtio-disk backend (which I =
haven't shared yet as I focused on the IOREQ/DM support on Arm in the
>> >> > first place).
>> >> > Could you wait a little bit, I am going to share it soon.
>> >>
>> >> Do you have a quick-and-dirty hack you can share in the meantime? Eve=
n
>> >> just on github as a special branch? It would be very useful to be abl=
e
>> >> to have a test-driver for the new feature.
>> >
>> > Well, I will provide a branch on github with our PoC virtio-disk backe=
nd by the end of this week. It will be possible to test this series with it=
.
>>
>> Great! OK I'll be waiting for the PoC backend.
>>
>> Thank you!
>
>
> You can find the virtio-disk backend PoC (shared as is) at [1].
>
> Brief description...
>
> The virtio-disk backend PoC is a completely standalone entity (IOREQ serv=
er) which emulates a virtio-mmio disk device.
> It is based on code from DEMU [2] (for IOREQ server purposes) and some co=
de from kvmtool [3] to implement virtio protocol,
> disk operations over underlying H/W and Xenbus code to be able to read co=
nfiguration from the Xenstore
> (it is configured via domain config file). Last patch in this series (mar=
ked as RFC) actually adds required bits to the libxl code.
>
> Some notes...
>
> Backend could be used with current V2 IOREQ series [4] without any modifi=
cations, all what you need is to enable
> CONFIG_IOREQ_SERVER on Arm [5], since it is disabled by default within th=
is series.
>
> Please note that in our system we run backend in DomD (driver domain). I =
haven't tested it in Dom0,
> since in our system the Dom0 is thin (without any H/W) and only used to l=
aunch VMs, so there is no underlying block H/W.
> But, I hope, it is possible to run it in Dom0 as well (at least there is =
nothing specific to a particular domain in the backend itself, nothing hard=
coded).
> If you are going to run a backend in other than Dom0 domain you need to w=
rite your own policy (FLASK) for the backend (running in that domain)
> to be able to issue DM related requests, etc. Only for test purposes you =
could use this patch [6] that tweeks Xen dummy policy (not for upstream).
>
> As I mentioned elsewhere you don't need to modify Guest Linux (DomU), jus=
t enable VirtIO related configs.
> If I remember correctly, the following would be enough:
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_VIRTIO_BLK=3Dy
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> If I remember correctly, if your Host Linux (Dom0 or DomD) version >=3D 4=
.17 you don't need to modify it as well.
> Otherwise, you need to cherry-pick "xen/privcmd: add IOCTL_PRIVCMD_MMAP_R=
ESOURCE" from the upstream to be able
> to use the acquire interface for the resource mapping.
>
> We usually build a backend in the context of the Yocto build process and =
run it as a systemd service,
> but you can also build and run it manually (it should be launched before =
DomU creation).
>
> There are no command line options at all. Everything is configured via do=
main configuration file:
> # This option is mandatory, it shows that VirtIO is going to be used by g=
uest
> virtio=3D1
> # Example of domain configuration (two disks are assigned to the guest, t=
he latter is in readonly mode):
> vdisk =3D [ 'backend=3DDomD, disks=3Drw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3'=
 ]
>
> Hope that helps. Feel free to ask questions if any.
>
> [1] https://github.com/xen-troops/virtio-disk/commits/ioreq_v3
> [2] https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/demu.git;a=3Dsummar=
y
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/
> [4] https://github.com/otyshchenko1/xen/commits/ioreq_4.14_ml3
> [5] https://github.com/otyshchenko1/xen/commit/ee221102193f0422a240832edc=
41d73f6f3da923
> [6] https://github.com/otyshchenko1/xen/commit/be868a63014b7aa6c9731d5692=
200d7f2f57c611
>
> --
> Regards,
>
> Oleksandr Tyshchenko



--=20
Masami Hiramatsu

