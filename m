Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D88B9FB9
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716043.1118145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aUD-00035G-6C; Thu, 02 May 2024 17:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716043.1118145; Thu, 02 May 2024 17:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aUD-00030v-2K; Thu, 02 May 2024 17:44:49 +0000
Received: by outflank-mailman (input) for mailman id 716043;
 Thu, 02 May 2024 17:44:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aUA-0000pj-Rx
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:46 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9d5dbe9-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:45 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so55621371fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:45 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a2e8648000000b002d8744903ebsm250080ljj.68.2024.05.02.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:43 -0700 (PDT)
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
X-Inumbo-ID: a9d5dbe9-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671884; x=1715276684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThNztN9oL4lNlCs74CGjUu+Eh6PWfK8/gTCcea/eeeo=;
        b=IWZbgbC0CrS3LJPnjhxaINZlxd9qBKghXX37g/OqTUJCJcsgR7djK5jgRp+zAysiHr
         vHhy/9r7xFKQNiJkV/RfzbNMczLXDmT8yecaobw2bGobaX+8GzhX/NbclLwMeWHF0+GE
         52Zjvpch63ahHAgDwtmfxk7ZEUxiO+BE75WO5DIL+MQhmIRgnSb1xMPd1upUWVd5sUtg
         jgIhC+Hgvb3eg9KgIQXuR0ghqmHyZ3K17k400wReS7Xrh920+g7sQiRyCgYnZrFnIkRa
         +cmsCn7m0JOhPNGjJiJe8cMHv9WJxafpOjesY8S2LJ4cRCYyyrZZkvRcQZ0gTeqjxHZH
         BZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671884; x=1715276684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThNztN9oL4lNlCs74CGjUu+Eh6PWfK8/gTCcea/eeeo=;
        b=rEgQQ7MxdWj0GPWNjWAvcfCQSdTJmmMgHiUlVg85cL1vmfDWrqI0bief+YRRNZFdkb
         BKTO9AXYs91mehUZ2gw6aggJ2OFOwbqjwkIrAe7HMqf07X9snyYeY5N0fLItzqQULKxz
         UjEcbRQwm+5YCbFT3cLRhJQgSVeaPkRdpJMn27F3b0bplesct/X1QIK6K9RUMnDE8UiW
         oQ/ADMsTgFqfvQfh1R5DN6MFUXCmKFqm7k5mIuKDYb2fF41UCKfvSwNkFmbPz1My4k/9
         6wfkhf7J7KWPAsSKMf/M/8MnpHG7nRSWMR8rpCzd/z+NF3q5oMV4uV/NUdJoxSoaF/mQ
         iuIw==
X-Gm-Message-State: AOJu0YwLEvz+IfO1padooZQDADyBrHehzNfucToLvCSbtD096TzXgROW
	ONbCVE5QfohtlGCaUhq/fuaQ8ZS4j+FuJheRywmsSVq1oGbgke895tkmiCUf
X-Google-Smtp-Source: AGHT+IGIPSpDcYfIeG4Mae6HaT2hgvKQP35pzI9a9QRegeGYj/o4Trlp9ayoLwS+0VIZ78qk6JEwrQ==
X-Received: by 2002:a05:651c:105c:b0:2df:1e3e:3280 with SMTP id x28-20020a05651c105c00b002df1e3e3280mr350557ljm.28.1714671884108;
        Thu, 02 May 2024 10:44:44 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v3 8/9] xen/arm64: cache: Use the generic xen/linkage.h macros
Date: Wed,  1 May 2024 05:54:47 +0200
Message-Id: <20240501035448.964625-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/cache.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
index 9a88a2b497..66ed85f735 100644
--- a/xen/arch/arm/arm64/cache.S
+++ b/xen/arch/arm/arm64/cache.S
@@ -40,7 +40,7 @@
  *	- kaddr   - kernel address
  *	- size    - size in question
  */
-ENTRY(__flush_dcache_area)
+FUNC(__flush_dcache_area)
 	dcache_line_size x2, x3
 	add	x1, x0, x1
 	sub	x3, x2, #1
@@ -51,4 +51,4 @@ ENTRY(__flush_dcache_area)
 	b.lo	1b
 	dsb	sy
 	ret
-ENDPROC(__flush_dcache_area)
+END(__flush_dcache_area)
-- 
2.40.1


