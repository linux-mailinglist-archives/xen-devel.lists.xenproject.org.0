Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FE2271F0F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 11:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKIHo-0004y6-Nu; Mon, 21 Sep 2020 09:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JyZu=C6=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kKIHm-0004y1-KD
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 09:39:02 +0000
X-Inumbo-ID: f5d86ed2-11c9-4af0-b2e1-d05b12bc36e1
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5d86ed2-11c9-4af0-b2e1-d05b12bc36e1;
 Mon, 21 Sep 2020 09:39:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so11980566wrr.4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VcLJFGG8URWd1OLhephwidSsluPQw+CIfQGJ8Sxq3ic=;
 b=roamqtDLAL5YsZfO9/KR5RG/2ffPLHHOoV9PSohEZHPVt4hKiXU/1zgQ+x+fyYAB2w
 BY0MhNgYdEOdRF2m+z6vf0jc+6gE5uKT2Ylw6kBq6IQ357GoK6ZHettEzHzLc6lVUWsL
 WRdvb96RXC0R0bzWDSjKXcoNTtpXt4EmlQ64nZ5IbNpohCI1FOxpSa8pOzSDwqHjIcnB
 Y7N5TNRI2ZIJzmvY2ofGksl14+rgPb5QtAOc7E827lCmBAA9frdcZs9CE8xqizsa5i1b
 JVBQFTmCSiTD701flUX33w6CZ9lATu2xYIjdD+OoU9pPpo5i1yWN3d0FOptE+JyznPHK
 uPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VcLJFGG8URWd1OLhephwidSsluPQw+CIfQGJ8Sxq3ic=;
 b=j0z3cLLnbJqA+lFI+TSbcodkugzsz2JCBbMT5iGdx6nXrKXgtAyFlvqu51pjjCgMf+
 5YPq1ewnzmvRNazquGqManFGtjApSP9OMIW0O9EzdCT64Z2ZGt//KttwtVFlsieH9K8x
 8FOxc5jxua1PNLoDiPtGw1TwTQj5lDJJpUwdjGxRtnXDaCgxLHF9vpj/WKlCVRjg2LXv
 Yn1ExCFKddm60NLMoi3NXt2C6JtcQxAMcENehvwVy/dKmDSRkVNv17OFK3YK/Bm+8iLM
 77Zqt/RqjaP5kHvZvJ/duQZt1zvZSrKfP//SS6al9sn01927+iUntbV/WbCv0cSgOcou
 4hog==
X-Gm-Message-State: AOAM531BVWGWKyM1SFVjj0nEi97VMIioyOHvjTcjMIFGYXoYA1EP3Kyd
 nZkffIUzQpicDugJ6Z6auTcCuXF/lug=
X-Google-Smtp-Source: ABdhPJwe1po0r5iXHFfUJ6uusPCa0GAmbsUvJteSW+fc+yD8EG5VqjTwYwptFYKGoZiw51N7Y+du0Q==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr6532650wrb.70.1600681140139;
 Mon, 21 Sep 2020 02:39:00 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 91sm21212929wrq.9.2020.09.21.02.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:38:59 -0700 (PDT)
Subject: Re: [PATCH 2/2] qdev: Let BusRealize() return a boolean value to
 indicate error
To: Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200920114416.353277-1-f4bug@amsat.org>
 <20200920114416.353277-3-f4bug@amsat.org> <87eemva6eq.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2ec97e06-8ecb-835f-f6e6-a0bbf8c4dc00@amsat.org>
Date: Mon, 21 Sep 2020 11:38:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87eemva6eq.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 9/21/20 10:19 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Commit 9940b2cfbc0 introduced qdev_realize() and qbus_realize()
>> with the ability to return a boolean value if an error occured,
>> thus the caller does not need to check if the Error* pointer is
>> set.
>> Provide the same ability to the BusRealize type.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/qdev-core.h | 14 +++++++++++++-
>>  hw/hyperv/vmbus.c      |  5 +++--
>>  hw/nubus/nubus-bus.c   |  5 +++--
>>  hw/pci/pci.c           | 12 +++++++++---
>>  hw/xen/xen-bus.c       |  5 +++--
>>  5 files changed, 31 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 02ac1c50b7f..eecfe794a71 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -32,7 +32,19 @@ typedef enum DeviceCategory {
>>  typedef void (*DeviceRealize)(DeviceState *dev, Error **errp);
>>  typedef void (*DeviceUnrealize)(DeviceState *dev);
>>  typedef void (*DeviceReset)(DeviceState *dev);
>> -typedef void (*BusRealize)(BusState *bus, Error **errp);
>> +/**
>> + * BusRealize: Realize @bus.
>> + * @bus: bus to realize
>> + * @errp: pointer to error object
>> + *
>> + * On success, return true.
>> + * On failure, store an error through @errp and return false.
>> + */
>> +typedef bool (*BusRealize)(BusState *bus, Error **errp);
>> +/**
>> + * BusUnrealize: Unrealize @bus.
>> + * @bus: bus to unrealize
>> + */
>>  typedef void (*BusUnrealize)(BusState *bus);
>>  
>>  /**
>> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
>> index 6ef895bc352..8a0452b2464 100644
>> --- a/hw/hyperv/vmbus.c
>> +++ b/hw/hyperv/vmbus.c
>> @@ -2487,7 +2487,7 @@ static const TypeInfo vmbus_dev_type_info = {
>>      .instance_init = vmbus_dev_instance_init,
>>  };
>>  
>> -static void vmbus_realize(BusState *bus, Error **errp)
>> +static bool vmbus_realize(BusState *bus, Error **errp)
>>  {
>>      int ret = 0;
>>      Error *local_err = NULL;
>> @@ -2519,7 +2519,7 @@ static void vmbus_realize(BusState *bus, Error **errp)
>>          goto clear_event_notifier;
>>      }
>>  
>> -    return;
>> +    return true;
>>  
>>  clear_event_notifier:
>>      event_notifier_cleanup(&vmbus->notifier);
>> @@ -2528,6 +2528,7 @@ remove_msg_handler:
>>  error_out:
>>      qemu_mutex_destroy(&vmbus->rx_queue_lock);
>>      error_propagate(errp, local_err);
>> +    return false;
>>  }
>>  
>>  static void vmbus_unrealize(BusState *bus)
>> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
>> index 942a6d5342d..d20d9c0f72c 100644
>> --- a/hw/nubus/nubus-bus.c
>> +++ b/hw/nubus/nubus-bus.c
>> @@ -65,12 +65,13 @@ static const MemoryRegionOps nubus_super_slot_ops = {
>>      },
>>  };
>>  
>> -static void nubus_realize(BusState *bus, Error **errp)
>> +static bool nubus_realize(BusState *bus, Error **errp)
>>  {
>>      if (!nubus_find()) {
>>          error_setg(errp, "at most one %s device is permitted", TYPE_NUBUS_BUS);
>> -        return;
>> +        return false;
>>      }
>> +    return true;
>>  }
>>  
>>  static void nubus_init(Object *obj)
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index de0fae10ab9..f535ebac847 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -115,7 +115,7 @@ static void pcibus_machine_done(Notifier *notifier, void *data)
>>      }
>>  }
>>  
>> -static void pci_bus_realize(BusState *qbus, Error **errp)
>> +static bool pci_bus_realize(BusState *qbus, Error **errp)
>>  {
>>      PCIBus *bus = PCI_BUS(qbus);
>>  
>> @@ -123,13 +123,17 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
>>      qemu_add_machine_init_done_notifier(&bus->machine_done);
>>  
>>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_pcibus, bus);
>> +
>> +    return true;
>>  }
>>  
>> -static void pcie_bus_realize(BusState *qbus, Error **errp)
>> +static bool pcie_bus_realize(BusState *qbus, Error **errp)
>>  {
>>      PCIBus *bus = PCI_BUS(qbus);
>>  
>> -    pci_bus_realize(qbus, errp);
>> +    if (!pci_bus_realize(qbus, errp)) {
>> +        return false;
>> +    }
> 
> We now update bus->flags only when pci_bus_realize() succeeds.  Is this
> a bug fix?

Fortunate side effect :) I'll let the PCI maintainers
have a look at it.

> 
>>  
>>      /*
>>       * A PCI-E bus can support extended config space if it's the root
>> @@ -144,6 +148,8 @@ static void pcie_bus_realize(BusState *qbus, Error **errp)
>>              bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>>          }
>>      }
>> +
>> +    return true;
>>  }
>>  
>>  static void pci_bus_unrealize(BusState *qbus)
>> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
>> index 9ce1c9540b9..d7ef5d05e37 100644
>> --- a/hw/xen/xen-bus.c
>> +++ b/hw/xen/xen-bus.c
>> @@ -444,7 +444,7 @@ static void xen_bus_unrealize(BusState *bus)
>>      }
>>  }
>>  
>> -static void xen_bus_realize(BusState *bus, Error **errp)
>> +static bool xen_bus_realize(BusState *bus, Error **errp)
>>  {
>>      XenBus *xenbus = XEN_BUS(bus);
>>      unsigned int domid;
>> @@ -478,10 +478,11 @@ static void xen_bus_realize(BusState *bus, Error **errp)
>>                            "failed to set up enumeration watch: ");
>>      }
>>  
>> -    return;
>> +    return true;
>>  
>>  fail:
>>      xen_bus_unrealize(bus);
>> +    return false;
>>  }
>>  
>>  static void xen_bus_unplug_request(HotplugHandler *hotplug,
> 
> I can't see an actual use of the new return value.  Am I blind?

You aren't, I'm trying to make a 240 patches series digestible
by splitting it. One device is a (hotplug) PCIe bridge, as we
can plug/unplug it, this calls multiple realize/unrealize, and
I want to be sure the children objects are properly realized
so I care about this return value.

As it seems an improvement from an API PoV (following your recent
cleanup and code style change: simplify returning boolean for Error
instead of checking *errp is set). I thought merging it the sooner
is better, but I don't have problem reposting that later.

Regards,

Phil.

