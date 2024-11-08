Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E751F9C264C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832906.1248239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VL3-0003h7-Ac; Fri, 08 Nov 2024 20:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832906.1248239; Fri, 08 Nov 2024 20:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VL3-0003eU-6E; Fri, 08 Nov 2024 20:12:13 +0000
Received: by outflank-mailman (input) for mailman id 832906;
 Fri, 08 Nov 2024 20:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9VL2-0002pM-1O
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:12:12 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbf37b87-9e0d-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 21:12:09 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cefc36c5d4so3287378a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 12:12:09 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d7e6sm2334739a12.14.2024.11.08.12.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 12:12:04 -0800 (PST)
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
X-Inumbo-ID: bbf37b87-9e0d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJiZjM3Yjg3LTllMGQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDk2NzI5Ljg1NzcwNywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731096727; x=1731701527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoqxbvTlH2fbgMqE+4mTh6oqAYRmOVdflDf9LezcXaw=;
        b=Z/avr9Pzd3nEmEDVSR6D55IMuIHZYg7x5MJb4BJGV08/4XztTUoYp/UViVt8JsnDHR
         eu11VTrE+3xXKNAVPI/wFJ9ZiFdKfw2BO1eUiv9ifCqs/hqHtVZEFx618L+W0Q5+aFpD
         mVC1qb/MNWDReyIqNyoVripc7Yj1EpxwQpxQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096727; x=1731701527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoqxbvTlH2fbgMqE+4mTh6oqAYRmOVdflDf9LezcXaw=;
        b=TGIQFNvaGZXbd01Roo5csuknRlWzj6O2k9RBsIWAGqMnaTpzuBEIhYTi4+T+6qTI+D
         TA32/AyH5C4oXuqgl81SXPKWil0QWozhri/sCo4EqSGmRlSiU2+XFAOriCnlyleInaci
         xr5KmpPewl261Dx75XgE4DFOnqsiysV95JXUuJp2XdsDzyIKDqzk2rt+L/fgRDOa3Ikh
         m9W+tUtoX0uSd/zrd8n+sJxlvbfOkkoLjnmPUaMzLeHSg5aCgu9OJC0xJHjS4GcCTeSW
         SQN76fHfMUAYK3h19auxySLfBTX5DWBjl3wu6JsvXkKgj/tSOAB/Ahw1V7Wsucs1G+7M
         XZGQ==
X-Gm-Message-State: AOJu0YxPU43ohsY6NgNDmyIzRXJTN23u0y6WCeGkK9LXQAscHd63S6J1
	5bX13oE1h6lWyTcwrWltsR6FImH/gjyuM376L/a9i3kTasJNxZUSfGoWqWw46P8v86wW89tRf1c
	m
X-Google-Smtp-Source: AGHT+IEK8SppKwQFFl9O9k94CcXlNkyxkvJuNdDNdoZ5iiOdVBurhwLQ+QJNCOePExKv/QxxrUdErw==
X-Received: by 2002:a05:6402:234a:b0:5ce:fc32:3536 with SMTP id 4fb4d7f45d1cf-5cf0a272570mr3363501a12.0.1731096727437;
        Fri, 08 Nov 2024 12:12:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86: Drop mach-default/bios_ebda.h
Date: Fri,  8 Nov 2024 20:11:46 +0000
Message-Id: <20241108201147.812036-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108201147.812036-1-andrew.cooper3@citrix.com>
References: <20241108201147.812036-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has a single function, and a single user.  This is unlikely to change
moving forwards so fold it into mpparse.c

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/mach-default/bios_ebda.h | 15 ---------------
 xen/arch/x86/mpparse.c                            |  9 +++++++--
 2 files changed, 7 insertions(+), 17 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/mach-default/bios_ebda.h

diff --git a/xen/arch/x86/include/asm/mach-default/bios_ebda.h b/xen/arch/x86/include/asm/mach-default/bios_ebda.h
deleted file mode 100644
index 42de6b2a5b97..000000000000
--- a/xen/arch/x86/include/asm/mach-default/bios_ebda.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef _MACH_BIOS_EBDA_H
-#define _MACH_BIOS_EBDA_H
-
-/*
- * there is a real-mode segmented pointer pointing to the
- * 4K EBDA area at 0x40E.
- */
-static inline unsigned int get_bios_ebda(void)
-{
-	unsigned int address = *(unsigned short *)maddr_to_virt(0x40E);
-	address <<= 4;
-	return address;	/* 0 means none */
-}
-
-#endif /* _MACH_BIOS_EBDA_H */
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index b16c105b18bf..957a19d9887d 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -31,8 +31,6 @@
 #include <asm/io_apic.h>
 #include <asm/setup.h>
 
-#include <bios_ebda.h>
-
 /* Have we found an MP table */
 bool __initdata smp_found_config;
 
@@ -734,6 +732,13 @@ static void __init efi_check_config(void)
 		efi_unmap_mpf();
 }
 
+static unsigned int get_bios_ebda(void)
+{
+	unsigned int address = *(unsigned short *)maddr_to_virt(0x40E);
+
+	return address << 4; /* 0 means none */
+}
+
 void __init find_smp_config (void)
 {
 	unsigned int address;
-- 
2.39.5


