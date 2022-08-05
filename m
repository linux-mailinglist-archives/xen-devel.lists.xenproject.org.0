Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8730458AAFD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381159.615743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhC-0005hh-3u; Fri, 05 Aug 2022 12:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381159.615743; Fri, 05 Aug 2022 12:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJwhB-0005cZ-VY; Fri, 05 Aug 2022 12:44:53 +0000
Received: by outflank-mailman (input) for mailman id 381159;
 Fri, 05 Aug 2022 12:44:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvBN=YJ=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJwhA-0004qq-HF
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:44:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66048627-14bc-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 14:44:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 v131-20020a1cac89000000b003a4bb3f786bso3944704wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Aug 2022 05:44:51 -0700 (PDT)
Received: from uni.. ([2a02:587:ac1d:6c00:cdd9:ab5d:6d5c:1538])
 by smtp.googlemail.com with ESMTPSA id
 g11-20020a5d698b000000b0021eff2ecb31sm3993185wru.95.2022.08.05.05.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 05:44:50 -0700 (PDT)
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
X-Inumbo-ID: 66048627-14bc-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sFXoKruA65y914muDfqfb3heuhx2eDlNA1LbdaLcdJE=;
        b=lPVT10fSpCIuzfs8LUh1lG9iCx7udlSPhGPgZa03oWZKMQK/r1bZYXcybS8Wkf3sOg
         T/TfOSqnMyv39tnWcfcca0ZxxMzm8i4ZXxfehDsX6dYk9OIxoLP7DSFMJ0rkgrjwwnXZ
         q2X2kkQ2efpG7FBj7NSQpNs5buXz1TMkYdXKiVsDqPGXVK+nZM7Z1OpXCe9Tn7FQXv3X
         i9wc0TIxEJz2tZCk+NhNcF7hl5zVHmbrP3fG3cO8pd0IUGwp5iG+kJd7e8bqtHezxRev
         0iGupSKB6A6pL2dZOIZTNRJMy67X1IGx42gWIY1L6yUBYq29DZHmxCdm6JEtZI2ZAaTt
         tN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sFXoKruA65y914muDfqfb3heuhx2eDlNA1LbdaLcdJE=;
        b=uDxwyg+Ph12ANMzX6nNR9M8Yw9678hIXsSVb+HliBpk0Yh4p0WxqlpHsy+/HzkUs56
         vngCmhzWSL9IdDqDpERgaj8WBGCMmc5xLoEUUax1Aq1QMpRNsLPFycMz4upPo2ohHd+u
         LcfRYUgtZRAhwR+MY5REKphGlBydjbCz695pS6Q33RkcMxwy4JMvwf/fCavfiC20RR3c
         +BGq525XSd7koTU9RxyEbZVc+lTeYsQ2izhZxb7Jgohi9+91Hgo8s7f/RpwpPrDRdlqB
         RFX/PliQIojfZf4ozWw6b1l5xmSxp/I/AwWcGt5R6EJ871z9U4ECi1HbrpFTlFN7OVFx
         Om6A==
X-Gm-Message-State: ACgBeo38+LI++haYE0N7Ttjsg36J13Ka6Worjc9ernYZAINYNU10DW6o
	8LW8ZhEXxumZDKZodD439xyKE78sRZM=
X-Google-Smtp-Source: AA6agR4aM79ulC1RIe13/8lQtz+dLQx8WfHLKipHeO5aB8ysY9YI+nYbW7UsnLsj27HbUtBVQwbGzQ==
X-Received: by 2002:a05:600c:34d6:b0:3a3:31cc:e150 with SMTP id d22-20020a05600c34d600b003a331cce150mr9323512wmq.94.1659703491137;
        Fri, 05 Aug 2022 05:44:51 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] xen/cpu: Undefine MASK_DECLARE_ macros after their usage
Date: Fri,  5 Aug 2022 15:44:42 +0300
Message-Id: <20220805124442.1857692-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805124442.1857692-1-burzalodowa@gmail.com>
References: <20220805124442.1857692-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MASK_DECLARE_ macros have only a limited scope. Remove their definitions
immediately after their usage.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- new patch

 xen/common/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index c48a1cabd2..4a048caa49 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -40,6 +40,11 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG + 1][BITS_TO_LONGS(NR_CPUS)] =
 #endif
 };
 
+#undef MASK_DECLARE_8
+#undef MASK_DECLARE_4
+#undef MASK_DECLARE_2
+#undef MASK_DECLARE_1
+
 static DEFINE_RWLOCK(cpu_add_remove_lock);
 
 bool get_cpu_maps(void)
-- 
2.34.1


