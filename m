Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9AA27872
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 18:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881750.1291928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlk-0006NI-7W; Tue, 04 Feb 2025 17:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881750.1291928; Tue, 04 Feb 2025 17:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfMlk-0006IN-2Z; Tue, 04 Feb 2025 17:31:28 +0000
Received: by outflank-mailman (input) for mailman id 881750;
 Tue, 04 Feb 2025 17:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXrc=U3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tfMli-000612-R1
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 17:31:26 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc3fb122-e31d-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 18:31:26 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3073283f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 09:31:26 -0800 (PST)
Received: from CSGPROD108744.Home (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102ac9sm16137748f8f.29.2025.02.04.09.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 09:31:23 -0800 (PST)
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
X-Inumbo-ID: dc3fb122-e31d-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738690285; x=1739295085; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgMGUVDS+iYC3WViwSsK8gEHt5WvmsVZpIvxDEu6Ypk=;
        b=AGyRW7KgqnmAkbWZhtv0S4vWaclmuciWRuTvJiJwLUTgl3fcbrfXlEoK5Jcvv99Fqq
         evyg814KXVv64S2AI5jE228oBwq2xa5B3h4+Q8muKfwcYrk/EOiTSBGiJA+oEadYnpBk
         iJr0nTzl+34V6v9ERRHZ9rNm3Y9eolv4p02jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690285; x=1739295085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgMGUVDS+iYC3WViwSsK8gEHt5WvmsVZpIvxDEu6Ypk=;
        b=RznGl5oTjmcvbwQjyubhXNr+HDozY0VV3AimZIhaOKccDLgcG4+HjLN7nWEpRzWnWj
         VmURYuDgXuL3lhxtxWZTBImnzQVZ3OlAOUlhUg/pCSj87AB9JLjntnUC89Os4KzAWaof
         tKD8AApeYq+N1HHFYD38HfjAxMXIse+n3kD5hdRlwW0NWQcFn3mK90bG5V9Nh/Jn876B
         xl65ZMFf13eUamM/hNr9wa4Sw4TAU6mooAubuXtbTguGPTJ/fFuAerh0XutMkWGaOP+X
         JJ/2M1oUUihcGRtoVLYr4wZvqNUyJZ+Z7PNZNdRhwIG52Lb9/hwAVNAelAskG6uCplfB
         q9fA==
X-Gm-Message-State: AOJu0YwXH22r5VqYvq8uygeH/8CiLjE3SDKE89xwZEea+x6tUSBisK4x
	ylUf2aKJAuBONZ2x+IkmibHtXAhA6JWaZ2Aaloty7xEI/VoMr4efaKIFsIULv3Xxn+V05Zw92pR
	ocQQ=
X-Gm-Gg: ASbGncvEYPl0cpBXPm16kK3SX8jLGVG9sAlVaZCx2pJ2EM4V1TeV+kOHE3Yfvtysqbm
	v4gImB5MnF0Le1qH8LZP0+Z5il93B+k+yPQImUSaOhyOFju9+YOItum5nTqyRslyEcGJA8P/NEL
	bkheHBF1ClSkHaDx4Hm1kvGZfKnpsMDFaA5t1MVRkq99krlrWaTKY3KrI/22kjS4Uey1XIwAGo4
	cy3mPKh7035dmZz0GFe5iDmLNbJ9y1/5QDCZpQy8J4xSb4eK7QyxN/fKciE39KwHV+vGfNzPNhS
	YLMoId0kwpIJzdzCYSD2yi3nVE6xftTy5iFil7Wd+PUpYl66WxF9ko6Ssg==
X-Google-Smtp-Source: AGHT+IEXrn3wc5aGCv18hOHhvl082oyjyCUvFY1nYJjuWj0HiME3c+dMjiFm1GSgaRBLjfKH+M2fPw==
X-Received: by 2002:a5d:5988:0:b0:38b:ed1c:a70d with SMTP id ffacd0b85a97d-38c5167b477mr23844300f8f.0.1738690284442;
        Tue, 04 Feb 2025 09:31:24 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 2/2] tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]
Date: Tue,  4 Feb 2025 17:31:20 +0000
Message-ID: <20250204173120.56598-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
References: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
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
v2->v3:
  * Moved extern in config.h to patch1 for (transient) MISRA compliance.

v1->v2:
  * No changes

Changes wrt original series
  * No changes (it was wrongly stated in v1 that something did. That was
part
    of the following patch)
---
 tools/firmware/hvmloader/config.h    | 1 -
 tools/firmware/hvmloader/hvmloader.c | 6 +++---
 tools/firmware/hvmloader/mp_tables.c | 2 +-
 tools/firmware/hvmloader/util.c      | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index b32bcbf4a1f2..6e1da137d779 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -51,7 +51,6 @@ extern uint8_t ioapic_version;
 extern uint32_t *cpu_to_apicid;
 
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


