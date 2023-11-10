Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BF7E7DC7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630611.983652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPJ-00065X-JY; Fri, 10 Nov 2023 16:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630611.983652; Fri, 10 Nov 2023 16:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPJ-00063B-FO; Fri, 10 Nov 2023 16:30:57 +0000
Received: by outflank-mailman (input) for mailman id 630611;
 Fri, 10 Nov 2023 16:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPI-0005Bj-DK
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:56 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8513676c-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:30:54 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9e61e969b1aso139697566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:54 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:53 -0800 (PST)
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
X-Inumbo-ID: 8513676c-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633854; x=1700238654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3O1Y0n3q5RJstFX0Kyg3z3bQs0fhLQ5wf5VwzlPI2E=;
        b=FReMGtRldl4++7r5qJBcVDpR8rlfzRffTR2Qrusg31oHYt7UKZoXe+bwhkI4A15oQ4
         d8hAuthlEBw3RZzadEYEOb1pVpSpmgcYO5FcT3QEDkLcDqMXLxoY5PudIof/j2XXd0Fp
         RBtxUMfNotKfSPmHJvgGGudGjmaX4J+E7/5SXBGqPciy3NLFeiHvWaO0NjtL7n0lGHzm
         Fg8aCcKa50glwZS5si+PGHIIPJeWtNToWgCgpR5FpP3v4EK1f1bahpkTaPKER0h1KtMC
         2ZX6aTxyWCp4wDvLI5azB87PFr3UuoL72Qz/oMUlJa7ioz4tNITW4CIZFKvwJORZzT4Q
         uEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633854; x=1700238654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3O1Y0n3q5RJstFX0Kyg3z3bQs0fhLQ5wf5VwzlPI2E=;
        b=c6BUU4OeksaixJmuG4ee0qLG48Y7iBdmTGKf54lvyRhmu4qLGcyyKQiYNnSDEGgpvn
         HYi9SNqTLpOhDptLu87qS9d62aU8JiFXfH02nxDX3tdiatLJDu9VY+Z3zIYzZwFt4Ys0
         9mku0qOZXcDOqeUfGeZvH7FW8q0MCklgBSHgT6Sy3CDlMIbZG9ZN0Zo6VDy+F7DITrS6
         BFlm8BLxE1nnXdr9+GXGFtiWaSoB7kPN29G7IsMHLQE1jX9swpxYr9iNA7fXLCBqx7pE
         HDl9GbIEDC3QZmCZNqMKnL9khzdZq9f7ewuwn9G1WSGwE9qjIhDYAQBWZRQnhFejNnc1
         uOyg==
X-Gm-Message-State: AOJu0YxlDB6f0Hz5bAZz4oUpcOT6j/4ZNA0BAupnL9nFsj6fU+fYYUXR
	kpY+ZlVsedNl6/u8SCZ6atmvt6VK/z8=
X-Google-Smtp-Source: AGHT+IEiPYbRZhrTqpKWt7zqu4+Eg1sdWzcY9qVAqSFBpy7231QJUol8hazCDydLNbYHGIUtODK+Rg==
X-Received: by 2002:a17:907:787:b0:9d2:20ee:b1c7 with SMTP id xd7-20020a170907078700b009d220eeb1c7mr7475614ejb.45.1699633853938;
        Fri, 10 Nov 2023 08:30:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 03/15] xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
Date: Fri, 10 Nov 2023 18:30:29 +0200
Message-ID: <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ifdefing inclusion of <asm/grant_table.h> allows to avoid
generation of empty <asm/grant_table.h> for cases when
CONFIG_GRANT_TABLE is not enabled.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- ifdef inclusion of asm/grant_table.h in xen/grant_table.h to avoid
	  generation of empty headers for PPC and RISC-V archs.
	- update commit message
	- add Suggested-by: Jan Beulich <jbeulich@suse.com>
	- Remove provided before asm-generic/grant_table.h header.
---
 xen/include/xen/grant_table.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 85fe6b7b5e..50edfecfb6 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -26,7 +26,10 @@
 #include <xen/mm-frame.h>
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
+
+#ifdef CONFIG_GRANT_TABLE
 #include <asm/grant_table.h>
+#endif
 
 struct grant_table;
 
-- 
2.41.0


