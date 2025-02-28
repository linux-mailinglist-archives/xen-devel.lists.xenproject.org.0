Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E69FA49672
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 11:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898592.1307113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxI3-0002Im-R2; Fri, 28 Feb 2025 10:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898592.1307113; Fri, 28 Feb 2025 10:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxI3-0002Gf-Mj; Fri, 28 Feb 2025 10:08:19 +0000
Received: by outflank-mailman (input) for mailman id 898592;
 Fri, 28 Feb 2025 10:08:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTn8=VT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnxI2-0002GX-5J
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 10:08:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e904a557-f5bb-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 11:08:09 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-439846bc7eeso12074895e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 02:08:09 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7370372dsm50975715e9.11.2025.02.28.02.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:08:07 -0800 (PST)
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
X-Inumbo-ID: e904a557-f5bb-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740737288; x=1741342088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mysXiCURVaJn1m+2bXE7FZC1Q6z3l2z9M0EDcFgs9/E=;
        b=Y81AYisaWTzUBcM9hZVCwYdpEtD0OUNxV/DbMfUnWRJiUf7B7tD+QwJKTXDKhWtCd5
         vQY79s5r5CpSgmjX9obo8a1R0QgBpVQZ01uvEbUiiouetuU4zAwZzvAaEHX7eY5t61ki
         flkGFVMeegUpTORjwPAQbt9V7aZbaVFmpAN2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740737288; x=1741342088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mysXiCURVaJn1m+2bXE7FZC1Q6z3l2z9M0EDcFgs9/E=;
        b=uziuxHOqh0UCGePjRCgJf+kyxf77gfl8cN1mMD0PrGz9PdHd3wKW8fhe9w/mMI7rrl
         gDyxu7uXiOQ34e5rPT08H1TtbrK8HU8iQnzaOHyMSIsiaFQOwIFeN6A/48NhOMCQz5NB
         6pJG9M8H2XN3RiqmDm9oJ6SX8LAqForQRfM5dKmoLh8JGlDhYsHKHYukNL62i8wtGNj8
         D9Oh5JakIvj20uX/VAhH797HgRr6x52LBaebqPgA9iSEW4l7N/0+vFjFikER92V1HNVw
         JaQZjt3gBewTuI5nRmQR5pBI0ivFZe0gEFXsVYUcU4SmevN8rvsIWVzQqFIQ//e4/V1R
         dBKA==
X-Gm-Message-State: AOJu0YwcO15npwzTs90NrXJ357JfRMljAXUM35lVh+t2/2f7FBTZpdca
	0jeAa3iIl+uVmJRMWqYoRPakgXTLtrRXKq/a9pq3vgt51yTzr8GBP5BJkUu0mAkhlHcTQ3CNmmO
	J
X-Gm-Gg: ASbGnctMRar0WlXiV62dfrEPLOECYsZjoDHsq3XLyzoZLEr2sfXeiK+OlMDJ3plJKjf
	8vyg6siKmW9LD1Agc27+gQk0B8Y/qZa9rrDRRqA4OivMX1tCRvSyiKuSLmVT928taM7EUlVGoyA
	dBET688gzcphEdJeWRypPLPCr5CX6PRxjBJ0FdHwwAGtNtjy+bwEXLnr2Y1mByejB27pVSIsm+3
	61rxbp/bsBQy4Qu7J1xsvj8Sxhnx3eBo9EmS0ExHSIJMW6tymODuEkwfa5DCMIHLczXTfJ3Rc9c
	wazZnHK9xpaKsvKCnPXNw/2wbujnyYeoxCWoaKbP4GR3iNFuznSIyIMsE+O89vfGCNsMcOUNfRn
	SE8rS+g==
X-Google-Smtp-Source: AGHT+IHdGssnZwlXB0EFRyGEAsO3mfXBmF7aj+HxC7J4UImUXAgPbWYzGqS2RfYHvunBpaO0KxQ+Ug==
X-Received: by 2002:a05:600c:4ed4:b0:439:98ca:e3a4 with SMTP id 5b1f17b1804b1-43ba67475aamr19236225e9.19.1740737287631;
        Fri, 28 Feb 2025 02:08:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH] MISRA: Update path for bsearch devation
Date: Fri, 28 Feb 2025 10:06:04 +0000
Message-Id: <20250228100604.1955747-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This ought to have been part of the original patch, so as to avoid breaking
CI.

Fixes: 31c0d6fdf421 ("xen/bsearch: Split out of lib.h into it's own header")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1693121902
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index a28eb0ae7658..dfa5f34b3952 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -231,7 +231,7 @@ Therefore the absence of prior declarations is safe."
 
 -doc_begin="Given that bsearch and sort are defined with the attribute 'gnu_inline', it's deliberate not to have a prior declaration.
 See Section \"6.33.1 Common Function Attributes\" of \"GCC_MANUAL\" for a full explanation of gnu_inline."
--file_tag+={bsearch_sort, "^xen/include/xen/(sort|lib)\\.h$"}
+-file_tag+={bsearch_sort, "^xen/include/xen/(sort|bsearch)\\.h$"}
 -config=MC3A2.R8.4,reports+={deliberate, "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
 -doc_end
 

base-commit: 31c0d6fdf421b09327448351eb13bc4f1f40106b
-- 
2.39.5


