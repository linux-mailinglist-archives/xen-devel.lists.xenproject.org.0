Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942E2748123
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558941.873564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyv-00080L-4v; Wed, 05 Jul 2023 09:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558941.873564; Wed, 05 Jul 2023 09:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyyu-0007um-US; Wed, 05 Jul 2023 09:39:28 +0000
Received: by outflank-mailman (input) for mailman id 558941;
 Wed, 05 Jul 2023 09:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyvK-0005bC-Il
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:46 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50754205-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:44 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b69923a715so99588901fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:44 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:43 -0700 (PDT)
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
X-Inumbo-ID: 50754205-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549743; x=1691141743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R/D9gUszluJweN/TK1ixSj9VXkkPD7CMOFZ9iBZSkU=;
        b=LobW9+25cTLWzcRstSuR690/dlXuCVYMwbPjIEHTenZ/2nRyXeKwA/h4JAzHRUzD3s
         FmhvlBe2Q1EO5fMOb9VnD+mG9ZME87aqU7YDwVJjHbbHjeiROCCDnsooeVOOfxpDtZ5j
         9ioX15OCbqKNZaAm3a6tIgDXGvCY8M7lUzMzv24y8iQgoIWQh+utR6FxUgrajknE4/6L
         nt47aOLygXEI1KDw0FvuIviN0CZ9nZcBRDTnCAw4YdW3FSaQbWsLsjsgc0Id+7afCimr
         t5Hbe/fTj8Eq0eBBQOqjXDyhwxnqSUUpH/18drtvjaNhf1gf+SeH6o9m6mgpxDoz800U
         Mb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549743; x=1691141743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6R/D9gUszluJweN/TK1ixSj9VXkkPD7CMOFZ9iBZSkU=;
        b=kBvK1h/qtMtdpc5bvxLS/YZPinocxhmd7WOWccix/AYZvko+u2BeeIKOzgeJt5OwpS
         gl//dTUc8VSyXWzyrVn9whDzMGJ95krEkdSeBkECQvIGjy9cjG2QAKLJRCZfHJq6KMDw
         KHR7M/vCyBdj3l5OGwBobItpk8eLNcDGiKeZ/We3T/Ym6sJ+tBEQjew6e0G/v41RMpK4
         CQMOP5MMruBCnThurt1G/yPL/UINcJbtA8GKSPZP4rzw5WsJXbypZk5hsC+Fla40vQwg
         UVm5L6Xn2NgRTyHFfNPZGrkBbEWNidjhWzBICmJlNxz6q2NnBz1sxcXZOpjgoF65SwYz
         BYWw==
X-Gm-Message-State: ABy/qLZ7bJflmzWfdxTH0l0ZJ8SLyiOKJR02yH0V6g5/f6IWPAxlg6pX
	TsP0/47L68kPluvboSGcNbu9vzlvZ/8uPdU4LXY=
X-Google-Smtp-Source: APBJJlG/ZBCtB2DwyEpGctwoEHXQfYDNb0BZg67xTGH4UHtUtorEKgA7D8goMZYyEGY7vBlTlkf+Gg==
X-Received: by 2002:a2e:888e:0:b0:2b6:bb21:8d74 with SMTP id k14-20020a2e888e000000b002b6bb218d74mr13048468lji.1.1688549743794;
        Wed, 05 Jul 2023 02:35:43 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [XEN PATCH v9 24/24] docs: add Arm FF-A mediator
Date: Wed,  5 Jul 2023 11:34:33 +0200
Message-Id: <20230705093433.2514898-25-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 SUPPORT.md               |  9 +++++++++
 docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03b2..fe512762cee7 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -840,6 +840,15 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32. Part of the
+FF-A specification is not supported, see the top comment in
+xen/arch/arm/tee/ffa.c for limitations.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3979be2a590a..911c3619ce32 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1648,6 +1648,21 @@ in OP-TEE.
 
 This feature is a B<technology preview>.
 
+=item B<ffa>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently only a small subset of the FF-A specification is supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multiple SPs are not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+information about FF-A.
+
+This feature is a B<technology preview>.
+
 =back
 
 =back
-- 
2.34.1


