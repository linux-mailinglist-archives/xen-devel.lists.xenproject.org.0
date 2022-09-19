Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E895BC14F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 04:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408464.651221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oa6K8-0003xO-VG; Mon, 19 Sep 2022 02:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408464.651221; Mon, 19 Sep 2022 02:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oa6K8-0003uV-OZ; Mon, 19 Sep 2022 02:15:52 +0000
Received: by outflank-mailman (input) for mailman id 408464;
 Mon, 19 Sep 2022 02:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z56U=ZW=stew.dk=stewart@srs-se1.protection.inumbo.net>)
 id 1oa6K7-0003ss-Ep
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 02:15:51 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9625f74-37c0-11ed-a31c-8f8a9ae3403f;
 Mon, 19 Sep 2022 04:15:50 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so60105907fac.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 Sep 2022 19:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb91:1108:ae0:6e73:b13c:9e3e:3750])
 by smtp.gmail.com with ESMTPSA id
 q43-20020a056871082b00b00127616039e7sm7026064oap.29.2022.09.18.19.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 19:15:46 -0700 (PDT)
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
X-Inumbo-ID: f9625f74-37c0-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stew.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vzgmi1/fG6Z0oTGCQSGRpxHTj5JtqrXJnowUsIznWHM=;
        b=BGML0tP5aOp54rI0rWltcEW741AHPXy518GlPfjwVoGyXqznCUp/Bso/9Hg6COH4x/
         bYvlXU5G885jhnxw2LXI5GWgYHHqYvxKFo7Z3X4Ih7YG/gd0/PZXcdoseHdURZUbgyJF
         n+PuC+pLtoHw/9+RLK5ZsmVgcnhsNimyjafXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vzgmi1/fG6Z0oTGCQSGRpxHTj5JtqrXJnowUsIznWHM=;
        b=OIyTic36gBIkutf5r3xBZaJbvIjH6V9iimDppDEDi+ZOQ6rT8aD9cc1PMK5rCRvq+e
         0+IkdDerYAtKXu32kE3yBo8SZNle4ukYkn6ONiAs03i/sFebqbXowuj+fzMJ+3OVOY62
         yo9eQ8AXA+5Ibv1igLNaK9IJfQ7bs/igvbNa+QBnkLx2+U5I/JoYRfr+cjMELQVZ5lx9
         GVZCKgPWyr2q3EwkneoeLp8Co9zUMc2H7L+PQ9lQJ6DwrWpGKGHYvBhVTUqsm5pmsyvu
         7CXW8rbxfY8QsUhqkUoAKfvsfQ0m6loNTfk3feTk3Wp7sGhVeH3Y4NVS2QQlhVhvFPOz
         YjzQ==
X-Gm-Message-State: ACrzQf3HFXg261T/k8JBYnKMs0BrK/DOjXMxmAvWtMfW5TX+gDEItiNi
	r0Gw1CpHzEnoAZXdA3cmFpX8o3AQIbSHADUYKe8=
X-Google-Smtp-Source: AMsMyM7a59iJVp1cSsB4h2AMyU0RSoYugvNA9Ql+TsYLFpOBmKnM0lTBMVML4/2Qxk6w42lWml4p9Q==
X-Received: by 2002:a05:6870:e99a:b0:12c:8a51:ba3f with SMTP id r26-20020a056870e99a00b0012c8a51ba3fmr6696900oao.276.1663553746926;
        Sun, 18 Sep 2022 19:15:46 -0700 (PDT)
From: Stewart Hildebrand <stewart@stew.dk>
To: xen-devel@lists.xenproject.org
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Jeff Kubascik <jeff.kubascik@dornerworks.com>,
	Robbie VanVossen <robert.vanvossen@dornerworks.com>,
	xen-devel@dornerworks.com,
	Stewart Hildebrand <stewart@stew.dk>
Subject: [PATCH v2] MAINTAINERS: ARINC 653 scheduler maintainer updates
Date: Sun, 18 Sep 2022 22:10:02 -0400
Message-Id: <20220919021002.2193665-1-stewart@stew.dk>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
References: <20220915193027.3166-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>

Add Nathan Studer as co-maintainer.

I am departing DornerWorks. I will still be working with Xen in my next
role, and I still have an interest in co-maintaining the ARINC 653
scheduler, so change to my personal email address.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e12c499a28..816656950a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -221,7 +221,8 @@ F:	xen/include/xen/argo.h
 F:	xen/common/argo.c
 
 ARINC653 SCHEDULER
-M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
+M:	Nathan Studer <nathan.studer@dornerworks.com>
+M:	Stewart Hildebrand <stewart@stew.dk>
 S:	Supported
 L:	xen-devel@dornerworks.com
 F:	xen/common/sched/arinc653.c
-- 
2.37.3


