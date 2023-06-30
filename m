Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07809743C17
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 14:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557469.870819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDUx-00011R-0Z; Fri, 30 Jun 2023 12:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557469.870819; Fri, 30 Jun 2023 12:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFDUw-0000zd-TW; Fri, 30 Jun 2023 12:45:14 +0000
Received: by outflank-mailman (input) for mailman id 557469;
 Fri, 30 Jun 2023 12:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SFwN=CS=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1qFDUw-0000zX-9U
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 12:45:14 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f377f3d7-1743-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 14:45:11 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6b98ac328so28620101fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 05:45:11 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b0051bc5adc942sm6764228edr.47.2023.06.30.05.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 05:45:09 -0700 (PDT)
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
X-Inumbo-ID: f377f3d7-1743-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688129110; x=1690721110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ssIMFi+Cwpk5ibnAzvwYrHw8OEVfsjlxBGgx0vOlb8=;
        b=UOmV4OJx98s+khNJeQuSZU5GFGU3UZH3AQVF86bfzvDBaKrB64Z8jSr/epXr9YzqvD
         jLY5Opi7N7pLLMv145uSGic4hNEScADHd/D3759jPzSqdG5sUQJgjhMpcbYkjedfXXvU
         P7dc90J7ffuZjW79nOFC7+EVqWE/d7ZYIEhB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688129110; x=1690721110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ssIMFi+Cwpk5ibnAzvwYrHw8OEVfsjlxBGgx0vOlb8=;
        b=WDM0+pG+TeX/UQl0Gz0vZ8TINhvf4LS+Q41F9PMrnljEB3CRJo/JINP5Cu4Kh4ryk8
         GgZhe0S+/B9Pja4MfuSPp7wTNf1G396cIBMhaiY1WtJ4rPGpqb02qinU8W2q4K+xfWg1
         JqTtx+rwVN5FdZJylIm/VrY19i6X01dl/8iawpdosQ3pwZN3mnHwNn7RVr0MZFC4CXUl
         2HbUiGSDAx3UAP5AydYfwiolbAFg5Ms2bl77MHeS2/V0ehuRkOoPuoPPYLsCkvXyzUtp
         4fqgbRwa1MOi/7efdfRCeP/ootrWbl1Us/N8PnsdhYLib5izgf0C4Fl0Ji7Lhg1/D3IP
         35kw==
X-Gm-Message-State: ABy/qLZISNtbHHUf/lWYGcic2yfvoTaN+tpFo0GFQHaN3peE84gvQDbh
	f6cteFYXqc2gqzdcPT3nhv9vK8L6R5Sk08vB6lE=
X-Google-Smtp-Source: APBJJlHGEAJDIMIF6bmp51y1IWmMoXXdWj8/b8meKg2q6fHe0OqTjsDzjFl/V5AbZpqdnIg1xmfLhg==
X-Received: by 2002:a05:651c:1030:b0:2b6:cb55:72bc with SMTP id w16-20020a05651c103000b002b6cb5572bcmr2064080ljm.1.1688129110341;
        Fri, 30 Jun 2023 05:45:10 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] {x86,arm}/mm.c: Make populate_pt_range __init
Date: Fri, 30 Jun 2023 13:45:09 +0100
Message-Id: <20230630124509.730368-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Dunlap <george.dunlap@citrix.com>

It's only called from another __init function.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
This is a random patch I found in a branch named "xsa345-post".

CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/arch/arm/mm.c | 2 +-
 xen/arch/x86/mm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0a3e1f3b64..9b14ae3a5d 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1218,7 +1218,7 @@ int map_pages_to_xen(unsigned long virt,
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
 }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 9741d28cbc..be2b10a391 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5574,7 +5574,7 @@ int map_pages_to_xen(
     return rc;
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 {
     return map_pages_to_xen(virt, INVALID_MFN, nr_mfns, MAP_SMALL_PAGES);
 }
-- 
2.25.1


