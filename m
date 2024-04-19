Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9A8AAFFF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709097.1108346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonB-00087c-Bi; Fri, 19 Apr 2024 14:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709097.1108346; Fri, 19 Apr 2024 14:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonB-00084T-8T; Fri, 19 Apr 2024 14:00:41 +0000
Received: by outflank-mailman (input) for mailman id 709097;
 Fri, 19 Apr 2024 14:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxon9-00084M-Vg
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:00:39 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b7391a-fe55-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 16:00:37 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-69b40061bbeso12293586d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:00:37 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a0c8d89000000b0069b7eb7edebsm1582413qvb.71.2024.04.19.07.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 07:00:35 -0700 (PDT)
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
X-Inumbo-ID: 32b7391a-fe55-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713535236; x=1714140036; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pzG5gY4gqXEkkpMuOFYwzI1Mz0yJcR4zAPhXCGdw+M=;
        b=Wt4U5RNScmoUgIhNMFNAUk+ZX6sr1ZaLoz8coDQq+5zxPY9jLM2ixivyhsU38c7y4+
         fpJA2jBSL1z1Rt9SuyfE4LTbzEpq/b1adCuq5I2f4+qafJseQX/2bCDw1HBGeom73f6b
         +IqUyknx44iS6NEsf2egCyMgwaZY9sBVnJUOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535236; x=1714140036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pzG5gY4gqXEkkpMuOFYwzI1Mz0yJcR4zAPhXCGdw+M=;
        b=l8Rzj2pMghhwQS9nbT7xGtoaumAE5hm6EhxU84TmDopWLZSzcgsUxqwZ18LK9+CKMK
         nZ/T8BWNg4g995T5z2Qk6+J4wQyfLqOeeYXEpMmXJ7xLfXta8b/gKJunSn7k6bEi0Ltj
         +WEm0APj76Y8Q81urWlumd4HZq0iiWSUMNgR468naARyj2utXELqYJXiDAD6EUi0kZhB
         G18sMwf7ojnbyRZxeFM/FKE2r1y3JjTpqi4VP6PxgoxmVf28sAoY2sjJjpRjAXoNRHYc
         8q/+owuECdch9CFrr/QmgJa8uc8un5Mc0yPPnjaCbRSXRWHIoJ0V3aPaG+JVO2i1qMFQ
         jDxA==
X-Gm-Message-State: AOJu0YwQ8q7MAly0WpDFh4KIwACf1qlhJRUU6qwmfGbxewhsQMVNNoTs
	Ir4S5e3Pib5ncGWkF5npDlhPiydIrQHcgUqqiu8mpseKwvScFdutDAsTDK2b2KpkyAGudDBlbOs
	Y
X-Google-Smtp-Source: AGHT+IE5RXvZ86MBPluokHCguh7EKC08phkkyA2PWkDgjC+DEPPW35Xpuol6Skb7jd+pBME01crNDQ==
X-Received: by 2002:a0c:e152:0:b0:6a0:5baa:10f9 with SMTP id c18-20020a0ce152000000b006a05baa10f9mr2108237qvl.48.1713535236297;
        Fri, 19 Apr 2024 07:00:36 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Tobias Fitschen <tobias.fitschen@posteo.de>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 1/3] tools/golang: When returning pointers, actually allocate structrues
Date: Fri, 19 Apr 2024 14:51:18 +0100
Message-Id: <20240419135120.830517-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a handful of cases, it was decided to return a pointer to a
structure rather than the plain structure itself, due to the size.
However, in these cases the structure was never allocated, leading to
a nil pointer exception when calling the relevant `fromC` method.

Allocate structures before attempting to fill them in.

Fixes: 453713b1750 ("golang/xenlight: Add host-related functionality")
Reported-by: Tobias Fitschen <tobias.fitschen@posteo.de>
Signed-off-by: George Dunlap <george.dunlap@cloud.com>
Tested-by: Tobias Fitschen <tobias.fitschen@posteo.de>
---
v2:
 - Added Fixes: tag
 - Added Tested-by tag

NB this is a candidate for backport.

CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/xenlight.go | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index a45c636952..d793f172e5 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -999,6 +999,7 @@ func (ctx *Context) GetPhysinfo() (physinfo *Physinfo, err error) {
 		err = Error(ret)
 		return
 	}
+	physinfo = &Physinfo{}
 	err = physinfo.fromC(&cphys)
 
 	return
@@ -1010,6 +1011,7 @@ func (ctx *Context) GetVersionInfo() (info *VersionInfo, err error) {
 
 	cinfo = C.libxl_get_version_info(ctx.ctx)
 
+	info = &VersionInfo{}
 	err = info.fromC(cinfo)
 
 	return
@@ -1027,6 +1029,7 @@ func (ctx *Context) DomainInfo(Id Domid) (di *Dominfo, err error) {
 		return
 	}
 
+	di = &Dominfo{}
 	err = di.fromC(&cdi)
 
 	return
-- 
2.25.1


