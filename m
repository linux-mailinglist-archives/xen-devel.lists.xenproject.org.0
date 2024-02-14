Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7F8548A1
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680621.1058676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeP-0006WU-3w; Wed, 14 Feb 2024 11:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680621.1058676; Wed, 14 Feb 2024 11:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeP-0006Tq-01; Wed, 14 Feb 2024 11:42:05 +0000
Received: by outflank-mailman (input) for mailman id 680621;
 Wed, 14 Feb 2024 11:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeN-0005Pc-1p
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:42:03 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11f41b25-cb2e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:42:02 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso63429811fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:42:02 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t27-20020a05620a035b00b00785367e5a93sm3725905qkm.77.2024.02.14.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:42:01 -0800 (PST)
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
X-Inumbo-ID: 11f41b25-cb2e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910921; x=1708515721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbHWtGQxe+lF1Oh/RMVx/RWGcnqoQ1bvQB9vtnF0JLs=;
        b=EYpQ//rDxIqwy1B+4GD0x8hPSRnVtDTLHzBFTJ2Hnx5DJNTCU9yFTcH4C1thxsqL6a
         W4SRlMeEmgwD1Mhyu/N0Nq4UqaD672Yf0Ajev47TOmgsd8iHmTEtSg+o33jgDcLud5DU
         4n9Wa2knLdio+MxODqUcvz/LU7NHkt5UnHL2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910921; x=1708515721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbHWtGQxe+lF1Oh/RMVx/RWGcnqoQ1bvQB9vtnF0JLs=;
        b=mKVgHBj5O+Cj9CtuHET/JOD7OQyhhCCvUUIBefapmqvqH6Abp3r7Fo5fCNJWLDfLTC
         Kvvh97/D5IXSSAQJcspcTCpxkD3IKLyWx1REP1j8vAOUt26ElA21ibfDLJ4+BAWKDN7d
         Ba6mpFct3wro5GiPIxje7kSjJaDlhJhxKYavvdu1qwUBzJ6dTiKPOCvBKwHfx8VzplxL
         NCj5/5/oYyFYd+XfIx/jjIk0OsXtHBRkoFIuYVHg/1J1YhqDQbchg9ZNLcqQZI1qjqCp
         Q6wFcX6pHczbyeL/2QDS6yl7WCcorbnnPwOtA35X3nnX78ZlEK2dqj/RKCEfNxcqTL0z
         z53g==
X-Gm-Message-State: AOJu0Yz/LRmKR4oVSN5pQ3YcAyR9lkgNnjwXYHMWaJWo+4c7wTpi5qGk
	PdnTQMKSAaFYvnSNxgw+zMBCEmUBNt46c87Dw20esoaRgbeWychd9CXPlIJETwb7rKTg3WdL73K
	C
X-Google-Smtp-Source: AGHT+IGit4GnXlDQsJF49FMFMw89YetTn+GHy8FchTC0tzsg9sECFBGs3fbenu35rI3rLBMV31tpzA==
X-Received: by 2002:a05:651c:151:b0:2d0:f8d7:a91c with SMTP id c17-20020a05651c015100b002d0f8d7a91cmr1741911ljd.52.1707910921603;
        Wed, 14 Feb 2024 03:42:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIoLUKXv+O3lO+DQm8w35xbRtpWa1TiHlLqcDtv8HdUSV3S5HOln3aAlDvmfHXGpKEXTs7ptD7YkFg0uKVcLfTuoxR2AZ6VnQO3W3/WF61dzMvtunXuzIzsKFv35Xl+m2yov/Lms2Klb44
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 4/5] iommu/x86: print page type in IVMD/RMRR check in case of error
Date: Wed, 14 Feb 2024 11:37:40 +0100
Message-ID: <20240214103741.16189-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-1-roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provide more information in case the page can't be converted, and print the
original type(s).

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index e713cf803e8a..217409c29644 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -827,8 +827,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
                      RAM_TYPE_UNUSABLE) )
             continue;
 
-        printk(XENLOG_ERR "%s: page at %#lx can't be converted\n",
-               prefix, paddr_to_pfn(addr));
+        printk(XENLOG_ERR "%s: page at %#lx can't be converted (type %#x)\n",
+               prefix, paddr_to_pfn(addr), type);
         return false;
     }
 
-- 
2.43.0


