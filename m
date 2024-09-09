Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F019714E1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794153.1202880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbJf-0000yC-2k; Mon, 09 Sep 2024 10:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794153.1202880; Mon, 09 Sep 2024 10:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbJe-0000vx-Vg; Mon, 09 Sep 2024 10:08:14 +0000
Received: by outflank-mailman (input) for mailman id 794153;
 Mon, 09 Sep 2024 10:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dA/l=QH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1snbJd-0000vm-BD
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:08:13 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1386bc-6e93-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 12:08:12 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so609354566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:08:12 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25952671sm318275866b.68.2024.09.09.03.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 03:08:11 -0700 (PDT)
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
X-Inumbo-ID: 6c1386bc-6e93-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725876492; x=1726481292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RNcIa4VUmuHv5b9/ojt3TkdG+ztZJJY4b/TwuAYnfg=;
        b=PAkQeGpXoe5STMS7lrNVFU+uo87YtJ+XS8vqoov/3aPDr/b7JPgcgs6tl8a8nvfQL2
         S8hlF0FLVbFC0Lv5U037fVmZPpezqIPHewQeB0hwXu/DtgRBrSb5w6lxi855F7h/HpoC
         Sq0sA6oBFGKZ1w0J4J7OaanOON9+DL6japCPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725876492; x=1726481292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RNcIa4VUmuHv5b9/ojt3TkdG+ztZJJY4b/TwuAYnfg=;
        b=SWHU1EzD5Vs400m9DmSNIAwKYzAsmBlSrw5Relkgwr76d4icvewuHIRYKRj/7/7XUw
         0gj7HE0DE9WWrnHEGKcvFu+dMNj3fNnq5PdV9IXHC2CLMeNqdUts2KhLP3fuZcQQrjTa
         eVbQyPxK/A3FQBEP4voa500/9xLmLEVgDvlQcKxBpZZzy59UFiJWcAqVzFx057N5IISV
         +5sRlSjWFJnnsrr5TDwe7FBanlJ/fhzUig1Ta6qADSfKXbPDasxBcdvBO46IkIqECel9
         pRkoDERbq7m8y7uekoFPIfGQAZyr90xIi3sUqhl0IsaSa0UzM7RWTN/PNU3PNHrA4/xA
         bC2w==
X-Gm-Message-State: AOJu0Yw+qTbZkwRqX/RUECBJ5XOU0hynljqmkfZXitDaR1PlVKy0Rd/Z
	ikN+DK3d6zhlGHw5YvAEaZ8hS/3Hjc9faqBFP0/V4VCKKnlvPDCH4CIG6KZ3h+iaLQO5Ws7xPLL
	2
X-Google-Smtp-Source: AGHT+IEbADYzy/dqMLQej1sRHAfZaCIOePLbr63zo+rRjh2SjKdY5fYG6kdL0tv0ifDa4eb/re0eIw==
X-Received: by 2002:a17:907:6e8f:b0:a8a:8dd3:f135 with SMTP id a640c23a62f3a-a8a8dd3ffd8mr1036797866b.14.1725876491612;
        Mon, 09 Sep 2024 03:08:11 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] mm: Reuse PRI_gfn macro instead of manual specify the format
Date: Mon,  9 Sep 2024 11:08:06 +0100
Message-Id: <20240909100806.47280-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909100806.47280-1-frediano.ziglio@cloud.com>
References: <20240909100806.47280-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macros are defined to avoid type mismatch in format strings
but also to unify format amongst code.
In the meantime expands to 9 hexadecimal digits.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/grant_table.c   | 6 +++---
 xen/include/xen/mm-frame.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab36f45ded..775cd7e065 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1848,7 +1848,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
             if ( rc )
             {
                 gprintk(XENLOG_ERR,
-                        "Could not remove status frame %u (GFN %#lx) from P2M\n",
+                        "Could not remove status frame %u (GFN %"PRI_gfn") from P2M\n",
                         i, gfn_x(gfn));
                 domain_crash(d);
                 return rc;
@@ -1863,7 +1863,7 @@ gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
             if ( paging_mode_translate(d) )
             {
                 gprintk(XENLOG_ERR,
-                        "Wrong page state %#lx of status frame %u (GFN %#lx)\n",
+                        "Wrong page state %#lx of status frame %u (GFN %"PRI_gfn")\n",
                         pg->count_info, i, gfn_x(gfn));
                 domain_crash(d);
             }
@@ -3981,7 +3981,7 @@ void grant_table_warn_active_grants(struct domain *d)
         if ( nr_active <= WARN_GRANT_MAX )
             printk(XENLOG_G_DEBUG "d%d has active grant %x ("
 #ifndef NDEBUG
-                   "GFN %lx, "
+                   "GFN %"PRI_gfn", "
 #endif
                    "MFN: %#"PRI_mfn")\n",
                    d->domain_id, ref,
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index d973aec901..6f9fcc2a6a 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -5,7 +5,7 @@
 #include <xen/typesafe.h>
 
 TYPE_SAFE(unsigned long, mfn);
-#define PRI_mfn          "05lx"
+#define PRI_mfn          "09lx"
 #define INVALID_MFN_RAW  (~0UL)
 #define INVALID_MFN      _mfn(INVALID_MFN_RAW)
 /*
@@ -41,7 +41,7 @@ static inline bool mfn_eq(mfn_t x, mfn_t y)
 }
 
 TYPE_SAFE(unsigned long, gfn);
-#define PRI_gfn          "05lx"
+#define PRI_gfn          "09lx"
 #define INVALID_GFN_RAW  (~0UL)
 #define INVALID_GFN      _gfn(INVALID_GFN_RAW)
 /*
-- 
2.34.1


