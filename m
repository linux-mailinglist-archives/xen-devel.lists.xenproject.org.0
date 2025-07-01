Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 186C1AEF5A5
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029506.1403258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYby-0001s2-Hr; Tue, 01 Jul 2025 10:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029506.1403258; Tue, 01 Jul 2025 10:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYby-0001qb-F6; Tue, 01 Jul 2025 10:53:14 +0000
Received: by outflank-mailman (input) for mailman id 1029506;
 Tue, 01 Jul 2025 10:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qecy=ZO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWYbw-0001qV-Nj
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:53:12 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 944bfb02-5669-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:53:11 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6f2c6715fso3381307f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 03:53:11 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5966csm12998656f8f.72.2025.07.01.03.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:53:09 -0700 (PDT)
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
X-Inumbo-ID: 944bfb02-5669-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751367190; x=1751971990; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1w1H6A+nFadj8mfh9xoznsxJx2i1vOMJyUaq6M/mVo=;
        b=bfdQ9qXBzgJhRdZls7YKxkQGDGXUrLZrvVcDNQ/DUifE7Bminceoau3r1200japZB9
         V0CGVIU1tZT3/mKxP8soGpiHG61TaE3oHKP1FW9GeBOL5ppC74u0kaJZR/QYtaYARl6U
         Na4iXGlXa++GfU96XIaOBHlhjvoQIYyp0oba0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367190; x=1751971990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1w1H6A+nFadj8mfh9xoznsxJx2i1vOMJyUaq6M/mVo=;
        b=cZe85bsfeUrPKwg5pMzZzY1sXDRMXfj0SXr2qa8vDLqNYRFBbp5tfklBD5Mln3Mali
         qwEClPf2LmZrSnXkQ3/qZuP4KAxSzlfuE2J/HQAdNzdsWRSXort3iX+tVlxRQKv+F4UA
         04YlqZXhueHfRc6VX5oyZQAolaksQRt2uoAeTDNmoGJnjHxouJPsLw6fLTNdDU+kFh5M
         rXrFkEWfOPNujjvTCTyEFtn4uj8BcLtoVS7SjTE6x20TSjc45+vTnT3whQCtP7X/ljtd
         a0R+c7j+pUTsIlSsnlrfCR5g2MeDkKjHSq+EA8dQV8FBfN7RmW7JSlzxk6MLPxThpW/C
         uwEw==
X-Gm-Message-State: AOJu0Yzhv83jjfRQnNO5knOauomJC8fuVP1ShR3Y1cTFjTC6yTdOKhY5
	Q0UBxM8xlzWtSK4xCnWPhibHDLAVLDTiYb7+oaBWghH1bygPFGLuhLG0muncPjBNM/OViq/Yt5v
	SNLyoa7TbRA==
X-Gm-Gg: ASbGncvPYkkmhK4lWFi6zXPW24ictq7kf+0yVcbd1dnM2xXBXL8aHCSdVPVavzvIjr4
	L8qQ//ty5vLEL1ySN91VnAc0oPzLlBlSonWTURbkz9p6QFbi2Z1gM9kveuAV+g6Mrr+qtEboLf+
	MId2/9IaMl2pxqZnV+1ECfkDk7lDnlby8oD1WXXg7fHiZ/KjfxSia1vMPNV985AhyM8RaweQCPn
	w38zF6ZxqvSkLhgv7aNRvT+r7xxVZzylx5i/YDQzYRANZ0Fo/NuMBa78SMuPmln9yudQWvwM26k
	vpqoEAjgf7lt519j02vB5Xcfg4LGh0QZkelT67ZtxE5TMjpfDn0i1APf7q4ckRhwS/ClCJuyd8n
	koccZpQlfHLpSF5jaDABvqje8HG3k986xhDQUtt/4Ht48QA==
X-Google-Smtp-Source: AGHT+IE0UyPeQJViINAax+/I+xUXkpZkZwTJPUXcMqUhnqRv4vWhf1cmdF2GiIBbYH4x+uak7sKldw==
X-Received: by 2002:a5d:51d0:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a8fe5b3312mr12926936f8f.45.1751367190134;
        Tue, 01 Jul 2025 03:53:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Fix handling of leaf 0x80000021
Date: Tue,  1 Jul 2025 11:53:07 +0100
Message-Id: <20250701105307.705964-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When support was originally introduced, ebx, ecx and edx were reserved and
should have been zeroed in recalculate_misc() to avoid leaking into guests.

Since then, fields have been added into ebx.  Guests can't load microcode, so
shouldn't see ucode_size, and while in principle we do want to support larger
RAP sizes in guests, virtualising this for guests depends on AMD procuding any
official documentation for ERAPS, which is long overdue and with no ETA.

This patch will cause a difference in guests on Zen5 CPUs, but as the main
ERAPS feature is hidden, guests should be ignoring the rap_size field too.

Fixes: e9b4fe263649 ("x86/cpuid: support LFENCE always serialising CPUID bit")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu-policy.c            | 3 +++
 xen/include/xen/lib/x86/cpu-policy.h | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 518f9c9e5409..c3aaac861d15 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -329,6 +329,9 @@ static void recalculate_misc(struct cpu_policy *p)
         p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
         p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
         p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
+        p->extd.raw[0x21].b = 0;
+        p->extd.raw[0x21].c = 0;
+        p->extd.raw[0x21].d = 0;
         break;
     }
 }
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f43e1a3b21e9..aeaa16bbc732 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -325,7 +325,10 @@ struct cpu_policy
                 uint32_t e21a;
                 struct { DECL_BITFIELD(e21a); };
             };
-            uint32_t /* b */:32, /* c */:32, /* d */:32;
+            uint32_t ucode_size:12, /* Units of 16 bytes */
+                     rap_size:8,    /* Units of 8 entries */
+                     :12;
+            uint32_t /* c */:32, /* d */:32;
         };
     } extd;
 
-- 
2.39.5


