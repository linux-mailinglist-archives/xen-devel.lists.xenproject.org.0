Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA441976743
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797312.1207251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnI-0006rq-QS; Thu, 12 Sep 2024 11:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797312.1207251; Thu, 12 Sep 2024 11:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sohnI-0006ps-NL; Thu, 12 Sep 2024 11:15:24 +0000
Received: by outflank-mailman (input) for mailman id 797312;
 Thu, 12 Sep 2024 11:15:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sohnH-0006KJ-Bb
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:15:23 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cd94f62-70f8-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 13:15:21 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so574823a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:15:21 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41ba7sm6454950a12.4.2024.09.12.04.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 04:15:19 -0700 (PDT)
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
X-Inumbo-ID: 4cd94f62-70f8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726139721; x=1726744521; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CJQfMZC1/Ng5+JCHjsNi6ZaFAblZq9Kpgx/jpks0FQ=;
        b=CGCMFN6FikhziBNpPNhWzqsj+PCv8Zm1s7bcIARTUz2Anoq5fOgh13Mw4iW68xp2e5
         u4R86823og4Xe47v6uQQuxITNMdlnHln4IAqDwW8M4eh3jhGNXNDmtXmu4RCu+0l81ww
         uXkOsBxWqMJKB21rNq+5NUbtc4WVfE1jtBEwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726139721; x=1726744521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CJQfMZC1/Ng5+JCHjsNi6ZaFAblZq9Kpgx/jpks0FQ=;
        b=OncrdGYgy52bzfJcKJeTHteRd65Vet4I5q3VbFwAjABg3el7Maa798TRZI6934JMyB
         R+uTCXH6gBUTCUZAYS0XmurzZTlsNM2kXU0u9sj+SgcOX2yxoTYpNA8Nsnzo5989jLhn
         k28jl5Ecu7kDPS44Uz/GPwACkCeI8XKJo5ZmUA4pug4pZmOkllP5gKEbrXY5OX+USB+M
         9E+d5ox86ihiL7slwF52uBo9a1IRnKQjXVmkp8F8j03MBGP5JxUh3WJoanXSg/SemsnJ
         Deh8IWirT0szgQc0VWaeC89ARM+XhV88TQ78M+AAqOiXvBXtbgAGD6z/ml3vhAc/Qqef
         zuyA==
X-Gm-Message-State: AOJu0YxtJoDPTaNTBLg8/d+Szhigj3Sk/jGTH0shMd1xf9t9H7hXF0yY
	GrRUsgsY+UsxV+rXNtSmWTjXqVPVOHfAogGQ+n5OQR46b4BEWMg79GXLbEZr3cQMVDvHFyEUznE
	H
X-Google-Smtp-Source: AGHT+IENssPDwRzVQlmWHjg5agQuBfSbQzCyl5TolCmoZ1sYw03fhTeYumvJ9eVdv7Rxj9iWgKV0Aw==
X-Received: by 2002:a05:6402:350f:b0:5c2:5d34:a481 with SMTP id 4fb4d7f45d1cf-5c413e10c2fmr1658248a12.11.1726139720582;
        Thu, 12 Sep 2024 04:15:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v6 2/2] x86/time: prefer CMOS over EFI_GET_TIME
Date: Thu, 12 Sep 2024 13:15:14 +0200
Message-ID: <20240912111514.26934-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912111514.26934-1-roger.pau@citrix.com>
References: <20240912111514.26934-1-roger.pau@citrix.com>
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
index b97c81ebd3e9..e4fe03197381 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1590,14 +1590,14 @@ static void __init probe_wallclock(void)
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


