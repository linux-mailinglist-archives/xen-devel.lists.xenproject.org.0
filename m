Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B71A9B355A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826695.1241141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0V-00038H-BH; Mon, 28 Oct 2024 15:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826695.1241141; Mon, 28 Oct 2024 15:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0U-0002yd-So; Mon, 28 Oct 2024 15:50:14 +0000
Received: by outflank-mailman (input) for mailman id 826695;
 Mon, 28 Oct 2024 15:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0R-0008FV-J1
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fb99d1a-9544-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 16:50:10 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5cb72918bddso5920168a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:10 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:08 -0700 (PDT)
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
X-Inumbo-ID: 4fb99d1a-9544-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130609; x=1730735409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrpqNXgaGWCogi9sNhxEA3iqIJalu/4gAkUE90pvCh0=;
        b=WTQFFIPbAb2KLFsUVTOrCZKvWnKHHvlawjDT53CJHT+qK5N9P1JZKaUnjKZe7iRCxy
         Xbnt7hAQpzd+818uNA58gI/suqfubtYY0zqw5TbPnOPNz+oho+kCeIMe+nG/L0NWjbxz
         40gBDn07QNb1x9KsCPuYxyVvgJvJMMz9C2ITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130609; x=1730735409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrpqNXgaGWCogi9sNhxEA3iqIJalu/4gAkUE90pvCh0=;
        b=VaRtSC2ZF63o1HIIW1W5qMrGLxQ+fvZHBo19C7pm/yBAEGFyJ+l3agMD2LXny26BWn
         5hncuTz6J0ut2WP4oi/KZPQMnP/FapmZccaRrv10kGV/Js9jUrcj1R4s1Z+eGtzObyVM
         UFoTzdnGnsQ1NEGiY7q+wR/kvSqFfBxu74uBF95OX1DcwBBXm8l8IyXh84ovdKmi+VNT
         A+EXM/HCW0Sjdovi4UUeHvIk7ZIZPQKNR8x2KXi31TwqH5IFSIZa2JSfNvex49bEpzT4
         DeOHV883xHJwZA4NMI8EaPgDQuM6zh+LnUzP2Qzlao3F7isLdiWIQwKJ6pPUoL1zRRCv
         Ggyw==
X-Gm-Message-State: AOJu0Yxob9B1201OGCp0rZYT6HeESk977Ikfk/SHR6rCd0+nPacm2fer
	PHAaCW7wgTIAszy/v6deYzF0WkF6PK0cruMo9M5Th5zv9c09h7a5obKIA6wjUVoxrzhp13LrjEv
	F
X-Google-Smtp-Source: AGHT+IF+QfFAUVZf3RFIYO1/1CSUdBaGD9aUJf2nTNYdCWZjxveXstimaXqORZSmU3y6L7iziuZUNg==
X-Received: by 2002:a17:907:7282:b0:a9a:294:cb30 with SMTP id a640c23a62f3a-a9de5d985e9mr805426666b.16.1730130609298;
        Mon, 28 Oct 2024 08:50:09 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 11/14] x86/mpx: Adjust read_bndcfgu() to clean after itself
Date: Mon, 28 Oct 2024 15:49:29 +0000
Message-ID: <20241028154932.6797-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Overwrite the MPX data dumped in the idle XSAVE area to avoid leaking
it. While it's not very sensitive, better to err on the side of caution.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Depending on whether the idle domain is considered ASI or non-ASI this
might or might not be enough. If the idle domain is not ASI the XSAVE
area would be in the directmap, which would render the zap ineffective
because it would still be transiently readable from another pCPU.
---
 xen/arch/x86/xstate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 2a54da2823cf..a9a7ee2cd1e6 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1025,7 +1025,7 @@ uint64_t read_bndcfgu(void)
     unsigned long cr0 = read_cr0();
     struct vcpu *v = idle_vcpu[smp_processor_id()];
     struct xsave_struct *xstate = vcpu_map_xsave_area(v);
-    const struct xstate_bndcsr *bndcsr;
+    struct xstate_bndcsr *bndcsr;
 
     ASSERT(cpu_has_mpx);
     clts();
@@ -1051,7 +1051,10 @@ uint64_t read_bndcfgu(void)
         write_cr0(cr0);
 
     if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
+    {
         ret = bndcsr->bndcfgu;
+        *bndcsr = (struct xstate_bndcsr){};
+    }
 
     vcpu_unmap_xsave_area(v, xstate);
 
-- 
2.47.0


