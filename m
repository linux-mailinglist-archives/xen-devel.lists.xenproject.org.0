Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE34ECBA9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 20:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296467.504657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZcst-0001f3-Lr; Wed, 30 Mar 2022 18:17:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296467.504657; Wed, 30 Mar 2022 18:17:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZcst-0001cp-IY; Wed, 30 Mar 2022 18:17:31 +0000
Received: by outflank-mailman (input) for mailman id 296467;
 Wed, 30 Mar 2022 18:17:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjcS=UJ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nZcsr-0001bv-MX
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 18:17:29 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a791bdea-b055-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 20:17:28 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id t7so18832172qta.10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 11:17:28 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05620a299100b00680b43004bfsm10101405qkp.45.2022.03.30.11.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 11:17:26 -0700 (PDT)
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
X-Inumbo-ID: a791bdea-b055-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcMntDmKCVs95+e0vkGO4mVI2Vi2Ub88nm3xAyn1r5k=;
        b=SJJ5ZBhVXh0/cPxy737DuocIHKceO5dNhNeAqReioLJIuK3sssj+2qU2lutvUjQGKZ
         wTVdvJtU8aTZlEMy+4jEKrNs9qC/H8q9wqTvMezsa3EzaG9Jgf8k698yT4lKJhbOACqC
         34kOBZeamKwPvBaSWsGLIK4z1zb+hmd7AjvKwI1B4L9KcrpiJzkg8Qakvfui3obNARru
         B/llZWjWsLA4tYxjd5+/cHVAWxOdoBLhvvGalIGzHh6UTSuCU2fpn1yyBRkP1+XNmymY
         vqakwjaF8IQS4yIQXfaOOJkbYIN5DfLT8sDWwKFSxoo/3WUXY83Q0v4303Qr+u2eT4V7
         17Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcMntDmKCVs95+e0vkGO4mVI2Vi2Ub88nm3xAyn1r5k=;
        b=UsbIWyWHDm/b8mcMA9DK+NC1plfwQVnhCsSrAWiMkvEEYBOe2Aik2Jm3FTHtJXDpsH
         YQo6N648/qOF8pzkdxmvfhy1aDp3O3XTIFKSdrbqKlV7SEg7v9rQlUffq+FEdXo22Din
         ori7+D664o3EyS3DAfyTgrwPLtDyRmiwmtEKENqDG9Klx1D7YW/8VdimIK5kmF5EWpvr
         5YklLr+BsNLR2RG98+N2BTPMH5dACbrEjNMl97de/FxQ8V6qVGKbeVkEw7WcsmBWyRY7
         IQv5xbFw27mVIvxZ5heniF+lpMlmM8PTbX2lQFAwRAm+8Ocq7iGiry/UpalrH5Va0sR9
         Jemw==
X-Gm-Message-State: AOAM532hDs/11k43au/1ax6+cRHPNm3ZQMvKNwPVrIqgoWhhccX2GgtH
	08p4/NOjOlDiyBWSmLGA100KSIBf6q0=
X-Google-Smtp-Source: ABdhPJxPx5465p8F+LsFFeoPO1Bylxge6c+JMcqFT38HHWEwHPMOqZGBn5HvPb8Fq5Q+6hLkeHrQ/Q==
X-Received: by 2002:ac8:5ac2:0:b0:2e1:cc2d:362a with SMTP id d2-20020ac85ac2000000b002e1cc2d362amr790199qtd.584.1648664247023;
        Wed, 30 Mar 2022 11:17:27 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: constify libxl__stubdomain_is_linux
Date: Wed, 30 Mar 2022 14:17:22 -0400
Message-Id: <20220330181722.30280-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libxl__stubdomain_is_linux can take a const pointer, so make the change.

This isn't an issue in-tree, but was found with an OpenXT patch where it
was called with only const libxl_domain_build_info available.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c0e7779d97..a26daec040 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2326,7 +2326,7 @@ bool libxl__stubdomain_is_linux_running(libxl__gc *gc, uint32_t domid)
 }
 
 static inline
-bool libxl__stubdomain_is_linux(libxl_domain_build_info *b_info)
+bool libxl__stubdomain_is_linux(const libxl_domain_build_info *b_info)
 {
     /* right now qemu-tranditional implies MiniOS stubdomain and qemu-xen
      * implies Linux stubdomain */
-- 
2.35.1


