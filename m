Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613246E077F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520476.808199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBf-0006Qz-1a; Thu, 13 Apr 2023 07:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520476.808199; Thu, 13 Apr 2023 07:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBe-0006FW-43; Thu, 13 Apr 2023 07:16:06 +0000
Received: by outflank-mailman (input) for mailman id 520476;
 Thu, 13 Apr 2023 07:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBa-0001gr-LR
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:16:02 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b48f696-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:16:01 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id o1so17896811lfc.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:16:01 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:16:00 -0700 (PDT)
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
X-Inumbo-ID: 0b48f696-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370160; x=1683962160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHjUSAX1G+PSTsVlSk/rHD6dSlwHglC2zbE6BMp+VKo=;
        b=btNr9S7x7r1kSXq07/s61mffJI59SVCiAB7WMvILy3nvyhwmRc49W267xWGxNrQGe4
         uZ/bePskes7286wzyRplVA/AXc+q/d3GwJP+NjiHv41DvwIXAV7VZPSy5ZLDo7fRpIO/
         Afz6rk03wZDSD1+3HjPimoXN11zLN1uLy5v1KYLFn8EfGShlBXaRDjxypm/iA8aQMayx
         kDrOf4kD+R7f7sZZaC51CEahX7GYucH0U4DKajspeSyDHl5NXzH/3/W5f3ziz9k4Qwsv
         m+LWayOSWZRcy1Ax714BDl+tpd35jcyfBVfvbhYCtJ5HWEWKOfB9q/S4YpRavvntvdUP
         xf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370160; x=1683962160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHjUSAX1G+PSTsVlSk/rHD6dSlwHglC2zbE6BMp+VKo=;
        b=WKpv1E+oFYrlaWebcqlK0/tkUaqScx2R8DqIqnGLIiYpuplQkgfBBrfcNZ2Kch4KoO
         ga8iVvII91j+ZuEli6PfoxBLVov+Q1NV5I4wK+2I1UAAbpg8TGiuB1o3Xn/hvC5hXAza
         tA9AF+q9nOGYqb5kYD0uhe5BC8r4tK/Sb6jJRQjfEDqMkv8/rmFL+4wkt4CFDWDied83
         1KNHoqkvBRkX/RuSbbRREMm3jurD+rVtTkROu/W9zFrpZkv0ycbU4gbIpoqxYvjL11GP
         4bMuOkKKPFABgcHHfZR2gyPZ5pJo7i9BcWNLKxN6Zpok173KPyeHfr2uXphdHOr5DIU9
         4q9A==
X-Gm-Message-State: AAQBX9ck5LpFes6S8H0HsXcgplmRtf36GAof49cMreza+gdsJx1mU/Y7
	UIMZ7SJxX/C8jNjF0okyDlAx7yp2i27ThxdoKBo=
X-Google-Smtp-Source: AKy350YWU9r6iN+MQQbR65FG8mulx+cLkSIkEYhbzgpG253YbNkvwHiggHR8kCHk4ZKcRQGM0YA/Hg==
X-Received: by 2002:ac2:454e:0:b0:4ec:89d3:a8ac with SMTP id j14-20020ac2454e000000b004ec89d3a8acmr459019lfm.30.1681370160490;
        Thu, 13 Apr 2023 00:16:00 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
Date: Thu, 13 Apr 2023 09:14:24 +0200
Message-Id: <20230413071424.3273490-23-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 SUPPORT.md               |  8 ++++++++
 docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f09..1fd746f7f7f2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -818,6 +818,14 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32. Part of the
+FF-A specification is not supported.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..bba99c576b48 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1645,6 +1645,21 @@ in OP-TEE.
 
 This feature is a B<technology preview>.
 
+=item B<ffa>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently is only a small subset of the FF-A specification supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multple SPs are not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+informantion about FF-A.
+
+This feature is a B<technology preview>.
+
 =back
 
 =back
-- 
2.34.1


