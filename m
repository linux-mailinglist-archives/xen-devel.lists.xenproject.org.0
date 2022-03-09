Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E824D2D2D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 11:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287688.487794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtem-0007oh-Pg; Wed, 09 Mar 2022 10:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287688.487794; Wed, 09 Mar 2022 10:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRtem-0007li-Lp; Wed, 09 Mar 2022 10:35:00 +0000
Received: by outflank-mailman (input) for mailman id 287688;
 Wed, 09 Mar 2022 10:24:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYBH=TU=gmail.com=linmq006@srs-se1.protection.inumbo.net>)
 id 1nRtUv-0006pr-Ur
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 10:24:50 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2582514f-9f93-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 11:24:48 +0100 (CET)
Received: by mail-pf1-x436.google.com with SMTP id g19so1829788pfc.9
 for <xen-devel@lists.xenproject.org>; Wed, 09 Mar 2022 02:24:48 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 a38-20020a056a001d2600b004f70d5e92basm2369076pfx.34.2022.03.09.02.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 02:24:47 -0800 (PST)
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
X-Inumbo-ID: 2582514f-9f93-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Ce2OWqbOvhVGvkh9CKalayGwAHAmYG9YoQa70H7zwHk=;
        b=nhsB643oL1z7gSz9OhPKaYTp92GH9sg+/1DuFdJZk1fKbP62NAfuUgyhqycQ1FqFo+
         5rmoZlZtyivfZVAfYIzmCykCkAF7VU1tcpTtbcye+FzMNUMSpsDn1HqQQBeUEfkEWQYp
         phjIaBxXla2Fnmq5PQsLvQJ35lNRalRiFJpTO3Ize16CEx26rLuoCAWTk4XyO7syLutA
         J3tc9yg10WtAbYAUMBfgpJ+sR6FFaDtRA436mFodx2KdMVDsvM4z+cFoBv+/3JIWLk8M
         LpVMxj0oNuGCkXxkgBd9K3GEPtyHQUZeXY/NhLKujU7sDdSUUiB/QiXt1QbA8U9hCvIC
         UjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ce2OWqbOvhVGvkh9CKalayGwAHAmYG9YoQa70H7zwHk=;
        b=ipQZ++0u6xI7USPQF4NrwMOTHqO6dJdfOqcgmoStcVDR633et0KsZSdpgVEdJSysDd
         9m5nEuzR4VxCzWCH8so012w4Mrkcw3bLyXMygkQFwuRuzOs8L0SLef/nWpgSZOGINyOr
         e0Y9pMivvI1bOFDclp8e+3Y4wSukatb8bLaKUc6C4vUNBHFCJx1u0GLBEQIfuDxvBk64
         aPkfcPPtA28+QPb2GELsRPqTsUIYEkiDrcxmgH/mLTJ88fZTtkgGHMMDz6LVYV5zlxSp
         DuS8smvOtPoNFfq2Ke7p1Oms+uZyTUIXNi50dvG0mASzUJUCUloOAp3R2A3Yn2dPU/Kj
         PhLQ==
X-Gm-Message-State: AOAM531eGmV0vKp9Vg0LjWAUW6fCs3X1E5BJRUbw+TaJnHhc7q+sUQXn
	pqtRi3U9f2jRif/Tn6/xN7Y=
X-Google-Smtp-Source: ABdhPJwWk0jNGLAAdDoKZXq4XIQ1YkfcmM4HG7VGwMH/fxjxX2ftGdpC0zjfa6zFKyVMKy6b1+9O+g==
X-Received: by 2002:a63:3d48:0:b0:374:4b15:76e4 with SMTP id k69-20020a633d48000000b003744b1576e4mr17404308pga.593.1646821487378;
        Wed, 09 Mar 2022 02:24:47 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] arm/xen: Fix refcount leak in xen_dt_guest_init
Date: Wed,  9 Mar 2022 10:24:41 +0000
Message-Id: <20220309102442.14726-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1

The of_find_compatible_node() function returns a node pointer with
refcount incremented, We should use of_node_put() on it when done
Add the missing of_node_put() to release the refcount.

Fixes: 9b08aaa3199a ("ARM: XEN: Move xen_early_init() before efi_init()")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/arm/xen/enlighten.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index ec5b082f3de6..262f45f686b6 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -424,6 +424,7 @@ static void __init xen_dt_guest_init(void)
 
 	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
 		pr_err("Xen grant table region is not found\n");
+		of_node_put(xen_node);
 		return;
 	}
 	xen_grant_frames = res.start;
-- 
2.17.1


