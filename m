Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F1204CB1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 10:41:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jneUM-0002Fq-Hw; Tue, 23 Jun 2020 08:41:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dkd8=AE=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jneUK-0002Fl-Fr
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 08:41:04 +0000
X-Inumbo-ID: 456f99a6-b52d-11ea-bb8b-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 456f99a6-b52d-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592901662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sl2aLIMZTkMUzz73gxGV+eU20yHtpI0l7eAFEJS0YFk=;
 b=COBX1rmpPnA1BdjXpklHaM0iKhWir8BJXJaGMVXTKjlBHsiEMi3UYwjutoqjhFFrss1Ro/
 L1ZQbb1/ULVHOTXHvidogSjqDMoGWxKHaw8mwoXfryFm8uKxM88NNaiFLTS/TcFndQH27b
 qmQBWPsYVwD++iCu9/qt6zqOZNwxKjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-YRIQTpICPz27ImUjIsSi6g-1; Tue, 23 Jun 2020 04:40:58 -0400
X-MC-Unique: YRIQTpICPz27ImUjIsSi6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8018035A8;
 Tue, 23 Jun 2020 08:40:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2F91002391;
 Tue, 23 Jun 2020 08:40:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E6694113846D; Tue, 23 Jun 2020 10:40:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: sysbus failed assert for xen_sysdev
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
Date: Tue, 23 Jun 2020 10:40:54 +0200
In-Reply-To: <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 (Jason Andryuk's message of "Mon, 22 Jun 2020 23:40:55 -0400")
Message-ID: <87k0zykwdl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, QEMU <qemu-devel@nongnu.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk <jandryuk@gmail.com> writes:

> On Mon, Jun 22, 2020 at 5:17 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 22/06/2020 21:33, Jason Andryuk wrote:
>>
>> > Hi,
>> >
>> > Running qemu devel for a Xen VM is failing an assert after the recent
>> > "qdev: Rework how we plug into the parent bus" sysbus changes.
>> >
>> > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
>> > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
>> > failed.
>> >
>> > dc->bus_type is "xen-sysbus" and it's the
>> > `object_dynamic_cast(OBJECT(bus), dc->bus_type)` portion that fails
>> > the assert.  bus seems to be "main-system-bus", I think:
>> > (gdb) p *bus
>> > $3 = {obj = {class = 0x55555636d780, free = 0x7ffff7c40db0 <g_free>,
>> > properties = 0x5555563f7180, ref = 3, parent = 0x5555563fe980}, parent
>> > = 0x0, name = 0x5555563fec60 "main-system-bus", ...
>> >
>> > The call comes from hw/xen/xen-legacy-backend.c:706
>> > sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
>> >
>> > Any pointers on what needs to be fixed?
>>
>> Hi Jason,
>>
>> My understanding is that the assert() is telling you that you're plugging a
>> TYPE_SYS_BUS_DEVICE into a bus that isn't derived from TYPE_SYSTEM_BUS.
>> TYPE_SYS_BUS_DEVICE into a bus that isn't derived from TYPE_SYSTEM_BUS. A quick look

Correct.  Let's review the assertion:

    assert(dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type));

Context: we're supposted to plug @dev into @bus, and @dc is @dev's
DeviceClass.

The assertion checks that

1. @dev plugs into a bus: dc->bus_type

2. @bus is an instance of the type of bus @dev plugs into:
   object_dynamic_cast(OBJECT(bus), dc->bus_type)

>> at the file in question suggests that you could try changing the parent class of
>> TYPE_XENSYSBUS from TYPE_BUS to TYPE_SYSTEM_BUS to see if that helps?
>
> Hi, Mark.
>
> Thanks, but unfortunately changing xensysbus_info .parent does not
> stop the assert.  But it kinda pointed me in the right direction.
>
> xen-sysdev overrode the bus_type which was breaking sysbus_realize.
> So drop that:
>
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -824,7 +825,7 @@ static void xen_sysdev_class_init(ObjectClass
> *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
>      device_class_set_props(dc, xen_sysdev_properties);
> -    dc->bus_type = TYPE_XENSYSBUS;
> +    //dc->bus_type = TYPE_XENSYSBUS;
>  }

Uff!

Let me explain how things are supposed to work.

Say we have FOO bus (QOM type TYPE_FOO_BUS), with FOO devices plugging
into it (abstract QOM type TYPE_FOO_DEVICE).  One of them is SOME_FOO
(concrete QOM type TYPE_SOME_FOO).  Code ties them together like this:

    static const TypeInfo pci_bus_info = {
        .name = TYPE_PCI_BUS,
        .parent = TYPE_BUS,
        ...
    };

    static const TypeInfo foo_device_info = {
        .name = TYPE_FOO_DEVICE,
        .parent = TYPE_DEVICE,
        .abstract = true,
        .class_init = foo_device_class_init,
        ...
    };

    static void foo_device_class_init(ObjectClass *oc, void *data)
    {
        DeviceClass *dc = DEVICE_CLASS(oc);

        dc->bus_type = TYPE_FOO_BUS;
        ...
    }

    static const TypeInfo some_foo_info = {
        .name = TYPE_SOME_FOO,
        .parent = TYPE_FOO_DEVICE,
        ...
    };

When you plug an instance of TYPE_SOME_FOO into a bus, the assertion
checks that the bus is an instance of TYPE_FOO_BUS.

Note that subtypes of TYPE_FOO_DEVICE do not mess with dc->bus_type!

TYPE_XENSYSDEV does mess with it:

    static void xen_sysdev_class_init(ObjectClass *klass, void *data)
    {
        DeviceClass *dc = DEVICE_CLASS(klass);

        device_class_set_props(dc, xen_sysdev_properties);
        dc->bus_type = TYPE_XENSYSBUS;
    }

    static const TypeInfo xensysdev_info = {
        .name          = TYPE_XENSYSDEV,
        .parent        = TYPE_SYS_BUS_DEVICE,
        .instance_size = sizeof(SysBusDevice),
        .class_init    = xen_sysdev_class_init,
    };

On the one hand, xensysdev_info.parent claims TYPE_XENSYSDEV is a
TYPE_SYS_BUS_DEVICE (and therefore should plug into a TYPE_SYSTEM_BUS).
On the other hand, its dc->bus_type is a TYPE_XENSYSBUS, which is *not*
a subtype of TYPE_SYSTEM_BUS:

    static const TypeInfo xensysbus_info = {
        .name       = TYPE_XENSYSBUS,
--->    .parent     = TYPE_BUS,
        .class_init = xen_sysbus_class_init,
        .interfaces = (InterfaceInfo[]) {
            { TYPE_HOTPLUG_HANDLER },
            { }
        }
    };

This is an inconsistent mess.

Are TYPE_XENSYSDEV and TYPE_XENSYSBUS related to TYPE_SYS_BUS_DEVICE and
TYPE_SYSTEM_BUS?

If no, then xensysbus_info.parent should not be TYPE_SYS_BUS_DEVICE, and
you must not pass instances of one kind to functions expecting the other
kind.

If yes, how?  If the former are specializations of the latter, consider
making the former subtypes of the latter.  Both of them.  Then a
TYPE_XENSYSDEV device can plug into a TYPE_XENSYSBUS bus, but not into a
TYPE_SYSTEM_BUS bus.

A TYPE_SYS_BUS_DEVICE could still plug into TYPE_XENSYSBUS, because the
latter is also an instance of TYPE_SYSTEM_BUS.

Questions?

>
>  static const TypeInfo xensysdev_info = {
>
> Then I had a different instance of the failed assert trying to attach
> xen-console-0 to xen-sysbus.  So I made this change:
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -789,6 +789,7 @@ static void xendev_class_init(ObjectClass *klass,
> void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      /* xen-backend devices can be plugged/unplugged dynamically */
>      dc->user_creatable = true;
> +    dc->bus_type = TYPE_XENSYSBUS;
>  }
>
>  static const TypeInfo xendev_type_info = {
>
> Then it gets farther... until
> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> Assertion `dev->realized' failed.
>
> dev->id is NULL. The failing device is:
> (gdb) p *dev.parent_obj.class.type
> $12 = {name = 0x555556207770 "cfi.pflash01",
>
> Is that right?
>
> I'm going to have to take a break from this now.
>
> Regards,
> Jason


