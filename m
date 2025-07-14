Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CBB04B0C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043229.1413396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0b-0002M1-Kl; Mon, 14 Jul 2025 22:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043229.1413396; Mon, 14 Jul 2025 22:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0b-0002Hn-Ge; Mon, 14 Jul 2025 22:50:53 +0000
Received: by outflank-mailman (input) for mailman id 1043229;
 Mon, 14 Jul 2025 22:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRzM-00047A-CZ
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce898075-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:32 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4eb4dfd8eso721812f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:32 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4cbsm13713725f8f.50.2025.07.14.15.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:30 -0700 (PDT)
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
X-Inumbo-ID: ce898075-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533371; x=1753138171; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kInjRl+dr7QSUuJDw9dx5CY8sUkCe4SOSKHesTOQ5js=;
        b=E8PFYg1EgKy5HkQpAK0CU7d0y3q1fXd3y4pkowfLj9AFdc0oGt3T/s94A10YLPRAat
         Wfd0ZrS7yhWaD/wgrkuBbLBisJXupWIS32vHW6OCLEGAzO/Xirbx2H7cxHkEBOdqmM+t
         0xxCn5I7x88t/GYT9BXQZBp9K4RCGNrhUvmqY8kzlHLElzfffcftHFKssxGcxLCC/shn
         RNN2ZipTOiGBle3ROKzbY5c0i31IO/u85AT5yads3U9U/oZaizKdK+ftLFAT1btB6RdO
         pLdNOWixCq9yLhbNsiFBGxCjzJWQvZ4VRo4+3T6DSCSYwuSeqdpbD46O4EmpVaMKmUmY
         F9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533371; x=1753138171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kInjRl+dr7QSUuJDw9dx5CY8sUkCe4SOSKHesTOQ5js=;
        b=te25a1gSluFo13kU4akPi9XDPuhMzslCS+1aq8FPtSeu82WlgOn70dGIdXNttcopG+
         QWPUPQNi0gKIMJCydF3tFDuNlgymfW2S2UhRhRIYZ6m+wLisKQg7AAYBEJgY3GtscYYq
         CEfH9MTbdInw/8pFFAUB/Vei6kBd5Ie4vnM8QVMNh3ZmIJ7EPCVe90bvtsy0JuA0KKT5
         HWvsq3Z3eiw6eqwJIN2HggXkBEGeZpZzDUHlXpJMjws+meGNTpZtAzUh2akIG9AxOFTx
         HVEP1UT9bC023kCqOWq67HkuAdxfwc5v+e0BmegnNHSGm1qk0DW5mCBwXUsCtHy9KH4X
         xQog==
X-Gm-Message-State: AOJu0Yz1sYaE9DTte007DyWglpHmnIdQaff1TiH7j+PApWjmdeykCBUd
	R4eaRJMzbvmn/ih2h0/BTkysHsnlE1YM7TxZWzrS9GGtsQpn0/JrynUg0DMgrw==
X-Gm-Gg: ASbGnctnDL09y7fCyvlnKeAmIyiFUNChxHko1O/WIUDZCdio8waQeHtb1Kx/u/f7XB3
	AtqaoTIIlsS6RQXWJ2Vn5NUjziezqWwPzc3RlKqwSkvhUjD+Txsng8hm+uBRF4YGsHu1aRcD1bE
	JOevjBZHO7w3uiyVfaSMZkF0w5DSu505Hv7PJLGbBiu9XvrQ1en9sXnPUWY10/J1yjup6R+IvsP
	F4GJAAsGDo43tgFhnCPWJCro5/mAvGLQsByij8dnQAUbs81uNuF4E+flW1mpDqGJyCy8M5Q2qo1
	74OPfDH5ZMhtS+v1h0BPqLgJrU09sTpOKepdj97yZUHK3oxh5S23AygfvlAF3s2ULnKeE+EclSt
	TFWM3uPiWvAdWSpcILx5NYioMBcFed5675jP7GS3kpbr9fWdP/bywMGKzF/0b1s71fmwMxeUpeQ
	YeDpKoe0ApmDUjKNwiU+OnIg==
X-Google-Smtp-Source: AGHT+IF57fBC8JYgL5AsBZizrhwcPPuIL9jDz5yyck9m84enU6YnqTz67Oemd9xh8D4Fnd2L8XhwAQ==
X-Received: by 2002:a05:6000:2388:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3b5f185a966mr4950516f8f.5.1752533371293;
        Mon, 14 Jul 2025 15:49:31 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Anton Belousov <blsvntn@outlook.com>
Subject: [PATCH v2 3/3] hvmloader: add new SMBIOS tables (7, 8, 9, 26, 27, 28)
Date: Mon, 14 Jul 2025 22:49:23 +0000
Message-Id: <07aedca58d88ed741e13e073f39fdc20f29292cc.1752533080.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752533080.git.w1benny@gmail.com>
References: <cover.1752533080.git.w1benny@gmail.com>
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

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Signed-off-by: Anton Belousov <blsvntn@outlook.com>
---
 tools/firmware/hvmloader/smbios.c       | 87 +++++++++++++++++++++++++
 tools/firmware/hvmloader/smbios_types.h | 77 ++++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 93bfea3e6e..c67336cffa 100644
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
@@ -226,6 +244,9 @@ write_smbios_tables(void *ep, void *start,
     do_struct(smbios_type_3_init(p));
     for ( cpu_num = 1; cpu_num <= vcpus; cpu_num++ )
         do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));
+    do_struct(smbios_type_7_init(p));
+    do_struct(smbios_type_8_init(p));
+    do_struct(smbios_type_9_init(p));
     do_struct(smbios_type_11_init(p));
 
     /* Each 'memory device' covers up to 16GB of address space. */
@@ -242,6 +263,9 @@ write_smbios_tables(void *ep, void *start,
     }
 
     do_struct(smbios_type_22_init(p));
+    do_struct(smbios_type_26_init(p));
+    do_struct(smbios_type_27_init(p));
+    do_struct(smbios_type_28_init(p));
     do_struct(smbios_type_32_init(p));
     do_struct(smbios_type_39_init(p));
     do_struct(smbios_type_vendor_oem_init(p));
@@ -713,6 +737,30 @@ smbios_type_4_init(
     return start+1;
 }
 
+/* Type 7 -- Cache Information */
+static void *
+smbios_type_7_init(void *start)
+{
+    return smbios_pt_copy(start, 7, SMBIOS_HANDLE_TYPE7,
+                          sizeof(struct smbios_type_7));
+}
+
+/* Type 8 -- Port Connector Information */
+static void *
+smbios_type_8_init(void *start)
+{
+    return smbios_pt_copy(start, 8, SMBIOS_HANDLE_TYPE8,
+                          sizeof(struct smbios_type_8));
+}
+
+/* Type 9 -- System Slots */
+static void *
+smbios_type_9_init(void *start)
+{
+    return smbios_pt_copy(start, 9, SMBIOS_HANDLE_TYPE9,
+                          sizeof(struct smbios_type_9));
+}
+
 /* Type 11 -- OEM Strings */
 static void *
 smbios_type_11_init(void *start)
@@ -926,6 +974,45 @@ smbios_type_22_init(void *start)
     return start+1;
 }
 
+/* Type 26 -- Voltage Probe */
+static void *
+smbios_type_26_init(void *start)
+{
+    /*
+     * Specification says Type 26 table has length of at least 14h,
+     * which corresponds with "Nominal Value" offset.
+     */
+
+    return smbios_pt_copy(start, 26, SMBIOS_HANDLE_TYPE26,
+                          offsetof(struct smbios_type_26, nominal_value));
+}
+
+/* Type 27 -- Cooling Device */
+static void *
+smbios_type_27_init(void *start)
+{
+    /*
+     * Specification says Type 27 table has length of at least 0Ch,
+     * which corresponds with "Nominal Speed" offset.
+     */
+
+    return smbios_pt_copy(start, 27, SMBIOS_HANDLE_TYPE27,
+                          offsetof(struct smbios_type_27, nominal_speed));
+}
+
+/* Type 28 -- Temperature Probe */
+static void *
+smbios_type_28_init(void *start)
+{
+    /*
+     * Specification says Type 28 table has length of at least 14h,
+     * which corresponds with "Nominal Value" offset.
+     */
+
+    return smbios_pt_copy(start, 28, SMBIOS_HANDLE_TYPE28,
+                          offsetof(struct smbios_type_28, nominal_value));
+}
+
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 656b2a51ad..1a24ccc55f 100644
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
+    uint16_t nominal_value;     /* Optional */
+} __attribute__ ((packed));
+
+/* SMBIOS type 27 - Cooling Device */
+struct smbios_type_27 {
+    struct smbios_structure_header header;
+    uint16_t temperature_probe_handle;
+    uint8_t device_type_and_status;
+    uint8_t cooling_unit_group;
+    uint32_t oem_defined;
+    uint16_t nominal_speed;     /* Optional */
+    uint8_t description_str;    /* Optional */
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
+    uint16_t nominal_value;     /* Optional */
+} __attribute__ ((packed));
+
 /* SMBIOS type 32 - System Boot Information */
 struct smbios_type_32 {
     struct smbios_structure_header header;
-- 
2.34.1


