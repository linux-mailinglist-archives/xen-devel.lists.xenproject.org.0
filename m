Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE28B3338
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712547.1113295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEy-0007j5-NF; Fri, 26 Apr 2024 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712547.1113295; Fri, 26 Apr 2024 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HEy-0007hi-Jm; Fri, 26 Apr 2024 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 712547;
 Fri, 26 Apr 2024 08:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0HEw-0007TR-MC
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:47:30 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc1fc72-03a9-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 10:47:28 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a58bd410f92so187630466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:47:28 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm10339211ejb.29.2024.04.26.01.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:47:26 -0700 (PDT)
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
X-Inumbo-ID: 9cc1fc72-03a9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714121248; x=1714726048; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=xBaP9ugoBJJ3oTd7AjJa1nh9fLn25gDjjf1nUCEOk/t3oKhJRbrG6fr/6bMx5nFmUf
         Qc5oj3cNt4pOIfouUc1vZn5+oTZqx79ZZ0D3IDVfOfaUputUf3YYN1ko3CwUjRU4/vli
         XTbw+1G9qOOVBUAgkPbQtBYvPuVrTKwfbNW3FyO8WA9hsYEX8ed5xLs5P5UW9lRs0k/o
         7F8ieD7t5N3++E1RFQxpa33m8pI1q46Mv14Pn1ZrZBrZVjsbm8Zp12wv8Su2BaG15gbM
         fAjWLYI0gPSeRZtCuf2zZZtXp0ceDsaiYf2iKbNrT8sNRKbYf9VEk4ojJTGTuW1CH3y2
         A5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121248; x=1714726048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VzeWK8x82YxZO3FACx+2RlqRVfXhRtSExk4PP34ai4=;
        b=xBQjHC1V/uy88uxThh+hqpJGguwTIkA2FgwA4u1JFOmjyS4oVx2wxcDCaG0pGJs4Qf
         JSz1WH5Wid4BywBkRmcdvkRaCVVyoRcwhl3K9FOHAl5M8g0zcyJQr8M1rA+REt/KhHuH
         fX+8ffLXqRKk2BSHBJOALXDYxPSON0CMSi0zld4LOnE1OmgbdrYj0CIxtkhw7x5ftLii
         xxiB4B8+Va3A7cesfWapEp//Ipt0cis1yEPcd1LFmT2djbjOjM0Z0tyrFD2ZXUQXMedU
         uEZuHB4TOrAQPcru/KnbRF0hFHQqWXtlmiKkhV1HEWxGJ2hmBO6QCAUSp2po5wgVbniL
         v0vA==
X-Gm-Message-State: AOJu0YwzNxJyVU8zom54jLBdmTUkJV4fSwfsiKIBmUdM1qCz8ytTb/Gx
	er2plsJi7PU0s6ucyYVd4ZLCy3MW3umKizFtfbJYhsaQ6AsIuVZA8fjK3MtAeDc5V0r70ax7S5s
	W
X-Google-Smtp-Source: AGHT+IFIzpbDKDHkTqWP5z+4E+TTctdEfjpzFk6DYoH3Ue/Lrzh8H8wxajoKbis4dtVxr/Kf5ulalQ==
X-Received: by 2002:a17:907:7890:b0:a55:b345:63ec with SMTP id ku16-20020a170907789000b00a55b34563ecmr1324188ejc.15.1714121247785;
        Fri, 26 Apr 2024 01:47:27 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v3 1/5] xen/arm: ffa: refactor ffa_handle_call()
Date: Fri, 26 Apr 2024 10:47:19 +0200
Message-Id: <20240426084723.4149648-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426084723.4149648-1-jens.wiklander@linaro.org>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactors the large switch block in ffa_handle_call() to use common code
for the simple case where it's either an error code or success with no
further parameters.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 8665201e34a9..5209612963e1 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -273,18 +273,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_RXTX_MAP_64:
         e = ffa_handle_rxtx_map(fid, get_user_reg(regs, 1),
 				get_user_reg(regs, 2), get_user_reg(regs, 3));
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_RXTX_UNMAP:
         e = ffa_handle_rxtx_unmap();
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_PARTITION_INFO_GET:
         e = ffa_handle_partition_info_get(get_user_reg(regs, 1),
                                           get_user_reg(regs, 2),
@@ -299,11 +291,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         return true;
     case FFA_RX_RELEASE:
         e = ffa_handle_rx_release();
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
         handle_msg_send_direct_req(regs, fid);
@@ -316,17 +304,19 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         e = ffa_handle_mem_reclaim(regpair_to_uint64(get_user_reg(regs, 2),
                                                      get_user_reg(regs, 1)),
                                    get_user_reg(regs, 3));
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, 0, 0);
-        return true;
+        break;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         return true;
     }
+
+    if ( e )
+        ffa_set_regs_error(regs, e);
+    else
+        ffa_set_regs_success(regs, 0, 0);
+    return true;
 }
 
 static int ffa_domain_init(struct domain *d)
-- 
2.34.1


