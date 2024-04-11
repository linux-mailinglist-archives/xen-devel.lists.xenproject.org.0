Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D838A1971
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 18:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704068.1100193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwz5-0007Rr-84; Thu, 11 Apr 2024 16:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704068.1100193; Thu, 11 Apr 2024 16:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwz5-0007Q3-5A; Thu, 11 Apr 2024 16:09:07 +0000
Received: by outflank-mailman (input) for mailman id 704068;
 Thu, 11 Apr 2024 16:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Poi8=LQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruwz3-0007Px-Pp
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 16:09:05 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0fd20ae-f81d-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 18:09:04 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-6962e6fbf60so320596d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 09:09:04 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 k10-20020ad4450a000000b0069b4e14fc28sm762332qvu.9.2024.04.11.09.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 09:09:02 -0700 (PDT)
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
X-Inumbo-ID: d0fd20ae-f81d-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712851743; x=1713456543; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cI7sdKD5FmgcXnDnQmTGZKEG+ARXSt1G7DPgTc+R7UM=;
        b=TH4vGKQ6P0J82vRZdz0e4QzQ3ImDkv6DerwEqvnQT0ox/DplbMx0kgbf3MCZRCNn3l
         yTuOokbuXJPhzL56QwhKmYRebeHGEEkMU3dbu2r3oHTumYwzjIwBuD1HNHm+AHEL8Zme
         WEyUdWlPRQrdOCvFRPmuyBYxJo08XD/B6mtHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712851743; x=1713456543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cI7sdKD5FmgcXnDnQmTGZKEG+ARXSt1G7DPgTc+R7UM=;
        b=qhnDXNQNRpLZjJ6mrAVRJkvW7vxTVIL6R/rikTXXuWomE2sQ2xj37Dzt0omNoLDEBv
         2rC2b8S8u2+DvDGyum3JpBux1THM6HNhRh8FRuXzStoG9UzpGD0j7OJBp+uSU68vycFw
         my4gI9cY/JW5qoNGC27hape6iIMle/T7wBLNCDEAuA/yfFmA8r9Od+9pS2542qK680y2
         nVAaMKUCSeuwhr9NTrAlUnqr0hC6EsRm8DMNnX0DIz1nMpWkdyJdO6NM1WOqB3F6Q1u3
         XdBlO4eJ8MtXJK/b1AfZWqPkb1rz1NMQ8JtIcoZZVriRWeiIie9L+PSfAb54wz78LbBc
         qQuA==
X-Gm-Message-State: AOJu0YwvB98J2/iqjDl6o3CfTM5eAFf2edCM7Nxjj1NUEbCy403ZzVVb
	tJWqv/+kQlZWAo+Vl6QowxaPoPR4lAVVjJqFZSMplOOfRCin+jBUI62wbJXeXrYTQojlULIMzMd
	k
X-Google-Smtp-Source: AGHT+IE4cdrpQOpDfzPn5BM4uSDMQNn+4mp5YvbUITbTr1Ccho8ku83P57Xl7dqLO6gYu7ogcteayg==
X-Received: by 2002:a05:6214:5097:b0:69b:4dac:19e9 with SMTP id kk23-20020a056214509700b0069b4dac19e9mr198551qvb.33.1712851742946;
        Thu, 11 Apr 2024 09:09:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] altcall: fix __alt_call_maybe_initdata so it's safe for livepatch
Date: Thu, 11 Apr 2024 18:08:38 +0200
Message-ID: <20240411160838.73965-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Setting alternative call variables as __init is not safe for use with
livepatch, as livepatches can rightfully introduce new alternative calls to
structures marked as __alt_call_maybe_initdata (possibly just indirectly due to
replacing existing functions that use those).  Attempting to resolve those
alternative calls then results in page faults as the variable that holds the
function pointer address has been freed.

When livepatch is supported use the __ro_after_init attribute instead of
__initdata for __alt_call_maybe_initdata.

Fixes: f26bb285949b ('xen: Implement xen/alternative-call.h for use in common code')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use #ifdef instead of #ifndef.
---
 xen/include/xen/alternative-call.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 5c6b9a562b92..10f7d7637e1e 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -50,7 +50,12 @@
 
 #include <asm/alternative.h>
 
-#define __alt_call_maybe_initdata __initdata
+#ifdef CONFIG_LIVEPATCH
+/* Must keep for livepatches to resolve alternative calls. */
+# define __alt_call_maybe_initdata __ro_after_init
+#else
+# define __alt_call_maybe_initdata __initdata
+#endif
 
 #else
 
-- 
2.44.0


