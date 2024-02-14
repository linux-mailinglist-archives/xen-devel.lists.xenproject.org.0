Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF892854B27
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:12:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680824.1058976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFzU-00011w-W9; Wed, 14 Feb 2024 14:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680824.1058976; Wed, 14 Feb 2024 14:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raFzU-00010B-T1; Wed, 14 Feb 2024 14:12:00 +0000
Received: by outflank-mailman (input) for mailman id 680824;
 Wed, 14 Feb 2024 14:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raFzT-000105-U3
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:11:59 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03a6a007-cb43-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:11:58 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-511821e60c2so5087454e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:11:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 pa6-20020a056214480600b0068ca40389besm2276097qvb.101.2024.02.14.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 06:11:56 -0800 (PST)
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
X-Inumbo-ID: 03a6a007-cb43-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707919917; x=1708524717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCIVxdokNXSrLnsPOXEL8IpvANxXGvqRhyL2hkP1P4s=;
        b=qMS6D3NGdU924jOZsM8teCjdz0XsihA86XqIh3hGBkYrukO0o0bV7dUdmUsUsuWwqo
         okcYGj/09BkcHRZGvxCAmkMEgp/hkvUVRqeaRM8ue/uJe7rjXpDW2jZxseSSObs4L9+i
         PahWjGQoe6BbKL5OvZJhuVNbE87kHKxFdmW4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919917; x=1708524717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCIVxdokNXSrLnsPOXEL8IpvANxXGvqRhyL2hkP1P4s=;
        b=XMeXJVEKEW5b5W7JeS2k94qfrfxS1QfHBS+MWeymjvCckEWVf+ky6EI7H3zsoNchoH
         xqtoBr6UvejleUSiZNnvnfm74bJF2xfFmTO665QmjxVDlfyMr+AxCtP8mgOXbETU7vBW
         RUNYdub81z2PrzR9grIojWHM1kkIMAx1XmBUlo+S5IXKsakZN0FER8eVdWIbJ3Nu6rMU
         IL0RG0qdGxTyUWq8sy2F9UP8djZ5YL1rFhi1Pn/b5d7YJwjxKjtUMyj8aMEWp9aRiS1S
         55BKoc7eLIVGuGO9E80qU7HmPkeHnQBHB9IqnRexd0apljT7JlTCoR7PhKo0lUmwbhWI
         jGlw==
X-Gm-Message-State: AOJu0Yw+ukDECB1dQhqYPscpp6g2mDtk7avVy9uCBvHch6F7hF9vUP7x
	KycwJyTzOdWkYpGcy+Y5NXO8mnb4Kikd3TdQDb5P7xiJGrPkCSjkXcKdBzjub7TgtZkD0wr2wwR
	o
X-Google-Smtp-Source: AGHT+IG8hwFfJ0slL4KEWZFWJ0kTzDzauVvaUmHlAl9WH66eSLFsrN3Zx3/gd3dbEVol7fa3MC5t3g==
X-Received: by 2002:a05:6512:3444:b0:511:a100:b30d with SMTP id j4-20020a056512344400b00511a100b30dmr1751915lfr.56.1707919916870;
        Wed, 14 Feb 2024 06:11:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHINi5l0kFrPuwrx9PFTumxxwpHs7i+OrAvFfe4Z/7BOomKgJCRdDI8LtSZ7TPVzqPU2BsmnbLz09HQ6qPXYGOUptNHRqyBBhZsZU5zVFKsmDfGNHQRF4vX3PLeQm0M0qAeulnMxRfTEl/zNWRtlHrBkOWsoHJ31N4ijFP9jKa9N1kdUit6H0P7UWz7ujZYkoqe0Q3lh4e3PvsVFI4C33Seoh//zsnYSAH2hje88maJ3pAo29lUH8/MnUBU3rLeNkTQtbEBAzuXvt0RA==
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 5/5] mm: add the __must_check attribute to {gfn,mfn,dfn}_add()
Date: Wed, 14 Feb 2024 15:11:37 +0100
Message-ID: <20240214141137.17787-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-6-roger.pau@citrix.com>
References: <20240214103741.16189-6-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's not obvious from just the function name whether the incremented value will
be stored in the parameter, or returned to the caller.  That has leads to bugs
in the past as callers may assume the incremented value is stored in the
parameter.

Add the __must_check attribute to the function to easily spot callers that
don't consume the returned value, which signals an error in the caller logic.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes since v1:
 - Also add attribute to dfn_add().
---
 xen/include/xen/iommu.h    | 2 +-
 xen/include/xen/mm-frame.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 7aa6a7720977..9621459c63ee 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -42,7 +42,7 @@ TYPE_SAFE(uint64_t, dfn);
 #undef dfn_x
 #endif
 
-static inline dfn_t dfn_add(dfn_t dfn, unsigned long i)
+static inline dfn_t __must_check dfn_add(dfn_t dfn, unsigned long i)
 {
     return _dfn(dfn_x(dfn) + i);
 }
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index 922ae418807a..c25e836f255a 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -23,7 +23,7 @@ TYPE_SAFE(unsigned long, mfn);
 #undef mfn_x
 #endif
 
-static inline mfn_t mfn_add(mfn_t mfn, unsigned long i)
+static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
 {
     return _mfn(mfn_x(mfn) + i);
 }
@@ -62,7 +62,7 @@ TYPE_SAFE(unsigned long, gfn);
 #undef gfn_x
 #endif
 
-static inline gfn_t gfn_add(gfn_t gfn, unsigned long i)
+static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
 {
     return _gfn(gfn_x(gfn) + i);
 }
-- 
2.43.0


