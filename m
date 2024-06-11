Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244F1903C24
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 14:47:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738364.1145104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0u3-0008TC-Rg; Tue, 11 Jun 2024 12:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738364.1145104; Tue, 11 Jun 2024 12:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0u3-0008Re-OU; Tue, 11 Jun 2024 12:47:07 +0000
Received: by outflank-mailman (input) for mailman id 738364;
 Tue, 11 Jun 2024 12:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eM8s=NN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sH0u1-0008RL-U4
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 12:47:05 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b41e27e9-27f0-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 14:47:04 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57c778b5742so3205412a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 05:47:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1cf00b49sm280511766b.164.2024.06.11.05.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 05:47:02 -0700 (PDT)
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
X-Inumbo-ID: b41e27e9-27f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718110023; x=1718714823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EwulIzL/UVcCt0Fpy5jfPOow5MxBueMIwAtgvXuH+Q=;
        b=E/FyjNDpXpNmk4NKRjAhFF0/CMc4vfq3wMeC5fjzgiXj/MjuJBOiysw5t0J3/ik1Pa
         sI17fRl5hV3GzJsjl/zma0aouNOLitr5lXz/GSEXk5L+U58bRS6WdCAxf0pnWlALv+R3
         dIzUwle72rLskqGagIbOavid8LXtLR2n7TGaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718110023; x=1718714823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EwulIzL/UVcCt0Fpy5jfPOow5MxBueMIwAtgvXuH+Q=;
        b=JaInqudtbqx4UHYi4LBIja7c7H2fm3iEwORcIW18PY1SKDse8yBhVm7hhzZ5t1jeTn
         SM/9SP33+jqOmIn+e7tB5OSVp7lxazur8JXtMGbPMoWyeHpSkxE3Pn8QLK7kXukDyv0O
         uj9JajC9CukRyxhPUtregwrBkR0Y1kQjcmObhqNeVZrc57IhmCrCTVlpo7vTc7W1wywq
         KtEpj7tMsPR4wOndZnwWSAjvfppR2NpzdcFkVajXUeC2DTyM0gSnkU/ToI3CSsUNv1Lu
         bshCn0YiESGnrlLgFa4ZG1w78IUtCCfwmATTx87bHNL/wgsBWQy2QNtIPG7me2UU/fdK
         rD0Q==
X-Gm-Message-State: AOJu0YxHQ1uK8/P64BxPSSc3XN4Rm/z+LLvwk9QGVJpPxkI1Ze1mu7Ii
	qQ4a5xoPrnww7K+U1Lu3eiMjUEWLecljghC65QnWAm/lgae9bFfnzVounVzCxgxAMjbifjGs8/j
	2ooU=
X-Google-Smtp-Source: AGHT+IGpeSWS2SB4iybVauE/ENvrfT8wtDnK+N2OiC9ynJczTVjE2ByPrHS27sb8T/NrNVlRccJb9w==
X-Received: by 2002:a17:906:2602:b0:a6f:ee4:ffa5 with SMTP id a640c23a62f3a-a6f0ee4ffe4mr449282166b.62.1718110022985;
        Tue, 11 Jun 2024 05:47:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.19] CI: Update FreeBSD to 13.3
Date: Tue, 11 Jun 2024 13:47:01 +0100
Message-Id: <20240611124701.802752-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Jan Beulich <JBeulich@suse.com>

Updated run:
  https://cirrus-ci.com/task/4903594304995328

For 4.19, and for backporting to all trees including security trees.
FreeBSD-13.2 isn't available any more:
  https://cirrus-ci.com/task/4554831417835520

causing build failures.
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index d0a9021a77e4..c431d8d2447d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -17,7 +17,7 @@ freebsd_template: &FREEBSD_TEMPLATE
 task:
   name: 'FreeBSD 13'
   freebsd_instance:
-    image_family: freebsd-13-2
+    image_family: freebsd-13-3
   << : *FREEBSD_TEMPLATE
 
 task:

base-commit: ea1cb444c28ce3ae7915d9c94c4344f4bf6d87d3
-- 
2.39.2


