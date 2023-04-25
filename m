Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B76EE87E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 21:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526310.817992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOct-0002Yk-07; Tue, 25 Apr 2023 19:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526310.817992; Tue, 25 Apr 2023 19:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOcs-0002Ws-TQ; Tue, 25 Apr 2023 19:46:58 +0000
Received: by outflank-mailman (input) for mailman id 526310;
 Tue, 25 Apr 2023 19:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v3bG=AQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prOcr-0002TT-Hp
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 19:46:57 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef110557-e3a1-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 21:46:56 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-3ef6e84945dso14982511cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Apr 2023 12:46:56 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 rv12-20020a05620a688c00b0074c438db55asm1492592qkn.74.2023.04.25.12.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:46:54 -0700 (PDT)
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
X-Inumbo-ID: ef110557-e3a1-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682452015; x=1685044015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzwTXjcS78T2tg9v5yGGdamq4ltimB2uXb0D2+o3Noc=;
        b=VI1Lm9Tw+YLYJfU8T1PQAlNDnQPuRYCpdEAfC9ORHiqTh+gkc+EIYeb3v5XvD8XGmW
         H9kz2Ygr5uzgEp0bKg7/Lj9548CJ5+Ql/HZpF6ghzRYdbVuiNRQbi0rkzzUg3Sbuz4j4
         UQ6qyIdQLaZqmzexTmZnY1cqdNy1yLoqTHWOyYR3Lo3wT/Hb8c04tvnqXUmv/5dxaEiN
         8u2wmBXUnhs/w2iAWKPiHfAWQyjCtIcpTKFHT8RtzzEN7rSv0mtVW+GIXL56auCDWA0R
         Om4/QZLYqJ8kMqcjjHn0s+XxBmeJDLI7TxCqDcCY1fj8WY1ApRuOIN/fQ4RXubuVC57U
         C5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682452015; x=1685044015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzwTXjcS78T2tg9v5yGGdamq4ltimB2uXb0D2+o3Noc=;
        b=W10GdbvgHEn4n51p0sTgsygfhuHsp8M6fuEsYFVxZARkxe8AFSc8npjAzCND5hY50n
         1dcQrnNUbmnmWfil0DoHlO+zV4u9fuLTmvnQL8nBYFsdt50j0ZBxpFTYNBMjbea9iu4g
         wFi03wZBVfvbUp/JkQfL6DEaSasb4Pya7jTXISxt1UZ4Ek8NzMvYkCMFT1gZAKu2+mNw
         rhsgvrXmOqA2wawCzpwM9x3xNuwfuRWudeY9cgtVEIwa29CVtlXixbyVyEjWueqZyrm+
         hj4pkC4zpOHaTIyp6NpR/pe70aqMkTnN+5duZtXcXtoZEl+rBfoJPBaAEg2PROPo/Qq6
         q3LA==
X-Gm-Message-State: AAQBX9cUjASzGso9Iip4rsyiyrk5OWrLRo0LaA/GxQoulrLRIdONMOmr
	2een4ACe8OAYvwijHLgYtGGCOT0L24k=
X-Google-Smtp-Source: AKy350bFbXfmNjgtxcmFMFJ2OzlUVxB1znImKXDntfy5sNIUMoQGVMD3VwmEoF4MDPRV+p/1GbOJYw==
X-Received: by 2002:ac8:5e46:0:b0:3ef:6798:2a2e with SMTP id i6-20020ac85e46000000b003ef67982a2emr19288011qtx.54.1682452014732;
        Tue, 25 Apr 2023 12:46:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: device_backend_callback() print rc on error
Date: Tue, 25 Apr 2023 15:46:21 -0400
Message-Id: <20230425194622.114869-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425194622.114869-1-jandryuk@gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the rc when an error is found in device_backend_callback() so the
user can have some idea of why things went wrong.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_device.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index a75c21d433..13da6e0573 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1160,9 +1160,10 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
     }
 
     if (rc) {
-        LOGD(ERROR, aodev->dev->domid, "unable to %s device with path %s",
+        LOGD(ERROR, aodev->dev->domid,
+                    "unable to %s device with path %s - rc %d",
                     libxl__device_action_to_string(aodev->action),
-                    libxl__device_backend_path(gc, aodev->dev));
+                    libxl__device_backend_path(gc, aodev->dev), rc);
         goto out;
     }
 
-- 
2.40.0


