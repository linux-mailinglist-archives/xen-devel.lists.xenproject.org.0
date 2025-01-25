Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF2A1C4CA
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877020.1287253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfg-0006Nf-Bl; Sat, 25 Jan 2025 18:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877020.1287253; Sat, 25 Jan 2025 18:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfg-0006Lp-7b; Sat, 25 Jan 2025 18:14:16 +0000
Received: by outflank-mailman (input) for mailman id 877020;
 Sat, 25 Jan 2025 18:14:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfe-000565-7O
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dee327a-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:14:12 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso22054715e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:12 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4900e2sm68626685e9.24.2025.01.25.10.14.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:11 -0800 (PST)
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
X-Inumbo-ID: 2dee327a-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828852; x=1738433652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oekQdNljsXmvRCfjRcF/YH736cTnRtLa3bqMS7/4HKc=;
        b=kRDrcwQdbzmSmB8bU63/J64wP26Ii1A8PtSXws8H9JIo5A+Y/78FjH9j+JubgXPtNs
         zR2HMWsUiWelfOg37tSwpTq1+NmkRHE2Aa4vZrhBv7+oIPdV+DjIgHDdz5f13ON2Ivby
         Iu7zN8+pMKkB7UBBf8rTdahQgG4NSHzJPMBQ8Uj4RUBWnD0D559g6/8XJ8BnzwnN9VVr
         BrXkH650taRllw+oCNYcB93pAlkPwXKdLU7xWTlRhDcZwgLLxj3TjCMzau937b34elur
         6Ny1EzninbzZfj2tody8Fcsaa7dqjhiRO+H5y1tNnW7ToJfTpg6nsyvodLWaXVQNi8tF
         tpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828852; x=1738433652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oekQdNljsXmvRCfjRcF/YH736cTnRtLa3bqMS7/4HKc=;
        b=LWHgB5FrKztcwFEC7YVq+W4cIHTAmU6yRvouu/bfPHvIaM9H4TxBtdNlDY+mU31D7Z
         81VhmErx7lwuGEVHi/7AzKZetG2bkfgThbPZv5c1Qwrid7KaHxk1vA503Fp2yUPKoQpH
         TJKN2lJl1pvSZxJdrWmiRpEenJF3I2P8gZZxWoDpSWF1PWWBz+PmSZh70zutB/od7FVL
         2KHRsDvZJDTqNvnfSILVe7lG2q8qdOneH5RRS9CYsA4y3hrjg2xCGOFlW3UAY7qx4FUp
         SPr891So26CSsz4g6pYnEhOv5dSHad+DTmT/0AEUMiZ73VO4/3wJt2Vo7FDvSNYcvQhz
         ifLA==
X-Forwarded-Encrypted: i=1; AJvYcCW45ZiWpwA3Tj2jdEks8XMIJbwnX81e8Wb1U7d5qdx8IjxgkzRJyJO7lAvDVtNlPeCASu2FwAqF2X4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7yW/+0k9MTBUBgEdDwWNKiPjDig1PsfcOt49jKm9kCHzkETiq
	Bvt4HtN73NCgwfko0+Q07R16h/p6jxxCJbWks+UhFk8kfOJjuWykouy1IXUGLNk=
X-Gm-Gg: ASbGncvVBzSDtkpzCtFxJ9Xc1DTYSXuolO0XGx5Oaa2cKzRugPjQVxsr9DhdXxEbtn5
	d6e/l61r9HwJJMdPXGdmcZSkAtO/0s19GaudPXR4Vpni/m5s9SYhtafplmUGmXZDySkzJPjgEQW
	M+0EqZpkE6Hn8ji9xGL5Jh2ez3MHFt9KcTluwFEDI80KW5fhPedNYHE0aifqFBxWwBbV/EiT64S
	QhOhNVA1xqd5drkbFy53Nwj8EMqGUXenZwbFdtGn9SaB1ohTGBZQY2Tr6S4SKsPhWXpCiUKSij9
	TkZnkAlJr1aEqcJ98CQ990/jJAUdq9F7IW01epA/7VqHooTLVK3M+7PIzeau
X-Google-Smtp-Source: AGHT+IFcf5NC5w3OdMEeSdE+fJzRv8eMmKrsAaFn1q2W0Qs4+hxyDFiFEoLFYJSBxaKkISXGUJ3R0Q==
X-Received: by 2002:a05:600c:1f19:b0:434:a1d3:a30f with SMTP id 5b1f17b1804b1-438b9cc072emr109914115e9.6.1737828852191;
        Sat, 25 Jan 2025 10:14:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] hw/display: Have RAMFB device inherit from DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:39 +0100
Message-ID: <20250125181343.59151-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because the RAM FB device can be optionally plugged on the
TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/ramfb-standalone.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 6c35028965d..1be106b57f2 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -72,13 +72,12 @@ static void ramfb_class_initfn(ObjectClass *klass, void *data)
     dc->vmsd = &ramfb_dev_vmstate;
     dc->realize = ramfb_realizefn;
     dc->desc = "ram framebuffer standalone device";
-    dc->user_creatable = true;
     device_class_set_props(dc, ramfb_properties);
 }
 
 static const TypeInfo ramfb_info = {
     .name          = TYPE_RAMFB_DEVICE,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_DYNAMIC_SYS_BUS_DEVICE,
     .instance_size = sizeof(RAMFBStandaloneState),
     .class_init    = ramfb_class_initfn,
 };
-- 
2.47.1


