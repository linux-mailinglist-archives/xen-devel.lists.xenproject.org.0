Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267ACA20EAB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:34:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878659.1288868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXT-0007UR-UL; Tue, 28 Jan 2025 16:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878659.1288868; Tue, 28 Jan 2025 16:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXT-0007T4-Of; Tue, 28 Jan 2025 16:34:11 +0000
Received: by outflank-mailman (input) for mailman id 878659;
 Tue, 28 Jan 2025 16:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcoXR-00070Z-Rf
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:34:09 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2b1284e-dd95-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:34:09 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so9948170a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:34:09 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6973090d0sm534810966b.18.2025.01.28.08.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:34:07 -0800 (PST)
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
X-Inumbo-ID: b2b1284e-dd95-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738082048; x=1738686848; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PocrDZ9hDRaC7DH9mGBlVuageGkmPBew72m1MalZps=;
        b=SeDo6HQD43B9Tg2lusAh3ekHc4vMD/5YNWIknrkayvSjS6oakYijT1hiexy5ryRiLv
         9aJleiuV/nzBFAvFMIwByYA1sYqTlUVgeq4MRJ3DCBOj/En4+MjBSdaVUSzInMZw5HfL
         qMvJdYWwdKuUgoVyJHC0+Cn0T9b7XrsjlCzTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082048; x=1738686848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PocrDZ9hDRaC7DH9mGBlVuageGkmPBew72m1MalZps=;
        b=jyFdlW1Vpdd3lqVnMOhIBDgsXTMJqiDhxvKrvFa2yGZEtI/cjfE09mZuKvifrpkNFQ
         B90LHUscZenWefrXdo84B8gIKGMEZdAomuvq7UdLAwmtQ1Fx5MmVYfiSVkWd3hcqT9n6
         y22iA8w6/QMZOx8MgpoxPox25uQGjsIdHmsC74exAzGuo65Wh4hgfbXYcQZBUjdqsrf1
         /3FI90nUCLeYKJUATb7Xlo1yqTho/Re+mbzXHru+l4W2IRyQOCgIibYpveapbIgbUxnX
         YzRRnCXMzL9rrcPgHhKI3DiHhps40hrFqT6nteruZSSBfbMA7ms9UcVuy/HomgfCua4J
         po3Q==
X-Gm-Message-State: AOJu0YyXnnDBdiZHS994OaA1epmlN89QKNqd7dQE4Nd/BCg5c6FRmJgX
	GZjOqbVx1s1qXKxX3A5E/FJvtgPu85nmkcwXz/Na8s7K3ncNl/JZySubE7cctQk3y43QsOTP9SP
	CYKQ=
X-Gm-Gg: ASbGncsi1ZeXEZkONS25SIXnDdHYJFMSwZp9R1IQqSgoYAWgEWztohC7MWdeeHw6RTV
	LdBqOa23UA3sF6+DFLoKcVr5eK2ToJ2kBkvU5JBc7BgrKP6nG5jeIDwdxwAHj3OPoeuasA9VbEO
	O5TtsI9es+v0j1bOOVmVVYH4wUE/IiUYOkqdzfJJYw/L7x46YF9RKK5OmPYd+XWoY8yt0tKwmMK
	sG35PwEGraGBZdLJ5Uvv2vvaLtACXuJHSZJJlro4KNM7dxwLD51dEnXX21g7xas+WgwAIvHg7RS
	gMn42nzBR8PJk4UB+oQ/B6wP6Y4rrAX0/SNtZCz7cx0qx7EJ+/o=
X-Google-Smtp-Source: AGHT+IEHvOHZ3rC79zgZtlrliUBcqHcZd/1yasALjI6l+oiiKoATwG1XM4JqoTd0amr0xZiVHwo+Tg==
X-Received: by 2002:a17:906:f598:b0:aa6:7933:8b26 with SMTP id a640c23a62f3a-ab38b1b17ecmr4577230966b.9.1738082048332;
        Tue, 28 Jan 2025 08:34:08 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]
Date: Tue, 28 Jan 2025 16:33:41 +0000
Message-ID: <20250128163342.1491-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
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
Changes from v7 of the longer topology series:
  * Removed ASSERT() for the MP tables and merely skipped writing them
    if any vCPU has an APIC ID >=255.
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


