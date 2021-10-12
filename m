Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AB42AFC1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 00:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207749.363655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQTk-0000pR-BY; Tue, 12 Oct 2021 22:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207749.363655; Tue, 12 Oct 2021 22:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maQTk-0000nd-8P; Tue, 12 Oct 2021 22:42:36 +0000
Received: by outflank-mailman (input) for mailman id 207749;
 Tue, 12 Oct 2021 22:42:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=quuu=PA=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1maQTi-0000nX-DC
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 22:42:34 +0000
Received: from mail-io1-xd36.google.com (unknown [2607:f8b0:4864:20::d36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5e37a6c-f23e-473d-a286-5ee9075092f5;
 Tue, 12 Oct 2021 22:42:33 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id h196so656029iof.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 15:42:33 -0700 (PDT)
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
X-Inumbo-ID: e5e37a6c-f23e-473d-a286-5ee9075092f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BRtEZaYJhOVpcGkgSpDYO/ypCHhDFLv2oKEs05gHoQc=;
        b=RCmgtzTgUEy+a7cJIc45CsMuD1If47Q9oDktbDKJqDqob74BYDXx4KVSyodWOMNDc7
         yYX4tIpeHcPvsUuder/+zgIGQPiv2kz+6nVZRYdAYI+f+tX5biFbDHu11M4vk5LqXiwt
         npKmeFTFlZzupoR+HSPmF8KIzAwGCSxYxGZld2ils+snabL5hh1YTfxQUc5eUyQwkrGi
         uFX5DHtCcqD299HLuhwDdyakhUgCziha8wj7edCopTlkkuIwh1iR+Up+Umwh4tlh8Yeu
         I70rd0fJ9IDd9riwFOIWtuAsQH4N04junuNk5mByMDAEskva2JRiVDTYEdVavubU1thB
         Ph9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRtEZaYJhOVpcGkgSpDYO/ypCHhDFLv2oKEs05gHoQc=;
        b=SMuDjSsJrJB/hBybzhh2Hh2d4MEx152f+pb+P27egz+J9GlPhJ4HJAP2IHFCkUqTuP
         INUFsGSNMrYaiHTGgOxsmQsyF6BhDkPSVtCclDryZmlXkn7GFWB7SSnP3GRBHXquADmJ
         rs52VBnzCcO87esKPpUhzsyweyhP0JQkY8y1jmuG9mNzOFFcM78tAZKXnLQVtz76tDdV
         6WJHT67Q1L2/P7AEeF+Qe67gR/Db/3fHyOTCd97sZVbQLLaOdI5pGmsTUPOJO0rKg+iQ
         qGhucaSrk2VQaOtrg/D4GfPq/eH1wrVzBHrLRp/niCyZyK8FJxt+IZXIPpWlKky0csEi
         auPw==
X-Gm-Message-State: AOAM530+peOjFkppEb/0JHSzGduSViv/zEE5tr6OfFhmAvxIkhikwNhn
	TG0r7ysxa6SGN3gmOhS1t/KOTFk4xQhN7BppN70=
X-Google-Smtp-Source: ABdhPJyHZZiQyHCZV1hTTNLscSJMvVXjFaVEx8O6Ga1hxEzvHQyK8S4Y9MOxSN1G9r8u/cHpghuMkGCzgDoK3US2XHQ=
X-Received: by 2002:a05:6638:1483:: with SMTP id j3mr25041031jak.63.1634078553331;
 Tue, 12 Oct 2021 15:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-9-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-9-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:42:07 +1000
Message-ID: <CAKmqyKMZFFNLLfBRUAe6Dg7U6BDX9zKJyWue_zQsSLrBbH56OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/16] qdev-monitor: Check sysbus device type
 before creating it
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

On Thu, Sep 23, 2021 at 2:53 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Add an early check to test if the requested sysbus device type
> is allowed by the current machine before creating the device. This
> impacts both -device cli option and device_add qmp command.
>
> Before this patch, the check was done well after the device has
> been created (in a machine init done notifier). We can now report
> the error right away.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  softmmu/qdev-monitor.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 47ccd90be8..f1c9242855 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -40,6 +40,7 @@
>  #include "qemu/cutils.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
> +#include "hw/boards.h"
>
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
> @@ -268,6 +269,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> +        /* sysbus devices need to be allowed by the machine */
> +        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> +        if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
> +            error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
> +                             " type for the machine", *driver);
> +            return NULL;
> +        }
> +    }
> +
>      return dc;
>  }
>
> --
> 2.33.0
>
>

