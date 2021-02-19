Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41431FDFB
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87027.163988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kP-0000qn-Fo; Fri, 19 Feb 2021 17:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87027.163988; Fri, 19 Feb 2021 17:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kP-0000q3-Aq; Fri, 19 Feb 2021 17:39:21 +0000
Received: by outflank-mailman (input) for mailman id 87027;
 Fri, 19 Feb 2021 17:39:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kN-0000on-Fo
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:19 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 295cf8c6-0241-4282-877b-e177f7d11b51;
 Fri, 19 Feb 2021 17:39:19 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-30Ky9Va3MzKNFxGAlZqNjw-1; Fri, 19 Feb 2021 12:39:14 -0500
Received: by mail-wr1-f72.google.com with SMTP id e29so2574518wra.12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm12010000wmc.14.2021.02.19.09.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:12 -0800 (PST)
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
X-Inumbo-ID: 295cf8c6-0241-4282-877b-e177f7d11b51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHXCPuc7uWQdwucv7FWJOUQ8ceg9IO3ZY73rXU3+wF0=;
	b=iPXbZj8rGrxPbKEdYl1qsu46ZyVLdqKSX3k6meK0fIWrUdN96qqjWIm6X3GC06TGyjCFTf
	4SH9ilSw3RmowoOA//iBhlkTm096ZjbZEGpIHjNToEKZTWNfDzPhster1Cwo2AistWhzPg
	m61FY8TKA5WoqsvaK5J27fvfbhsi2q8=
X-MC-Unique: 30Ky9Va3MzKNFxGAlZqNjw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHXCPuc7uWQdwucv7FWJOUQ8ceg9IO3ZY73rXU3+wF0=;
        b=AFU3fIPAfa+WFqiLg6PhKFePChMHil/HA2hNO9iE5vCK/A64Dym91x8/aWzQhrYv8Q
         ktSs3hkcUZG6ki8m9hXd42dMlDq7BFdIGgrG75YRNCbMFA/BmgclQEjaiKTGh1wbFCqj
         t6MTBnoFgJQzZf/r/y3X85nUzrwIxqn15ZUuwg46aenBzatjFUXTBjHKavW/hMxmQuHJ
         WqGDqsPGRTk8cSt2WwteYw6VljOQL7GDnnAk8NgVicVrGgvurPgc8TizeTy3vfu/nciv
         Dtw76vfi7nuBEcvjE3cstmCNJv0oBpSSAPm1uOIfsp8euFkqGLoFLs1aD39NIlLFhKBK
         vOuw==
X-Gm-Message-State: AOAM532qCdg1iC/4WyPbT4KMCqVnEy+xJAp4vbH77Y9xftOsN9nOPkZR
	G4dEjjIgub1oayCcJPbCnkljr3UeZ9aZWrgp3zqeYzM2WpxjOmpCAfSf40tkw8h2V1LnCtezf+j
	3Cewnq9czTj7q6D1I1JiH3PAU+MI=
X-Received: by 2002:a05:6000:188c:: with SMTP id a12mr10610944wri.105.1613756353508;
        Fri, 19 Feb 2021 09:39:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrzSzq1o4kGieINb1Q744LtUd4TVffu+lfi/YVrFtocFVQ1Ale5KqgmXk7Upte5EwmyzFbHA==
X-Received: by 2002:a05:6000:188c:: with SMTP id a12mr10610915wri.105.1613756353383;
        Fri, 19 Feb 2021 09:39:13 -0800 (PST)
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
Subject: [PATCH v2 04/11] hw/arm: Restrit KVM to the virt & versal machines
Date: Fri, 19 Feb 2021 18:38:40 +0100
Message-Id: <20210219173847.2054123-5-philmd@redhat.com>
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

Restrit KVM to the following ARM machines:
- virt
- xlnx-versal-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt.c             | 5 +++++
 hw/arm/xlnx-versal-virt.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae9..8e9861b61a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2527,6 +2527,10 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", "hvf", NULL
+};
+
 /*
  * for arm64 kvm_type [7-0] encodes the requested number of bits
  * in the IPA address space
@@ -2582,6 +2586,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8482cd61960..d424813cae1 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -610,6 +610,10 @@ static void versal_virt_machine_instance_init(Object *obj)
 {
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -621,6 +625,7 @@ static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
     mc->no_cdrom = true;
     mc->default_ram_id = "ddr";
+    mc->valid_accelerators = valid_accels;
 }
 
 static const TypeInfo versal_virt_machine_init_typeinfo = {
-- 
2.26.2


