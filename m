Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF5642AF98
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207728.363634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQ7f-0005Xy-BJ; Tue, 12 Oct 2021 22:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207728.363634; Tue, 12 Oct 2021 22:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQ7f-0005V0-7v; Tue, 12 Oct 2021 22:19:47 +0000
Received: by outflank-mailman (input) for mailman id 207728;
 Tue, 12 Oct 2021 22:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maQ7d-0005Uu-OB
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:19:45 +0000
Received: from mail-io1-xd30.google.com (unknown [2607:f8b0:4864:20::d30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e596a25-4093-4d8c-9817-bdd7f4f8ebb9;
 Tue, 12 Oct 2021 22:19:44 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id n7so657508iod.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 15:19:44 -0700 (PDT)
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
X-Inumbo-ID: 2e596a25-4093-4d8c-9817-bdd7f4f8ebb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NB4zMWjVCozDyRqrRazsv7gECHlthWA9j/5E69e+2pE=;
        b=O3E8Na1Lu/kg9q1317gF82pOCZSAMuuoHn9gufZyGxGSmsbzzQuMOVwF55Mu1iLW6V
         PCF0bB5+i5baqpeBi4h/xhHYwcXBogMplyx2nUX6DUEsErcrra5z1EPRUgOElfsH0lg1
         I/BwklgzMNPayXfCFl9iwhqVifSnxzvdpvzXqwQ4HCx7BjgzeqJxBhXOEohGI1rwykZn
         lXUiMVocjsfQYqnLJkmu3QYInXK597Co5vY7nIGVpvZYghsGhXTZ1jdQ+cXWePtVTJ0Q
         NYIARl/MQFTZ5C41TQ8TdOW5Yx6HYV1q29+D6fM3fBxt5E8SYSDrI2cfXDSrUcWLSG0P
         rjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NB4zMWjVCozDyRqrRazsv7gECHlthWA9j/5E69e+2pE=;
        b=l99PAKeRI+r4+HVdEJaK1nWVE9JmwSc4u8DM6mJu66QrT+YAua8EMu8FJf5cnsGm7h
         uyD4RoqsQyiRN2yDyb2ngNB+Gn2A8hTMJkMM6p/XbB8IIqj+jSIcEL9tr8sE/LNuqaTf
         LvheVbxGacBPNm9P92RqkydjuyOm/t8Kycg281Ms+9DR3B+wTSpu2RwssDA//rAhyWoP
         OY9NxI+Lcoz2et5YTuGtcRhVjVIwg7VkkH7iGDPmb8w0YQTR32OqcGpY3g6r7tmv8KpC
         xoWbjvgNTb0eUm9z7uTZ1uz7+7u3C3j/ijWygv9kIRUirCBgTOv0YJxG3KyJNz51bVxs
         /sUw==
X-Gm-Message-State: AOAM5321qCA1qZFw/0POEj36nZyE28YhgQwa53ALZCSSvmBaMu+aub8R
	xhMIb+F7TyzN4AmuCV1iQbLJ70QSFaOiAF493L8=
X-Google-Smtp-Source: ABdhPJyUAmYSRqyUMQkR2DPCTv/LEqWVUb7bWjDgrZMQ35aO1plLf4xcvTA3zyySB7lWt4luca1J9q2NsICNzsModDE=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr25921383iod.16.1634077184387;
 Tue, 12 Oct 2021 15:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-4-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-4-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:19:18 +1000
Message-ID: <CAKmqyKP-Na8=6cyL8kLNwkr8Hcb2cDgVYYqDrqO_g=tcqkO96A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/16] qapi: Implement x-machine-init QMP command
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

On Thu, Sep 23, 2021 at 2:17 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> The x-machine-init QMP command is available only if the -preconfig option
> is used and the current machine initialization phase is accel-created.
>
> The command triggers QEMU to enter machine initialized phase and wait
> for the QMP configuration. In future commits, we will add the possiblity
> to create devices at this point.
>
> To exit the initialized phase use the x-exit-preconfig QMP command.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine.json | 23 +++++++++++++++++++++++
>  softmmu/vl.c      | 19 +++++++++++++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 969d37fb03..56330c0e8e 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1368,3 +1368,26 @@
>  ##
>  { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
>               'allow-preconfig': true }
> +
> +##
> +# @x-machine-init:
> +#
> +# Enter machine initialized phase
> +#
> +# Since: 6.2
> +#
> +# Returns: If successful, nothing
> +#
> +# Notes: This command will trigger QEMU to execute initialization steps
> +#        that are required to enter the machine initialized phase. The command
> +#        is available only if the -preconfig command line option was passed and
> +#        if the machine is currently in the accel-created phase. To exit the
> +#        machine initialized phase use the x-exit-preconfig command.
> +#
> +# Example:
> +#
> +# -> { "execute": "x-machine-init" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'x-machine-init', 'allow-preconfig': true }
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index d2552ba8ac..84c5132ad7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -123,6 +123,7 @@
>  #include "qapi/qapi-visit-qom.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qapi-commands-machine.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/iothread.h"
>  #include "qemu/guest-random.h"
> @@ -2610,10 +2611,16 @@ static void qemu_init_displays(void)
>      }
>  }
>
> -static void qemu_init_board(void)
> +void qmp_x_machine_init(Error **errp)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
>
> +    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        error_setg(errp, "The command is permitted only before "
> +                         "the machine is initialized");
> +        return;
> +    }
> +
>      if (machine_class->default_ram_id && current_machine->ram_size &&
>          numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>          create_default_memdev(current_machine, mem_path);
> @@ -2692,12 +2699,16 @@ static void qemu_machine_creation_done(void)
>
>  void qmp_x_exit_preconfig(Error **errp)
>  {
> -    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> -        error_setg(errp, "The command is permitted only before machine initialization");
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
> +        error_setg(errp, "The command is permitted only before "
> +                         "the machine is ready");
>          return;
>      }
>
> -    qemu_init_board();
> +    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        qmp_x_machine_init(errp);
> +    }
> +
>      qemu_create_cli_devices();
>      qemu_machine_creation_done();
>
> --
> 2.33.0
>
>

