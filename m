Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD131FDF8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87025.163964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kC-0000em-KT; Fri, 19 Feb 2021 17:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87025.163964; Fri, 19 Feb 2021 17:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kC-0000eF-G6; Fri, 19 Feb 2021 17:39:08 +0000
Received: by outflank-mailman (input) for mailman id 87025;
 Fri, 19 Feb 2021 17:39:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kA-0000XE-EA
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:06 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 257d245b-316b-4a44-8beb-86ed9a86aa32;
 Fri, 19 Feb 2021 17:39:05 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-3Q6zqInTO2egoMIp4B7lXQ-1; Fri, 19 Feb 2021 12:39:03 -0500
Received: by mail-wr1-f71.google.com with SMTP id o10so2762328wru.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:03 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u7sm13826375wrt.67.2021.02.19.09.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:01 -0800 (PST)
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
X-Inumbo-ID: 257d245b-316b-4a44-8beb-86ed9a86aa32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cia92nKBjrGhWlmymfB9YbxEpc3m+J7hFEI/efRN2yM=;
	b=B4hXWITd3MjdLXlv+hDENzBkDbtF1k/RhVVeqq0EQHFIg5KW6/GDY7YCXxmHMWtp0LfMbF
	37i31N10OEciZT/BSHw4ryts9n6RJRCAi66FBgyRndsVPHMJn0/5AaHxX+6IfWkwqNv0Ql
	i3PmLrBdebVcPlgX+3xBrlzsZ65Gpcs=
X-MC-Unique: 3Q6zqInTO2egoMIp4B7lXQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cia92nKBjrGhWlmymfB9YbxEpc3m+J7hFEI/efRN2yM=;
        b=kJ9e1etS4jlgapkwjeohMP6j1h5L+amFT1yjMqDGbITuXw+Pw9UtFhy4n9Ea4S8z+Y
         3bI2q7xOmnkZOFryqSNxSXpC8PkQAq7VKMbiqmTomm/rm1tEtklVxNUMhT8fIfBViFi/
         h0oT+nAmaojLQF/H/9WaNEAWOFSX7AZbpREMIb/eAsRZeV6A9/jdUKhklrzieRWHAGDZ
         IG6ao7j4Hkxg/zlIm/nGWeLiZncj8pKRTZGYL+lPdPL6AnowJoOTrcW8Qg7jwP2L7dG1
         JaHFvDtjRpmZsCAqs9HlJrOkAsE2gcupzwBJHAS6+9R/20UoZV/jdIQcNFvA0dEJZCG+
         2kwQ==
X-Gm-Message-State: AOAM5329OC0huu/KEBfc+jqpyX2evKD5HlirFZRQFre2xAV2WYLs1MUJ
	ic8y4x4nfWyajj1N7C3j41teQe9CrIlMEJSGz/KR/Mvh8DJEiBepctPWrOHBJJuay50jyBPYX1G
	kXRQAlFQ53rGcA97cttcr2ACH/CA=
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr7417310wmg.183.1613756342444;
        Fri, 19 Feb 2021 09:39:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqNL2hop6t3K45dchD7vTDRIpUNwjlifOUsXeOhz1mjGEWf1uUBOU5I8vzusScCU0mSzJMIw==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr7417287wmg.183.1613756342265;
        Fri, 19 Feb 2021 09:39:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-arm@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Leif Lindholm <leif@nuviainc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paul Durrant <paul@xen.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Greg Kurz <groug@kaod.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 02/11] hw/boards: Introduce machine_class_valid_for_accelerator()
Date: Fri, 19 Feb 2021 18:38:38 +0100
Message-Id: <20210219173847.2054123-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce the valid_accelerators[] field to express the list
of valid accelators a machine can use, and add the
machine_class_valid_for_current_accelerator() and
machine_class_valid_for_accelerator() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 24 ++++++++++++++++++++++++
 hw/core/machine.c   | 26 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 68d3d10f6b0..4d08bc12093 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
 
+/**
+ * machine_class_valid_for_accelerator:
+ * @mc: the machine class
+ * @acc_name: accelerator name
+ *
+ * Returns %true if the accelerator is valid for the machine, %false
+ * otherwise. See #MachineClass.valid_accelerators.
+ */
+bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name);
+/**
+ * machine_class_valid_for_current_accelerator:
+ * @mc: the machine class
+ *
+ * Returns %true if the accelerator is valid for the current machine,
+ * %false otherwise. See #MachineClass.valid_accelerators.
+ */
+bool machine_class_valid_for_current_accelerator(MachineClass *mc);
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
@@ -125,6 +143,11 @@ typedef struct {
  *    should instead use "unimplemented-device" for all memory ranges where
  *    the guest will attempt to probe for a device that QEMU doesn't
  *    implement and a stub device is required.
+ * @valid_accelerators:
+ *    If this machine supports a specific set of virtualization accelerators,
+ *    this contains a NULL-terminated list of the accelerators that can be
+ *    used. If this field is not set, any accelerator is valid. The QTest
+ *    accelerator is always valid.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities
@@ -166,6 +189,7 @@ struct MachineClass {
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
+    const char *const *valid_accelerators;
 
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f4388..c42d8e382b1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -518,6 +518,32 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
+bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
+{
+    const char *const *name = mc->valid_accelerators;
+
+    if (!name) {
+        return true;
+    }
+    if (strcmp(acc_name, "qtest") == 0) {
+        return true;
+    }
+
+    for (unsigned i = 0; name[i]; i++) {
+        if (strcasecmp(acc_name, name[i]) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
+bool machine_class_valid_for_current_accelerator(MachineClass *mc)
+{
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    return machine_class_valid_for_accelerator(mc, ac->name);
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
-- 
2.26.2


