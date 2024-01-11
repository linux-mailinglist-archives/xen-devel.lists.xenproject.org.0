Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B2F82AE75
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666226.1036696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtsa-0005kk-NG; Thu, 11 Jan 2024 12:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666226.1036696; Thu, 11 Jan 2024 12:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtsa-0005i7-JZ; Thu, 11 Jan 2024 12:09:48 +0000
Received: by outflank-mailman (input) for mailman id 666226;
 Thu, 11 Jan 2024 12:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zprx=IV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1rNtsZ-0005i1-EH
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:09:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4efd23b4-b07a-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 13:09:45 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so3593225e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 04:09:45 -0800 (PST)
Received: from jmerino-thinkstation.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056000136200b003373fe3d345sm1073634wrz.65.2024.01.11.04.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 04:09:44 -0800 (PST)
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
X-Inumbo-ID: 4efd23b4-b07a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704974984; x=1705579784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jqEmzAOy68E/HXA1JywP9NLCSPH5WRxmr1i2yOTHL2s=;
        b=PglrARnD+WO8+JeC8neK+OM5ttzkwEq8nXfvl0oOAJE6z6TJcBQnLzbef8JVjUkmMi
         BJAz7ZtQaUdKKLN10lfrpQ9hnFo4vHBJ9ZIpnf8v479CIAMST5aAah2AkpLGdpkLYcA5
         5yxyzCcGo1C88lBF8DCc50lsNKnJHDx6L6Xwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704974984; x=1705579784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqEmzAOy68E/HXA1JywP9NLCSPH5WRxmr1i2yOTHL2s=;
        b=ddapiAHdHpV1vpJSHieQTiCcZqkT/711bm8og3MapXiznCaAxcr7MCm4+leepoyWG7
         RM50QqG18YZVejeQb86BA5wfqBSjeVciO+P+wbzk+juZMpLGynaoI/KHRfBhdD2ojbVE
         sw57zSeF2BYImDgkMmDNMm+nt/z/NAIu1IwqidDLgxkPNHoSkcUEsWaNlNQZPWbbkDj/
         14NtV3KArCfv1M7+HlZOc9woA9GSJy1otXVFjGXy8O62BagvSqa2VqVf+fMx6FkVVEjC
         fwMmcYNEZRk0jw9EbJAjG+Z/HUbPlVTgb/4CguDGFDTTQ+6uB6haOsAybnXkHbM6kIys
         P3oQ==
X-Gm-Message-State: AOJu0Yx7Z7qmlfJo4CuFeY8QXBa8lpCJHf8MgEt5z6EgLcy82x98kbLp
	Fl0XOJZkB5iX9HPWpmnVu3flPwVx8UsYWi+zuwhkflfiTE8=
X-Google-Smtp-Source: AGHT+IF2p76HBcobeb53nPA0tvCSmOboCEGRMje1nbNpocAB+y8vnGvRDFzy3dNV/Pt/gttLJEEXJg==
X-Received: by 2002:a05:600c:5409:b0:40e:550b:45d8 with SMTP id he9-20020a05600c540900b0040e550b45d8mr402511wmb.56.1704974984396;
        Thu, 11 Jan 2024 04:09:44 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Vikram Garhwal <vikram.garhwal@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen/common: Don't dereference overlay_node after checking that it is NULL
Date: Thu, 11 Jan 2024 12:09:27 +0000
Message-ID: <18b7b16d0cce886728410784a7b6063116be7e2d.1704970589.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In remove_nodes(), overlay_node is dereferenced when printing the
error message even though it is known to be NULL.  Return without
printing as an error message is already printed by the caller.

The semantic patch that spots this code is available in

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/null/deref_null.cocci?id=1f874787ed9a2d78ed59cb21d0d90ac0178eceb0

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
CC: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Julien Grall <julien@xen.org>

 xen/common/dt-overlay.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 5663a049e90a..1b197381f616 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -427,11 +427,7 @@ static int remove_nodes(const struct overlay_track *tracker)
     {
         overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
         if ( overlay_node == NULL )
-        {
-            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
-                   overlay_node->full_name);
             return -EINVAL;
-        }
 
         rc = remove_descendant_nodes_resources(overlay_node);
         if ( rc )
-- 
2.42.0


