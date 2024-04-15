Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60098A56B1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 17:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706352.1103482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU6-00012O-Ep; Mon, 15 Apr 2024 15:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706352.1103482; Mon, 15 Apr 2024 15:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU6-0000w2-5f; Mon, 15 Apr 2024 15:43:06 +0000
Received: by outflank-mailman (input) for mailman id 706352;
 Mon, 15 Apr 2024 15:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwOU2-0000Nb-Nq
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 15:43:02 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5f59f43-fb3e-11ee-94a3-07e782e9044d;
 Mon, 15 Apr 2024 17:42:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so240260966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 08:42:59 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b00a526457fc84sm1987261ejc.57.2024.04.15.08.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:42:57 -0700 (PDT)
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
X-Inumbo-ID: d5f59f43-fb3e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713195778; x=1713800578; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPGq0ub75Cw5vDVXRG5deLNZNVu1XpuWe3GsyXEHU90=;
        b=HpjBjigbwtujpj62NNWzKkqSNm1WBafmALPfBehGb2Ug8VGPcM9K21/GoZfAeIvQA1
         kTpqYX4yfg/AApLHTKE/0tTw8C+G7cziZhvBmjLUM+XJlpiqAVIpmfom5Pr7wn15RmRG
         qHBwLpn1I3KWN1ECVIbqzr1qPad2lMwe3gNGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195778; x=1713800578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPGq0ub75Cw5vDVXRG5deLNZNVu1XpuWe3GsyXEHU90=;
        b=fhYi7GhMqoED0FXJifInImYxKoR6H7qAxo4UBP3z2zlPtM5zFPY9rkjjMFK/60Pzl1
         /7m77S+UgBVZ2fUGWQJ8aRUC5YFZWbBK4D0k6d9+V05mTVoPt3mhIeMYTLMEBJ+Z2TTy
         MJmznoFrgml0gZobqx03rxK+xEy5lxMxLzqDeml0vLygylZuKZV21Ey/JTONj/0mU68K
         IiO34S0+vxKnopuXTXgjyhqHBQBM6oA7lWEFqgmeYw8/sasSrZNLMj+qPhHPtAvzZJw/
         /65Z7W7GVjQFofR9zl9/lqBmo3snRyvbJQF0BuJMqT5HnjANM+UOp9m+Y5jzj8asIK0M
         JBAA==
X-Gm-Message-State: AOJu0Ywju151/7UeJlhu521KCiWTyV4ZdppoHvqWZ4AR8qBkfK7R+b6P
	wTyWsruzNUKgBAp46wgo4vKOmQ3KEWqBUlJydeO1D8ac3KCbRcHWl4V6loJNr8TDfATlaK6R3ku
	RyKI=
X-Google-Smtp-Source: AGHT+IE9r8qSLyg2D7BMJgx3mc2ed305tBKVoys3OAyYk9+ePt/nz1Ml9hXIc+r+TRSGdGKIIA3Ztw==
X-Received: by 2002:a17:906:5a83:b0:a4e:768a:144f with SMTP id l3-20020a1709065a8300b00a4e768a144fmr6141521ejq.36.1713195778076;
        Mon, 15 Apr 2024 08:42:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 0/4] xen/xlat: Improvements to compat hypercall checking
Date: Mon, 15 Apr 2024 16:41:51 +0100
Message-Id: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This started off as patch 3, and grew somewhat.

Patches 1-3 are simple and hopefully non-controversial.

Patch 4 is an attempt to make the headers less fragile, but came with an
unexpected complication.  Details in the patch.

Andrew Cooper (4):
  xen/xlat: Sort out whitespace
  xen/xlat: Sort structs per file
  xen/gnttab: Perform compat/native gnttab_query_size check
  xen/public: Use -Wpadding for public headers

 xen/common/Makefile              |  1 +
 xen/common/compat/grant_table.c  |  4 ++
 xen/common/hdr-chk.c             | 13 ++++++
 xen/include/public/grant_table.h |  7 ++++
 xen/include/xlat.lst             | 70 +++++++++++++++++++++-----------
 5 files changed, 72 insertions(+), 23 deletions(-)
 create mode 100644 xen/common/hdr-chk.c


base-commit: c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
-- 
2.30.2


