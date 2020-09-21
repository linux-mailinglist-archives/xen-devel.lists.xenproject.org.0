Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00222272471
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 14:59:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKLPV-00072P-Sc; Mon, 21 Sep 2020 12:59:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=acSb=C6=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1kKLPT-00072J-Ss
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 12:59:12 +0000
X-Inumbo-ID: 2aeb924c-ee33-4b90-b953-d0ac022f666c
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2aeb924c-ee33-4b90-b953-d0ac022f666c;
 Mon, 21 Sep 2020 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600693150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSUwyN0CWQnN7lLzNS+YDaUrhEPCdv0WTGPjEl87oOE=;
 b=J3jwwy32VEbcGohFb9Nrv6M15FnbLqnVGU6HX9jX4QEMk+L/qlJ0hiEoxplv1qseIJu6AP
 lcijogaFyCYqlws/Ndpn6VIhwp8KHHt0roUZ3HfCwb7FRsGHop3JNB0qjThrgo1JEkE/Hs
 rBiMpL7PhUpummbNucfRNO6oHI1vXuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-Ldi1DWPzPuatLwc9yqMLrw-1; Mon, 21 Sep 2020 08:59:06 -0400
X-MC-Unique: Ldi1DWPzPuatLwc9yqMLrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D9FE425E0;
 Mon, 21 Sep 2020 12:59:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA7C55785;
 Mon, 21 Sep 2020 12:59:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5457E1132E9A; Mon, 21 Sep 2020 14:58:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,  Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org,  Laurent Vivier <laurent@vivier.eu>,
 xen-devel@lists.xenproject.org,  Anthony Perard
 <anthony.perard@citrix.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to
 indicate error
References: <20200920114416.353277-1-f4bug@amsat.org>
 <20200920114416.353277-3-f4bug@amsat.org>
 <87eemva6eq.fsf@dusky.pond.sub.org>
 <2ec97e06-8ecb-835f-f6e6-a0bbf8c4dc00@amsat.org>
Date: Mon, 21 Sep 2020 14:58:59 +0200
In-Reply-To: <2ec97e06-8ecb-835f-f6e6-a0bbf8c4dc00@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 21 Sep 2020 11:38:57
 +0200")
Message-ID: <87k0wn4770.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 9/21/20 10:19 AM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> Commit 9940b2cfbc0 introduced qdev_realize() and qbus_realize()
>>> with the ability to return a boolean value if an error occured,
>>> thus the caller does not need to check if the Error* pointer is
>>> set.
>>> Provide the same ability to the BusRealize type.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  include/hw/qdev-core.h | 14 +++++++++++++-
>>>  hw/hyperv/vmbus.c      |  5 +++--
>>>  hw/nubus/nubus-bus.c   |  5 +++--
>>>  hw/pci/pci.c           | 12 +++++++++---
>>>  hw/xen/xen-bus.c       |  5 +++--
>>>  5 files changed, 31 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index 02ac1c50b7f..eecfe794a71 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -32,7 +32,19 @@ typedef enum DeviceCategory {
>>>  typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
>>>  typedef void (*DeviceUnrealize)(DeviceState *dev);
>>>  typedef void (*DeviceReset)(DeviceState *dev);
>>> -typedef void (*BusRealize)(BusState *bus, Error **errp);
>>> +/**
>>> + * BusRealize: Realize @bus.
>>> + * @bus: bus to realize
>>> + * @errp: pointer to error object
>>> + *
>>> + * On success, return true.
>>> + * On failure, store an error through @errp and return false.
>>> + */
>>> +typedef bool (*BusRealize)(BusState *bus, Error **errp);
>>> +/**
>>> + * BusUnrealize: Unrealize @bus.
>>> + * @bus: bus to unrealize
>>> + */
>>>  typedef void (*BusUnrealize)(BusState *bus);
>>> =20
>>>  /**
>>> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
>>> index 6ef895bc352..8a0452b2464 100644
>>> --- a/hw/hyperv/vmbus.c
>>> +++ b/hw/hyperv/vmbus.c
>>> @@ -2487,7 +2487,7 @@ static const TypeInfo vmbus_dev_type_info =3D {
>>>      .instance_init =3D vmbus_dev_instance_init,
>>>  };
>>> =20
>>> -static void vmbus_realize(BusState *bus, Error **errp)
>>> +static bool vmbus_realize(BusState *bus, Error **errp)
>>>  {
>>>      int ret =3D 0;
>>>      Error *local_err =3D NULL;
>>> @@ -2519,7 +2519,7 @@ static void vmbus_realize(BusState *bus, Error **=
errp)
>>>          goto clear_event_notifier;
>>>      }
>>> =20
>>> -    return;
>>> +    return true;
>>> =20
>>>  clear_event_notifier:
>>>      event_notifier_cleanup(&vmbus->notifier);
>>> @@ -2528,6 +2528,7 @@ remove_msg_handler:
>>>  error_out:
>>>      qemu_mutex_destroy(&vmbus->rx_queue_lock);
>>>      error_propagate(errp, local_err);
>>> +    return false;
>>>  }
>>> =20
>>>  static void vmbus_unrealize(BusState *bus)
>>> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
>>> index 942a6d5342d..d20d9c0f72c 100644
>>> --- a/hw/nubus/nubus-bus.c
>>> +++ b/hw/nubus/nubus-bus.c
>>> @@ -65,12 +65,13 @@ static const MemoryRegionOps nubus_super_slot_ops =
=3D {
>>>      },
>>>  };
>>> =20
>>> -static void nubus_realize(BusState *bus, Error **errp)
>>> +static bool nubus_realize(BusState *bus, Error **errp)
>>>  {
>>>      if (!nubus_find()) {
>>>          error_setg(errp, "at most one %s device is permitted", TYPE_NU=
BUS_BUS);
>>> -        return;
>>> +        return false;
>>>      }
>>> +    return true;
>>>  }
>>> =20
>>>  static void nubus_init(Object *obj)
>>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>>> index de0fae10ab9..f535ebac847 100644
>>> --- a/hw/pci/pci.c
>>> +++ b/hw/pci/pci.c
>>> @@ -115,7 +115,7 @@ static void pcibus_machine_done(Notifier *notifier,=
 void *data)
>>>      }
>>>  }
>>> =20
>>> -static void pci_bus_realize(BusState *qbus, Error **errp)
>>> +static bool pci_bus_realize(BusState *qbus, Error **errp)
>>>  {
>>>      PCIBus *bus =3D PCI_BUS(qbus);
>>> =20
>>> @@ -123,13 +123,17 @@ static void pci_bus_realize(BusState *qbus, Error=
 **errp)
>>>      qemu_add_machine_init_done_notifier(&bus->machine_done);
>>> =20
>>>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_pcibus, b=
us);
>>> +
>>> +    return true;
>>>  }
>>> =20
>>> -static void pcie_bus_realize(BusState *qbus, Error **errp)
>>> +static bool pcie_bus_realize(BusState *qbus, Error **errp)
>>>  {
>>>      PCIBus *bus =3D PCI_BUS(qbus);
>>> =20
>>> -    pci_bus_realize(qbus, errp);
>>> +    if (!pci_bus_realize(qbus, errp)) {
>>> +        return false;
>>> +    }
>>=20
>> We now update bus->flags only when pci_bus_realize() succeeds.  Is this
>> a bug fix?
>
> Fortunate side effect :) I'll let the PCI maintainers
> have a look at it.

If it's an observable change, the commit message must mention it.  I'd
put it in its own commit then.

Even if it's not observable, explaining why in the commit message would
help, I think.

>>=20
>>> =20
>>>      /*
>>>       * A PCI-E bus can support extended config space if it's the root
>>> @@ -144,6 +148,8 @@ static void pcie_bus_realize(BusState *qbus, Error =
**errp)
>>>              bus->flags |=3D PCI_BUS_EXTENDED_CONFIG_SPACE;
>>>          }
>>>      }
>>> +
>>> +    return true;
>>>  }
>>> =20
>>>  static void pci_bus_unrealize(BusState *qbus)
>>> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
>>> index 9ce1c9540b9..d7ef5d05e37 100644
>>> --- a/hw/xen/xen-bus.c
>>> +++ b/hw/xen/xen-bus.c
>>> @@ -444,7 +444,7 @@ static void xen_bus_unrealize(BusState *bus)
>>>      }
>>>  }
>>> =20
>>> -static void xen_bus_realize(BusState *bus, Error **errp)
>>> +static bool xen_bus_realize(BusState *bus, Error **errp)
>>>  {
>>>      XenBus *xenbus =3D XEN_BUS(bus);
>>>      unsigned int domid;
>>> @@ -478,10 +478,11 @@ static void xen_bus_realize(BusState *bus, Error =
**errp)
>>>                            "failed to set up enumeration watch: ");
>>>      }
>>> =20
>>> -    return;
>>> +    return true;
>>> =20
>>>  fail:
>>>      xen_bus_unrealize(bus);
>>> +    return false;
>>>  }
>>> =20
>>>  static void xen_bus_unplug_request(HotplugHandler *hotplug,
>>=20
>> I can't see an actual use of the new return value.  Am I blind?
>
> You aren't, I'm trying to make a 240 patches series digestible
> by splitting it. One device is a (hotplug) PCIe bridge, as we
> can plug/unplug it, this calls multiple realize/unrealize, and
> I want to be sure the children objects are properly realized
> so I care about this return value.

I wonder why you need to realize buses.  Current code only ever does
that via device_set_realized() -> qbus_realize() ->
object_property_set_bool() -> bus_set_realized(), i.e. when realizing
the device that provides the bus.

Even if you do need to, why can't you call qbus_realize()?  It already
returns true on success, false on failure.

> As it seems an improvement from an API PoV (following your recent
> cleanup and code style change: simplify returning boolean for Error
> instead of checking *errp is set). I thought merging it the sooner
> is better, but I don't have problem reposting that later.

Reviewing API improvements is always hard when we can't see the users,
yet.


