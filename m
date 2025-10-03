Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F394ABB85B7
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136906.1473431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of4-0008D7-GW; Fri, 03 Oct 2025 22:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136906.1473431; Fri, 03 Oct 2025 22:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4of3-00082f-Tk; Fri, 03 Oct 2025 22:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1136906;
 Fri, 03 Oct 2025 22:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4of0-0004mF-Q0
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:58 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d89fee68-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:58 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1550912f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:58 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:56 -0700 (PDT)
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
X-Inumbo-ID: d89fee68-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532037; x=1760136837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRfAmeeR6zAUL5Qp5V1Fb0vHuvHuaq0E0X01lnE0vvw=;
        b=Jcq5ITeYUXvEjsV98E1N1kka5T76+aUHhgezPl9aSXOoqUGpvrdSku5uY7o4FNgC8Z
         dXzDbQvgAWAOe/qk88NbANa+/+S0xANQ+LW9ACsJXwjKOe5daAXRo7h1217Ft2GJDAX4
         snMKhM0tornjHWQhpBSNYMoOvhGyvybOXGGRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532037; x=1760136837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRfAmeeR6zAUL5Qp5V1Fb0vHuvHuaq0E0X01lnE0vvw=;
        b=Mz1RBtTxpxLFrXOYZWiICg65W5Y9ppQADq7ocCJ+6WO1N7WVkg+jzQ1QtfJxoWgnl9
         MjbNNZ1pdnkyqMSU1x4R5OAPwD9PEE7DNr6Afh9tLwtkNWk3XggsXLOB/msw0S/DwHH5
         i/XbIQSrv94mxjZMHYt+JgO4VDIkvfln4zhkaZKZkwsOvYsHhsZNCBkItSaxdOSd3Gj1
         Ldrnn4xUSyw3Q9rWrHFcFesuhKcKSz5zK6Oi0QBj0YPvSNvEO7isES74Qgb8//jftDdc
         eKwJXPyDYzg8XPXb2dtj0FfB/Jxqd0JL1boiKbrUJ/cTYDPOKmsQw+V7ImK1T/L7/TNO
         LAwA==
X-Gm-Message-State: AOJu0YzLznw7o+owbMpvQirLhuAioAYUC2GbYZ4bCdYLQ9DMqT8EZfRk
	kXuiEaZyEUj6mVL8v9msOhZBA2GsvT8Va7vUHrY9NlAffA7BKYVpnBMpIkU0on/o4dNFgjVodR1
	EkntyJ2j60zQK
X-Gm-Gg: ASbGncs1rbw1zkQd9KqAjMJlzTAwmdK/lsRCJcjm7mNResKsuFP6pN2Q/3NRJlWeMA5
	4h1JvnGl9Y7RothwXgQ/EABsS/G7y4kDut/CMcSjGLtLuTOZvjjVCMb3pEUFJSPNyYIaVWVaC2w
	twYA4p16v20QCvD6LjZ6gir9uvWlpdEN1UD8O/9O/X0f/9Gojp1GTbD9rcy8GsOo88bBna1c0cF
	q9F88G0nbQLwdjetjon+ZY3zpMHyHdOQuqApz6HtdkwmYc9FgvilGHluhBvle86Bs8YRQ8d3zBk
	H5HcwWKJDXPghu174jsv+iTXIJTIfy2XBj7UMCtAUJZHT5nZ7UOTdGHQLvIKW/X9B8tkCMO74Ey
	jkq/GAGxVSf/OqHa82iVKwJVmAd1Z1hH8wFXOTPHt/iNHAwO5i6+0NY3DvRt/jcVqTSv7YT1X4W
	p2x6y1O26MF5rGYjZsna9V
X-Google-Smtp-Source: AGHT+IEiAOCbCOb8YqE1eusNq1HSVlGn8l0T3VYg2moBLnwH7xsGfpC6+V23VPQNoQDG2DCPBoivrw==
X-Received: by 2002:a05:6000:2303:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-4256714bac2mr3112200f8f.14.1759532037024;
        Fri, 03 Oct 2025 15:53:57 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 14/22] x86/pv: Deduplicate is_canonical_address() in do_set_segment_base()
Date: Fri,  3 Oct 2025 23:53:26 +0100
Message-Id: <20251003225334.2123667-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is really a rearrangement to make adding FRED support easier.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New

There is a marginal code size improvement:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-46 (-46)
  Function                                     old     new   delta
  do_set_segment_base                          496     450     -46

but it does get undone by the FRED support.
---
 xen/arch/x86/pv/misc-hypercalls.c | 32 ++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 7a37f16bf038..4c2abeb4add8 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -176,27 +176,29 @@ long do_set_segment_base(unsigned int which, unsigned long base)
     switch ( which )
     {
     case SEGBASE_FS:
-        if ( is_canonical_address(base) )
-            write_fs_base(base);
-        else
+    case SEGBASE_GS_USER:
+    case SEGBASE_GS_KERNEL:
+        if ( !is_canonical_address(base) )
+        {
             ret = -EINVAL;
-        break;
+            break;
+        }
 
-    case SEGBASE_GS_USER:
-        if ( is_canonical_address(base) )
+        switch ( which )
         {
-            write_gs_shadow(base);
+        case SEGBASE_FS:
+            write_fs_base(base);
+            break;
+
+        case SEGBASE_GS_USER:
             v->arch.pv.gs_base_user = base;
-        }
-        else
-            ret = -EINVAL;
-        break;
+            write_gs_shadow(base);
+            break;
 
-    case SEGBASE_GS_KERNEL:
-        if ( is_canonical_address(base) )
+        case SEGBASE_GS_KERNEL:
             write_gs_base(base);
-        else
-            ret = -EINVAL;
+            break;
+        }
         break;
 
     case SEGBASE_GS_USER_SEL:
-- 
2.39.5


