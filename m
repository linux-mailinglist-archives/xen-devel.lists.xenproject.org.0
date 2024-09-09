Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14B0971D3E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794630.1203674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnV-0004Yp-8p; Mon, 09 Sep 2024 14:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794630.1203674; Mon, 09 Sep 2024 14:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfnV-0004Uq-3j; Mon, 09 Sep 2024 14:55:21 +0000
Received: by outflank-mailman (input) for mailman id 794630;
 Mon, 09 Sep 2024 14:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnCw=QH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snfnT-0003mf-EI
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:55:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c94fc8-6ebb-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 16:55:18 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso10566690a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 07:55:19 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cfb3acsm352836566b.184.2024.09.09.07.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 07:55:17 -0700 (PDT)
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
X-Inumbo-ID: 87c94fc8-6ebb-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725893718; x=1726498518; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y9YIa+flEwcm1mi9TBLTtzT97ruhPHJAxbMZ4R863o=;
        b=CVVDTCmja/TjfIIrDbgmHuIjjdmIxOBGGcRiVrC8g8xsI9bBN/xs2ZklsM4CroyJtD
         WxxCv/JvUJlHMRGVbOf55wQBgvTB2u16GtMWKq4ScSUgwpgL1o+cjop1dGbn/Fa+3fU8
         AtrP7LElIpQxa1l0q+zFLR3nhyRQsGD4KRmJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725893718; x=1726498518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y9YIa+flEwcm1mi9TBLTtzT97ruhPHJAxbMZ4R863o=;
        b=fxoAvKp43sipWBBo6gbva9w3cf2gFdg1N28oJuXAHi5bDlMyc9ZkzDT0/DEzWfUL3A
         xBAaycUNxI3UXuhbc1XMrrq4Im/saMG+nyZLsN70l/dJmaulWVEJvwnxdwTTFxaiDhhC
         P7GfXREIbzrUI5D8pCqHd6EX/ApUGL73VmShlGDTmt+9RQhGExr7g/lUXjwROc0LiuO9
         UbqKP9Moxll285fPl9zIdPTICpLOjSEMbYYxhsxWmYa94tdmba3RHtHEYT494iIMicno
         0XcoHFb+zVi9PHIIbUJOWM6lgg6HZLXtdz9sdbqIcvtpGrcX3j9nRqv46SrtVn2iEQ8E
         Nx+w==
X-Gm-Message-State: AOJu0YzZ2LYb30D5qaZAm63bIozvpV6MLqK+sRuzrkUQucueOWIzQlPW
	EAYj44kWiFCq5WyTNXgXBXR36MUWsggHFh/iFJWdRB1mHvMUsvSZwoEgfags68i8EH1mk0K+4uL
	Y
X-Google-Smtp-Source: AGHT+IEFfPivq+9DlNjPZuNfM5ZQFbHwbcKqJNNhCe2IEG0+dvd4j+uQqjyPwl/N4zeeqIbkwgW/4g==
X-Received: by 2002:a17:906:f584:b0:a8d:29b7:ece3 with SMTP id a640c23a62f3a-a8d29b7ef61mr730308466b.33.1725893717514;
        Mon, 09 Sep 2024 07:55:17 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 4/4] x86/time: prefer CMOS over EFI_GET_TIME
Date: Mon,  9 Sep 2024 16:54:55 +0200
Message-ID: <20240909145455.7517-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909145455.7517-1-roger.pau@citrix.com>
References: <20240909145455.7517-1-roger.pau@citrix.com>
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
index c6d3f19a56d1..8567eb2a98e3 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1589,14 +1589,14 @@ static void __init probe_wallclock(void)
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


