Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BFB15D9E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063646.1429386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YV-0006c3-OP; Wed, 30 Jul 2025 09:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063646.1429386; Wed, 30 Jul 2025 09:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YV-0006Z8-Jr; Wed, 30 Jul 2025 09:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1063646;
 Wed, 30 Jul 2025 09:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh3YT-00066r-Pw
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:57:01 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8954d559-6d2b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:57:00 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af8ed6b179eso24318266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:57:00 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a60e68sm722900966b.94.2025.07.30.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 02:56:59 -0700 (PDT)
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
X-Inumbo-ID: 8954d559-6d2b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753869420; x=1754474220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwFHCBdTSHgWjmQGvbODBADiKnjgtW8EbilEqxMqy2M=;
        b=SSp2Q4xnqUaonf+wHvdbrirjY3kpWdkAYghoNzXLzbrIC/cnNXQcZXpqGdnZ5zD6d6
         +6rMyOI8KQHPPHLGBpavnOVmgWV9Ptk/VOlGK8izHb9wtI63HOWoMh8n4Q+pjgM+V7zU
         JB6UjtGEeODpBJgINUuF4tID3q6f98gclCFidHYKP5MBI660cdVtn4FKCUMTeZEFfCUN
         MOm8StgZaA1i4qNX1lPOysV1TxhuLmggc+7Tki/Gw6EJNGA9YyOpk7UtCpLD4XTp/NxS
         DNUdpQgTiRR+FhqeML+9gPKcmBdCYUimyLI4yBhau4bli3EUlfpNSVffSXkLDAlip+j+
         WtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869420; x=1754474220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwFHCBdTSHgWjmQGvbODBADiKnjgtW8EbilEqxMqy2M=;
        b=PB42Uu++cl4DncjcpARjeT0+3J9oOZ/BDPJIY64xfkvmzdPnZOBrnSfbYUN4bZMCou
         kH1jHZzQLCvIGLtyS0ySMcul/Hd09Kb4mUFCLtq53sShT9lzgkRCFGBCFIofhq/Tnj51
         OOuOtolecajUQLH4VrDyz5+o1RXqZRxgQ2GOv3pr9mFr5TE7aMW6oCcmdBOZ23SpfXXJ
         JQBXjageBXsruHeCcAgFZxFy9LnTT7rmRcuxugf6ynABG1KLEJQiUXrg7Tr59SwROxfI
         SR4YYrJF74wL8V5K0bTRCRCoX/VE0dVcVmz20UYD7/+YkX2A9NOt3UUMHqAnOVMFC/Lq
         ntiA==
X-Gm-Message-State: AOJu0Yx3MUKqWUH1L1VZ0YE2oYeYopZq3r/fbYlfaKWpO6hlnB/8oYI9
	/ivvjTOY6ftqQMlV+cXF6FDeocWdeLVRbJIHi1lFAcxuFxXvOPJUsXeXFQKCmdX0BoE=
X-Gm-Gg: ASbGncvCHRPvmHVGHmXNxFEN77tRQYdBVg2brw3qEulH5mBbTAivG6gYByB3Y8mpvYe
	KmgLdPh0Wp2D+f8upM+QPhbVFdlvkEsIIkQxMmk74Et3mD9C+1AO9Cb1NVa0p10j2CS5KalPxld
	7fjQlwXLzdZiw1YMulwrqBmsdJuTLOx1ipjp2714+1z+MK1tuZCIAXovTabEZSLCQ2VI5uuf0p1
	RCrQKoSizhaqFCNPrcMtslzegLpBfRm3+hjviyDTiukhZ/5QUNBqWXC1Hb5LY3fY8IoszmInVt8
	mMWQ5K8yEUOOXluSe/+LWK+jtmg4ujLr53expcBKClVCA719NoCgpKz3pCybF6jtSLP9wfk5ITS
	IAJxJkfRBtqOeQDwzm0Mxp9VNzcpGJtfcWx5ay+utol+VEgUSjR3CZIYiVwct42YmjS1POtn/IS
	FXS26XMTIWs8nHYJf5g9SVdU4NUfvI3YWf
X-Google-Smtp-Source: AGHT+IEdenpSgBmG7wSgqEv5yHYLMym8lzERGyWUOzR4v85q0eAwbTzYyB06+jqOBjFeG0hywVSWHg==
X-Received: by 2002:a17:907:6091:b0:add:fc26:bef7 with SMTP id a640c23a62f3a-af8fd98591dmr128574566b.10.1753869419595;
        Wed, 30 Jul 2025 02:56:59 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 3/3] hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
Date: Wed, 30 Jul 2025 09:56:53 +0000
Message-Id: <d7e7de40369620470f2d6557ba2eb9c81f276fac.1753869323.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753869323.git.w1benny@gmail.com>
References: <cover.1753869323.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Some SMBIOS tables are used by certain malware families to detect virtualized
environments via WMI queries.

To improve stealth for sandboxing purposes, this patch adds support
for populating these SMBIOS tables from an external binary specified
via the "smbios_firmware" domain config option:

* 7 - Cache Info
* 8 - Port Connector
* 9 - System Slots
* 26 - Voltage Probe
* 27 - Cooling Device
* 28 - Temperature Probe

If particular table is absent in binary file, then it will not be mapped to
memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
provided, these tables will be skipped in write_smbios_tables function.

From: Anton Belousov <blsvntn@outlook.com>
Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c       | 111 ++++++++++++++++++++++++
 tools/firmware/hvmloader/smbios_types.h |  77 ++++++++++++++++
 2 files changed, 188 insertions(+)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 3af1b8a7ba..469138621b 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -33,12 +33,18 @@
 #define SMBIOS_HANDLE_TYPE2   0x0200
 #define SMBIOS_HANDLE_TYPE3   0x0300
 #define SMBIOS_HANDLE_TYPE4   0x0400
+#define SMBIOS_HANDLE_TYPE7   0x0700
+#define SMBIOS_HANDLE_TYPE8   0x0800
+#define SMBIOS_HANDLE_TYPE9   0x0900
 #define SMBIOS_HANDLE_TYPE11  0x0B00
 #define SMBIOS_HANDLE_TYPE16  0x1000
 #define SMBIOS_HANDLE_TYPE17  0x1100
 #define SMBIOS_HANDLE_TYPE19  0x1300
 #define SMBIOS_HANDLE_TYPE20  0x1400
 #define SMBIOS_HANDLE_TYPE22  0x1600
+#define SMBIOS_HANDLE_TYPE26  0x1A00
+#define SMBIOS_HANDLE_TYPE27  0x1B00
+#define SMBIOS_HANDLE_TYPE28  0x1C00
 #define SMBIOS_HANDLE_TYPE32  0x2000
 #define SMBIOS_HANDLE_TYPE39  0x2700
 #define SMBIOS_HANDLE_TYPE127 0x7f00
@@ -79,6 +85,12 @@ static void *
 smbios_type_4_init(void *start, unsigned int cpu_number,
                    char *cpu_manufacturer);
 static void *
+smbios_type_7_init(void *start);
+static void *
+smbios_type_8_init(void *start);
+static void *
+smbios_type_9_init(void *start);
+static void *
 smbios_type_11_init(void *start);
 static void *
 smbios_type_16_init(void *start, uint32_t memory_size_mb, int nr_mem_devs);
@@ -91,6 +103,12 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance);
 static void *
 smbios_type_22_init(void *start);
 static void *
+smbios_type_26_init(void *start);
+static void *
+smbios_type_27_init(void *start);
+static void *
+smbios_type_28_init(void *start);
+static void *
 smbios_type_32_init(void *start);
 static void *
 smbios_type_39_init(void *start);
@@ -225,6 +243,9 @@ write_smbios_tables(void *ep, void *start,
     do_struct(smbios_type_3_init(p));
     for ( cpu_num = 1; cpu_num <= vcpus; cpu_num++ )
         do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));
+    do_struct(smbios_type_7_init(p));
+    do_struct(smbios_type_8_init(p));
+    do_struct(smbios_type_9_init(p));
     do_struct(smbios_type_11_init(p));
 
     /* Each 'memory device' covers up to 16GB of address space. */
@@ -241,6 +262,9 @@ write_smbios_tables(void *ep, void *start,
     }
 
     do_struct(smbios_type_22_init(p));
+    do_struct(smbios_type_26_init(p));
+    do_struct(smbios_type_27_init(p));
+    do_struct(smbios_type_28_init(p));
     do_struct(smbios_type_32_init(p));
     do_struct(smbios_type_39_init(p));
     do_struct(smbios_type_vendor_oem_init(p));
@@ -729,6 +753,42 @@ smbios_type_4_init(
     return start+1;
 }
 
+/* Type 7 -- Cache Information */
+static void *
+smbios_type_7_init(void *start)
+{
+    /* Specification says Type 7 table has length of 13h for v2.1+. */
+    BUILD_BUG_ON(sizeof(struct smbios_type_7) != 19);
+
+    /* Only present when passed in. */
+    return smbios_pt_copy(start, 7, SMBIOS_HANDLE_TYPE7,
+                          sizeof(struct smbios_type_7));
+}
+
+/* Type 8 -- Port Connector Information */
+static void *
+smbios_type_8_init(void *start)
+{
+    /* Specification says Type 8 table has length of 09h. */
+    BUILD_BUG_ON(sizeof(struct smbios_type_8) != 9);
+
+    /* Only present when passed in. */
+    return smbios_pt_copy(start, 8, SMBIOS_HANDLE_TYPE8,
+                          sizeof(struct smbios_type_8));
+}
+
+/* Type 9 -- System Slots */
+static void *
+smbios_type_9_init(void *start)
+{
+    /* Specification says Type 9 table has length of 0Dh for v2.1-2.5. */
+    BUILD_BUG_ON(sizeof(struct smbios_type_9) != 13);
+
+    /* Only present when passed in. */
+    return smbios_pt_copy(start, 9, SMBIOS_HANDLE_TYPE9,
+                          sizeof(struct smbios_type_9));
+}
+
 /* Type 11 -- OEM Strings */
 static void *
 smbios_type_11_init(void *start)
@@ -960,6 +1020,57 @@ smbios_type_22_init(void *start)
     return start + 1;
 }
 
+/* Type 26 -- Voltage Probe */
+static void *
+smbios_type_26_init(void *start)
+{
+    /*
+     * Specification says Type 26 table has length of at least 14h,
+     * which corresponds with the end of the "OEM-defined" field.
+     *
+     * Only present when passed in.
+     */
+
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_26, oem_defined) != 20);
+
+    return smbios_pt_copy(start, 26, SMBIOS_HANDLE_TYPE26,
+                          offsetof_end(struct smbios_type_26, oem_defined));
+}
+
+/* Type 27 -- Cooling Device */
+static void *
+smbios_type_27_init(void *start)
+{
+    /*
+     * Specification says Type 27 table has length of at least 0Ch,
+     * which corresponds with the end of the "OEM-defined" field.
+     *
+     * Only present when passed in.
+     */
+
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_27, oem_defined) != 12);
+ 
+    return smbios_pt_copy(start, 27, SMBIOS_HANDLE_TYPE27,
+                          offsetof_end(struct smbios_type_27, oem_defined));
+}
+
+/* Type 28 -- Temperature Probe */
+static void *
+smbios_type_28_init(void *start)
+{
+    /*
+     * Specification says Type 28 table has length of at least 14h,
+     * which corresponds with the end of the "OEM-defined" field.
+     *
+     * Only present when passed in.
+     */
+
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_28, oem_defined) != 20);
+
+    return smbios_pt_copy(start, 28, SMBIOS_HANDLE_TYPE28,
+                          offsetof_end(struct smbios_type_28, oem_defined));
+}
+
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index a04d194975..c04b435d31 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -149,6 +149,44 @@ struct smbios_type_4 {
     uint8_t part_number_str;
 } __attribute__ ((packed));
 
+/* SMBIOS type 7 - Cache Information */
+struct smbios_type_7 {
+    struct smbios_structure_header header;
+    uint8_t socket_designation_str;
+    uint16_t cache_configuration;
+    uint16_t maximum_cache_size;
+    uint16_t installed_size;
+    uint16_t supported_SRAM_type;
+    uint16_t current_SRAM_type;
+    uint8_t cache_speed;
+    uint8_t error_connection_type;
+    uint8_t system_cache_type;
+    uint8_t associativity;
+} __attribute__ ((packed));
+
+/* SMBIOS type 8 - Port Connector Information */
+struct smbios_type_8 {
+    struct smbios_structure_header header;
+    uint8_t internal_reference_designator_str;
+    uint8_t internal_connector_type;
+    uint8_t external_reference_designator_str;
+    uint8_t external_connector_type;
+    uint8_t port_type;
+} __attribute__ ((packed));
+
+/* SMBIOS type 9 - System Slots */
+struct smbios_type_9 {
+    struct smbios_structure_header header;
+    uint8_t slot_designation_str;
+    uint8_t slot_type;
+    uint8_t slot_data_bus_width;
+    uint8_t current_usage;
+    uint8_t slot_length;
+    uint16_t slot_id;
+    uint8_t slot_characteristics_1;
+    uint8_t slot_characteristics_2;
+} __attribute__ ((packed));
+
 /* SMBIOS type 11 - OEM Strings */
 struct smbios_type_11 {
     struct smbios_structure_header header;
@@ -232,6 +270,45 @@ struct smbios_type_22 {
     uint32_t oem_specific;
 } __attribute__ ((packed));
 
+/* SMBIOS type 26 - Voltage Probe */
+struct smbios_type_26 {
+    struct smbios_structure_header header;
+    uint8_t description_str;
+    uint8_t location_and_status;
+    uint16_t maximum_value;
+    uint16_t minimum_value;
+    uint16_t resolution;
+    uint16_t tolerance;
+    uint16_t accuracy;
+    uint32_t oem_defined;
+    uint16_t nominal_value;                 /* Optional */
+} __attribute__ ((packed));
+
+/* SMBIOS type 27 - Cooling Device */
+struct smbios_type_27 {
+    struct smbios_structure_header header;
+    uint16_t temperature_probe_handle;
+    uint8_t device_type_and_status;
+    uint8_t cooling_unit_group;
+    uint32_t oem_defined;
+    uint16_t nominal_speed;                 /* Optional */
+    uint8_t description_str;                /* Optional */
+} __attribute__ ((packed));
+
+/* SMBIOS type 28 - Temperature Probe */
+struct smbios_type_28 {
+    struct smbios_structure_header header;
+    uint8_t description_str;
+    uint8_t location_and_status;
+    uint16_t maximum_value;
+    uint16_t minimum_value;
+    uint16_t resolution;
+    uint16_t tolerance;
+    uint16_t accuracy;
+    uint32_t oem_defined;
+    uint16_t nominal_value;                 /* Optional */
+} __attribute__ ((packed));
+
 /* SMBIOS type 32 - System Boot Information */
 struct smbios_type_32 {
     struct smbios_structure_header header;
-- 
2.34.1


