Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB61B04B0B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043221.1413386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0W-0001bw-Bo; Mon, 14 Jul 2025 22:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043221.1413386; Mon, 14 Jul 2025 22:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0W-0001Z1-7S; Mon, 14 Jul 2025 22:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1043221;
 Mon, 14 Jul 2025 22:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRzG-00047A-BH
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:30 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccc5f9c1-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:29 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a52878d37aso563865f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:29 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4cbsm13713725f8f.50.2025.07.14.15.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:26 -0700 (PDT)
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
X-Inumbo-ID: ccc5f9c1-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533368; x=1753138168; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcdR2OMWOJvXCF7+7tgxxw7opJ+1F3OE/BzPvoNcv94=;
        b=AMwHjv/nY+L5c14mT1Ub+1TRdIAz6amrk02+xdbDp99TPKokyjoElgZahClqwyyOGc
         hhhvYJRwJNDRGD1hmESp9p5SiPK+sNlwzZPWCukisKMEm6NKpwruq6AWSlvE00faBGaC
         DwoEiZ/CAWEVZd34yjOLOGEseOf9P5XZ52i+gMdGL8PGZdwXMKKzXtKYU8sNjg7/CqfF
         SizG6YL8F+SxG7JQ9lk2Tq41isJdYSBmPms6hqIcXPUd9J10OwCuM7eHscgvUVX+nmnd
         Zr12v/dMidYy6qWgSJDlyofXIievURba693Mil5nT/45IZdMRlRo0B4TFewycfn/8jEv
         vwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533368; x=1753138168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcdR2OMWOJvXCF7+7tgxxw7opJ+1F3OE/BzPvoNcv94=;
        b=tdWqFQsLd4HvNu7Pq38dN/piUz5Dkj/+BnTBwWoFpKgEpEM0MYWiHaSwy1mQ/qbF6s
         2Z+5dbXv8k+MgQ4n0/LO/2aMmOnb+qNwtIltelr7iqQEWTBocnK4NkyuqPIqOEuV8CIX
         yiI7Pj2nmryLjONkXNL1gBKKDtHA1vFQZERvs0Ed7iB+noI5BynykheH4/LrKmin2euE
         EbKLhK8+TYdToK02AxnR6hu7sz36aF0dYvk8a0xBRnLomSEOw1WLtoEBPo7r65SRC3a/
         C6DYG/lVEPA6Iu1hrh+NsgbpIyum5jKiLrsWbRz2Kp3Rk18LAo796hbXKmRBBGoHbw7n
         I6Gw==
X-Gm-Message-State: AOJu0YwvIr+bJHvErgxNFlZ4fbjWoJcEjJgHJHQNOOsO9Z6uNeJd8aCq
	Rp/mAV8gdkd7lWTYeUpYHdnJuqWGKWgbVRa2Pkz4kly0s6pYIQsvHC18kcaKqQ==
X-Gm-Gg: ASbGnctNTd1R8czc+OeljwzkqAWlsEk+s9sHOvqINFOx0HmpQ5j0NVh0pLvYUxxiims
	ltT9Lv9F655XzQ9IzFFshJIsmYCjrSJ/2V+LO1rp/g5CNmPA3jc0Jg5Chw2pX4LoVQR0JQgJXGm
	7PnwzCfQRXuEJMVS6hps+4HVBO8K+YtYl8hY2ZPeIUSyj9QyvZlzdHXMn8buzOoWVVCojIWEqiZ
	yoRUMgmAzsBD6hB88iR5W10B0qGoPH0Dpw86WJum8wFTcY1TZOKXSdaQ5GxQ6Zx7rxRksglCJNG
	IiANcb750ohjJLUDSPgclsFA3b6oQU5AjH9mdKXYAL85nQ+islxHYY2cogBEH1ZLUZTdKkX5J0A
	FijIiCBNFsqmsZjaQsuvjTJeU6nhymw2T5kawNcQMEjFw5Br8etYypJGc5Cg2B2jFISjeuaeYDV
	Uww3lMmeGbKD3VeqyRarIlUg==
X-Google-Smtp-Source: AGHT+IHA4LWeAVjEO+r2peTO50wnnWwNN8Mse9AdBHWGDit1Fg/lmR7cqT+IlIVhWoQDcyqgs6duRg==
X-Received: by 2002:a05:600c:46c3:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-454ec28092cmr53766085e9.1.1752533368031;
        Mon, 14 Jul 2025 15:49:28 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/3] hvmloader: clean up SMBIOS code style and formatting
Date: Mon, 14 Jul 2025 22:49:21 +0000
Message-Id: <8ab4c14518b4ae4eb327fb147058f0eec3ff29c7.1752533080.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752533080.git.w1benny@gmail.com>
References: <cover.1752533080.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

* Removed trailing whitespaces
* Removed unnecessary pointer casts
* Added whitespaces around &&
* Removed superfluous parentheses
* Use variables in sizeof() where applicable

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c | 162 +++++++++++++++---------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3..077c88c41c 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -67,7 +67,7 @@ static void *
 smbios_type_0_init(void *start, const char *xen_version,
                    uint32_t xen_major_version, uint32_t xen_minor_version);
 static void *
-smbios_type_1_init(void *start, const char *xen_version, 
+smbios_type_1_init(void *start, const char *xen_version,
                    uint8_t uuid[16]);
 static void *
 smbios_type_2_init(void *start);
@@ -242,8 +242,8 @@ get_memsize(void)
         sz += (((uint64_t)hvm_info->high_mem_pgend << PAGE_SHIFT) - GB(4));
 
     /*
-     * Round up to the nearest MB.  The user specifies domU pseudo-physical 
-     * memory in megabytes, so not doing this could easily lead to reporting 
+     * Round up to the nearest MB.  The user specifies domU pseudo-physical
+     * memory in megabytes, so not doing this could easily lead to reporting
      * one less MB than the user specified.
      */
     return (sz + MB(1) - 1) >> 20;
@@ -378,24 +378,24 @@ static void *
 smbios_type_0_init(void *start, const char *xen_version,
                    uint32_t xen_major_version, uint32_t xen_minor_version)
 {
-    struct smbios_type_0 *p = (struct smbios_type_0 *)start;
+    struct smbios_type_0 *p = start;
     static const char *smbios_release_date = __SMBIOS_DATE__;
     const char *s;
     void *pts;
     uint32_t length;
 
     pts = get_smbios_pt_struct(0, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE0;
-        return (start + length);
+        return start + length;
     }
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 0;
-    p->header.length = sizeof(struct smbios_type_0);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE0;
 
     p->vendor_str = 1;
@@ -411,12 +411,12 @@ smbios_type_0_init(void *start, const char *xen_version,
     /* Extended Characteristics: Enable Targeted Content Distribution. */
     p->characteristics_extension_bytes[1] = 0x04;
 
-    p->major_release = (uint8_t) xen_major_version;
-    p->minor_release = (uint8_t) xen_minor_version;
+    p->major_release = (uint8_t)xen_major_version;
+    p->minor_release = (uint8_t)xen_minor_version;
     p->embedded_controller_major = 0xff;
     p->embedded_controller_minor = 0xff;
 
-    start += sizeof(struct smbios_type_0);
+    start += sizeof(*p);
     s = xenstore_read(HVM_XS_BIOS_VENDOR, "Xen");
     strcpy((char *)start, s);
     start += strlen(s) + 1;
@@ -434,42 +434,42 @@ smbios_type_0_init(void *start, const char *xen_version,
 
 /* Type 1 -- System Information */
 static void *
-smbios_type_1_init(void *start, const char *xen_version, 
+smbios_type_1_init(void *start, const char *xen_version,
                    uint8_t uuid[16])
 {
     char uuid_str[37];
-    struct smbios_type_1 *p = (struct smbios_type_1 *)start;
+    struct smbios_type_1 *p = start;
     const char *s;
     void *pts;
     uint32_t length;
 
     pts = get_smbios_pt_struct(1, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE1;
-        return (start + length);
+        return start + length;
     }
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 1;
-    p->header.length = sizeof(struct smbios_type_1);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE1;
 
     p->manufacturer_str = 1;
     p->product_name_str = 2;
     p->version_str = 3;
     p->serial_number_str = 4;
-    
+
     memcpy(p->uuid, uuid, 16);
 
     p->wake_up_type = 0x06; /* power switch */
     p->sku_str = 0;
     p->family_str = 0;
 
-    start += sizeof(struct smbios_type_1);
-    
+    start += sizeof(*p);
+
     s = xenstore_read(HVM_XS_SYSTEM_MANUFACTURER, "Xen");
     strcpy((char *)start, s);
     start += strlen(s) + 1;
@@ -482,21 +482,21 @@ smbios_type_1_init(void *start, const char *xen_version,
     strcpy((char *)start, s);
     start += strlen(s) + 1;
 
-    uuid_to_string(uuid_str, uuid); 
+    uuid_to_string(uuid_str, uuid);
     s = xenstore_read(HVM_XS_SYSTEM_SERIAL_NUMBER, uuid_str);
     strcpy((char *)start, s);
     start += strlen(s) + 1;
 
     *((uint8_t *)start) = 0;
-    
-    return start+1; 
+
+    return start+1;
 }
 
 /* Type 2 -- System Board */
 static void *
 smbios_type_2_init(void *start)
 {
-    struct smbios_type_2 *p = (struct smbios_type_2 *)start;
+    struct smbios_type_2 *p = start;
     const char *s;
     uint8_t *ptr;
     void *pts;
@@ -504,7 +504,7 @@ smbios_type_2_init(void *start)
     unsigned int counter = 0;
 
     pts = get_smbios_pt_struct(2, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE2;
@@ -517,12 +517,12 @@ smbios_type_2_init(void *start)
                 *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;
         }
 
-        return (start + length);
+        return start + length;
     }
 
     memset(p, 0, sizeof(*p));
     p->header.type = 2;
-    p->header.length = sizeof(struct smbios_type_2);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE2;
     p->feature_flags = 0x09; /* Board is a hosting board and replaceable */
     p->chassis_handle = SMBIOS_HANDLE_TYPE3;
@@ -530,7 +530,7 @@ smbios_type_2_init(void *start)
     start += sizeof(*p);
 
     s = xenstore_read(HVM_XS_BASEBOARD_MANUFACTURER, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -538,7 +538,7 @@ smbios_type_2_init(void *start)
     }
 
     s = xenstore_read(HVM_XS_BASEBOARD_PRODUCT_NAME, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -546,7 +546,7 @@ smbios_type_2_init(void *start)
     }
 
     s = xenstore_read(HVM_XS_BASEBOARD_VERSION, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -554,7 +554,7 @@ smbios_type_2_init(void *start)
     }
 
     s = xenstore_read(HVM_XS_BASEBOARD_SERIAL_NUMBER, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -562,7 +562,7 @@ smbios_type_2_init(void *start)
     }
 
     s = xenstore_read(HVM_XS_BASEBOARD_ASSET_TAG, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -570,7 +570,7 @@ smbios_type_2_init(void *start)
     }
 
     s = xenstore_read(HVM_XS_BASEBOARD_LOCATION_IN_CHASSIS, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -591,24 +591,24 @@ smbios_type_2_init(void *start)
 static void *
 smbios_type_3_init(void *start)
 {
-    struct smbios_type_3 *p = (struct smbios_type_3 *)start;
+    struct smbios_type_3 *p = start;
     const char *s;
     void *pts;
     uint32_t length;
     uint32_t counter = 0;
 
     pts = get_smbios_pt_struct(3, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE3;
-        return (start + length);
+        return start + length;
     }
     
     memset(p, 0, sizeof(*p));
 
     p->header.type = 3;
-    p->header.length = sizeof(struct smbios_type_3);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE3;
 
     p->manufacturer_str = ++counter;
@@ -621,22 +621,22 @@ smbios_type_3_init(void *start)
     p->thermal_state = 0x03; /* safe */
     p->security_status = 0x02; /* unknown */
 
-    start += sizeof(struct smbios_type_3);
-    
+    start += sizeof(*p);
+
     s = xenstore_read(HVM_XS_ENCLOSURE_MANUFACTURER, "Xen");
     strcpy((char *)start, s);
     start += strlen(s) + 1;
 
     /* No internal defaults for following ones if the value is not set */
     s = xenstore_read(HVM_XS_ENCLOSURE_SERIAL_NUMBER, NULL);
-    if ( (s != NULL)&&(*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy((char *)start, s);
         start += strlen(s) + 1;
         p->serial_number_str = ++counter;
     }
     s = xenstore_read(HVM_XS_ENCLOSURE_ASSET_TAG, NULL);
-    if ( (s != NULL) && (*s != '\0') )
+    if ( s != NULL && *s != '\0' )
     {
         strcpy(start, s);
         start += strlen(s) + 1;
@@ -652,14 +652,14 @@ static void *
 smbios_type_4_init(
     void *start, unsigned int cpu_number, char *cpu_manufacturer)
 {
-    char buf[80]; 
-    struct smbios_type_4 *p = (struct smbios_type_4 *)start;
+    char buf[80];
+    struct smbios_type_4 *p = start;
     uint32_t eax, ebx, ecx, edx;
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 4;
-    p->header.length = sizeof(struct smbios_type_4);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE4 + cpu_number;
 
     p->socket_designation_str = 1;
@@ -684,7 +684,7 @@ smbios_type_4_init(
     p->l2_cache_handle = 0xffff; /* No cache information structure provided. */
     p->l3_cache_handle = 0xffff; /* No cache information structure provided. */
 
-    start += sizeof(struct smbios_type_4);
+    start += sizeof(*p);
 
     strncpy(buf, "CPU ", sizeof(buf));
     if ( (sizeof(buf) - strlen("CPU ")) >= 3 )
@@ -702,9 +702,9 @@ smbios_type_4_init(
 
 /* Type 11 -- OEM Strings */
 static void *
-smbios_type_11_init(void *start) 
+smbios_type_11_init(void *start)
 {
-    struct smbios_type_11 *p = (struct smbios_type_11 *)start;
+    struct smbios_type_11 *p = start;
     char path[20];
     const char *s;
     int i;
@@ -712,20 +712,20 @@ smbios_type_11_init(void *start)
     uint32_t length;
 
     pts = get_smbios_pt_struct(11, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE11;
-        return (start + length);
+        return start + length;
     }
 
     p->header.type = 11;
-    p->header.length = sizeof(struct smbios_type_11);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE11;
 
     p->count = 0;
 
-    start += sizeof(struct smbios_type_11);
+    start += sizeof(*p);
 
     /* Pull out as many oem-* strings we find in xenstore */
     for ( i = 1; i < 100; i++ )
@@ -737,7 +737,7 @@ smbios_type_11_init(void *start)
         start += strlen(s) + 1;
         p->count++;
     }
-    
+
     /* Make sure there's at least one type-11 string */
     if ( p->count == 0 )
     {
@@ -754,14 +754,14 @@ smbios_type_11_init(void *start)
 static void *
 smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
 {
-    struct smbios_type_16 *p = (struct smbios_type_16*)start;
+    struct smbios_type_16 *p = start;
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 16;
     p->header.handle = SMBIOS_HANDLE_TYPE16;
-    p->header.length = sizeof(struct smbios_type_16);
-    
+    p->header.length = sizeof(*p);
+
     p->location = 0x01; /* other */
     p->use = 0x03; /* system memory */
     p->error_correction = 0x06; /* Multi-bit ECC to make Microsoft happy */
@@ -769,7 +769,7 @@ smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
     p->memory_error_information_handle = 0xfffe; /* none provided */
     p->number_of_memory_devices = nr_mem_devs;
 
-    start += sizeof(struct smbios_type_16);
+    start += sizeof(*p);
     *((uint16_t *)start) = 0;
     return start + 2;
 }
@@ -779,12 +779,12 @@ static void *
 smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
 {
     char buf[16];
-    struct smbios_type_17 *p = (struct smbios_type_17 *)start;
-    
+    struct smbios_type_17 *p = start;
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 17;
-    p->header.length = sizeof(struct smbios_type_17);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE17 + instance;
 
     p->physical_memory_array_handle = 0x1000;
@@ -799,7 +799,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
     p->memory_type = 0x07; /* RAM */
     p->type_detail = 0;
 
-    start += sizeof(struct smbios_type_17);
+    start += sizeof(*p);
     strcpy(start, "DIMM ");
     start += strlen("DIMM ");
     itoa(buf, instance);
@@ -814,12 +814,12 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
 static void *
 smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 {
-    struct smbios_type_19 *p = (struct smbios_type_19 *)start;
-    
+    struct smbios_type_19 *p = start;
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 19;
-    p->header.length = sizeof(struct smbios_type_19);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE19 + instance;
 
     p->starting_address = instance << 24;
@@ -827,7 +827,7 @@ smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
     p->memory_array_handle = 0x1000;
     p->partition_width = 1;
 
-    start += sizeof(struct smbios_type_19);
+    start += sizeof(*p);
     *((uint16_t *)start) = 0;
     return start + 2;
 }
@@ -836,12 +836,12 @@ smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 static void *
 smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
 {
-    struct smbios_type_20 *p = (struct smbios_type_20 *)start;
+    struct smbios_type_20 *p = start;
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 20;
-    p->header.length = sizeof(struct smbios_type_20);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE20 + instance;
 
     p->starting_address = instance << 24;
@@ -852,7 +852,7 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
     p->interleave_position = 0;
     p->interleaved_data_depth = 0;
 
-    start += sizeof(struct smbios_type_20);
+    start += sizeof(*p);
 
     *((uint16_t *)start) = 0;
     return start+2;
@@ -862,18 +862,18 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
 static void *
 smbios_type_22_init(void *start)
 {
-    struct smbios_type_22 *p = (struct smbios_type_22 *)start;
+    struct smbios_type_22 *p = start;
     static const char *smbios_release_date = __SMBIOS_DATE__;
     const char *s;
     void *pts;
     uint32_t length;
 
     pts = get_smbios_pt_struct(22, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE22;
-        return (start + length);
+        return start + length;
     }
 
     s = xenstore_read(HVM_XS_SMBIOS_DEFAULT_BATTERY, "0");
@@ -883,7 +883,7 @@ smbios_type_22_init(void *start)
     memset(p, 0, sizeof(*p));
 
     p->header.type = 22;
-    p->header.length = sizeof(struct smbios_type_22);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE22;
 
     p->location_str = 1;
@@ -902,7 +902,7 @@ smbios_type_22_init(void *start)
     p->design_capacity_multiplier = 0;
     p->oem_specific = 0;
 
-    start += sizeof(struct smbios_type_22);
+    start += sizeof(*p);
 
     strcpy((char *)start, "Primary");
     start += strlen("Primary") + 1;
@@ -920,24 +920,24 @@ smbios_type_22_init(void *start)
 
     *((uint8_t *)start) = 0;
 
-    return start+1; 
+    return start+1;
 }
 
 /* Type 32 -- System Boot Information */
 static void *
 smbios_type_32_init(void *start)
 {
-    struct smbios_type_32 *p = (struct smbios_type_32 *)start;
+    struct smbios_type_32 *p = start;
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 32;
-    p->header.length = sizeof(struct smbios_type_32);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE32;
     memset(p->reserved, 0, 6);
     p->boot_status = 0; /* no errors detected */
-    
-    start += sizeof(struct smbios_type_32);
+
+    start += sizeof(*p);
     *((uint16_t *)start) = 0;
     return start+2;
 }
@@ -946,16 +946,16 @@ smbios_type_32_init(void *start)
 static void *
 smbios_type_39_init(void *start)
 {
-    struct smbios_type_39 *p = (struct smbios_type_39 *)start;
+    struct smbios_type_39 *p = start;
     void *pts;
     uint32_t length;
 
     pts = get_smbios_pt_struct(39, &length);
-    if ( (pts != NULL)&&(length > 0) )
+    if ( pts != NULL && length > 0 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE39;
-        return (start + length);
+        return start + length;
     }
 
     /* Only present when passed in */
@@ -998,15 +998,15 @@ smbios_type_vendor_oem_init(void *start)
 static void *
 smbios_type_127_init(void *start)
 {
-    struct smbios_type_127 *p = (struct smbios_type_127 *)start;
+    struct smbios_type_127 *p = start;
 
     memset(p, 0, sizeof(*p));
 
     p->header.type = 127;
-    p->header.length = sizeof(struct smbios_type_127);
+    p->header.length = sizeof(*p);
     p->header.handle = SMBIOS_HANDLE_TYPE127;
 
-    start += sizeof(struct smbios_type_127);
+    start += sizeof(*p);
     *((uint16_t *)start) = 0;
     return start + 2;
 }
-- 
2.34.1


