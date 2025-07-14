Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFFB04B0A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043218.1413372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0Q-00011P-08; Mon, 14 Jul 2025 22:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043218.1413372; Mon, 14 Jul 2025 22:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubS0P-0000x6-PX; Mon, 14 Jul 2025 22:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1043218;
 Mon, 14 Jul 2025 22:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c3lH=Z3=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubRzK-00047A-Hu
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:49:34 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf97821-6104-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 00:49:31 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b39c46e1cfso592687f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 15:49:31 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d4cbsm13713725f8f.50.2025.07.14.15.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:49:29 -0700 (PDT)
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
X-Inumbo-ID: cdf97821-6104-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533370; x=1753138170; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKkryV9+UDN5kxVGjPtTWriGNmK46kznagX67IaJxg0=;
        b=N7dfkbXQ5zxdeljSAGaKUERKAtmlMJ13cOgPjaHvFK8bn2Ed5aFWS9PMrfUGsFJHKM
         J7Aftfw50zV/wYphY/iuIG71sengzsAtHYVgIKZ8gu8lx41Ed4Mgz9JT5PXBw+LDrnBj
         fTdNsR1il2rndd1zial2UQsk3D3n0Ax62VJY4drnqJ/6o76QW2tVNPHXn1tchh8464gI
         kqfQ6DXnyNLEOFz0lajfTdFSICKvmI2jd1DzDIiFVnhnzpizUcrveGwOL/HOYtWi20ML
         3bt3ZEO0+gdwhjj1KQk47KWeEMOEV0u/ixb+xodRZutCJvnnyHqgQUS2EuZNQL3Ygpgn
         IUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533370; x=1753138170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKkryV9+UDN5kxVGjPtTWriGNmK46kznagX67IaJxg0=;
        b=D//9qpLdA2hFFtMV6ORUDIFascjtTJUlVX3Yw0HS+RJbJkfe4gmu63lkieUqClA1/b
         3UjaGUSezjNGYtZSRrELhawylTHIA596FcV2+Wh28qnjpIx//QMeNgwX5Llzv/q0elJM
         T0DQj1UCN3addOZEr/6/2y71EdqaVUb08XFtDf1f9cBu4yj3f5CwmQpVMkOKbmMeVvcj
         ZJls/b1bI0GkCjKh214DR5Q6cLSQlfbSm6LvAWvPwxboV13+80LXbk2iLFP05IrWJtUP
         hNdBy8j8CK9AI6OTAca+CLxhACSwrVvVYTT1W2ypVfZq9+IO2qx3ZuESoyJG0fpFfUR4
         Am3A==
X-Gm-Message-State: AOJu0YxVJ1sUEQFOoflpaG2gqSfRtdPLzqmgaC/i8g23T+TmYYK5uGD2
	GypD3iPSF/wDvBHGzlgU/oh78KQ34B9tvrKztk0FRpThPGuUXf9pNivcoHcgvg==
X-Gm-Gg: ASbGncsYAPo0654ivNE2l5uyEBZ/9Q7NPxXm9U90WuR5jkTMUCiua1K5jy7J/zHTuvZ
	YKJYqVPP/++hNcI8dHPKN3D5+EVVDcG0A2P57e1uJ6sBEqzFAhaNPuQHh/HKW3+vRBJcBArIeu/
	FNqWwB0YgiRyY2PWC/IT7cf7zw8iAVcASvRP+kT/6CZEBZI9Ml1h/x+n6rhUgbSAL+59DEbglmP
	9TSMC4rlOMWwuQ377hjvGw5vaiQcVbCFJQeUtP7dnskbIvt4CZ4GtvavwnywmaSCK6t+1LVnUQ1
	PiQuLvT7V+f2K5Dh96WEVOtzn9LWfQf51BMo1Ld2g4Hhdag2nBLztESYp9cVLxWSp6SknnN8Yf1
	o79LWd3qgTIuo3imcGP2LcY8u+SuhEWevb/YXr4gKDvcf0kpoUcjsJzw+rFyNndTgTlCQ0yaisZ
	a263bzZMS/G5oedQqXhFXOVE9tVliaVCoO
X-Google-Smtp-Source: AGHT+IFCPAfdHMRiaLedoXSkA8anV71VAGk7/bAoIMLmb4QPK6JyGT2k/mRwgIJE9QjreOUZ6NAJmA==
X-Received: by 2002:a5d:6e5e:0:b0:3a5:8934:4948 with SMTP id ffacd0b85a97d-3b5f18938eamr3999477f8f.12.1752533370380;
        Mon, 14 Jul 2025 15:49:30 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/3] hvmloader: fix SMBIOS table length checks
Date: Mon, 14 Jul 2025 22:49:22 +0000
Message-Id: <9494aa56929b5cb443b9cccb0e671510071b4aab.1752533080.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752533080.git.w1benny@gmail.com>
References: <cover.1752533080.git.w1benny@gmail.com>
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

Notably, this also fixes previously incorrect check for chassis handle in smbios_type_2_init.
Chassis handle is a WORD, therefore, the condition now correctly checks for >= 13 instead of > 13.

hvmloader currently implements version 2.4

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c       | 135 ++++++++++++------------
 tools/firmware/hvmloader/smbios_types.h |   6 +-
 2 files changed, 69 insertions(+), 72 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 077c88c41c..93bfea3e6e 100644
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
@@ -154,6 +156,25 @@ get_smbios_pt_struct(uint8_t type, uint32_t *length_out)
     return NULL;
 }
 
+static void *
+smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size)
+{
+    struct smbios_structure_header *header = start;
+
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
@@ -381,16 +402,11 @@ smbios_type_0_init(void *start, const char *xen_version,
     struct smbios_type_0 *p = start;
     static const char *smbios_release_date = __SMBIOS_DATE__;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void* next;
 
-    pts = get_smbios_pt_struct(0, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE0;
-        return start + length;
-    }
+    next = smbios_pt_copy(start, 0, SMBIOS_HANDLE_TYPE0, sizeof(*p));
+    if ( next != start )
+        return next;
 
     memset(p, 0, sizeof(*p));
 
@@ -440,16 +456,11 @@ smbios_type_1_init(void *start, const char *xen_version,
     char uuid_str[37];
     struct smbios_type_1 *p = start;
     const char *s;
-    void *pts;
-    uint32_t length;
+    void* next;
 
-    pts = get_smbios_pt_struct(1, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE1;
-        return start + length;
-    }
+    next = smbios_pt_copy(start, 1, SMBIOS_HANDLE_TYPE1, sizeof(*p));
+    if ( next != start )
+        return next;
 
     memset(p, 0, sizeof(*p));
 
@@ -499,25 +510,27 @@ smbios_type_2_init(void *start)
     struct smbios_type_2 *p = start;
     const char *s;
     uint8_t *ptr;
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
+     * which corresponds with "Asset Tag" field offset.
+     */
 
+    next = smbios_pt_copy(start, 2, SMBIOS_HANDLE_TYPE2, sizeof(*p));
+    if ( next != start )
+    {
         /* Set current chassis handle if present */
-        if ( p->header.length > 13 )
+        if ( p->header.length >= offsetof(struct smbios_type_2, board_type) )
         {
-            ptr = ((uint8_t*)start) + 11;            
+            ptr = ((uint8_t*)start) + offsetof(struct smbios_type_2,
+                                               chassis_handle);
             if ( *((uint16_t*)ptr) != 0 )
                 *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;
         }
 
-        return start + length;
+        return next;
     }
 
     memset(p, 0, sizeof(*p));
@@ -593,18 +606,18 @@ smbios_type_3_init(void *start)
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
+     * which corresponds with "OEM-defined" field offset.
+     */
+
+    next = smbios_pt_copy(start, 3, SMBIOS_HANDLE_TYPE3, sizeof(*p));
+    if ( next != start )
+        return next;
+
     memset(p, 0, sizeof(*p));
 
     p->header.type = 3;
@@ -707,17 +720,12 @@ smbios_type_11_init(void *start)
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
+    next = smbios_pt_copy(start, 11, SMBIOS_HANDLE_TYPE11, sizeof(*p));
+    if ( next != start )
+        return next;
 
     p->header.type = 11;
     p->header.length = sizeof(*p);
@@ -865,16 +873,11 @@ smbios_type_22_init(void *start)
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
+    next = smbios_pt_copy(start, 22, SMBIOS_HANDLE_TYPE22, sizeof(*p));
+    if ( next != start )
+        return next;
 
     s = xenstore_read(HVM_XS_SMBIOS_DEFAULT_BATTERY, "0");
     if ( strncmp(s, "1", 1) != 0 )
@@ -946,20 +949,14 @@ smbios_type_32_init(void *start)
 static void *
 smbios_type_39_init(void *start)
 {
-    struct smbios_type_39 *p = start;
-    void *pts;
-    uint32_t length;
-
-    pts = get_smbios_pt_struct(39, &length);
-    if ( pts != NULL && length > 0 )
-    {
-        memcpy(start, pts, length);
-        p->header.handle = SMBIOS_HANDLE_TYPE39;
-        return start + length;
-    }
+    /*
+     * Specification says Type 39 table has length of at least 10h,
+     * which corresponds with "Input Voltage Probe Handle" offset.
+     */
 
-    /* Only present when passed in */
-    return start;
+    return smbios_pt_copy(start, 39, SMBIOS_HANDLE_TYPE39,
+                          offsetof(struct smbios_type_39,
+                                   input_voltage_probe_handle));
 }
 
 static void *
diff --git a/tools/firmware/hvmloader/smbios_types.h b/tools/firmware/hvmloader/smbios_types.h
index 7c648ece71..656b2a51ad 100644
--- a/tools/firmware/hvmloader/smbios_types.h
+++ b/tools/firmware/hvmloader/smbios_types.h
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


