Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3E8413B7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 20:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673159.1047389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUXak-0002eg-UJ; Mon, 29 Jan 2024 19:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673159.1047389; Mon, 29 Jan 2024 19:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUXak-0002cH-QS; Mon, 29 Jan 2024 19:46:50 +0000
Received: by outflank-mailman (input) for mailman id 673159;
 Mon, 29 Jan 2024 19:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D43g=JH=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1rUXai-0002cB-Qe
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 19:46:48 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [152.66.115.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 217be44a-bedf-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 20:46:45 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9FB514E6012;
 Mon, 29 Jan 2024 20:46:43 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id JX1PHC9kVR1W; Mon, 29 Jan 2024 20:46:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 99D024E6006; Mon, 29 Jan 2024 20:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 966427456B4;
 Mon, 29 Jan 2024 20:46:41 +0100 (CET)
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
X-Inumbo-ID: 217be44a-bedf-11ee-98f5-efadbce2ee36
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Mon, 29 Jan 2024 20:46:41 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
    Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
    qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Zhao Liu <zhao1.liu@intel.com>, 
    Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    =?ISO-8859-15?Q?Fr=E9d=E9ric_Barrat?= <fbarrat@linux.ibm.com>, 
    =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
    Viresh Kumar <viresh.kumar@linaro.org>, mzamazal@redhat.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
    Laurent Vivier <laurent@vivier.eu>, 
    Daniel Henrique Barboza <danielhb413@gmail.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
    Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/29] bulk: Access existing variables initialized to
 &S->F when available
In-Reply-To: <20240129164514.73104-2-philmd@linaro.org>
Message-ID: <fd790685-a98f-9cd5-c117-dac96564a71b@eik.bme.hu>
References: <20240129164514.73104-1-philmd@linaro.org> <20240129164514.73104-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-1985250681-1706557601=:22604"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1985250681-1706557601=:22604
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 29 Jan 2024, Philippe Mathieu-Daudé wrote:
> When a variable is initialized to &struct->field, use it
> in place. Rationale: while this makes the code more concise,
> this also helps static analyzers.
>
> Mechanical change using the following Coccinelle spatch script:
>
> @@
> type S, F;
> identifier s, m, v;
> @@
>      S *s;
>      ...
>      F *v = &s->m;
>      <+...
> -    &s->m
> +    v
>      ...+>
>
> Inspired-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/display/ati.c              |  2 +-
> hw/misc/macio/pmu.c           |  2 +-
> hw/misc/pvpanic-pci.c         |  2 +-
> hw/pci-bridge/cxl_root_port.c |  2 +-
> hw/ppc/pnv.c                  | 20 ++++++++++----------
> hw/virtio/vhost-user-gpio.c   |  8 ++++----
> hw/virtio/vhost-user-scmi.c   |  6 +++---
> hw/virtio/virtio-pci.c        |  2 +-
> hw/xen/xen_pt.c               |  6 +++---
> migration/multifd-zlib.c      |  2 +-
> target/arm/cpu.c              |  4 ++--
> target/arm/kvm.c              |  2 +-
> target/arm/machine.c          |  6 +++---
> target/i386/hvf/x86hvf.c      |  2 +-
> target/m68k/helper.c          |  2 +-
> target/ppc/kvm.c              |  8 ++++----
> target/riscv/cpu_helper.c     |  2 +-
> 17 files changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/hw/display/ati.c b/hw/display/ati.c
> index 569b8f6165..8d2501bd82 100644
> --- a/hw/display/ati.c
> +++ b/hw/display/ati.c
> @@ -991,7 +991,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
>     }
>     vga_init(vga, OBJECT(s), pci_address_space(dev),
>              pci_address_space_io(dev), true);
> -    vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, &s->vga);
> +    vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, vga);
>     if (s->cursor_guest_mode) {
>         vga->cursor_invalidate = ati_cursor_invalidate;
>         vga->cursor_draw_line = ati_cursor_draw_line;
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index e9a90da88f..7fe1c4e517 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -737,7 +737,7 @@ static void pmu_realize(DeviceState *dev, Error **errp)
>     timer_mod(s->one_sec_timer, s->one_sec_target);
>
>     if (s->has_adb) {
> -        qbus_init(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
> +        qbus_init(adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,

Probably should change to use sizeof(*adb_bus) too. Although the next line 
is the only place the adb_bus local is used so maybe can drop the local 
and chnage next line to use &s->adb_bus instead.

Regards,
BALATON Zoltan

>                   dev, "adb.0");
>         adb_register_autopoll_callback(adb_bus, pmu_adb_poll, s);
>     }
--3866299591-1985250681-1706557601=:22604--

