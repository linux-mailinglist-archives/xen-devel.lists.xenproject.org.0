Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893DACEF66
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 14:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006780.1386023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9um-00051Z-8Z; Thu, 05 Jun 2025 12:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006780.1386023; Thu, 05 Jun 2025 12:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN9um-0004zM-5W; Thu, 05 Jun 2025 12:41:48 +0000
Received: by outflank-mailman (input) for mailman id 1006780;
 Thu, 05 Jun 2025 12:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aNP3=YU=cloud.com=gang.ji@srs-se1.protection.inumbo.net>)
 id 1uN9th-0004jZ-7k
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 12:40:41 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47152bbf-420a-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 14:40:35 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso1687261a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 05:40:36 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606fe850afasm1998360a12.78.2025.06.05.05.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:40:34 -0700 (PDT)
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
X-Inumbo-ID: 47152bbf-420a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749127235; x=1749732035; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfwRnI7lZEthL0WX9nNZFK4rYZZj7EvtDJVub3fMfCY=;
        b=lHC1IGxiv9tntU5H961oDa2pTkzZLMvAKP91MICLOSt3+hcYx5Rs2k/e881BlddVCs
         FODOYDhp9KgNF5yrNrfHgVZ12M4uPVwG074j6DhzbZafIxgbUPBixLvXqU6XGG+iDDk1
         81dUHm+nKmIJcvJIaQYzJ0eixgO50fu2nZi2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127235; x=1749732035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfwRnI7lZEthL0WX9nNZFK4rYZZj7EvtDJVub3fMfCY=;
        b=q+CLxJ+GkVzoR+ii4OfDJcmcBV1hn8vj3nTzTRSFaPyOLPusieMdLNUgBUhV+whCnR
         5lzo0k/U7UPUxr5KUaKrYBoFZ6w0z0FmWHKDwmpLxNXQlZfr9erbEO1VNtDK7I4cD1py
         v0dfI4XzWyYA8sl2ITsOFkrP2Py6PKsrd0F/cSZ+NoUtuco6pspyLEkqzUAOKBgtXUEQ
         KV81xueAacs0gxkAyVaCSExFhf9rpAouCpwZu7G1auObjJThIT3Oh77T51d6EnNy5j/K
         uSqzuRRxUrseR60aI1QR5svOalshyRYgTMdYpzSur1Q/kJDPV0biL6RyOQ6V94aeZBW7
         TWTA==
X-Gm-Message-State: AOJu0Yw2+eWgK4wmYEVZBp2PPe4uBMLgy6Uf/TYiYSGldEqv0DNmWW0J
	plkW9dqKBXpJuuFGm5CEkOYz8zUV/v1wBFVg7+15OjH8FTCsosaPPq05ci37huCfnw5pfqxLpw7
	CSneCYdDy4Q==
X-Gm-Gg: ASbGncsUEV4p0Hy4eb8QUzT4gKFXdgt8OP0b5RO5vGlxJRQznsAuEjE0MPO9Ruypowf
	0BSUhVacph1FRnZwpP9199+TfcXa7e86Z7oURzkICGw8EACkK6o08PJgs3/aaFgJzxFzprpgDLP
	dhmoVdl/3nnCRDMjYuiMntG7VdAGxUVLqWyUD0r5OTq/8fwHtgA6/2J7dzBib+H9fKl+SCwZQkG
	/vxDkFJCRFYLg3gGBfvuycsFcosYanNJ7gURZllfDcyJ7tgemlF64SAS15PSmjWCpvZUCjc2HK3
	ZN1DQIFJh3pFOYsxUmztAci8sIkCeZXMost3vHZPqqfSW33W1FjiBthN9YGJ
X-Google-Smtp-Source: AGHT+IH5CPvL6XymXfSKxxMOlb1tRSk0In07BRDe0tAIPRV931bMPxrBz4N3x24xg0pobFR92HyMoQ==
X-Received: by 2002:a05:6402:33d0:b0:602:201:b46e with SMTP id 4fb4d7f45d1cf-606ea195f5dmr5012852a12.31.1749127235167;
        Thu, 05 Jun 2025 05:40:35 -0700 (PDT)
From: Gang Ji <gang.ji@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Gang Ji <gang.ji@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] xenalyze: Add 2 missed VCPUOPs in vcpu_op_str
Date: Thu,  5 Jun 2025 20:36:36 +0800
Message-ID: <20250605123636.1444304-1-gang.ji@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 missed ones are: register_runstate_phys_area and
register_vcpu_time_phys_area.

Signed-off-by: Gang Ji <gang.ji@cloud.com>
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


