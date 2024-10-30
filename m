Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C99B6B87
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 19:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828382.1243240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Cz7-0007QW-W7; Wed, 30 Oct 2024 17:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828382.1243240; Wed, 30 Oct 2024 17:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Cz7-0007Nn-Sm; Wed, 30 Oct 2024 17:59:57 +0000
Received: by outflank-mailman (input) for mailman id 828382;
 Wed, 30 Oct 2024 17:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6Cz6-0007Nh-Rk
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 17:59:56 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c26a5ff9-96e8-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 18:59:51 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so98972a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 10:59:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6319711sm4926486a12.66.2024.10.30.10.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 10:59:49 -0700 (PDT)
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
X-Inumbo-ID: c26a5ff9-96e8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMyNmE1ZmY5LTk2ZTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzExMTkxLjIzMzI1OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730311190; x=1730915990; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9SR3Yd/ffMhp+UMSgdVbSs+H3lztPmbEiuOsacROSM=;
        b=GIK2dK4RH11xg5aqTU9TGWu59S7BAhAcOYOmdPXJocbn/0LTVLqzFTmMJN3218isEB
         7rmBBOmVUKqYt2nGyeHmId/xUoc5GQjNST3l3zobgVpbMSh5yiPiPcEfWxVtduxM652C
         vp5TZPBCOfe5a8xREtKIpBZKAiO3BSNI7ezZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730311190; x=1730915990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9SR3Yd/ffMhp+UMSgdVbSs+H3lztPmbEiuOsacROSM=;
        b=GzRjcMp79NwWhfMUhuS2XB5rKx5HwgfcrG8SiGl2UG14Oa5f7ZScQjBdCKTqHBQgwF
         VarowXAJK4VeE8JzyvIVByXt+7e/VQIARknKSyRCcpdosjI+ArcoEEJjQoqBaRJcE7DI
         Kn2gYRbSVaLAm6ja3lCrVOImbA79cTpUvqWHr1qRUSpNPx0ORPTF3n57vGx+1fKbf6Yi
         EY2o/reVkbgggaRoPn8VAtncP/Z83UQrmo4JBoe4t7vIl1EtoXLDtObqIRqdTBDiqVZj
         HCB0uJpVHdHGty3d6VQfwCq0YXBti946LJEDs1P58niRTmTZkNwNuHePS3sW7iFfCplf
         MACQ==
X-Gm-Message-State: AOJu0YwUk1yIvT/8JF4gLgNOkrdEOuBOaemnTgl3bF0uVsA/ZqT7lr4k
	56OpWTNoqQ5P1hjQ+IOLehTe+NmpIFVFs/6CVRb/9/MSFD8Ykf/nLyXgdep60zVCfVbrVlDiNYw
	N
X-Google-Smtp-Source: AGHT+IFlwedm5GSwYrFlcfJMdlBHhy4jWWaQdKIHIUZF01OzBDUnHjhqrQzwz05xTn4T2d+2xZRXnA==
X-Received: by 2002:a05:6402:2707:b0:5c9:44bc:f9b3 with SMTP id 4fb4d7f45d1cf-5cbbf8a4b69mr14848717a12.11.1730311190110;
        Wed, 30 Oct 2024 10:59:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] Config: Update MiniOS revision
Date: Wed, 30 Oct 2024 17:59:44 +0000
Message-Id: <20241030175944.2726594-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6d5159e8410b ("Add missing symbol exports for grub-pv")

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index 6dd2f9439cfc..f1eab9a20a66 100644
--- a/Config.mk
+++ b/Config.mk
@@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= 80ef70f92cb7b95ef48deea1157f2194b10b8c05
+MINIOS_UPSTREAM_REVISION ?= 6d5159e8410be16a47433bac1627e63f8adc7cd9
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3

base-commit: bb7296d77f171c7bfbafab30ed51e9be29660e39
-- 
2.39.5


