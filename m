Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD8ACAB80
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003080.1382521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1d2-0005aY-77; Mon, 02 Jun 2025 09:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003080.1382521; Mon, 02 Jun 2025 09:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM1d2-0005XT-3y; Mon, 02 Jun 2025 09:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1003080;
 Mon, 02 Jun 2025 09:38:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM1d0-0005XN-CZ
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:38:46 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6031f900-3f95-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:38:44 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so4996316e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:38:44 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337910e17sm1522600e87.153.2025.06.02.02.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:38:43 -0700 (PDT)
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
X-Inumbo-ID: 6031f900-3f95-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748857124; x=1749461924; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd3DXS8m7SUMS7UPQ201OWX9Ru8pmaMIQdvRgn70O4A=;
        b=PWir0UtmYmHE9/O5QnSNzzVvExdQYqezG0h1+xoOzlnNPE/tXyc54qFxs+7dsIaPMg
         j6fWLcK20XLcIgddUheb2WZwERIOk+ul3NuL/Rt3ig5u+11ix43uoFuAQHhS5nlFxAgj
         eqpeqhh8zOOkCSedGsFPxVSYiOxhC+sl9dQObKsKncWXiMqjWc1PMxhTb0eR/6fRlrub
         v6Si/WL7rm7bzJdEtIJwMyM+Z3hPwf0xstXWGhuNd5Qu8bjEGpAcHdw67YnE3G4XwWnr
         7mSGCcdfO/0Lpp8MizgVDMgBDk6ftR5CShuiVn0OqK3WWDVjlTO4mayqBj9IpxyWE24p
         H9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857124; x=1749461924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd3DXS8m7SUMS7UPQ201OWX9Ru8pmaMIQdvRgn70O4A=;
        b=NC5qhK75ydyFaKe1jYuqN7OLaqJXtYL41GRXeEh64t2wjn+m6uKtRlxOxUUS3s5xIq
         jYot8sXvVleQoDRuAZ4ZeEgxZP47oJKkoLfMxVduHVddv9iCKYp9Y0agKV6WAZ6aKU93
         LYmIF0gNZ+mgVQRdrhcwfjUC0owaFKLqaLIE2ixHzMstoBprLIREq3IeSu722Gr3OaOz
         xvYXhPbTZ/y0TvsgKv0pn00xeI5BGnnDgu8wfxKbj8fcPhcl6YoTZPqBM002Qv51gOPo
         V20E65WPPOMW4s6ToskiaVjkeUkLtZx7mdyrAU4YuZsOeVEuCytejT1TENAp/XWsgcIw
         yQ1A==
X-Gm-Message-State: AOJu0YxFAcA5nfoS7hZzDNZWoUfEt/NYiv/wDWEotXgksMezc1XDE8XK
	qJC2nxkksHq9HDQDySaHZgG+f86nNSVBAFqUcj1181Pr91HaoiGrJDz5ROT6hrEN
X-Gm-Gg: ASbGncsVe6hIISwBMsjUOIRqXYDTqgL+qHKYJLgcvsZh2OTMRoyBuBU02O6affdJcZx
	fWlxx2k/G69ntjYcmNkh2Q6TMMJlUQbSn7DDyvCOgaOF/rPPjhQsVtWZoE4abl1gne9HxSDh4Se
	+n5jM5klFDIFK5f64M/4pWjqRhi2FgtLMbLBukYXjHVoGUKPo4j02/l725uYrIavG/Nx5O5GLMC
	gqI5K9eU5+fJ5FHfAWEElUu82gCoxtX3bXQX3W4CWFtkOMABSOjK3ROA1OSoXIdSOn3fg2qnye4
	EYi7wsI2rod6z4KPpN7uutXERCs0lZA+fh1KqA/d8kolo+SsMZGeOTkoPX1B+j7byb+KbrigmSO
	tn9pbZkXLluFHuFk=
X-Google-Smtp-Source: AGHT+IENU9Oaln+oysIjlwHkawxsEnesfWaJ3BobFnuO8c+123kh32pLPuiLP5+mj8xL20HpP3vCcQ==
X-Received: by 2002:a05:6512:31d3:b0:553:35e6:393e with SMTP id 2adb3069b0e04-55342f92726mr1852606e87.34.1748857123527;
        Mon, 02 Jun 2025 02:38:43 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm64: head: document missing input registers for MMU functions
Date: Mon,  2 Jun 2025 12:38:37 +0300
Message-ID: <9e9977e85fca5971e2a3cac9edfd62404cb5643f.1748856752.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add missing input register descriptions to enable_secondary_cpu_mm
and enable_boot_cpu_mm functions. This update improves code clarity
and consistency in comments.

No functional changes are introduced by this patch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/mmu/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 634156f83d..d14780ad19 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -313,6 +313,7 @@ END(enable_mmu)
  *
  * Inputs:
  *   lr : Virtual address to return to.
+ *   x20: phys offset
  *
  * Clobbers x0 - x6
  */
@@ -337,6 +338,8 @@ END(enable_secondary_cpu_mm)
  *
  * Inputs:
  *   lr : Virtual address to return to.
+ *   x19: paddr(start)
+ *   x20: phys offset
  *
  * Clobbers x0 - x6
  */
-- 
2.48.1


