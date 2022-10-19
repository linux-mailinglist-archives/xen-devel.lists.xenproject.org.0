Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA56049B0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 16:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425841.673915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAO6-0007OP-8J; Wed, 19 Oct 2022 14:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425841.673915; Wed, 19 Oct 2022 14:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olAO6-0007MF-5R; Wed, 19 Oct 2022 14:49:42 +0000
Received: by outflank-mailman (input) for mailman id 425841;
 Wed, 19 Oct 2022 14:49:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prF/=2U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1olAO4-0007M7-P0
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 14:49:40 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4236aa01-4fbd-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 16:49:39 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so178817wmb.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 07:49:39 -0700 (PDT)
Received: from uni.router.wind (adsl-166.109.242.226.tellas.gr.
 [109.242.226.166]) by smtp.googlemail.com with ESMTPSA id
 u11-20020a05600c210b00b003c6d0f8c377sm161260wml.7.2022.10.19.07.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 07:49:38 -0700 (PDT)
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
X-Inumbo-ID: 4236aa01-4fbd-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLhcGxMHCoOK9aYxPCTx907ASeijniOgclzPKssdW5E=;
        b=BdfSJTVWwlsKlhzxuESrSKcnelMbZdUiwTmeLYYSrInaKjK4bGdcr9ZNkwQnvO0aPT
         XbPlfxSSQRJZdWIYMVMYNqdToXfw7XtWntUmGmKbwrErb6h1Wapskejr+8ClpmPyqG3N
         cFFyi07wlYZFBgUeexPo7x3gZQqY7GQMuEZE7mf08uL7d05WLJgGNY3hYj/b0pdS2ldm
         oykPnTjahU/PR9TCfPrWXp8eb6Oi/f6Cs+uDF2SxgFjXN4IJKKuu3IoQJMVlVePRQDGF
         dskZFAJmsxta31sMSEIuMHBfoOOIh7dC8egE8NJrlz1pjIiW3OfLR+xBvowV2nR8Rsdu
         6yEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLhcGxMHCoOK9aYxPCTx907ASeijniOgclzPKssdW5E=;
        b=wl2WxSDndxJjdKXhxCB+wTJkn3bEu4d9bNst86+AWRejq8oZqOqnRdtrtFtnvfkW8o
         uN26rx8f0zGluQUEhKkOKvN3la6YhyTi2MrlpiGfzfPEoLYyVMTMfLe2YpyXIn22gVaA
         RdVpfsYCeyhs5Gzpjxl2L3b30Kq5IyqP5Vl06rG5NdTCGM+RkqCaL7YO7S1a13YwwKrJ
         b7+CNItLykR4q25PbQzO7JWbSksbhfOptKjYauNfpYESra+w5IE4ORAOiTQ/FRGpUiFh
         +qOqQdn2zHvY8rqcMc2NxeqwSrBzjJy8I/fgSKbNjxdtwcmq41WmtKMEuJbIN1cgSJwd
         idbw==
X-Gm-Message-State: ACrzQf3lpNsnpuyaFrjFlV33P9QsZ0DpKDfHvKfdT5IlXDzW+dNYAKhU
	LUaPsaDiVKGmXlTv0KLlPmBAh2lDjEA=
X-Google-Smtp-Source: AMsMyM6QERr7j5qDETkwwChgOvJNcEkwecREg4eGj2PGAR1CKin+Kt3OGADWk83T9gq1ij2V5ovJZg==
X-Received: by 2002:a05:600c:3d15:b0:3b4:8bd9:3905 with SMTP id bh21-20020a05600c3d1500b003b48bd93905mr26482553wmb.173.1666190979046;
        Wed, 19 Oct 2022 07:49:39 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Date: Wed, 19 Oct 2022 17:49:13 +0300
Message-Id: <20221019144913.291677-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the fields 'root_order' and 'sl0' of the pa_range_info for
the 52-bit pa range have the values 3 and 3, respectively.
This configuration does not match any of the valid root table configurations
for 4KB granule and t0sz 12, described in ARM DDI 0487I.a D8.2.7.

More specifically, according to ARM DDI 0487I.a D8.2.7, in order to support
the 52-bit pa size with 4KB granule, the p2m root table needs to be configured
either as a single table at level -1 or as 16 concatenated tables at level 0.
Since, currently there is not support for level -1, set the 'root_order' and
'sl0' fields of the 52-bit pa_range_info according to the second approach.

Note that the values of those fields are not used so far. This patch updates
their values only for the sake of correctness.

Fixes: 407b13a71e32 ("xen/arm: p2m don't fall over on FEAT_LPA enabled hw")
Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
- add Fixes tag
- provide a reference to the Arm Arm (paragraph + version)
- change wording in the commit log to not make assumptions on value
  interpretations that may lead to confusion
- state clearly that these values are not used so far

 xen/arch/arm/p2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index f17500ddf3..c824d62806 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2251,7 +2251,7 @@ void __init setup_virt_paging(void)
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
-        [6] = { 52,      12/*12*/,  3,          3 },
+        [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
     };
 
-- 
2.34.1


