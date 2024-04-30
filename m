Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC81C8B7D9B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715060.1116587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgc-0006VJ-Uc; Tue, 30 Apr 2024 16:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715060.1116587; Tue, 30 Apr 2024 16:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qgc-0006Sw-PM; Tue, 30 Apr 2024 16:50:34 +0000
Received: by outflank-mailman (input) for mailman id 715060;
 Tue, 30 Apr 2024 16:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/Z8=MD=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s1qga-0003oO-HV
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:50:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1d82d28-0711-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 18:50:32 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51e75e7a276so742549e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:50:32 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056512360d00b0051ad4552454sm3943178lfs.148.2024.04.30.09.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:50:30 -0700 (PDT)
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
X-Inumbo-ID: c1d82d28-0711-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714495831; x=1715100631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU40+YVWxkJADy+Z4l2CwzlxvDSuLGvZgzgju3wrOiw=;
        b=g1BNyP8zbtW4VjqKQWjhlbRFloMwYhZZpHk75tSbpABpR+XMihQ3sQHthIOThNUKj+
         Gzo/uaiBZDUe+r02UmqpIuqVb2QqrlhUMqU4W8SUNQc5KhPmBLasgbR3zsPe51/yfeJ9
         QI7g7gzNFb1QEgQWX1ZMzxDwX8gDlY6fooRlM/+2Kg71oS3pPUBfxcDqi4YSbyWAoEtO
         AS3NYzEV/VMDpDECgxEdofyVaQodeDDe96jmN6iZLVctSTGZMLEjtq03WoYDUFUZ90eD
         fcyJ2pR46p8KSOSi3B6vW2mZPBUl9OkcXzPKAQhMnmzZrAoP82SDjsAGgTnSjpdBkdne
         LWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714495831; x=1715100631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU40+YVWxkJADy+Z4l2CwzlxvDSuLGvZgzgju3wrOiw=;
        b=dLALQPZQF4kX99rZzH8O3QbMHHh6U40Qsvo7YUWUhEHYV8E0LmndIapwGh69VK2xax
         eT9dNYX3MtBR1YnI+p6BVvN/gMbjUZ/Yj0Pb03Q0gAPEfvMh/BKoqWPmYqaCOL+OFYIH
         wsy2CIoa/JQOq6OSt2SjGizk9m0npmKrKbtYwrCA90QHV+4iH3H4x5PjRG4u1PPbxL2O
         cwCZQf++7+QEKU9i3HiLoBYE3gjyZhwS2W6I2z8zZKIM61ahj/sKllXUgf5H+MZEJBWE
         RuAAockd7V3vCIrNsKNMOXWXHGADbnlhhEULI/0jJ14B+qGqVjJJcUdBGarfvFZZi/Ow
         okow==
X-Forwarded-Encrypted: i=1; AJvYcCW7OuotFrzUMEykrw9+1UskRhqn3qm4/yDNydvcWxbfwwn8j777dJPyP4sLENwG01R1IF7xCq2mjbtNiicDJRO4WS1V+9Ed4lHVLSpEjTA=
X-Gm-Message-State: AOJu0Yz+hpj5rD2CSdaql1kWYMB/dXLLieQm2d0wk/lKosKc+S6ShMd3
	moD/FKlan0k5WOcR7kPxGMYWTOq2CNJXobcO6THCk9IJ4Lrg83W5
X-Google-Smtp-Source: AGHT+IF7NEHMVH11qhcbPGrROL4h9vPrTZ7L+HcLgKWakMJjuqsmWO3glx5CsV2GXCvTV6HEwqtzvg==
X-Received: by 2002:ac2:4984:0:b0:51c:c1a3:a4f9 with SMTP id f4-20020ac24984000000b0051cc1a3a4f9mr13762lfl.64.1714495831228;
        Tue, 30 Apr 2024 09:50:31 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 12/17] xen: mapcache: Unmap first entries in buckets
Date: Tue, 30 Apr 2024 18:49:34 +0200
Message-Id: <20240430164939.925307-13-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240430164939.925307-1-edgar.iglesias@gmail.com>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

When invalidating memory ranges, if we happen to hit the first
entry in a bucket we were never unmapping it. This was harmless
for foreign mappings but now that we're looking to reuse the
mapcache for transient grant mappings, we must unmap entries
when invalidated.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 4f98d284dd..0365311788 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -486,18 +486,22 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
         return;
     }
     entry->lock--;
-    if (entry->lock > 0 || pentry == NULL) {
+    if (entry->lock > 0) {
         return;
     }
 
-    pentry->next = entry->next;
     ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size);
     if (munmap(entry->vaddr_base, entry->size) != 0) {
         perror("unmap fails");
         exit(-1);
     }
-    g_free(entry->valid_mapping);
-    g_free(entry);
+    if (pentry) {
+        pentry->next = entry->next;
+        g_free(entry->valid_mapping);
+        g_free(entry);
+    } else {
+        memset(entry, 0, sizeof *entry);
+    }
 }
 
 typedef struct XenMapCacheData {
-- 
2.40.1


