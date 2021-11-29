Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952D4617A2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 15:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234525.407081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhNu-0008B3-F6; Mon, 29 Nov 2021 14:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234525.407081; Mon, 29 Nov 2021 14:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrhNu-00086u-8o; Mon, 29 Nov 2021 14:11:58 +0000
Received: by outflank-mailman (input) for mailman id 234525;
 Mon, 29 Nov 2021 12:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ajmq=QQ=gmail.com=blsv.anton@srs-se1.protection.inumbo.net>)
 id 1mrgGD-0006hC-JZ
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 12:59:57 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409bf6df-5114-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 13:59:56 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id l7so34262409lja.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Nov 2021 04:59:56 -0800 (PST)
Received: from draksrv.localdomain ([188.187.75.98])
 by smtp.gmail.com with ESMTPSA id g6sm1335958lfu.86.2021.11.29.04.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:59:56 -0800 (PST)
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
X-Inumbo-ID: 409bf6df-5114-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9FJp5yt4xuR5uC1hB4oW12qctM8N4BAya0AXA911I/o=;
        b=bG0OFpRbjO6kACLykDn9pCCrycJLAWa0qtjW9HjybtH+FXvXmW6hHtYJcmYZnfLcS6
         YvXC2rmzciMdSMX2SkX4AfWqTTrJ3e1Dip5WlLxrDbrsysYiamg++pDPITJj2IPopXuF
         DlNkMHQMI1XkqTIKzx0PHW3/+8dwc9j1G3gMTN6KSx0TM2XJcjz2F9i3ThDVV4mlhzwo
         DDVSWYFiUZXKDTl9ZOIJjVfhquCCksGDphRGpPcicXSPY4PFmd08jeO4JAm2Jyv7kZD1
         0h5OTlC4gF7l2a2WSxOqDNgByPN+iuI0Q7vGprA5NuZw8Ckh5Jnbi0yJwegDNcfPFjG5
         0kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9FJp5yt4xuR5uC1hB4oW12qctM8N4BAya0AXA911I/o=;
        b=E2EzHkB7jA2Et2BbPx69VvJ8LFT3Z4n/elTwhFx4qLxz/bwjVd/0MVuEXhAAm+8OKx
         utHVfVqySQqJT8c7YwD78VH923RNpdNn1b+3c6knICZM+rivcPWT11S5nQxZALAwMzbL
         2q3s5t9LA04exJSps0k9JNlHtEfE3O3ezdNrHcJ6LSDOyCpiL5uThPnbGLHGSWMJ15k5
         MfnTASV7Cktg5ijYRXp1E4grockX3DB6vQ4u5VOEBsjSlcbPys/pFiin3bt70o/yvew3
         iuZ2TEftKQ/GRxslZEWTGXOPWlCpwKiBI7sYonYmkv2JCDiNpGKsySSeZT3b8jPYFedP
         DL5w==
X-Gm-Message-State: AOAM530RIIlGySovF/mN7RSobIP06XFZ33aKofcqKnlxe3YwMg285yHG
	59MWxZAFaBCGe8r7O51JGAkj61Y786E=
X-Google-Smtp-Source: ABdhPJzc3D9VlPruQ8CCKOZYQoF/62/iAMJTrir9n1zuO4mAFcPqCh2awV+J2Q0fJ2KZHxBkmUwTxA==
X-Received: by 2002:a05:651c:1689:: with SMTP id bd9mr10004737ljb.192.1638190796334;
        Mon, 29 Nov 2021 04:59:56 -0800 (PST)
From: Anton Belousov <blsv.anton@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anton Belousov <blsv.anton@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [XEN PATCH 1/1] Add suport for SMBIOS tables 7,8,9,26,27,28 to improve virtual machine stealth from malware.
Date: Mon, 29 Nov 2021 12:59:29 +0000
Message-Id: <3ad07dc366117e43a46004a03cdb963581b16fd7.1638190663.git.blsv.anton@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638190663.git.blsv.anton@gmail.com>
References: <cover.1638190663.git.blsv.anton@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
 tools/firmware/hvmloader/smbios_types.h |  76 ++++++++++++
 2 files changed, 222 insertions(+)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3..f5e61c1159 100644
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
@@ -77,6 +83,12 @@ static void *
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
@@ -89,6 +101,12 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance);
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
@@ -205,6 +223,9 @@ write_smbios_tables(void *ep, void *start,
     do_struct(smbios_type_3_init(p));
     for ( cpu_num = 1; cpu_num <= vcpus; cpu_num++ )
         do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));
+    do_struct(smbios_type_7_init(p));
+    do_struct(smbios_type_8_init(p));
+    do_struct(smbios_type_9_init(p));
     do_struct(smbios_type_11_init(p));
 
     /* Each 'memory device' covers up to 16GB of address space. */
@@ -221,6 +242,9 @@ write_smbios_tables(void *ep, void *start,
     }
 
     do_struct(smbios_type_22_init(p));
+    do_struct(smbios_type_26_init(p));
+    do_struct(smbios_type_28_init(p));
+    do_struct(smbios_type_27_init(p));
     do_struct(smbios_type_32_init(p));
     do_struct(smbios_type_39_init(p));
     do_struct(smbios_type_vendor_oem_init(p));
@@ -700,6 +724,66 @@ smbios_type_4_init(
     return start+1;
 }
 
+/* Type 7 -- Cache Information */
+static void *
+smbios_type_7_init(void *start)
+{
+    struct smbios_type_7 *p = (struct smbios_type_7 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(7, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE7;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 8 -- Port Connector Information */
+static void *
+smbios_type_8_init(void *start)
+{
+    struct smbios_type_8 *p = (struct smbios_type_8 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(8, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE8;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 9 -- System Slots */
+static void *
+smbios_type_9_init(void *start)
+{
+    struct smbios_type_9 *p = (struct smbios_type_9 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(9, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE9;
+        return (start + length);
+    }
+
+    return start;
+}
+
 /* Type 11 -- OEM Strings */
 static void *
 smbios_type_11_init(void *start) 
@@ -923,6 +1007,68 @@ smbios_type_22_init(void *start)
     return start+1; 
 }
 
+/* Type 26 -- Voltage Probe */
+static void *
+smbios_type_26_init(void *start)
+{
+    struct smbios_type_26 *p = (struct smbios_type_26 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(26, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE26;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 27 -- Cooling Device */
+static void *
+smbios_type_27_init(void *start)
+{
+    struct smbios_type_27 *p = (struct smbios_type_27 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(27, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE27;
+        p->temperature_probe_handle = SMBIOS_HANDLE_TYPE28;
+        p->cooling_unit_group = 0;
+        return (start + length);
+    }
+
+    return start;
+}
+
+/* Type 28 -- Temperature Probe */
+static void *
+smbios_type_28_init(void *start)
+{
+    struct smbios_type_28 *p = (struct smbios_type_28 *)start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(28, &length);
+    if ( (pts != NULL)&&(length > 0) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE28;
+        return (start + length);
+    }
+
+    return start;
+}
+
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..f43be12dfc 100644
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
@@ -232,6 +270,44 @@ struct smbios_type_22 {
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
+    uint16_t nominal_value;
+} __attribute__ ((packed));
+
+/* SMBIOS type 27 - Cooling Device */
+struct smbios_type_27 {
+    struct smbios_structure_header header;
+    uint16_t temperature_probe_handle;
+    uint8_t device_type_and_status;
+    uint8_t cooling_unit_group;
+    uint32_t oem_defined;
+    uint16_t nominal_speed;
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
+    uint16_t nominal_value;
+} __attribute__ ((packed));
+
 /* SMBIOS type 32 - System Boot Information */
 struct smbios_type_32 {
     struct smbios_structure_header header;
-- 
2.25.1


