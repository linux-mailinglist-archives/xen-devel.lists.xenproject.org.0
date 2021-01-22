Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20B2FF999
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 01:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72503.130606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjf-0002pS-GK; Fri, 22 Jan 2021 00:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72503.130606; Fri, 22 Jan 2021 00:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2kjf-0002oi-CM; Fri, 22 Jan 2021 00:55:35 +0000
Received: by outflank-mailman (input) for mailman id 72503;
 Fri, 22 Jan 2021 00:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0NXE=GZ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1l2kjd-0002iW-EK
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 00:55:33 +0000
Received: from mail-pl1-x62c.google.com (unknown [2607:f8b0:4864:20::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d746794-a24b-49ba-b98d-e7ce7e3b718a;
 Fri, 22 Jan 2021 00:55:26 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b8so2312081plx.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 16:55:26 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f00:c640:3cc1:5f60:de20:49b1])
 by smtp.gmail.com with ESMTPSA id j23sm6930632pgj.34.2021.01.21.16.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 16:55:24 -0800 (PST)
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
X-Inumbo-ID: 9d746794-a24b-49ba-b98d-e7ce7e3b718a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3ouXrDPzZIwH7JsiHDtn3qm3PapKei5kef1qWcaPd0=;
        b=D31IdY+csdPAQtMOWNsiXkc4b4feWp8S5j+gp3mup7FX5oBFRjr4CjOmG1DsY9LZnO
         INfrMD0HF6zf9fMYmN9KwGJLBRlM+B8zGEybTW9+OWQjP8DLj83sISaNUrq43z3cQBWp
         NWiAQPM8eTScIDIXw8kf6/yjthh8rK3Z3BAGXCXE2HeG4sCJJfkUxDWtnp59KQ0jHZ9S
         /y6+iIdGb5Hy3FwAd4QeuLVJKr4JsbSU4pZBzIvyF1ib1Yr9V8BQxxx87tOi/KX3NCTA
         38OSjNpjtbdnZuImymTZm34MpYjYGt1/FF6qVyZNQIRKwevv9HK5KA51I11PFJWHBEKX
         gWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3ouXrDPzZIwH7JsiHDtn3qm3PapKei5kef1qWcaPd0=;
        b=YUFebo9IAC08Ja4CbeuSmkkt9StQGsYwz0mGEW+AO+zfhEdSln7pXyxSWsEPul5ce5
         EOr9mKsUNvW3CzkFko9yutM0rsWGw9amE4m6STS/ZBU3GPmoCjgL7H9/5KPov7+tZeTE
         VRDYbRWE0oIXh7yFGAcnwlGvkg0BS+jxZdc9Z9N+IHi1Fbo+foy/B/NxTh4ir4LUm9lE
         sOovXaqjzyF/DqGiF4tyC08vdh0Eg9whXeknG76/wpqjjNRht+DYYfAlbHrkTYQPUGcn
         D0eh2+pvjFT3Lurf4E20k25qA3MP7i2AGvvJnvnUbF9Y8FgD9rcsFcAh3CgNZlmRURGD
         90xQ==
X-Gm-Message-State: AOAM530gmMvAfCpVaqFHNaItaBZeM4FGIdSut5bHDLBzTGMmAXdpkPre
	pWYNXZfbsKrdfJizA3LDo86Hh6sVD47CScIn
X-Google-Smtp-Source: ABdhPJx2qXc7gU0d43Jwn4Ihk2QpKmLwoe+XuUwIDUu5t4aUYsvrM9F/ZKEQFpIkcDtrQ1OX2WCYyg==
X-Received: by 2002:a17:902:8ec1:b029:dc:8ae1:7a22 with SMTP id x1-20020a1709028ec1b02900dc8ae17a22mr2425337plo.6.1611276925439;
        Thu, 21 Jan 2021 16:55:25 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
	Bobby Eshleman <bobbyeshleman@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/5] xen/x86: add some addresses to the Multiboot header
Date: Thu, 21 Jan 2021 16:51:42 -0800
Message-Id: <0b05bedc32833a2022d2698d4c116cb867a9119c.1611273359.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1611273359.git.bobbyeshleman@gmail.com>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Kiper <daniel.kiper@oracle.com>

In comparison to ELF the PE format is not supported by the Multiboot
protocol. So, if we wish to load xen.mb.efi using this protocol we
have to put header_addr, load_addr, load_end_addr, bss_end_addr and
entry_addr data into Multiboot header.

The Multiboot protocol spec can be found at
  https://www.gnu.org/software/grub/manual/multiboot/

Signed-off-by: Daniel Kiper <daniel.kiper@oracle.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
---
 xen/arch/x86/boot/head.S | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 2987b4f03a..189d91a872 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -50,13 +50,24 @@ ENTRY(start)
         .balign 4
 multiboot1_header:             /*** MULTIBOOT1 HEADER ****/
 #define MULTIBOOT_HEADER_FLAGS (MULTIBOOT_HEADER_MODS_ALIGNED | \
-                                MULTIBOOT_HEADER_WANT_MEMORY)
+                                MULTIBOOT_HEADER_WANT_MEMORY | \
+                                MULTIBOOT_HEADER_HAS_ADDR)
         /* Magic number indicating a Multiboot header. */
         .long   MULTIBOOT_HEADER_MAGIC
         /* Flags to bootloader (see Multiboot spec). */
         .long   MULTIBOOT_HEADER_FLAGS
         /* Checksum: must be the negated sum of the first two fields. */
         .long   -(MULTIBOOT_HEADER_MAGIC + MULTIBOOT_HEADER_FLAGS)
+        /* header_addr */
+        .long   sym_offs(multiboot1_header)
+        /* load_addr */
+        .long   sym_offs(start)
+        /* load_end_addr */
+        .long   sym_offs(__bss_start)
+        /* bss_end_addr */
+        .long   sym_offs(__2M_rwdata_end)
+        /* entry_addr */
+        .long   sym_offs(__start)
 
         .size multiboot1_header, . - multiboot1_header
         .type multiboot1_header, @object
-- 
2.30.0


