Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB409BE913
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830877.1245987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAL-0004ca-9F; Wed, 06 Nov 2024 12:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830877.1245987; Wed, 06 Nov 2024 12:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fAL-0004Wc-4A; Wed, 06 Nov 2024 12:29:41 +0000
Received: by outflank-mailman (input) for mailman id 830877;
 Wed, 06 Nov 2024 12:29:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8fAJ-0004JA-Lz
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:29:39 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9162f31-9c3a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:29:37 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c937b5169cso1540556a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:29:37 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm2737214a12.4.2024.11.06.04.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:29:35 -0800 (PST)
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
X-Inumbo-ID: c9162f31-9c3a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5MTYyZjMxLTljM2EtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk2MTc3LjEyNDk3OSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730896176; x=1731500976; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVmpTHSgje6W+FK+mwA0AzNEEu9akSw4GNptWHLi0AU=;
        b=v+1ZrkB7ugtesCaDuz9xhooq+J/lbyyKn17F9mmPD9sTAxIjrZWOggBfsyirSpBcHa
         Og3yQrpG4k+FdHrWDO87Nr8Lcnl4blhSqeiIwN5dAqKn4Xv685jkFQUfeKfSrN4HYh3a
         TRwjyJPDAEUuaLbWQOFOdUe0/bLqF4tfItIWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896176; x=1731500976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVmpTHSgje6W+FK+mwA0AzNEEu9akSw4GNptWHLi0AU=;
        b=njQeCGGioYv0AUFoN+hOeabq92CWQvXQIjvCmxj59+BqETc3/fAIhNw/SV9B2c3LrX
         rfysXIk5Kb3/j3VT4l7mpa97ax5mKNwDaA0bK6mCSpbndZEBkOeBtbWKGJ6ik0bMT+pm
         /WVaDcK8/6Y2IV5ndKHmDvf+ePZRG+oOR77RCayefpsIzGCRcYsw0GIAPdLTO/3wzkoy
         QnxihOiDdMztfIMrfeIL4jcdKUpTPGFKsKhmaUbLnCEAiqdAyGiUC4XVWWqlAysF1i5u
         /V9jNg1YaAmwY9NgroBC2WOg2Q99C1pMgsX/B+RPOMfocgpz/6dx5yRWGDfBlq5mf8rM
         MkYA==
X-Gm-Message-State: AOJu0YwrJoMTR2JS573cXg/VFT+wfhUnyYR9IETd8cokTUkKi93eQW/k
	UY3D97+oF5IW7Q4V7m4obfz8of+F5S94aYKYqEXEZxy7XOl3rmJpdWHZXBSHEXJdePLJAopgcdk
	g
X-Google-Smtp-Source: AGHT+IGWypOahahjNMwCperhYdLFPDNdZfP9EDfyRg9KmLtg0WaUKP4pjUlvv0nPncgde8ZPmp+Y3A==
X-Received: by 2002:a50:d55e:0:b0:5ce:fa33:6c56 with SMTP id 4fb4d7f45d1cf-5cefa336cbcmr564742a12.4.1730896175936;
        Wed, 06 Nov 2024 04:29:35 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/4] x86/mm: special case super page alignment detection for INVALID_MFN
Date: Wed,  6 Nov 2024 13:29:25 +0100
Message-ID: <20241106122927.26461-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106122927.26461-1-roger.pau@citrix.com>
References: <20241106122927.26461-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

INVALID_MFN is ~0, so by it having all bits as 1s it doesn't fulfill the
super-page address alignment checks for L3 and L2 entries.  Special case
INVALID_MFN so it's considered to be aligned for all slots.

This fixes a regression introduced by 0b6b51a69f4d, where the switch from 0 to
INVALID_MFN caused all super-pages to be shattered when attempting to remove
mappings by passing INVALID_MFN instead of 0.

Fixes: 0b6b51a69f4d ('xen/mm: Switch map_pages_to_xen to use MFN typesafe')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/page.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/page.h b/xen/arch/x86/include/asm/page.h
index 6970916d61d5..2fa4061dc77a 100644
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -202,7 +202,8 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
 
 /* Check if an address is aligned for a given slot level. */
 #define SLOT_IS_ALIGNED(v, m, s) \
-    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
+    IS_ALIGNED(PFN_DOWN(v) | (mfn_eq(m, INVALID_MFN) ? 0 : mfn_x(m)), \
+               (1UL << ((s) - PAGE_SHIFT)) - 1)
 #define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
 #define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
 
-- 
2.46.0


