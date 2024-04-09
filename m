Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B539E89D968
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 14:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702427.1097412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruAwH-0001FK-SP; Tue, 09 Apr 2024 12:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702427.1097412; Tue, 09 Apr 2024 12:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruAwH-0001Dk-PQ; Tue, 09 Apr 2024 12:51:01 +0000
Received: by outflank-mailman (input) for mailman id 702427;
 Tue, 09 Apr 2024 12:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUYQ=LO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruAwG-0001De-5t
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 12:51:00 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d044f495-f66f-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 14:50:59 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4155819f710so43582265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 05:50:59 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b003439b45ca08sm11361772wrq.17.2024.04.09.05.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 05:50:57 -0700 (PDT)
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
X-Inumbo-ID: d044f495-f66f-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712667058; x=1713271858; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFKFyLkXgkEtMi21Oinq/xuxXXZV6GWLEDgy3mOzsiI=;
        b=szWVycphbZmSgxB7u+no1SUwH8bHbKlquSh46O4ABhFu5vOX8krxrCxl7KJiiIXYyD
         DqgNUHmCuPX5A8oyKmmeWPuvxuMmNasnotySv8N2qLrJi2FX6Re6w19XX9YOUFRcqZXu
         3wIUv8WVhCfcXrt7L4ZKL+l3F0zLqe0jpD2Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712667058; x=1713271858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFKFyLkXgkEtMi21Oinq/xuxXXZV6GWLEDgy3mOzsiI=;
        b=lMub0OhH7JkVM3WRQvxLgxJneL4Y+kbmERFzk7YngETChbd6BY28UQIuaxCD5L9GmC
         aJN6fRbVVpuT2mbgBBcmf9yJ4qgHStvfNl1Is/0zsP1DH1jMwZkOKWYIZRKzK7a9oM22
         /9I/VJcbui+fOwJBuDtHYtcWzaX4ccNuhgZvDJCo/sFuy5iwGlX3UdelOa9ddNHkwewF
         EwfpQcJ2yV6/TpdgEaPTpGq83ztdzH+qmgUm9OgPwuU1Lrf5+xLgc8zHYj7O4JbpjH5R
         xf1bbH9egpnpbZBczby6CM5vSS0i+oZEsz4m3aJiVWZopZJQdq0ePo0YcVszXhHL7EKT
         yR1Q==
X-Gm-Message-State: AOJu0Yy4Bn9zFfHZPLT/PQcO1RxJWw0K1P2d2nK5DsrVLJGsYZOR82gd
	oii+anZcv3pE+H4PGCUNQb1fVhomtalDRAk3OjVnZMd70urWY1WIAsoe3+BE27qGsUndQYNli4i
	A
X-Google-Smtp-Source: AGHT+IEk/TSzvsarVODiBi/sOC3VyQHNTiKNcIP99FwTDDdf7/k/S0J/ivv2eZ+n85L5Jb7g8u+n7w==
X-Received: by 2002:a05:600c:3d1a:b0:416:9bd1:6ec4 with SMTP id bh26-20020a05600c3d1a00b004169bd16ec4mr2335466wmb.35.1712667057897;
        Tue, 09 Apr 2024 05:50:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/alternatives: fix .init section reference in _apply_alternatives()
Date: Tue,  9 Apr 2024 14:50:46 +0200
Message-ID: <20240409125046.60382-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The code in _apply_alternatives() will unconditionally attempt to read
__initdata_cf_clobber_{start,end} when called as part of applying alternatives
to a livepatch payload.  That leads to a page-fault as
__initdata_cf_clobber_{start,end} living in .init section will have been
unmapped by the time a livepatch gets loaded.

Fix by adding a check that limits the clobbering of endbr64 instructions to
boot time only.

Fixes: 37ed5da851b8 ('x86/altcall: Optimise away endbr64 instruction where possible')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 21af0e825822..2e7ba6e0b833 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -326,7 +326,7 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
      * Clobber endbr64 instructions now that altcall has finished optimising
      * all indirect branches to direct ones.
      */
-    if ( force && cpu_has_xen_ibt )
+    if ( force && cpu_has_xen_ibt && system_state < SYS_STATE_active )
     {
         void *const *val;
         unsigned int clobbered = 0;
-- 
2.44.0


