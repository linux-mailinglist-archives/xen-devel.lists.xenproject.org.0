Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D219BD0D01
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 00:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141653.1475827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v84Pz-00014W-Mw; Sun, 12 Oct 2025 22:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141653.1475827; Sun, 12 Oct 2025 22:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v84Pz-00012Y-HE; Sun, 12 Oct 2025 22:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1141653;
 Sun, 12 Oct 2025 22:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=//GD=4V=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1v84Py-00012S-S7
 for xen-devel@lists.xenproject.org; Sun, 12 Oct 2025 22:19:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91c030d7-a7b9-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 00:19:53 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46f9d1b186dso3609335e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 12 Oct 2025 15:19:50 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9absm174770605e9.2.2025.10.12.15.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 15:19:48 -0700 (PDT)
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
X-Inumbo-ID: 91c030d7-a7b9-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760307590; x=1760912390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CsJNxUuSl4LuFWIkY3r/r8GkJM+W7X9q9hvMbyMhgl0=;
        b=clPa87PdqlMeWsiXliAh6ZdSknyyjyf9E4292WMceWWOmedtCy2qwiDVAxuFLFu3+y
         dBrhkVd1ossdVBNlhN+a/GGZioSQeHmd1tgnbMweTAT4t81u8RQKy1NrW8U7Vn+nkKu5
         7lg9sICw7D+kMVXBSwnE+/cr+0Nwps/utMucNa9cANxLlTTO2pDM1+EZq/T0J35zXHX9
         HYgYDU72c0tiAfKW3IMNFIyCfENq7h6oOCoKIMCp8wPynoWVTcLMaF/H/rd/5zt6DsfA
         Vx4kdTOluqxIeR/QQLlfv21NCK2KuUongG4K7QbbTY1jwKvbTczqw7WbSILWEuHpwJVQ
         CRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760307590; x=1760912390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsJNxUuSl4LuFWIkY3r/r8GkJM+W7X9q9hvMbyMhgl0=;
        b=ffTlH2NrOlMrRacDKjVQWgjt85BGwu9t4VpZ+FrnbpcXohYvMoMMB1zrAhtjVVxrXb
         KM/dzkrE/SLh9uedRSir7vPujLK5UyzOvvjUzTTmE7Mg/p84MayYkC9AXtFqLFllhBd9
         yKipMKCokCXZ/ud8qpOVRtHymVCXp1gYoUuBXrBv7YRCgwkcjtXidH3fhiuzgJ9okrCS
         aMrD1ZdilV5jPjUyjfnsHQp7ZH0ts/OOENCJ1rKEW/JwlNBqGC+2hlvXuVUY/zhWoSFo
         TUqrCEuObvUwpvRy0WpJsglQ+YmhtGoPaYG5bWdZtU/sy5j/SE60hwDyKiIh7U+xfLND
         yU7g==
X-Gm-Message-State: AOJu0YySwoJVf8RfSCJA3+aM0Y0zBILTA6npyNCIdfgHRCja7W5b/Sqe
	z3r/CVOH4y3J03hsao9y4CfDyBTVCmIrUJVVmQpBP/hHddLuZzE6FLtX8tY4Ew==
X-Gm-Gg: ASbGncvVKiT7hVnl5IzKHzR04D6aeIt/i9YTHlSZ0HlR//n0d9UsAzshpmEwE6AWeZl
	Zvb0C42X0ohhoMt+OO43tkyHTyWQ664qLQZB6pY3wBTWmz1TmIHrl4IRE9W9EMRNg8psmAKgOoV
	bfZ7SNJWPxV0qtmf1uXeCiiH9GLrk8JLnIeJ/29Y75usSbh8cgU/Gs2QoI9KILdMeSg5rnm/pWI
	GkSqzcfnwSLT1NwNUPKKQukXdtK+hxCz7cbGoPNZfHmg8Zlwr5Tsq3tiY0XJy0Ay+HqAYTot1Pz
	1iwfJ2yymtJV14BVnJWbABDPg2Y/Qq0p1SPN3INe4DyDVhaX5foyR0Vab0+bEhoao4NnzPfLufv
	+0o58NaHhfwSpXM/WjcYGjnAscq4ceVqGdmHYtjxQI4DqGuS6smaR0+IUvmpKEPfzkI0BUXH+FF
	CpOV9Or31ZVKQ9by4ENmb51J/IGkEX7NopyLC4Kdgs6shQS6k2y1+PpZn5WN4uZnI=
X-Google-Smtp-Source: AGHT+IGrXBQhGMWxigmIVSzHFXo35rUtOp4ToRJ2k9lOMB15KsOtUEyrB3fZqG+p8UymsRbJf0YHqQ==
X-Received: by 2002:a05:600c:4510:b0:46e:4337:f68e with SMTP id 5b1f17b1804b1-46fa9af8523mr74251605e9.4.1760307589486;
        Sun, 12 Oct 2025 15:19:49 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	teddy.astie@vates.tech
Subject: [PATCH for-4.21] hvmloader: change constants to hex format in size checks
Date: Sun, 12 Oct 2025 22:19:40 +0000
Message-Id: <87399e2646ea89eeb0550bd08a408dbff5706540.1760307495.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Match the number format the specification gives.

No functional change.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Suggested-By: <teddy.astie@vates.tech>
---
 tools/firmware/hvmloader/smbios.c | 32 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index 76c7090d16..33ac2eee1a 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -647,7 +647,7 @@ smbios_type_3_init(void *start)
      * which corresponds with the end of the "Security Status" field.
      */
 
-    BUILD_BUG_ON(endof_field(struct smbios_type_3, security_status) != 13);
+    BUILD_BUG_ON(endof_field(struct smbios_type_3, security_status) != 0x0d);
 
     next = smbios_pt_copy(start, 3, SMBIOS_HANDLE_TYPE3,
                           offsetof(struct smbios_type_3, security_status));
@@ -706,7 +706,7 @@ smbios_type_4_init(
     uint32_t eax, ebx, ecx, edx;
 
     /* Specification says Type 4 table has length of 23h for v2.3+. */
-    BUILD_BUG_ON(sizeof(*p) != 35);
+    BUILD_BUG_ON(sizeof(*p) != 0x23);
 
     memset(p, 0, sizeof(*p));
 
@@ -757,7 +757,7 @@ static void *
 smbios_type_7_init(void *start)
 {
     /* Specification says Type 7 table has length of 13h for v2.1+. */
-    BUILD_BUG_ON(sizeof(struct smbios_type_7) != 19);
+    BUILD_BUG_ON(sizeof(struct smbios_type_7) != 0x13);
 
     /* Only present when passed in. */
     return smbios_pt_copy(start, 7, SMBIOS_HANDLE_TYPE7,
@@ -769,7 +769,7 @@ static void *
 smbios_type_8_init(void *start)
 {
     /* Specification says Type 8 table has length of 09h. */
-    BUILD_BUG_ON(sizeof(struct smbios_type_8) != 9);
+    BUILD_BUG_ON(sizeof(struct smbios_type_8) != 0x09);
 
     /* Only present when passed in. */
     return smbios_pt_copy(start, 8, SMBIOS_HANDLE_TYPE8,
@@ -781,7 +781,7 @@ static void *
 smbios_type_9_init(void *start)
 {
     /* Specification says Type 9 table has length of 0Dh for v2.1-2.5. */
-    BUILD_BUG_ON(sizeof(struct smbios_type_9) != 13);
+    BUILD_BUG_ON(sizeof(struct smbios_type_9) != 0x0d);
 
     /* Only present when passed in. */
     return smbios_pt_copy(start, 9, SMBIOS_HANDLE_TYPE9,
@@ -799,7 +799,7 @@ smbios_type_11_init(void *start)
     int i;
 
     /* Specification says Type 11 table has length of 05h. */
-    BUILD_BUG_ON(sizeof(*p) != 5);
+    BUILD_BUG_ON(sizeof(*p) != 0x05);
     
     next = smbios_pt_copy(start, 11, SMBIOS_HANDLE_TYPE11, sizeof(*p));
     if ( next != start )
@@ -843,7 +843,7 @@ smbios_type_16_init(void *start, uint32_t memsize, int nr_mem_devs)
     struct smbios_type_16 *p = start;
 
     /* Specification says Type 16 table has length of 0Fh for v2.1-2.7. */
-    BUILD_BUG_ON(sizeof(*p) != 15);
+    BUILD_BUG_ON(sizeof(*p) != 0x0f);
 
     memset(p, 0, sizeof(*p));
 
@@ -871,7 +871,7 @@ smbios_type_17_init(void *start, uint32_t memory_size_mb, int instance)
     struct smbios_type_17 *p = start;
 
     /* Specification says Type 17 table has length of 1Bh for v2.3-2.6. */
-    BUILD_BUG_ON(sizeof(*p) != 27);
+    BUILD_BUG_ON(sizeof(*p) != 0x1b);
 
     memset(p, 0, sizeof(*p));
 
@@ -909,7 +909,7 @@ smbios_type_19_init(void *start, uint32_t memory_size_mb, int instance)
     struct smbios_type_19 *p = start;
 
     /* Specification says Type 19 table has length of 0Fh for v2.1-2.7. */
-    BUILD_BUG_ON(sizeof(*p) != 15);
+    BUILD_BUG_ON(sizeof(*p) != 0x0f);
 
     memset(p, 0, sizeof(*p));
 
@@ -934,7 +934,7 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance)
     struct smbios_type_20 *p = start;
 
     /* Specification says Type 20 table has length of 13h for v2.1-2.7. */
-    BUILD_BUG_ON(sizeof(*p) != 19);
+    BUILD_BUG_ON(sizeof(*p) != 0x13);
 
     memset(p, 0, sizeof(*p));
 
@@ -966,7 +966,7 @@ smbios_type_22_init(void *start)
     void *next;
 
     /* Specification says Type 22 table has length of 1Ah. */
-    BUILD_BUG_ON(sizeof(*p) != 26);
+    BUILD_BUG_ON(sizeof(*p) != 0x1a);
 
     next = smbios_pt_copy(start, 22, SMBIOS_HANDLE_TYPE22, sizeof(*p));
     if ( next != start )
@@ -1030,7 +1030,7 @@ smbios_type_26_init(void *start)
      * Only present when passed in.
      */
 
-    BUILD_BUG_ON(endof_field(struct smbios_type_26, oem_defined) != 20);
+    BUILD_BUG_ON(endof_field(struct smbios_type_26, oem_defined) != 0x14);
 
     return smbios_pt_copy(start, 26, SMBIOS_HANDLE_TYPE26,
                           endof_field(struct smbios_type_26, oem_defined));
@@ -1047,7 +1047,7 @@ smbios_type_27_init(void *start)
      * Only present when passed in.
      */
 
-    BUILD_BUG_ON(endof_field(struct smbios_type_27, oem_defined) != 12);
+    BUILD_BUG_ON(endof_field(struct smbios_type_27, oem_defined) != 0x0c);
  
     return smbios_pt_copy(start, 27, SMBIOS_HANDLE_TYPE27,
                           endof_field(struct smbios_type_27, oem_defined));
@@ -1064,7 +1064,7 @@ smbios_type_28_init(void *start)
      * Only present when passed in.
      */
 
-    BUILD_BUG_ON(endof_field(struct smbios_type_28, oem_defined) != 20);
+    BUILD_BUG_ON(endof_field(struct smbios_type_28, oem_defined) != 0x14);
 
     return smbios_pt_copy(start, 28, SMBIOS_HANDLE_TYPE28,
                           endof_field(struct smbios_type_28, oem_defined));
@@ -1077,7 +1077,7 @@ smbios_type_32_init(void *start)
     struct smbios_type_32 *p = start;
 
     /* Specification says Type 32 table has length of at least 0Bh. */
-    BUILD_BUG_ON(sizeof(*p) != 11);
+    BUILD_BUG_ON(sizeof(*p) != 0x0b);
 
     memset(p, 0, sizeof(*p));
 
@@ -1103,7 +1103,7 @@ smbios_type_39_init(void *start)
      * Only present when passed in.
      */
 
-    BUILD_BUG_ON(endof_field(struct smbios_type_39, characteristics) != 16);
+    BUILD_BUG_ON(endof_field(struct smbios_type_39, characteristics) != 0x10);
 
     return smbios_pt_copy(start, 39, SMBIOS_HANDLE_TYPE39,
                           endof_field(struct smbios_type_39, characteristics));
-- 
2.34.1


