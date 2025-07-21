Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8775EB0BFAF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051220.1419534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUY-0005wW-8K; Mon, 21 Jul 2025 09:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051220.1419534; Mon, 21 Jul 2025 09:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUY-0005u6-5O; Mon, 21 Jul 2025 09:07:26 +0000
Received: by outflank-mailman (input) for mailman id 1051220;
 Mon, 21 Jul 2025 09:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udmUW-0005SY-EB
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:07:24 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d4557f9-6612-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:07:23 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3067793f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:07:23 -0700 (PDT)
Received: from localhost.localdomain (111.142.125.91.dyn.plus.net.
 [91.125.142.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f4289sm153796045e9.7.2025.07.21.02.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:07:22 -0700 (PDT)
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
X-Inumbo-ID: 1d4557f9-6612-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753088843; x=1753693643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGE0BY2I60CMSWsB7J7S4Oe8vIKtCSaYVqkBiZL78LA=;
        b=NwhpVFGDYYiqXWAnW//vdgYsrTAclwHYWDQc4673pSU9VzeJxc/xHwAMnAGE/UqxCk
         42XYrUqCRWOMzhlvdxwHjZqXSVwY5Iuu3OU/utliyxhImSvssY3gKwbnUGLGqaKpP38j
         0sZOVu1P0gXm6gqSWosl7xrL1Aj75JXVKFBmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088843; x=1753693643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGE0BY2I60CMSWsB7J7S4Oe8vIKtCSaYVqkBiZL78LA=;
        b=pbFpaq5Tv/Hwgb8JxcBpF2fet5/rF0W/nYAT6PkjftC+fk/rpnRclqLSQoyPS2d6FQ
         g+CYo+sniXGQLnLC08UuzR50lBNB920rK0gL4CZ/ZhQsTsPQesdg+UFelsOkx2EumYCM
         /JwTUqTo6Z8WC5hH1EHrX1Fpe8O8U3YS4TNOehWri/KAuiQxCmeGY2WaDBCOgZOZO6tb
         LIdnXCXwzbxjmvxBLWx5lVekDovbvmU+bkQ/MO3+zMRwvXgAICJDnSVPSOyTnSxKEYyN
         H+oiXEYFF7cIkNJIBWutzbNV2KXOcSz+lR2B2COjAg+wFM2m+cINx4TaGC+txgycxxfi
         RrMQ==
X-Gm-Message-State: AOJu0YyshWyuFcOMcebnjqT5crKIYo/X+uuMrCwV0aTWi31dLFfmOJmC
	DxaMAhLDfQkcm/4J6HRtThoIzrNeUQSqUyckzj5A4bd9lqByBaTd1cMtrZLP/eC+jcOGsz6hyML
	7Syha5oU=
X-Gm-Gg: ASbGnct1eFi7yggfSFnPeEY80mUuEl847PuDCY1mjv9AOHHB3QgVW6PyaY1FoqhlCxB
	rseNntf1KSkIu06bWH5uHzRtcqt119CYQ+lTZn+LhiGpS0jLu59QqfxCYwNx6Pl6v0vu29GJN9p
	UKIJGJTvxQAcVs6/9vPvutDk22B0EZSvtdbMH9Y21LXUE9EjH6EZ08Cn0BJ6wgU+j3DvDIHyQrD
	DMxki7epDJiyEB9K84oGFrEhnTl9PleQ9n6enMRPLQdQFUmmKrUvKZTPJM5cDz4qzc6H2rKd2EC
	7MIZQhuQkZyx7tlg8o/txqoGjgCOZCeJEsIXObq31E93yOj4xVjLkiGODxRt7KTNmDBGOv0LR+j
	ZXISvl7OCeBicxclmSYGCc+y2sVSXiuP1QJZqVMEnzckZaARItCx+zGqab1hBC/37shWxy0I=
X-Google-Smtp-Source: AGHT+IHyUYeF1AUcX/Jdr8QYJ+tpSD4EhR4L6RAmNSWUbXzn9M+TUgsUR+tVxnamsHkb4f6Xz2vLvw==
X-Received: by 2002:a05:6000:440e:b0:3b6:cdd:a41f with SMTP id ffacd0b85a97d-3b619b9f043mr6895536f8f.4.1753088842739;
        Mon, 21 Jul 2025 02:07:22 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/efi: Do not pass dummy pointer for empty property
Date: Mon, 21 Jul 2025 10:07:11 +0100
Message-ID: <20250721090713.414324-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721090713.414324-1-frediano.ziglio@cloud.com>
References: <20250721090713.414324-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to pass a buffer, the property is empty.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/arm/efi/efi-boot.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6323db547b..f61fb24f0f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -61,7 +61,6 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
     int node;
     const struct fdt_property *prop;
     int len;
-    uint32_t val;
 
     if ( !fdt || !addr_cells || !size_cells )
         return -1;
@@ -103,8 +102,7 @@ static int __init setup_chosen_node(void *fdt, int *addr_cells, int *size_cells)
     prop = fdt_get_property(fdt, node, "ranges", &len);
     if ( !prop )
     {
-        val = cpu_to_fdt32(0);
-        if ( fdt_setprop(fdt, node, "ranges", &val, 0) )
+        if ( fdt_setprop(fdt, node, "ranges", NULL, 0) )
             return -1;
     }
     else if ( fdt32_to_cpu(prop->len) )
-- 
2.43.0


