Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBE4041B4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182429.330012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sT-0000KF-RU; Wed, 08 Sep 2021 23:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182429.330012; Wed, 08 Sep 2021 23:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6sT-0000H3-Nw; Wed, 08 Sep 2021 23:21:13 +0000
Received: by outflank-mailman (input) for mailman id 182429;
 Wed, 08 Sep 2021 23:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6sS-0005H5-4e
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:21:12 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a74451f7-6faf-4990-9bed-d74110fca1f2;
 Wed, 08 Sep 2021 23:20:58 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-PIP6fDH6OSiC69KndTpGiA-1; Wed, 08 Sep 2021 19:20:56 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 v21-20020a05600c215500b002fa7eb53754so32601wml.4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:56 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id b22sm390180wmn.18.2021.09.08.16.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:54 -0700 (PDT)
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
X-Inumbo-ID: a74451f7-6faf-4990-9bed-d74110fca1f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2rov07jCDHA26r/9GcgxSj1NkWhTs7Eb1vPCWPgxnA=;
	b=RozFAsnnwYFkaB0pfKzK9DQMb1u2uHJ5zI8M5bmUzi/8hI+7Pz8yqiGnYTuGIZcu00cbVd
	JmeiTD2j6hg3mLMbDNIkcel7sy77u4AYx80QLjruhpnw+Lg4gp+vWK9gnX7w3kR66fr74F
	62kzflqAg8uWRDuspmlsA44ZS6bwqdo=
X-MC-Unique: PIP6fDH6OSiC69KndTpGiA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l2rov07jCDHA26r/9GcgxSj1NkWhTs7Eb1vPCWPgxnA=;
        b=kR8hMkI2S4iwZtUou3lLCHFrDw+8RpsgTXEtGs/RPHjiBFbCcyGmyNQUbTA3N/txfS
         BdNSN51WTj49n+IqZ1uL/u2/W7oi+L+dza9e0mWZeHsWVyQMYEQr/gOUV+qkUv6dj7qS
         BDyMPADUNpZgEfbSO2uCZekSN3XHW4R+p7dEZs+8Uwhw3e2gdkKELDEZ7YRJ6sx+CQ35
         T7h0toaQYBmIXxJpLwrXVJwPT5+TEt6fpqkqkC3jrFrsCP+6NK4uRkcj03V+v8pZ2uzP
         fLdnvrdHBxrfxgkmTACjpu7Y/CxDwLu15eCTzDPeIb4uqbc/6i89YNbx8JtpAz4VGJiu
         MkJA==
X-Gm-Message-State: AOAM531v68+ynw+Inc1TgGyog7K9WC8J3U9nXR0E69/CvdZSr6XlVIoB
	It9pXAaNinQBpkLWkBJ5qr301TFjRsceulaLWMJcQr8XuS5bjrzl2VL5xm/18N/kHFOW9BxuXmA
	WAJk2GUcTgd5A9hI479KtGBpSKTo=
X-Received: by 2002:a5d:6781:: with SMTP id v1mr82997wru.249.1631143255221;
        Wed, 08 Sep 2021 16:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0YS7l2ozSVHS0MrlXrrjEkKOBRZTLJQiA3uLjalXryjpOEItjin5eop39X0TrxKIC57agAQ==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr82983wru.249.1631143255072;
        Wed, 08 Sep 2021 16:20:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 06/10] qdev: Use qemu_security_policy_taint() API
Date: Thu,  9 Sep 2021 01:20:20 +0200
Message-Id: <20210908232024.2399215-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add DeviceClass::taints_security_policy field to allow an
unsafe device to eventually taint the global security policy
in DeviceRealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h |  6 ++++++
 hw/core/qdev.c         | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1..ff9ce6671be 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -122,6 +122,12 @@ struct DeviceClass {
      */
     bool user_creatable;
     bool hotpluggable;
+    /*
+     * %false if the device is within the QEMU security policy boundary,
+     * %true if there is no guarantee this device can be used safely.
+     * See: https://www.qemu.org/contribute/security-process/
+     */
+    bool taints_security_policy;
 
     /* callbacks */
     /*
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a9..a5a00f3564c 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
+#include "qemu-common.h"
 #include "qemu/option.h"
 #include "hw/hotplug.h"
 #include "hw/irq.h"
@@ -257,6 +258,13 @@ bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
     MachineClass *mc;
     Object *m_obj = qdev_get_machine();
 
+    if (qemu_security_policy_is_strict()
+            && DEVICE_GET_CLASS(dev)->taints_security_policy) {
+        error_setg(errp, "Device '%s' can not be hotplugged when"
+                         " 'strict' security policy is in place",
+                   object_get_typename(OBJECT(dev)));
+    }
+
     if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
         machine = MACHINE(m_obj);
         mc = MACHINE_GET_CLASS(machine);
@@ -385,6 +393,9 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
     } else {
         assert(!DEVICE_GET_CLASS(dev)->bus_type);
     }
+    qemu_security_policy_taint(DEVICE_GET_CLASS(dev)->taints_security_policy,
+                               "device type %s",
+                               object_get_typename(OBJECT(dev)));
 
     return object_property_set_bool(OBJECT(dev), "realized", true, errp);
 }
-- 
2.31.1


