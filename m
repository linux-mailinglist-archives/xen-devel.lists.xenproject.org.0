Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B8B204206
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 22:34:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnT87-0008Ii-Gl; Mon, 22 Jun 2020 20:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0aP=AD=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jnT86-0008Id-DO
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 20:33:22 +0000
X-Inumbo-ID: 9ca6235e-b4c7-11ea-8496-bc764e2007e4
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ca6235e-b4c7-11ea-8496-bc764e2007e4;
 Mon, 22 Jun 2020 20:33:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id m26so10401938lfo.13
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2020 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4mVoyL2zNAqGyZ2Atn/eutyBqxa/yw21nCBslNZLJdY=;
 b=suJxtYlckZvugRErHhopXGyvzHiGcRVutgVuU6LAyvY5obkxUo9d5YvFy2FH6VIf+h
 6HUb42wgZ9QVWgySM7Y2/kfUMqHeB99U7nuJHiK1dFjpvtL7T9+xa1eqUAZVwV3tPIob
 KEVlQGduAdP++XpMZjmet+dd26ipYaZq4jDWQ4rdIoHYMIJn/Cp0crgb9HOjLUjTWAOU
 TLeMeJp3dGAHXRoBvEaNLvMDr1h5U7NBrakXkg95GIrxpgkdp4MSnJ/xV2pHgz2o4zol
 HC0+/9s+rMPJqs2yzYPVGEr0y3VCyFqgcMUypdonGwGLKarw5Kb5Q5qqtkzV2k2r8SAe
 paAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4mVoyL2zNAqGyZ2Atn/eutyBqxa/yw21nCBslNZLJdY=;
 b=l9WJrqqILuyMiIE+WLQ6bOibcRduDtkAadzyr3LgrRiJ/+/cCDYDgl2pOdxqh1Qu90
 bMzZqH7er2VQhUAcjB+cq+rsn6Dzg+zrJotFKA9E4q4+MSoUXuqTmOEybemTuRbWVr5a
 Zb+jQFft1WRTWIZWJtkycbiT220MpYGNoqtN+J6G7FsbAJbJH0ygXeAE9FkgD5lbhG6l
 3PhEIKlksqs/998jEtGGGkGMxnQSHICbdqecEmal24VvyhyHDsDgMRaWTjeelIIn5uGH
 q3+aCxTQwq4Xpq/LJNYtQvVb7ERjJE05bpFtPJvcl+eS6bTw7/xkDKZhzROF2XmTBHct
 lA/w==
X-Gm-Message-State: AOAM531dIZvwoRxJOVrHOTrknqYiUT7sgMeoWql/FHOFiZTFH0Rtxbc4
 nZ4WRonwrorpxoAp+5tSeazOZ4FMFPt5U5YKNn4=
X-Google-Smtp-Source: ABdhPJyEtjtgqI457ZpiHwadW+wM55mq6wUWDwE/hJk43J7BbO+VFenO9m7QvkMe8EQ9JuKmhBBlfP7JPenXEqkW8gw=
X-Received: by 2002:a05:6512:3049:: with SMTP id
 b9mr10668922lfb.44.1592858000356; 
 Mon, 22 Jun 2020 13:33:20 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 Jun 2020 16:33:09 -0400
Message-ID: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
Subject: sysbus failed assert for xen_sysdev
To: QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, 
 xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Running qemu devel for a Xen VM is failing an assert after the recent
"qdev: Rework how we plug into the parent bus" sysbus changes.

qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

dc->bus_type is "xen-sysbus" and it's the
`object_dynamic_cast(OBJECT(bus), dc->bus_type)` portion that fails
the assert.  bus seems to be "main-system-bus", I think:
(gdb) p *bus
$3 = {obj = {class = 0x55555636d780, free = 0x7ffff7c40db0 <g_free>,
properties = 0x5555563f7180, ref = 3, parent = 0x5555563fe980}, parent
= 0x0, name = 0x5555563fec60 "main-system-bus", ...

The call comes from hw/xen/xen-legacy-backend.c:706
sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);

Any pointers on what needs to be fixed?

Thanks,
Jason

