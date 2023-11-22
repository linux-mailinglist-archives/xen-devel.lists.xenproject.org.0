Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204287F4CDD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638915.995883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qH1-0004RJ-GY; Wed, 22 Nov 2023 16:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638915.995883; Wed, 22 Nov 2023 16:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qH1-0004P6-Dx; Wed, 22 Nov 2023 16:40:23 +0000
Received: by outflank-mailman (input) for mailman id 638915;
 Wed, 22 Nov 2023 16:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6Xs=HD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1r5qGz-0004Oy-PN
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:40:21 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2463a55-8955-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:40:19 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-409299277bbso32051005e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:40:18 -0800 (PST)
Received: from localhost.localdomain ([185.25.65.68])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b004097881d5f0sm2738278wmo.29.2023.11.22.08.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 08:40:17 -0800 (PST)
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
X-Inumbo-ID: d2463a55-8955-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700671218; x=1701276018; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXWcMm/8odrIcxiJ9CXHuimpsKLfHzIzG2IXV9cswfk=;
        b=bqQkDEd2CRmclsHtMjQFxwQw4hzeNUnYLUpqsAbJWWEeSR3+o8bEXCJovgVIr7koKv
         qJOqzG9Jh8ArOus+u8JqjgJdEc4Wwb2aziZMIywF9hwuPJHXC15ekBKCSAZCxfnMXAC9
         b3gUckipFDcBDtLrpRKrWNsrZwhUdgbjb81Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671218; x=1701276018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXWcMm/8odrIcxiJ9CXHuimpsKLfHzIzG2IXV9cswfk=;
        b=WTHfCDWz07Qxle7otzkl8R1ePTx9fRD3ujoL3WrQAaeO+ZtA96IbeIDi5sWQvH1nV9
         OHShSEpoUN6AEdykmTOw2KzLNZ9BzXRcLaQozPF1z+8fO8QNpcXv7DbrwwewoUJ04FUh
         9dxQQuo7HWn5H0/bN5SHTGGBl0g36VA44VuTLft1lEMAscVtphe8XfMzTjNLNhxvaEr4
         M7ZOFfgrPnfBGrW8cUV19t1g9SK3l+6qSAE+kBPEDV/pgH59aXgxBFy1tOyY1d5azDFc
         TumjUYra867vfMSMADXjUJhFO79592JavtmlGgLL2iUijk1U9BVFQ1cbxTiMCmatYKuQ
         JdUQ==
X-Gm-Message-State: AOJu0YyHw7yHw23lY1S+ESHkrIERZpTRws112QcSN6Lh9NTwtAVuIO3u
	866h6yML98FpzV2sUE3f2/jBwMAfPsNEOxisGIo=
X-Google-Smtp-Source: AGHT+IHYHRFdWfMb61OIANFU0EqkEyDLhsEofGRtunOL90YwG1dC8VzWTp1hTSw9/BJovaviM8I7yw==
X-Received: by 2002:a05:600c:4ecd:b0:40a:4436:e037 with SMTP id g13-20020a05600c4ecd00b0040a4436e037mr2180544wmq.35.1700671218210;
        Wed, 22 Nov 2023 08:40:18 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: Release domain if we are not able to enable memory sharing
Date: Wed, 22 Nov 2023 16:39:55 +0000
Message-Id: <20231122163955.14555-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case it's not possible to enable memory sharing (mem_sharing_control
fails) we just return the error code without releasing the domain
acquired some lines above by rcu_lock_live_remote_domain_by_id.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
--
I didn't manage to check the change, I was just looking at the code
for different purposes.
---
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 9647e651f9..4f810706a3 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -2013,7 +2013,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 
     if ( !mem_sharing_enabled(d) &&
          (rc = mem_sharing_control(d, true, 0)) )
-        return rc;
+        goto out;
 
     switch ( mso.op )
     {
-- 
2.34.1


