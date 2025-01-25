Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898F8A1C4C9
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877009.1287233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfU-0005Uz-SZ; Sat, 25 Jan 2025 18:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877009.1287233; Sat, 25 Jan 2025 18:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfU-0005QM-O7; Sat, 25 Jan 2025 18:14:04 +0000
Received: by outflank-mailman (input) for mailman id 877009;
 Sat, 25 Jan 2025 18:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfT-000565-R0
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:03 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27a761a7-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:14:02 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so2698316f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:14:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d865sm6249213f8f.38.2025.01.25.10.14.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:14:01 -0800 (PST)
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
X-Inumbo-ID: 27a761a7-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828842; x=1738433642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60AuA1WDx9vhZn9WTP7sL5YOcyHTmPSWNTPXV1fPX/g=;
        b=IFlm2xVQAoQfvtsA1V7yF+n0t4VdAbrIGxxDsUiOutAcB2a3fkoTR3/WbpNST1hPEd
         TYwZybs9iRmfjhmz6C1PGkSJ3gXQGct1y2xMS4u7nWnYRHGb0cgiR0ufF8xtxNSAEKBb
         yCTahB+URGpRTBcAd7XKPBmJ2Z9M0jpQt1PoOCDA9m60ECHEeyeHQuDYZGOXkcAYpgtK
         YdDxCarS07jWcGnWUUOqyliOISqDNFDfuqkGRfeLrlXn49DU0I0nTRN3LfdMKMdjaj/C
         xjqFMrRd2x3XcVhqWBxT8b3+03sNUStBhMQ+YbDnHWwKD7Gn28ACAKlIe1kNVCemx7UK
         fZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828842; x=1738433642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60AuA1WDx9vhZn9WTP7sL5YOcyHTmPSWNTPXV1fPX/g=;
        b=W1yZX1ad7GKeDOq5rgSUBKvB7XXpm848/u9g3jzwSU/dJSxS2XV9XrLWKxJv0008lo
         dyexG4OzbSi75Zaf9Qjet1JVNoAQBSmqLzK00/Bx5wZTEYTqL+gPtCXGAbUMMv3C9yI3
         Mrp6fGHZ9ZNGaLipxhqLcqctpNCuiQzVnx9U2zniYq1MwIeE43EB8iHfW6lqzIh1yr6c
         RN21q0imF4E51J7lxwwozm8V4DiUMM/9G0rrdHcyDQL5xKZHnRc0YveKPptOXNoMbI1w
         bW/z0+aG6/G76nK74LMgn9uaTtyvaTuqvyILQg/2/61wwlUEkIgLrRSn/fNhSa0IKNuN
         envg==
X-Forwarded-Encrypted: i=1; AJvYcCUIdznIETPgwkhaAtsNyU4HV20D4VlGAXPSUnMx1AApuBYCgNGlDdhdGMpJ0FrM0MYh6STKYb9Q0vo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcThVnL+YTwdUM/BAnXlFSAq8r7auXsYqZ0Rn6u9Ix6w2Mcv7Y
	40jsE0pL6PuxNt7XqnmsBLkGSBd30rNdcqyeZJ6omach0U/XJkoMqMwrzeMdtW0=
X-Gm-Gg: ASbGnct70fWQrkdtZb8AVj7QVxogs/OSrLgcmeXzS9ShD1MZ71XF3KffTt56WhgzNca
	cI+DTfUjrKEwGmV9vIn7GnVw97C8SxiJYrqsWKvnjY2CVpf2zvm+NV8c3dvlSmvjPky4S0vtIAT
	igW9dWRCMRNb2egQlCWJJ+hY1lRA3C7m+AV2tZArhhB3ZvBHP7uun2H4B1nyCnbmLdn6qN0F3Ey
	fp1wWtmqsg6wX4uVxXBIRtQOq74Z4rhw+UZTJ4ZKXv40ywKI1iGb/KiB6592PL3vxCrH+cgCxsW
	4h/g43hnW0aFNB+e7s/IGOComZK3mAgDTD2vEEqk83OpnAtTNcmOeQCyhUSg
X-Google-Smtp-Source: AGHT+IFmsyFMtRiyUoQTMlDTj6UgcQ0Wyp8q7Re0IHss6ougDQh97Nwe8Gj2HZEyku0oDKVtn8rFyg==
X-Received: by 2002:a05:6000:2c5:b0:37d:4647:154e with SMTP id ffacd0b85a97d-38bf5655bd3mr29759427f8f.9.1737828841654;
        Sat, 25 Jan 2025 10:14:01 -0800 (PST)
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
Subject: [PATCH 3/9] hw/sysbus: Introduce TYPE_DYNAMIC_SYS_BUS_DEVICE
Date: Sat, 25 Jan 2025 19:13:37 +0100
Message-ID: <20250125181343.59151-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some TYPE_SYS_BUS_DEVICEs can be optionally dynamically
plugged on the TYPE_PLATFORM_BUS_DEVICE.
Rather than sometimes noting that with comment around
the 'user_creatable = true' line in each DeviceRealize
handler, introduce an abstract TYPE_DYNAMIC_SYS_BUS_DEVICE
class.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h |  2 ++
 hw/core/sysbus.c    | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index c9b1e0e90e3..81bbda10d37 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -19,6 +19,8 @@ DECLARE_INSTANCE_CHECKER(BusState, SYSTEM_BUS,
 OBJECT_DECLARE_TYPE(SysBusDevice, SysBusDeviceClass,
                     SYS_BUS_DEVICE)
 
+#define TYPE_DYNAMIC_SYS_BUS_DEVICE "dynamic-sysbus-device"
+
 /**
  * SysBusDeviceClass:
  *
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 306f98406c0..e8d03fd28d9 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -321,6 +321,14 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
+static void dynamic_sysbus_device_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    k->user_creatable = true;
+    k->hotpluggable = false;
+}
+
 static const TypeInfo sysbus_types[] = {
     {
         .name           = TYPE_SYSTEM_BUS,
@@ -336,6 +344,12 @@ static const TypeInfo sysbus_types[] = {
         .class_size     = sizeof(SysBusDeviceClass),
         .class_init     = sysbus_device_class_init,
     },
+    {
+        .name           = TYPE_DYNAMIC_SYS_BUS_DEVICE,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .class_init     = dynamic_sysbus_device_class_init,
+        .abstract       = true,
+    }
 };
 
 DEFINE_TYPES(sysbus_types)
-- 
2.47.1


