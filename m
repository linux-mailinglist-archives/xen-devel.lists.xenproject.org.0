Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C99F1234
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856973.1269487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Zf-0003T1-04; Fri, 13 Dec 2024 16:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856973.1269487; Fri, 13 Dec 2024 16:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Ze-0003Qz-Td; Fri, 13 Dec 2024 16:31:30 +0000
Received: by outflank-mailman (input) for mailman id 856973;
 Fri, 13 Dec 2024 16:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wt-0003wR-3Y
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:39 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4df80701-b96f-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 17:28:37 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso2885613a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:37 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:36 -0800 (PST)
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
X-Inumbo-ID: 4df80701-b96f-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107317; x=1734712117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlEGxO2IBuQZ7rn+a3lLB8EIrI2UkwRqyEO2+oge/xI=;
        b=rJ/pXLhGDaJHXCtQsZ5yjpakKGHhxj3UhRDxTK4SyMB4UPmYCjMW35/OPxKghVyNOI
         ev9R/O8zPMeZQZt+iv4c3IoikWzEEJ6XK6v/7iFhzAC1OwhVPbDqI25zJf3hmTGYZ/Ph
         kl/qrf81jaryASN84VA6zUvsCN+tX1aRurzRVKH/fd2NkergStbEhJKNRUz9FuMCG9Kf
         yVcqua+aTcDJJzW4/Ru5d8iHo1NowEVgXsBwBsAy8qdvPr9KCHEekV3vMJCP7mYZ9krO
         uRluuOS1WDTZp4C3cpyQSv0LBfvcGbESIkDdPOLyJVIoJaFThfyQ+PX1nROp3/cTRrFJ
         odJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107317; x=1734712117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlEGxO2IBuQZ7rn+a3lLB8EIrI2UkwRqyEO2+oge/xI=;
        b=nH/mFzKmdf//3GmAOzRnDK2eBmkJd30+JUsK63EeoevzYzu0ufGe+sKVr3/1vzX3Do
         gz56Op+vTw/Mepa3CVEbGCTMhWRiLBCbeKlOWIvt7QcuR9fejAzIFzKa03IG5KQVW8DE
         HsbD/hu8gCIHelmjwhmoP4yZO2DoQvDWdTn8MpLwmiIeiXbGf3gUhVcMMsPEPmo/9p9X
         bVMEpfIsFSIhkGUfwWd7l1wQrjVjDGRdZY5diGml+eaHusUIBERVaox6IOo6Y/fX+uHH
         PN2dta7jHJOIrJcPgrdIvqRZdXkdbFcTGuh22SnOKLXEnhf5SJFAxJ4xeYMBgvMbnU43
         cwDQ==
X-Gm-Message-State: AOJu0YxqRH5R3fxwOtA/hEy0aLNVQQjEk0os8siiJL9OaACMnAwQ6Vys
	LRhLb8Cm7XkJs9sI2kracIOMHEarXR13Y2MMWV3ACLly0Rh4GS9TVU+RLlRdNeevy6Y2J6WEBLD
	7gow=
X-Gm-Gg: ASbGnctBngmEFl0f091m1DCL8yIBtrnaYVXj+8L7o2W9QcsO62RE4Z5AbE2PchaCaJr
	1a1g+df7w4fA0YuKLUglwe1QBjCwvPjqQEl970Orx7bpJoyePfIqsDhfq/da9XtcM1EFT3vUz6U
	4RVEE7pcsGnyD+sdI8TlPCpMqUJKwemdFAnENPnBXv+CoZmZi2ZRO+FwGRfVtHlHzzwiZF47j87
	jnZVKRsMT/CZ8pEsRC+h9maplf3tHHj1dJjjXqHYteCAfpAn/cmhyw0wAvPxE6pZKKkmrA809CS
	ZXnwlf1qBLr3mYUc
X-Google-Smtp-Source: AGHT+IGeFQ1uM4ac/bBTdwHITw+kKTkRvy28KpZgFPJ6kT5gLWNwHkwhQik5Tc6gYalTgR4jI4NvLA==
X-Received: by 2002:a17:907:6e91:b0:aa6:af4b:7c91 with SMTP id a640c23a62f3a-aab77ed4383mr382603466b.58.1734107316736;
        Fri, 13 Dec 2024 08:28:36 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 08/12] xen/page_alloc: introduce preserved page flags macro
Date: Fri, 13 Dec 2024 17:28:11 +0100
Message-ID: <20241213162815.9196-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra need to be preserved when assigning a page.
Define a new macro that groups those flags and use it instead of or'ing
every time.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v12:
- fixed wrong patch sent in v11
- added comment on PGC_preserved
v11:
- removed PGC_broken from PGC_preserved
- removed PGC preservation from mark_page_free()
v10:
- fixed commit message
v9:
- add PGC_broken to PGC_preserved
- clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
v8:
- fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
  before freeing
v7:
- PGC_preserved used also in mark_page_free()
v6:
- preserved_flags renamed to PGC_preserved
- PGC_preserved is used only in assign_pages()
v5:
- new patch
---
 xen/common/page_alloc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 55d561e93c..7735c8b436 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -161,6 +161,10 @@
 #endif
 
 #define PGC_no_buddy_merge PGC_static
+/*
+ * Flags that are preserved in assign_pages() (and only there)
+ */
+#define PGC_preserved (PGC_extra | PGC_static)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -2382,7 +2386,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2442,7 +2446,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
-- 
2.43.0


