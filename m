Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7C860F76
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 11:36:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684766.1064865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSuJ-00052f-8E; Fri, 23 Feb 2024 10:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684766.1064865; Fri, 23 Feb 2024 10:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdSuJ-000519-5B; Fri, 23 Feb 2024 10:35:55 +0000
Received: by outflank-mailman (input) for mailman id 684766;
 Fri, 23 Feb 2024 10:35:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0yaO=KA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rdSuH-000513-Ru
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 10:35:53 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a41c3c-d237-11ee-8a57-1f161083a0e0;
 Fri, 23 Feb 2024 11:35:53 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3f4464c48dso77615066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 02:35:53 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a3e4efbfdacsm5848002ejc.225.2024.02.23.02.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 02:35:51 -0800 (PST)
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
X-Inumbo-ID: 51a41c3c-d237-11ee-8a57-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708684552; x=1709289352; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwyptn1bE6WztZatqA7hkN5iai3sDIG7sJEM1euaKoI=;
        b=tnyV/xRiZWfo45JcqQVzUWiq/Va86KAZ3kb1nv6X+CLOyekNre0oFZcE+pvjXGxHmH
         NaO+Pp4UXKWozBNOmAtlsE4h0OhfgYbGlK6VEt5HcscXximEq7RsvvnQk1V4FDcDgopH
         ItgLWPW7SS049ZMsdFLGxP9oGFHv0Ps2MT4vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708684552; x=1709289352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwyptn1bE6WztZatqA7hkN5iai3sDIG7sJEM1euaKoI=;
        b=NSaYTcRDVyMllzF5S9ufloBMFLoyER+pQg3lXna1gcUVIjNtEW6Smf6/L8jbzBZXNe
         Ela676/PLAg64T8yfmMHpJCiUIb9fuwu1zRwaa7/sdc4LwGKkGVfPJb8WIPu6SNfYrzI
         8RxycGAa/wZRV333l8yzGxN8mxH+RyIu21I29HJKzDkBwjTIj6bkYKbnt4hoDZUG9l7F
         G5hLPgm/VRZEc9pwcvtl8DCZHPengvi3SacOg/QNdZg7nTOGAIvXCRAxGuPVjAAW9WZ+
         vhr+BiKnp1Y0AryqUY5ZJE8OZpOgYKgMzi99YVaWrawISfQCJV+PI5FO223BYNxU+E7C
         aQ/g==
X-Gm-Message-State: AOJu0YzYDVlQO8W/Rs//bom+BhdakhjrJRmAjYpo3E5gr4oQefnygTRK
	667FPBcvpIMdynE4TLKvM1HB/q8NPSW2I16Sr+ZLPUZdefgRZqWIgnhEQHQbxFL1UhiB4P6JgfQ
	E
X-Google-Smtp-Source: AGHT+IF4cX7OjdPJKpaxLe4BF/4+9ASstV92JjsetBxaxcGs0gSd3EwTstH2z3rTqPJwY4znjcEXUA==
X-Received: by 2002:a17:906:f94b:b0:a3e:980c:699d with SMTP id ld11-20020a170906f94b00b00a3e980c699dmr909759ejb.57.1708684551996;
        Fri, 23 Feb 2024 02:35:51 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH LIVEPATCH] Fix inclusion of new object files
Date: Fri, 23 Feb 2024 10:35:50 +0000
Message-Id: <20240223103550.299992-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, there's a mixup over the xen/ part of the path for new files.

  + NEW_FILES=./arch/x86/lp-hooks.o
  + for i in '$NEW_FILES'
  ++ dirname ./arch/x86/lp-hooks.o
  + mkdir -p output/./arch/x86
  + cp patched/./arch/x86/lp-hooks.o output/./arch/x86/lp-hooks.o
  cp: cannot stat 'patched/./arch/x86/lp-hooks.o': No such file or directory

Alter the `cd` and `find` runes to use paths relative to the root of the
different source trees.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>

I'm unsure whether there's a useful fixes tag to use.  AFAICT it was broken
even when 0564f0c7a57 claimed to have it working.
---
 livepatch-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/livepatch-build b/livepatch-build
index cdb852cc7fea..948b2acfc2f6 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -227,7 +227,7 @@ function create_patch()
         fi
     done
 
-    NEW_FILES=$(comm -23 <(cd patched/xen && find . -type f -name '*.o' | sort) <(cd original/xen && find . -type f -name '*.o' | sort))
+    NEW_FILES=$(comm -23 <(cd patched && find xen/ -type f -name '*.o' | sort) <(cd original && find xen/ -type f -name '*.o' | sort))
     for i in $NEW_FILES; do
         mkdir -p "output/$(dirname "$i")"
         cp "patched/$i" "output/$i"

base-commit: 1b5b03b3ce4187ce99bad580fd0ee36c6337313f
-- 
2.30.2


