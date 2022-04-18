Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6935E504ECD
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 12:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306957.522447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngOVy-0005fa-R7; Mon, 18 Apr 2022 10:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306957.522447; Mon, 18 Apr 2022 10:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngOVy-0005cN-NK; Mon, 18 Apr 2022 10:21:50 +0000
Received: by outflank-mailman (input) for mailman id 306957;
 Mon, 18 Apr 2022 06:19:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uw9=U4=gmail.com=eng.alaamohamedsoliman.am@srs-se1.protection.inumbo.net>)
 id 1ngKjU-0000EQ-CW
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 06:19:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 821ff2cc-bedf-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 08:19:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 m15-20020a7bca4f000000b0038fdc1394b1so7689823wml.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 Apr 2022 23:19:31 -0700 (PDT)
Received: from alaa-emad ([197.57.90.163]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm13992199wmc.32.2022.04.17.23.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 23:19:30 -0700 (PDT)
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
X-Inumbo-ID: 821ff2cc-bedf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TpWXWlsIiwFWqITQBBmHqt+ptX9YU3vyMz2FKFbBljI=;
        b=KVf+4C/PtpEfuB/Nxd/EYlIv9rV9YIYR3O2bMQguZFWKge/IUlTq8vQWAZQe8oiaVp
         tSbS/pFY1PvpYzcU3FT9E8BRiWtfFu5LHlsOjEmoAi7ACi+Iy1ESCvvP4miqPbcT8X8j
         fFiFpDshwNnmiXZ11QLg/k9C528xaqqbPLvtDAIxe/C2/xIV1DalMdAup68C2N13YvlV
         +Euy8Huqd/3jlzskYYaJTeN7QjGP7T0lPwSx0WQmyKkF0TicIgSgJVnDmChDfq/cmVJu
         wBFN3wCYNC2QFtJ8ZvakpGXI6GS2j/tdOF/sDc/nVPvMpu2Xh1aU376/LhlyUkX967ky
         Psrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TpWXWlsIiwFWqITQBBmHqt+ptX9YU3vyMz2FKFbBljI=;
        b=nQOamLNyOA7+UquH6h26jFU3EaxFH+qFlKYY8UstLNYgqen7ZDm47z7yvccx1jsAN6
         lCQM5B/Exg6iwMyQAMXPtLuFxv5HWkolYTgRmzdL/ueJ3cuIWwGeu7DlxkR3Zfu5Kzhy
         IA/C7KkZSVQbJGEihPmtHfldFY669RqfXcTf/na3Ho2Ybm4emTD1SeBZaU3wLNnCFOch
         GS0pnVJ2fh0PX/7yJU9rSRaOXhRO7aX0rDi9vtrroXXghNmJxskgxeA/pQOC8xg18nko
         0IVk6UY+H2cxG6m3vou7WxD4jCGV9WI/0sknQUlenyJheoBelt1xnrVKmNY8batZyyeY
         VSqQ==
X-Gm-Message-State: AOAM532a3zddnfM2YjogP0lWL4CrtkeTHx4cYOaf9/yw3qQy87AsfdFU
	4D81iNAcnIiCdRfr/2mHVpU=
X-Google-Smtp-Source: ABdhPJyZ1HNParLvvy4rzpznCl7QS81uDSoiwV8fB4OIS0XVE5dQ8FZK+15fz5DY06IYoRqXJpCRHw==
X-Received: by 2002:a05:600c:4f87:b0:392:9236:3c73 with SMTP id n7-20020a05600c4f8700b0039292363c73mr5367903wmq.158.1650262770786;
        Sun, 17 Apr 2022 23:19:30 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	ira.weiny@intel.com,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] xen: gntalloc.c:  Convert kmap() to kmap_local_page()
Date: Mon, 18 Apr 2022 08:19:27 +0200
Message-Id: <20220418061927.6833-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated in favor of kmap_local_page()
where it is feasible.

With kmap_local_page(), the mapping is per thread, CPU local and not
globally visible. Therefore __del_gref() is a function
where the use of kmap_local_page() in place of kmap() is correctly
suited.

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
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


