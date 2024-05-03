Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323D68C1414
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 19:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719345.1122098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57ac-00006d-CM; Thu, 09 May 2024 17:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719345.1122098; Thu, 09 May 2024 17:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s57ac-0008WT-9B; Thu, 09 May 2024 17:29:54 +0000
Received: by outflank-mailman (input) for mailman id 719345;
 Thu, 09 May 2024 17:29:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLvV=MM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s57aa-0008WC-Rl
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 17:29:52 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd582202-0e29-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 19:29:50 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51fa75d54a4so1073217e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 10:29:50 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d3445sm369206e87.176.2024.05.09.10.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 10:29:48 -0700 (PDT)
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
X-Inumbo-ID: bd582202-0e29-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715275790; x=1715880590; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=aQPuzg28DBNabnU97KSBvxy03U0QOnNHPs9bhMEg2LFL8rJPouWJh6MAzqyKrOp9Lf
         GrTp+x9/GXvS64i31INkqD0VZlzgAIQwhe6PFIhI+me2XDBuY+OhsYGeUkIRTtSm7Wp5
         lY8klhHUDcgKguAnAEVqRsX4ql28WBaV+RBBpwZSNo/ZThHxTzajDgnSYHeRP/xmZSoA
         7HpBEEwTPk/uAQ6+CRZnxw+bv9+1CQr9cu/BHLHX650ZDSAARYSY476MT9+H4x2K6W/X
         8M6BmDuLwLRGcWavejxeK4uCrolFD512rCinkyKaW0tCukFKhOkO7vCZkJHaR7TJ3hCu
         1qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715275790; x=1715880590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suqLmt7AH8VX+OrzngkGIik/kesngvj14F2vCYL7OFM=;
        b=lMSWSLQDsZfoDjB49splZp0NBvGMKit9cl3qq2UFV6ikLit41LPJR0Gpph7qKhaLfO
         06Dm4BDKPsxo8aXE1o9SKE7TT3skYVpR8jgxPr3udyto9m2hDUSeIgFb3va1WSGccz+9
         rzA3TX5aXnNMcMUTFynAvP+iiaQaLEiChOYhsokuhhtkAYuCQev2tHy32wDx38E4vvFH
         /n0qq0RJn2rs+4YAb468vfoPLfiBCtFlsh030FPvttqnjWAy+0xi66/56LLB58xRWHFu
         FMdJKjsX7HKScStaEKw4iBKTOj0ixfBzo3UBFjQ89v3hulbfh8ucu2WThzUuglm8nWdf
         uglw==
X-Forwarded-Encrypted: i=1; AJvYcCX05g2umvrbV3n8QEfHLA+McmTfGPwXzgkHEtZk37AipmeefB9OXiec5bR78xU5DQZWGlCSyLfy9mk7fDPeDc3jAVrmm00WMHGwAJeQvhc=
X-Gm-Message-State: AOJu0YxK+fdHAtMTwOUpswQLocbnq/I42955vMrDuOvqsWzmNgNDQJK5
	y2jbtBA45THYCQMxQReMwAxHev+SfcJlJu3rU4eBz2FlZDq5l/Bq
X-Google-Smtp-Source: AGHT+IE3429+Ctid+D4EtDpgneRZV++HVd+uIfkCNO9kCmImtP+ysIxcQpHU7yrc/kJeI1cp4rrEpg==
X-Received: by 2002:a05:6512:4027:b0:51d:866d:8cf2 with SMTP id 2adb3069b0e04-5220e27a334mr125318e87.6.1715275790078;
        Thu, 09 May 2024 10:29:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 2/8] xen: mapcache: Unmap first entries in buckets
Date: Fri,  3 May 2024 03:44:43 +0200
Message-Id: <20240503014449.1046238-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

When invalidating memory ranges, if we happen to hit the first
entry in a bucket we were never unmapping it. This was harmless
for foreign mappings but now that we're looking to reuse the
mapcache for transient grant mappings, we must unmap entries
when invalidated.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index bc860f4373..ec95445696 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -491,18 +491,23 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
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
+
     g_free(entry->valid_mapping);
-    g_free(entry);
+    if (pentry) {
+        pentry->next = entry->next;
+        g_free(entry);
+    } else {
+        memset(entry, 0, sizeof *entry);
+    }
 }
 
 typedef struct XenMapCacheData {
-- 
2.40.1


