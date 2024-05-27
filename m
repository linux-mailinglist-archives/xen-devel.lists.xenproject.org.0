Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B18D00AE
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730725.1135913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZwY-0005dW-NW; Mon, 27 May 2024 12:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730725.1135913; Mon, 27 May 2024 12:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZwY-0005bR-Kx; Mon, 27 May 2024 12:59:14 +0000
Received: by outflank-mailman (input) for mailman id 730725;
 Mon, 27 May 2024 12:55:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WtIC=M6=gmail.com=yskelg@srs-se1.protection.inumbo.net>)
 id 1sBZsz-0004Tb-KA
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:55:33 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 667be261-1c28-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 14:55:32 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1f44b4404dfso21862055ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:55:32 -0700 (PDT)
Received: from paran-QEMU-Virtual-Machine.. ([118.32.98.101])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c757845sm60382005ad.5.2024.05.27.05.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 05:55:30 -0700 (PDT)
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
X-Inumbo-ID: 667be261-1c28-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716814531; x=1717419331; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pMe2OjnAw9DOpVmn/tQbHcQU5IfzyQdTOAHTtCD7gi8=;
        b=FvS2KSZd7lE/ejf3q/peyRA7xt55tW0gw5w+/3UNtK89gxHuSZNpXFJkLKXpXaK9fi
         ktL9zEVoSbPLHDmJ5BXwPKIMBnYy5iyaxrAPBmxjYHwndXvRE9YTKdxT6YFN4OhnErxT
         /YF58gf766seTiVIcHcX6CjQ86hJ/wy1+Oh311YQpPh6Ux2x6DOzZErKMJKdSJLE8ll/
         a5LQ1aopzkXQVoWWvU0r4NWZ1jhoXwHOJHKIRvUPCZVgnihQMpPXQhCPH5Yvj404sNzh
         vh6S8KG31/sjldYsYLRAqQP6fco35EsmLnJK2HPZjGwT0S/H+7mLyJS1EHodpNFUF6Ze
         6Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814531; x=1717419331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMe2OjnAw9DOpVmn/tQbHcQU5IfzyQdTOAHTtCD7gi8=;
        b=qfyIdZHWIHwwNWZi/PC/+3GSBBiLBj2yapXaGjbIhtinUghHCeRDxH46RutvvhLs9X
         ltP6ayIJv5v4G+Civ/7KAnn1Uza/02ik4u2ZRU8TYgxt5WhD7F9eYHxqnGKMTYMvN9wd
         7HXnD9Eh6Cv+DpijMEp91HbMh8dCqdPNT1DOr5LyEX9PDpgFI40n6G+IIsxokxRJqHL8
         2dLId82mBH8Rg7uxmLKii+jXo6YgB33mV/iank/KOBvsmQ70lJoVYIVpdDyxLch8I2/f
         bYO92sElmrg1CjFA6EKGTRbZuY/RfJM3l1SmKSLoOVQlKTvHkeOxkiU1UfgBZkeeYlrz
         M5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjJTPbPXKbmBfN2fgR96nQgGBGjt/R8yrxKwkwu+pul6at4iSs416vqxaQEjgnbnQiKVAQV0+Lr1Ani+ozS+t20OL68sr96E7N1SJ8Q98=
X-Gm-Message-State: AOJu0YwekmPCPnQd+jpcgqMX9BToHLXvEKHfmD/anv2Wq237joqbeev6
	LzmcVvdudphT9lbZZfmhPDEdHu+DtfyXniPY4aXf5wmciXvbkpMmcztQMzuXMaI=
X-Google-Smtp-Source: AGHT+IEvCWcm6q+tC3X0xxKR+wWh5xFppmrVISfccNDFu9TXeDUUje3ns00KN5KoFpXURDLsUc3FBA==
X-Received: by 2002:a17:902:d50c:b0:1f4:b313:3e9a with SMTP id d9443c01a7336-1f4b3134380mr10896515ad.65.1716814530796;
        Mon, 27 May 2024 05:55:30 -0700 (PDT)
From: yskelg@gmail.com
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Anthony PERARD <anthony@xenproject.org>
Cc: Austin Kim <austindh.kim@gmail.com>,
	shjy180909@gmail.com,
	xen-devel@lists.xenproject.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: [PATCH] loadpolicy: Verifies memory allocation during policy loading
Date: Mon, 27 May 2024 21:54:39 +0900
Message-Id: <20240527125438.66349-1-yskelg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunseong Kim <yskelg@gmail.com>

memory allocation failure handling in the loadpolicy module.

Signed-off-by: Yunseong Kim <yskelg@gmail.com>
---
 tools/flask/utils/loadpolicy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/flask/utils/loadpolicy.c b/tools/flask/utils/loadpolicy.c
index 76710a256c..7f6bab4dcd 100644
--- a/tools/flask/utils/loadpolicy.c
+++ b/tools/flask/utils/loadpolicy.c
@@ -58,6 +58,11 @@ int main (int argCnt, const char *args[])
     }
 
     polMemCp = malloc(info.st_size);
+    if (!polMemCp) {
+        fprintf(stderr, "Error occurred allocating %ld bytes\n", info.st_size);
+        ret = -ENOMEM;
+        goto cleanup;
+    }
 
 #ifdef USE_MMAP
     polMem = mmap(NULL, info.st_size, PROT_READ, MAP_SHARED, polFd, 0);
-- 
2.34.1


