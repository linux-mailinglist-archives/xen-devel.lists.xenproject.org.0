Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74F415C7B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193697.345039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMWW-0003F6-He; Thu, 23 Sep 2021 11:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193697.345039; Thu, 23 Sep 2021 11:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMWW-0003CQ-EB; Thu, 23 Sep 2021 11:04:16 +0000
Received: by outflank-mailman (input) for mailman id 193697;
 Thu, 23 Sep 2021 11:04:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZpLY=ON=anisinha.ca=ani@srs-us1.protection.inumbo.net>)
 id 1mTMWV-0003CK-0Z
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:04:15 +0000
Received: from mail-pl1-x635.google.com (unknown [2607:f8b0:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c47e261-347c-4037-9779-92573c3ef51e;
 Thu, 23 Sep 2021 11:04:13 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id w11so3728624plz.13
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 04:04:13 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 126sm6890764pgi.86.2021.09.23.04.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
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
X-Inumbo-ID: 0c47e261-347c-4037-9779-92573c3ef51e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
        b=xp676m60NgY6Pdk+CpLb9v69Dv7cEYtiwmfwoFGZ7BHxLWSfF5ZC3a2ws4uSjGuOPf
         4TZzaTD+knuMaYTye3KpEj338NPh5Ff76gGjAjREmiiyTFOoTaBAbUb8MkDxQH90wkYg
         xlFeVbThhDtvCrKK+wJ+Dy+E2elCJ6oW1f75VWa0LVveVn6aP92rVU4ar8U4sIi1N2a/
         ymrDK13CEBTLq5G7O4r16iQe5Wgb97+pgZpswQaZjm2PZb6URvfdknz0qcX2ENrqjP8T
         amsF0+DqaiUPp74kE1Nku+dzo/fKWirhwT9B3cjbaPY7tNoqTusSwBX+bu8idJDfmvWd
         sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
        b=RqLgoHUk9Hc18eNA+NCtS8RLn83Oepo2N34HOqT/s9/4SXbRDqh9Z1COI3CXYDRz4u
         AY7rr3rhpGrvsFQsGTzE1GkmBbTJYvEKaEm7T3volUhfXTd3HhJQ3kjPCTyZrA58WTLj
         TrNp5Wp0fcAHnfclb6kN7mR3/vQvVtnjXqxxx1cdIMMZR6amPdheX9TxaB+zCeGCHYsw
         56cTqrsr0WRkRlCwGwSdp41OllDNCURu8JXleB94Dm2IqeiXpWykYSi11JPi8rDKLdWi
         QoNkZ3dueyi8Ecr2+4H0bR5jwDP6wF/TNG0kERqzSDR+RQnQNK1j0ycV8Cxe10XXoPDt
         tYyQ==
X-Gm-Message-State: AOAM532FPzRCIs5pPEza56zaJoAr23OAoujlF5GRF6p7tsruXNzqhATm
	izjBdvZ61CCv9Wcob4aYsJPkkA==
X-Google-Smtp-Source: ABdhPJxBS6AGfLPmzLRaQHRFmVjDVoRSyb6vHulAN4aGINKZzpCa+OGlRLA+YQyj5ZUQtE0f9I/NeA==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id lb12mr16930916pjb.55.1632395052788;
        Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:34:01 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Damien Hedde <damien.hedde@greensocs.com>
cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
    =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
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
    Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
In-Reply-To: <20210922161405.140018-11-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-11-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Skip the sysbus device type per-machine allow-list check before the
> MACHINE_INIT_PHASE_READY phase.
>
> This patch permits adding any sysbus device (it still needs to be
> user_creatable) when using the -preconfig experimental option.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> This commit is RFC. Depending on the condition to allow a device
> to be added, it may change.
> ---
>  softmmu/qdev-monitor.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index f1c9242855..73b991adda 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>
> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> -        /* sysbus devices need to be allowed by the machine */
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> +        phase_check(MACHINE_INIT_PHASE_READY)) {
> +        /*
> +         * Sysbus devices need to be allowed by the machine.
> +         * We only check that after the machine is ready in order to let
> +         * us add any user_creatable sysbus device during machine creation.
> +         */
>          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
>              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "

Since now you are adding the state of the machine creation in the
valiation condition, the failure error message becomes misleading.
Better to do this I think :

if (object class is TYPE_SYS_BUS_DEVICE)
{
  if (!phase_check(MACHINE_INIT_PHASE_READY))
    {
      // error out here saying the state of the machine creation is too
early
    }

    // do the other check on dynamic sysbus

}


