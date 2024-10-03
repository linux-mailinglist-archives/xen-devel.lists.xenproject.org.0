Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20798F1FC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809559.1221950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNHW-0000R8-Et; Thu, 03 Oct 2024 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809559.1221950; Thu, 03 Oct 2024 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNHW-0000Ok-CO; Thu, 03 Oct 2024 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 809559;
 Thu, 03 Oct 2024 14:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swNHU-0000Ob-FA
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:58:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea58d975-8197-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 16:58:14 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c8844f0ccaso1383144a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:58:14 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102859casm94462866b.47.2024.10.03.07.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:58:12 -0700 (PDT)
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
X-Inumbo-ID: ea58d975-8197-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727967493; x=1728572293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGsl96EbJi//MexkeYAYAOH4FIDs3vyRmf07tQpcP8o=;
        b=QgqalzLmx+kSEMaq4JaJz5zA39TqecoTtI1XvCNABQoY+vUqBe0XZ430qjF0h0Mpb2
         lYPGvfWVJq4MeGWCYA9JOfW85T5SlW+VhjInAuQ6e1/f0KO74QURbmyAbzV38rYOFsOj
         poRF1yEtAU2NlMO8p4uC/ZWKVflOMtIIr9pAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727967493; x=1728572293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGsl96EbJi//MexkeYAYAOH4FIDs3vyRmf07tQpcP8o=;
        b=mReVhFkvWbvo6EUHY3UAofF44/80OOnmemp9Bz/1xHKRdjWoqd9z9179MEXPUoiZYG
         SSxHBiPVRRnjDSr/Ivcy81AVQIpjpzIRofm+AndGj0Oez7a6sfVgeauTnnfNiPjxNcoO
         +5sidh/stZFzFEYzTw6ezzdVHjdqjFv9w3HQSe88+5VzEMJW+kXA884ygEhasv31+/6n
         G2b4PUVU8RqpCE6JCU+uvgvKDD02+yMSV7tPnfE218dHqesqGfDoHZSh7gQyw3gAYJcD
         Dc9fW7cLJk9EoK2eh6iPBthQ9iwA1tJdJKl6Cx9rZLdQDL71z7I3MgnHiN3X+V70EfTV
         O5Hw==
X-Gm-Message-State: AOJu0YwyjyaZgSXNtZEVmWF3fxwOi2qo3QAv2mr9yi5qRwKMzlkD+kUl
	CinnhkeWCTw1yRsu4GyEdvYT6TaZuyQfxtu0JbJXXncyDiEn8vfRuVGdvn+H2VgMZl0hGuR5JS+
	XsJ4=
X-Google-Smtp-Source: AGHT+IGUL/HZNccId+soyn3Qd3Ghz0NZo0SrhW0cj1SSeugN+ZN9/nQqP5oFTEuPOYgQ5optixsdCQ==
X-Received: by 2002:a17:907:8015:b0:a99:9e9:a401 with SMTP id a640c23a62f3a-a9909e9a892mr265023766b.19.1727967493407;
        Thu, 03 Oct 2024 07:58:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH] x86/boot: Don't use INC to set defaults
Date: Thu,  3 Oct 2024 15:58:10 +0100
Message-Id: <20241003145810.2217075-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__efi64_mb2_start() makes some bold assumptions about the efi_platform and
skip_realmode booleans.  Set them to 1 explicitly, which is more robust.

Make the comment a little more consice.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d1856d8012c9..af776c201a15 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -279,14 +279,12 @@ __efi64_mb2_start:
         pop     %rbx
         pop     %rax
 
-        /* We are on EFI platform and EFI boot services are available. */
-        incb    efi_platform(%rip)
-
         /*
-         * Disable real mode and other legacy stuff which should not
-         * be run on EFI platforms.
+         * efi_multiboot2_prelude() is happy that we're on EFI platform.  Skip
+         * the BIOS initialisation path.
          */
-        incb    skip_realmode(%rip)
+        movb    $1, efi_platform(%rip)
+        movb    $1, skip_realmode(%rip)
 
         /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
         lea     trampoline_setup(%rip),%r15

base-commit: eb21ce14d709ef0c0030d0625028a4868c81126f
-- 
2.39.5


