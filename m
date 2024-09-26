Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C223298746A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805486.1216618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoXI-0001ba-FE; Thu, 26 Sep 2024 13:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805486.1216618; Thu, 26 Sep 2024 13:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stoXI-0001ZH-BS; Thu, 26 Sep 2024 13:28:00 +0000
Received: by outflank-mailman (input) for mailman id 805486;
 Thu, 26 Sep 2024 13:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stoXG-0001Dt-PE
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:27:59 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2338c4a5-7c0b-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 15:27:55 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5365928acd0so1349919e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 06:27:55 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34790sm350901266b.31.2024.09.26.06.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 06:27:50 -0700 (PDT)
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
X-Inumbo-ID: 2338c4a5-7c0b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727357274; x=1727962074; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ukZAuyjxSZlEVI/iOP+kkaa9x75Uo8NYb9Z1V6CSBS4=;
        b=XZZyxGXHZZjAX83LNX9Bu0USCJ7809o5CzPTldRKt3rzrcNA/g//VQ1vIQigaLzpBU
         DSvAFrCpHshWwxgxsbB/q7HdLUwM4gBaXRL1CGT8k1uPTTSKPswnr2OLx7+CBCfziDK3
         NAGYcNGcYpyk0GlmiqX76ZiXERbGKWDFWxxIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727357274; x=1727962074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukZAuyjxSZlEVI/iOP+kkaa9x75Uo8NYb9Z1V6CSBS4=;
        b=hpnIsiXjXaYYV5ceGBJD8ZC/LOlaILQSOISvq3AZQ5xbtmcXp5i/RtRZdNio+/42xz
         Vx96R0RvRgvHgENXfRsUXge1GV/Ax7PPuN74IckCz2w4rRxy82Fm3xPv4XZUkub7+vmH
         ZHqDJANEOhXmc0JP51wYtdT+KGYRGMjgjrUd6XmPer7C8VSGV344lJDUmfiKCqiAFAO7
         q2L6FkJr0fEr6h7PFzHnV0rHRlZM9ZoAZyT6zZArbEp5ibM7oR2FW/NI5elJ8Hx1Au2P
         5n6d4iB3CCiRJZmOb2Ubhwi566LbjFzXxTy3YJZz7YZypCzYMHlSF/lfAhYYQlFvJPK7
         PMgw==
X-Gm-Message-State: AOJu0Yz6Qc8JkNz7sOBqTfYdoYQlaot7rj9yuOt34/vhY3pWkmpcO+xy
	3K1qXMgTiHs0pGLM4ZtXqDirBbJljjqAC+ZtGK4Pbg+Riifbi8S3tEVTwMgX6SO+DitodAisRNp
	o
X-Google-Smtp-Source: AGHT+IESOVYJufbvTgPADg0SNmQoDy0wfQHwyzbWlEThf389y+UfrkGYbMkbxRKDP+q/O4xpvvN5mA==
X-Received: by 2002:a05:6512:1110:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-5387a42cbe2mr4582161e87.49.1727357271051;
        Thu, 26 Sep 2024 06:27:51 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] drivers/video: Convert source files to UTF-8
Date: Thu, 26 Sep 2024 14:27:41 +0100
Message-Id: <20240926132741.685791-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of the tools nowadays assume this encoding.
These files do not specify any encoding so convert them to the default.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/drivers/video/font_8x14.c | 256 +++++++++++++++++-----------------
 xen/drivers/video/font_8x16.c | 256 +++++++++++++++++-----------------
 xen/drivers/video/font_8x8.c  | 256 +++++++++++++++++-----------------
 3 files changed, 384 insertions(+), 384 deletions(-)

diff --git a/xen/drivers/video/font_8x14.c b/xen/drivers/video/font_8x14.c
index e80d178c38..aa3675b206 100644
--- a/xen/drivers/video/font_8x14.c
+++ b/xen/drivers/video/font_8x14.c
@@ -2059,7 +2059,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 128 0x80 'üà */
+    /* 128 0x80 '¬ü¬à */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
     0x66, /* 01100110 */
@@ -2075,7 +2075,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x70, /* 01110000 */
     0x00, /* 00000000 */
 
-    /* 129 0x81 '°à */
+    /* 129 0x81 '¬°¬à */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
     0x00, /* 00000000 */
@@ -2091,7 +2091,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 130 0x82 '£à */
+    /* 130 0x82 '¬£¬à */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2107,7 +2107,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 131 0x83 '•à */
+    /* 131 0x83 '¬•¬à */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2123,7 +2123,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 132 0x84 'ßà */
+    /* 132 0x84 '¬ß¬à */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
     0x00, /* 00000000 */
@@ -2139,7 +2139,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 133 0x85 '©à */
+    /* 133 0x85 '¬©¬à */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
@@ -2155,7 +2155,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 134 0x86 '´à */
+    /* 134 0x86 '¬´¬à */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x38, /* 00111000 */
@@ -2171,7 +2171,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 135 0x87 '≠à */
+    /* 135 0x87 '¬≠¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2187,7 +2187,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x70, /* 01110000 */
     0x00, /* 00000000 */
 
-    /* 136 0x88 'Øà */
+    /* 136 0x88 '¬Ø¬à */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2203,7 +2203,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 137 0x89 '±à */
+    /* 137 0x89 '¬±¬à */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2219,7 +2219,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 138 0x8a '≥à */
+    /* 138 0x8a '¬≥¬à */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
@@ -2235,7 +2235,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 139 0x8b 'µà */
+    /* 139 0x8b '¬µ¬à */
     0x00, /* 00000000 */
     0x66, /* 01100110 */
     0x00, /* 00000000 */
@@ -2251,7 +2251,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 140 0x8c '∑à */
+    /* 140 0x8c '¬∑¬à */
     0x18, /* 00011000 */
     0x3c, /* 00111100 */
     0x66, /* 01100110 */
@@ -2267,7 +2267,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 141 0x8d 'πà */
+    /* 141 0x8d '¬π¬à */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
@@ -2283,7 +2283,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 142 0x8e 'ªà */
+    /* 142 0x8e '¬ª¬à */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0x10, /* 00010000 */
@@ -2299,7 +2299,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 143 0x8f 'Ωà */
+    /* 143 0x8f '¬Ω¬à */
     0x6c, /* 01101100 */
     0x38, /* 00111000 */
     0x10, /* 00010000 */
@@ -2315,7 +2315,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 144 0x90 'øà */
+    /* 144 0x90 '¬ø¬à */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
@@ -2331,7 +2331,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 145 0x91 '¡à */
+    /* 145 0x91 '√Å¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2347,7 +2347,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 146 0x92 '√à */
+    /* 146 0x92 '√É¬à */
     0x00, /* 00000000 */
     0x3e, /* 00111110 */
     0x6c, /* 01101100 */
@@ -2363,7 +2363,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 147 0x93 '≈à */
+    /* 147 0x93 '√Ö¬à */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2379,7 +2379,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 148 0x94 '«à */
+    /* 148 0x94 '√á¬à */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2395,7 +2395,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 149 0x95 '…à */
+    /* 149 0x95 '√â¬à */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
@@ -2411,7 +2411,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 150 0x96 'Àà */
+    /* 150 0x96 '√ã¬à */
     0x30, /* 00110000 */
     0x78, /* 01111000 */
     0xcc, /* 11001100 */
@@ -2427,7 +2427,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 151 0x97 'Õà */
+    /* 151 0x97 '√ç¬à */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
@@ -2443,7 +2443,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 152 0x98 'œà */
+    /* 152 0x98 '√è¬à */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2459,7 +2459,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x0c, /* 00001100 */
     0x78, /* 01111000 */
 
-    /* 153 0x99 '—à */
+    /* 153 0x99 '√ë¬à */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0x7c, /* 01111100 */
@@ -2475,7 +2475,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 154 0x9a '”à */
+    /* 154 0x9a '√ì¬à */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -2491,7 +2491,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 155 0x9b '’à */
+    /* 155 0x9b '√ï¬à */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x7c, /* 01111100 */
@@ -2507,7 +2507,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 156 0x9c '◊à */
+    /* 156 0x9c '√ó¬à */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x64, /* 01100100 */
@@ -2523,7 +2523,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 157 0x9d 'Ÿà */
+    /* 157 0x9d '√ô¬à */
     0x00, /* 00000000 */
     0x66, /* 01100110 */
     0x66, /* 01100110 */
@@ -2539,7 +2539,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 158 0x9e '€à */
+    /* 158 0x9e '√õ¬à */
     0xf8, /* 11111000 */
     0xcc, /* 11001100 */
     0xcc, /* 11001100 */
@@ -2555,7 +2555,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 159 0x9f '›à */
+    /* 159 0x9f '√ù¬à */
     0x0e, /* 00001110 */
     0x1b, /* 00011011 */
     0x18, /* 00011000 */
@@ -2571,7 +2571,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 160 0xa0 '†' */
+    /* 160 0xa0 '¬†' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0x60, /* 01100000 */
@@ -2587,7 +2587,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 161 0xa1 '°' */
+    /* 161 0xa1 '¬°' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2603,7 +2603,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 162 0xa2 '¢' */
+    /* 162 0xa2 '¬¢' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0x60, /* 01100000 */
@@ -2619,7 +2619,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 163 0xa3 '£' */
+    /* 163 0xa3 '¬£' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0x60, /* 01100000 */
@@ -2635,7 +2635,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 164 0xa4 '§' */
+    /* 164 0xa4 '¬§' */
     0x00, /* 00000000 */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
@@ -2651,7 +2651,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 165 0xa5 '•' */
+    /* 165 0xa5 '¬•' */
     0xdc, /* 11011100 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -2667,7 +2667,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 166 0xa6 '¶' */
+    /* 166 0xa6 '¬¶' */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
     0x6c, /* 01101100 */
@@ -2683,7 +2683,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 167 0xa7 'ß' */
+    /* 167 0xa7 '¬ß' */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2699,7 +2699,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 168 0xa8 '®' */
+    /* 168 0xa8 '¬®' */
     0x00, /* 00000000 */
     0x30, /* 00110000 */
     0x30, /* 00110000 */
@@ -2715,7 +2715,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 169 0xa9 '©' */
+    /* 169 0xa9 '¬©' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2731,7 +2731,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 170 0xaa '™' */
+    /* 170 0xaa '¬™' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2747,7 +2747,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 171 0xab '´' */
+    /* 171 0xab '¬´' */
     0x60, /* 01100000 */
     0xe0, /* 11100000 */
     0x62, /* 01100010 */
@@ -2763,7 +2763,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x3e, /* 00111110 */
     0x00, /* 00000000 */
 
-    /* 172 0xac '¨' */
+    /* 172 0xac '¬¨' */
     0x60, /* 01100000 */
     0xe0, /* 11100000 */
     0x62, /* 01100010 */
@@ -2779,7 +2779,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x06, /* 00000110 */
     0x00, /* 00000000 */
 
-    /* 173 0xad '≠' */
+    /* 173 0xad '¬≠' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2795,7 +2795,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 174 0xae 'Æ' */
+    /* 174 0xae '¬Æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2811,7 +2811,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 175 0xaf 'Ø' */
+    /* 175 0xaf '¬Ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2827,7 +2827,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 176 0xb0 '∞' */
+    /* 176 0xb0 '¬∞' */
     0x44, /* 01000100 */
     0x11, /* 00010001 */
     0x44, /* 01000100 */
@@ -2843,7 +2843,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x44, /* 01000100 */
     0x11, /* 00010001 */
 
-    /* 177 0xb1 '±' */
+    /* 177 0xb1 '¬±' */
     0xaa, /* 10101010 */
     0x55, /* 01010101 */
     0xaa, /* 10101010 */
@@ -2859,7 +2859,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0xaa, /* 10101010 */
     0x55, /* 01010101 */
 
-    /* 178 0xb2 '≤' */
+    /* 178 0xb2 '¬≤' */
     0x77, /* 01110111 */
     0xdd, /* 11011101 */
     0x77, /* 01110111 */
@@ -2875,7 +2875,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x77, /* 01110111 */
     0xdd, /* 11011101 */
 
-    /* 179 0xb3 '≥' */
+    /* 179 0xb3 '¬≥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2891,7 +2891,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 180 0xb4 '¥' */
+    /* 180 0xb4 '¬¥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2907,7 +2907,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 181 0xb5 'µ' */
+    /* 181 0xb5 '¬µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2923,7 +2923,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 182 0xb6 '∂' */
+    /* 182 0xb6 '¬∂' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2939,7 +2939,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 183 0xb7 '∑' */
+    /* 183 0xb7 '¬∑' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2955,7 +2955,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 184 0xb8 '∏' */
+    /* 184 0xb8 '¬∏' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2971,7 +2971,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 185 0xb9 'π' */
+    /* 185 0xb9 '¬π' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2987,7 +2987,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 186 0xba '∫' */
+    /* 186 0xba '¬∫' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3003,7 +3003,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 187 0xbb 'ª' */
+    /* 187 0xbb '¬ª' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3019,7 +3019,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 188 0xbc 'º' */
+    /* 188 0xbc '¬º' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3035,7 +3035,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 189 0xbd 'Ω' */
+    /* 189 0xbd '¬Ω' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3051,7 +3051,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 190 0xbe 'æ' */
+    /* 190 0xbe '¬æ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3067,7 +3067,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 191 0xbf 'ø' */
+    /* 191 0xbf '¬ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3083,7 +3083,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 192 0xc0 '¿' */
+    /* 192 0xc0 '√Ä' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3099,7 +3099,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 193 0xc1 '¡' */
+    /* 193 0xc1 '√Å' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3115,7 +3115,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 194 0xc2 '¬' */
+    /* 194 0xc2 '√Ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3131,7 +3131,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 195 0xc3 '√' */
+    /* 195 0xc3 '√É' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3147,7 +3147,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 196 0xc4 'ƒ' */
+    /* 196 0xc4 '√Ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3163,7 +3163,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 197 0xc5 '≈' */
+    /* 197 0xc5 '√Ö' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3179,7 +3179,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 198 0xc6 '∆' */
+    /* 198 0xc6 '√Ü' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3195,7 +3195,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 199 0xc7 '«' */
+    /* 199 0xc7 '√á' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3211,7 +3211,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 200 0xc8 '»' */
+    /* 200 0xc8 '√à' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3227,7 +3227,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 201 0xc9 '…' */
+    /* 201 0xc9 '√â' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3243,7 +3243,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 202 0xca ' ' */
+    /* 202 0xca '√ä' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3259,7 +3259,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 203 0xcb 'À' */
+    /* 203 0xcb '√ã' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3275,7 +3275,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 204 0xcc 'Ã' */
+    /* 204 0xcc '√å' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3291,7 +3291,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 205 0xcd 'Õ' */
+    /* 205 0xcd '√ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3307,7 +3307,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 206 0xce 'Œ' */
+    /* 206 0xce '√é' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3323,7 +3323,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 207 0xcf 'œ' */
+    /* 207 0xcf '√è' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3339,7 +3339,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 208 0xd0 '–' */
+    /* 208 0xd0 '√ê' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3355,7 +3355,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 209 0xd1 '—' */
+    /* 209 0xd1 '√ë' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3371,7 +3371,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 210 0xd2 '“' */
+    /* 210 0xd2 '√í' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3387,7 +3387,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 211 0xd3 '”' */
+    /* 211 0xd3 '√ì' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3403,7 +3403,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 212 0xd4 '‘' */
+    /* 212 0xd4 '√î' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3419,7 +3419,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 213 0xd5 '’' */
+    /* 213 0xd5 '√ï' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3435,7 +3435,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 214 0xd6 '÷' */
+    /* 214 0xd6 '√ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3451,7 +3451,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 215 0xd7 '◊' */
+    /* 215 0xd7 '√ó' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3467,7 +3467,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 216 0xd8 'ÿ' */
+    /* 216 0xd8 '√ò' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3483,7 +3483,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 217 0xd9 'Ÿ' */
+    /* 217 0xd9 '√ô' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3499,7 +3499,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 218 0xda '⁄' */
+    /* 218 0xda '√ö' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3515,7 +3515,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 219 0xdb '€' */
+    /* 219 0xdb '√õ' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -3531,7 +3531,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 220 0xdc '‹' */
+    /* 220 0xdc '√ú' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3547,7 +3547,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 221 0xdd '›' */
+    /* 221 0xdd '√ù' */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
@@ -3563,7 +3563,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
 
-    /* 222 0xde 'ﬁ' */
+    /* 222 0xde '√û' */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
@@ -3579,7 +3579,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
 
-    /* 223 0xdf 'ﬂ' */
+    /* 223 0xdf '√ü' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -3595,7 +3595,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 224 0xe0 'ﬂà */
+    /* 224 0xe0 '√ü¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3611,7 +3611,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 225 0xe1 '·à */
+    /* 225 0xe1 '√°¬à */
     0x00, /* 00000000 */
     0x78, /* 01111000 */
     0xcc, /* 11001100 */
@@ -3627,7 +3627,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 226 0xe2 '„à */
+    /* 226 0xe2 '√£¬à */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
     0xc6, /* 11000110 */
@@ -3643,7 +3643,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 227 0xe3 'Âà */
+    /* 227 0xe3 '√•¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3659,7 +3659,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 228 0xe4 'Áà */
+    /* 228 0xe4 '√ß¬à */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
     0xc6, /* 11000110 */
@@ -3675,7 +3675,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 229 0xe5 'Èà */
+    /* 229 0xe5 '√©¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3691,7 +3691,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 230 0xe6 'Îà */
+    /* 230 0xe6 '√´¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3707,7 +3707,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x60, /* 01100000 */
     0xc0, /* 11000000 */
 
-    /* 231 0xe7 'Ìà */
+    /* 231 0xe7 '√≠¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3723,7 +3723,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 232 0xe8 'Ôà */
+    /* 232 0xe8 '√Ø¬à */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
     0x18, /* 00011000 */
@@ -3739,7 +3739,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 233 0xe9 'Òà */
+    /* 233 0xe9 '√±¬à */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -3755,7 +3755,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 234 0xea 'Ûà */
+    /* 234 0xea '√≥¬à */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -3771,7 +3771,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 235 0xeb 'ıà */
+    /* 235 0xeb '√µ¬à */
     0x00, /* 00000000 */
     0x1e, /* 00011110 */
     0x30, /* 00110000 */
@@ -3787,7 +3787,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 236 0xec '˜à */
+    /* 236 0xec '√∑¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3803,7 +3803,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 237 0xed '˘à */
+    /* 237 0xed '√π¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x03, /* 00000011 */
@@ -3819,7 +3819,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 238 0xee '˚à */
+    /* 238 0xee '√ª¬à */
     0x00, /* 00000000 */
     0x1c, /* 00011100 */
     0x30, /* 00110000 */
@@ -3835,7 +3835,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 239 0xef '˝à */
+    /* 239 0xef '√Ω¬à */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7c, /* 01111100 */
@@ -3851,7 +3851,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 240 0xf0 '' */
+    /* 240 0xf0 '√∞' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3867,7 +3867,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 241 0xf1 'Ò' */
+    /* 241 0xf1 '√±' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3883,7 +3883,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 242 0xf2 'Ú' */
+    /* 242 0xf2 '√≤' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x30, /* 00110000 */
@@ -3899,7 +3899,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 243 0xf3 'Û' */
+    /* 243 0xf3 '√≥' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x0c, /* 00001100 */
@@ -3915,7 +3915,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 244 0xf4 'Ù' */
+    /* 244 0xf4 '√¥' */
     0x00, /* 00000000 */
     0x0e, /* 00001110 */
     0x1b, /* 00011011 */
@@ -3931,7 +3931,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 245 0xf5 'ı' */
+    /* 245 0xf5 '√µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3947,7 +3947,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 246 0xf6 'ˆ' */
+    /* 246 0xf6 '√∂' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3963,7 +3963,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 247 0xf7 '˜' */
+    /* 247 0xf7 '√∑' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3979,7 +3979,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 248 0xf8 '¯' */
+    /* 248 0xf8 '√∏' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x6c, /* 01101100 */
@@ -3995,7 +3995,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 249 0xf9 '˘' */
+    /* 249 0xf9 '√π' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4011,7 +4011,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 250 0xfa '˙' */
+    /* 250 0xfa '√∫' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4027,7 +4027,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 251 0xfb '˚' */
+    /* 251 0xfb '√ª' */
     0x0f, /* 00001111 */
     0x0c, /* 00001100 */
     0x0c, /* 00001100 */
@@ -4043,7 +4043,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 252 0xfc '¸' */
+    /* 252 0xfc '√º' */
     0x6c, /* 01101100 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -4059,7 +4059,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 253 0xfd '˝' */
+    /* 253 0xfd '√Ω' */
     0x3c, /* 00111100 */
     0x66, /* 01100110 */
     0x0c, /* 00001100 */
@@ -4075,7 +4075,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 254 0xfe '˛' */
+    /* 254 0xfe '√æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4091,7 +4091,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 255 0xff 'ˇ' */
+    /* 255 0xff '√ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
diff --git a/xen/drivers/video/font_8x16.c b/xen/drivers/video/font_8x16.c
index c65f98dcbb..f5d89d0a83 100644
--- a/xen/drivers/video/font_8x16.c
+++ b/xen/drivers/video/font_8x16.c
@@ -2315,7 +2315,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 128 0x80 'Ä' */
+    /* 128 0x80 '¬Ä' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
@@ -2333,7 +2333,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 129 0x81 'Å' */
+    /* 129 0x81 '¬Å' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
@@ -2351,7 +2351,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 130 0x82 'Ç' */
+    /* 130 0x82 '¬Ç' */
     0x00, /* 00000000 */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
@@ -2369,7 +2369,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 131 0x83 'É' */
+    /* 131 0x83 '¬É' */
     0x00, /* 00000000 */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
@@ -2387,7 +2387,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 132 0x84 'Ñ' */
+    /* 132 0x84 '¬Ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
@@ -2405,7 +2405,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 133 0x85 'Ö' */
+    /* 133 0x85 '¬Ö' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
@@ -2423,7 +2423,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 134 0x86 'Ü' */
+    /* 134 0x86 '¬Ü' */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2441,7 +2441,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 135 0x87 'á' */
+    /* 135 0x87 '¬á' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2459,7 +2459,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 136 0x88 'à' */
+    /* 136 0x88 '¬à' */
     0x00, /* 00000000 */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
@@ -2477,7 +2477,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 137 0x89 'â' */
+    /* 137 0x89 '¬â' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -2495,7 +2495,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 138 0x8a 'ä' */
+    /* 138 0x8a '¬ä' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
@@ -2513,7 +2513,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 139 0x8b 'ã' */
+    /* 139 0x8b '¬ã' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x66, /* 01100110 */
@@ -2531,7 +2531,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 140 0x8c 'å' */
+    /* 140 0x8c '¬å' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x3c, /* 00111100 */
@@ -2549,7 +2549,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 141 0x8d 'ç' */
+    /* 141 0x8d '¬ç' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
@@ -2567,7 +2567,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 142 0x8e 'é' */
+    /* 142 0x8e '¬é' */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2585,7 +2585,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 143 0x8f 'è' */
+    /* 143 0x8f '¬è' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x38, /* 00111000 */
@@ -2603,7 +2603,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 144 0x90 'ê' */
+    /* 144 0x90 '¬ê' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
@@ -2621,7 +2621,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 145 0x91 'ë' */
+    /* 145 0x91 '¬ë' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2639,7 +2639,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 146 0x92 'í' */
+    /* 146 0x92 '¬í' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x3e, /* 00111110 */
@@ -2657,7 +2657,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 147 0x93 'ì' */
+    /* 147 0x93 '¬ì' */
     0x00, /* 00000000 */
     0x10, /* 00010000 */
     0x38, /* 00111000 */
@@ -2675,7 +2675,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 148 0x94 'î' */
+    /* 148 0x94 '¬î' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -2693,7 +2693,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 149 0x95 'ï' */
+    /* 149 0x95 '¬ï' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
@@ -2711,7 +2711,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 150 0x96 'ñ' */
+    /* 150 0x96 '¬ñ' */
     0x00, /* 00000000 */
     0x30, /* 00110000 */
     0x78, /* 01111000 */
@@ -2729,7 +2729,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 151 0x97 'ó' */
+    /* 151 0x97 '¬ó' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
@@ -2747,7 +2747,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 152 0x98 'ò' */
+    /* 152 0x98 '¬ò' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -2765,7 +2765,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x78, /* 01111000 */
     0x00, /* 00000000 */
 
-    /* 153 0x99 'ô' */
+    /* 153 0x99 '¬ô' */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2783,7 +2783,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 154 0x9a 'ö' */
+    /* 154 0x9a '¬ö' */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
@@ -2801,7 +2801,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 155 0x9b 'õ' */
+    /* 155 0x9b '¬õ' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2819,7 +2819,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 156 0x9c 'ú' */
+    /* 156 0x9c '¬ú' */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -2837,7 +2837,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 157 0x9d 'ù' */
+    /* 157 0x9d '¬ù' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x66, /* 01100110 */
@@ -2855,7 +2855,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 158 0x9e 'û' */
+    /* 158 0x9e '¬û' */
     0x00, /* 00000000 */
     0xf8, /* 11111000 */
     0xcc, /* 11001100 */
@@ -2873,7 +2873,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 159 0x9f 'ü' */
+    /* 159 0x9f '¬ü' */
     0x00, /* 00000000 */
     0x0e, /* 00001110 */
     0x1b, /* 00011011 */
@@ -2891,7 +2891,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 160 0xa0 '†' */
+    /* 160 0xa0 '¬†' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2909,7 +2909,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 161 0xa1 '°' */
+    /* 161 0xa1 '¬°' */
     0x00, /* 00000000 */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
@@ -2927,7 +2927,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 162 0xa2 '¢' */
+    /* 162 0xa2 '¬¢' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2945,7 +2945,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 163 0xa3 '£' */
+    /* 163 0xa3 '¬£' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2963,7 +2963,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 164 0xa4 '§' */
+    /* 164 0xa4 '¬§' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x76, /* 01110110 */
@@ -2981,7 +2981,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 165 0xa5 '•' */
+    /* 165 0xa5 '¬•' */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
     0x00, /* 00000000 */
@@ -2999,7 +2999,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 166 0xa6 '¶' */
+    /* 166 0xa6 '¬¶' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
@@ -3017,7 +3017,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 167 0xa7 'ß' */
+    /* 167 0xa7 '¬ß' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
@@ -3035,7 +3035,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 168 0xa8 '®' */
+    /* 168 0xa8 '¬®' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x30, /* 00110000 */
@@ -3053,7 +3053,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 169 0xa9 '©' */
+    /* 169 0xa9 '¬©' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3071,7 +3071,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 170 0xaa '™' */
+    /* 170 0xaa '¬™' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3089,7 +3089,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 171 0xab '´' */
+    /* 171 0xab '¬´' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0xe0, /* 11100000 */
@@ -3107,7 +3107,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 172 0xac '¨' */
+    /* 172 0xac '¬¨' */
     0x00, /* 00000000 */
     0x60, /* 01100000 */
     0xe0, /* 11100000 */
@@ -3125,7 +3125,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 173 0xad '≠' */
+    /* 173 0xad '¬≠' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
@@ -3143,7 +3143,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 174 0xae 'Æ' */
+    /* 174 0xae '¬Æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3161,7 +3161,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 175 0xaf 'Ø' */
+    /* 175 0xaf '¬Ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3179,7 +3179,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 176 0xb0 '∞' */
+    /* 176 0xb0 '¬∞' */
     0x11, /* 00010001 */
     0x44, /* 01000100 */
     0x11, /* 00010001 */
@@ -3197,7 +3197,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x11, /* 00010001 */
     0x44, /* 01000100 */
 
-    /* 177 0xb1 '±' */
+    /* 177 0xb1 '¬±' */
     0x55, /* 01010101 */
     0xaa, /* 10101010 */
     0x55, /* 01010101 */
@@ -3215,7 +3215,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x55, /* 01010101 */
     0xaa, /* 10101010 */
 
-    /* 178 0xb2 '≤' */
+    /* 178 0xb2 '¬≤' */
     0xdd, /* 11011101 */
     0x77, /* 01110111 */
     0xdd, /* 11011101 */
@@ -3233,7 +3233,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0xdd, /* 11011101 */
     0x77, /* 01110111 */
 
-    /* 179 0xb3 '≥' */
+    /* 179 0xb3 '¬≥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3251,7 +3251,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 180 0xb4 '¥' */
+    /* 180 0xb4 '¬¥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3269,7 +3269,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 181 0xb5 'µ' */
+    /* 181 0xb5 '¬µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3287,7 +3287,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 182 0xb6 '∂' */
+    /* 182 0xb6 '¬∂' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3305,7 +3305,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 183 0xb7 '∑' */
+    /* 183 0xb7 '¬∑' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3323,7 +3323,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 184 0xb8 '∏' */
+    /* 184 0xb8 '¬∏' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3341,7 +3341,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 185 0xb9 'π' */
+    /* 185 0xb9 '¬π' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3359,7 +3359,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 186 0xba '∫' */
+    /* 186 0xba '¬∫' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3377,7 +3377,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 187 0xbb 'ª' */
+    /* 187 0xbb '¬ª' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3395,7 +3395,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 188 0xbc 'º' */
+    /* 188 0xbc '¬º' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3413,7 +3413,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 189 0xbd 'Ω' */
+    /* 189 0xbd '¬Ω' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3431,7 +3431,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 190 0xbe 'æ' */
+    /* 190 0xbe '¬æ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3449,7 +3449,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 191 0xbf 'ø' */
+    /* 191 0xbf '¬ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3467,7 +3467,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 192 0xc0 '¿' */
+    /* 192 0xc0 '√Ä' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3485,7 +3485,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 193 0xc1 '¡' */
+    /* 193 0xc1 '√Å' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3503,7 +3503,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 194 0xc2 '¬' */
+    /* 194 0xc2 '√Ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3521,7 +3521,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 195 0xc3 '√' */
+    /* 195 0xc3 '√É' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3539,7 +3539,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 196 0xc4 'ƒ' */
+    /* 196 0xc4 '√Ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3557,7 +3557,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 197 0xc5 '≈' */
+    /* 197 0xc5 '√Ö' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3575,7 +3575,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 198 0xc6 '∆' */
+    /* 198 0xc6 '√Ü' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3593,7 +3593,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 199 0xc7 '«' */
+    /* 199 0xc7 '√á' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3611,7 +3611,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 200 0xc8 '»' */
+    /* 200 0xc8 '√à' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3629,7 +3629,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 201 0xc9 '…' */
+    /* 201 0xc9 '√â' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3647,7 +3647,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 202 0xca ' ' */
+    /* 202 0xca '√ä' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3665,7 +3665,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 203 0xcb 'À' */
+    /* 203 0xcb '√ã' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3683,7 +3683,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 204 0xcc 'Ã' */
+    /* 204 0xcc '√å' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3701,7 +3701,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 205 0xcd 'Õ' */
+    /* 205 0xcd '√ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3719,7 +3719,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 206 0xce 'Œ' */
+    /* 206 0xce '√é' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3737,7 +3737,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 207 0xcf 'œ' */
+    /* 207 0xcf '√è' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3755,7 +3755,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 208 0xd0 '–' */
+    /* 208 0xd0 '√ê' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3773,7 +3773,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 209 0xd1 '—' */
+    /* 209 0xd1 '√ë' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3791,7 +3791,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 210 0xd2 '“' */
+    /* 210 0xd2 '√í' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3809,7 +3809,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 211 0xd3 '”' */
+    /* 211 0xd3 '√ì' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3827,7 +3827,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 212 0xd4 '‘' */
+    /* 212 0xd4 '√î' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3845,7 +3845,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 213 0xd5 '’' */
+    /* 213 0xd5 '√ï' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3863,7 +3863,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 214 0xd6 '÷' */
+    /* 214 0xd6 '√ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3881,7 +3881,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 215 0xd7 '◊' */
+    /* 215 0xd7 '√ó' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -3899,7 +3899,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 216 0xd8 'ÿ' */
+    /* 216 0xd8 '√ò' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3917,7 +3917,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 217 0xd9 'Ÿ' */
+    /* 217 0xd9 '√ô' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -3935,7 +3935,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 218 0xda '⁄' */
+    /* 218 0xda '√ö' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3953,7 +3953,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 219 0xdb '€' */
+    /* 219 0xdb '√õ' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -3971,7 +3971,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 220 0xdc '‹' */
+    /* 220 0xdc '√ú' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -3989,7 +3989,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 221 0xdd '›' */
+    /* 221 0xdd '√ù' */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
@@ -4007,7 +4007,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
 
-    /* 222 0xde 'ﬁ' */
+    /* 222 0xde '√û' */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
@@ -4025,7 +4025,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
 
-    /* 223 0xdf 'ﬂ' */
+    /* 223 0xdf '√ü' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -4043,7 +4043,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 224 0xe0 '‡' */
+    /* 224 0xe0 '√†' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4061,7 +4061,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 225 0xe1 '·' */
+    /* 225 0xe1 '√°' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x78, /* 01111000 */
@@ -4079,7 +4079,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 226 0xe2 '‚' */
+    /* 226 0xe2 '√¢' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
@@ -4097,7 +4097,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 227 0xe3 '„' */
+    /* 227 0xe3 '√£' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4115,7 +4115,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 228 0xe4 '‰' */
+    /* 228 0xe4 '√§' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
@@ -4133,7 +4133,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 229 0xe5 'Â' */
+    /* 229 0xe5 '√•' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4151,7 +4151,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 230 0xe6 'Ê' */
+    /* 230 0xe6 '√¶' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4169,7 +4169,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0xc0, /* 11000000 */
     0x00, /* 00000000 */
 
-    /* 231 0xe7 'Á' */
+    /* 231 0xe7 '√ß' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4187,7 +4187,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 232 0xe8 'Ë' */
+    /* 232 0xe8 '√®' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
@@ -4205,7 +4205,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 233 0xe9 'È' */
+    /* 233 0xe9 '√©' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
@@ -4223,7 +4223,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 234 0xea 'Í' */
+    /* 234 0xea '√™' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
@@ -4241,7 +4241,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 235 0xeb 'Î' */
+    /* 235 0xeb '√´' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x1e, /* 00011110 */
@@ -4259,7 +4259,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 236 0xec 'Ï' */
+    /* 236 0xec '√¨' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4277,7 +4277,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 237 0xed 'Ì' */
+    /* 237 0xed '√≠' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4295,7 +4295,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 238 0xee 'Ó' */
+    /* 238 0xee '√Æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x1c, /* 00011100 */
@@ -4313,7 +4313,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 239 0xef 'Ô' */
+    /* 239 0xef '√Ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4331,7 +4331,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 240 0xf0 '' */
+    /* 240 0xf0 '√∞' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4349,7 +4349,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 241 0xf1 'Ò' */
+    /* 241 0xf1 '√±' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4367,7 +4367,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 242 0xf2 'Ú' */
+    /* 242 0xf2 '√≤' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4385,7 +4385,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 243 0xf3 'Û' */
+    /* 243 0xf3 '√≥' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4403,7 +4403,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 244 0xf4 'Ù' */
+    /* 244 0xf4 '√¥' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x0e, /* 00001110 */
@@ -4421,7 +4421,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 245 0xf5 'ı' */
+    /* 245 0xf5 '√µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -4439,7 +4439,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 246 0xf6 'ˆ' */
+    /* 246 0xf6 '√∂' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4457,7 +4457,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 247 0xf7 '˜' */
+    /* 247 0xf7 '√∑' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4475,7 +4475,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 248 0xf8 '¯' */
+    /* 248 0xf8 '√∏' */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -4493,7 +4493,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 249 0xf9 '˘' */
+    /* 249 0xf9 '√π' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4511,7 +4511,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 250 0xfa '˙' */
+    /* 250 0xfa '√∫' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4529,7 +4529,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 251 0xfb '˚' */
+    /* 251 0xfb '√ª' */
     0x00, /* 00000000 */
     0x0f, /* 00001111 */
     0x0c, /* 00001100 */
@@ -4547,7 +4547,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 252 0xfc '¸' */
+    /* 252 0xfc '√º' */
     0x00, /* 00000000 */
     0x6c, /* 01101100 */
     0x36, /* 00110110 */
@@ -4565,7 +4565,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 253 0xfd '˝' */
+    /* 253 0xfd '√Ω' */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
     0x66, /* 01100110 */
@@ -4583,7 +4583,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 254 0xfe '˛' */
+    /* 254 0xfe '√æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -4601,7 +4601,7 @@ static const unsigned char fontdata_8x16[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 255 0xff 'ˇ' */
+    /* 255 0xff '√ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
diff --git a/xen/drivers/video/font_8x8.c b/xen/drivers/video/font_8x8.c
index 9441429b42..d223ca6687 100644
--- a/xen/drivers/video/font_8x8.c
+++ b/xen/drivers/video/font_8x8.c
@@ -1291,7 +1291,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xfe, /* 11111110 */
     0x00, /* 00000000 */
 
-    /* 128 0x80 'Ä' */
+    /* 128 0x80 '¬Ä' */
     0x7c, /* 01111100 */
     0xc6, /* 11000110 */
     0xc0, /* 11000000 */
@@ -1301,7 +1301,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x0c, /* 00001100 */
     0x78, /* 01111000 */
 
-    /* 129 0x81 'Å' */
+    /* 129 0x81 '¬Å' */
     0xcc, /* 11001100 */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
@@ -1311,7 +1311,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 130 0x82 'Ç' */
+    /* 130 0x82 '¬Ç' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x7c, /* 01111100 */
@@ -1321,7 +1321,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 131 0x83 'É' */
+    /* 131 0x83 '¬É' */
     0x7c, /* 01111100 */
     0x82, /* 10000010 */
     0x78, /* 01111000 */
@@ -1331,7 +1331,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 132 0x84 'Ñ' */
+    /* 132 0x84 '¬Ñ' */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0x78, /* 01111000 */
@@ -1341,7 +1341,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 133 0x85 'Ö' */
+    /* 133 0x85 '¬Ö' */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
     0x78, /* 01111000 */
@@ -1351,7 +1351,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 134 0x86 'Ü' */
+    /* 134 0x86 '¬Ü' */
     0x30, /* 00110000 */
     0x30, /* 00110000 */
     0x78, /* 01111000 */
@@ -1361,7 +1361,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 135 0x87 'á' */
+    /* 135 0x87 '¬á' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
@@ -1371,7 +1371,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x0c, /* 00001100 */
     0x38, /* 00111000 */
 
-    /* 136 0x88 'à' */
+    /* 136 0x88 '¬à' */
     0x7c, /* 01111100 */
     0x82, /* 10000010 */
     0x7c, /* 01111100 */
@@ -1381,7 +1381,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 137 0x89 'â' */
+    /* 137 0x89 '¬â' */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0x7c, /* 01111100 */
@@ -1391,7 +1391,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 138 0x8a 'ä' */
+    /* 138 0x8a '¬ä' */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
     0x7c, /* 01111100 */
@@ -1401,7 +1401,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 139 0x8b 'ã' */
+    /* 139 0x8b '¬ã' */
     0x66, /* 01100110 */
     0x00, /* 00000000 */
     0x38, /* 00111000 */
@@ -1411,7 +1411,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x00, /* 00000000 */
 
-    /* 140 0x8c 'å' */
+    /* 140 0x8c '¬å' */
     0x7c, /* 01111100 */
     0x82, /* 10000010 */
     0x38, /* 00111000 */
@@ -1421,7 +1421,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x00, /* 00000000 */
 
-    /* 141 0x8d 'ç' */
+    /* 141 0x8d '¬ç' */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
@@ -1431,7 +1431,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x00, /* 00000000 */
 
-    /* 142 0x8e 'é' */
+    /* 142 0x8e '¬é' */
     0xc6, /* 11000110 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -1441,7 +1441,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
 
-    /* 143 0x8f 'è' */
+    /* 143 0x8f '¬è' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x7c, /* 01111100 */
@@ -1451,7 +1451,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
 
-    /* 144 0x90 'ê' */
+    /* 144 0x90 '¬ê' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0xfe, /* 11111110 */
@@ -1461,7 +1461,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xfe, /* 11111110 */
     0x00, /* 00000000 */
 
-    /* 145 0x91 'ë' */
+    /* 145 0x91 '¬ë' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
@@ -1471,7 +1471,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7e, /* 01111110 */
     0x00, /* 00000000 */
 
-    /* 146 0x92 'í' */
+    /* 146 0x92 '¬í' */
     0x3e, /* 00111110 */
     0x6c, /* 01101100 */
     0xcc, /* 11001100 */
@@ -1481,7 +1481,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xce, /* 11001110 */
     0x00, /* 00000000 */
 
-    /* 147 0x93 'ì' */
+    /* 147 0x93 '¬ì' */
     0x7c, /* 01111100 */
     0x82, /* 10000010 */
     0x7c, /* 01111100 */
@@ -1491,7 +1491,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 148 0x94 'î' */
+    /* 148 0x94 '¬î' */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0x7c, /* 01111100 */
@@ -1501,7 +1501,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 149 0x95 'ï' */
+    /* 149 0x95 '¬ï' */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
     0x7c, /* 01111100 */
@@ -1511,7 +1511,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 150 0x96 'ñ' */
+    /* 150 0x96 '¬ñ' */
     0x78, /* 01111000 */
     0x84, /* 10000100 */
     0x00, /* 00000000 */
@@ -1521,7 +1521,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 151 0x97 'ó' */
+    /* 151 0x97 '¬ó' */
     0x60, /* 01100000 */
     0x30, /* 00110000 */
     0xcc, /* 11001100 */
@@ -1531,7 +1531,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 152 0x98 'ò' */
+    /* 152 0x98 '¬ò' */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -1541,7 +1541,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x06, /* 00000110 */
     0xfc, /* 11111100 */
 
-    /* 153 0x99 'ô' */
+    /* 153 0x99 '¬ô' */
     0xc6, /* 11000110 */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
@@ -1551,7 +1551,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x38, /* 00111000 */
     0x00, /* 00000000 */
 
-    /* 154 0x9a 'ö' */
+    /* 154 0x9a '¬ö' */
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
     0xc6, /* 11000110 */
@@ -1561,7 +1561,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 155 0x9b 'õ' */
+    /* 155 0x9b '¬õ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x7e, /* 01111110 */
@@ -1571,7 +1571,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 156 0x9c 'ú' */
+    /* 156 0x9c '¬ú' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x64, /* 01100100 */
@@ -1581,7 +1581,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xfc, /* 11111100 */
     0x00, /* 00000000 */
 
-    /* 157 0x9d 'ù' */
+    /* 157 0x9d '¬ù' */
     0x66, /* 01100110 */
     0x66, /* 01100110 */
     0x3c, /* 00111100 */
@@ -1591,7 +1591,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 158 0x9e 'û' */
+    /* 158 0x9e '¬û' */
     0xf8, /* 11111000 */
     0xcc, /* 11001100 */
     0xcc, /* 11001100 */
@@ -1601,7 +1601,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xc6, /* 11000110 */
     0xc7, /* 11000111 */
 
-    /* 159 0x9f 'ü' */
+    /* 159 0x9f '¬ü' */
     0x0e, /* 00001110 */
     0x1b, /* 00011011 */
     0x18, /* 00011000 */
@@ -1611,7 +1611,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x70, /* 01110000 */
     0x00, /* 00000000 */
 
-    /* 160 0xa0 '†' */
+    /* 160 0xa0 '¬†' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0x78, /* 01111000 */
@@ -1621,7 +1621,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 161 0xa1 '°' */
+    /* 161 0xa1 '¬°' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
@@ -1631,7 +1631,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x00, /* 00000000 */
 
-    /* 162 0xa2 '¢' */
+    /* 162 0xa2 '¬¢' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x7c, /* 01111100 */
@@ -1641,7 +1641,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0x00, /* 00000000 */
 
-    /* 163 0xa3 '£' */
+    /* 163 0xa3 '¬£' */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
     0xcc, /* 11001100 */
@@ -1651,7 +1651,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 164 0xa4 '§' */
+    /* 164 0xa4 '¬§' */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
     0x00, /* 00000000 */
@@ -1661,7 +1661,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x66, /* 01100110 */
     0x00, /* 00000000 */
 
-    /* 165 0xa5 '•' */
+    /* 165 0xa5 '¬•' */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
     0x00, /* 00000000 */
@@ -1671,7 +1671,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xce, /* 11001110 */
     0x00, /* 00000000 */
 
-    /* 166 0xa6 '¶' */
+    /* 166 0xa6 '¬¶' */
     0x3c, /* 00111100 */
     0x6c, /* 01101100 */
     0x6c, /* 01101100 */
@@ -1681,7 +1681,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 167 0xa7 'ß' */
+    /* 167 0xa7 '¬ß' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x6c, /* 01101100 */
@@ -1691,7 +1691,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 168 0xa8 '®' */
+    /* 168 0xa8 '¬®' */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
@@ -1701,7 +1701,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3e, /* 00111110 */
     0x00, /* 00000000 */
 
-    /* 169 0xa9 '©' */
+    /* 169 0xa9 '¬©' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1711,7 +1711,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 170 0xaa '™' */
+    /* 170 0xaa '¬™' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1721,7 +1721,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 171 0xab '´' */
+    /* 171 0xab '¬´' */
     0x63, /* 01100011 */
     0xe6, /* 11100110 */
     0x6c, /* 01101100 */
@@ -1731,7 +1731,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xcc, /* 11001100 */
     0x0f, /* 00001111 */
 
-    /* 172 0xac '¨' */
+    /* 172 0xac '¬¨' */
     0x63, /* 01100011 */
     0xe6, /* 11100110 */
     0x6c, /* 01101100 */
@@ -1741,7 +1741,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xdf, /* 11011111 */
     0x06, /* 00000110 */
 
-    /* 173 0xad '≠' */
+    /* 173 0xad '¬≠' */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
@@ -1751,7 +1751,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x00, /* 00000000 */
 
-    /* 174 0xae 'Æ' */
+    /* 174 0xae '¬Æ' */
     0x00, /* 00000000 */
     0x33, /* 00110011 */
     0x66, /* 01100110 */
@@ -1761,7 +1761,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 175 0xaf 'Ø' */
+    /* 175 0xaf '¬Ø' */
     0x00, /* 00000000 */
     0xcc, /* 11001100 */
     0x66, /* 01100110 */
@@ -1771,7 +1771,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 176 0xb0 '∞' */
+    /* 176 0xb0 '¬∞' */
     0x22, /* 00100010 */
     0x88, /* 10001000 */
     0x22, /* 00100010 */
@@ -1781,7 +1781,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x22, /* 00100010 */
     0x88, /* 10001000 */
 
-    /* 177 0xb1 '±' */
+    /* 177 0xb1 '¬±' */
     0x55, /* 01010101 */
     0xaa, /* 10101010 */
     0x55, /* 01010101 */
@@ -1791,7 +1791,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x55, /* 01010101 */
     0xaa, /* 10101010 */
 
-    /* 178 0xb2 '≤' */
+    /* 178 0xb2 '¬≤' */
     0x77, /* 01110111 */
     0xdd, /* 11011101 */
     0x77, /* 01110111 */
@@ -1801,7 +1801,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x77, /* 01110111 */
     0xdd, /* 11011101 */
 
-    /* 179 0xb3 '≥' */
+    /* 179 0xb3 '¬≥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1811,7 +1811,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 180 0xb4 '¥' */
+    /* 180 0xb4 '¬¥' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1821,7 +1821,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 181 0xb5 'µ' */
+    /* 181 0xb5 '¬µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0xf8, /* 11111000 */
@@ -1831,7 +1831,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 182 0xb6 '∂' */
+    /* 182 0xb6 '¬∂' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -1841,7 +1841,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 183 0xb7 '∑' */
+    /* 183 0xb7 '¬∑' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1851,7 +1851,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 184 0xb8 '∏' */
+    /* 184 0xb8 '¬∏' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xf8, /* 11111000 */
@@ -1861,7 +1861,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 185 0xb9 'π' */
+    /* 185 0xb9 '¬π' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0xf6, /* 11110110 */
@@ -1871,7 +1871,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 186 0xba '∫' */
+    /* 186 0xba '¬∫' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -1881,7 +1881,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 187 0xbb 'ª' */
+    /* 187 0xbb '¬ª' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
@@ -1891,7 +1891,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 188 0xbc 'º' */
+    /* 188 0xbc '¬º' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0xf6, /* 11110110 */
@@ -1901,7 +1901,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 189 0xbd 'Ω' */
+    /* 189 0xbd '¬Ω' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -1911,7 +1911,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 190 0xbe 'æ' */
+    /* 190 0xbe '¬æ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0xf8, /* 11111000 */
@@ -1921,7 +1921,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 191 0xbf 'ø' */
+    /* 191 0xbf '¬ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1931,7 +1931,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 192 0xc0 '¿' */
+    /* 192 0xc0 '√Ä' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1941,7 +1941,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 193 0xc1 '¡' */
+    /* 193 0xc1 '√Å' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1951,7 +1951,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 194 0xc2 '¬' */
+    /* 194 0xc2 '√Ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1961,7 +1961,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 195 0xc3 '√' */
+    /* 195 0xc3 '√É' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1971,7 +1971,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 196 0xc4 'ƒ' */
+    /* 196 0xc4 '√Ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -1981,7 +1981,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 197 0xc5 '≈' */
+    /* 197 0xc5 '√Ö' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -1991,7 +1991,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 198 0xc6 '∆' */
+    /* 198 0xc6 '√Ü' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x1f, /* 00011111 */
@@ -2001,7 +2001,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 199 0xc7 '«' */
+    /* 199 0xc7 '√á' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2011,7 +2011,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 200 0xc8 '»' */
+    /* 200 0xc8 '√à' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x37, /* 00110111 */
@@ -2021,7 +2021,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 201 0xc9 '…' */
+    /* 201 0xc9 '√â' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x3f, /* 00111111 */
@@ -2031,7 +2031,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 202 0xca ' ' */
+    /* 202 0xca '√ä' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0xf7, /* 11110111 */
@@ -2041,7 +2041,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 203 0xcb 'À' */
+    /* 203 0xcb '√ã' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xff, /* 11111111 */
@@ -2051,7 +2051,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 204 0xcc 'Ã' */
+    /* 204 0xcc '√å' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x37, /* 00110111 */
@@ -2061,7 +2061,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 205 0xcd 'Õ' */
+    /* 205 0xcd '√ç' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xff, /* 11111111 */
@@ -2071,7 +2071,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 206 0xce 'Œ' */
+    /* 206 0xce '√é' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0xf7, /* 11110111 */
@@ -2081,7 +2081,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 207 0xcf 'œ' */
+    /* 207 0xcf '√è' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0xff, /* 11111111 */
@@ -2091,7 +2091,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 208 0xd0 '–' */
+    /* 208 0xd0 '√ê' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2101,7 +2101,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 209 0xd1 '—' */
+    /* 209 0xd1 '√ë' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xff, /* 11111111 */
@@ -2111,7 +2111,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 210 0xd2 '“' */
+    /* 210 0xd2 '√í' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2121,7 +2121,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 211 0xd3 '”' */
+    /* 211 0xd3 '√ì' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2131,7 +2131,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 212 0xd4 '‘' */
+    /* 212 0xd4 '√î' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x1f, /* 00011111 */
@@ -2141,7 +2141,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 213 0xd5 '’' */
+    /* 213 0xd5 '√ï' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x1f, /* 00011111 */
@@ -2151,7 +2151,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 214 0xd6 '÷' */
+    /* 214 0xd6 '√ñ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2161,7 +2161,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 215 0xd7 '◊' */
+    /* 215 0xd7 '√ó' */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2171,7 +2171,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x36, /* 00110110 */
     0x36, /* 00110110 */
 
-    /* 216 0xd8 'ÿ' */
+    /* 216 0xd8 '√ò' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0xff, /* 11111111 */
@@ -2181,7 +2181,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 217 0xd9 'Ÿ' */
+    /* 217 0xd9 '√ô' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2191,7 +2191,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 218 0xda '⁄' */
+    /* 218 0xda '√ö' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2201,7 +2201,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 219 0xdb '€' */
+    /* 219 0xdb '√õ' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -2211,7 +2211,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 220 0xdc '‹' */
+    /* 220 0xdc '√ú' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2221,7 +2221,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xff, /* 11111111 */
     0xff, /* 11111111 */
 
-    /* 221 0xdd '›' */
+    /* 221 0xdd '√ù' */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
@@ -2231,7 +2231,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xf0, /* 11110000 */
     0xf0, /* 11110000 */
 
-    /* 222 0xde 'ﬁ' */
+    /* 222 0xde '√û' */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
@@ -2241,7 +2241,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x0f, /* 00001111 */
     0x0f, /* 00001111 */
 
-    /* 223 0xdf 'ﬂ' */
+    /* 223 0xdf '√ü' */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
     0xff, /* 11111111 */
@@ -2251,7 +2251,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 224 0xe0 '‡' */
+    /* 224 0xe0 '√†' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x76, /* 01110110 */
@@ -2261,7 +2261,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x76, /* 01110110 */
     0x00, /* 00000000 */
 
-    /* 225 0xe1 '·' */
+    /* 225 0xe1 '√°' */
     0x78, /* 01111000 */
     0xcc, /* 11001100 */
     0xcc, /* 11001100 */
@@ -2271,7 +2271,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xcc, /* 11001100 */
     0x00, /* 00000000 */
 
-    /* 226 0xe2 '‚' */
+    /* 226 0xe2 '√¢' */
     0xfe, /* 11111110 */
     0xc6, /* 11000110 */
     0xc0, /* 11000000 */
@@ -2281,7 +2281,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xc0, /* 11000000 */
     0x00, /* 00000000 */
 
-    /* 227 0xe3 '„' */
+    /* 227 0xe3 '√£' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
@@ -2291,7 +2291,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x6c, /* 01101100 */
     0x00, /* 00000000 */
 
-    /* 228 0xe4 '‰' */
+    /* 228 0xe4 '√§' */
     0xfe, /* 11111110 */
     0xc6, /* 11000110 */
     0x60, /* 01100000 */
@@ -2301,7 +2301,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xfe, /* 11111110 */
     0x00, /* 00000000 */
 
-    /* 229 0xe5 'Â' */
+    /* 229 0xe5 '√•' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
@@ -2311,7 +2311,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x70, /* 01110000 */
     0x00, /* 00000000 */
 
-    /* 230 0xe6 'Ê' */
+    /* 230 0xe6 '√¶' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x66, /* 01100110 */
@@ -2321,7 +2321,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7c, /* 01111100 */
     0xc0, /* 11000000 */
 
-    /* 231 0xe7 'Á' */
+    /* 231 0xe7 '√ß' */
     0x00, /* 00000000 */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
@@ -2331,7 +2331,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x00, /* 00000000 */
 
-    /* 232 0xe8 'Ë' */
+    /* 232 0xe8 '√®' */
     0x7e, /* 01111110 */
     0x18, /* 00011000 */
     0x3c, /* 00111100 */
@@ -2341,7 +2341,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x7e, /* 01111110 */
 
-    /* 233 0xe9 'È' */
+    /* 233 0xe9 '√©' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0xc6, /* 11000110 */
@@ -2351,7 +2351,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x38, /* 00111000 */
     0x00, /* 00000000 */
 
-    /* 234 0xea 'Í' */
+    /* 234 0xea '√™' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0xc6, /* 11000110 */
@@ -2361,7 +2361,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xee, /* 11101110 */
     0x00, /* 00000000 */
 
-    /* 235 0xeb 'Î' */
+    /* 235 0xeb '√´' */
     0x0e, /* 00001110 */
     0x18, /* 00011000 */
     0x0c, /* 00001100 */
@@ -2371,7 +2371,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x00, /* 00000000 */
 
-    /* 236 0xec 'Ï' */
+    /* 236 0xec '√¨' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x7e, /* 01111110 */
@@ -2381,7 +2381,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 237 0xed 'Ì' */
+    /* 237 0xed '√≠' */
     0x06, /* 00000110 */
     0x0c, /* 00001100 */
     0x7e, /* 01111110 */
@@ -2391,7 +2391,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x60, /* 01100000 */
     0xc0, /* 11000000 */
 
-    /* 238 0xee 'Ó' */
+    /* 238 0xee '√Æ' */
     0x1e, /* 00011110 */
     0x30, /* 00110000 */
     0x60, /* 01100000 */
@@ -2401,7 +2401,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x1e, /* 00011110 */
     0x00, /* 00000000 */
 
-    /* 239 0xef 'Ô' */
+    /* 239 0xef '√Ø' */
     0x00, /* 00000000 */
     0x7c, /* 01111100 */
     0xc6, /* 11000110 */
@@ -2411,7 +2411,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xc6, /* 11000110 */
     0x00, /* 00000000 */
 
-    /* 240 0xf0 '' */
+    /* 240 0xf0 '√∞' */
     0x00, /* 00000000 */
     0xfe, /* 11111110 */
     0x00, /* 00000000 */
@@ -2421,7 +2421,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 241 0xf1 'Ò' */
+    /* 241 0xf1 '√±' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x7e, /* 01111110 */
@@ -2431,7 +2431,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7e, /* 01111110 */
     0x00, /* 00000000 */
 
-    /* 242 0xf2 'Ú' */
+    /* 242 0xf2 '√≤' */
     0x30, /* 00110000 */
     0x18, /* 00011000 */
     0x0c, /* 00001100 */
@@ -2441,7 +2441,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7e, /* 01111110 */
     0x00, /* 00000000 */
 
-    /* 243 0xf3 'Û' */
+    /* 243 0xf3 '√≥' */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
     0x30, /* 00110000 */
@@ -2451,7 +2451,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x7e, /* 01111110 */
     0x00, /* 00000000 */
 
-    /* 244 0xf4 'Ù' */
+    /* 244 0xf4 '√¥' */
     0x0e, /* 00001110 */
     0x1b, /* 00011011 */
     0x1b, /* 00011011 */
@@ -2461,7 +2461,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x18, /* 00011000 */
     0x18, /* 00011000 */
 
-    /* 245 0xf5 'ı' */
+    /* 245 0xf5 '√µ' */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
     0x18, /* 00011000 */
@@ -2471,7 +2471,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0xd8, /* 11011000 */
     0x70, /* 01110000 */
 
-    /* 246 0xf6 'ˆ' */
+    /* 246 0xf6 '√∂' */
     0x00, /* 00000000 */
     0x18, /* 00011000 */
     0x00, /* 00000000 */
@@ -2481,7 +2481,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 247 0xf7 '˜' */
+    /* 247 0xf7 '√∑' */
     0x00, /* 00000000 */
     0x76, /* 01110110 */
     0xdc, /* 11011100 */
@@ -2491,7 +2491,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 248 0xf8 '¯' */
+    /* 248 0xf8 '√∏' */
     0x38, /* 00111000 */
     0x6c, /* 01101100 */
     0x6c, /* 01101100 */
@@ -2501,7 +2501,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 249 0xf9 '˘' */
+    /* 249 0xf9 '√π' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2511,7 +2511,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 250 0xfa '˙' */
+    /* 250 0xfa '√∫' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
@@ -2521,7 +2521,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 251 0xfb '˚' */
+    /* 251 0xfb '√ª' */
     0x0f, /* 00001111 */
     0x0c, /* 00001100 */
     0x0c, /* 00001100 */
@@ -2531,7 +2531,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x3c, /* 00111100 */
     0x1c, /* 00011100 */
 
-    /* 252 0xfc '¸' */
+    /* 252 0xfc '√º' */
     0x6c, /* 01101100 */
     0x36, /* 00110110 */
     0x36, /* 00110110 */
@@ -2541,7 +2541,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 253 0xfd '˝' */
+    /* 253 0xfd '√Ω' */
     0x78, /* 01111000 */
     0x0c, /* 00001100 */
     0x18, /* 00011000 */
@@ -2551,7 +2551,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 254 0xfe '˛' */
+    /* 254 0xfe '√æ' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x3c, /* 00111100 */
@@ -2561,7 +2561,7 @@ static const unsigned char fontdata_8x8[FONTDATAMAX] = {
     0x00, /* 00000000 */
     0x00, /* 00000000 */
 
-    /* 255 0xff 'ˇ' */
+    /* 255 0xff '√ø' */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
     0x00, /* 00000000 */
-- 
2.34.1


