Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1E69D5177
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 18:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841630.1257122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEAlx-00053O-Vp; Thu, 21 Nov 2024 17:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841630.1257122; Thu, 21 Nov 2024 17:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEAlx-00050T-SQ; Thu, 21 Nov 2024 17:15:17 +0000
Received: by outflank-mailman (input) for mailman id 841630;
 Thu, 21 Nov 2024 17:15:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tEAlw-00050N-HD
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 17:15:16 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b947cb7-a82c-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 18:15:13 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cfa9979cd1so2003144a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 09:15:13 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f42d2f86sm100805166b.110.2024.11.21.09.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:15:12 -0800 (PST)
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
X-Inumbo-ID: 2b947cb7-a82c-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiOTQ3Y2I3LWE4MmMtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjA5MzEzLjkyNDI5NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732209313; x=1732814113; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf+rhY3gob46gd7mrmGyvYrcqtND5JxDHsXGngonTSI=;
        b=RGZdK50Nzo99o9FIAmLZ1Q4PHpLcCkkGBIybsa5IXlFm3g0ZYQUztvxYf+cCXaj6BC
         oOsFuP1acyb2pDEKfMF9nx7qyJbyDi4WGwx4AmATM+/bgiI+yCCWSOTs8iwnVba6jFh0
         KUVYr4HPFPCY/BOq4BQujJF4JEsHZlsfBdx68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209313; x=1732814113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf+rhY3gob46gd7mrmGyvYrcqtND5JxDHsXGngonTSI=;
        b=Zu5/HwhliJ0EtEdPl1ZQB4F+szd0a6jGKNtO5Pxq7nP7B3LPw4BQJzDBUGDWCAxAa+
         wTDj+UGgwEH4YBn+kvTiH3W9VfJ0/IwE5ELYkWEmmD9Rbjkse7jpqL+/6zEP4zdkm0Oy
         d0zPdb3ozwX4tkyChIBw1yYAU7Z5xQRCsWA6BNmH3a7ZzkHa9Mu50FYpydimHNrlYMN4
         DBf2tv+pjWXzbs26xAyuEh1/kcWMnCHjw2RQQeR22vZuszVVRi0hM16/kMNyxPbQR/gs
         ejDVhWhi/iBnkOG+BaeGBBnqjzIypEs3ZXVyZgrzV35XFuBCUhOjnyFE16g5co6njcXl
         yWBg==
X-Gm-Message-State: AOJu0YyvtU3wPiSdxoFhrxW8PRtezZc+uW4WhxqIjFXeAmCf1be9UK8P
	E7YQxuASRE1JTut1x5RTc020aTBznfHHIbhJajCA0IZUVuM4d6EKOGjhx/8W6Rfgz7uKSv+xndP
	O
X-Gm-Gg: ASbGncvnLCsZR4mj/vqG23qUFpZ4QVBoB4gV58iTeJc3FJZ2aAA5g4MbHVXoKiTsp+O
	5vCnFuhxE3Tq6OoDNBid9QlOkeZZzBFw0IHWyiKj94teQjP41JXeVKdSWsirkTPnOsJbn6OmWhe
	jDezSHurJ/OeGSVb7hmtIKZ3xz6F0zTzWsJSw4Urqg3qka4h5v95gpB/HXhPlBsleeYZqcGLZV9
	zC4BBt/GGLgzh631MwsFkLM3vSfHI/SLcLY4ppl5EkqUoLJRRokd/R+qbU=
X-Google-Smtp-Source: AGHT+IEODiv8l1AgqaimR8WrrdJD0Fg4sY2O+Xorwib649Syv1InrpPoHazPaxe7xghmhfr2In7YJg==
X-Received: by 2002:a05:6402:354d:b0:5cf:c1b2:c6ae with SMTP id 4fb4d7f45d1cf-5d007cb8018mr4193953a12.17.1732209312850;
        Thu, 21 Nov 2024 09:15:12 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pv: don't populate the GDT/LDT L3 slot at domain creation
Date: Thu, 21 Nov 2024 18:15:04 +0100
Message-ID: <20241121171504.55383-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in pv_domain_initialise() populates the L3 slot used for the
GDT/LDT, however that's not needed, since the create_perdomain_mapping() in
pv_create_gdt_ldt_l1tab() will already take care of allocating an L2 and
populating the L3 entry if not present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/pv/domain.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index d5a8564c1cbe..7aef628f55be 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -376,12 +376,6 @@ int pv_domain_initialise(struct domain *d)
          (d->arch.pv.cpuidmasks = xmemdup(&cpuidmask_defaults)) == NULL )
         goto fail;
 
-    rc = create_perdomain_mapping(d, GDT_LDT_VIRT_START,
-                                  GDT_LDT_MBYTES << (20 - PAGE_SHIFT),
-                                  NULL, NULL);
-    if ( rc )
-        goto fail;
-
     d->arch.ctxt_switch = &pv_csw;
 
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
-- 
2.46.0


