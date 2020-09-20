Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3570271404
	for <lists+xen-devel@lfdr.de>; Sun, 20 Sep 2020 13:45:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJxla-0004Me-Aq; Sun, 20 Sep 2020 11:44:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vT6p=C5=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kJxlZ-0004Lx-6O
 for xen-devel@lists.xenproject.org; Sun, 20 Sep 2020 11:44:25 +0000
X-Inumbo-ID: a0b03a65-9bf9-48f1-8ee8-4b6fa32731c0
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0b03a65-9bf9-48f1-8ee8-4b6fa32731c0;
 Sun, 20 Sep 2020 11:44:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y15so9784541wmi.0
 for <xen-devel@lists.xenproject.org>; Sun, 20 Sep 2020 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFhP//g2kZUXZ+MAEt2Ablmdm9itVCJ1RZ3mPAAaqKM=;
 b=W7bIt4F4z6IiBy9m/LcKPgpOqz7FrN9GBpJuve00BFY9kXUb/mLfbBgoPvG81e+e1I
 PnmN8xdfVYhfolnL/Au7or3VYohzuyU+qgU61oKMiOuiLvML1lLLR1YrG8RyVOxhKkUD
 At2U1VxKyw0DDkZ3K8+6cgJOlgUg4G4X4ttSbnF28kWiWKEx5DCrAF0R6pwz7R/ksdxO
 R49LnJb7/kTrQSjtAggbyHcuKbCIapvd4GrEf6Jg/ZC7K9SP2Q6n0s35YN62z1rYuoYc
 YS7B1susGSIfY5Cjvl4LUE8YHWRaLM1Az0/VQh5o+hB66bh9DtXZa5BUW2dgmMDXj/bb
 3X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vFhP//g2kZUXZ+MAEt2Ablmdm9itVCJ1RZ3mPAAaqKM=;
 b=Z6ruAVPzxwzvvxj7qRuLdE3I6F4Z3Dt9YozSUjRIoqAWY02UKmjE6IGWFv8L8rduvY
 kKajETqptEBtdfiDZTWglfvF4Tfm2SFvLWwRDaYUe3DTi6Grut+AtY58Wvlxl4iLn3xw
 mtrJ2AcQmXVqHxvQUjSnSU3hWu2YUE848KlnO1d2TNKLIFQgi7GcxaW35B42A5N/09/2
 H3FqvNW/I5MCFG/b1z9VRjiRXJxGRkVHN6eaA70tVOllsUUa7MPV1tABqOiGiu3S4Bgw
 nFedHX1nD0P1dvAgh5MGjjnCMO7PwduO07/fr0Nuq2n+RoYzUk3pjwTlEFatyVvuE3/H
 YNrQ==
X-Gm-Message-State: AOAM532cV5uqVCdZlHqNrQVwFVOJRDqHBPN7lz1r+h2xClIYqWquXaNe
 ET+lXDXkR12+ohT0XEyK1sE=
X-Google-Smtp-Source: ABdhPJyz0j5G6/Jn6raiSm4b4XBR2XD5rdMCO5YiUU0gweX8qLMIBsSFUJ0cLbs1Gh97QejA8lUIOw==
X-Received: by 2002:a1c:9c4b:: with SMTP id f72mr24727724wme.188.1600602260050; 
 Sun, 20 Sep 2020 04:44:20 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id e18sm16415708wra.36.2020.09.20.04.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 04:44:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] qdev: Document qbus_realize() and qbus_unrealize()
Date: Sun, 20 Sep 2020 13:44:15 +0200
Message-Id: <20200920114416.353277-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920114416.353277-1-f4bug@amsat.org>
References: <20200920114416.353277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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

Add some documentation for the qbus_realize() and qbus_unrealize()
functions introduced in commit 9940b2cfbc0.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index e025ba9653f..02ac1c50b7f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -675,7 +675,19 @@ typedef int (qdev_walkerfn)(DeviceState *dev, void *opaque);
 void qbus_create_inplace(void *bus, size_t size, const char *typename,
                          DeviceState *parent, const char *name);
 BusState *qbus_create(const char *typename, DeviceState *parent, const char *name);
+/**
+ * qbus_realize: Realize a bus
+ * @bus: bus to realize
+ * @errp: pointer to error object
+ *
+ * On success, return true.
+ * On failure, store an error through @errp and return false.
+ */
 bool qbus_realize(BusState *bus, Error **errp);
+/**
+ * qbus_realize: Unrealize a bus
+ * @bus: bus to unrealize
+ */
 void qbus_unrealize(BusState *bus);
 
 /* Returns > 0 if either devfn or busfn skip walk somewhere in cursion,
-- 
2.26.2


