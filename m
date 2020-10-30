Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BE2A0433
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 12:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15693.38771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYSfu-0008Nb-Qi; Fri, 30 Oct 2020 11:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15693.38771; Fri, 30 Oct 2020 11:34:30 +0000
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
	id 1kYSfu-0008NB-N3; Fri, 30 Oct 2020 11:34:30 +0000
Received: by outflank-mailman (input) for mailman id 15693;
 Fri, 30 Oct 2020 11:34:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CbTf=EF=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
 id 1kYSfs-0008KU-UF
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:34:28 +0000
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb630440-e620-4892-b95c-be87cc13a26c;
 Fri, 30 Oct 2020 11:34:22 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id n142so4832136ybf.7
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 04:34:22 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CbTf=EF=linaro.org=masami.hiramatsu@srs-us1.protection.inumbo.net>)
	id 1kYSfs-0008KU-UF
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 11:34:28 +0000
X-Inumbo-ID: fb630440-e620-4892-b95c-be87cc13a26c
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fb630440-e620-4892-b95c-be87cc13a26c;
	Fri, 30 Oct 2020 11:34:22 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id n142so4832136ybf.7
        for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2020 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tEVPYRxN4eP0njqUdgvQzP1KCxEliVxIDNVsR4aplJA=;
        b=zpVc9gGdOLEOrCPSJjgIOkMzw+k12NzOe3P7qqBULMOQ+erHcuwvb/+Fxl2JM8vj3x
         rSEoY+i0hBVMrfw1ncSegWuomLAeEXOkPOrUpIjEFSXn+kEgdCLWGHlQJiIq+8QKtfr7
         VA7nzm7rpnCpK32Tqtmblx5aHAvIb4otQoK6Wjb0OxM68kpKoHeVEQiblv0uPnOhQsd8
         6syUnmcCxN+vAjO7yYzMBwv4WynPKdRRIyxM8YAWNnvO4V61glc1RewJOy1cZ7lLEcst
         8+3L9cIqkZsTS+Yj8UnMaisMtRSmKWCr3FGAD+eHOe07EOmgYrEnyZORJ5SfJdudyPmK
         sUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tEVPYRxN4eP0njqUdgvQzP1KCxEliVxIDNVsR4aplJA=;
        b=Ih1pNLP+A6jStJ1PE5P3uDHbQBFjyLr+m02KjvUL7FQc9pCIYONTyR539Xo5HyU1KA
         N8FMYpGcbauA2T99VbVCcaXkkfX1My6+wxdAp6h2SFVQs6pWJ58rddiLo9bDAQewqZ36
         uXAvYibQ4RrCiYwvlxC+WV8GkL8X+LQUbu2EV0mxqJt0S8UT596g8xgMVxYYvj4zJxEG
         o+MeQVf+XERdLcG8Y0xvdSGTatBldkpfrOC5+KWx6zhuhLp12wyzD52RvTeeGugiS3x1
         FLQ+UV/bh320HgWKfeu0cBE6/D58hVWLTwGjhhZqV+SX4ycO2fuKuVkXeo1iuVPjImS+
         h2wg==
X-Gm-Message-State: AOAM532iVAjjzGCLQagrbfUSyIhadji8k28Bzva1uKGBcnF1DzJqvlww
	gIeuWSvd+ayxjydlZv0Oowpa31N+EIPxY5IvSC/Zog==
X-Google-Smtp-Source: ABdhPJyCQOG1RR4L8URruwKEwmpIplJdpAFn1czstD87XYBxGQ3hoV/Yo68snqZ3Dp0/cqXWj816iSIOtxOBbujh5nk=
X-Received: by 2002:a25:4e46:: with SMTP id c67mr2599406ybb.87.1604057661743;
 Fri, 30 Oct 2020 04:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
 <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s> <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
In-Reply-To: <CAPD2p-mH0Hi+JOUB-mt+aZR_gN86EZCpnMPTww0ErMESTwZ=AA@mail.gmail.com>
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date: Fri, 30 Oct 2020 20:34:10 +0900
Message-ID: <CAA93ih3Z-zxQ33gvr2C43i0J5XP3OBgUhTyMcwhe9zVj-uOONA@mail.gmail.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
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

2020=E5=B9=B410=E6=9C=8830=E6=97=A5(=E9=87=91) 6:14 Oleksandr Tyshchenko <o=
lekstysh@gmail.com>:
>
> Hi Stefano
>
> [sorry for the possible format issue]
>
> On Thu, Oct 29, 2020 at 9:53 PM Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
>>
>> On Thu, 29 Oct 2020, Oleksandr Tyshchenko wrote:
>> > On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <masami.hiramatsu@lin=
aro.org> wrote:
>> >       Hi Oleksandr,
>> >
>> > Hi Masami
>> >
>> > [sorry for the possible format issue]
>> >
>> >
>> >       I would like to try this on my arm64 board.
>> >
>> > Glad to hear you are interested in this topic.
>> >
>> >
>> >       According to your comments in the patch, I made this config file=
.
>> >       # cat debian.conf
>> >       name =3D "debian"
>> >       type =3D "pvh"
>> >       vcpus =3D 8
>> >       memory =3D 512
>> >       kernel =3D "/opt/agl/vmlinuz-5.9.0-1-arm64"
>> >       ramdisk =3D "/opt/agl/initrd.img-5.9.0-1-arm64"
>> >       cmdline=3D "console=3Dhvc0 earlyprintk=3Dxen root=3D/dev/xvda1 r=
w"
>> >       disk =3D [ '/opt/agl/debian.qcow2,qcow2,hda' ]
>> >       vif =3D [ 'mac=3D00:16:3E:74:3d:76,bridge=3Dxenbr0' ]
>> >       virtio =3D 1
>> >       vdisk =3D [ 'backend=3DDom0, disks=3Dro:/dev/sda1' ]
>> >
>> >       And tried to boot a DomU, but I got below error.
>> >
>> >       # xl create -c debian.conf
>> >       Parsing config from debian.conf
>> >       libxl: error: libxl_create.c:1863:domcreate_attach_devices: Doma=
in
>> >       1:unable to add virtio_disk devices
>> >       libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
>> >       1:xc_domain_pause failed
>> >       libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get d=
omain
>> >       type for domid=3D1
>> >       libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domai=
n
>> >       1:Unable to destroy guest
>> >       libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>> >       1:Destruction of domain failed
>> >
>> >
>> >       Could you tell me how can I test it?
>> >
>> >
>> > I assume it is due to the lack of the virtio-disk backend (which I hav=
en't shared yet as I focused on the IOREQ/DM support on Arm in the
>> > first place).
>> > Could you wait a little bit, I am going to share it soon.
>>
>> Do you have a quick-and-dirty hack you can share in the meantime? Even
>> just on github as a special branch? It would be very useful to be able
>> to have a test-driver for the new feature.
>
> Well, I will provide a branch on github with our PoC virtio-disk backend =
by the end of this week. It will be possible to test this series with it.

Great! OK I'll be waiting for the PoC backend.

Thank you!
--=20
Masami Hiramatsu

