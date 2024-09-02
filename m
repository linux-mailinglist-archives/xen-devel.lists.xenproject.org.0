Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C19686E2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 14:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787827.1197290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5iM-0001MH-I9; Mon, 02 Sep 2024 11:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787827.1197290; Mon, 02 Sep 2024 11:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl5iM-0001Jo-F3; Mon, 02 Sep 2024 11:59:22 +0000
Received: by outflank-mailman (input) for mailman id 787827;
 Mon, 02 Sep 2024 11:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl5iK-0001Ji-RI
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 11:59:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80fce8f-6922-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 13:59:19 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso3794623a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 04:59:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a327sm5149001a12.4.2024.09.02.04.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 04:59:16 -0700 (PDT)
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
X-Inumbo-ID: c80fce8f-6922-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725278357; x=1725883157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cOC/dGnu3X1jhho5SHHKvtOiZ4slMpESGA9TxKcwN9k=;
        b=S27H+1y3NiWAJzVx2Gvc/mApG2NGT/DO357lfjhAHefKnaRuy0YsaqlBtMvTYO+8gM
         e0BoUtxhgq6AK4HtfWWfcVaRWRyrKV1L4fE882m0xCYncxq5UWeSn2TfjfipUtdXkZp8
         c3QPrS2Vd2Abat2uSCV1gC+RHqH04rw3KPsjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725278357; x=1725883157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOC/dGnu3X1jhho5SHHKvtOiZ4slMpESGA9TxKcwN9k=;
        b=mwhcP8ffFxMQrwFf01eDSz70Iy+0znsu72KDFzYNBJUU/vnSjTvsmbue++K+tB8riw
         xzsl0M2/j5MqbTJS5hyM80FtWlBEjHr6DXxnD66ettp443DdtXJYvnGdUsoS8Jl81ToV
         ejAnoVgL/VQ6aBNgyUs7G+e/FokeEusPImgmzO/In1+HthCPbGMxZpCo4CWEkXsw15g3
         jYZLsNY63z6c+whNs9br0dgr5+WftMkqucBSqhbrHyEYHMihappjGq5s+Wzazbw82oa2
         F0yVz6ZE4MoZ6OW8eXd204WemaSyfgINnTluB9+513fAnyb83I467MJrPtq6VNG3Akdh
         MiSg==
X-Gm-Message-State: AOJu0YzHbix74nWNgjZTagyhVUJKY8dsl7a43oVJRWJOkBicFbr11VfI
	QEdPBajvnSxYQM+l1pfiv6rKv/iQmpwwNd63SI+LVKxseztE0Q7dx19pUWjxcnBtwRnkeQgvit4
	d
X-Google-Smtp-Source: AGHT+IHexfPqE0MqqXF+8hnlTIErnpgXBpQ1NE0D3p6T4YE42rg9ubwV5XcCsGR8z/3YekImvp/tGQ==
X-Received: by 2002:a05:6402:5187:b0:5c0:a8b5:fd6 with SMTP id 4fb4d7f45d1cf-5c24235d941mr5392709a12.14.1725278356487;
        Mon, 02 Sep 2024 04:59:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] x86/boot: Use <xen/types.h>
Date: Mon,  2 Sep 2024 12:59:12 +0100
Message-Id: <20240902115912.3145737-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than defining them locally.  This also covers NULL and *_MAX.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/cmdline.c |  2 ++
 xen/arch/x86/boot/defs.h    | 17 -----------------
 xen/arch/x86/boot/reloc.c   |  2 ++
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index b8ad7f3a144a..28a47da7ab02 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -31,6 +31,8 @@ asm (
     );
 
 #include <xen/kconfig.h>
+#include <xen/types.h>
+
 #include "defs.h"
 #include "video.h"
 
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index ee1a4da6af03..cf9a80d116f3 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -20,14 +20,10 @@
 #ifndef __BOOT_DEFS_H__
 #define __BOOT_DEFS_H__
 
-#include <xen/stdbool.h>
-
 #define __maybe_unused	__attribute__((__unused__))
 #define __packed	__attribute__((__packed__))
 #define __stdcall	__attribute__((__stdcall__))
 
-#define NULL		((void *)0)
-
 #define ALIGN_UP(arg, align) \
                 (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
 
@@ -47,17 +43,4 @@
 
 #define tolower(c)	((c) | 0x20)
 
-typedef unsigned char u8;
-typedef unsigned short u16;
-typedef unsigned int u32;
-typedef unsigned long long u64;
-typedef unsigned int size_t;
-typedef u8 uint8_t;
-typedef u16 uint16_t;
-typedef u32 uint32_t;
-typedef u64 uint64_t;
-
-#define UINT16_MAX	((uint16_t)(~0U))
-#define UINT_MAX	(~0U)
-
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 589e026ff9fb..ac8b58b69581 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -26,6 +26,8 @@ asm (
     "    jmp  reloc                    \n"
     );
 
+#include <xen/types.h>
+
 #include "defs.h"
 
 #include <xen/kconfig.h>
-- 
2.39.2


