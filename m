Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C8A29F5CC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14661.36238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYE9X-0005mP-Eh; Thu, 29 Oct 2020 20:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14661.36238; Thu, 29 Oct 2020 20:04:07 +0000
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
	id 1kYE9X-0005m0-BJ; Thu, 29 Oct 2020 20:04:07 +0000
Received: by outflank-mailman (input) for mailman id 14661;
 Thu, 29 Oct 2020 20:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rF0B=EE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kYE9V-0005lv-8r
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:04:05 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ee4472f-387b-41ca-9cea-6b3ead444336;
 Thu, 29 Oct 2020 20:04:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y12so4119077wrp.6
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 13:04:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f20sm1466314wmc.26.2020.10.29.13.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 13:04:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEAC41FF7E;
 Thu, 29 Oct 2020 20:03:59 +0000 (GMT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rF0B=EE=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
	id 1kYE9V-0005lv-8r
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:04:05 +0000
X-Inumbo-ID: 9ee4472f-387b-41ca-9cea-6b3ead444336
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ee4472f-387b-41ca-9cea-6b3ead444336;
	Thu, 29 Oct 2020 20:04:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y12so4119077wrp.6
        for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2020 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=GlgPpZHPFyGb6ykEqr5MjXdGXxy2SQgZWabctoNQvD4=;
        b=xgwV+hUK7lV4D03GrJJkVj6yoyPcU5evOBLuWo40ehpfriURrarYr/atO/JUQ5z2m3
         mpFJDnd51X93Vl8lQTU8DdR3hu+rPWlq2frXOdUyHo5htFzGMLT04yOD0DHX52+qaBgF
         j/WeQpXMevN1eBEnJcq8WGn22PkV2V6tdV+DZETDVOrSL1Qiefy7VmQXFTWz+/kam2Qr
         m9gnZ+F43iGuUg0Qo/cDBcqmh7voYNvsy3znx8TxgaTBncVlnYQRzMMw600qSnsQK88o
         g1zK8IXLLya3X5af4jvSbe+RDQl3R3QDOuSynvf/DyQmW2LcnLtO5ioSlKG/FHhLgVit
         PkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=GlgPpZHPFyGb6ykEqr5MjXdGXxy2SQgZWabctoNQvD4=;
        b=GXXF0r8NIrqAMpbd9UF1wT8i8Qnv1jywcr6fpk/EyOTEfRCC8s/xK4y7GBiIGbhJ/6
         1rmbaGkToSkSIhKi7JQX1ALMQL3vzJKp5Bam2Gv1hy3cu8uGZdLic1Afu6U3FCaCLMRK
         dny9pBNqU6tk+5geavCPbAYOQN2dcnyc0+atFSVgK1A7+kgaiA5Lh7WCUyf/v2aFMK+c
         NvvJh9Z7iCxyui3Dv++uUIO2Hu6kq1Kps0aV/R8DTGu/Bt86iMCT796kkKWV9CEYrBZ2
         z3+5lC3eW3dyczCpHLtYinolLYdhrWwvIoSq2Rpf4QyyN6aPch2+NsPwQ6gWvAXwQAKW
         rouA==
X-Gm-Message-State: AOAM530rlo/n6YMFeRS5Uj3uBlDG3MGS9L/LJYPC2dy7FGxBRoIG0W/C
	cNX0pTAMzN9QOa4NqhkHc67LWA==
X-Google-Smtp-Source: ABdhPJzHtM27tE6YMeBH5RezYAbYcbqowgQsX3y1aonmHNKDBDY1JKY295X5ITmNMm4XDg9aRH0sRQ==
X-Received: by 2002:adf:e744:: with SMTP id c4mr7774206wrn.222.1604001841949;
        Thu, 29 Oct 2020 13:04:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f20sm1466314wmc.26.2020.10.29.13.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:04:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BEAC41FF7E;
	Thu, 29 Oct 2020 20:03:59 +0000 (GMT)
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com>
 <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Paul Durrant <paul@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Julien
 Grall
 <julien.grall@arm.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Daniel De
 Graaf <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
In-reply-to: <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
Date: Thu, 29 Oct 2020 20:03:59 +0000
Message-ID: <871rhgn6j4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <
> masami.hiramatsu@linaro.org> wrote:
>
>> Hi Oleksandr,
>>
> Hi Masami
>
> [sorry for the possible format issue]
>
>
>>
>> I would like to try this on my arm64 board.
>>
> Glad to hear you are interested in this topic.
>
>
>>
>> According to your comments in the patch, I made this config file.
>> # cat debian.conf
>> name =3D "debian"
>> type =3D "pvh"
>> vcpus =3D 8
>> memory =3D 512
>> kernel =3D "/opt/agl/vmlinuz-5.9.0-1-arm64"
>> ramdisk =3D "/opt/agl/initrd.img-5.9.0-1-arm64"
>> cmdline=3D "console=3Dhvc0 earlyprintk=3Dxen root=3D/dev/xvda1 rw"
>> disk =3D [ '/opt/agl/debian.qcow2,qcow2,hda' ]
>> vif =3D [ 'mac=3D00:16:3E:74:3d:76,bridge=3Dxenbr0' ]
>> virtio =3D 1
>> vdisk =3D [ 'backend=3DDom0, disks=3Dro:/dev/sda1' ]
>>
>> And tried to boot a DomU, but I got below error.
>>
>> # xl create -c debian.conf
>> Parsing config from debian.conf
>> libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
>> 1:unable to add virtio_disk devices
>> libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
>> 1:xc_domain_pause failed
>> libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain
>> type for domid=3D1
>> libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
>> 1:Unable to destroy guest
>> libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>> 1:Destruction of domain failed
>>
>>
>> Could you tell me how can I test it?
>>
>
> I assume it is due to the lack of the virtio-disk backend (which I haven't
> shared yet as I focused on the IOREQ/DM support on Arm in the first place=
).
> Could you wait a little bit, I am going to share it soon.

I assume this is wiring up the required bits of support to handle the
IOREQ requests in QEMU? We are putting together a PoC demo to show
a virtio enabled image (AGL) running on both KVM and Xen hypervisors so
we are keen to see your code as soon as you can share it.

I'm currently preparing a patch series for QEMU which fixes the recent
breakage caused by changes to the build system. As part of that I've
separated CONFIG_XEN and CONFIG_XEN_HVM so it's possible to build
i386-softmmu with unneeded for ARM bits. Hopefully this will allow me to
create a qemu-aarch64-system binary with just the PV related models in
it.

Talking to Stefano it probably makes sense going forward to introduce a
new IOREQ aware machine type for QEMU that doesn't bring in the rest of
the x86 overhead. I was thinking maybe xenvirt?

You've tested with virtio-block but we'd also like to extend this to
other arbitrary virtio devices. I guess we will need some sort of
mechanism to inform the QEMU command line where each device sits in the
virtio-mmio bus so the FDT Xen delivers to the guest matches up with
what QEMU is ready to serve requests for?

--=20
Alex Benn=C3=A9e

