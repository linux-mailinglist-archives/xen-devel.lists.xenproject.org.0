Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B2B15D9B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063647.1429396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YW-0006po-V5; Wed, 30 Jul 2025 09:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063647.1429396; Wed, 30 Jul 2025 09:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3YW-0006o6-R3; Wed, 30 Jul 2025 09:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1063647;
 Wed, 30 Jul 2025 09:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06yH=2L=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uh3YU-0006HC-KA
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:57:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f3524c-6d2b-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 11:56:59 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-af240271376so72875266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:56:59 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af635a60e68sm722900966b.94.2025.07.30.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 02:56:58 -0700 (PDT)
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
X-Inumbo-ID: 88f3524c-6d2b-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753869419; x=1754474219; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+z3CYE1dbeyjgTEBryLMqPtKkk9053KfJf846t/qLw=;
        b=Z0nLqQrzaJhO5OPk1E07Pz2CLQ2jyhgbrTgmp0HDOMHijFnTiBfz41D/1+FUlwrlyk
         JkytS4crbYFlOjDLcTYNzqyMB+z9ppoUd9tO7KyN+34UrsT+ipvxirZjNOIBydyw34IP
         By2ud1dTfjFtPZsuy4/0jI/zNhb6ap7N5PhJqGFhA7iTSGecSTegWf+aqKaRxzpZXWCJ
         6QbpgMQtrGW1FlDorxRgQrLa+Hny5j/yTo4n8128yZYyl+P19mJFdsJbWx2Xx2sjI42Q
         KBmd9n0ALlYpTM8TDnEKRUOae2NEn9iRWYfh93D9sZFYoSiXIbhEAT/T8nYqUylDqEhb
         j8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869419; x=1754474219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+z3CYE1dbeyjgTEBryLMqPtKkk9053KfJf846t/qLw=;
        b=eh44JxxTSEQn7CVyIl7RyDhYHd+IQ8bsqI3NFAr8N5DjE2e2CrjsHVqr4tfBDJ1uxQ
         k8/Y92gZhibTcxy67UzaCJKoaeYVTtRNUh+/SOhlNjWs5Apxk495SW0RsnbaoIPSgsUb
         lcPe9/Y5cyEepgBl9B6W1WSsF1kK/sej1NAUbtlNjlatvC3y5VeLFFi+hzZc5S+2CGD0
         ICr3a56KmV5tbZeoRZt+mIWlyXD3fTaXicBjJhtY2KN6aIUEBAXHHCuNM7HrTNYb864f
         URnTU/Fm38qbuvWe3Su6qPZZVNJryx5Lr8fEFjx40ZLV2/8djx3sHcShSZoeWgpAiEJP
         yIjg==
X-Gm-Message-State: AOJu0YzQpKD2lD+etMJKlj6mu20+GjTKuWxIzLi2+OW5I4ltGdw3KfvT
	tlzSZjcpe3RjyzyOSPhkw5CfubEqGG6ZJz8wxac7h6ofnUutlmYtDDZEfJGw3af5Wuo=
X-Gm-Gg: ASbGncvaZM+TdEnEeYCkBsO39QyjBHbh04pdBJLPRWjsZyPVq+uXb0cU7Qnm2Jya7ZI
	0rXiV/Sh4Mu6xqRsUrEGubOn7g+jg3iuRyC9lTqIfxxVe2ptR0ilJcJv0Z2XW0a7GSTBRORpkvf
	+ynu7zP9qjBp6j07Mb8umfM06G9cIfkN0Ltjq5tniWTaEtuKqIG1rh2Gjhgi6UgMgBn8mIy9XT5
	2FB/E/vkCevBlbY5TBDu1WZE7wNHsozZV24sa1jzaoGUTIZ1MNvMxk1LVmNGym1OYs56diMr/A1
	1LjoIYNZ+UcaCfcUdmGKatgBmPpHZS1jp6aBKm0hTzKthERqfjkm3vBC/ZCZydeAruaSRdEEK97
	Tm2pwrkLbZL56118rBkv4gKe227I81mZbL3OUhnICwKfxvX6Qz+dk9niD6lQRNIF3WBlJXw2eSl
	Mf5LjMBjyuhT2AXdJPlDcTOxGk1WYnt6yg
X-Google-Smtp-Source: AGHT+IEVKAmB/poFBN03oCthRMQZ54jlAT2IJIKcGbwZDfONSQJzb4bkL823yAWk8bQxcPdZfTq64g==
X-Received: by 2002:a17:907:d7c9:b0:ae0:ba0e:ae59 with SMTP id a640c23a62f3a-af8fd7642c0mr152005566b.7.1753869418740;
        Wed, 30 Jul 2025 02:56:58 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 2/3] hvmloader: fix SMBIOS table length checks
Date: Wed, 30 Jul 2025 09:56:52 +0000
Message-Id: <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1753869323.git.w1benny@gmail.com>
References: <cover.1753869323.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

SMBIOS specification dictates that tables should have a minimal length.
This commit introduces further validation for user-input SMBIOS tables.

As per SMBIOS Reference Specification:
* Type 0: For version 2.3 and later implementations, the length is at least 14h
* Type 1: 1Bh for 2.4 and later
* Type 2: at least 08h
* Type 3: 0Dh for version 2.1 and later
* Type 11: 5h (+ strings)
* Type 22: 1Ah (+ strings)
* Type 39: a minimum of 10h

Notably, this also fixes previously incorrect check for chassis handle in
smbios_type_2_init. Chassis handle is a WORD, therefore, the condition now
correctly checks for >= 13 instead of > 13.

hvmloader currently implements version 2.4

Furthermore, this commit introduces smbios_pt_copy helper function to substitute
previously repeating pattern of locating the struct in physical memory (via
get_smbios_pt_struct), checking the length and copying it into SMBIOS region.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c       | 179 ++++++++++++++----------
 tools/firmware/hvmloader/smbios_types.h |  32 ++---
 2 files changed, 124 insertions(+), 87 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 6bcdcc233a..3af1b8a7ba 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -47,6 +47,8 @@ static void
 smbios_pt_init(void);
 static void*
 get_smbios_pt_struct(uint8_t type, uint32_t *length_out);
+static void *
+smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size);
 static void
 get_cpu_manufacturer(char *buf, int len);
 static int
@@ -154,6 +156,24 @@ get_smbios_pt_struct(uint8_t type, uint32_t *length_out)
     return NULL;
 }
 
+static void *
+smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size)
+{
+    struct smbios_structure_header *header = start;
+    void *pts;
+    uint32_t length;
+
+    pts = get_smbios_pt_struct(type, &length);
+    if ( pts != NULL && length >= table_size )
+    {
+        memcpy(start, pts, length);
+        header->handle = handle;
+        return start + length;
+    }
+
+    return start;
+}
+
 static void
 get_cpu_manufacturer(char *buf, int len)
 {
@@ -381,16 +401,17 @@ smbios_type_0_init(void *start, const char *xen_version,
     struct smbios_type_0 *p = start;
     static const char *smbios_release_date = __SMBIOS_DATE__;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void *next;
 
-    pts = get_smbios_pt_struct(0, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE0;
-        return start + length;
-    }
+    /*
+     * Specification says Type 0 table has length of at least 18h for v2.4-3.0.
+     */
+
+    BUILD_BUG_ON(sizeof(*p) != 24);
+
+    next = smbios_pt_copy(start, 0, SMBIOS_HANDLE_TYPE0, sizeof(*p));
+    if ( next != start )
+        return next;
 
     memset(p, 0, sizeof(*p));
 
@@ -440,16 +461,14 @@ smbios_type_1_init(void *start, const char *xen_version,
     char uuid_str[37];
     struct smbios_type_1 *p = start;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void *next;
 
-    pts = get_smbios_pt_struct(1, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE1;
-        return start + length;
-    }
+    /* Specification says Type 1 table has length of 1Bh for v2.4 and later. */
+    BUILD_BUG_ON(sizeof(*p) != 27);
+
+    next = smbios_pt_copy(start, 1, SMBIOS_HANDLE_TYPE1, sizeof(*p));
+    if ( next != start )
+        return next;
 
     memset(p, 0, sizeof(*p));
 
@@ -498,26 +517,30 @@ smbios_type_2_init(void *start)
 {
     struct smbios_type_2 *p = start;
     const char *s;
-    uint8_t *ptr;
-    void *pts;
-    uint32_t length;
+    void *next;
     unsigned int counter = 0;
 
-    pts = get_smbios_pt_struct(2, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE2;
+    /*
+     * Specification says Type 2 table has length of at least 08h,
+     * which corresponds with the end of the "Serial Number" field.
+     */
+
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_2, serial_number_str) != 8);
 
+    next = smbios_pt_copy(start, 2, SMBIOS_HANDLE_TYPE2,
+                          offsetof_end(struct smbios_type_3,
+                                       serial_number_str));
+    if ( next != start )
+    {
         /* Set current chassis handle if present */
-        if ( p->header.length > 13 )
+        if ( p->header.length >= offsetof_end(struct smbios_type_2,
+                                              chassis_handle) )
         {
-            ptr = ((uint8_t*)start) + 11;            
-            if ( *((uint16_t*)ptr) != 0 )
-                *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;
+            if ( p->chassis_handle != 0 )
+                p->chassis_handle = SMBIOS_HANDLE_TYPE3;
         }
 
-        return start + length;
+        return next;
     }
 
     memset(p, 0, sizeof(*p));
@@ -593,18 +616,21 @@ smbios_type_3_init(void *start)
 {
     struct smbios_type_3 *p = start;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void *next;
     uint32_t counter = 0;
 
-    pts = get_smbios_pt_struct(3, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE3;
-        return start + length;
-    }
-    
+    /*
+     * Specification says Type 3 table has length of at least 0Dh (for v2.1+),
+     * which corresponds with the end of the "Security Status" field.
+     */
+
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_3, security_status) != 13);
+
+    next = smbios_pt_copy(start, 3, SMBIOS_HANDLE_TYPE3,
+                          offsetof(struct smbios_type_3, security_status));
+    if ( next != start )
+        return next;
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 3;
@@ -656,6 +682,9 @@ smbios_type_4_init(
     struct smbios_type_4 *p = start;
     uint32_t eax, ebx, ecx, edx;
 
+    /* Specification says Type 4 table has length of 23h for v2.3+. */
+    BUILD_BUG_ON(sizeof(*p) != 35);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 4;
@@ -707,17 +736,15 @@ smbios_type_11_init(void *start)
     struct smbios_type_11 *p = start;
     char path[20];
     const char *s;
+    void *next;
     int i;
-    void *pts;
-    uint32_t length;
 
-    pts = get_smbios_pt_struct(11, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE11;
-        return start + length;
-    }
+    /* Specification says Type 11 table has length of 05h. */
+    BUILD_BUG_ON(sizeof(*p) != 5);
+    
+    next = smbios_pt_copy(start, 11, SMBIOS_HANDLE_TYPE11, sizeof(*p));
+    if ( next != start )
+        return next;
 
     p->header.type = 11;
     p->header.length = sizeof(*p);
@@ -756,6 +783,9 @@ smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
 {
     struct smbios_type_16 *p = start;
 
+    /* Specification says Type 16 table has length of 0Fh for v2.1-2.7. */
+    BUILD_BUG_ON(sizeof(*p) != 15);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 16;
@@ -781,6 +811,9 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
     char buf[16];
     struct smbios_type_17 *p = start;
 
+    /* Specification says Type 17 table has length of 1Bh for v2.3-2.6. */
+    BUILD_BUG_ON(sizeof(*p) != 27);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 17;
@@ -816,6 +849,9 @@ smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 {
     struct smbios_type_19 *p = start;
 
+    /* Specification says Type 19 table has length of 0Fh for v2.1-2.7. */
+    BUILD_BUG_ON(sizeof(*p) != 15);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 19;
@@ -838,6 +874,9 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
 {
     struct smbios_type_20 *p = start;
 
+    /* Specification says Type 20 table has length of 13h for v2.1-2.7. */
+    BUILD_BUG_ON(sizeof(*p) != 19);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 20;
@@ -865,16 +904,14 @@ smbios_type_22_init(void *start)
     struct smbios_type_22 *p = start;
     static const char *smbios_release_date = __SMBIOS_DATE__;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void *next;
 
-    pts = get_smbios_pt_struct(22, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE22;
-        return start + length;
-    }
+    /* Specification says Type 22 table has length of 1Ah. */
+    BUILD_BUG_ON(sizeof(*p) != 26);
+
+    next = smbios_pt_copy(start, 22, SMBIOS_HANDLE_TYPE22, sizeof(*p));
+    if ( next != start )
+        return next;
 
     s = xenstore_read(HVM_XS_SMBIOS_DEFAULT_BATTERY, "0");
     if ( strncmp(s, "1", 1) != 0 )
@@ -929,6 +966,9 @@ smbios_type_32_init(void *start)
 {
     struct smbios_type_32 *p = start;
 
+    /* Specification says Type 32 table has length of at least 0Bh. */
+    BUILD_BUG_ON(sizeof(*p) != 11);
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 32;
@@ -946,20 +986,17 @@ smbios_type_32_init(void *start)
 static void *
 smbios_type_39_init(void *start)
 {
-    struct smbios_type_39 *p = start;
-    void *pts;
-    uint32_t length;
+    /*
+     * Specification says Type 39 table has length of at least 10h,
+     * which corresponds with the end of the "Characteristics" field.
+     *
+     * Only present when passed in.
+     */
 
-    pts = get_smbios_pt_struct(39, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE39;
-        return start + length;
-    }
+    BUILD_BUG_ON(offsetof_end(struct smbios_type_39, characteristics) != 16);
 
-    /* Only present when passed in */
-    return start;
+    return smbios_pt_copy(start, 39, SMBIOS_HANDLE_TYPE39,
+                          offsetof_end(struct smbios_type_39, characteristics));
 }
 
 static void *
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..a04d194975 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
@@ -90,13 +90,13 @@ struct smbios_type_2 {
     uint8_t product_name_str;
     uint8_t version_str;
     uint8_t serial_number_str;
-    uint8_t asset_tag_str;
-    uint8_t feature_flags;
-    uint8_t location_in_chassis_str;
-    uint16_t chassis_handle;
-    uint8_t board_type;
-    uint8_t contained_handle_count;
-    uint16_t contained_handles[];
+    uint8_t asset_tag_str;                  /* Optional */
+    uint8_t feature_flags;                  /* Optional */
+    uint8_t location_in_chassis_str;        /* Optional */
+    uint16_t chassis_handle;                /* Optional */
+    uint8_t board_type;                     /* Optional */
+    uint8_t contained_handle_count;         /* Optional */
+    uint16_t contained_handles[];           /* Optional */
 } __attribute__ ((packed));
 
 /* System Enclosure - Contained Elements */
@@ -118,12 +118,12 @@ struct smbios_type_3 {
     uint8_t power_supply_state;
     uint8_t thermal_state;
     uint8_t security_status;
-    uint32_t oem_specific;
-    uint8_t height;
-    uint8_t number_of_power_cords;
-    uint8_t contained_element_count;
-    uint8_t contained_element_length;
-    struct smbios_contained_element contained_elements[];
+    uint32_t oem_specific;                  /* Optional */
+    uint8_t height;                         /* Optional */
+    uint8_t number_of_power_cords;          /* Optional */
+    uint8_t contained_element_count;        /* Optional */
+    uint8_t contained_element_length;       /* Optional */
+    struct smbios_contained_element contained_elements[]; /* Optional */
 } __attribute__ ((packed));
 
 /* SMBIOS type 4 - Processor Information */
@@ -252,9 +252,9 @@ struct smbios_type_39 {
     uint8_t revision_level_str;
     uint16_t max_capacity;
     uint16_t characteristics;
-    uint16_t input_voltage_probe_handle;
-    uint16_t cooling_device_handle;
-    uint16_t input_current_probe_handle;
+    uint16_t input_voltage_probe_handle;    /* Optional */
+    uint16_t cooling_device_handle;         /* Optional */
+    uint16_t input_current_probe_handle;    /* Optional */
 } __attribute__ ((packed));
 
 /* SMBIOS type 127 -- End-of-table */
-- 
2.34.1


