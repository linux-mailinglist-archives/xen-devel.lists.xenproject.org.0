Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF3C3F6F74
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 08:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171792.313485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImLN-00084L-Gu; Wed, 25 Aug 2021 06:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171792.313485; Wed, 25 Aug 2021 06:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mImLN-00081j-DJ; Wed, 25 Aug 2021 06:25:01 +0000
Received: by outflank-mailman (input) for mailman id 171792;
 Wed, 25 Aug 2021 06:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yhNK=NQ=gmail.com=cgel.zte@srs-us1.protection.inumbo.net>)
 id 1mImLM-00081d-4G
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 06:25:00 +0000
Received: from mail-qt1-x830.google.com (unknown [2607:f8b0:4864:20::830])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bac558df-42b3-4ef6-aa83-f24392793d4d;
 Wed, 25 Aug 2021 06:24:59 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id g11so18957019qtk.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Aug 2021 23:24:59 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id x21sm12230230qkf.76.2021.08.24.23.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:24:58 -0700 (PDT)
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
X-Inumbo-ID: bac558df-42b3-4ef6-aa83-f24392793d4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+MRKVY1+87PTphWJ8h52+nwJ2uKSZ2hmxJNZxE9nXo=;
        b=lNnsvZ9zCh3fplemTR+tcxkriS3QKZIZLdaJZkqv5zvSAKOZoF/3pG9iu9nv0AwN+F
         1sia09hBrJreeyYAJxAbkjBmBwKxp7yOhm1STA4OCSuOI+pUetXHvZy3fEF/I8aI4ni6
         TGOmWIlaJuIBrsbdybMAtqO7fXHFJPx02VQYNWMartU6FqtrJ8SyP5xIfnLL2POU+EGS
         MeedmeZytni0SUraPlOfvXHi1LtPsZoPOAL+PErYa7NalOtRwP53RQrl9UwGAuJYb9RJ
         T0Fpl62XKZJgGXGN44fZ9XmlyubrcY+f//XYprPV3GPSIlp1uTXNOSst/6ye+7wjF8Pi
         cW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+MRKVY1+87PTphWJ8h52+nwJ2uKSZ2hmxJNZxE9nXo=;
        b=rVHR3GTEaqHbwHXC3/KPSogkwzQKqhxXufh8DxQWcrF8WNO7ShuTj/FDdnFtBNFnT0
         yN8fJ3uDnrLJ55lHU9qszs4D+JeocUf8gIq+56Fu/X+Jfd5Wet7RUyvv/OaCJY4Ag8w3
         RiTPxthy7vfZxiR8+lajooXDGgo4z2wcyh2G49TZHO0ezXFTUFZYQ/HdkXB3xcWLz2Ls
         uCR7YKIYsdq+H0MApf4z2gjxvV8UDB5QOfzKsi8I23BgR1/NkXpmnZRn+XyayleIXCTY
         fu/8UUJ53QVCH6s43dlC4/bQsA+ednHQIl2S6QHSbnSPzOfN/wmZqKJL1TPbjI1J0XUn
         fBqA==
X-Gm-Message-State: AOAM533h6x2S1GFkRAS35we/xqRAp5rkyuEqcevbsRxkpGjGxfLHMYPL
	XJknWdDWIBDhgGLzu++Y6+4=
X-Google-Smtp-Source: ABdhPJwf1PRn7cZFQeT0fJnXp5soDZNvOCrbFR4hEF/wie/akfgVagQZDWM+cKIFVM+z3wxi1mdwPw==
X-Received: by 2002:ac8:51da:: with SMTP id d26mr12769253qtn.331.1629872699257;
        Tue, 24 Aug 2021 23:24:59 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	SeongJae Park <sjpark@amazon.de>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drivers/xen/xenbus/xenbus_client.c: fix bugon.cocci warnings
Date: Tue, 24 Aug 2021 23:24:51 -0700
Message-Id: <20210825062451.69998-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Use BUG_ON instead of a if condition followed by BUG.

Generated by: scripts/coccinelle/misc/bugon.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/xen/xenbus/xenbus_client.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
index 0cd7289..e8bed1c 100644
--- a/drivers/xen/xenbus/xenbus_client.c
+++ b/drivers/xen/xenbus/xenbus_client.c
@@ -542,8 +542,7 @@ static int __xenbus_map_ring(struct xenbus_device *dev,
 		}
 	}
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, info->unmap, j))
-		BUG();
+	BUG_ON(HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, info->unmap, j));
 
 	*leaked = false;
 	for (i = 0; i < j; i++) {
@@ -581,8 +580,7 @@ static int xenbus_unmap_ring(struct xenbus_device *dev, grant_handle_t *handles,
 		gnttab_set_unmap_op(&unmap[i], vaddrs[i],
 				    GNTMAP_host_map, handles[i]);
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, unmap, i))
-		BUG();
+	BUG_ON(HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, unmap, i));
 
 	err = GNTST_okay;
 	for (i = 0; i < nr_handles; i++) {
@@ -778,8 +776,7 @@ static int xenbus_unmap_ring_pv(struct xenbus_device *dev, void *vaddr)
 		unmap[i].handle = node->handles[i];
 	}
 
-	if (HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, unmap, i))
-		BUG();
+	BUG_ON(HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, unmap, i));
 
 	err = GNTST_okay;
 	leaked = false;
-- 
1.8.3.1



