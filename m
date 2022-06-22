Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CF0554EE1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354109.581163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4254-000853-A3; Wed, 22 Jun 2022 15:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354109.581163; Wed, 22 Jun 2022 15:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4254-00081s-6G; Wed, 22 Jun 2022 15:15:46 +0000
Received: by outflank-mailman (input) for mailman id 354109;
 Wed, 22 Jun 2022 15:15:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1Wy=W5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o4251-0007QM-QV
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:15:43 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ed96df5-f23e-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 17:15:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id i10so20114966wrc.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 08:15:43 -0700 (PDT)
Received: from uni.. (adsl-190.37.6.169.tellas.gr. [37.6.169.190])
 by smtp.googlemail.com with ESMTPSA id
 p11-20020a05600c418b00b00397342e3830sm5069392wmh.0.2022.06.22.08.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:15:42 -0700 (PDT)
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
X-Inumbo-ID: 2ed96df5-f23e-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pe0g9vWBoGbc+/wjs3IU5tAcrtZcaGO81zzEoJh9BPY=;
        b=gGw2UQYNssdj+LHFT8xisyLYmdTartswWmM+e/orWJke4chV7yMYBPQ2yt6pvAypaM
         uINsXC/1TNlh58gzYVdoMwgOt5dBg/5k1hCW/ELCy0ROp6jMKar5HWBNgpXbq4dl/4dw
         njA/sZw76GR7NkXrZ3i2zaNWfeSBGXska3K9nEOXBIluXc0A0nAO4f3nbG4oayz+w/lh
         8X8lBh5tTkkFn0ESBF8k1F5YGDmNkd8LNxh7uADYzp3atbEyw8AtxSggAGm5xJgY7i86
         iRTTb79OXwR3cVtBotvITNX6S6O564AyxTG+pTgJYqX2QnRv1xTUYVIXIT6EatiCyihb
         450g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pe0g9vWBoGbc+/wjs3IU5tAcrtZcaGO81zzEoJh9BPY=;
        b=r2749/l/I+lHgXEytv+vWK06CD4t+yIHIpOTlXdZp5aw19RK3hx2tiyV/HepoBKNfk
         s0x/Bf2D60pTPnyqqgueMlTeYCG0U53y7KpE7RPukDSgnLp/zPwaZzmjq9WW/v2Fdj8Y
         4Z9YXvZJz8c2AigmruLMKP1cPxPh/ITDmozRqFAY/TLubAkbhfXc7rDQBl5vK4dcW358
         c1i6aakERyx7FdXv9t2mm6hM124RMV0wOdYjPaoNe51N+IOltY9bDsppoKgy1cgt1d4F
         9tGQMQFusir3z9rVki3COOIlFlfKS2rfI0LUFdj92ZQtjHuCHhBmWq9BrAYicurUkO+P
         d1sw==
X-Gm-Message-State: AJIora+ojW3TT3T84vfVh9BhkZFi273LoAtN7P05uZfA4PAF1/jM4Pt2
	BchdoEM2LV74pRmpzlDBQ7k2PLViHUg=
X-Google-Smtp-Source: AGRyM1tcEnRk4inWSyUF/ep4dXgy96YZkhbfT5/xXOvK891+8HXFldu7hLcevIUbAXhFmUli2LAaNw==
X-Received: by 2002:a5d:59a6:0:b0:21b:a234:8314 with SMTP id p6-20020a5d59a6000000b0021ba2348314mr2916996wrr.316.1655910942507;
        Wed, 22 Jun 2022 08:15:42 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] xen/common: gunzip: Fix MISRA C 2012 Rule 8.4 violation
Date: Wed, 22 Jun 2022 18:15:14 +0300
Message-Id: <20220622151514.545850-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622151514.545850-1-burzalodowa@gmail.com>
References: <20220622151514.545850-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include header <xen/gunzip.h> so that the declarations of functions gzip_check()
and perform_gunzip(), which have external linkage, are visible before the
function definitions.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/common/gunzip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index b9ecc17e44..aa16fec4bb 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -1,4 +1,5 @@
 #include <xen/errno.h>
+#include <xen/gunzip.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
-- 
2.34.1


