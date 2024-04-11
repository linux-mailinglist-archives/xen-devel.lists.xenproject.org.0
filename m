Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578158A1883
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703987.1100035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwGl-00080Q-CX; Thu, 11 Apr 2024 15:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703987.1100035; Thu, 11 Apr 2024 15:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwGl-0007z5-8c; Thu, 11 Apr 2024 15:23:19 +0000
Received: by outflank-mailman (input) for mailman id 703987;
 Thu, 11 Apr 2024 15:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruwGk-0007yz-IM
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:23:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b9d00d6-f817-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:23:17 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56c404da0ebso11890775a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:23:16 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fg5-20020a056402548500b0056c5515c183sm779639edb.13.2024.04.11.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:23:15 -0700 (PDT)
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
X-Inumbo-ID: 6b9d00d6-f817-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712848996; x=1713453796; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kvx5iWu0y4pMcC1rcy3iKy6ujT2KOD9cF1Frc/ddC/k=;
        b=jkGmBWYiCJTkrw1Dv0Fhyo1F4WFyOqZdqCaN8i5lOkwXMiUkYnsxD7KmhfDvj4/l35
         GTldcakiftyG82Z/qZ1S4MoMGWC4nVx5d0KEoO+9sJboTWTGWolnjsYLUaL8GNoC0sxv
         cZBT2neIGc9H7+iedhA73pSiKU0NvQUHyrSms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712848996; x=1713453796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kvx5iWu0y4pMcC1rcy3iKy6ujT2KOD9cF1Frc/ddC/k=;
        b=iek1u8ploGztEjWCMdEJ8iJxxePVxBopAcibIzfuExnF5I66cTCM3sd3gYzn3hTiD9
         /MB8ih1zy/ZD0QaxRk/bt8cA6ihdV+3LjeOG1G6L92qfbxUYr/AY6RUdTYUzHJoPUpkE
         lKhFVy7bZv9eieUpYuyU7wWXWSpTOvIKybUFod3V0AsQnK2viMBOhVKwil11r8p8HJMs
         guyyFjARWoy4o4Pi9pSZ8VtwWjKH48BAInFIbhZVFMhFle73ZrbtsZy0fNqvoy/dGGO8
         9Alet7H5+ZtNU4Vzdd5WhHPDSlKQE6DmOjzAiScsJTI0rzcxxmzQnX+9IVEOZL3CqHjf
         D9kA==
X-Gm-Message-State: AOJu0Yw6iAJgElfRSJffx5GzZKaClZ7qq5JxnQvd4npaoiAc4RsyI7um
	nxu4b6BgsGUa/ZTgeS1FoWlAi1vlbBcUfAuswobjIpM02IUcW1xQFFmI7ve0hK7Y0QoDz4RPQ+B
	l5E8=
X-Google-Smtp-Source: AGHT+IGA3qPPz8ulC9rAxmuThsDLUGs6jB3U1/OyvRy69tM+DhQAXGf/qEPIYgufZEqNAOl7ckwCSQ==
X-Received: by 2002:a50:9f2b:0:b0:56e:2ebc:5c4 with SMTP id b40-20020a509f2b000000b0056e2ebc05c4mr76801edf.20.1712848996042;
        Thu, 11 Apr 2024 08:23:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/emul: Simplify segment override prefix decoding
Date: Thu, 11 Apr 2024 16:23:14 +0100
Message-Id: <20240411152314.1755561-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86_seg_* uses architectural encodings.  Therefore, we can fold the prefix
handling cases together and derive the segment from the prefix byte itself.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This makes a marginal saving of 47 bytes, indicating (not unexpectedly) that
the optimiser cannot fold the case statements automatically.

fs/gs is weirder.  The expression is 4 + (b & 1), and for some reason this
adds +264 bytes to the function.  Even if the logical expression is larger
than two simple stores (and it probably is), it's not +264 bytes larger...
---
 xen/arch/x86/x86_emulate/decode.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index de836068fdd8..ee4cbdc0002c 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1043,17 +1043,12 @@ int x86emul_decode(struct x86_emulate_state *s,
         case 0x67: /* address-size override */
             ad_bytes = def_ad_bytes ^ (mode_64bit() ? 12 : 6);
             break;
-        case 0x2e: /* CS override / ignored in 64-bit mode */
+        case 0x26: /* ES override */
+        case 0x2e: /* CS override */
+        case 0x36: /* SS override */
+        case 0x3e: /* DS override, all ignored in 64-bit mode */
             if ( !mode_64bit() )
-                override_seg = x86_seg_cs;
-            break;
-        case 0x3e: /* DS override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_ds;
-            break;
-        case 0x26: /* ES override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_es;
+                override_seg = (b >> 3) & 3;
             break;
         case 0x64: /* FS override */
             override_seg = x86_seg_fs;
@@ -1061,10 +1056,6 @@ int x86emul_decode(struct x86_emulate_state *s,
         case 0x65: /* GS override */
             override_seg = x86_seg_gs;
             break;
-        case 0x36: /* SS override / ignored in 64-bit mode */
-            if ( !mode_64bit() )
-                override_seg = x86_seg_ss;
-            break;
         case 0xf0: /* LOCK */
             s->lock_prefix = true;
             break;
-- 
2.30.2


