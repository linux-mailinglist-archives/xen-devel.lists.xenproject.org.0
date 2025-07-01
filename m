Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB557AF070A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 01:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030117.1403771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfH-0008Lo-N4; Tue, 01 Jul 2025 23:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030117.1403771; Tue, 01 Jul 2025 23:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWkfH-0008JA-K1; Tue, 01 Jul 2025 23:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1030117;
 Tue, 01 Jul 2025 23:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWkfG-0008Gm-DR
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 23:45:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74910aa5-56d5-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 01:45:23 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4eed70f24so841788f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 16:45:23 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a87e947431sm14509037f8f.0.2025.07.01.16.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 16:45:21 -0700 (PDT)
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
X-Inumbo-ID: 74910aa5-56d5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751413522; x=1752018322; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGfgz5+4xZkhVXL2ewILuOLrNhVDG3jFfYq35hz23X4=;
        b=W4p8Xv7W4aEZjDztbbg0tdfmHClRRhcVaN/WY8ei02MbywJrnGSJ8zMuUovkWbEpHG
         Gc3MzlB/h2DDj6kSSs7DaHz8dQKlsO+WI6JorJjOdbhCT/c61yLMKEX7eHb7+WhBWTjB
         48t4vZ0TDk352x7eae9SL3Yz9yyFuwB1A1c5sCE4yG1jyJN0uhqlp8mZ+EBH9/9bRPhf
         WhwRnQDkpDtSvsRNIFN9BXVx+fDRLeNibMRU2KEngzRGI3B9dxizXt88IM/CAm7x3sT5
         LPZ4Rx5XTVN/rp3DMijRkxqIzNHHG+dnFHXF8jOcq36MN9Vn6cNumbiCOsla9++5Qa0h
         yh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751413522; x=1752018322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGfgz5+4xZkhVXL2ewILuOLrNhVDG3jFfYq35hz23X4=;
        b=GyPZyKI4qQpItbEcC7DPRMU9jIbc6FVW02lYTYfkuQ/M7EEU3XWOe5LcP6SRRWHTuG
         +S+nsuB7Pfedzm2VQ4/4XEomWToNwm5bo7Kpp0mVPklzqqWZ405Jy6V43wnQGXmPOZI7
         m3pFAXAhtVmvKU8hR+aU090BsM17IZKdgM79SpgxjIuoYG0nSqDzQyFy8ikncemr7xDS
         madJQZZ9xyh6HgPaFZASd1oh81bVXRsDgn34nbo/V5fTheBp0VBVsU63KwQe/DsIXvOP
         +T+Br3yj+3GFl8eQ2Fmhq7TrjUZbdhi/NmMf/WF9/h/j4mQ0PP11bwKRZN3z6zNB8ghk
         4Lnw==
X-Gm-Message-State: AOJu0YyLv6wS6u+xPU8Imwe77IdIrBYC1MSKyAHmNxUYdApzyhM0ESt6
	bSmHHzZ/IZGi/JTG6QARfP/OPtb4bv1HGo7JVYYTI/XAjKJoqYRl5V+LtnMAFQ==
X-Gm-Gg: ASbGncsABZzzegIYjXlPtEm8/MONGBteRiFkjinPDDd0pLEfyhF66hLau2JMjMoTd7s
	2PlNMqVnKtVtUqpWFfoMPQKOhTxqYOI2NNo49oXsPgsZFnwAijgMCirOjgL7v7fJnn3tfoFSGKY
	2/+x03sK3vDDKMw+EdV0oxCN2GtWzkKc2aJPSpnCF7PkccrB00eCkG2QDv3aL+YfxaepBtHH8U4
	jnFDR6vvf8hJxI0tO2Ide7leodCdwbPW9H/wXrT/KvP9B5x/1vGHf1U55ITChxOgB19lY69lILK
	/Gp1w7eR+A100uL6D/y+fwZ4sYAUHPyc7Bta7hJfmw4bpvCXsUNajGIUzp/o7NndigPCpSXyMbk
	t/qBnC/X316KQQr91Fd0oGcsW6Cm15cLs6k3SwRxAp+UMUIihcBP/WRyBvCgKIA==
X-Google-Smtp-Source: AGHT+IHY5gvHcq5+7n+4oidJ9KfU0IfCxLoLpMo8YpYiX70/faDoxvMnCCM/Uh49NxV5+tGyiqBB6w==
X-Received: by 2002:a05:6000:4310:b0:3a5:8934:4948 with SMTP id ffacd0b85a97d-3b1ffcd69f7mr101444f8f.12.1751413522160;
        Tue, 01 Jul 2025 16:45:22 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] hvmloader: fix SMBIOS table length checks
Date: Tue,  1 Jul 2025 23:45:11 +0000
Message-Id: <8981deefd675eabc6a60713aacf96e03fd756fdb.1751412735.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751412735.git.w1benny@gmail.com>
References: <cover.1751412735.git.w1benny@gmail.com>
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

hvmloader currently implements version 2.4

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/firmware/hvmloader/smbios.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
index fc3cdc9a25..2cd826768b 100644
--- a/tools/firmware/hvmloader/smbios.c
+++ b/tools/firmware/hvmloader/smbios.c
@@ -385,7 +385,7 @@ smbios_type_0_init(void *start, const char *xen_version,
     uint32_t length;
 
     pts = get_smbios_pt_struct(0, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= sizeof(struct smbios_type_0) )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE0;
@@ -444,7 +444,7 @@ smbios_type_1_init(void *start, const char *xen_version,
     uint32_t length;
 
     pts = get_smbios_pt_struct(1, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= sizeof(struct smbios_type_1) )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE1;
@@ -504,7 +504,7 @@ smbios_type_2_init(void *start)
     unsigned int counter = 0;
 
     pts = get_smbios_pt_struct(2, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= 8 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE2;
@@ -598,7 +598,7 @@ smbios_type_3_init(void *start)
     uint32_t counter = 0;
 
     pts = get_smbios_pt_struct(3, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= 13 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE3;
@@ -712,7 +712,7 @@ smbios_type_11_init(void *start)
     uint32_t length;
 
     pts = get_smbios_pt_struct(11, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= sizeof(struct smbios_type_11) )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE11;
@@ -869,7 +869,7 @@ smbios_type_22_init(void *start)
     uint32_t length;
 
     pts = get_smbios_pt_struct(22, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= sizeof(struct smbios_type_22) )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE22;
@@ -951,7 +951,7 @@ smbios_type_39_init(void *start)
     uint32_t length;
 
     pts = get_smbios_pt_struct(39, &length);
-    if ( pts != NULL && length > 0 )
+    if ( pts != NULL && length >= 16 )
     {
         memcpy(start, pts, length);
         p->header.handle = SMBIOS_HANDLE_TYPE39;
-- 
2.34.1


