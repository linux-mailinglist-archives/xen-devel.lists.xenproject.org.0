Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C9205114
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 13:47:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnhO6-0002Kf-HH; Tue, 23 Jun 2020 11:46:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8LJ6=AE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jnhO4-0002KA-O6
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 11:46:48 +0000
X-Inumbo-ID: 357e1652-b547-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 357e1652-b547-11ea-bca7-bc764e2007e4;
 Tue, 23 Jun 2020 11:46:43 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s10so231442wrw.12
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=nsQo9i+/CJZ1DjKvgOB2w05FjU4Aq8s2SwHPXUXQPgg=;
 b=MsCHTOexjRjW5Ra2id6IrAIs6x9apeOs3pvM6wBIOHmz9Bgvyb8N1EPeY/+7fpJEXd
 VgUKeiIytfAdKBBWU5C4gcQM8aSsV/8eSah2xD9oH8APwTceIVf5ivgk/gU7jvTn74u3
 6YLi7ONi+eYQqTneyarVhpL+pWjT50sCSN7gaurewdm/2rEzLVKt+kgAk7rBnGG5imW2
 703G9g5mp5bvUzLgSQxUElSefDOkrwYmMFapCRIKwFK6275ZUIQc6KACxJRODgQ3Jsgi
 /gOAEmvB8xiOa+DMAvvHDQTfMnua06XyOrlJ1tpgG6v6161+dDDIcxPIX2q2IBziY7rn
 43vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=nsQo9i+/CJZ1DjKvgOB2w05FjU4Aq8s2SwHPXUXQPgg=;
 b=swS8vrCJBEeHp1digdDBsMW0/aF/c6IdcSkDYhkHF7DKE03rKF01KNa06EFmeaUFI1
 J4sP0YyWUDPOfBje1hiM1JMBny4GXNCQFPc3UchSJO7YVibHGnX1SbFvmjAoo38HMvEf
 7qmyPrg/cJqCt/t+NtTBbQYJaE8mJsiAiQM4gU+3KEc/5Jrlkpnyc738oZav8slqmSkl
 asa1k7KD2kMAiDVLAD0SN+B1Fq7alKqp0KIcY1q1Ktmz3VhhghHUGrCGjxU2j7XlykFg
 7hHVgtH0wLkzYnmS2tvqwJi3FDdeQ6uagUhC+AsZmYGa7rTDoWa7sU8rzkySIGxFJln6
 wpHQ==
X-Gm-Message-State: AOAM533vAt07221bt9omDbocQ/dCW74wWXU7yUJpmZW2mkTIT9eLpvSy
 d7mVtSpH2lEsDtxhvCA7aY4=
X-Google-Smtp-Source: ABdhPJzTJS7wzmG6kPQJ4+HLB04YWNFkLOXYkMd9lBnpM99UXIyjh8ly/AKBuLK5LYE1wp27n2CoFw==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr22003597wrc.344.1592912802849; 
 Tue, 23 Jun 2020 04:46:42 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id z9sm3373507wmi.7.2020.06.23.04.46.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jun 2020 04:46:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Markus Armbruster'" <armbru@redhat.com>,
 "'Jason Andryuk'" <jandryuk@gmail.com>
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>	<ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>	<CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org>
In-Reply-To: <87k0zykwdl.fsf@dusky.pond.sub.org>
Subject: RE: sysbus failed assert for xen_sysdev
Date: Tue, 23 Jun 2020 12:46:41 +0100
Message-ID: <000001d64953$f67a1f00$e36e5d00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIJfv1jP4fCJU6d0eNUL65zTb1lhAKJjZPCAZLY/IEByWeHd6hQeooA
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
Reply-To: paul@xen.org
Cc: 'Anthony PERARD' <anthony.perard@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'QEMU' <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: 23 June 2020 09:41
> To: Jason Andryuk <jandryuk@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD <anthony.perard@citrix.com>; xen-
> devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-devel@nongnu.org>
> Subject: Re: sysbus failed assert for xen_sysdev
> 
> Jason Andryuk <jandryuk@gmail.com> writes:
> 
> > On Mon, Jun 22, 2020 at 5:17 PM Mark Cave-Ayland
> > <mark.cave-ayland@ilande.co.uk> wrote:
> >>
> >> On 22/06/2020 21:33, Jason Andryuk wrote:
> >>
> >> > Hi,
> >> >
> >> > Running qemu devel for a Xen VM is failing an assert after the recent
> >> > "qdev: Rework how we plug into the parent bus" sysbus changes.
> >> >
> >> > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> >> > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> >> > failed.
> >> >
> >> > dc->bus_type is "xen-sysbus" and it's the
> >> > `object_dynamic_cast(OBJECT(bus), dc->bus_type)` portion that fails
> >> > the assert.  bus seems to be "main-system-bus", I think:
> >> > (gdb) p *bus
> >> > $3 = {obj = {class = 0x55555636d780, free = 0x7ffff7c40db0 <g_free>,
> >> > properties = 0x5555563f7180, ref = 3, parent = 0x5555563fe980}, parent
> >> > = 0x0, name = 0x5555563fec60 "main-system-bus", ...
> >> >
> >> > The call comes from hw/xen/xen-legacy-backend.c:706
> >> > sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
> >> >
> >> > Any pointers on what needs to be fixed?
> >>
> >> Hi Jason,
> >>
> >> My understanding is that the assert() is telling you that you're plugging a
> >> TYPE_SYS_BUS_DEVICE into a bus that isn't derived from TYPE_SYSTEM_BUS.
> >> TYPE_SYS_BUS_DEVICE into a bus that isn't derived from TYPE_SYSTEM_BUS. A quick look
> 
> Correct.  Let's review the assertion:
> 
>     assert(dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type));
> 
> Context: we're supposted to plug @dev into @bus, and @dc is @dev's
> DeviceClass.
> 
> The assertion checks that
> 
> 1. @dev plugs into a bus: dc->bus_type
> 
> 2. @bus is an instance of the type of bus @dev plugs into:
>    object_dynamic_cast(OBJECT(bus), dc->bus_type)
> 
> >> at the file in question suggests that you could try changing the parent class of
> >> TYPE_XENSYSBUS from TYPE_BUS to TYPE_SYSTEM_BUS to see if that helps?
> >
> > Hi, Mark.
> >
> > Thanks, but unfortunately changing xensysbus_info .parent does not
> > stop the assert.  But it kinda pointed me in the right direction.
> >
> > xen-sysdev overrode the bus_type which was breaking sysbus_realize.
> > So drop that:
> >
> > --- a/hw/xen/xen-legacy-backend.c
> > +++ b/hw/xen/xen-legacy-backend.c
> > @@ -824,7 +825,7 @@ static void xen_sysdev_class_init(ObjectClass
> > *klass, void *data)
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> >
> >      device_class_set_props(dc, xen_sysdev_properties);
> > -    dc->bus_type = TYPE_XENSYSBUS;
> > +    //dc->bus_type = TYPE_XENSYSBUS;
> >  }
> 
> Uff!
> 
> Let me explain how things are supposed to work.
> 
> Say we have FOO bus (QOM type TYPE_FOO_BUS), with FOO devices plugging
> into it (abstract QOM type TYPE_FOO_DEVICE).  One of them is SOME_FOO
> (concrete QOM type TYPE_SOME_FOO).  Code ties them together like this:
> 
>     static const TypeInfo pci_bus_info = {
>         .name = TYPE_PCI_BUS,
>         .parent = TYPE_BUS,
>         ...
>     };
> 
>     static const TypeInfo foo_device_info = {
>         .name = TYPE_FOO_DEVICE,
>         .parent = TYPE_DEVICE,
>         .abstract = true,
>         .class_init = foo_device_class_init,
>         ...
>     };
> 
>     static void foo_device_class_init(ObjectClass *oc, void *data)
>     {
>         DeviceClass *dc = DEVICE_CLASS(oc);
> 
>         dc->bus_type = TYPE_FOO_BUS;
>         ...
>     }
> 
>     static const TypeInfo some_foo_info = {
>         .name = TYPE_SOME_FOO,
>         .parent = TYPE_FOO_DEVICE,
>         ...
>     };
> 
> When you plug an instance of TYPE_SOME_FOO into a bus, the assertion
> checks that the bus is an instance of TYPE_FOO_BUS.
> 
> Note that subtypes of TYPE_FOO_DEVICE do not mess with dc->bus_type!
> 
> TYPE_XENSYSDEV does mess with it:
> 
>     static void xen_sysdev_class_init(ObjectClass *klass, void *data)
>     {
>         DeviceClass *dc = DEVICE_CLASS(klass);
> 
>         device_class_set_props(dc, xen_sysdev_properties);
>         dc->bus_type = TYPE_XENSYSBUS;
>     }
> 
>     static const TypeInfo xensysdev_info = {
>         .name          = TYPE_XENSYSDEV,
>         .parent        = TYPE_SYS_BUS_DEVICE,
>         .instance_size = sizeof(SysBusDevice),
>         .class_init    = xen_sysdev_class_init,
>     };
> 
> On the one hand, xensysdev_info.parent claims TYPE_XENSYSDEV is a
> TYPE_SYS_BUS_DEVICE (and therefore should plug into a TYPE_SYSTEM_BUS).
> On the other hand, its dc->bus_type is a TYPE_XENSYSBUS, which is *not*
> a subtype of TYPE_SYSTEM_BUS:
> 
>     static const TypeInfo xensysbus_info = {
>         .name       = TYPE_XENSYSBUS,
> --->    .parent     = TYPE_BUS,
>         .class_init = xen_sysbus_class_init,
>         .interfaces = (InterfaceInfo[]) {
>             { TYPE_HOTPLUG_HANDLER },
>             { }
>         }
>     };
> 
> This is an inconsistent mess.
> 
> Are TYPE_XENSYSDEV and TYPE_XENSYSBUS related to TYPE_SYS_BUS_DEVICE and
> TYPE_SYSTEM_BUS?
> 
> If no, then xensysbus_info.parent should not be TYPE_SYS_BUS_DEVICE, and
> you must not pass instances of one kind to functions expecting the other
> kind.
> 
> If yes, how?  If the former are specializations of the latter, consider
> making the former subtypes of the latter.  Both of them.  Then a
> TYPE_XENSYSDEV device can plug into a TYPE_XENSYSBUS bus, but not into a
> TYPE_SYSTEM_BUS bus.
> 
> A TYPE_SYS_BUS_DEVICE could still plug into TYPE_XENSYSBUS, because the
> latter is also an instance of TYPE_SYSTEM_BUS.
> 
> Questions?
> 
> >
> >  static const TypeInfo xensysdev_info = {
> >
> > Then I had a different instance of the failed assert trying to attach
> > xen-console-0 to xen-sysbus.  So I made this change:
> > --- a/hw/xen/xen-legacy-backend.c
> > +++ b/hw/xen/xen-legacy-backend.c
> > @@ -789,6 +789,7 @@ static void xendev_class_init(ObjectClass *klass,
> > void *data)
> >      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> >      /* xen-backend devices can be plugged/unplugged dynamically */
> >      dc->user_creatable = true;
> > +    dc->bus_type = TYPE_XENSYSBUS;
> >  }
> >
> >  static const TypeInfo xendev_type_info = {
> >
> > Then it gets farther... until
> > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > Assertion `dev->realized' failed.
> >
> > dev->id is NULL. The failing device is:
> > (gdb) p *dev.parent_obj.class.type
> > $12 = {name = 0x555556207770 "cfi.pflash01",
> >

Having commented out the call to xen_be_init() entirely (and xen_bus_init() for good measure) I also get this assertion failure, so
I don't think is related.

  Paul



