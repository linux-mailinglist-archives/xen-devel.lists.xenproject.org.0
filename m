Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5BACEFBC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:58:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006806.1386063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAAc-0008WH-90; Thu, 05 Jun 2025 12:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006806.1386063; Thu, 05 Jun 2025 12:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNAAc-0008Up-6J; Thu, 05 Jun 2025 12:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1006806;
 Thu, 05 Jun 2025 12:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNP3=YU=cloud.com=gang.ji@srs-se1.protection.inumbo.net>)
 id 1uNAAa-0008Uj-7F
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:58:08 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b904a713-420c-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:58:06 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so1254483a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:58:06 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c5a8f1sm10400585a12.20.2025.06.05.05.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:58:04 -0700 (PDT)
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
X-Inumbo-ID: b904a713-420c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749128285; x=1749733085; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KihiqfAuRceeX2KLBAt2SOwHJgjXU1PeauPiesRfeA=;
        b=FUXFOQwwWa/fFEhlhacpks1HqP6NS0Iif7Ij+xj9PjtFOodlf7iePfTCvZlqjkLHNU
         VzdYJRqexbFajWKLe5uEWVsoJX5J9zD/1IcXISnQY3ez0a3ONnmVJudybcGQFFysCe6D
         8xf14oR4APRUWDmn7suoKbe0V8H50JpsK+xK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128285; x=1749733085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KihiqfAuRceeX2KLBAt2SOwHJgjXU1PeauPiesRfeA=;
        b=VH98SM9URZJXIgWNQeOeMzaWKt3BKVOc1lF5reQzpsOzWVhcDOaK2HdA7D6UwSqv3R
         TmVPm1i1SxQNQ3MSJYVeLKzGqffJvcYM4Rih5Pp1UW4XRd/8nd+UWnR3RSRHOhfNQJKk
         hK1tUHeItj9I7kcmeSI+4Dc9nuDnI42uYktpv3I8BZc1yCPwA71LdxMOvbYzO8rOuBsU
         UYjezzF1fW8CgHLyKJvEg/GU3OzmB4M56SoXktBl+1Y7MEPhv5W8VBNkTpwi4RnO3JAZ
         6ushrBvaV/Dc4eyBB55gMQqWItwCyA7XddZ4QJ6VubI/rYQcbQkS309puGFeBFcjeTou
         hwqA==
X-Gm-Message-State: AOJu0Yy9036rhuJX9M4uGTKKnuYTcBT9mmNiT0zBvYJ/zYgXsSQ8m42x
	8nvD6zd4SEQotaTbLZJfNOXZA1A/5C8a09rgxdx0YyRwiH4t4kQnip3ibSLPnQ/0YNEF+MtTEAD
	k+1AVVfmEsA==
X-Gm-Gg: ASbGnct6DKAU/gq2ZToieiLCpR9fmRvam8UAtQ3yTMZWWjxcoc12TDXzEM3v7LHQ0Bx
	TAMZHLLNVniiwHmA9reEEGEwgGA79oHEYqrReY7AqIQx5HpRJpvDoM6OIuCvps5HWAWGLqHaSEH
	5+q+ZboRTikdDUqjzJx0ibjZC1iX4LiPXXYI4TOb7SiFnZ/SE3Q3WCpJVQjm9gpza7Xa37L1hUI
	r85SrHWSse5Fd1nMNDKhGCbha8LGZr9QOhV5VylQRqb5khFf4Ucak/7hnPHxbx1dcE/T13R21+L
	Zi5LzrF/QZmJrJdxacl74Yjx/2y1RWrp9ax5H2+8fDJaMWPgetAqV0gOt/eZ
X-Google-Smtp-Source: AGHT+IG2znhCuAhjzRNb/TUUxIHZq6pRY/eArB8U/WfEODScDRAZCmSoVfJLyoc7ECYtC+DWWsrh0w==
X-Received: by 2002:a05:6402:1ed0:b0:606:b997:ae3d with SMTP id 4fb4d7f45d1cf-606e944ee65mr6021473a12.1.1749128284738;
        Thu, 05 Jun 2025 05:58:04 -0700 (PDT)
From: Gang Ji <gang.ji@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Gang Ji <gang.ji@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] xenalyze: Add 2 missed VCPUOPs in vcpu_op_str
Date: Thu,  5 Jun 2025 20:57:38 +0800
Message-ID: <20250605125738.1444521-1-gang.ji@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 missed ones are: register_runstate_phys_area and
register_vcpu_time_phys_area.

Fixes: d5df44275e7a ("domain: introduce GADDR based runstate area registration alternative")
Fixes: 60e544a8c58f ("x86: introduce GADDR based secondary time area registration alternative")
Signed-off-by: Gang Ji <gang.ji@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/xentrace/xenalyze.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index adc96dd7e4..1c13682aaa 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -6513,7 +6513,8 @@ static const char *vcpu_op_str[] = {
     "register_runstate_memory_area", "set_periodic_timer",
     "stop_periodic_timer", "set_singleshot_timer", "stop_singleshot_timer",
     "register_vcpu_info", "send_nmi", "get_physid",
-    "register_vcpu_time_memory_area",
+    "register_vcpu_time_memory_area", "register_runstate_phys_area",
+    "register_vcpu_time_phys_area",
 };
 
 static const char *sched_op_str[] = {
-- 
2.47.0


