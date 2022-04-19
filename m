Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6D507D44
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 01:44:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308484.524238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngxVQ-00019W-UW; Tue, 19 Apr 2022 23:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308484.524238; Tue, 19 Apr 2022 23:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngxVQ-00016J-R1; Tue, 19 Apr 2022 23:43:36 +0000
Received: by outflank-mailman (input) for mailman id 308484;
 Tue, 19 Apr 2022 23:43:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvD2=U5=gmail.com=eng.alaamohamedsoliman.am@srs-se1.protection.inumbo.net>)
 id 1ngxVP-00016D-B9
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 23:43:35 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 852d3d66-c03a-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 01:43:32 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id q3so23811775wrj.7
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 16:43:32 -0700 (PDT)
Received: from alaa-emad ([102.41.109.205]) by smtp.gmail.com with ESMTPSA id
 x4-20020adfdd84000000b00207b60ed68esm13255849wrl.100.2022.04.19.16.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 16:43:31 -0700 (PDT)
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
X-Inumbo-ID: 852d3d66-c03a-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HKQLOdPaQ3Mw3cBSPXtTxWv22p46uaNKqi/2UnH+TaU=;
        b=W+DL2plQDmeF6M+8AnbzgopnqINjz5xpZNqMbikOKgoHFPRR+2r5EWaHfQkEeeyh8Y
         4x3B0Cqy4qQjSieeCV93kllUXHcH1UEDOyJ4H3wi3nGkncyyG69gMCxdhJrYyUgoMASs
         byoRivqsbbPGEE5WgsXzZwjw4W9tp8cTrS2PGq8BAEhXE767YJOJn1HZSX0oG6fO7+gi
         xLn3V8FkF2M8NwqWPNExwEjR/LxGIsYI7oaOyzgmVo32APXgz+OmYl1Y48HnpBXCupPQ
         yXxgbu5sru6YT/MpEjkix0vIoBcBKYwhlN6gKA5aSrgKRu9UJZxn3uW2VAIeWPPrevdr
         3hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HKQLOdPaQ3Mw3cBSPXtTxWv22p46uaNKqi/2UnH+TaU=;
        b=d5CcPaOBbeKWhWdWpV2LD2ZqVKgD0e1bNjbd0nXIsLSmYYjjHtG767/x+iuAlYo06I
         deAt+BIRdgS4MyB1Q0PkeKE+U6jhKBmY/ijYGBCoYVZdNasIkVknMae59bXwSU2nrhbE
         4Y+4uleEdEDMUODQ74ZpqYRwpznudy1FGs0oimvagpzXLa3ygui5oE6fFGJyhCp616Ic
         DLnZqF52wYQycOl/Ub9nARIDWuzto08SPLNrNC5AWOcXq8LcoqcQWcEBtSMBKcila6Rt
         IvL5i9nJW6v5vJhbQycf4jMERZGqUHf0+yvTujOEcc4xlp4Pgj3r8+Jg7pyA9VEDkN4L
         kMEQ==
X-Gm-Message-State: AOAM532PCVkp6c1qxReOvGd/skMwLDnkqqtzFgeppwtda0jKillbOIG/
	qZ2uW8PJHylkbPOYqQqFyqo=
X-Google-Smtp-Source: ABdhPJwAIcFXMCqod1EDSxcxDLBq3kQdWuUNKRazc7JRrvo6vjc1W5NvWFPzXoUkm5DwO/gOBUTKUg==
X-Received: by 2002:a5d:45ce:0:b0:207:9e7e:9a4b with SMTP id b14-20020a5d45ce000000b002079e7e9a4bmr13248177wrs.559.1650411811661;
        Tue, 19 Apr 2022 16:43:31 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	ira.weiny@intel.com,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH v2] xen:  Convert kmap() to kmap_local_page()
Date: Wed, 20 Apr 2022 01:43:28 +0200
Message-Id: <20220419234328.10346-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap() is being deprecated and these usages are all local to the thread
so there is no reason kmap_local_page() can't be used.

Replace kmap() calls with kmap_local_page().

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
changes in V2:
	-edit commit subject
	-edit commit message
---
 drivers/xen/gntalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index 4849f94372a4..55acb32842a3 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -178,9 +178,9 @@ static void __del_gref(struct gntalloc_gref *gref)
 	unsigned long addr;
 
 	if (gref->notify.flags & UNMAP_NOTIFY_CLEAR_BYTE) {
-		uint8_t *tmp = kmap(gref->page);
+		uint8_t *tmp = kmap_local_page(gref->page);
 		tmp[gref->notify.pgoff] = 0;
-		kunmap(gref->page);
+		kunmap_local(tmp);
 	}
 	if (gref->notify.flags & UNMAP_NOTIFY_SEND_EVENT) {
 		notify_remote_via_evtchn(gref->notify.event);
-- 
2.35.2


