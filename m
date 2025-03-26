Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E9A71B14
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 16:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928039.1330800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txT2N-00062N-Fd; Wed, 26 Mar 2025 15:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928039.1330800; Wed, 26 Mar 2025 15:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txT2N-00060F-D4; Wed, 26 Mar 2025 15:51:27 +0000
Received: by outflank-mailman (input) for mailman id 928039;
 Wed, 26 Mar 2025 15:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16MU=WN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1txT2L-000609-HB
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 15:51:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb96f21-0a5a-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 16:51:24 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so6735045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 08:51:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9ef23esm17076793f8f.81.2025.03.26.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 08:51:23 -0700 (PDT)
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
X-Inumbo-ID: 2bb96f21-0a5a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743004284; x=1743609084; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKijxke+AzpWn/noJtkVwwHiLuyFBHz6vFTC2DadQ2M=;
        b=MiRptaj6nyzweGXS0ubrbF/8FOwzTg5totStpyzPx1q5CFLyLWvPDEUlkw3LH5njSc
         n2uZd6BW+JNTiPv9U8nULCrB0BfHSFyo1nZYBYv6jquw0ivvpHSto/hscnamZQLc00g5
         1+6BVLqe7UKVSWjtjUvE8jt/8ql3oGiNgWlk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743004284; x=1743609084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKijxke+AzpWn/noJtkVwwHiLuyFBHz6vFTC2DadQ2M=;
        b=B8/zXnlQJpEVenMCC0W62YblqvfllYcIhw/eODH6R/1L4hXeOYjJGOGqJrZ7IIm6Ol
         IdSRvWDrlOY3y+FQqMub5vanYhJxWhTRITmOG/nqXpoXrMIJdPydW763Zzfj9l7tR/0y
         wSz8HobWr+ZElSeMTYujflwh31ncGuWlyFkKBmGupqJMpDPwOMM9i+7bnlclrJxVGvIF
         WjHNeLaaLhy8BBR+K6EtQHaq6/XvWZSLm9PlQpRKgCHuaytrvZGljSYS74KYkzEfwnLY
         1Cf/dbAyXVypGNbQxHUXEwXZ3SVDCXoCc++OP0zC5UHD11XHgSucZltOi9SKAwoOO9nM
         JzMg==
X-Gm-Message-State: AOJu0YzrVawagHyMAzUpI4o9tFN+WTj7m+uXNNcMJKLGdX40BH4Nd1ya
	2TXsQ7z46qsuALIKUcJOF3F2c+P+57oJLI2u8J03QXku4J6/MqO5WEriF+lbuoQ0sHF6jzAffJg
	vtdE=
X-Gm-Gg: ASbGncsLrc+8bcTyfSo3LuT+UPpWKE5LNgeyI3ZqNuuyBhUzWnDlJVzrWZYCWkx6AzN
	KBW80NKlhmqRa3CDsrKVEs7u5bcDfUuHmyKUlzRk4LmUQaQtrlfZB75oCwC0ckmLGGkOxRjR2dE
	S1DU/lVjJNwPnuBx0+R67ycNnGX2W9OOb5MuVOWXfKX1L4Me9jfGG+BYYRhi6O5Y1K7oWqOkncf
	RXontjhudpXlCQ1XqYeiNFwNOqP0lxNY/LpjRZ+fFln92Dc/rKfafRFViLvkBUN0fzn+6cnpy4o
	2r5f3Ouwp8fnPTzQbq3OJ4OxGiQomayXnV5LhrARWFTzvPcr/qGLcRQkKfp3K/8kQ2eQD1E+UaE
	FVJi/9inOOqyO+/EMxg==
X-Google-Smtp-Source: AGHT+IFlTNkdKsVI29te81xBexb3cl6+MmL7h4BMYQCLGUeF6htMKF1fxWFoqnR3D2YelCt7eAQhqg==
X-Received: by 2002:a05:600c:6c9:b0:439:91c7:895a with SMTP id 5b1f17b1804b1-43d775be4b3mr29222435e9.7.1743004283672;
        Wed, 26 Mar 2025 08:51:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] ARM/vgic: Fix out-of-bounds accesses in vgic_mmio_write_sgir()
Date: Wed, 26 Mar 2025 15:51:21 +0000
Message-Id: <20250326155121.364658-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch() statement is over bits 24:25 (unshifted) of the guest provided
value.  This makes case 0x3: dead, and not an implementation of the 4th
possible state.

A guest which writes (3<<24)|(ff<<16) to this register will skip the early
exit, then enter bitmap_for_each() with targets not bound by nr_vcpus.

If the guest has fewer than 8 vCPUs, bitmap_for_each() will read off the end
of d->vcpu[] and use the resulting vcpu pointer to ultimately derive irq, and
perform an out-of-bounds write.

Fix this by changing case 0x3 to default.

Fixes: 08c688ca6422 ("ARM: new VGIC: Add SGIR register handler")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

This vgic driver is explicity not security supported, hence no XSA.
---
 xen/arch/arm/vgic/vgic-mmio-v2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
index 670b335db2c3..7d1391ac9b48 100644
--- a/xen/arch/arm/vgic/vgic-mmio-v2.c
+++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
@@ -104,7 +104,8 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
     case GICD_SGI_TARGET_SELF:                    /* this very vCPU only */
         targets = (1U << source_vcpu->vcpu_id);
         break;
-    case 0x3:                                     /* reserved */
+
+    default:
         return;
     }
 
-- 
2.39.5


