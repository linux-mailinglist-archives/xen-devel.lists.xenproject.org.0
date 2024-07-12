Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA992F93A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 13:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757904.1167080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSE2z-0002Z1-Rv; Fri, 12 Jul 2024 11:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757904.1167080; Fri, 12 Jul 2024 11:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSE2z-0002XT-OW; Fri, 12 Jul 2024 11:02:41 +0000
Received: by outflank-mailman (input) for mailman id 757904;
 Fri, 12 Jul 2024 11:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s5ch=OM=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sSE2y-0002XL-KT
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 11:02:40 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40f7e0c3-403e-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 13:02:39 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so2094738e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 04:02:39 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb9077a9asm1235370e87.297.2024.07.12.04.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 04:02:37 -0700 (PDT)
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
X-Inumbo-ID: 40f7e0c3-403e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720782159; x=1721386959; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87DPAAbyBmLAKm4ynt726DGnnWSE+Fbpy4sTffFQKUw=;
        b=k3SkBRaWMMpRjFg3Tk7cTcc4zE2R44wOL5xwPBVbqNXNvYRf5CPyAUkXOJbxeWd8QC
         VgTmttJZqpjfKoo9a37VYARwxxv1FSsonY9pVOzmC/bxa9mSnbPyY9pt7hd+sHBfamWY
         NQuQUIUPNzh/i9uiM8f1qnywkZf1/zYcY9vVdPZPTAi3Z5iHimehpBWSHRW2IU1SB6Sv
         awFuxKMl6us7sip1pcRiMD6xh6kZGG2JdUsv5X9CxqkRFn8Dw33Wl91TULXRdZIZe3UM
         b0gf8bjuwq0Hr/8DyjnmuuomiP5snd1ZKxAObaPW++rJWt/mIvG3GaqVLV+w+G2f4gkB
         NwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720782159; x=1721386959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87DPAAbyBmLAKm4ynt726DGnnWSE+Fbpy4sTffFQKUw=;
        b=Kh3/SJ0yTlKCV00ga4iatuOrwRNbEKVj0/fAcdAk+PXUm0Ta2aVj2nCtzWta7TViFN
         mpPnQrWb6IlXcpwgYDEBG3MLFXPld92bdIT0DBUkftUnN5Jk8RSuNtmWxsLihIAi6CXb
         E3lMShnpAjP8NBog9ql3fmiQCYFLGQVu1+Z8eicn0oDcR4SWmjMV9wJY2x1NvryWEwU0
         syTXI5FHKcysb3hGJhlR0wHZ73DlCM5Bvbv3vnQvC49wxehpwIkNFNXdoj74FdvqMy2L
         tM6DIwPLpXPJoiQGDUyW5WJ3RLdXxKzgH9HkQ3YocW+O5Ij/CN1POpiknLX+8ED7dpK4
         lxAg==
X-Forwarded-Encrypted: i=1; AJvYcCUPa1LqD3+sx1PVuItTgFWD6ryNQPqL5hYAb+WHSCus94dsqNAWdUmqHiFl9IFg1XhPwpZ8vc7rf/54PNottEnGhMgKHi208FHAmvHOcf0=
X-Gm-Message-State: AOJu0Yw6gEppBUeAmgYFuw68vzmefAW34FlydvaNfuGT9NCEt2At35EN
	4DM2Mh22m77gHdNYD0AfHJD6UW3TKOCZoOC93AebCCsDpj/ted/e
X-Google-Smtp-Source: AGHT+IHoNb9jo3zc5r2b5ZN1+E6PEQXJq2jaR175xDg5jGcIkz9qmG3zee/NjIb1VzoUbFJp/vxmXw==
X-Received: by 2002:ac2:5f99:0:b0:52c:86de:cb61 with SMTP id 2adb3069b0e04-52eb9990fedmr6120031e87.10.1720782158364;
        Fri, 12 Jul 2024 04:02:38 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	edgar.iglesias@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 3/3] xen: mapcache: Fix unmapping of first entries in buckets
Date: Fri, 12 Jul 2024 13:02:30 +0200
Message-ID: <20240712110230.4098056-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712110230.4098056-1-edgar.iglesias@gmail.com>
References: <20240712110230.4098056-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This fixes the clobbering of the entry->next pointer when
unmapping the first entry in a bucket of a mapcache.

Fixes: 123acd816d ("xen: mapcache: Unmap first entries in buckets")
Reported-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-mapcache.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
index 5f23b0adbe..18ba7b1d8f 100644
--- a/hw/xen/xen-mapcache.c
+++ b/hw/xen/xen-mapcache.c
@@ -597,7 +597,17 @@ static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
         pentry->next = entry->next;
         g_free(entry);
     } else {
-        memset(entry, 0, sizeof *entry);
+        /*
+         * Invalidate mapping but keep entry->next pointing to the rest
+         * of the list.
+         *
+         * Note that lock is already zero here, otherwise we don't unmap.
+         */
+        entry->paddr_index = 0;
+        entry->vaddr_base = NULL;
+        entry->valid_mapping = NULL;
+        entry->flags = 0;
+        entry->size = 0;
     }
 }
 
-- 
2.43.0


