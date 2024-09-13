Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7843977A62
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 09:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798037.1208190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1DA-0004HO-F5; Fri, 13 Sep 2024 07:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798037.1208190; Fri, 13 Sep 2024 07:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp1DA-0004At-Ar; Fri, 13 Sep 2024 07:59:24 +0000
Received: by outflank-mailman (input) for mailman id 798037;
 Fri, 13 Sep 2024 07:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jnXM=QL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sp1D8-0003uw-Op
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 07:59:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15e64b44-71a6-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 09:59:21 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb8dac900so17464775e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 00:59:21 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b181ecasm14793085e9.43.2024.09.13.00.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:59:20 -0700 (PDT)
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
X-Inumbo-ID: 15e64b44-71a6-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726214360; x=1726819160; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVE8Td0DB91LsF/Q4kFEpq7x44WG+vLomrJspkQDYIA=;
        b=I3xXBoHKuCZ2hREuccHJiQK3GKGg4hbWQEc+UBrngXvLihdGaK5dzJFIAGOGMKmEZy
         H3CzGtOYsDs8EQ62ve5tRUDpuqISQnuFctQtXAaODZrCOnjM94yB/cGOgEu5ezxSCZ59
         L8zSbeMmDAYGWIejeqo8w4JdNopHD1t0ydnvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726214360; x=1726819160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVE8Td0DB91LsF/Q4kFEpq7x44WG+vLomrJspkQDYIA=;
        b=kiz7D/4OhLL6B6x53iuxaG90mCZWEgS3GHpB4qDkreLU/zvzxzmXJfV9n6Uwc7r8+i
         cFmNO91imD1XiuGzpfiW++SX8ZKL38GA4OzKuN2PCfw/Hyr006G4Z44+yuW4kwJKJj7V
         CalHf79AlNGe5yhxGrlZxpA+DLMBlrjdAwkk7CW+YuOE4m5SA5xOrNiHeGb+9IkTlKnW
         PCQ3k8RdKwvHdneBephAv8WgvNegwWBAgy2GsJPSJO6EB89v5UggtRytZowrcNzEpdA3
         nvDGoGUpVwym+YU6xSOXzbDXkhJ/zKjm761FSR5Mkx0OKrMmk8k1goDNtKo4fqmtUs9s
         rmUQ==
X-Gm-Message-State: AOJu0YxSqb4v1Ru5uUd56P1xrKJeFha4Kg2E0jJPfMdI+SYAAA0IdQrI
	dS5FfYkASWoZfAD4PkuyHhyLCh1IFk1Ez5r15jX3bzpnDVFlze5OdxhBezgV89BblBN7YuXTSQx
	q
X-Google-Smtp-Source: AGHT+IGdUcOsAuRBJht8XF1xVxjpss5E+USi/c5Phj6XkWTcAJoXq907AFPf88llPJvUBRFzQwbUWg==
X-Received: by 2002:a05:600c:4691:b0:42c:b1e1:a45b with SMTP id 5b1f17b1804b1-42cdb547f39mr41301195e9.19.1726214360298;
        Fri, 13 Sep 2024 00:59:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v7 2/2] x86/time: prefer CMOS over EFI_GET_TIME
Date: Fri, 13 Sep 2024 09:59:07 +0200
Message-ID: <20240913075907.34460-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913075907.34460-1-roger.pau@citrix.com>
References: <20240913075907.34460-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The EFI_GET_TIME implementation is well known to be broken for many firmware
implementations, for Xen the result on such implementations are:

----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000062ccfa70>] 0000000062ccfa70
[...]
Xen call trace:
   [<0000000062ccfa70>] R 0000000062ccfa70
   [<00000000732e9a3f>] S 00000000732e9a3f
   [<ffff82d04034f34f>] F arch/x86/time.c#get_cmos_time+0x1b3/0x26e
   [<ffff82d04045926f>] F init_xen_time+0x28/0xa4
   [<ffff82d040454bc4>] F __start_xen+0x1ee7/0x2578
   [<ffff82d040203334>] F __high_start+0x94/0xa0

Pagetable walk from 0000000062ccfa70:
 L4[0x000] = 000000207ef1c063 ffffffffffffffff
 L3[0x001] = 000000005d6c0063 ffffffffffffffff
 L2[0x116] = 8000000062c001e3 ffffffffffffffff (PSE)

****************************************
Panic on CPU 0:
FATAL PAGE FAULT
[error_code=0011]
Faulting linear address: 0000000062ccfa70
****************************************

Swap the preference to default to CMOS first, and EFI later, in an attempt to
use EFI_GET_TIME as a last resort option only.  Note that Linux for example
doesn't allow calling the get_time method, and instead provides a dummy handler
that unconditionally returns EFI_UNSUPPORTED on x86-64.

Such change in the preferences requires some re-arranging of the function
logic, so that panic messages with workaround suggestions are suitably printed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Updated to match previous changes.
---
 xen/arch/x86/time.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index e4751684951e..b86e4d58b40c 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1592,14 +1592,14 @@ static void __init probe_wallclock(void)
         wallclock_source = WALLCLOCK_XEN;
         return;
     }
-    if ( efi_enabled(EFI_RS) && efi_get_time() )
+    if ( cmos_rtc_probe() )
     {
-        wallclock_source = WALLCLOCK_EFI;
+        wallclock_source = WALLCLOCK_CMOS;
         return;
     }
-    if ( cmos_rtc_probe() )
+    if ( efi_enabled(EFI_RS) && efi_get_time() )
     {
-        wallclock_source = WALLCLOCK_CMOS;
+        wallclock_source = WALLCLOCK_EFI;
         return;
     }
 
-- 
2.46.0


