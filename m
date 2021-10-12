Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA742AFF8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 01:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207767.363682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQsP-0003qt-MY; Tue, 12 Oct 2021 23:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207767.363682; Tue, 12 Oct 2021 23:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQsP-0003oB-HO; Tue, 12 Oct 2021 23:08:05 +0000
Received: by outflank-mailman (input) for mailman id 207767;
 Tue, 12 Oct 2021 23:08:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maQsO-0003o5-Qi
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 23:08:04 +0000
Received: from mail-io1-xd2d.google.com (unknown [2607:f8b0:4864:20::d2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3303686c-96ed-483c-8441-e169d5e2b41b;
 Tue, 12 Oct 2021 23:08:03 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id i189so717168ioa.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 16:08:03 -0700 (PDT)
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
X-Inumbo-ID: 3303686c-96ed-483c-8441-e169d5e2b41b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D23sb8bFeCXI94xUkUzdKmg69G7zDAbwqduFczWfvKA=;
        b=Es3UE5dss4rZylCN7k44ApvHlCaGU4yXyfFXVgiwjK++fiVIj2AKyYlhX4iAoXUJOm
         CtSsoA4ibc2vMn9zCCRDTEOys3irqDNERLbvfsl8FtIskFvMfYPIxDmhYNrSBO6XV0hi
         FOvfleplF/JVnW1XO/X1GH23yuGwJN5Td7ReeJ5nhPGgxCrQwYOAJfV9mWo/s7aGoAHx
         hgwBiim7ZtjYHhe8Upjehw7vm9f6ONaDVoNk8y1ytrp2plFJEBsprIw21sUuNsYSYnwc
         B/NTXWA9gpi42gCU9Q//B3uCy6IkbzHo6gsWN7PflOKs4cmdY6C+GuFuof6yViEAJVIw
         0jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D23sb8bFeCXI94xUkUzdKmg69G7zDAbwqduFczWfvKA=;
        b=PI6EXbWl1aAla2DouH81zCUw5PWGHXZPhsKLxK+5nwIiOXOnZrdDe68JZSY356KNNb
         0Qp+ivnMY1n7+0bBIH+wINzdxa6VjfZ307k3K7SGxVHGn3udOjO6a4l+QhssTWez+ZYY
         MXKepIjmBeHv3cCOqLdlB56CNwmMc6neKPFQQ6xun62rBgw2NToG5VvRMuGnbh7zdE1a
         sN25akHKAG1d9cOBBlcfKKe1SBRAsUiHyMEO6O7BP9fL+/PgRBAo/SpbYLOHa5CfKOo4
         a4GWHydU+UKk2W7c2uE19KefYoV3k5J2bxVR4HrKf2KlD3dTo6ygiyLyp7HFqHwzduDy
         vqkw==
X-Gm-Message-State: AOAM532zU5X0Ir78QYv+WmXlg8NCLOnJ91vrRYGSDYftzgOs4mMqySqR
	DK7BEoo+xzDfFIwnsIT9cWjgL4i2MnVq9zOQn0Y=
X-Google-Smtp-Source: ABdhPJxDPo9qtToO6ewaPjuNrBsi+QXGD1yiMTi37OJGplkSUxNlRnlVrO+pWqYJmSF5JUPbJAj3fBICmq3UUqxD/5U=
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr25110746jak.63.1634080083372;
 Tue, 12 Oct 2021 16:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-10-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-10-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 09:07:37 +1000
Message-ID: <CAKmqyKNeUz7BTxhJTKnhTnEnONRJLJ8V-CaCZ3E5OA2G8eeP4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/16] hw/core/machine: Remove the dynamic sysbus
 devices type check
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 2:23 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Now that we check sysbus device types during device creation, we
> can remove the check done in the machine init done notifier.
> This was the only thing done by this notifier, so we remove the
> whole sysbus_notifier structure of the MachineState.
>
> Note: This notifier was checking all /peripheral and /peripheral-anon
> sysbus devices. Now we only check those added by -device cli option or
> device_add qmp command when handling the command/option. So if there
> are some devices added in one of these containers manually (eg in
> machine C code), these will not be checked anymore.
> This use case does not seem to appear apart from
> hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
> not for a sysbus device, so it's ok).
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/boards.h |  1 -
>  hw/core/machine.c   | 27 ---------------------------
>  2 files changed, 28 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 934443c1cd..ccbc40355a 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -311,7 +311,6 @@ typedef struct CpuTopology {
>  struct MachineState {
>      /*< private >*/
>      Object parent_obj;
> -    Notifier sysbus_notifier;
>
>      /*< public >*/
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1a18912dc8..521438e90a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -571,18 +571,6 @@ bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
>      return allowed;
>  }
>
> -static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
> -{
> -    MachineState *machine = opaque;
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
> -
> -    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
> -        error_report("Option '-device %s' cannot be handled by this machine",
> -                     object_class_get_name(object_get_class(OBJECT(sbdev))));
> -        exit(1);
> -    }
> -}
> -
>  static char *machine_get_memdev(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -598,17 +586,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>
> -static void machine_init_notify(Notifier *notifier, void *data)
> -{
> -    MachineState *machine = MACHINE(qdev_get_machine());
> -
> -    /*
> -     * Loop through all dynamically created sysbus devices and check if they are
> -     * all allowed.  If a device is not allowed, error out.
> -     */
> -    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
> -}
> -
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>  {
>      int i;
> @@ -1030,10 +1007,6 @@ static void machine_initfn(Object *obj)
>                                          "Table (HMAT)");
>      }
>
> -    /* Register notifier when init is done for sysbus sanity checks */
> -    ms->sysbus_notifier.notify = machine_init_notify;
> -    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
> -
>      /* default to mc->default_cpus */
>      ms->smp.cpus = mc->default_cpus;
>      ms->smp.max_cpus = mc->default_cpus;
> --
> 2.33.0
>
>

