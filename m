Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F187EE6D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695035.1084569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGTd-00062e-EM; Mon, 18 Mar 2024 17:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695035.1084569; Mon, 18 Mar 2024 17:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGTd-00060Z-At; Mon, 18 Mar 2024 17:08:45 +0000
Received: by outflank-mailman (input) for mailman id 695035;
 Mon, 18 Mar 2024 17:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHh-0002gq-My
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71e78ade-e548-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:56:20 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41413f7b2dfso5573675e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:20 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:19 -0700 (PDT)
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
X-Inumbo-ID: 71e78ade-e548-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780980; x=1711385780; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpV3y5oudWDxMbRb7L99Hd6enDOLIEEjJdtB4aBntcc=;
        b=db6ssZCUQVyUol5ukSBeJ5x9Awo95esHs4pLqSqhU9jU+TpuYMVQdynicHUeeib2yD
         /Wei8LCLSTRtimSO9fi71KwPuq08tVm/0/34o1WRanVc9F8abfZ5tzM90OfmcVSjPb9z
         DeISju6cREjBdMUbGSUPcbtOhsu0AufF/clhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780980; x=1711385780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpV3y5oudWDxMbRb7L99Hd6enDOLIEEjJdtB4aBntcc=;
        b=iVZj427Lh19cyq2OST1CojWXmxvIWI8vO5BlDOyqgd+noIde5QYeBUSck5S3CXNv6w
         00FfFHbDoCcIvPeXiO27prMquwU8bU/pAsm3bDmtZ6l8zroF9t5YRaYi2jWO29yvkrrl
         JXpw5CkdcatDUbXlI19f8g8FGflsoZTjq1an3ifRh+/dcd0l4J1DvRSsMIjyaj/1FJxI
         6zvbmt5CctUmSUt1MyKWgpka1e9AP/RolbOZ7bh63htlER/i4NZouo1rFXsQPev99/zt
         JsDL5A8G2r4vqduHinye6+9JPXM2nxOVnxqEBBn25PdSb7JAjntq57ERhE179+xSeNHQ
         LrkA==
X-Gm-Message-State: AOJu0Yx4Yd0Q0l9iNcwqbaOQF55FlEZ9XcIIpxM/aCacb0a7ogUV1ZN1
	xncVBdUrfY6hLm7Inx3DU0hCshYRyh261gw46Z/5RATVj3bHaostOlzXmlKZ6Ne4owMryiO94tQ
	j
X-Google-Smtp-Source: AGHT+IG4Cmmc0rd0wtw3C3CQayvvKemrNI+DJdbL7oeBPz+ppHszenmK2b33mLfvVO7fciQ3SPGfDQ==
X-Received: by 2002:a05:600c:5105:b0:412:ed3f:1b4b with SMTP id o5-20020a05600c510500b00412ed3f1b4bmr8596847wms.11.1710780980145;
        Mon, 18 Mar 2024 09:56:20 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 34/36] Temporally switch "qemu-mainline" branch to Bookworm
Date: Mon, 18 Mar 2024 16:55:43 +0000
Message-Id: <20240318165545.3898-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QEMU doesn't build on buster anymore.

This should be remove once bookworm is the default suite.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 make-flight | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/make-flight b/make-flight
index d0c950bc..6e88cb13 100755
--- a/make-flight
+++ b/make-flight
@@ -49,6 +49,11 @@ case "$xenbranch" in
     ;;
 esac
 
+# QEMU doesn't build on buster anymore, use bookworm for it.
+case "$branch" in
+    qemu-mainline) defsuite="bookworm" ;;
+esac
+
 # Pick default Debian Installer version to correspond to the chosen
 # suite.
 if [ -z "$defdi_version" ] ; then
-- 
Anthony PERARD


