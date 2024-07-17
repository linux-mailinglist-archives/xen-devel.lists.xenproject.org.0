Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B316A933C1E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 13:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759932.1169631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2fx-0005uc-8K; Wed, 17 Jul 2024 11:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759932.1169631; Wed, 17 Jul 2024 11:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2fx-0005sk-4T; Wed, 17 Jul 2024 11:18:25 +0000
Received: by outflank-mailman (input) for mailman id 759932;
 Wed, 17 Jul 2024 11:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU2fv-0005se-JD
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 11:18:23 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471bc296-442e-11ef-bbfd-fd08da9f4363;
 Wed, 17 Jul 2024 13:18:22 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52e9f863c46so7396754e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 04:18:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b7e6esm437770066b.86.2024.07.17.04.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 04:18:20 -0700 (PDT)
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
X-Inumbo-ID: 471bc296-442e-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721215101; x=1721819901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXxHID2r5/h+xOVNEnbPBnWQR4jw6KDTXCFkjq0hp7g=;
        b=v+h+f4Cduj6eT1mxmrJQfF9CzP15Oz0fehNXzWqAUWtE4rlSb3D/2tQ79KLaAqXLVc
         c8XeG19gvMrllpSvwB0L3Bhd8fEp+8k+SSbF98040Xa4QhJ9JezVagFtuzNlDIA7MOCd
         7iS9gh/eGgwWkKCdiArY3KpaJ0cYh5eT2MYYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721215101; x=1721819901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXxHID2r5/h+xOVNEnbPBnWQR4jw6KDTXCFkjq0hp7g=;
        b=Q+P1rx3URXdL0ouS/uUluD5BJnPF+Ka9Fw4V8+TV+hTufk4wDy+I81uWDRp6JUHYZk
         nckOGa2WXSlclYrX2Fz+jPedZHxWg5bJm0z72oHgBlasuMQgJORHeVyJJKo5QiRoeKCe
         bk5yBD1iBdKl7s/xz8scsv756U7lWIW/AyCPA5mb79ck7vMgDhQJrBVoktOAvAjv9Rhr
         vEauCc8n+hjQnjkAbQ+CSubjVfqlavUsYFDh1dauKwz8sI4bcG1zoHcMBFNzGKu5SC0+
         EJW1hK8x9V8WgrLyH2xsVWKOlyt2fs6WqXMZTPCEqTu3Npac+sGXIskBmMOWsoz0OnfT
         ZHSQ==
X-Gm-Message-State: AOJu0YyY8a10Zk1V2usxLSuiggwj8kEnvO6zmLW2R4e6G5mp0KjdCeDo
	z+q2qCF8jGegrNFPRZcBOSPa74WBJPeg2NwViyJd/rhyt4UlBgaERKRUxM7/w2DrPA+gAyspqsi
	r
X-Google-Smtp-Source: AGHT+IEWtOoN2FwwNWhl9Yv0al2AJU3gLfzjSNl6qMe1+Tf74wuxtKQTaNUt+Dbpx34uyBTSBn8bww==
X-Received: by 2002:a05:6512:128d:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-52ee544b275mr1040054e87.58.1721215101052;
        Wed, 17 Jul 2024 04:18:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20] hvmloader: Use fastcall everywhere
Date: Wed, 17 Jul 2024 12:18:17 +0100
Message-Id: <20240717111817.3517937-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HVMLoader is a single freestanding 32bit program with no external
dependencies.  Use the fastcall calling convetion (up to 3 parameters in
registers rather than on the stack) globally, which is more efficient because
of reducing the number of stack operations.

Some bloat-o-meter highligs are:

  add/remove: 0/0 grow/shrink: 3/118 up/down: 8/-3004 (-2996)
  Function                                     old     new   delta
  ...
  hvmloader_acpi_build_tables                 1125     961    -164
  acpi_build_tables                           1277    1081    -196
  pci_setup                                   4756    4516    -240
  construct_secondary_tables                  1689    1447    -242

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I was surprised to find that nowhere in the handover to other blobs do we pass
parameters on the stack, but then again the entry point of the new blobs
typically happen with no stack anyway so I suppose I shouldn't be surprised.
---
 tools/firmware/hvmloader/Makefile | 2 +-
 tools/firmware/hvmloader/smp.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index 0e1dce26b342..05572f17f609 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -25,7 +25,7 @@ ld-option = $(shell if $(LD) -v $(1) >/dev/null 2>&1; then echo y; else echo n;
 # SMBIOS spec requires format mm/dd/yyyy
 SMBIOS_REL_DATE ?= $(shell date +%m/%d/%Y)
 
-CFLAGS += $(CFLAGS_xeninclude) -fno-pic
+CFLAGS += $(CFLAGS_xeninclude) -fno-pic -mregparm=3
 
 # We mustn't use tools-only public interfaces.
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 5d46eee1c5f4..1b940cefd071 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -31,7 +31,7 @@
 
 static int ap_callin;
 
-static void __attribute__((regparm(1))) cpu_setup(unsigned int cpu)
+static void cpu_setup(unsigned int cpu)
 {
     printf(" - CPU%d ... ", cpu);
     cacheattr_init();

base-commit: 57338346f29cea7b183403561bdc5f407163b846
prerequisite-patch-id: 212002cd69805ec19f556756d487638c7d348878
-- 
2.39.2


