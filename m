Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E399C63CB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 22:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834986.1250813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAync-0002TM-8n; Tue, 12 Nov 2024 21:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834986.1250813; Tue, 12 Nov 2024 21:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAync-0002Qf-67; Tue, 12 Nov 2024 21:51:48 +0000
Received: by outflank-mailman (input) for mailman id 834986;
 Tue, 12 Nov 2024 21:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAyna-0002QZ-Rg
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 21:51:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb7ad05-a140-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 22:51:41 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53da061c488so95758e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 13:51:41 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2eb28sm767459366b.197.2024.11.12.13.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 13:51:34 -0800 (PST)
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
X-Inumbo-ID: 4cb7ad05-a140-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRjYjdhZDA1LWExNDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDQ4MzAxLjA1MTA5Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731448295; x=1732053095; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srG+OAIFyZxWlC/7KQkToiWJ7QuJWId8xByLJJCBHPk=;
        b=DWLGkQP87dkrdAPJzwM4RrlFQZ2TsucJ1kyRVqPQ8xy9DNxtB5TwDmSbrbygT3l6d1
         AND8OzN/eYZGdd+kpXIi29JHu3TKQkpCDE5D1v2XlqAq0HQ0lMUR+YVPadsdXtgDcZwp
         yt+De1rP2Z4tIQHGJgvjOaylbDkfmzOL7m2OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731448295; x=1732053095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srG+OAIFyZxWlC/7KQkToiWJ7QuJWId8xByLJJCBHPk=;
        b=Xwa2za1M67pzuQoix/jfO4GkM9mU71fxnyBDXWEE5ez2AU7i1f3kxnReNLf1uMrTQH
         oXRg3frzvL/jXuVV7g4JEeahkfEZyuTTJvS+3N1PVhrrxJZeP8rzA4zCAU27Gkr008TP
         cYrZRljpEyVCG8QxnDrkJwjWCgndvduMUM3eaoypKORmdHbyhQbW0WMuBSRzAa6FPQ8x
         9nv/olf2MRk2Nw3a3L2IrsiVw/pxIj0egjKQBUP7Kr8nQMIBtHJVeTjHL8pCJXd8GAFh
         ts6+e07ylN8NvvuQ98+b8i027FDP6GR+wcO/dlDe2gYIDXU5V47SFKyOgekhbcHlYgbo
         RW8w==
X-Gm-Message-State: AOJu0YyGv3mhfejfxPSjND2q9bskxashzPhNS+GDcyIdQ45LcLGGutKH
	dMbLK5JolFZXv9zJQGX3sVmc3YgjpXXMnVzhqmcyFoMOQR6/Yn8OZaJkAFDSCm7iS/w+49KedWy
	9
X-Google-Smtp-Source: AGHT+IFdDykA2K16EGhO51GcO8LpTbKvJzfMxrcS3IW5w9rJqt75gKs00dVtgOkIFZ0PE26JiL/1Zw==
X-Received: by 2002:a05:6512:3087:b0:539:fc45:a292 with SMTP id 2adb3069b0e04-53d9fed1070mr258562e87.43.1731448295394;
        Tue, 12 Nov 2024 13:51:35 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] x86/apic: Include genapic.h in delivery.c
Date: Tue, 12 Nov 2024 21:51:32 +0000
Message-Id: <20241112215132.1482848-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This resolves 4 Misra violations of Rule 8.4 caused by the function
definitions not being able to see their declarations.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
---
 xen/arch/x86/genapic/delivery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index 7bb7bd658650..15100439be05 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -3,8 +3,9 @@
 
 #include <asm/apic.h>
 #include <asm/current.h>
-#include <asm/smp.h>
+#include <asm/genapic.h>
 #include <asm/hardirq.h>
+#include <asm/smp.h>
 
 /*
  * LOGICAL FLAT DELIVERY MODE (multicast via bitmask to <= 8 logical APIC IDs).

base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
-- 
2.39.5


