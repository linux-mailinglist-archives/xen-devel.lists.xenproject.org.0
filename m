Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22291421338
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 17:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201583.356162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXQKb-0002jN-HG; Mon, 04 Oct 2021 15:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201583.356162; Mon, 04 Oct 2021 15:56:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXQKb-0002hZ-Dk; Mon, 04 Oct 2021 15:56:45 +0000
Received: by outflank-mailman (input) for mailman id 201583;
 Mon, 04 Oct 2021 15:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilK6=OY=greensocs.com=damien.hedde@srs-us1.protection.inumbo.net>)
 id 1mXQKZ-0002hT-Rq
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 15:56:44 +0000
Received: from beetle.greensocs.com (unknown [5.135.226.135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebe53308-76b0-40f3-9609-e9e699a3d2cc;
 Mon, 04 Oct 2021 15:56:41 +0000 (UTC)
Received: from [192.168.15.181] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9EA69208A1;
 Mon,  4 Oct 2021 15:56:37 +0000 (UTC)
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
X-Inumbo-ID: ebe53308-76b0-40f3-9609-e9e699a3d2cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1633362999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iW9CkzSuzFakm6dIMJ0sNZe5+RrBD4UyGJTesU86nTs=;
	b=a2cCLUvTKZXBLhv9F9vzjODrDddU+GRb/bGgbfYX1V67qNfIyX2cw/OZgoF/aKX24W6ybD
	FNXCOc8NsqQBgH48p0sW6ehRGMq8ptmJ8fhWhIyHRQPJjXwoGvEqqDH7EBJJf97Jpo5tsU
	do+k4yCJpn9ox7UUcKfLuS0Bcthgddc=
Message-ID: <2ba3a11b-9022-e537-d713-4aa173020a87@greensocs.com>
Date: Mon, 4 Oct 2021 17:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RFC PATCH v2 00/16] Initial support for machine creation via QMP
Content-Language: en-US-large
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 mark.burton@greensocs.com, mirela.grujic@greensocs.com, edgari@xilinx.com,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This is both a ping and a small update. It would be great to have some 
feedback about patches 1 and 3.

Right now the device part of this series conflicts with Kevin 's work 
about replacing the QemuOpts by a QemuDict in device_add:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg06136.html

So I'll have at least to rebase on top of his series, remove and rework 
some of the patches.

Maybe this series is too big and we should split it anyway ? We could 
for example target 3 smaller series:
  1. -> about stopping during the machine 'initialized' phase
  2. -> about enabling using device_add QMP commands during this phase
  3. -> about the sysbus device case (some of the patches are even 
independent)

Thanks,
Damien

On 9/22/21 18:13, Damien Hedde wrote:
> Hi,
> 
> The goal of this work is to bring dynamic machine creation to QEMU:
> we want to setup a machine without compiling a specific machine C
> code. It would ease supporting highly configurable platforms (for
> example resulting from an automated design flow). The requirements
> for such configuration include begin able to specify the number of
> cores, available peripherals, emmory mapping, IRQ mapping, etc.
> 
> This series focuses on the first step: populating a machine with
> devices during its creation. We propose patches to support this
> using QMP commands. This is a working set of patches and improves
> over the earlier rfc (posted in May):
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html
> 
> Although it is working and could be merged, it is tag as an RFC:
> we probably need to discuss the conditions for allowing a device to
> be created at an early stage. Patches 6, 10 and 13, 15 and 16 depend
> on such conditions and are subject to change. Other patches are
> unrelated to this point.
> 
> We address several issues in this series. They are detailed below.
> 
> ## 1. Stoping QEMU to populate the machine with devices
> 
> QEMU goes through several steps (called _machine phases_) when
> creating the machine: 'no-machine', 'machine-created',
> 'accel-created', 'initialized', and finally 'ready'. At 'ready'
> phase, QEMU is ready to start (see Paolo's page
> https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence for
> more details).
> 
> Using the -preconfig CLI option, QEMU can be stopped today during
> the 'accel-created' phase. Then the 'x-exit-preconfig' QMP command
> triggers QEMU moving forwards to the completion of the machine
> creation ('ready' phase).
> 
> The devices are created during the 'initialized' phase.
> In this phase the machine init() method has been executed and thus
> machine properties have been handled. Although the sysbus exists and
> the machine may have been populated by the init(),
> _machine_init_done_ notifiers have not been called yet. At this point
> we can add more devices to a machine.
> 
> We propose to add 2 QMP commands:
> + The 'query-machine-phase' command would return the current machine
>    phase.
> + The 'x-machine-init' command would advance the machine phase to
>    'initialized'. 'x-exit-preconfig' could then still be used to
>    advance to the last phase.
> 
> ## 2. Adding devices
> 
> Right now, the user can create devices in 2 ways: using '-device' CLI
> option or 'device_add' QMP command. Both are executed after the
> machine is ready: such devices are hot-plugged. We propose to allow
> 'device_add' QMP command to be used during the 'initialized' phase.
> 
> In this series, we keep the constraint that the device must be
> 'user-creatable' (this is a device class flag). We do not see any
> reason why a device the user can hot-plug could not be created at an
> earlier stage.
> 
> This part is still RFC because, as Peter mentioned it (in this thread
> https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01933.html),
> we may want additional or distinct conditions for:
> + device we can hot-plug
> + device we can add in '-preconfig' (cold-plug)
> We are open to suggestions. We could for example add a
> 'preconfig-creatable' or 'init-creatable' flag to device class, which
> can identify a set of devices we can create this way.
> 
> The main addition is how we handle the case of sysbus devices. Sysbus
> devices are particular because unlike, for example, pci devices, you
> have to manually handle the memory mapping and interrupts wiring. So
> right now, a sysbus device is dynamically creatable (using -device
> CLI option or device_add QMP command) only if:
> + it is 'user_creatable' (like any other device),
> + and it is in the current machine sysbus device allow list.
> 
> In this series, we propose to relax the second constraint during the
> earlier phases of machine creation so that when using -preconfig we
> can create any 'user-creatable' sysbus device. When the machine
> progresses to the 'ready' phase, sysbus devices creation will come
> back to the legacy behavior: it will be possible only based on the
> per-machine authorization basis.
> 
> For sysbus devices, wiring interrupts is not a problem as we can use
> the 'qom-set' QMP command, but memory mapping is.
> 
> ## 3. Memory mapping
> 
> There is no point allowing the creation sysbus devices if we cannot
> map them onto the memory bus (the 'sysbus').
> 
> As far as we know, right now, there is no way to add memory mapping
> for sysbus device using QMP commands. We propose a 'x-sysbus-mmio-map'
> command to do this. This command would only be allowed during the
> 'initialized' phase when using -preconfig.
> 
> ## 4. Working example
> 
> The last patches of the series add and modify devices in order to
> build a working machine starting from the 'none' machine.
> 
> We add a new sysbus device modeling a simple memory (ram or rom). We
> also set 'user-creatable' flag of some sysbus devices. These are
> trivial patches, but they depends on the conditions we choose to allow
> creating devices with -preconfig. Therefore, there is really no need
> to review them until we settled on the device conditions first.
> 
> With these devices (memory, ibex_uart, ibex_plic) we can dynamically
> configure a part (we did not add the timer, but we could) the
> opentitan machine very easily and run firmwares which demonstrates
> interrupts and memory-mapping are working.
> 
> We use the existing qmp-shell script to issue machine devices
> from a qmp commands script file which contains qmp commands listed in
> a file.
> 
> The following qmp commands add some memories, an interrupt controller
> and an uart with an interrupt.
> 
> cat > opentitan.qmp <<EOF
> x-machine-init
> 
> # ROM 0x00008000
> device_add        driver=sysbus-memory id=rom size=0x4000 readonly=true
> x-sysbus-mmio-map device=rom addr=32768
> 
> # FLASH 0x20000000
> device_add        driver=sysbus-memory id=flash size=0x80000 readonly=true
> x-sysbus-mmio-map device=flash addr=536870912
> 
> # RAM 0x10000000
> device_add        driver=sysbus-memory id=ram size=0x10000
> x-sysbus-mmio-map device=ram addr=268435456
> 
> # PLIC 0x41010000
> device_add        driver=ibex-plic id=plic
> x-sysbus-mmio-map device=plic addr=1090584576
> 
> # UART 0x40000000
> device_add        driver=ibex-uart id=uart chardev=serial0
> x-sysbus-mmio-map device=uart addr=1073741824
> qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
> 
> x-exit-preconfig
> EOF
> 
> We've put the opentitan.qmp and a firmware opentitan-echo.elf here
> (among some other qmp machine files we are working on):
> https://github.com/GreenSocs/qemu-qmp-machines
> This firmware is just a small interrupt-based program echoing back
> whatever is sent in the uart.
> 
> QEMU should be run using the following command:
> qemu-system-riscv32 -preconfig -qmp unix:/tmp/qmp-socket,server \
>      -display none \
>      -M none -cpu lowrisc-ibex \
>      -serial mon:stdio \
>      -device loader,addr=0x8090,cpu-num=0 \
>      -device loader,file=opentitan-hello.elf \
> 
> and in other terminal to do the configuration (grep is just here to
> remove comments):
> grep -v -e '^#' opentitan.qmp | qmp-shell -v /tmp/qmp-socket
> 
> Alternatively we can load the firmware on the existing machine and
> observe the same behavior:
> qemu-system-riscv32 -display none \
>       -M opentitan \
>       -serial mon:stdio \
>       -kernel opentitan-echo.elf
> 
> We chose this example because it is very simple and does not need a
> lot of devices.
> 
> This work has still a lot of limitations. Cpus config is done the
> normal way (the C machine does that): in our example we used the
> 'none' machine. We have work to do for handling backend
> connection (for example net/nic are complicated) because the way it
> is done in machine C code does not translate easily in QMP commands.
> Firmware loading is also a bit tricky. We plan to work on this in
> follow-up series.
> 
> The series is organized as follows:
> - Patches 1 to 3 add qmp support to stop QEMU at an early phase
>    to populate the machine with devices.
> - Patches 4 to 6 prepare and allow issuing device_add during this phase.
> - Patches 7 to 10 prepare and allow creating sysbus device during this phase.
> - Patches 11 and 12 add the x-sysbus-mmio-map QMP command
> - Patch 13 add the memory sysbus device to model ram and rom
> - Patch 14 adds some documentation
> - Patches 15 and 16 set 'user_creatable' flag of ibex_uart and ibex_plic.
> 
> This work is supported by Greensocs, Sifive and Xilinx.
> 
> Thanks,
> --
> Damien
> 
> Damien Hedde (12):
>    softmmu/qdev-monitor: add error handling in qdev_set_id
>    qdev-monitor: prevent conflicts between qmp/device_add and cli/-device
>    hw/core/machine: add machine_class_is_dynamic_sysbus_dev_allowed
>    qdev-monitor: Check sysbus device type before creating it
>    hw/core/machine: Remove the dynamic sysbus devices type check
>    qdev-monitor: allow adding any sysbus device before machine is ready
>    softmmu/memory: add memory_region_try_add_subregion function
>    add x-sysbus-mmio-map qmp command
>    hw/mem/system-memory: add a memory sysbus device
>    docs/system: add doc about the initialized machine phase and an
>      example
>    hw/char/ibex_uart: set user_creatable
>    hw/intc/ibex_plic: set user_creatable
> 
> Mirela Grujic (4):
>    rename MachineInitPhase enum constants for QAPI compatibility
>    qapi: Implement query-machine-phase QMP command
>    qapi: Implement x-machine-init QMP command
>    qapi: Allow device_add to execute in machine initialized phase
> 
>   docs/system/managed-startup.rst | 77 +++++++++++++++++++++++++++++
>   qapi/machine.json               | 79 ++++++++++++++++++++++++++++++
>   qapi/qdev.json                  | 24 ++++++++-
>   include/exec/memory.h           | 22 +++++++++
>   include/hw/boards.h             | 18 ++++++-
>   include/hw/mem/sysbus-memory.h  | 32 ++++++++++++
>   include/hw/qdev-core.h          | 30 +-----------
>   include/monitor/qdev.h          | 25 +++++++++-
>   hw/char/ibex_uart.c             |  1 +
>   hw/core/machine-qmp-cmds.c      | 11 ++++-
>   hw/core/machine.c               | 48 ++++++------------
>   hw/core/qdev.c                  |  7 ++-
>   hw/core/sysbus.c                | 41 ++++++++++++++++
>   hw/intc/ibex_plic.c             |  1 +
>   hw/mem/sysbus-memory.c          | 83 +++++++++++++++++++++++++++++++
>   hw/pci/pci.c                    |  2 +-
>   hw/usb/core.c                   |  2 +-
>   hw/virtio/virtio-iommu.c        |  2 +-
>   hw/xen/xen-legacy-backend.c     |  3 +-
>   monitor/hmp.c                   |  2 +-
>   monitor/misc.c                  |  2 +-
>   softmmu/memory.c                | 22 ++++++---
>   softmmu/qdev-monitor.c          | 86 +++++++++++++++++++++++++++------
>   softmmu/vl.c                    | 23 ++++++---
>   ui/console.c                    |  3 +-
>   hw/mem/meson.build              |  2 +
>   26 files changed, 547 insertions(+), 101 deletions(-)
>   create mode 100644 include/hw/mem/sysbus-memory.h
>   create mode 100644 hw/mem/sysbus-memory.c
> 

