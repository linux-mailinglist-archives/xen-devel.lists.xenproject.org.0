Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBBAB81B2
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984961.1370908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUPW-00054M-U4; Thu, 15 May 2025 08:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984961.1370908; Thu, 15 May 2025 08:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUPW-000528-QN; Thu, 15 May 2025 08:57:50 +0000
Received: by outflank-mailman (input) for mailman id 984961;
 Thu, 15 May 2025 08:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT6j=X7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFUPW-00051B-8W
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:57:50 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada68be8-316a-11f0-9eb6-5ba50f476ded;
 Thu, 15 May 2025 10:57:49 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5ff8f218c44so1159145a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:57:49 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5fd2b82297esm6725667a12.44.2025.05.15.01.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 01:57:48 -0700 (PDT)
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
X-Inumbo-ID: ada68be8-316a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747299469; x=1747904269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPMC2a32nfUHx7ydYxaYGIrNsdP6VcsU+I3gbxfq+8I=;
        b=j5Z8XiuQNl5LSpDts5JGvawpDW71V6cgx+Zhhku6+ausYPliSaurAwdNVV0S+CAdtz
         HZ5gvsfyS5vrwfnJW6ztCOVFymlxfSxryCTgcvpYR0N+iolk0N4XEZ4LM2eGyP5Zl0/M
         P788lNre0cxgFU8dZxdoi7L8fmgotTb02LtYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299469; x=1747904269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPMC2a32nfUHx7ydYxaYGIrNsdP6VcsU+I3gbxfq+8I=;
        b=csK25hrMutgHl3XztdzJQjt5u7om8X/lzecr2/VG1rAwatUwIzL+GIB82qe9JGETqd
         QeGneAq/Ge9JCoAGhcmT5FaFCXiO7R3EYPOpLP3Zb9V0NOQgRN/MQCsCzsf8FGeAUDMT
         wCf/rvhEmA4dr4M0e5AuNwAnFLyyycJM9WnGJK0RVFxXraSJPpdrpfGmo2f7AiKDMggM
         cvWgTn6amFOkzodjCSXPTkBH4OcARUQ7ycU3yAsOpIIzJT9U1s1qTc1/1BkSWw7pvXim
         2P+Kq00LjFMIkN3vknVZUP4tO4OnWEe3hqwIcUF/0gHkNoL0uEaj1GPp4AQvmp9NnL6u
         glYg==
X-Gm-Message-State: AOJu0Yx5MkbMnyXkkhEcTGfdD4Nn8AZF7ffWTkCcENGlkP0ZZ1SLxuOE
	U6uy11oUn0y0H+7jqCqTeAqpZkyffpFuU7DW5y9ND7qTPhPLNm6EBdjlT0sEv2Zx3F9MCaOayIh
	W
X-Gm-Gg: ASbGnct9dNkkNtK9LifrdM//o8FILVRw55yqnMj0/T0bI6dC85Qwkj7eRUcwWHnjHpT
	nkSnfIwVB4oXpjL7Ba0VBcR9qdUgTvBoZf+CgVJsGUkjZ0E5wbOTs+1GKezDIwf1C+jgB1BEMOX
	TmMYwVCMVqGVEet9OCU1tioNnQmeIXiFLzHu3VjniteZs18ENXGEo71k7etETL5Netxeb0eOmJI
	KUVfhg0qTweUlsEUPOVmcdZubo2PKwGojvazcKwOwVydxjLNch/9oCLjCK3CTpM/8VIGXd02ACo
	qwUZW5qh6CGske0HEJ0/BBDcCAqoSM9F/3R/kjJGtw3AmkfpHyzCAOo+
X-Google-Smtp-Source: AGHT+IGNC+zHkAkvn9BNql+izQ4gohj5dhZo8dIh6XaT66QGHRYD2wgVCXwWSReGHdTO4FEaD8M5rQ==
X-Received: by 2002:a05:6402:1851:b0:5ff:ef06:1c42 with SMTP id 4fb4d7f45d1cf-5ffef061f64mr714082a12.22.1747299469016;
        Thu, 15 May 2025 01:57:49 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/iommu: use rangeset_subtract() in arch_iommu_hwdom_init()
Date: Thu, 15 May 2025 10:57:46 +0200
Message-ID: <20250515085746.43498-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove an open-coded instance of rangeset_subtract().  No functional change
intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 67f025c1ec6a..0954cc49225e 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -312,14 +312,6 @@ void iommu_identity_map_teardown(struct domain *d)
     }
 }
 
-static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
-                                              void *data)
-{
-    struct rangeset *map = data;
-
-    return rangeset_remove_range(map, s, e);
-}
-
 struct handle_iomemcap {
     struct rangeset *r;
     unsigned long last;
@@ -505,7 +497,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
          * since ranges in mmio_ro_ranges are already explicitly mapped below
          * in read-only mode.
          */
-        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, map_subtract, map);
+        rc = rangeset_subtract(map, mmio_ro_ranges);
         if ( rc )
             panic("IOMMU failed to remove read-only regions: %d\n", rc);
     }
-- 
2.48.1


