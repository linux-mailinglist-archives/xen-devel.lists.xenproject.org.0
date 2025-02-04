Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC2A274BD
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881634.1291798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBn-00019Y-QY; Tue, 04 Feb 2025 14:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881634.1291798; Tue, 04 Feb 2025 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKBn-00016L-NT; Tue, 04 Feb 2025 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 881634;
 Tue, 04 Feb 2025 14:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfKBm-0000sX-NB
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:46:10 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5560892-e306-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 15:46:09 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab74ecfdae4so89606966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:46:09 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d0f1csm936741566b.70.2025.02.04.06.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 06:46:07 -0800 (PST)
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
X-Inumbo-ID: c5560892-e306-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738680368; x=1739285168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFtNLD/s+gum5McCuph52+qMp0z49XfE4oZqxPklEnU=;
        b=J76Avf8RzqGEOy7hS4ZoroNbDlq7wBqIGvxB+HeozsObe+CF7BEKK6d11raMBaeunQ
         IyFPO3RugxZYXAZ2R23Y3tAKfpAiY+DTpdCnIJ8mhRUgGS4/RxICJ7EPW/E2qUAeduA/
         QvgG1K/86e4AyLlfsoXAuKCv7XlGA3ZSOVRG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680368; x=1739285168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFtNLD/s+gum5McCuph52+qMp0z49XfE4oZqxPklEnU=;
        b=Bz0xL3hEeyTNEVw4rbHK+2hrHs0ghhn2CqxBo3ybaENe/xhmJy5ktlfOc5lOcEUnYC
         kIykZgUpuJ0NlauXRSfWbk+yCI0hF+KdC5EtiqZ6VQ0ScwWxfeNSxw3meQYKW+pBcjTK
         5w/eDW+DD1AwLHL5I9gdJ0tEp6UnnZZhA49dEebJ0AsPEpuVSx6oZUmHuSKvD7W3ADdO
         6cKXa2Fy29HDyYH48jknEfnaO8UMomrUqxBmWGxMwFpoWh2xstUb1/Rp/GUJcB0hEYtD
         qjufRfIx4JzJMr/Rgjgwcq4B9H2OHuKkYXrFrHHBpQfFoPjKWGyFHlwYXOh0lQrww2mv
         JY5w==
X-Gm-Message-State: AOJu0YwLNAOC+vlMiuk7npcdyMhtLiX03xrnvg0drVQmZ4iG/kehn8C6
	99g1G/HyCUMITaUw7NFkHR5uC+DUX/5YiazoMRyYcmvKk4Fh41sMMZlIwx0iZU7gKAaY55ho7mD
	nxKM=
X-Gm-Gg: ASbGnctIhvxDaSXXl4xpfLgnpzkCDw338S2/BDjxOVOSM2FBI9Kd9+DLTg/jeTzPRc3
	v4hcmNUoEMQ/hM1uFOiLpae3mvcEG1DYVefe4JFBjmKAnJEFLcaSpwu60RqK69Wt6sPG3NYHdeS
	2SZNNY85gKhXndj68vdiTG72BOgw/zb8i4oUK+f0wWo1uUQgnCAAbWT6l8vJAiK5dK00A+Q+IeZ
	zqhcwhBpCPKFRGRkWmflBi8ytWqT8SzE+Ek+ryfKgfoEwxpomSKZsCrHnx8FR4g4zhGMmqy4IFl
	79zYAHEVTABa5LOXBMt0LXOV/15MxsQ/qw40+WjUv2tA8G1C5bG9smSKACaIsg==
X-Google-Smtp-Source: AGHT+IHOskXwSHp+NnnWmnw1IkAMAIWhsXvUsVByUYU/OfibZ/mfCJ+IozmN3tKfhmwyQobbla/m/Q==
X-Received: by 2002:a17:907:6d0e:b0:aa6:ac9b:6822 with SMTP id a640c23a62f3a-ab6cfcb3a5dmr2869240766b.12.1738680368401;
        Tue, 04 Feb 2025 06:46:08 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/2] tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]
Date: Tue,  4 Feb 2025 14:45:42 +0000
Message-ID: <20250204144542.7399-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
References: <20250204144542.7399-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace uses of the LAPIC_ID() macro with accesses to the
cpu_to_apicid[] lookup table. This table contains the APIC IDs of each
vCPU as probed at runtime rather than assuming a predefined relation.

Moved smp_initialise() ahead of apic_setup() in order to initialise
cpu_to_apicid ASAP and avoid using it uninitialised. Note that bringing
up the APs doesn't need the APIC in hvmloader becasue it always runs
virtualized and uses the PV interface.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v1->v2:
  * No changes
Changes wrt original series
  * No changes (it was wrongly stated in v1 that something did. That was part
    of the following patch)

---
 tools/firmware/hvmloader/config.h    | 3 ++-
 tools/firmware/hvmloader/hvmloader.c | 6 +++---
 tools/firmware/hvmloader/mp_tables.c | 2 +-
 tools/firmware/hvmloader/util.c      | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..6e1da137d779 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -48,8 +48,9 @@ extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
 
+extern uint32_t *cpu_to_apicid;
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index f8af88fabf24..4e330fc1e241 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -224,7 +224,7 @@ static void apic_setup(void)
 
     /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
     ioapic_write(0x10, APIC_DM_EXTINT);
-    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
+    ioapic_write(0x11, SET_APIC_ID(cpu_to_apicid[0]));
 }
 
 struct bios_info {
@@ -341,11 +341,11 @@ int main(void)
 
     printf("CPU speed is %u MHz\n", get_cpu_mhz());
 
+    smp_initialise();
+
     apic_setup();
     pci_setup();
 
-    smp_initialise();
-
     perform_tests();
 
     if ( bios->bios_info_setup )
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index 77d3010406d0..3c93a5c947d9 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -199,7 +199,7 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
 static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
 {
     mppe->type = ENTRY_TYPE_PROCESSOR;
-    mppe->lapic_id = LAPIC_ID(vcpu_id);
+    mppe->lapic_id = cpu_to_apicid[vcpu_id];
     mppe->lapic_version = 0x11;
     mppe->cpu_flags = CPU_FLAG_ENABLED;
     if ( vcpu_id == 0 )
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index d3b3f9038e64..2d07ce129013 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -827,7 +827,7 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
 
 static uint32_t acpi_lapic_id(unsigned cpu)
 {
-    return LAPIC_ID(cpu);
+    return cpu_to_apicid[cpu];
 }
 
 void hvmloader_acpi_build_tables(struct acpi_config *config,
-- 
2.48.1


