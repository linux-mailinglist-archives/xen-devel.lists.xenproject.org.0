Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8388AF0708
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 01:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030119.1403791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfM-0000P3-Bt; Tue, 01 Jul 2025 23:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030119.1403791; Tue, 01 Jul 2025 23:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfM-0000N4-82; Tue, 01 Jul 2025 23:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1030119;
 Tue, 01 Jul 2025 23:45:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWkfK-00085D-Sv
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 23:45:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e3a3ac-56d5-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 01:45:22 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a524caf77eso917477f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 16:45:22 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a87e947431sm14509037f8f.0.2025.07.01.16.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 16:45:20 -0700 (PDT)
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
X-Inumbo-ID: 73e3a3ac-56d5-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751413521; x=1752018321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92xZ3mXFNRETY3/2tgdNdqUaxKhMM421vmXhjEX/B/U=;
        b=DKliCH74jV/m80lT4ZLGL0mtI3BoYKFK8wvEb146fboxrLOdPeFq5I8yP8hZSyOJcl
         jXIUPJ4ujyC4QH9fU96sYLkPFT+heJLvJkL6/qtA5R37s2sQ1JFE5YhjXjtfwbiRbO0z
         6PfptOQdRCjSnMsvyS2dHWfHTXs4PsuCDe9jRk7yJ8Q4G5p97thqfHiBSoqy3PgQk3Qs
         udJzRgssC8il8uHE1iMiJ8VwafEstxi2UhKb5MDZJHtxdJ7ChT/YlqDXuqlKEKjO01bM
         0TiZECiDstvkw8QWpf/uzaGjiQbuAXD0NzUlwDcs/zuRE+FHeShy3Jh0FqAFbCmDYsIy
         1a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751413521; x=1752018321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92xZ3mXFNRETY3/2tgdNdqUaxKhMM421vmXhjEX/B/U=;
        b=IF8wei2alwC2+XDLp2u6hf9E8t5HuHpGOfQA0O00QT2RaATlqTWHNjlKdGmNc4OXqS
         X6HoYzCvpdL0X5/4Lv28slXilKecYsIvPkM7rfihP7AV3IbMNCJ3ZmSe6r8adA4XQmQ0
         NiroibVUU3PZSI1206LpyfKLLfUtEcwTBJHaDXWupeNGN84hOB84jlMWtTOe4ZZe+WQP
         v01AAgnCgpeyy/sQzkR30qkNTzpRdzzUcN0zr6DbZBGv3mZ6AssKqCjUgBZqzQdFYOO1
         3289LfAG1ZyQVWVHXFdiKKFf2G6/V8j3nd6r2gv2WD461Y+7M9jrv/IfTP1Ssd7TfC3m
         ySoQ==
X-Gm-Message-State: AOJu0YxwVCJwt/6QBIf0nPOKHxbrqn0dVJXPvKm8HEuE8omMPaXhhTR9
	+iQY08YmVgiugtJzQJOvZ8Trlu8rEVnjqA4AZRJdpmChXelXYxmOzKbIK7E5Sw==
X-Gm-Gg: ASbGnctMUsx2ELEGFYlZmEV/i9zpWnAEHBf5pdeY4ZUkUEdjRMCCEt2cvobb1mQePOE
	Bm4KDjz4pueHShkZiwBhFPhdVxhiQV5k6AyxM9vCyVJ6YJnWDSuDRy0VXwSjSPBoI2qwaqDOcNz
	UROyPyDt148fvjY3gcC7IGRXHs/xbm9lVqxOBSZCe3hOmfuwTK6u0tpE6QiEXvhQaq6+GQIJuYf
	BrpPHhpGp5516vS2MIhEMaXPBcBY5urRqYAMzz8ATku70aLjMCc3mQlZjJs//zJmW9S5qHHhR0/
	nB4c/aKeQFQmG1n/RFYQErMtY9UkMNQsJssENuiPL/csHGmgiVaBdyiqMkDqpFKshgJge1dRMGx
	5UbPjiskagwto1kjFKDaM/njbyto6YFJTFeAgwqVhcj7Zpz/+O5VYdAjx9H6v6g==
X-Google-Smtp-Source: AGHT+IG+5cade+22b5bcAnDmgHCu1cUKB3rMPWWhzP6eHMo5Zjn0QhHw5BpN95JqD/SrFg5lGGBS/Q==
X-Received: by 2002:a05:600c:3ba7:b0:453:59b5:25cc with SMTP id 5b1f17b1804b1-454a37207a8mr2489015e9.7.1751413521270;
        Tue, 01 Jul 2025 16:45:21 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] hvmloader: fix code style violations
Date: Tue,  1 Jul 2025 23:45:10 +0000
Message-Id: <fbff115ab5f3e565b07dc339d50e697ba37f7410.1751412735.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751412735.git.w1benny@gmail.com>
References: <cover.1751412735.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Preparatory commit. No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c | 56 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 97a054e9e3..fc3cdc9a25 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -378,18 +378,18 @@ static void *
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
@@ -438,17 +438,17 @@ smbios_type_1_init(void *start, const char *xen_version,
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
@@ -496,7 +496,7 @@ smbios_type_1_init(void *start, const char *xen_version,
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
@@ -517,7 +517,7 @@ smbios_type_2_init(void *start)
                 *((uint16_t*)ptr) = SMBIOS_HANDLE_TYPE3;
         }
 
-        return (start + length);
+        return start + length;
     }
 
     memset(p, 0, sizeof(*p));
@@ -591,18 +591,18 @@ smbios_type_2_init(void *start)
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
@@ -653,7 +653,7 @@ smbios_type_4_init(
     void *start, unsigned int cpu_number, char *cpu_manufacturer)
 {
     char buf[80]; 
-    struct smbios_type_4 *p = (struct smbios_type_4 *)start;
+    struct smbios_type_4 *p = start;
     uint32_t eax, ebx, ecx, edx;
 
     memset(p, 0, sizeof(*p));
@@ -704,7 +704,7 @@ smbios_type_4_init(
 static void *
 smbios_type_11_init(void *start) 
 {
-    struct smbios_type_11 *p = (struct smbios_type_11 *)start;
+    struct smbios_type_11 *p = start;
     char path[20];
     const char *s;
     int i;
@@ -712,11 +712,11 @@ smbios_type_11_init(void *start)
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
@@ -754,7 +754,7 @@ smbios_type_11_init(void *start)
 static void *
 smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
 {
-    struct smbios_type_16 *p = (struct smbios_type_16*)start;
+    struct smbios_type_16 *p = start;
 
     memset(p, 0, sizeof(*p));
 
@@ -779,7 +779,7 @@ static void *
 smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
 {
     char buf[16];
-    struct smbios_type_17 *p = (struct smbios_type_17 *)start;
+    struct smbios_type_17 *p = start;
     
     memset(p, 0, sizeof(*p));
 
@@ -814,7 +814,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
 static void *
 smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 {
-    struct smbios_type_19 *p = (struct smbios_type_19 *)start;
+    struct smbios_type_19 *p = start;
     
     memset(p, 0, sizeof(*p));
 
@@ -836,7 +836,7 @@ smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
 static void *
 smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
 {
-    struct smbios_type_20 *p = (struct smbios_type_20 *)start;
+    struct smbios_type_20 *p = start;
 
     memset(p, 0, sizeof(*p));
 
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
@@ -927,7 +927,7 @@ smbios_type_22_init(void *start)
 static void *
 smbios_type_32_init(void *start)
 {
-    struct smbios_type_32 *p = (struct smbios_type_32 *)start;
+    struct smbios_type_32 *p = start;
 
     memset(p, 0, sizeof(*p));
 
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
@@ -998,7 +998,7 @@ smbios_type_vendor_oem_init(void *start)
 static void *
 smbios_type_127_init(void *start)
 {
-    struct smbios_type_127 *p = (struct smbios_type_127 *)start;
+    struct smbios_type_127 *p = start;
 
     memset(p, 0, sizeof(*p));
 
-- 
2.34.1


