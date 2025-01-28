Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C4EA20ACD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 13:57:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878488.1288678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcl9k-00038G-LN; Tue, 28 Jan 2025 12:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878488.1288678; Tue, 28 Jan 2025 12:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcl9k-00036D-I6; Tue, 28 Jan 2025 12:57:28 +0000
Received: by outflank-mailman (input) for mailman id 878488;
 Tue, 28 Jan 2025 12:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPSL=UU=eik.bme.hu=balaton@srs-se1.protection.inumbo.net>)
 id 1tcl9j-000367-4e
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 12:57:27 +0000
Received: from zero.eik.bme.hu (zero.eik.bme.hu [2001:738:2001:2001::2001])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b3218fb-dd77-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 13:57:25 +0100 (CET)
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7D45F4E6029;
 Tue, 28 Jan 2025 13:57:23 +0100 (CET)
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 3uK6LJmOcV0F; Tue, 28 Jan 2025 13:57:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 811C44E6027; Tue, 28 Jan 2025 13:57:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7E1B874577C;
 Tue, 28 Jan 2025 13:57:21 +0100 (CET)
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
X-Inumbo-ID: 6b3218fb-dd77-11ef-a0e6-8be0dac302b0
X-Virus-Scanned: amavisd-new at eik.bme.hu
Date: Tue, 28 Jan 2025 13:57:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Gerd Hoffmann <kraxel@redhat.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
    qemu-devel@nongnu.org, Yi Liu <yi.l.liu@intel.com>, 
    Markus Armbruster <armbru@redhat.com>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    Anthony PERARD <anthony@xenproject.org>, 
    Gustavo Romero <gustavo.romero@linaro.org>, 
    Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org, 
    "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Alexander Graf <graf@amazon.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Stefan Berger <stefanb@linux.vnet.ibm.com>, 
    Bernhard Beschow <shentey@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Alex Williamson <alex.williamson@redhat.com>, Paul Durrant <paul@xen.org>, 
    =?ISO-8859-15?Q?Cl=E9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>, 
    =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@redhat.com>
Subject: Re: [PATCH 0/9] hw/sysbus/platform-bus: Introduce
 TYPE_DYNAMIC_SYS_BUS_DEVICE
In-Reply-To: <CAFEAcA-QOYcnJi=joKHbRmUCXK1UFOgQRgYP-fDq4h_1SkMGyQ@mail.gmail.com>
Message-ID: <2893a552-ca6c-01c4-dcc0-6107ccf1c7b5@eik.bme.hu>
References: <20250125181343.59151-1-philmd@linaro.org> <wkb53fhvfchqa4uvmifgitvcr7t7rfpc3hcohdhzczkzvktetx@yjveswjel3s4> <CAFEAcA-QOYcnJi=joKHbRmUCXK1UFOgQRgYP-fDq4h_1SkMGyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-275533675-1738069041=:16171"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-275533675-1738069041=:16171
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 28 Jan 2025, Peter Maydell wrote:
> On Tue, 28 Jan 2025 at 10:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> On Sat, Jan 25, 2025 at 07:13:34PM +0100, Philippe Mathieu-Daudé wrote:
>>> Some SysBus devices can optionally be dynamically plugged onto
>>> the sysbus-platform-bus (then virtual guests are aware of
>>> mmio mapping and IRQs via device tree / ACPI rules).
>>
>> Do we have some sane way to have user-pluggable sysbus devices on arm?
>
> The answer in a general sense is "no, because user pluggable
> sysbus is a weird idea". "sysbus" means "it's wired into a
> specific bit of the memory map and to specific IRQs, and whoever
> does that needs to know what IRQs and bits of memory are usable,
> and the guest OS needs to know it's there". "user-pluggable" means
> "it's all automatic and the guest can just do some kind of
> probing for what is or isn't present". All the platform bus stuff
> is a nasty mess that's working around the things people want
> to plug in not being clean devices on probeable buses :-(
> And the platform bus is only supported on the "virt" board,
> because that's the only one where QEMU is generating its
> own dtb or ACPI tables where it can tell the guest "hey,
> there's some device here".

There are some SoCs that have memory mapped devices but different versions 
in the same family have different devices. Either older ones missing some 
devices or have less USB or network ports while newer SoCs have more of 
those or they have PCIe instead of PCI. Modelling these could use 
pluggable sysbus devices so one could add the devices needed for a SoC 
version without having to write or modify a board code. I think Bernhard's 
attempt to try creating e500 SoCs from a device tree goes in that 
direction too. We could also model this by having a SoC that can 
instantiate devices based on some properties but maybe pluggable devices 
could be more generic for this. The issue seems to be how to tell the 
board or SoC where to map it and what IRQ to connect it as this is done by 
the board and not the device so properties on the device to set these does 
not really help unless the board can somehow query it and instantiate the 
devices based on that. Otherwise whatever handles the -device option to 
create the device would need knowledge about the board. (E.g. the e500 
devices are mapped in the CCSR memory region so one can't just use system 
address space for them.)

Regards,
BALATON Zoltan
--3866299591-275533675-1738069041=:16171--

