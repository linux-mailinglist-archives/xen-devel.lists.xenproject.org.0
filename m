Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF52415C50
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193681.345017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTML5-0000iZ-5u; Thu, 23 Sep 2021 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193681.345017; Thu, 23 Sep 2021 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTML5-0000fk-2M; Thu, 23 Sep 2021 10:52:27 +0000
Received: by outflank-mailman (input) for mailman id 193681;
 Thu, 23 Sep 2021 10:51:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZpLY=ON=anisinha.ca=ani@srs-us1.protection.inumbo.net>)
 id 1mTMK4-0000Eq-KF
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:51:24 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11461a33-4c5f-4c4b-b0b0-1094f814d6d0;
 Thu, 23 Sep 2021 10:51:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id y1so3720435plk.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 03:51:23 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id e13sm5257765pfi.210.2021.09.23.03.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 03:51:21 -0700 (PDT)
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
X-Inumbo-ID: 11461a33-4c5f-4c4b-b0b0-1094f814d6d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
        b=UwDv30mJvlcUbc5vsqv5ShtJ3oE0rdWz5cuSzKVT1VMx7oOAhptBwIZn+62mHKdIda
         CcTYo+EH+KpGcDyZdaNnrJToFa4sWqSUcsxSlx9OQMQwM6QNX2Bww7OSG0RQXXbD3De5
         /pWCE/0WJrdF+Yon0++dBCaOxfyz5xkXytI1DQ+bx6EBoEMTn9XJoS68bJ+H7GOwtgB8
         qoSCK6s0PZy1TP/XYoD8RYoHjlNP3fM2zc0dTANnUrIbLemr+exTR/fR3LouYTH11512
         q0A2gT3vXM5gNC++K3kAcqiW6ZU/MP54Ed6BdACd1DXgZye8fizrfC83ybMpvRifxhXA
         lPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
        b=VXIpjNXwcQ4dC8pW25Ecqfz+r5N47avqQvSKRZwqj+8qRBdQYGKcgfs4WpxqrQFOR1
         nb6pAux0UA7DBrH8Y8ysGR1GLDgRNrQ8zw/3FMtLgp+TiFT7HjXBgf3VgQ3FoV9Ywps1
         Ddez/dtmi2FxiI1QmHiyEQWGkPvzHqnGK2iUDjfBTDhUWylwhFfLAckeMrTd0ZvBsKoE
         yOst9ZZAwLM3r7YgrzBh/w2LDhpNIaHqxtj/DHYaFyeWrzb4GAbIWqrHyJ/WIF3yB2k8
         J5GrpbDNQIEAQSbj8EyZfVceu1EBbOvQuzqcqK5RnVkq7Pitql+fY6iYZmaUPxoBwoni
         sufg==
X-Gm-Message-State: AOAM5339eKGXUUwHByCHSTAfQJWFRVtz2hKmpSuVD4m6mRZefRAfHDqr
	u1ZVUwN1iEuRNnvHFmmCLtutVg==
X-Google-Smtp-Source: ABdhPJzia+90/vmutfv9+OVhfiSOiEAHqZONBLVWc1gCXXoo34eh7DSYhO2/LLO7Y/O8VFiKodZgxw==
X-Received: by 2002:a17:90b:4d8f:: with SMTP id oj15mr4553491pjb.13.1632394282429;
        Thu, 23 Sep 2021 03:51:22 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:21:11 +0530 (IST)
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
Subject: Re: [RFC PATCH v2 07/16] hw/core/machine: add
 machine_class_is_dynamic_sysbus_dev_allowed
In-Reply-To: <20210922161405.140018-8-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231559230.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com> <20210922161405.140018-8-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Right now the allowance check for adding a sysbus device using
> -device cli option (or device_add qmp command) is done well after
> the device has been created. It is done during the machine init done
> notifier: machine_init_notify() in hw/core/machine.c
>
> This new function will allow us to check if a sysbus device type is
> allowed to be dynamically created by the machine during the device
> creation time.
>
> Also make device_is_dynamic_sysbus() use the new function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> In the context of our series, we need to be able to do the check at
> device creation time to allow doing it depending on the current
> MACHINE_INIT phase.
> ---
>  include/hw/boards.h | 17 +++++++++++++++++
>  hw/core/machine.c   | 15 ++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 463a5514f9..934443c1cd 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
>   */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>
> +/**
> + * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
> + * sysbus device type for the machine class.
> + * @mc: Machine class
> + * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + *
> + * Returns: true if @type is a type in the machine's list of
> + * dynamically pluggable sysbus devices; otherwise false.
> + *
> + * Check if the QOM type @type is in the list of allowed sysbus device
> + * types (see machine_class_allowed_dynamic_sysbus_dev()).
> + * Note that if @type is a subtype of a type which is in the list, it is
> + * allowed too.
> + */
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type);
> +

How about renaming this to device_type_is_allowed_dynamic_sysbus() ?

>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
>   * @mc: Machine class
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9125c9aad0..1a18912dc8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>
>  bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>  {
> -    bool allowed = false;
> -    strList *wl;
>      Object *obj = OBJECT(dev);
>
>      if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
>          return false;
>      }
>
> +    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
> +            object_get_typename(obj));
> +}
> +
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type)
> +{
> +    bool allowed = false;
> +    strList *wl;
> +    ObjectClass *klass = object_class_by_name(type);
> +
>      for (wl = mc->allowed_dynamic_sysbus_devices;
>           !allowed && wl;
>           wl = wl->next) {
> -        allowed |= !!object_dynamic_cast(obj, wl->value);
> +        allowed |= !!object_class_dynamic_cast(klass, wl->value);
>      }
>
>      return allowed;
> --
> 2.33.0
>
>

