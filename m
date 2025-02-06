Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B132AA2B2A7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 20:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883120.1293198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg7sK-0006CW-W9; Thu, 06 Feb 2025 19:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883120.1293198; Thu, 06 Feb 2025 19:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg7sK-00069n-RH; Thu, 06 Feb 2025 19:49:24 +0000
Received: by outflank-mailman (input) for mailman id 883120;
 Thu, 06 Feb 2025 19:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTF=U5=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1tg7sJ-00067O-Vq
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 19:49:23 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75dafa3d-e4c3-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 20:49:22 +0100 (CET)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-867032b0393so162420241.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 11:49:22 -0800 (PST)
Received: from gmail.com (ip190-5-140-142.intercom.com.sv. [190.5.140.142])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-866f97d8c6asm294265241.21.2025.02.06.11.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:49:20 -0800 (PST)
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
X-Inumbo-ID: 75dafa3d-e4c3-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738871361; x=1739476161; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFQm2ZHwyxo8JuKx8Z7FDry0rxBkb9nMIXnYNGZwf9o=;
        b=lGSLLgc9U+Nbho4Gc+SXQk6h7QWwC9+FFNxSi0qsKjM0mZ9rYPizwzoq42BFLyFmkr
         olHaJYQSTP6Miaec8LpdY62tJQs7NHsGCiwhwwH5uQk8Rc+10x3svNdPfnQaSibdtpJx
         VmKY4us1dcwrwmvoX/E2KD4px3g2R/ucjSYXYT2/Plri7Ng9j/7dwtb4O19aD7DD0QsD
         hjXaBYiDgmasVahNymxPZol/5Iqo6JO86FzLtQhMWR3z+oQdIFXfgBPKFJ8owtIeEoxB
         gLkLyq8Mq5aj+RutxfX3U6BdnFbYdRtsoD3WZBws9q1I45fhv21mGqJPod41lqEkzgsl
         r+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738871361; x=1739476161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFQm2ZHwyxo8JuKx8Z7FDry0rxBkb9nMIXnYNGZwf9o=;
        b=wwotgG8+YKszp67Nd17Fc+/3X85ZyB8CviltrHGrB5a9YwhhzVG0TzlTmnxCu9DauF
         gI2YG+5u7sNWtsOjuB7W0ZUXC9SkVYtrDywLGdpLnagXKHr5hSaNhqvSEnGV8moBUdxs
         AuzMzecdM4VLxa6SgXu5ynrruF5VP3RCux3TBmxm/7VhbaIET6gwcg5q2eGH/JVzECbY
         OFW9ERZep5Ox5yXdb3xroyMSIbIZHkWqIKswjVyDBTJ5fu8dgMrV8Qf8ydYO0iSDEeZe
         Ca19KvqOnEwTdt/R0y2gm3n6r9BZA8H9Yuwt2U16s1eNM7kJ+br0Jov7V/aL6MX+xpGt
         R0dg==
X-Forwarded-Encrypted: i=1; AJvYcCX3yrPPZ26O6RYyMnLkxqeml/sEm7QgWYv2GWGl7nXVmIx3xsoogiSK11ZrbpH9ydRJ4cSW8QKszR8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoV/2dbchmJqSA0lVQc0oV2pK5oW7G35q5s0wQ1YFW1SOF64r/
	+nPrB/grK9opr6Qe15/Oj4m/kDsMJMjqzpxY9JZg6XyQcSrTsjIH
X-Gm-Gg: ASbGncsgnmyZmZ+SaSs9A/0X9JE7v9viJuDGW0uvrpm9J1QPNL8CtdvDXUW/h26owYH
	FOfzagQKg5tGn+9bhCfS4XcVVu4RR4EosCqgOigkXHb2yf6UTCzPydMY/nNJkJQuYcmkySUAuSL
	Kj/oPTz+iF2LmMfJkfezHJq0Whnzi1UAFMTYhfoq+n7vJ2j0BejRgWwhXPfQ7fcO07GDnr9drRE
	Byso4TOT+xKB52sWE4ozGShfezyITHTXHVx9+ahY11xwulFuKT2xIsXPBRoQgYCIu6nN/Wn749u
	p6oD3FpauHUb9wrGNx6WuLbACLY3DWe2KfmF4MN7fPPaK8C75tyR0h8rkvUTUg==
X-Google-Smtp-Source: AGHT+IHV88cKMntCdzuDGpUdmPinFfIc/Ky9C7BHZqj5IxcpPHEM7cX9qegjV0hcK9kFR/d78G+5AA==
X-Received: by 2002:a05:6102:94e:b0:4af:f3bd:51cd with SMTP id ada2fe7eead31-4ba85eeccfbmr429451137.16.1738871361324;
        Thu, 06 Feb 2025 11:49:21 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-stable@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	olaf@aepfle.de,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 1/1] xen: No need to flush the mapcache for grants
Date: Thu,  6 Feb 2025 20:49:15 +0100
Message-ID: <20250206194915.3357743-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206194915.3357743-1-edgar.iglesias@gmail.com>
References: <20250206194915.3357743-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

On IOREQ_TYPE_INVALIDATE we need to invalidate the mapcache for regular
mappings. Since recently we started reusing the mapcache also to keep
track of grants mappings. However, there is no need to remove grant
mappings on IOREQ_TYPE_INVALIDATE requests, we shouldn't do that. So
remove the function call.

Fixes: 9ecdd4bf08 (xen: mapcache: Add support for grant mappings)
Cc: qemu-stable@nongnu.org
Reported-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-mapcache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 00bfbcc6fb..698b5c53ed 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -700,7 +700,6 @@ void xen_invalidate_map_cache(void)
     bdrv_drain_all();
 
     xen_invalidate_map_cache_single(mapcache);
-    xen_invalidate_map_cache_single(mapcache_grants);
 }
 
 static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
-- 
2.43.0


