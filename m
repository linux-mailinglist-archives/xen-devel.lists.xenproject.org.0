Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E8322097
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 21:04:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88367.166127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHR3-0004y8-Ht; Mon, 22 Feb 2021 20:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88367.166127; Mon, 22 Feb 2021 20:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEHR3-0004xj-Ed; Mon, 22 Feb 2021 20:04:01 +0000
Received: by outflank-mailman (input) for mailman id 88367;
 Mon, 22 Feb 2021 20:04:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OgTk=HY=eik.bme.hu=balaton@srs-us1.protection.inumbo.net>)
 id 1lEHR2-0004xe-AH
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 20:04:00 +0000
Received: from zero.eik.bme.hu (unknown [2001:738:2001:2001::2001])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ba3970f-ed74-4372-a251-2a29ae5b9e50;
 Mon, 22 Feb 2021 20:03:57 +0000 (UTC)
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 02F4C7462D3;
 Mon, 22 Feb 2021 21:03:56 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B583A7462BD; Mon, 22 Feb 2021 21:03:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B37E474581E;
 Mon, 22 Feb 2021 21:03:55 +0100 (CET)
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
X-Inumbo-ID: 9ba3970f-ed74-4372-a251-2a29ae5b9e50
Date: Mon, 22 Feb 2021 21:03:55 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
    Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org, 
    Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>, 
    Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@de.ibm.com>, 
    =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
    Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>, 
    Eduardo Habkost <ehabkost@redhat.com>, 
    Alistair Francis <alistair@alistair23.me>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
    David Gibson <david@gibson.dropbear.id.au>, 
    Radoslaw Biernacki <rad@semihalf.com>, 
    =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
    qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 04/11] hw/arm: Restrit KVM to the virt & versal
 machines
In-Reply-To: <20210219173847.2054123-5-philmd@redhat.com>
Message-ID: <36692cea-e747-b054-51ff-bbcfbbdd4151@eik.bme.hu>
References: <20210219173847.2054123-1-philmd@redhat.com> <20210219173847.2054123-5-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-317435051-1614024235=:60531"
X-Spam-Checker-Version: Sophos PMX: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2021.2.22.191817, AntiVirus-Engine: 5.79.0, AntiVirus-Data: 2020.12.21.5790000
X-Spam-Flag: NO
X-Spam-Probability: 9%
X-Spam-Level: 
X-Spam-Status: No, score=9% required=50%

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-317435051-1614024235=:60531
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Feb 2021, Philippe Mathieu-Daudé wrote:
> Restrit KVM to the following ARM machines:

Typo: "Restrict" (also in patch title).

Regards,
BALATON Zoltan

> - virt
> - xlnx-versal-virt
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> hw/arm/virt.c             | 5 +++++
> hw/arm/xlnx-versal-virt.c | 5 +++++
> 2 files changed, 10 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 371147f3ae9..8e9861b61a9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2527,6 +2527,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>     return NULL;
> }
>
> +static const char *const valid_accels[] = {
> +    "tcg", "kvm", "hvf", NULL
> +};
> +
> /*
>  * for arm64 kvm_type [7-0] encodes the requested number of bits
>  * in the IPA address space
> @@ -2582,6 +2586,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +    mc->valid_accelerators = valid_accels;
>     mc->kvm_type = virt_kvm_type;
>     assert(!mc->get_hotplug_handler);
>     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 8482cd61960..d424813cae1 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -610,6 +610,10 @@ static void versal_virt_machine_instance_init(Object *obj)
> {
> }
>
> +static const char *const valid_accels[] = {
> +    "tcg", "kvm", NULL
> +};
> +
> static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
> {
>     MachineClass *mc = MACHINE_CLASS(oc);
> @@ -621,6 +625,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
>     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
>     mc->no_cdrom = true;
>     mc->default_ram_id = "ddr";
> +    mc->valid_accelerators = valid_accels;
> }
>
> static const TypeInfo versal_virt_machine_init_typeinfo = {
>
--3866299591-317435051-1614024235=:60531--

