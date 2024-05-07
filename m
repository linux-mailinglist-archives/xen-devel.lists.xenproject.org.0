Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC518BE104
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 13:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718019.1120516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4J1G-0006uN-8w; Tue, 07 May 2024 11:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718019.1120516; Tue, 07 May 2024 11:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4J1G-0006qt-64; Tue, 07 May 2024 11:30:02 +0000
Received: by outflank-mailman (input) for mailman id 718019;
 Tue, 07 May 2024 11:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4J1F-0006i8-O5
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 11:30:01 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2380978a-0c65-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 13:30:00 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso611372566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 04:30:00 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bf14-20020a170907098e00b00a59c3e28917sm2963527ejc.70.2024.05.07.04.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 04:29:58 -0700 (PDT)
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
X-Inumbo-ID: 2380978a-0c65-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715081399; x=1715686199; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUxoYmJy59sYBP/lL0GePoG6vQYveONH9tj5bH4Vfzc=;
        b=BC4CJtqXejJUGCAgslmeFMg0wTxJksdjPtpOl+N6UC3S51uoHv4NvesOGY3fkTkAjO
         1i3LujELi9zRMqXzP1V/S9lfSFLTdLE71mx+ERMAIYJc/LMbRczbqEA1KWDnx+D5W3KL
         VjBeO1vt2PdsN+iFKsQugtm08Oefm4F80pHmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715081399; x=1715686199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUxoYmJy59sYBP/lL0GePoG6vQYveONH9tj5bH4Vfzc=;
        b=JLDuk9hLv9MblirSI+YTKTj7Wt7mOb0UUhRMhwUV/CLJvLnAeEZYLi7TKYIYl4iERh
         Qne16Ik3rI3u63Min0WJkaq9iITPUv7MVugk3/hMXF+m85V2kA1TeEU60beoJdAtdRsK
         aqadg5gj2Em3RGsyWPj+HuMUfj3k2X0DsVlbyzNAiO/ju9i6suxW8w7qGkoTFg+fT7hK
         vLxK23Lhi8u4vZ177/WZhl/t1IvunnZ3k9ixOONkLOpvc60LIELVM+v1dyvtJGPhJwCy
         Uadhf1Vw0lRfSLBEE1xmruICXCVuW7N9M3qYKpIyAjYTFJW1n/7ubz5kR7Kh0Qfs7TLt
         He2w==
X-Gm-Message-State: AOJu0YyF4BMt/8DfI/imzky+Yazq18MtGFeRCG9TQ8NqYEKCqvlAuzY/
	7MwRKcf2UeZv7fMcVRL3bQ+Na92Icd+xMUo7JPPtk9EZ+A+y6rCBvct85IW91DVn/xDgHTmDEhR
	V
X-Google-Smtp-Source: AGHT+IEbS1utK86wR8VYYWGam4Ib5kTVH82qOPukxrTfu+ou1gmt1UdnSSShFNEnjMrzLC3EukyocA==
X-Received: by 2002:a17:907:938a:b0:a59:9b52:cfc4 with SMTP id cm10-20020a170907938a00b00a599b52cfc4mr6520827ejc.44.1715081399207;
        Tue, 07 May 2024 04:29:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpu-policy: Fix migration from Ice Lake to Cascade Lake
Date: Tue,  7 May 2024 12:29:57 +0100
Message-Id: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ever since Xen 4.14, there has been a latent bug with migration.

While some toolstacks can level the features properly, they don't shink
feat.max_subleaf when all features have been dropped.  This is because
we *still* have not completed the toolstack side work for full CPU Policy
objects.

As a consequence, even when properly feature levelled, VMs can't migrate
"backwards" across hardware which reduces feat.max_subleaf.  One such example
is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).

Extend the host policy's feat.max_subleaf to the hightest number Xen knows
about, similarly to how we extend extd.max_leaf for LFENCE_DISPATCH.  This
will allow VMs with a higher feat.max_subleaf than strictly necessary to
migrate in.

Eventually we'll manage to teach the toolstack how to avoid creating such VMs
in the first place, but there's still more work to do there.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu-policy.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d96276399..a216fc8b886f 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -373,8 +373,13 @@ static void __init calculate_host_policy(void)
 
     p->basic.max_leaf =
         min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
-    p->feat.max_subleaf =
-        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
+
+    /*
+     * p->feat is "just" featureset information.  We know about more than may
+     * be present in this hardware.  Also, VMs may have a higher max_subleaf
+     * than strictly necessary, and we can accept those too.
+     */
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
 
     max_extd_leaf = p->extd.max_leaf;
 

base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
-- 
2.30.2


