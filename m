Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E287A9F4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 16:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692492.1079681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8m-00049V-FD; Wed, 13 Mar 2024 15:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692492.1079681; Wed, 13 Mar 2024 15:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkQ8m-00047h-Bo; Wed, 13 Mar 2024 15:03:36 +0000
Received: by outflank-mailman (input) for mailman id 692492;
 Wed, 13 Mar 2024 15:03:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwto=KT=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rkQ8k-0003t5-G2
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 15:03:34 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc24ee1f-e14a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 16:03:33 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-42ee2012bf0so7411361cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 08:03:33 -0700 (PDT)
Received: from rossla-lxenia.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac85ec9000000b0042ef4b5f4fbsm4930034qtx.38.2024.03.13.08.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 08:03:31 -0700 (PDT)
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
X-Inumbo-ID: dc24ee1f-e14a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710342212; x=1710947012; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJKga3Jbhc7qlCdB+WV/kg/qjOpqTD+5g9NcykZuAm8=;
        b=FVVDsBzVFxMhkmBUDu2MqXEqQhJo1KdtIJQzhh7ZlzG5B/Rk1zIXD6wPB2J4S3UheI
         vW61+Xo4vO9v8NhFxa22hqxhq/AXalQtklF8UaAAorsIqqORtg4T1gUvS/5X+6bvgD97
         kKUprfpor0tegUcCdaBGjAK0ZSeDz4LIdYgO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710342212; x=1710947012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJKga3Jbhc7qlCdB+WV/kg/qjOpqTD+5g9NcykZuAm8=;
        b=t8xOoMMEnsueTjHqFs1Jmi6dry5ivoX3EvLxNOdxN0PlQCfeNTPWi+p2z0ED1+EMSr
         8KE628NCF1gqhpNvY/yN/mzlaqK4/9dQU5ZvtdqDk6G14pSFcJl2FDP0EPH28+zWONfp
         z6iqInpLNo7eSofWgZ7/7OkfD8QcnOTWlGELuqPZKQVohMpx+zt7Dnp5qpnLyZiHkmEm
         3wklIHwnDNocvnLmqlSrQHOUaWWtqgdiBIp184enV5CDihTXtRxa2jqrO3MIUam0I+Kb
         oXvN8O8PDMVHR9hqOV3gmiiXJZf8lWjMpqxyMQv1fnfwdAYzKnMBlMRbtpxKhnl18LZ3
         bh5g==
X-Gm-Message-State: AOJu0YygZAf5R5OTwl37mr3ivQfhsnsRgQOBvjWPiBYfdZZGy1iAinLm
	7c8CTom17tUV9ftcN3Z2Tomo0zW7LvxcIhrFZaySv5Qs2pXyPqF30u4QFrmZccDQ5wLfRyb8N13
	VQzod
X-Google-Smtp-Source: AGHT+IGo8AkCBVzP0kyZcIGdUmtVpb90lnSabmGU5U+tadHMUWKiWyOYVllW9juZC1PIxcMNKHVXfQ==
X-Received: by 2002:a05:622a:245:b0:42e:dea0:f4b6 with SMTP id c5-20020a05622a024500b0042edea0f4b6mr3224282qtx.2.1710342212202;
        Wed, 13 Mar 2024 08:03:32 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/4] multiboot2: Advertise the load type
Date: Wed, 13 Mar 2024 15:04:36 +0000
Message-ID: <20240313150439.791213-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313150439.791213-1-ross.lagerwall@citrix.com>
References: <20240313150439.791213-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Advertise the type of the multiboot2 binary we're building. For now,
it's always ELF.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/boot/head.S     | 3 +++
 xen/include/xen/multiboot2.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494db..015023915a72 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -90,6 +90,9 @@ multiboot2_header:
                    0x200000, /* Load address alignment (2 MiB). */ \
                    MULTIBOOT2_LOAD_PREFERENCE_HIGH
 
+        mb2ht_init MB2_HT(LOAD_TYPE), MB2_HT(OPTIONAL), \
+                   MULTIBOOT2_LOAD_TYPE_ELF
+
         /* Console flags tag. */
         mb2ht_init MB2_HT(CONSOLE_FLAGS), MB2_HT(OPTIONAL), \
                    MULTIBOOT2_CONSOLE_FLAGS_EGA_TEXT_SUPPORTED
diff --git a/xen/include/xen/multiboot2.h b/xen/include/xen/multiboot2.h
index f79204020535..c3a46ad66184 100644
--- a/xen/include/xen/multiboot2.h
+++ b/xen/include/xen/multiboot2.h
@@ -60,6 +60,7 @@
 #define MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS_EFI32       8
 #define MULTIBOOT2_HEADER_TAG_ENTRY_ADDRESS_EFI64       9
 #define MULTIBOOT2_HEADER_TAG_RELOCATABLE               10
+#define MULTIBOOT2_HEADER_TAG_LOAD_TYPE                 11
 
 /* Header tag flags. */
 #define MULTIBOOT2_HEADER_TAG_REQUIRED                  0
@@ -113,6 +114,11 @@
 #define MULTIBOOT2_FRAMEBUFFER_TYPE_RGB                 1
 #define MULTIBOOT2_FRAMEBUFFER_TYPE_EGA_TEXT            2
 
+/* Load types. */
+#define MULTIBOOT2_LOAD_TYPE_ADDRESS                    0
+#define MULTIBOOT2_LOAD_TYPE_ELF                        1
+#define MULTIBOOT2_LOAD_TYPE_PE                         2
+
 #ifndef __ASSEMBLY__
 typedef struct {
     u32 total_size;
-- 
2.43.0


