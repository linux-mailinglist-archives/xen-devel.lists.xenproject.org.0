Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4310204801
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 05:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnZo5-0007Tl-SJ; Tue, 23 Jun 2020 03:41:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3ot=AE=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jnZo4-0007Td-OB
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 03:41:08 +0000
X-Inumbo-ID: 5f25dfb0-b503-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f25dfb0-b503-11ea-b7bb-bc764e2007e4;
 Tue, 23 Jun 2020 03:41:08 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id i27so21708972ljb.12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2020 20:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g780v6WnLYQ1QZQRWq+6mQKK2XsAf/u1xfSFw0Z6JFs=;
 b=nkO5PKTHb8KutOobp7Hgg+WgOCYi/XoTF9/3Vxe5VfF8NFti+41Pbu/33yI+D8AQsq
 Ky9jOYjaj1wJff8Skb2LVhjnLwjyOwRsnOUvotHAXYRKjTCiHmIX9wn4jCAksbtjIdTI
 58vdQCHRAVYOmMvccfsH9inZ2nczLKA7q2rbGBJXGFqkrkecCToCo25wfPFefpORLBl6
 JS3sRSuX6u/92iF1QgVsQwiWvLFpR5rX4wdzG/TcZ8fL2fKLgyEkNx5UrTPAYTC00oNx
 Iede+FD2k91tVb53kUAVjYO9dajw6a5TtNiTIfbLa8tBAMCeQE+vMbS567v9CzUXNNtX
 MnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g780v6WnLYQ1QZQRWq+6mQKK2XsAf/u1xfSFw0Z6JFs=;
 b=TUWhsb1wWE9ar0UMk2RVImiIwhQAkgtAa6pu2TIcexxCuTdm5FMaeKvfAssCMNNIAN
 HAIegPf11wn4IumY43Xo/u3C9DO3ZsZY8qO5wVLPnUfvZ3EK+ivDyqXBd2wF6+Kd07W7
 gU4nRjLTKOvmofO02RDvrF8TYhEcqjoaROXJ/5D/zQ2qkRMAPEby9FKbcMV3zLBW6mRf
 gxk07IseXPp3EZnnnrpiRqC3dYm8ut4v61n1QUJAj2/yH/aD5BykL3iFdlSrs8kb2y4c
 vx0ecIIdAkj3oFE0dqtC3ZUwGGp8TrvuW5HHiCxXHFcLYtSFm9Cnt4eOnkqNV9DDijgx
 NzrA==
X-Gm-Message-State: AOAM531WlQ6QrmXmk5wD6w8elED04BHqy5ToxUzSgWgxqDlnpJnXXEF7
 zDF/GDBRB06Q4BzX6tdFl7TiNR/buSZAeyALYSE=
X-Google-Smtp-Source: ABdhPJyBZV5fmqperXCFj6v08Ebo6e6nCRkDfnitOFhxpl87pM0Cj79N1j1ptSWGuTMvlschI12cqgk9yx9AUkKiFyY=
X-Received: by 2002:a2e:9141:: with SMTP id q1mr9666796ljg.196.1592883666790; 
 Mon, 22 Jun 2020 20:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
In-Reply-To: <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 Jun 2020 23:40:55 -0400
Message-ID: <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
Subject: Re: sysbus failed assert for xen_sysdev
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
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
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 22, 2020 at 5:17 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 22/06/2020 21:33, Jason Andryuk wrote:
>
> > Hi,
> >
> > Running qemu devel for a Xen VM is failing an assert after the recent
> > "qdev: Rework how we plug into the parent bus" sysbus changes.
> >
> > qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> > `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> > failed.
> >
> > dc->bus_type is "xen-sysbus" and it's the
> > `object_dynamic_cast(OBJECT(bus), dc->bus_type)` portion that fails
> > the assert.  bus seems to be "main-system-bus", I think:
> > (gdb) p *bus
> > $3 = {obj = {class = 0x55555636d780, free = 0x7ffff7c40db0 <g_free>,
> > properties = 0x5555563f7180, ref = 3, parent = 0x5555563fe980}, parent
> > = 0x0, name = 0x5555563fec60 "main-system-bus", ...
> >
> > The call comes from hw/xen/xen-legacy-backend.c:706
> > sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
> >
> > Any pointers on what needs to be fixed?
>
> Hi Jason,
>
> My understanding is that the assert() is telling you that you're plugging a
> TYPE_SYS_BUS_DEVICE into a bus that isn't derived from TYPE_SYSTEM_BUS. A quick look
> at the file in question suggests that you could try changing the parent class of
> TYPE_XENSYSBUS from TYPE_BUS to TYPE_SYSTEM_BUS to see if that helps?

Hi, Mark.

Thanks, but unfortunately changing xensysbus_info .parent does not
stop the assert.  But it kinda pointed me in the right direction.

xen-sysdev overrode the bus_type which was breaking sysbus_realize.
So drop that:

--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -824,7 +825,7 @@ static void xen_sysdev_class_init(ObjectClass
*klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);

     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
+    //dc->bus_type = TYPE_XENSYSBUS;
 }

 static const TypeInfo xensysdev_info = {

Then I had a different instance of the failed assert trying to attach
xen-console-0 to xen-sysbus.  So I made this change:
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,6 +789,7 @@ static void xendev_class_init(ObjectClass *klass,
void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }

 static const TypeInfo xendev_type_info = {

Then it gets farther... until
qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
Assertion `dev->realized' failed.

dev->id is NULL. The failing device is:
(gdb) p *dev.parent_obj.class.type
$12 = {name = 0x555556207770 "cfi.pflash01",

Is that right?

I'm going to have to take a break from this now.

Regards,
Jason

