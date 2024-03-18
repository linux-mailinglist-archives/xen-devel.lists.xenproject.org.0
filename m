Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6E87EE64
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 18:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695022.1084540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGRT-0003rJ-JX; Mon, 18 Mar 2024 17:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695022.1084540; Mon, 18 Mar 2024 17:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGRT-0003og-F1; Mon, 18 Mar 2024 17:06:31 +0000
Received: by outflank-mailman (input) for mailman id 695022;
 Mon, 18 Mar 2024 17:06:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHW-0002f9-AT
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:56:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d2c6923-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:56:12 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412e784060cso33043785e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:56:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:56:11 -0700 (PDT)
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
X-Inumbo-ID: 6d2c6923-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780972; x=1711385772; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBbVHKd33XiAFp8InfzQ2O67LvEG3SShn6jQ9u4dc00=;
        b=UbQXMy8T5/lG3/oJsZOCFhiRcKMWiuB+InpZZSD8TRPiBLAHDAvcZ+yASgz1V9aYhc
         O0asParQiz/bXyoqt9uSu09ZYFGSANlK6tvmaFA7eu/4piXMaPc7oAu/UCEjydpPfW4O
         VvFDMlxPUQNzQoGFHynQ8CNpVK7425XNq0/6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780972; x=1711385772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBbVHKd33XiAFp8InfzQ2O67LvEG3SShn6jQ9u4dc00=;
        b=TUzlozZ8VwmITNw5bu8tXCwG28YaOKpzvnZaq72L5AduQ2nVRwUX4uRnzqap0rKKDo
         sqtByOFQKRht8pd+C6vvOYMypEos5kobOoUBvRC+5zRn4Mk8gxx1u2nxsHj8YYpzw9pQ
         hBZFufdHMF9zHZhRlzLtTkq6MPuZpth8q+ycfGKr1Yz0al34kGWQRsCV9A8TRPT311Eh
         VPwtixhgEB8KcYCgq4t5HBmq+om/10MvKoP+7FlMqi9tpGdw03VnOYXuoBS6C4Tjfx+F
         DBtXVJSPz/12K6Jqsk4gdiv87xRiPzsEqIBVGuZnjy8WGg9G7HRh4mcH5thzeahhCUUi
         sEPw==
X-Gm-Message-State: AOJu0YydNKSkCxG0JiY77pS47/uep1bm+f/u09blQ9pshPCe1JQZGuWU
	XV13EDYRths3B0hLbQBzXxmCbTRivwIMRGvQ+1JhxWDoF3gxGP2/7/LIqS3WJDfVXF1nZeBE/om
	B
X-Google-Smtp-Source: AGHT+IFfh0fP08THlnhUSXWi3DRrqb/p6ND/O7OrjUcLuB0OwKT4+l4NGeM7Wx5+NVd/NrB1sz7YKw==
X-Received: by 2002:a05:600c:510a:b0:413:f3b2:d807 with SMTP id o10-20020a05600c510a00b00413f3b2d807mr183309wms.3.1710780972262;
        Mon, 18 Mar 2024 09:56:12 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 25/36] ts-leak-check: add new name for udevd workers
Date: Mon, 18 Mar 2024 16:55:34 +0000
Message-Id: <20240318165545.3898-26-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udevd on Bookworm shows as "(udev-worker)" in the process list.
Suppress them.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-leak-check | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ts-leak-check b/ts-leak-check
index f3cca8aa..023a945f 100755
--- a/ts-leak-check
+++ b/ts-leak-check
@@ -203,6 +203,7 @@ xenstore /libxl
 
 process .* udevd
 process .* .*/systemd-udevd
+process .* \(udev-worker\)
 process .* /.+/systemd-shim
 
 file /var/run/xenstored/db
-- 
Anthony PERARD


