Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995675135C7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 15:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316554.535480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4ZZ-00052s-OP; Thu, 28 Apr 2022 13:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316554.535480; Thu, 28 Apr 2022 13:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4ZZ-000512-Kl; Thu, 28 Apr 2022 13:52:45 +0000
Received: by outflank-mailman (input) for mailman id 316554;
 Thu, 28 Apr 2022 13:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50wr=VG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nk4ZY-00050w-Bs
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 13:52:44 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7926d5a9-c6fa-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 15:52:42 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id ke5so3234598qvb.5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 06:52:42 -0700 (PDT)
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
X-Inumbo-ID: 7926d5a9-c6fa-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oybHSEJN5rbrfr7rn1pvKcaIkYCpRZydZZR0fWUyxhs=;
        b=ptWg7xcaAv5C7IhJXz0y/Cl7gb/Cxczy6X8u+Sf2RKQ/F5eDMSEOJjsF9F90+om/7H
         CLSUVxCHUU7KUaf5H6uJsTIzTADgRt3iict5qyLE5zTToj0BE0GOMkGKE+8FlYURU9FC
         5x5e9OgeDjrY0Tumi7KPk4pyTF5Ucm0utdzVBfxVj3tucgDd8QPHfX79fT8xQ9+ql3XQ
         EqEimdjjhFOuZ85Y46z36y8qjqTt2qM0PLmm9WwQHOZ4VUKCAxzBzABvPFDeD3K+o/m+
         lTeoJyI2Lg+fATFZTVj1id85dt46E4v8q0jNNo4Uy+BotLHcxSYcVrbjkefTfkzh2aub
         AaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oybHSEJN5rbrfr7rn1pvKcaIkYCpRZydZZR0fWUyxhs=;
        b=iG0oIEQw5AG1M7trVV9NefdNa/oUrsMROItKwtucYM1jy1goHKH8rl9+PsbQPWuNOK
         y0wZYTWaIkXrn8GZaBlLnKdF/klVlGUOOrTzjZssNucbEFW7H8FFU5zVv1SXwnf1zhok
         iCCQC9yCYKFS2uRJgsvf/OLjpMOe0sbBBVmQ0QdlrMWn0fhI7KNcbPQc3ysS6jlGUOw1
         O3X8GUMNVYidIpwHTpSP6RSPNxMqadVyClLd41CC4IaPCzjetat7U8s2ZklkcIVudfXA
         gKn+ABP6/tJ5mOLg2Zrihss5VnfXhxyxRmcMM3+cJVIprwGt+AQvivJ/1Ej7MWLoEYUO
         z4Qg==
X-Gm-Message-State: AOAM530NsiijxLTxrxRJF1dOTXqpJ18P1l+K+MoBMsvHdsDCSKasGEqs
	GIhdf0m3m1Sw4TPx8aGFViduwvkbdAWWF8zX/mE=
X-Google-Smtp-Source: ABdhPJznUe1W4EMGIQrUCGWEGOQoJTO66BiefiHz3+nmNxkR80aqcxKhGkV1ihEBF7H2wXEs+jO3zKwBSd0GdswfvEI=
X-Received: by 2002:a05:6214:19cc:b0:458:bd2:19a8 with SMTP id
 j12-20020a05621419cc00b004580bd219a8mr953456qvc.98.1651153961361; Thu, 28 Apr
 2022 06:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
In-Reply-To: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 28 Apr 2022 16:52:29 +0300
Message-ID: <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
Subject: Re: Virtio on Xen with Rust
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000005622e205ddb73d9e"

--0000000000005622e205ddb73d9e
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 12:15 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> Hello,
>

Hello Viresh

[Cc Juergen and Julien]

[sorry for the possible format issues and for the late response]



>
> We verified our hypervisor-agnostic Rust based vhost-user backends with
> Qemu
> based setup earlier, and there was growing concern if they were truly
> hypervisor-agnostic.
>
> In order to prove that, we decided to give it a try with Xen, a type-1
> bare-metal hypervisor.
>
> We are happy to announce that we were able to make progress on that front
> and
> have a working setup where we can test our existing Rust based backends,
> like
> I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
>

Great work!



>
> Key components:
> --------------
>
> - Xen: https://github.com/vireshk/xen
>
>   Xen requires MMIO and device specific support in order to populate the
>   required devices at the guest. This tree contains four patches on the
> top of
>   mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).
>

I skimmed through your toolstack patches, awesome, you created a completely
new virtual device "I2C".
FYI, I have updated "Virtio support for toolstack on Arm" [1] since (to
make it more generic), now V7 is available and I have a plan to push V8
soon.



>
> - libxen-sys: https://github.com/vireshk/libxen-sys
>
>   We currently depend on the userspace tools/libraries provided by Xen,
> like
>   xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates provides
> Rust
>   wrappers over those calls, generated automatically with help of bindgen
>   utility in Rust, that allow us to use the installed Xen libraries.
> Though we
>   plan to replace this with Rust based "oxerun" (find below) in longer run.


> - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen-ioctls
>
>   This is Rust based implementations for Ioctl and hypercalls to Xen. This
> is WIP
>   and should eventually replace "libxen-sys" crate entirely (which are C
> based
>   implementation of the same).
>


FYI, currently we are working on one feature to restrict memory access
using Xen grant mappings based on xen-grant DMA-mapping layer for Linux [1].
And there is a working PoC on Arm based on an updated virtio-disk. As for
libraries, there is a new dependency on "xengnttab" library. In comparison
with Xen foreign mappings model (xenforeignmemory),
the Xen grant mappings model is a good fit into the Xen security model,
this is a safe mechanism to share pages between guests.



>
> - vhost-device: https://github.com/vireshk/vhost-device
>
>   These are Rust based vhost-user backends, maintained inside the rust-vmm
>   project. This already contain support for I2C and RNG, while GPIO is
> under
>   review. These are not required to be modified based on hypervisor and are
>   truly hypervisor-agnostic.
>
>   Ideally the backends are hypervisor agnostic, as explained earlier, but
>   because of the way Xen maps the guest memory currently, we need a minor
> update
>   for the backends to work. Xen maps the memory via a kernel file
>   /dev/xen/privcmd, which needs calls to mmap() followed by an ioctl() to
> make
>   it work. For this a hack has been added to one of the rust-vmm crates,
>   vm-virtio, which is used by vhost-user.
>
>
> https://github.com/vireshk/vm-memory/commit/54b56c4dd7293428edbd7731c4dbe5739a288abd
>
>   The update to vm-memory is responsible to do ioctl() after the already
> present
>   mmap().
>

With Xen grant mappings, if I am not mistaken, it is going to be almost the
same: mmap() then ioctl(). But the file will be "/dev/xen/gntdev".



>
> - vhost-user-master (WIP): https://github.com/vireshk/vhost-user-master
>
>   This implements the master side interface of the vhost protocol, and is
> like
>   the vhost-user-backend (https://github.com/rust-vmm/vhost-user-backend)
> crate
>   maintained inside the rust-vmm project, which provides similar
> infrastructure
>   for the backends to use. This shall be hypervisor independent and
> provide APIs
>   for the hypervisor specific implementations. This will eventually be
>   maintained inside the rust-vmm project and used by all Rust based
> hypervisors.
>
> - xen-vhost-master (WIP): https://github.com/vireshk/xen-vhost-master
>
>   This is the Xen specific implementation and uses the APIs provided by
>   "vhost-user-master", "oxerun" and "libxen-sys" crates for its
> functioning.
>
>   This is designed based on the EPAM's "virtio-disk" repository
>   (https://github.com/xen-troops/virtio-disk/) and is pretty much similar
> to it.
>

FYI, new branch "virtio_grant" besides supporting Xen grant mappings also
supports virtio-mmio modern transport.



>
>   One can see the analogy as:
>
>   Virtio-disk == "Xen-vhost-master" + "vhost-user-master" + "oxerun" +
> "libxen-sys" + "vhost-device".
>
>
>
> Test setup:
> ----------
>
> 1. Build Xen:
>
>   $ ./configure --libdir=/usr/lib --build=x86_64-unknown-linux-gnu
> --host=aarch64-linux-gnu --disable-docs --disable-golang
> --disable-ocamltools
> --with-system-qemu=/root/qemu/build/i386-softmmu/qemu-system-i386;
>   $ make -j9 debball CROSS_COMPILE=aarch64-linux-gnu- XEN_TARGET_ARCH=arm64
>
> 2. Run Xen via Qemu on X86 machine:
>
>   $ qemu-system-aarch64 -machine virt,virtualization=on -cpu cortex-a57
> -serial mon:stdio \
>         -device virtio-net-pci,netdev=net0 -netdev
> user,id=net0,hostfwd=tcp::8022-:22 \
>         -device virtio-scsi-pci -drive
> file=/home/vireshk/virtio/debian-bullseye-arm64.qcow2,index=0,id=hd0,if=none,format=qcow2
> -device scsi-hd,drive=hd0 \
>         -display none -m 8192 -smp 8 -kernel /home/vireshk/virtio/xen/xen \
>         -append "dom0_mem=5G,max:5G dom0_max_vcpus=7 loglvl=all
> guest_loglvl=all" \
>         -device
> guest-loader,addr=0x46000000,kernel=/home/vireshk/kernel/barm64/arch/arm64/boot/Image,bootargs="root=/dev/sda2
> console=hvc0 earlyprintk=xen" \
>         -device ds1338,address=0x20     # This is required to create a
> virtual I2C based RTC device on Dom0.
>
>   This should get Dom0 up and running.
>
> 3. Build rust crates:
>
>   $ cd /root/
>   $ git clone https://github.com/vireshk/xen-vhost-master
>   $ cd xen-vhost-master
>   $ cargo build
>
>   $ cd ../
>   $ git clone https://github.com/vireshk/vhost-device
>   $ cd vhost-device
>   $ cargo build
>
> 4. Setup I2C based RTC device
>
>   $ echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device; echo 0-0020
> > /sys/bus/i2c/devices/0-0020/driver/unbind
>
> 5. Lets run everything now
>
>   # Start the I2C backend in one terminal (open new terminal with "ssh
>   # root@localhost -p8022"). This tells the I2C backend to hook up to
>   # "/root/vi2c.sock0" socket and wait for the master to start transacting.
>   $ /root/vhost-device/target/debug/vhost-device-i2c -s /root/vi2c.sock -c
> 1 -l 0:32
>
>   # Start the xen-vhost-master in another terminal. This provides the path
> of
>   # the socket to the master side and the device to look from Xen, which
> is I2C
>   # here.
>   $ /root/xen-vhost-master/target/debug/xen-vhost-master --socket-path
> /root/vi2c.sock0 --name i2c
>
>   # Start guest in another terminal, i2c_domu.conf is attached. The guest
> kernel
>   # should have Virtio related config options enabled, along with
> i2c-virtio
>   # driver.
>   $ xl create -c  i2c_domu.conf
>
>   # The guest should boot fine now. Once the guest is up, you can create
> the I2C
>   # RTC device and use it. Following will create /dev/rtc0 in the guest,
> which
>   # you can configure with 'hwclock' utility.
>
>   $ echo ds1338 0x20 > /sys/bus/i2c/devices/i2c-0/new_device
>

Thanks for the detailed instruction.



>
>
> Hope this helps.
>
> --
> viresh
>

[1]
https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
[2]
https://lore.kernel.org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko

--0000000000005622e205ddb73d9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 12:15 PM Vire=
sh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello,<br></blockquote><div><br></div><div>Hello=C2=A0Viresh</div><div>=
<br></div><div>[Cc Juergen and Julien]</div><div><br></div><div>[sorry for =
the possible format issues and for the late response]</div><div><br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We verified our hypervisor-agnostic Rust based vhost-user backends with Qem=
u<br>
based setup earlier, and there was growing concern if they were truly<br>
hypervisor-agnostic.<br>
<br>
In order to prove that, we decided to give it a try with Xen, a type-1<br>
bare-metal hypervisor.<br>
<br>
We are happy to announce that we were able to make progress on that front a=
nd<br>
have a working setup where we can test our existing Rust based backends, li=
ke<br>
I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.<br></blockqu=
ote><div><br></div><div>Great work!</div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Key components:<br>
--------------<br>
<br>
- Xen: <a href=3D"https://github.com/vireshk/xen" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/vireshk/xen</a><br>
<br>
=C2=A0 Xen requires MMIO and device specific support in order to populate t=
he<br>
=C2=A0 required devices at the guest. This tree contains four patches on th=
e top of<br>
=C2=A0 mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).<=
br></blockquote><div><br></div><div>I skimmed through your toolstack patche=
s, awesome, you created a completely new virtual device=C2=A0&quot;I2C&quot=
;.=C2=A0</div><div>FYI, I have updated &quot;Virtio support for toolstack o=
n Arm&quot; [1] since (to make it more generic), now V7 is available and I =
have a plan to push V8 soon.</div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
- libxen-sys: <a href=3D"https://github.com/vireshk/libxen-sys" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/vireshk/libxen-sys</a><br>
<br>
=C2=A0 We currently depend on the userspace tools/libraries provided by Xen=
, like<br>
=C2=A0 xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates provid=
es Rust<br>
=C2=A0 wrappers over those calls, generated automatically with help of bind=
gen<br>
=C2=A0 utility in Rust, that allow us to use the installed Xen libraries. T=
hough we<br>
=C2=A0 plan to replace this with Rust based &quot;oxerun&quot; (find below)=
 in longer run.</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
- oxerun (WIP): <a href=3D"https://gitlab.com/mathieupoirier/oxerun/-/tree/=
xen-ioctls" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/mathieu=
poirier/oxerun/-/tree/xen-ioctls</a><br>
<br>
=C2=A0 This is Rust based implementations for Ioctl and hypercalls to Xen. =
This is WIP<br>
=C2=A0 and should eventually replace &quot;libxen-sys&quot; crate entirely =
(which are C based<br>
=C2=A0 implementation of the same).<br></blockquote><div>=C2=A0</div><div><=
br></div><div>FYI, currently we are working on one feature to=C2=A0restrict=
 memory access using Xen grant mappings based on=C2=A0xen-grant DMA-mapping=
 layer for Linux [1].</div><div>And there is a working PoC on Arm based on =
an updated virtio-disk. As for libraries, there is a new dependency=C2=A0on=
 &quot;xengnttab&quot;=C2=A0library. In comparison with Xen foreign mapping=
s model (xenforeignmemory),</div><div>the=C2=A0Xen grant mappings model is =
a good fit into the Xen security model, this is a safe mechanism to share p=
ages between guests.</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
- vhost-device: <a href=3D"https://github.com/vireshk/vhost-device" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/vireshk/vhost-device</a><b=
r>
<br>
=C2=A0 These are Rust based vhost-user backends, maintained inside the rust=
-vmm<br>
=C2=A0 project. This already contain support for I2C and RNG, while GPIO is=
 under<br>
=C2=A0 review. These are not required to be modified based on hypervisor an=
d are<br>
=C2=A0 truly hypervisor-agnostic.<br>
<br>
=C2=A0 Ideally the backends are hypervisor agnostic, as explained earlier, =
but<br>
=C2=A0 because of the way Xen maps the guest memory currently, we need a mi=
nor update<br>
=C2=A0 for the backends to work. Xen maps the memory via a kernel file<br>
=C2=A0 /dev/xen/privcmd, which needs calls to mmap() followed by an ioctl()=
 to make<br>
=C2=A0 it work. For this a hack has been added to one of the rust-vmm crate=
s,<br>
=C2=A0 vm-virtio, which is used by vhost-user.<br>
<br>
=C2=A0 <a href=3D"https://github.com/vireshk/vm-memory/commit/54b56c4dd7293=
428edbd7731c4dbe5739a288abd" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/vireshk/vm-memory/commit/54b56c4dd7293428edbd7731c4dbe5739a288abd=
</a><br>
<br>
=C2=A0 The update to vm-memory is responsible to do ioctl() after the alrea=
dy present<br>
=C2=A0 mmap().<br></blockquote><div><br></div><div>With Xen grant mappings,=
 if I am not mistaken, it is going to be almost the same: mmap() then ioctl=
(). But the file will be=C2=A0&quot;/dev/xen/gntdev&quot;.</div><div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- vhost-user-master (WIP): <a href=3D"https://github.com/vireshk/vhost-user=
-master" rel=3D"noreferrer" target=3D"_blank">https://github.com/vireshk/vh=
ost-user-master</a><br>
<br>
=C2=A0 This implements the master side interface of the vhost protocol, and=
 is like<br>
=C2=A0 the vhost-user-backend (<a href=3D"https://github.com/rust-vmm/vhost=
-user-backend" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust=
-vmm/vhost-user-backend</a>) crate<br>
=C2=A0 maintained inside the rust-vmm project, which provides similar infra=
structure<br>
=C2=A0 for the backends to use. This shall be hypervisor independent and pr=
ovide APIs<br>
=C2=A0 for the hypervisor specific implementations. This will eventually be=
<br>
=C2=A0 maintained inside the rust-vmm project and used by all Rust based hy=
pervisors.<br>
<br>
- xen-vhost-master (WIP): <a href=3D"https://github.com/vireshk/xen-vhost-m=
aster" rel=3D"noreferrer" target=3D"_blank">https://github.com/vireshk/xen-=
vhost-master</a><br>
<br>
=C2=A0 This is the Xen specific implementation and uses the APIs provided b=
y<br>
=C2=A0 &quot;vhost-user-master&quot;, &quot;oxerun&quot; and &quot;libxen-s=
ys&quot; crates for its functioning.<br>
<br>
=C2=A0 This is designed based on the EPAM&#39;s &quot;virtio-disk&quot; rep=
ository<br>
=C2=A0 (<a href=3D"https://github.com/xen-troops/virtio-disk/" rel=3D"noref=
errer" target=3D"_blank">https://github.com/xen-troops/virtio-disk/</a>) an=
d is pretty much similar to it.<br></blockquote><div><br></div><div>FYI, ne=
w branch &quot;virtio_grant&quot; besides supporting Xen grant mappings als=
o supports virtio-mmio modern transport.</div><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 One can see the analogy as:<br>
<br>
=C2=A0 Virtio-disk =3D=3D &quot;Xen-vhost-master&quot; + &quot;vhost-user-m=
aster&quot; + &quot;oxerun&quot; + &quot;libxen-sys&quot; + &quot;vhost-dev=
ice&quot;.<br>
<br>
<br>
<br>
Test setup:<br>
----------<br>
<br>
1. Build Xen:<br>
<br>
=C2=A0 $ ./configure --libdir=3D/usr/lib --build=3Dx86_64-unknown-linux-gnu=
 --host=3Daarch64-linux-gnu --disable-docs --disable-golang --disable-ocaml=
tools --with-system-qemu=3D/root/qemu/build/i386-softmmu/qemu-system-i386;<=
br>
=C2=A0 $ make -j9 debball CROSS_COMPILE=3Daarch64-linux-gnu- XEN_TARGET_ARC=
H=3Darm64<br>
<br>
2. Run Xen via Qemu on X86 machine:<br>
<br>
=C2=A0 $ qemu-system-aarch64 -machine virt,virtualization=3Don -cpu cortex-=
a57 -serial mon:stdio \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-net-pci,netdev=3Dnet0 -netdev us=
er,id=3Dnet0,hostfwd=3Dtcp::8022-:22 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device virtio-scsi-pci -drive file=3D/home/vir=
eshk/virtio/debian-bullseye-arm64.qcow2,index=3D0,id=3Dhd0,if=3Dnone,format=
=3Dqcow2 -device scsi-hd,drive=3Dhd0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display none -m 8192 -smp 8 -kernel /home/vire=
shk/virtio/xen/xen \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -append &quot;dom0_mem=3D5G,max:5G dom0_max_vcp=
us=3D7 loglvl=3Dall guest_loglvl=3Dall&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device guest-loader,addr=3D0x46000000,kernel=
=3D/home/vireshk/kernel/barm64/arch/arm64/boot/Image,bootargs=3D&quot;root=
=3D/dev/sda2 console=3Dhvc0 earlyprintk=3Dxen&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -device ds1338,address=3D0x20=C2=A0 =C2=A0 =C2=
=A0# This is required to create a virtual I2C based RTC device on Dom0.<br>
<br>
=C2=A0 This should get Dom0 up and running.<br>
<br>
3. Build rust crates:<br>
<br>
=C2=A0 $ cd /root/<br>
=C2=A0 $ git clone <a href=3D"https://github.com/vireshk/xen-vhost-master" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/vireshk/xen-vhost-m=
aster</a><br>
=C2=A0 $ cd xen-vhost-master<br>
=C2=A0 $ cargo build<br>
<br>
=C2=A0 $ cd ../<br>
=C2=A0 $ git clone <a href=3D"https://github.com/vireshk/vhost-device" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/vireshk/vhost-device</=
a><br>
=C2=A0 $ cd vhost-device<br>
=C2=A0 $ cargo build<br>
<br>
4. Setup I2C based RTC device<br>
<br>
=C2=A0 $ echo ds1338 0x20 &gt; /sys/bus/i2c/devices/i2c-0/new_device; echo =
0-0020 &gt; /sys/bus/i2c/devices/0-0020/driver/unbind<br>
<br>
5. Lets run everything now<br>
<br>
=C2=A0 # Start the I2C backend in one terminal (open new terminal with &quo=
t;ssh<br>
=C2=A0 # root@localhost -p8022&quot;). This tells the I2C backend to hook u=
p to<br>
=C2=A0 # &quot;/root/vi2c.sock0&quot; socket and wait for the master to sta=
rt transacting.<br>
=C2=A0 $ /root/vhost-device/target/debug/vhost-device-i2c -s /root/vi2c.soc=
k -c 1 -l 0:32<br>
<br>
=C2=A0 # Start the xen-vhost-master in another terminal. This provides the =
path of<br>
=C2=A0 # the socket to the master side and the device to look from Xen, whi=
ch is I2C<br>
=C2=A0 # here.<br>
=C2=A0 $ /root/xen-vhost-master/target/debug/xen-vhost-master --socket-path=
 /root/vi2c.sock0 --name i2c<br>
<br>
=C2=A0 # Start guest in another terminal, i2c_domu.conf is attached. The gu=
est kernel<br>
=C2=A0 # should have Virtio related config options enabled, along with i2c-=
virtio<br>
=C2=A0 # driver.<br>
=C2=A0 $ xl create -c=C2=A0 i2c_domu.conf<br>
<br>
=C2=A0 # The guest should boot fine now. Once the guest is up, you can crea=
te the I2C<br>
=C2=A0 # RTC device and use it. Following will create /dev/rtc0 in the gues=
t, which<br>
=C2=A0 # you can configure with &#39;hwclock&#39; utility.<br>
<br>
=C2=A0 $ echo ds1338 0x20 &gt; /sys/bus/i2c/devices/i2c-0/new_device<br></b=
lockquote><div><br></div><div>Thanks for the detailed instruction.=C2=A0</d=
iv><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
Hope this helps.<br>
<br>
-- <br>
viresh<br></blockquote><div><br></div><div>[1]=C2=A0=C2=A0<a href=3D"https:=
//lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmai=
l.com/">https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-=
olekstysh@gmail.com/</a></div><div>[2]=C2=A0<a href=3D"https://lore.kernel.=
org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gmail.com/">https=
://lore.kernel.org/xen-devel/1650646263-22047-1-git-send-email-olekstysh@gm=
ail.com/</a></div><div><br></div></div><div><br></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000005622e205ddb73d9e--

