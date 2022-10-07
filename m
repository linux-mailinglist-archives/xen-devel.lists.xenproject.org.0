Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C155F7E02
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 21:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418241.662998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogt4c-0000VR-Tx; Fri, 07 Oct 2022 19:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418241.662998; Fri, 07 Oct 2022 19:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogt4c-0000Ta-RA; Fri, 07 Oct 2022 19:31:54 +0000
Received: by outflank-mailman (input) for mailman id 418241;
 Fri, 07 Oct 2022 19:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ss/Z=2I=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ogt4a-0000TU-Nd
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 19:31:52 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0aef6ec-4676-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 21:31:51 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id fb18so3390796qtb.12
 for <xen-devel@lists.xenproject.org>; Fri, 07 Oct 2022 12:31:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 de41-20020a05620a372900b006e07228ed53sm2767598qkb.18.2022.10.07.12.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 12:31:48 -0700 (PDT)
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
X-Inumbo-ID: b0aef6ec-4676-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBv3GlGHRWdoq6Ybc/QYiDjfAi4CdFQEmJaAU2QkoXo=;
        b=f5OiB8c9U9Woy2yDCx7xTdlpOlstrL5x3VUvbPK/d7JUPaj+W7VOnJ4380g/AIzTCw
         y/zgf2A+QOKvvownjeGNvpKhMAyWfvuF8/DdWRJtNUkpX7t5lelSBe3xbOt8Pnc1MAd5
         +eUsyTxGVXADjSt9RoMTzRz+ON11a8BVkJ8c5feLNZnQ4d2s1TgFZoJQzOqWfpIAUdhd
         CdcXMO4SWb0I7geq8Su6QPnxMY8KE/H8TEqKthL9n3wFInn8df8/EeYaQzigcFFTz3TC
         F9jv292cNuEV/XsgsqL5czqzVGiBb4hshr8za9oh8t9V0dzn2PuXXuMBIdEH3ZtQ0kpn
         wtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBv3GlGHRWdoq6Ybc/QYiDjfAi4CdFQEmJaAU2QkoXo=;
        b=5HTg5rqdky2/053n3A6F+tbCl+ApvlAVeOnvM4JbvdsezffVCPrzLH+DBCK2qB1Upt
         ZaCkl+ATp08DdncNCuBNFl59kaPsKZ1OsAlCg6rQK6G+NhdL+Izd0mrhPkxOVuP0aqOU
         r0HGgMflgvOB5QUTXEp769YAgj+ItwutvA+MCuVdWLMrVTPcoMqAg426GbPg+OJH7Lm2
         YoGAvnnXYdma2RVEGjYCHYbMQ3Mm1ubUWI6P5hLSWZ/kt0CUYxeRiqKThYOJc6sGqjHN
         ZPclviEcg+bxZQPbjo8diWVkMXJZfPlhfMVEYlZXoi8b80X7uPTH9138tDIL9LaXBbOt
         GaLg==
X-Gm-Message-State: ACrzQf0rqy4osD5QUvM1rXIageCHVvMK/pLUYtAQK+IKqhlALQANL/1a
	Vrp728EKogvRtrYMieLCEH18LeIPiZY=
X-Google-Smtp-Source: AMsMyM5JE8mXf56Y4giTtTDOeaTP9MKf7rrH2VAf2ew0oF19aimdTy3uwUby2/s4aYOGvyaQfhYlnQ==
X-Received: by 2002:a05:622a:1aa8:b0:35c:c831:d601 with SMTP id s40-20020a05622a1aa800b0035cc831d601mr5549038qtc.434.1665171109189;
        Fri, 07 Oct 2022 12:31:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Date: Fri,  7 Oct 2022 15:31:24 -0400
Message-Id: <20221007193124.20322-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I observed this ASSERT_UNREACHABLE in partner_rings_remove consistently
trip.  It was in OpenXT with the viptables patch applied.

dom10 shuts down.
dom7 is REJECTED sending to dom10.
dom7 shuts down and this ASSERT trips for dom10.

The argo_send_info has a domid, but there is no refcount taken on
the domain.  Therefore it's not appropriate to ASSERT that the domain
can be looked up via domid.  Replace with a debug message.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/common/argo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index 748b8714d6..973e1e9956 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -1298,7 +1298,8 @@ partner_rings_remove(struct domain *src_d)
                     ASSERT_UNREACHABLE();
             }
             else
-                ASSERT_UNREACHABLE();
+                argo_dprintk("%pd has entry for stale partner domid %d\n",
+                             src_d, send_info->id.domain_id);
 
             if ( dst_d )
                 rcu_unlock_domain(dst_d);
-- 
2.37.3


