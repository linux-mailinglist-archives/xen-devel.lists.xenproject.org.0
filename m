Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52715969E9E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 15:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789153.1198716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBy-0008Lg-Ug; Tue, 03 Sep 2024 13:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789153.1198716; Tue, 03 Sep 2024 13:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slTBy-0008Em-Pi; Tue, 03 Sep 2024 13:03:30 +0000
Received: by outflank-mailman (input) for mailman id 789153;
 Tue, 03 Sep 2024 13:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nxvv=QB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slTBx-00075o-E3
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 13:03:29 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9df047b-69f4-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 15:03:28 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f51b67e16dso60990161fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 06:03:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c800554d6sm88155245e9.43.2024.09.03.06.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:03:26 -0700 (PDT)
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
X-Inumbo-ID: e9df047b-69f4-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725368608; x=1725973408; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jceNvRc/CuXKw5rQwzG8yXCY7o696EqY1ix9gGzcyRM=;
        b=rZ34bLXN4P+MY9vB+yikXTrTZeXq7yVNVveljk+SN6qZAGyaCLLosOwqo3Ovfr0qUA
         HNYAXpLcXXh/Gj9DWwLUBpvgSd2FiHXaA6nZT6g1Xf/o6rOokw5I2LvZZI0T9Zb+v/tY
         W+fLMAm1Jj/uB7CXS3xxJUyr+1S/gnhEjCDmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725368608; x=1725973408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jceNvRc/CuXKw5rQwzG8yXCY7o696EqY1ix9gGzcyRM=;
        b=vavzfEu98yyV5HlRP/Ftf87gaz06mkvnrotDRFea43NVv3fH6889fdNWi2/1HMufDE
         HJ+/86k5QmEcEaX1UkbW6YJchbxdxl60iE0q4LE12eka+Eboh9F9GLj+cgKbzhGhTpHp
         l54FhJQy89QnO/FJUq33IxbyyCT9Qgvf7HNfkcahP79M2OH+is8QbOkhq/UB753xjqSk
         vGm5dkeJCI0HcLrJvSEvVchdBcI+8+N1cWvsdIIiNHysrZ90pstrZWoHwZp8bAe1Kj5O
         Z0Sc2vLIVOKozn+lv1Gx4ODwa6UznKzC6CqT0xe8mxE9VHlckZPM/3yx3myxFES5RDYV
         PuKQ==
X-Gm-Message-State: AOJu0Yyo1DUdB1huHyV9TsAOx+/mDeukL/jwWoUuthkGhBaGdH9wTx+u
	8KDj+96AlCAOq23Rn9wM8UP2Lv/Nf3h57jqo4t/sKHQzkfUOh8QCRRsAtz0X4b9k/7oEKL+fLoP
	u
X-Google-Smtp-Source: AGHT+IEDWCPrJWORvsJ13y/C7todzJDIqiW3XEZeizyR6oZMsdTVnezZK68W3iNYQHJoc5ZlvRvoOQ==
X-Received: by 2002:a2e:be84:0:b0:2f3:b078:84bc with SMTP id 38308e7fff4ca-2f64d472191mr6632101fa.4.1725368606925;
        Tue, 03 Sep 2024 06:03:26 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 5/7] x86/time: prefer CMOS over EFI_GET_TIME
Date: Tue,  3 Sep 2024 15:03:01 +0200
Message-ID: <20240903130303.71334-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240903130303.71334-1-roger.pau@citrix.com>
References: <20240903130303.71334-1-roger.pau@citrix.com>
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
index 8402131d7b6a..da3fd1555041 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1564,14 +1564,14 @@ static void __init probe_wallclock(void)
         wallclock_source = WALLCLOCK_XEN;
         return;
     }
-    if ( efi_enabled(EFI_RS) && efi_get_time() )
+    if ( cmos_probe() )
     {
-        wallclock_source = WALLCLOCK_EFI;
+        wallclock_source = WALLCLOCK_CMOS;
         return;
     }
-    if ( cmos_probe() )
+    if ( efi_enabled(EFI_RS) && efi_get_time() )
     {
-        wallclock_source = WALLCLOCK_CMOS;
+        wallclock_source = WALLCLOCK_EFI;
         return;
     }
 
-- 
2.46.0


