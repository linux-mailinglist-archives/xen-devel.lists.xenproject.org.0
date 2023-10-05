Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB2A7B9C0D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 11:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612904.953066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKKV-0000L5-62; Thu, 05 Oct 2023 09:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612904.953066; Thu, 05 Oct 2023 09:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoKKV-0000JB-3O; Thu, 05 Oct 2023 09:07:35 +0000
Received: by outflank-mailman (input) for mailman id 612904;
 Thu, 05 Oct 2023 09:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8SC=FT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qoKKT-0000J5-AZ
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 09:07:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c106b3b-635e-11ee-9b0d-b553b5be7939;
 Thu, 05 Oct 2023 11:07:29 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4065f29e933so6849495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Oct 2023 02:07:29 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b004060f0a0fdbsm3287620wmi.41.2023.10.05.02.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 02:07:28 -0700 (PDT)
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
X-Inumbo-ID: 9c106b3b-635e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696496848; x=1697101648; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zeXhhj7+BOwATaTH2kV62PlQ9YKbOkTF73vUpKofeEI=;
        b=HcBYyCvsom5uGU0VqRcZ5cmuOzYkEuYBn4WuWJrB1AYfXh/dr+8LexXAWR/niAzqfb
         0eQZBzvL0cIYqZAkabDJVuVqSoczcNq/lrRhulA/Da9T+sBBJDV8c/rU8g1BNgrRHMkv
         kWztgjCzmjD1R0ApH6ogqWbYXn9zGxPQKBg4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696496848; x=1697101648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeXhhj7+BOwATaTH2kV62PlQ9YKbOkTF73vUpKofeEI=;
        b=NBPk6MZkLDYD/I+wTsJ6V8b99ddYZJQljBziRFPJsxlPfTPu3eD6euYJeJiWbjyNXy
         Og/JbTXKLB+kRiNsJeEveW/zzqn9ZZjFoVRWmCniSIiOfUB+CZpcs3ncb2KEfQP+oCrb
         39swRcQA3HtuOCbDVnhktricgqY8qopDkXCwPDZkjqjTJ1ydMarVGYzPkWI94FRKkp++
         yzSJaZ9YcIqSM5qD1yr6yy8LGxW4WG3oyjKK96Cs9Ogihl/LS0MSrTT2SgR8pYayZOJ9
         P8PAjPML9zbaDVUWZNmKeOPolZ32JCMs3OvGCcXYsOvR6fizvTOES0kaIGfwyE2lj/4g
         bynQ==
X-Gm-Message-State: AOJu0YycC1ootxTcuFo1Swwq3hUorYxun0J3IGf36BO3iicXLIx3RjBc
	zvqd/H8J1jAe6s7APhdH6sCNkrjeoA1wvRJZn1Y=
X-Google-Smtp-Source: AGHT+IHlFNrFv9A/M3VYKXD5/J3VklfTiB4n0TX1TWvYoV0tc4kfBjgYVlSvMrsc1nW53lflArXcpA==
X-Received: by 2002:a7b:ce98:0:b0:3fc:dd9:91fd with SMTP id q24-20020a7bce98000000b003fc0dd991fdmr4287348wmj.40.1696496848433;
        Thu, 05 Oct 2023 02:07:28 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Bob Eshleman <bobby.eshleman@gmail.com>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] MAINTAINERS: Make Bob Eschleman a reviewer
Date: Thu,  5 Oct 2023 10:07:27 +0100
Message-Id: <20231005090727.19235-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a conversation with Bob Eschleman, it was agreed that
Bobby would prefer to return to being a Reviewer.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
Freeze exception justification: Only documentation change.

CC: Bob Eshleman <bobby.eshleman@gmail.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 22034bf6e3..f61b5a32a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -499,8 +499,8 @@ F:	tools/hotplug/Linux/remus-netbuf-setup
 F:	tools/hotplug/Linux/block-drbd-probe
 
 RISCV
-M:	Bob Eshleman <bobbyeshleman@gmail.com>
 R:	Alistair Francis <alistair.francis@wdc.com>
+R:	Bob Eshleman <bobbyeshleman@gmail.com>
 R:	Connor Davis <connojdavis@gmail.com>
 S:	Supported
 F:	config/riscv64.mk
-- 
2.25.1


