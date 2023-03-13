Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4536B7FC2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 18:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509365.784990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbmKJ-00040B-33; Mon, 13 Mar 2023 17:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509365.784990; Mon, 13 Mar 2023 17:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbmKI-0003xb-W3; Mon, 13 Mar 2023 17:51:14 +0000
Received: by outflank-mailman (input) for mailman id 509365;
 Mon, 13 Mar 2023 17:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jvaw=7F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbmKH-0003ea-5b
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 17:51:13 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4876a84-c1c7-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 18:51:12 +0100 (CET)
Received: by mail-qt1-x82f.google.com with SMTP id w23so14083737qtn.6
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 10:51:12 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 b5-20020ac86bc5000000b003b86b99690fsm224850qtt.62.2023.03.13.10.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 10:51:10 -0700 (PDT)
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
X-Inumbo-ID: a4876a84-c1c7-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678729871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBGCSenu5eEuM1JYJpBrFsupffZM3ZgfmT00L5GRa8U=;
        b=AlYG6ZKyfuhuQNddD/CXknNOu7ZFmUwI82p8Ch3XcJiTgp3rS5sGKXXeDbdsmGzPZP
         8BuWVVp821lV8cv3za+HFUQF4li4WiDTdVJzteAF/HnAbZZZ1vKSG73EESj8OZANtMn9
         ZAN3FkckrKPH1LVPy3pN80kpFqJE2jzGORiwgWKLmtEzJrVqrcijkYIsuUikpeB/p84L
         2M9K1C4zasZ3z/NOYvj0U4I+aMT8tdDCzeQ9asVLtSgzN8Th+YoeMyFYWas1ACv9qwjh
         ZVlxlTI5lJ5rgZvATZTVO/ypgGfoQPsi363q7uKqQsqm/WgzfJc9kbJs2Ro6IczhvkTs
         T4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678729871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBGCSenu5eEuM1JYJpBrFsupffZM3ZgfmT00L5GRa8U=;
        b=QvJGsU2+0c8flxYro4ScTuFjqi/zKg7hW44WW+bz2YsfwVL3dmNG8digM6RNaZu2Hp
         rUzby1ys9os6Tja2QVjnTsgwkK5oKPsW0bR8dbjgMEg56J0iAuifG/VuoyCRonY/PlLt
         srdob0a5uw7/Hs4FfQ3YYfYBROhQ8XHrY0E2JZv4v8/zlIS/GsvpmqfwJ4d/MD9WoGgM
         r1zCkD5RG+OnmNtw3HobOTkdEgA+Dtiz1X9+0YLHe88ezlpKzuRN6Q2Xh9EbrbvybRv5
         vXtkbbcvdoeJiqrye5p6LJ54pKasMpjuHge1aprNphU++heCgnTp8qismuXHVUbMcQTK
         cf7g==
X-Gm-Message-State: AO0yUKW+fQqemD9GQD44l4qU4F+1G4v26/GBDMDO6mY02CK1NACp9C8/
	8jGmEEdBj1XXp6Ng+BxP29Yd+So0sv0=
X-Google-Smtp-Source: AK7set+UkQEeOO47apTkclYyfUMVLctKpZt+PT1Wi70g3w94U5OiRbHY2IOfeYUddwcBJP6DDV6oNA==
X-Received: by 2002:a05:622a:15ce:b0:3b8:6442:2575 with SMTP id d14-20020a05622a15ce00b003b864422575mr60438350qty.49.1678729871055;
        Mon, 13 Mar 2023 10:51:11 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/cpufreq: Remove <asm/bug.h>
Date: Mon, 13 Mar 2023 13:51:03 -0400
Message-Id: <20230313175103.20778-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header is unneeded - there are no uses of BUG() or WARN() in these
cpufreq files.  Remove the include.  It is still include transitively
from xen/lib.h.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 1 -
 xen/drivers/cpufreq/cpufreq.c       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index eedc7c737d..56816b1aee 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -35,7 +35,6 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 6b2e81f1b0..9470eb7230 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -39,7 +39,6 @@
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
-#include <asm/bug.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
-- 
2.39.2


