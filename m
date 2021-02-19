Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5BB31FDFC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87029.164001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kS-0000up-RU; Fri, 19 Feb 2021 17:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87029.164001; Fri, 19 Feb 2021 17:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9kS-0000tx-ML; Fri, 19 Feb 2021 17:39:24 +0000
Received: by outflank-mailman (input) for mailman id 87029;
 Fri, 19 Feb 2021 17:39:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ml8x=HV=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lD9kR-0000on-C1
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:39:23 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ea10117a-8f96-4a8d-9c72-aed11805b978;
 Fri, 19 Feb 2021 17:39:22 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-qcXp7kdzPcWsoqxwdjqA5A-1; Fri, 19 Feb 2021 12:39:20 -0500
Received: by mail-wr1-f70.google.com with SMTP id o10so2762608wru.11
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:39:20 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm14534967wre.78.2021.02.19.09.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:18 -0800 (PST)
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
X-Inumbo-ID: ea10117a-8f96-4a8d-9c72-aed11805b978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613756362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltjnESlJDd3H5QR2j8eiWOyKx9h8jJk2C0jWkjeNUew=;
	b=Fh9LIVlARdJYfeUwUHUZLMXi8rJsunU93ahUTuZOupqHRamCCnV+eYrVyBIf7NGp1FgDvJ
	pJrgTl8kTZZKh4pKKPrc5TE/bk+0jD/PI2v10roER5nSde0DAWdQXB8Q3cbPxUW8PxXEBQ
	BIHbAJK2gXKEE7wgSyxVanPSLZfb0sA=
X-MC-Unique: qcXp7kdzPcWsoqxwdjqA5A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ltjnESlJDd3H5QR2j8eiWOyKx9h8jJk2C0jWkjeNUew=;
        b=fIdlgrpRDVPIMPFMa4WX4fO34hOnWqf2QDxtsTMorNR0/dRSywiqO1HIJJAaTCA2lp
         bH3a1z1wa0HqMUfsh9WpWxyBiwKBpQyiyd6+2W6fYdOv2tAFb7EEJfzqg8NCml3/bTCK
         uMUKNTzUkK5eg2ZefeY4cf+gHxVx5z1UA8lSj3z+wAoQnV/wCt69qRoMPujreRzZiIK2
         fML9T5X6JP0k6mI5yCXxCfJ1KAW/lcj4SL98PiETSas3kHBHWYr23Gx6SoDBLuI0BMCA
         NS9dbqewqQGbKf5H7D6/f25sr/UmW8kBvhpxF/ryIhPBvdTBhDrWl5wYRM2mRDmLXsXv
         jRNQ==
X-Gm-Message-State: AOAM530CPq7nar3XxRiWaX6y35sDvlBXA3i4osP6Uv1deSk/c2yislQP
	Mj4Kh1qS/6Ij4JlULpAfwtrFXBIAPV7sOPa/B72ANVqpfCp5q4juGrqlX12imBGypeJ83H1Fmww
	VwPrsUTYi/gGo5CJ9Ba3gR9JKnOs=
X-Received: by 2002:a5d:558b:: with SMTP id i11mr10341323wrv.125.1613756359007;
        Fri, 19 Feb 2021 09:39:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyksADAECUrKIFfE8NXfSBq0p9Yv0QU1jPKKdp6ensUX0SFo+MEZzOE/tMgXW9KlqBOatRsLw==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr10341310wrv.125.1613756358861;
        Fri, 19 Feb 2021 09:39:18 -0800 (PST)
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
Subject: [PATCH v2 05/11] hw/mips: Restrict KVM to the malta & virt machines
Date: Fri, 19 Feb 2021 18:38:41 +0100
Message-Id: <20210219173847.2054123-6-philmd@redhat.com>
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

Restrit KVM to the following MIPS machines:
- malta
- loongson3-virt

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/loongson3_virt.c | 5 +++++
 hw/mips/malta.c          | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa5367..c3679dff043 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -612,6 +612,10 @@ static void mips_loongson3_virt_init(MachineState *machine)
     loongson3_virt_devices_init(machine, liointc);
 }
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -622,6 +626,7 @@ static void loongson3v_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = LOONGSON_MAX_VCPUS;
     mc->default_ram_id = "loongson3.highram";
     mc->default_ram_size = 1600 * MiB;
+    mc->valid_accelerators = valid_accels;
     mc->kvm_type = mips_kvm_type;
     mc->minimum_page_bits = 14;
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..0212048dc63 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1443,6 +1443,10 @@ static const TypeInfo mips_malta_device = {
     .instance_init = mips_malta_instance_init,
 };
 
+static const char *const valid_accels[] = {
+    "tcg", "kvm", NULL
+};
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1456,6 +1460,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    mc->valid_accelerators = valid_accels;
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.26.2


