Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D5912E6B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745529.1152675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjU-00072X-Ed; Fri, 21 Jun 2024 20:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745529.1152675; Fri, 21 Jun 2024 20:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjU-00070z-Ar; Fri, 21 Jun 2024 20:19:40 +0000
Received: by outflank-mailman (input) for mailman id 745529;
 Fri, 21 Jun 2024 20:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKkjT-0006yu-6N
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:19:39 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94d86186-300b-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 22:19:37 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso406204066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:19:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b3a6sm116947466b.87.2024.06.21.13.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:19:35 -0700 (PDT)
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
X-Inumbo-ID: 94d86186-300b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719001176; x=1719605976; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV7iG0JHbiQKpGiAlNdsXIwsz8t+op8HRsdtCo6zs64=;
        b=n4z2koQY/lUEfS240opAUupVbuf0GvU9G4mPSILtadaCO15e8+tHcWdd4yMs+v/KdV
         jaZ3ZTkxM60l/OWUN3IAV6Ron70iZNXV8a+4T3WvzI9Lqh9tQ9cbacaiHXfGdGyN6lHt
         KZ2VZdrCXVs9oskNvNgWEoeggxJdl4NtpMJkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719001176; x=1719605976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV7iG0JHbiQKpGiAlNdsXIwsz8t+op8HRsdtCo6zs64=;
        b=oIE50orPIJCfMGsv5bwQI6Z55D7IdyeZz6Zl7dmI0LsPu3UFB/BFYKvjwrh8wdG3P4
         pYn1HlnL4FJOjv44ZgPFReAyHdLPe7RuZI/xsdnVavcSCEQdINAuS+ToblQjysGaT4um
         UuhjV1sOcbuqKCbM691KatJm0qdyhytvqQQ+DcQMFMs9qMFQQJN40gD+PLVgZEjzHxMh
         jN9CtvTrGiXh48Il76pWt22T8n6ifDbVtAfAf9B5GuXWc6DtZUjYiZ+wR9Z/WtHaSfjs
         6SJVXodMuqipPPcOhgG8QsiZNW9ygkOsYe4r7ugf9faq3ua3HMl6TTXetoYvanWTmzkj
         H3mQ==
X-Gm-Message-State: AOJu0Yx6LDF9PpD436ctkHYZdwv3ZXnWsWLtLl08ATtRuWPSEH4EusBb
	0aEo2TluWAoIyWbnpJPOSF/juPdnh2flRK2zbPP4dfrtS4cTpH6ZhXt9lQtEJscCyvx7uzXeOK9
	I2IQ=
X-Google-Smtp-Source: AGHT+IGytrhx91F2VJ70pYTG41PiGH7Wi/FvG9spB2y/Uwfh/Ho0jTBon70fBzgHfEja7cjN3qj3kw==
X-Received: by 2002:a17:907:9409:b0:a6f:46f1:5434 with SMTP id a640c23a62f3a-a6fdb65d7famr72013866b.6.1719001176238;
        Fri, 21 Jun 2024 13:19:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/3] xen/ppc: Adjust ppc64_defconfig
Date: Fri, 21 Jun 2024 21:19:27 +0100
Message-Id: <20240621201928.319293-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621201928.319293-1-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of CONFIG_SCHED_*, and CONFIG_HYPFS build fine.

Add a stub for share_xen_page_with_guest(), which is all that is necessary to
make CONFIG_TRACEBUFFER build.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342672505

This is in aid of getting wider compiler coverage with the subseqeuent patch
---
 xen/arch/ppc/configs/ppc64_defconfig | 6 ------
 xen/arch/ppc/stubs.c                 | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/ppc64_defconfig
index 48a053237afd..4924d881a27c 100644
--- a/xen/arch/ppc/configs/ppc64_defconfig
+++ b/xen/arch/ppc/configs/ppc64_defconfig
@@ -1,9 +1,3 @@
-# CONFIG_SCHED_CREDIT is not set
-# CONFIG_SCHED_RTDS is not set
-# CONFIG_SCHED_NULL is not set
-# CONFIG_SCHED_ARINC653 is not set
-# CONFIG_TRACEBUFFER is not set
-# CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
 # CONFIG_MEM_ACCESS is not set
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 923f0e7b2095..a10691165b1b 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -333,3 +333,9 @@ void udelay(unsigned long usecs)
 {
     BUG_ON("unimplemented");
 }
+
+void share_xen_page_with_guest(struct page_info *page, struct domain *d,
+                               enum XENSHARE_flags flags)
+{
+    BUG_ON("unimplemented");
+}
-- 
2.39.2


