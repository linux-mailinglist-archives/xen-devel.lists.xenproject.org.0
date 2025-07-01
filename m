Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CD7AF070B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 01:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030118.1403776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfH-0008Q4-VS; Tue, 01 Jul 2025 23:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030118.1403776; Tue, 01 Jul 2025 23:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfH-0008ML-Rz; Tue, 01 Jul 2025 23:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1030118;
 Tue, 01 Jul 2025 23:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWkfG-0008Gm-KM
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 23:45:26 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75026e12-56d5-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 01:45:24 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a577f164c8so853256f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 16:45:24 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a87e947431sm14509037f8f.0.2025.07.01.16.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 16:45:22 -0700 (PDT)
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
X-Inumbo-ID: 75026e12-56d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751413523; x=1752018323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD8hgpwukyenx61CmXgMgm2JclP4fpFaqdzptPfzBYI=;
        b=Xp/i31xMt80KUIF6S+C3XIHhyFor1gC0YrEo+vwLhonUnI0kXbWomvLLw3C7PNdPXo
         HRVd+6Ui+1TPfh0idfGwbjgggxiFmYpW/tPNT7ZmcIvajwdrBdG/YFNj/jBZW58Ot238
         s23GkIJJ+szvpNdZj4/XA/6sU7wHZ4zDrsZ7kLAcj++C7uRc7b2QfNtRaFCFXpXdozlC
         MyOsfMpzHxwOD2ejCvecA4GxaWMtbPZYjlg5M7iraODi+zFi4xfe2IM0mMBOfFkwj9Vs
         x/Gs6PrrFqt7igAJxrIVGzkdm9yL/S+XWEwP9tu9dWeE8DYP2fYtJ8FFqCS52O/OKXqi
         HDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751413523; x=1752018323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD8hgpwukyenx61CmXgMgm2JclP4fpFaqdzptPfzBYI=;
        b=wPYJmQv9Y897ZddyaxrYsiMT3P28R52D7VR9oh34d6exm2DsYvuKnfF0IjRtG2KWMx
         WwJw/P1iQQNsQRJE9h2I+I3NgRJh+eKKVOs+VpG01MKVD9CEIMXRGrvQ3YSarT7zrxkL
         kWLCIqxVgLAgdEy2iXuk4nuBUixmcf+M6wpAy+g9MzGJZgerUAf/0gUgHgNXqNzEIIFF
         PDCT8tXkkZq4xKfruV7LKUYGPhCa9JHanTc/+a4efFMtrH2dbsVFWwOTT+5jJNKSimxI
         NEhJTBfqr5U3Vkqo+v8RyzZD9i6+rcDL8Rscqip6gbCYNRM1OiC6XzSFqbp8EVR9O22b
         +MrQ==
X-Gm-Message-State: AOJu0YzTda45OXFW0a72Ji6n5kXL3sDjJXpWIJC/iXS9LqhWkzhrerp+
	WW3SEbWWEK5o884FM0vaH1EQtz2GnfsAM8C1RWoZOMZQBH+g0Tfl8K1LnHj9lQ==
X-Gm-Gg: ASbGnctYagYL8XAJqX8Ct+4DJc86LshJ2h5i2V0xnFcqMocrE2fhl+gPrtyX3xsIMYJ
	4+u4mp6ysmhJ4PkYXS2YyEata6i3nVDm5l8TtSr+UlDlB/k9co7SdlL3ObRFyZMt83sRivFIWFC
	AN2DGVQ7ZSj4vdl30wiXM9yjipChthJd1YYv47kcVLPQBc5G9ZfIbvqlk8j97p2i4YRwUrBUyal
	AmVMP22QVOKLiYXSvugI2m4n8iG9oTaCnNUWqPQ035OkfcPNdphZ0T775chW0s3dDgtyIh8nAYd
	ImzlgRsrPqYISof8UwYrQMYP5byCHbpWRqFissNB08Fshz+qBqZp3pDYhsaibT/XeT+8GB0J8aA
	gwCDwYZbjL9sQGZQLLqcPniy1feBSeX2QxTjilgUtNPbxOKjuCIMfJUKOh6QzIA==
X-Google-Smtp-Source: AGHT+IHxiWDkX7ENjOMFxSpFbA7Cymhl/aRI01tjIKksZNqWxScQOHWvZMEryse5Hc969MSRG2r/2g==
X-Received: by 2002:a5d:5f52:0:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3b1fb064480mr108828f8f.0.1751413523066;
        Tue, 01 Jul 2025 16:45:23 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Anton Belousov <blsvntn@outlook.com>
Subject: [PATCH 3/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
Date: Tue,  1 Jul 2025 23:45:12 +0000
Message-Id: <99e281ad05537d2384eaffe95155a03382493c96.1751412735.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751412735.git.w1benny@gmail.com>
References: <cover.1751412735.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

SMBIOS tables like 7,8,9,26,27,28 are neccessary to prevent sandbox detection
by malware using WMI-queries. New tables can be mapped to memory from binary
file specified in "smbios_firmware" parameter of domain configuration.

If particular table is absent in binary file, then it will not be mapped to
memory. This method works for Windows domains as tables 7,8,9,26,27,28 are not
critical for OS boot and runtime. Also if "smbios_firmware" parameter is not
provided, these tables will be skipped in write_smbios_tables function.

Signed-off-by: Anton Belousov <blsvntn@outlook.com>
Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c       | 148 +++++++++++++++++++++++-
 tools/firmware/hvmloader/smbios_types.h |  83 ++++++++++++-
 2 files changed, 226 insertions(+), 5 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 2cd826768b..2a799fdac7 100644
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
+    do_struct(smbios_type_27_init(p));
+    do_struct(smbios_type_28_init(p));
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
+    struct smbios_type_7 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(7, &length);
+    if ( pts != NULL && length >= sizeof(struct smbios_type_7) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE7;
+        return start + length;
+    }
+
+    return start;
+}
+
+/* Type 8 -- Port Connector Information */
+static void *
+smbios_type_8_init(void *start)
+{
+    struct smbios_type_8 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(8, &length);
+    if ( pts != NULL && length >= sizeof(struct smbios_type_8) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE8;
+        return start + length;
+    }
+
+    return start;
+}
+
+/* Type 9 -- System Slots */
+static void *
+smbios_type_9_init(void *start)
+{
+    struct smbios_type_9 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(9, &length);
+    if ( pts != NULL && length >= sizeof(struct smbios_type_9) )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE9;
+        return start + length;
+    }
+
+    return start;
+}
+
 /* Type 11 -- OEM Strings */
 static void *
 smbios_type_11_init(void *start) 
@@ -780,7 +864,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
 {
     char buf[16];
     struct smbios_type_17 *p = start;
-    
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 17;
@@ -815,7 +899,7 @@ static void *
 smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 {
     struct smbios_type_19 *p = start;
-    
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 19;
@@ -923,6 +1007,66 @@ smbios_type_22_init(void *start)
     return start+1; 
 }
 
+/* Type 26 -- Voltage Probe */
+static void *
+smbios_type_26_init(void *start)
+{
+    struct smbios_type_26 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(26, &length);
+    if ( pts != NULL && length >= 20 )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE26;
+        return start + length;
+    }
+
+    return start;
+}
+
+/* Type 27 -- Cooling Device */
+static void *
+smbios_type_27_init(void *start)
+{
+    struct smbios_type_27 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(27, &length);
+    if ( pts != NULL && length >= 12 )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE27;
+        return start + length;
+    }
+
+    return start;
+}
+
+/* Type 28 -- Temperature Probe */
+static void *
+smbios_type_28_init(void *start)
+{
+    struct smbios_type_28 *p = start;
+
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(28, &length);
+    if ( pts != NULL && length >= 20 )
+    {
+        memcpy(start, pts, length);
+        p->header.handle = SMBIOS_HANDLE_TYPE28;
+        return start + length;
+    }
+
+    return start;
+}
+
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..3e5c5fa46a 100644
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
+    uint16_t nominal_value;     // Optional
+} __attribute__ ((packed));
+
+/* SMBIOS type 27 - Cooling Device */
+struct smbios_type_27 {
+    struct smbios_structure_header header;
+    uint16_t temperature_probe_handle;
+    uint8_t device_type_and_status;
+    uint8_t cooling_unit_group;
+    uint32_t oem_defined;
+    uint16_t nominal_speed;     // Optional
+    uint8_t description_str;    // Optional
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
+    uint16_t nominal_value;     // Optional
+} __attribute__ ((packed));
+
 /* SMBIOS type 32 - System Boot Information */
 struct smbios_type_32 {
     struct smbios_structure_header header;
@@ -252,9 +329,9 @@ struct smbios_type_39 {
     uint8_t revision_level_str;
     uint16_t max_capacity;
     uint16_t characteristics;
-    uint16_t input_voltage_probe_handle;
-    uint16_t cooling_device_handle;
-    uint16_t input_current_probe_handle;
+    uint16_t input_voltage_probe_handle;    // Optional
+    uint16_t cooling_device_handle;         // Optional
+    uint16_t input_current_probe_handle;    // Optional
 } __attribute__ ((packed));
 
 /* SMBIOS type 127 -- End-of-table */
-- 
2.34.1


