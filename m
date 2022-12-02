Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62246410C3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 23:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452302.710129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Edp-0001cD-Ix; Fri, 02 Dec 2022 22:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452302.710129; Fri, 02 Dec 2022 22:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Edp-0001Z2-F5; Fri, 02 Dec 2022 22:36:21 +0000
Received: by outflank-mailman (input) for mailman id 452302;
 Fri, 02 Dec 2022 22:36:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myKJ=4A=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p1Edo-0001Yw-Jz
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 22:36:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd36501f-7291-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 23:36:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 391C7B822E6;
 Fri,  2 Dec 2022 22:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB24C433D6;
 Fri,  2 Dec 2022 22:36:15 +0000 (UTC)
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
X-Inumbo-ID: bd36501f-7291-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670020577;
	bh=rLAQ/BjJBRgsdL1GIzGnLqJTVHQ6RbDZm8KJS7NvvNs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bcoi54MxZCEKk4JJqW5lO4sRMCnjJFYEj/TlP1nb/iJOiwPy6iO2ddrQwiOHutgxW
	 OUO494syNCE0WwJeftOPWtdave85sYbuZ7Km9NotaHODZ7IgZPAr1vrWPG/WdxhkFA
	 NwsTnEVUX+71meaxEFd9Q1tRJM1gizeOfJZHvL6vw3qIEvt7fi74Bcef/kdqKk6WG7
	 YgNp7qqUwaX4k3auJOxLKnzn6MVUo8llU5SEl+cw2wrsc0BeM7/cuIQWrr+Agc9R1J
	 2RdSgk/5xdft/An4x/gH30yQYOJPRfIYxOtgnCaiEKd8gfXdGx3HDSLoJORG+uV0Hi
	 Wok8Jn7JCUINQ==
Date: Fri, 2 Dec 2022 14:36:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-dev@xilinx.com, 
    stefano.stabellini@amd.com, xen-devel@lists.xenproject.org, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
    "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
In-Reply-To: <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
References: <20221202030003.11441-1-vikram.garhwal@amd.com> <20221202030003.11441-11-vikram.garhwal@amd.com> <871qphc0p3.fsf@linaro.org> <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-971077313-1670020442=:4039"
Content-ID: <alpine.DEB.2.22.394.2212021434070.4039@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-971077313-1670020442=:4039
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2212021434071.4039@ubuntu-linux-20-04-desktop>

On Fri, 2 Dec 2022, Vikram Garhwal wrote:
> On 12/2/22 6:52 AM, Alex Bennée wrote:
> > Vikram Garhwal <vikram.garhwal@amd.com> writes:
> > 
> > > Add a new machine xenpv which creates a IOREQ server to register/connect
> > > with
> > > Xen Hypervisor.
> > > 
> > > Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device,
> > > adds a
> > > TPM emulator and connects to swtpm running on host machine via chardev
> > > socket
> > > and support TPM functionalities for a guest domain.
> > > 
> > > Extra command line for aarch64 xenpv QEMU to connect to swtpm:
> > >      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
> > >      -tpmdev emulator,id=tpm0,chardev=chrtpm \
> > > 
> > > swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms
> > > and
> > > provides access to TPM functionality over socket, chardev and CUSE
> > > interface.
> > > Github repo: https://github.com/stefanberger/swtpm
> > > Example for starting swtpm on host machine:
> > >      mkdir /tmp/vtpm2
> > >      swtpm socket --tpmstate dir=/tmp/vtpm2 \
> > >      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> > <snip>
> > > +
> > > +static void xen_enable_tpm(void)
> > > +{
> > > +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> > > +#ifdef CONFIG_TPM
> > > +    Error *errp = NULL;
> > > +    DeviceState *dev;
> > > +    SysBusDevice *busdev;
> > > +
> > > +    TPMBackend *be = qemu_find_tpm_be("tpm0");
> > > +    if (be == NULL) {
> > > +        DPRINTF("Couldn't fine the backend for tpm0\n");
> > > +        return;
> > > +    }
> > > +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> > > +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> > > +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> > > +    busdev = SYS_BUS_DEVICE(dev);
> > > +    sysbus_realize_and_unref(busdev, &error_fatal);
> > > +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> > Still fails on my aarch64 Debian machine:
> > 
> >    FAILED: libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o
> >    cc -Ilibqemu-aarch64-softmmu.fa.p -I. -I../.. -Itarget/arm
> > -I../../target/arm -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1
> > -I/usr/local/include -I/usr/include/capstone -I/usr/include/spice-server
> > -I/usr/include/spice-1 -I/usr/include/glib-2.0
> > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -Wall
> > -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
> > /home/alex/lsrc/qemu.git/linux-headers -isystem linux-headers -iquote .
> > -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/include
> > -iquote /home/alex/lsrc/qemu.git/tcg/aarch64 -pthread -U_FORTIFY_SOURCE
> > -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> > -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
> > -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
> > -Wold-style-declaration -Wold-style-definition -Wtype-limits
> > -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body
> > -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> > -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value
> > -Wno-psabi -fstack-protector-strong -fPIE -isystem../../linux-headers
> > -isystemlinux-headers -DNEED_CPU_H
> > '-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
> > '-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
> > libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o -MF
> > libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o.d -o
> > libqemu-aarch64-softmmu.fa.p/hw_arm_xen_arm.c.o -c ../../hw/arm/xen_arm.c
> >    ../../hw/arm/xen_arm.c: In function ‘xen_enable_tpm’:
> >    ../../hw/arm/xen_arm.c:126:32: error: ‘GUEST_TPM_BASE’ undeclared (first
> > use in this function); did you mean ‘GUEST_RAM_BASE’?
> >      126 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> >          |                                ^~~~~~~~~~~~~~
> >          |                                GUEST_RAM_BASE
> >    ../../hw/arm/xen_arm.c:126:32: note: each undeclared identifier is
> > reported only once for each function it appears in
> >    [2082/3246] Compiling C object
> > libqemu-aarch64-softmmu.fa.p/hw_xen_xen-mapcache.c.o
> >    [2083/3246] Compiling C object
> > libqemu-aarch64-softmmu.fa.p/hw_xen_xen-hvm-common.c.o
> >    ninja: build stopped: subcommand failed.
> >    make: *** [Makefile:165: run-ninja] Error 1
> > 
> Do you know what Xen version your build env has?

I think Alex is just building against upstream Xen. GUEST_TPM_BASE is
not defined there yet. I think we would need to introduce in
xen_common.h something like:

#ifndef GUEST_TPM_BASE
#define GUEST_TPM_BASE 0x0c000000
#endif

We already have similar code in xen_common.h for other things.  Also, it
would be best to get GUEST_TPM_BASE defined upstream in Xen first.


> Another way to fix this(as Julien suggested) is by setting this GUEST_TPM_BASE
> value via a property or something and user can set it via command line.
> 
> @sstabellini@kernel.org, do you think of any other fix?

Setting the TPM address from the command line is nice and preferable to
hardcoding the value in xen_common.h. It comes with the challenge that
it is not very scalable (imagine we have a dozen emulated devices) but
for now it is fine and a good way to start if you can arrange it.
--8323329-971077313-1670020442=:4039--

