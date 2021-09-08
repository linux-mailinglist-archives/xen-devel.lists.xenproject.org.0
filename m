Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA524041AD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182406.329958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6rx-0005d5-13; Wed, 08 Sep 2021 23:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182406.329958; Wed, 08 Sep 2021 23:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO6rw-0005Zf-U9; Wed, 08 Sep 2021 23:20:40 +0000
Received: by outflank-mailman (input) for mailman id 182406;
 Wed, 08 Sep 2021 23:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=39dd=N6=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1mO6rv-0005Yv-Pb
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:20:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 60e9c8ca-10fb-11ec-b18c-12813bfff9fa;
 Wed, 08 Sep 2021 23:20:39 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-HPvg9sFIMMGFOrpSD9GX4g-1; Wed, 08 Sep 2021 19:20:37 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so32012wmj.8
 for <xen-devel@lists.xenproject.org>; Wed, 08 Sep 2021 16:20:37 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j14sm30789wrp.21.2021.09.08.16.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:20:35 -0700 (PDT)
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
X-Inumbo-ID: 60e9c8ca-10fb-11ec-b18c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631143238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VWnIa1NnZmGclGfmWQAc+byFrHYlEtTXg6KMBnsWc1s=;
	b=CNr7uEMA9kce1mHm8iJRelPNGfg/Oj7Dn6LovQY5TTLblc8kbJOcFtS22RRLTtSaNaEl4E
	VLYd9KZkuGraLYmHaL3r2Jw+BHe28d/3lc1D6u88BLC7NtYOvuGSOhyDdvS8coF4RZ+KJH
	4/0/Kg2IXtekjoQnjG/sd5TxZZtASz4=
X-MC-Unique: HPvg9sFIMMGFOrpSD9GX4g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWnIa1NnZmGclGfmWQAc+byFrHYlEtTXg6KMBnsWc1s=;
        b=RH7+oWKce2XP0YN2dFIErhB/jA8c+W2j/w03VzJZmANWkMrz2FWInpTq0m0Z0Aq73x
         oXb7vaIHFMzmGgbD/kL+t7yTaipEiQWYtcNDnuRvY95QtciR2wZWHpomshwxsSGTW24O
         EVEn6q5Bi0bxk1mBXfjwN4mRHEaoNSqRd97Kii1F9RlYFIilNXYLRUQ4NqGv1Fx485NF
         YYRQCdJ1p8atR+cX9p3Hj42lTEl5dNOeHOLJGQjYupxAtPxhbL1Et1reuj9h9uS7YeTr
         GcElue3bYxB6D8PFFAXeJeYvw5n53tC1dtZ9uuJVVeI0dB4uVHdIztZX9PF35UvWXaAG
         2ACg==
X-Gm-Message-State: AOAM532BP1yKPsT69m06v3Ty57MrFE5memNP3fIQWyUTWtu3n8rLWYW2
	5TV1ldXz+xk1onfmn+H7yRuheQh5PspEIk+wXw8+3JTBIhXnhqqU8jhiDVRGfSQZmZy/G0Ul5ce
	UlRpD6DVt3RODQy5mjMIOpiVsl8M=
X-Received: by 2002:a1c:448a:: with SMTP id r132mr557411wma.105.1631143236078;
        Wed, 08 Sep 2021 16:20:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6WkilBgiH6FuwGNniEzqjgdLM6GzbGQfLFFCepoIH7M5nhemfkyQL//fRVRjKLyNs63E1PQ==
X-Received: by 2002:a1c:448a:: with SMTP id r132mr557389wma.105.1631143235880;
        Wed, 08 Sep 2021 16:20:35 -0700 (PDT)
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
Subject: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark KVM and Xen as safe
Date: Thu,  9 Sep 2021 01:20:16 +0200
Message-Id: <20210908232024.2399215-3-philmd@redhat.com>
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

Add the AccelClass::secure_policy_supported field to classify
safe (within security boundary) vs unsafe accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/accel.h | 5 +++++
 accel/kvm/kvm-all.c  | 1 +
 accel/xen/xen-all.c  | 1 +
 softmmu/vl.c         | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6fc..895e30be0de 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -44,6 +44,11 @@ typedef struct AccelClass {
                        hwaddr start_addr, hwaddr size);
 #endif
     bool *allowed;
+    /*
+     * Whether the accelerator is withing QEMU security policy boundary.
+     * See: https://www.qemu.org/contribute/security-process/
+     */
+    bool secure_policy_supported;
     /*
      * Array of global properties that would be applied when specific
      * accelerator is chosen. It works like MachineClass.compat_props
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb8..eb6b9e44df2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3623,6 +3623,7 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
     ac->init_machine = kvm_init;
     ac->has_memory = kvm_accel_has_memory;
     ac->allowed = &kvm_allowed;
+    ac->secure_policy_supported = true;
 
     object_class_property_add(oc, "kernel-irqchip", "on|off|split",
         NULL, kvm_set_kernel_irqchip,
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b2..57867af5faf 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -198,6 +198,7 @@ static void xen_accel_class_init(ObjectClass *oc, void *data)
     ac->setup_post = xen_setup_post;
     ac->allowed = &xen_allowed;
     ac->compat_props = g_ptr_array_new();
+    ac->secure_policy_supported = true;
 
     compat_props_add(ac->compat_props, compat, G_N_ELEMENTS(compat));
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 92c05ac97ee..e4f94e159c3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2388,6 +2388,9 @@ static int do_configure_accelerator(void *opaque, QemuOpts *opts, Error **errp)
         return 0;
     }
 
+    qemu_security_policy_taint(!ac->secure_policy_supported,
+                               "%s accelerator", acc);
+
     return 1;
 }
 
-- 
2.31.1


