Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE9894EA8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700064.1092621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rraNr-0003qM-W7; Tue, 02 Apr 2024 09:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700064.1092621; Tue, 02 Apr 2024 09:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rraNr-0003oI-Sy; Tue, 02 Apr 2024 09:24:47 +0000
Received: by outflank-mailman (input) for mailman id 700064;
 Tue, 02 Apr 2024 09:24:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzIh=LH=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rraNr-0003oC-7d
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:24:47 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d72e6de6-f0d2-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 11:24:45 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-341730bfc46so3500003f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 02:24:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm13645284wrq.44.2024.04.02.02.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 02:24:42 -0700 (PDT)
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
X-Inumbo-ID: d72e6de6-f0d2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712049883; x=1712654683; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7Po9Yg6MmTeQBUUnDRkNrPoasf1vpdU7nQiO47L4SM=;
        b=Xen8uZbenjupz6hhthHPSArZg/aU9d33TokFVo1mfkgaZ1fXPsIzB2YtDsnmvkfuVw
         CNsUTt2CUB8I6+glgAmoxf9xj3qB5u8gpkHXlC0NIPUTvB4duFE6au8LlSYl93yCodnJ
         FpWc3mTb5DrDil6VetZLJWImXvYPcRZJqpvtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712049883; x=1712654683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7Po9Yg6MmTeQBUUnDRkNrPoasf1vpdU7nQiO47L4SM=;
        b=QATYi/7sNyHU7HiXBe5eHZb+m7tVH/F0Ff7dh4F07gcrM0Y+ItCfwNm9Dp1FucTWcm
         5TniOyxdS7vKrbinWcY2LNIRCd8GAbit7zJMONztiGiQ2LV2VNrVFbpX5+SRXm9EuWtq
         k22T4R7oeU8cg0i5tJahVBadbmzPzEyPSImc6XEmez6553KGDYpYpPxXji1Eo2ZMTuJf
         Xca1xpgxyctHrl/TpgP60DydFwK7y3ZDq0MtfKHbWfzvq0xd3qy1oGf+kEmZh2HbCfwY
         UkFDiofqeLdKYfqoGwF1n+y9+QTW4cYgMBkI64ERAoyVqMgG7iipH3lF1zIyiBZKocaa
         MAtA==
X-Gm-Message-State: AOJu0Yw33kWD3BlhW9XDxWXl4/AetqzSRE9a4jnUHOdMl6yzPqdylCGh
	Y7IN3Oj8BDYuiKf5GcpZZbd4iJMj9HdlzgEuqPpEsmKUEomGyX/hB7F9WAQpWlBOtW4R0pe5l6w
	Y
X-Google-Smtp-Source: AGHT+IHBJU/MGwx4ciIhhRbdxlF6mnQCueDUSAg37zCWBiRkxh5XqQZM9itwwvMcK8Dm1ybpIqQCWQ==
X-Received: by 2002:a05:6000:1acc:b0:343:3a67:85f4 with SMTP id i12-20020a0560001acc00b003433a6785f4mr9533295wry.41.1712049883285;
        Tue, 02 Apr 2024 02:24:43 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH] ap-common: Fix libvirt's git repo URL
Date: Tue,  2 Apr 2024 10:24:19 +0100
Message-Id: <20240402092419.36392-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current URL doesn't work anymore and just timeout, switch to the
new main repo URL.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I'll push that later today.
    
    Last libvirt test by osstest was on 20 February.

 ap-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ap-common b/ap-common
index 5384891b..eabb85c6 100644
--- a/ap-common
+++ b/ap-common
@@ -41,7 +41,7 @@
 : ${PUSH_TREE_FREEBSD:=$XENBITS:/home/xen/git/freebsd.git}
 : ${BASE_TREE_FREEBSD:=git://xenbits.xen.org/freebsd.git}
 
-: ${TREE_LIBVIRT:=git://libvirt.org/libvirt.git}
+: ${TREE_LIBVIRT:=https://gitlab.com/libvirt/libvirt.git}
 : ${PUSH_TREE_LIBVIRT:=$XENBITS:/home/xen/git/libvirt.git}
 : ${BASE_TREE_LIBVIRT:=git://xenbits.xen.org/libvirt.git}
 
-- 
Anthony PERARD


