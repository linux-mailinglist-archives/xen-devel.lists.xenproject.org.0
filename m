Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0E7FA564
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:56:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642312.1001696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dya-0002OA-RO; Mon, 27 Nov 2023 15:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642312.1001696; Mon, 27 Nov 2023 15:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dya-0002Ke-OS; Mon, 27 Nov 2023 15:56:48 +0000
Received: by outflank-mailman (input) for mailman id 642312;
 Mon, 27 Nov 2023 15:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nJkC=HI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r7dyZ-0002I6-1x
 for xen-devel@lists.xen.org; Mon, 27 Nov 2023 15:56:47 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f5844e2-8d3d-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 16:56:43 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54a95657df3so6244810a12.0
 for <xen-devel@lists.xen.org>; Mon, 27 Nov 2023 07:56:43 -0800 (PST)
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
X-Inumbo-ID: 8f5844e2-8d3d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701100603; x=1701705403; darn=lists.xen.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWXTIlNiMhIsFwR1xKm+ftyqoETNQT3rbNWu6UGGBPA=;
        b=i++KpoHFhDe+NOne9wKnkPL/jMWZ0+/XirGa4TYAUFTSxV1dG+rFSrIz7I5NnnTqoP
         VjUpHvN05fsoQUe2XPzYUhT9nbP8uU4M7VDzePrgIBit0N1GPu/4pmmwGun2Ygm61snH
         wtTTHlctMqqVkCTdwTXCOcDwKW5wu89SLG3QvxPGSgQz9XV9XbL1EELZKnACJNIpJ9UL
         cy2jwO2eS50sZ4l1Ex+Rsb0q6MyfUK4Ka+ER8bOTlHyQcw54K38n5yKX2dWtdGT7cZyk
         CLx65wvSUBdxh6+d+Brq89d84BHhy0Hav3DnJvmZpUGBd031U9x2V2M1a0zVXPEnfpqM
         EDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701100603; x=1701705403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWXTIlNiMhIsFwR1xKm+ftyqoETNQT3rbNWu6UGGBPA=;
        b=QYxH/5w9DodnTImimLWttKjUAXS/ttyz6E0ss2NUzbDJqB4mIQsYThm7691QSPh9Xn
         vETj/mRnBoeY4n/H1vojNRgVlyXyCY2B776HYXo9xr2QXEGrLwQnVuTmgzfqBoJCM+Qb
         dA5U47M6mFVU/60Ch6ZB9nirQj6LfDF3n3qevFpNY7YUtrQ2jNJUPxXUMEsEZUUE28Vr
         d7ZKRJgVKTaXoxKwq/cbxpdmdif2DNyiaOrVtJI8HlMV2fqV0GdKuqB/Ipr0ok34a4wC
         tJQ+CNUumrSbZQy6XhCyEjIuOHG5PT/CbKziXN4zNsu20+uItqBfP1Eqx+v7iaN70Mz0
         3Dmw==
X-Gm-Message-State: AOJu0YyB3qaB/3ZKq8FSUoCfvirsvNrkHTvWigNNm5Ac4dc40L5J7x1z
	j4F5J1ii4SjE1dlh2AI0yhkWwde0KC4j8LnP4aY=
X-Google-Smtp-Source: AGHT+IH5yZ2DXuU+Uv4imX94yxQ1/S3F3n4+Z7PxB/7x8YPIX2Hqe2twCYqLl1+GjxPuCz9nZ9fdyDjswPdLP2CctIY=
X-Received: by 2002:a05:6402:2207:b0:54b:25e8:c00e with SMTP id
 cq7-20020a056402220700b0054b25e8c00emr5217025edb.0.1701100602741; Mon, 27 Nov
 2023 07:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20180216174835.GJ4302@mail-itl> <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl> <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com> <ZWNbWPkKsLI1q8+D@mail-itl>
 <CACHz=ZiWufUenyw_wg+QuK86+gU5RZNkuJNzX9-K1UM5P3m8+Q@mail.gmail.com> <ZWR8+Xjm2K8eZpab@mail-itl>
In-Reply-To: <ZWR8+Xjm2K8eZpab@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 27 Nov 2023 10:56:29 -0500
Message-ID: <CAKf6xpvBE7VnziXYBpbh4iPw+sJi9bjLcZupUgrt_Pw6qUtffg@mail.gmail.com>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 6:27=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Nov 27, 2023 at 11:20:36AM +0000, Frediano Ziglio wrote:
> > On Sun, Nov 26, 2023 at 2:51=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Mon, Feb 19, 2018 at 06:30:14PM +0100, Juergen Gross wrote:
> > > > On 16/02/18 20:02, Andrew Cooper wrote:
> > > > > On 16/02/18 18:51, Marek Marczykowski-G=C3=B3recki wrote:
> > > > >> On Fri, Feb 16, 2018 at 05:52:50PM +0000, Andrew Cooper wrote:
> > > > >>> On 16/02/18 17:48, Marek Marczykowski-G=C3=B3recki wrote:
> > > > >>>> Hi,
> > > > >>>>
> > > > >>>> As in the subject, the guest crashes on boot, before kernel ou=
tput
> > > > >>>> anything. I've isolated this to the conditions below:
> > > > >>>>  - PV guest have PCI device assigned (e1000e emulated by QEMU =
in this case),
> > > > >>>>    without PCI device it works
> > > > >>>>  - Xen (in KVM) is started through OVMF; with seabios it works
> > > > >>>>  - nested HVM is disabled in KVM
> > > > >>>>  - AMD IOMMU emulation is disabled in KVM; when enabled qemu c=
rashes on
> > > > >>>>    boot (looks like qemu bug, unrelated to this one)
> > > > >>>>
> > > > >>>> Version info:
> > > > >>>>  - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git149206056=
0.b6d11d7c46-4.1, AMD
> > > > >>>>  - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
> > > > >>>>  - Xen domU: Linux 4.14.13, direct boot
> > > > >>>>
> > > > >>>> Not sure if relevant, but initially I've tried booting xen.efi=
 /mapbs
> > > > >>>> /noexitboot and then dom0 kernel crashed saying something abou=
t conflict
> > > > >>>> between e820 and kernel mapping. But now those options are dis=
abled.
> > > > >>>>
> > > > >>>> The crash message:
> > > > >>>> (XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
> > > > >>>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d0=
80218720 entry.o#create_bounce_frame+0x137/0x146
> > > > >>>> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> > > > >>>> (XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
> > > > >>>> (XEN) CPU:    1
> > > > >>>> (XEN) RIP:    e033:[<ffffffff826d9156>]
> > > > >>> This is #UD, which is most probably hitting a BUG().  addr2line=
 this ^
> > > > >>> to find some code to look at.
> > > > >> addr2line failed me
> > > > >
> > > > > By default, vmlinux is stripped and compressed.  Ideally you want=
 to
> > > > > addr2line the vmlinux artefact in the root of your kernel build, =
which
> > > > > is the plain elf with debugging symbols.
> > > > >
> > > > > Alternatively, use scripts/extract-vmlinux on the binary you actu=
ally
> > > > > booted, which might get you somewhere.
> > > > >
> > > > >> , but System.map says its xen_memory_setup. And it
> > > > >> looks like the BUG() is the same as I had in dom0 before:
> > > > >> "Xen hypervisor allocated kernel memory conflicts with E820 map"=
.
> > > > >
> > > > > Juergen: Is there anything we can do to try and insert some dummy
> > > > > exception handlers right at PV start, so we could at least print =
out a
> > > > > oneliner to the host console which is a little more helpful than =
Xen
> > > > > saying "something unknown went wrong" ?
> > > >
> > > > You mean something like commit 42b3a4cb5609de757f5445fcad18945ba923=
9a07
> > > > added to kernel 4.15?
> > > >
> > > > >
> > > > >>
> > > > >> Disabling e820_host in guest config solved the problem. Thanks!
> > > > >>
> > > > >> Is this some bug in Xen or OVMF, or is it expected behavior and =
e820_host
> > > > >> should be avoided?
> > > > >
> > > > > I don't really know.  e820_host is a gross hack which shouldn't r=
eally
> > > > > be present.  The actually problem is that Linux can't cope with t=
he
> > > > > memory layout it was given (and I can't recall if there is anythi=
ng
> > > > > Linux could potentially to do cope).  OTOH, the toolstack, which =
knew
> > > > > about e820_host and chose to lay the guest out in an overlapping =
way is
> > > > > probably also at fault.
> > > >
> > > > The kernel can cope with lots of E820 scenarios (e.g. by relocating
> > > > initrd or the p2m map), but moving itself out of the way is not
> > > > possible.
> > >
> > > I'm afraid I need to resurrect this thread...
> > >
> > > With recent kernel (6.6+), the host_e820=3D0 workaround is not an opt=
ion
> > > anymore. It makes Linux not initialize xen-swiotlb (due to
> > > f9a38ea5172a3365f4594335ed5d63e15af2fd18), so PCI passthrough doesn't
> > > work at all. While I can add yet another layer of workaround (force
> > > xen-swiotlb with iommu=3Dsoft), that's getting unwieldy.
> > >
> > > Furthermore, I don't get the crash message anymore, even with debug
> > > hypervisor and guest_loglvl=3Dall. Not even "Domain X crashed" in `xl
> > > dmesg`. It looks like the "crash" shutdown reason doesn't reach Xen, =
and
> > > it's considered clean shutdown (I can confirm it by changing various
> > > `on_*` settings (via libvirt) and observing which gets applied).
> > >
> > > Most tests I've done with 6.7-rc1, but the issue I observed on 6.6.1
> > > already.
> > >
> > > This is on Xen 4.17.2. And the L0 is running Linux 6.6.1, and then us=
es
> > > QEMU 8.1.2 + OVMF 202308 to run Xen as L1.
> > >
> >
> > So basically you start the domain and it looks like it's shutting down
> > cleanly from logs.
> > Can you see anything from the guest? Can you turn on some more
> > debugging at guest level?
>
> No, it crashes before printing anything to the console, also with
> earlyprintk=3Dxen.
>
> > I tried to get some more information from the initial crash but I
> > could not understand which guest code triggered the bug.
>
> I'm not sure which one is it this time (because I don't have Xen
> reporting guest crash...) but last time it was here:
> https://github.com/torvalds/linux/blob/master/arch/x86/xen/setup.c#L873-L=
874

Hi Marek,

I too have run into this "Xen hypervisor allocated kernel memory
conflicts with E820 map" error when running Xen under KVM & OVMF with
SecureBoot.  OVMF built without SecureBoot did not trip over the
issue.  It was a little while back - I have some notes though.

Non-SecureBoot
(XEN)  [0000000000810000, 00000000008fffff] (ACPI NVS)
(XEN)  [0000000000900000, 000000007f8eefff] (usable)

SecureBoot
(XEN)  [0000000000810000, 000000000170ffff] (ACPI NVS)
(XEN)  [0000000001710000, 000000007f0edfff] (usable)

Linux (under Xen) is checking that _pa(_text) (=3D 0x1000000) is RAM,
but it is not.  Looking at the E820 map, there is type 4, NVS, region
defined:
[0000000000810000, 000000000170ffff] (ACPI NVS)

When OVMF is built with SMM (for SecureBoot) and S3Supported is true,
the memory range 0x900000-0x170ffff is additionally marked ACPI NVS
and Linux trips over this.  It becomes usable RAM under Non-SecureBoot
so Linux boots fine.

What I don't understand is why there is even a check that _pa(_text)
is RAM.  Xen logs that it places dom0 way up high in memory, so the
physical address of the kernel pages are much higher than 0x1000000.
The value 0x1000000 for _pa(_text) doesn't match reality.  Maybe there
are some expectations for the ACPI NVS and other reserved regions to
be 1-1 mapped?  I tried removing the BUG mentioned above, but it still
failed to boot.  I think I also removed a second BUG, but
unfortunately I don't have notes on either.

The other thing I noticed is _pa() uses phys_base to shift its output,
but phys_base is not updated under Xen.  If _pa() is supposed to
reference the high memory addresses Xen assigned, then maybe that
should be updated?

Booting under SecureBoot was tangential to my goal at the time, so I
didn't pursue it further.

Regards,
Jason

