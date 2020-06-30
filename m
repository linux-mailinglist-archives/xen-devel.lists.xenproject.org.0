Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FC20F817
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 17:17:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqI0Z-0005hW-L3; Tue, 30 Jun 2020 15:17:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMeW=AL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqI0Y-0005hR-LL
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 15:17:14 +0000
X-Inumbo-ID: c693eda4-bae4-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c693eda4-bae4-11ea-b7bb-bc764e2007e4;
 Tue, 30 Jun 2020 15:17:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w3so7522349wmi.4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 08:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=U6gpWx6s17H1M9VJ6Oh9vPNBpxTYgr9zPk06ZNP9duI=;
 b=Ja3Hoc6gm808R+iiHXJ+YTAB271DNWOUMLTS3qsKPBA7ZFG3UVpjeCbmkTMVW/MmmS
 udqS+4mb3AruFaeVOe0C1raIYsMTMceHOAnlWJJuMLTmY87Z0vXABnTM335EqBF9tT1Q
 NzE0qFz2yvj+xh39kjoODv61pD10rsrqDAxgZABMBIwu8dBOabU7Gs4wxsWLNiIrUwhZ
 kzFSeIakj5PM4qlq4H8sdRLeOHdcQjgwUdBJ0b0eLdqn6EBP1UuqdP1aHYem9B7FtvCL
 XNln51//kteHAqh2OuA5CRnQH7n0GV2dcinLuyUabbNegMRIQ/MkZX7rb/m/r21kcm6I
 NDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=U6gpWx6s17H1M9VJ6Oh9vPNBpxTYgr9zPk06ZNP9duI=;
 b=L3ym1ZbwJUMA9jBxNRw2oHcU5O+lY0AUD5Hx/mGMe4PF6dsLa7+EY4vJGqPfp7hR2a
 g7Jd15oRvl3D/Z+8jx4bwrJnIpG0KOgIbJd42GDcPKIGKdtWZvWlgKTTI6Kmzwr5/I42
 LwArqaMw8DhERl9aqkm8caQOTTGMMJCmj7MvfPapX0lw68oYfvSVj9V+Iu5y+QSQ+GCs
 Xdaikn3FrXZwo/ryH3jbFJS42D3yHs5apBp/44Xl+I5mD4ODq34gnF4trtE5FdTgcYeo
 CLB34VLiNL/gXwXemuYI2+b7YhE54qeNMGYcjb93NlsiCm3CSCrz1TM4au2zzdrIp5+I
 iltA==
X-Gm-Message-State: AOAM531nBWHS5mYBN/jHpjYfj4wzn6vWaNwJTLOVqbNy8vgBtE3bf4aw
 8hzZd0tGvnSN2RxGv/dPmoE=
X-Google-Smtp-Source: ABdhPJz5rAGiFZIDrdJqvVJJ5HKWQXmPiwBmtxY124AwSoiwMS1+l2nVEKBvptNnZcYRRS1epYZK1A==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr23780539wmj.54.1593530233192; 
 Tue, 30 Jun 2020 08:17:13 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id j41sm4207738wre.12.2020.06.30.08.17.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jun 2020 08:17:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <20200630150849.GA2110@perard.uk.xensource.com>
In-Reply-To: <20200630150849.GA2110@perard.uk.xensource.com>
Subject: RE: [PATCH 2/2] xen: cleanup unrealized flash devices
Date: Tue, 30 Jun 2020 16:17:11 +0100
Message-ID: <000401d64ef1$87c8d8a0$975a89e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJSqy6H9p+wwq7WTKLIQgTsJ4xkIwGyH0+lAR9Jc9Sn4gFdsA==
Content-Language: en-gb
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
Cc: 'Eduardo Habkost' <ehabkost@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Paul Durrant' <pdurrant@amazon.com>,
 'Jason Andryuk' <jandryuk@gmail.com>, qemu-devel@nongnu.org,
 'Paolo Bonzini' <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 30 June 2020 16:09
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; qemu-devel@nongnu.org; Eduardo Habkost <ehabkost@redhat.com>;
> Michael S. Tsirkin <mst@redhat.com>; Paul Durrant <pdurrant@amazon.com>; Jason Andryuk
> <jandryuk@gmail.com>; Paolo Bonzini <pbonzini@redhat.com>; Richard Henderson <rth@twiddle.net>
> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> 
> On Wed, Jun 24, 2020 at 01:18:41PM +0100, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The generic pc_machine_initfn() calls pc_system_flash_create() which creates
> > 'system.flash0' and 'system.flash1' devices. These devices are then realized
> > by pc_system_flash_map() which is called from pc_system_firmware_init() which
> > itself is called via pc_memory_init(). The latter however is not called when
> > xen_enable() is true and hence the following assertion fails:
> >
> > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > Assertion `dev->realized' failed
> >
> > These flash devices are unneeded when using Xen so this patch avoids the
> > assertion by simply removing them using pc_system_flash_cleanup_unused().
> >
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Tested-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> I think I would add:
> 
> Fixes: dfe8c79c4468 ("qdev: Assert onboard devices all get realized properly")
> 
> as this is the first commit where the unrealized flash devices are an
> issue.

OK.

  Paul

> 
> --
> Anthony PERARD


