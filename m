Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29942B655
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 08:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207872.363834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXOZ-0000Jk-CL; Wed, 13 Oct 2021 06:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207872.363834; Wed, 13 Oct 2021 06:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXOZ-0000GZ-8v; Wed, 13 Oct 2021 06:05:43 +0000
Received: by outflank-mailman (input) for mailman id 207872;
 Wed, 13 Oct 2021 05:56:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y9pJ=PB=greensocs.com=mark.burton@srs-us1.protection.inumbo.net>)
 id 1maXG6-0007CH-St
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 05:56:59 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 633c6259-a640-4e30-a52d-1bfa3dca2c2a;
 Wed, 13 Oct 2021 05:56:55 +0000 (UTC)
Received: from smtpclient.apple (unknown [54.37.16.242])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0BDBE21A8F;
 Wed, 13 Oct 2021 05:56:51 +0000 (UTC)
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
X-Inumbo-ID: 633c6259-a640-4e30-a52d-1bfa3dca2c2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1634104613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmENBHpmx11BFYuaIRMqtVJxSEZwgv5Rg+5FKo1F1EU=;
	b=n8qFCNPvW+tem6mfNDqDAmYlqDScNkjpLwuFa5/eMVeB897n3G/Iy6YDCjRDfpwRN+d8+N
	geHeGCltVaRzoIWe7y4h9fUXaxq7y7ZABps9lIectcz9ioLN7YvuhvnRpypSJHcMSU0Ycr
	c/GRrbwgYzaWkXZ+CyTPcRX2Q2M1tDI=
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <CAKmqyKMUvtRPCp=FJMHcMdsECfJ_fRHBi4dA2N3gtqmPHspNJA@mail.gmail.com>
Date: Wed, 13 Oct 2021 07:56:46 +0200
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D12EA69C-A1CC-4132-89F8-499D7F99F34C@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <CAKmqyKMUvtRPCp=FJMHcMdsECfJ_fRHBi4dA2N3gtqmPHspNJA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)

Fixed
Cheers
Mark.


> On 13 Oct 2021, at 00:16, Alistair Francis <alistair23@gmail.com> =
wrote:
>=20
> On Thu, Sep 23, 2021 at 2:22 AM Damien Hedde =
<damien.hedde@greensocs.com> wrote:
>>=20
>> Hi,
>>=20
>> The goal of this work is to bring dynamic machine creation to QEMU:
>> we want to setup a machine without compiling a specific machine C
>> code. It would ease supporting highly configurable platforms (for
>> example resulting from an automated design flow). The requirements
>> for such configuration include begin able to specify the number of
>> cores, available peripherals, emmory mapping, IRQ mapping, etc.
>>=20
>> This series focuses on the first step: populating a machine with
>> devices during its creation. We propose patches to support this
>> using QMP commands. This is a working set of patches and improves
>> over the earlier rfc (posted in May):
>> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
>>=20
>> Although it is working and could be merged, it is tag as an RFC:
>> we probably need to discuss the conditions for allowing a device to
>> be created at an early stage. Patches 6, 10 and 13, 15 and 16 depend
>> on such conditions and are subject to change. Other patches are
>> unrelated to this point.
>>=20
>> We address several issues in this series. They are detailed below.
>>=20
>> ## 1. Stoping QEMU to populate the machine with devices
>>=20
>> QEMU goes through several steps (called _machine phases_) when
>> creating the machine: 'no-machine', 'machine-created',
>> 'accel-created', 'initialized', and finally 'ready'. At 'ready'
>> phase, QEMU is ready to start (see Paolo's page
>> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence for
>> more details).
>>=20
>> Using the -preconfig CLI option, QEMU can be stopped today during
>> the 'accel-created' phase. Then the 'x-exit-preconfig' QMP command
>> triggers QEMU moving forwards to the completion of the machine
>> creation ('ready' phase).
>>=20
>> The devices are created during the 'initialized' phase.
>> In this phase the machine init() method has been executed and thus
>> machine properties have been handled. Although the sysbus exists and
>> the machine may have been populated by the init(),
>> _machine_init_done_ notifiers have not been called yet. At this point
>> we can add more devices to a machine.
>>=20
>> We propose to add 2 QMP commands:
>> + The 'query-machine-phase' command would return the current machine
>>  phase.
>> + The 'x-machine-init' command would advance the machine phase to
>>  'initialized'. 'x-exit-preconfig' could then still be used to
>>  advance to the last phase.
>>=20
>> ## 2. Adding devices
>>=20
>> Right now, the user can create devices in 2 ways: using '-device' CLI
>> option or 'device_add' QMP command. Both are executed after the
>> machine is ready: such devices are hot-plugged. We propose to allow
>> 'device_add' QMP command to be used during the 'initialized' phase.
>>=20
>> In this series, we keep the constraint that the device must be
>> 'user-creatable' (this is a device class flag). We do not see any
>> reason why a device the user can hot-plug could not be created at an
>> earlier stage.
>>=20
>> This part is still RFC because, as Peter mentioned it (in this thread
>> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01933.html),
>> we may want additional or distinct conditions for:
>> + device we can hot-plug
>> + device we can add in '-preconfig' (cold-plug)
>> We are open to suggestions. We could for example add a
>> 'preconfig-creatable' or 'init-creatable' flag to device class, which
>> can identify a set of devices we can create this way.
>>=20
>> The main addition is how we handle the case of sysbus devices. Sysbus
>> devices are particular because unlike, for example, pci devices, you
>> have to manually handle the memory mapping and interrupts wiring. So
>> right now, a sysbus device is dynamically creatable (using -device
>> CLI option or device_add QMP command) only if:
>> + it is 'user_creatable' (like any other device),
>> + and it is in the current machine sysbus device allow list.
>>=20
>> In this series, we propose to relax the second constraint during the
>> earlier phases of machine creation so that when using -preconfig we
>> can create any 'user-creatable' sysbus device. When the machine
>> progresses to the 'ready' phase, sysbus devices creation will come
>> back to the legacy behavior: it will be possible only based on the
>> per-machine authorization basis.
>>=20
>> For sysbus devices, wiring interrupts is not a problem as we can use
>> the 'qom-set' QMP command, but memory mapping is.
>>=20
>> ## 3. Memory mapping
>>=20
>> There is no point allowing the creation sysbus devices if we cannot
>> map them onto the memory bus (the 'sysbus').
>>=20
>> As far as we know, right now, there is no way to add memory mapping
>> for sysbus device using QMP commands. We propose a =
'x-sysbus-mmio-map'
>> command to do this. This command would only be allowed during the
>> 'initialized' phase when using -preconfig.
>>=20
>> ## 4. Working example
>>=20
>> The last patches of the series add and modify devices in order to
>> build a working machine starting from the 'none' machine.
>>=20
>> We add a new sysbus device modeling a simple memory (ram or rom). We
>> also set 'user-creatable' flag of some sysbus devices. These are
>> trivial patches, but they depends on the conditions we choose to =
allow
>> creating devices with -preconfig. Therefore, there is really no need
>> to review them until we settled on the device conditions first.
>>=20
>> With these devices (memory, ibex_uart, ibex_plic) we can dynamically
>> configure a part (we did not add the timer, but we could) the
>> opentitan machine very easily and run firmwares which demonstrates
>> interrupts and memory-mapping are working.
>>=20
>> We use the existing qmp-shell script to issue machine devices
>> from a qmp commands script file which contains qmp commands listed in
>> a file.
>>=20
>> The following qmp commands add some memories, an interrupt controller
>> and an uart with an interrupt.
>>=20
>> cat > opentitan.qmp <<EOF
>> x-machine-init
>>=20
>> # ROM 0x00008000
>> device_add        driver=3Dsysbus-memory id=3Drom size=3D0x4000 =
readonly=3Dtrue
>> x-sysbus-mmio-map device=3Drom addr=3D32768
>>=20
>> # FLASH 0x20000000
>> device_add        driver=3Dsysbus-memory id=3Dflash size=3D0x80000 =
readonly=3Dtrue
>> x-sysbus-mmio-map device=3Dflash addr=3D536870912
>>=20
>> # RAM 0x10000000
>> device_add        driver=3Dsysbus-memory id=3Dram size=3D0x10000
>> x-sysbus-mmio-map device=3Dram addr=3D268435456
>>=20
>> # PLIC 0x41010000
>> device_add        driver=3Dibex-plic id=3Dplic
>> x-sysbus-mmio-map device=3Dplic addr=3D1090584576
>>=20
>> # UART 0x40000000
>> device_add        driver=3Dibex-uart id=3Duart chardev=3Dserial0
>> x-sysbus-mmio-map device=3Duart addr=3D1073741824
>> qom-set path=3Duart property=3Dsysbus-irq[1] =
value=3Dplic/unnamed-gpio-in[2]
>>=20
>> x-exit-preconfig
>> EOF
>>=20
>> We've put the opentitan.qmp and a firmware opentitan-echo.elf here
>> (among some other qmp machine files we are working on):
>> https://github.com/GreenSocs/qemu-qmp-machines
>=20
> I am unable to access this repo, maybe it's not public?
>=20
> Alistair


