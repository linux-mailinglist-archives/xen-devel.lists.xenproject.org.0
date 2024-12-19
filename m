Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49579F7A3E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 12:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861098.1273086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEYD-0006He-RZ; Thu, 19 Dec 2024 11:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861098.1273086; Thu, 19 Dec 2024 11:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEYD-0006FT-OQ; Thu, 19 Dec 2024 11:18:41 +0000
Received: by outflank-mailman (input) for mailman id 861098;
 Thu, 19 Dec 2024 11:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fj/B=TM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tOEYB-0006FN-IS
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 11:18:39 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fed494e9-bdfa-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 12:18:38 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so8827421fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 03:18:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422360072fsm146401e87.102.2024.12.19.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 03:18:36 -0800 (PST)
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
X-Inumbo-ID: fed494e9-bdfa-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734607117; x=1735211917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49eg8s+krDtf0/1GEbBKxKE4dU89XCIcLayO0cwZhoM=;
        b=lasjnLTdmVN5LaMcQfDPjAiXODUavUVfW75HJzzlc6AYYiEra/AoGj1T9feYIHE3zC
         b407hsZVT2/T8SxrP6HhPHd/cUXn+YiVwsY322jDRmkiha+dK6Xt8qNebVPsnpJsOGi2
         gwS4T9BGP9cAoM0wPzJZRRc/iWB3SblabCWIrMHQmqZ8xPcX3vYy1s2uB3Fx/e9qXwYT
         CIrnUF/Iq9BO4Xoff+tjBk9cIVLCc7kPjVkdJI8lNukgP9f0VQqNHGyDUfiRoXItfGpb
         FgQBJdc5yiU3zzxWOL2xpGEZ5oFwUUo1FGfhtakRY1+2I9cFEMEiP78GZi/w/WjlKueT
         vpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607117; x=1735211917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49eg8s+krDtf0/1GEbBKxKE4dU89XCIcLayO0cwZhoM=;
        b=O5wdLcL9dp9kjRaSAiASSZFHbway48BgsfcwexCAyHwUryzYBEV6lFoSGy3nFh5yoL
         grW2Ey5wjZv593tm5reOjNeY6GTo6oRnXuYqEZUHZFuEbzDx2gT19/l06iSoAJI+Bgfq
         pCOR0AhsM55v8Q0WQAtFVBBeirA1QwttsB6fsUGq0REjZqli0tVOeoGYecHg9S/94PaP
         61ACYfG1PSWxFMSVRg/OAIfyV6UMpOP+E9MTKy7OOcKPx4Zgj47jVMlh7cj04ILE2Iea
         /xBgguxJvPXtJqGOK5TXWYnzuqsqE8dD21ZddegCbXIFOwFCr9Sz5Ja41dNtEbQUJB0R
         qzOw==
X-Gm-Message-State: AOJu0Yygz1AYKPijGFZNm/Uyybwsli6yY1WAOqwAQQn3axlO9oGxz7dx
	dslh1iGV6fIsviX7yr/XFWsEuSKGxAGgB8VCZsbewEhJojSoGucVdle+XxuG
X-Gm-Gg: ASbGncsY2dj29C5ieQch+Egai4R0Vn8+t04Kjs6FT15Bdjzu7gmRdW9b+Op83jIs0lq
	dU57o9WTbsfl+njLWLrA262fvrcEzEfXB/+PafisFYWtG9CNbLh8riNgjlCSuR4ePdnyv25sI7D
	uRKeIVta7yPnQwtj38n+Wdr/52p0b4i61q0B1Fy3LmFkYSowk+s7LhmJAGzqDJzSVRWSvNJ/NoE
	M4jmrkVEFlQmcXej3r5S0Xs2RQBPHvlNgi/U/9QHewasrUUBLDBqbMp2w==
X-Google-Smtp-Source: AGHT+IF4H7aeIiQQFZI0LvZ40oqVUe5ZLv8MMIFtsNxrCuny68UETI8s5sCNL3eTzqbGUu8i6zasqw==
X-Received: by 2002:a05:6512:e98:b0:540:1dca:52d3 with SMTP id 2adb3069b0e04-541e674c8b4mr2116649e87.29.1734607117080;
        Thu, 19 Dec 2024 03:18:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: pin down CONFIG_QEMU_PLATFORM for RISC-V's randconfig job
Date: Thu, 19 Dec 2024 12:18:31 +0100
Message-ID: <20241219111831.31736-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Except setting CONFIG_QEMU_PLATFORM=y in tiny64_defconfig,
CONFIG_QEMU_PLATFORM should be fixed for RISC-V's randconfig job.
Otherwise, an expected compilation error for RISC-V's randconfig job
will occur since clean_and_invalidate_dcache_va_range() and
clean_dcache_va_range() are currently implemented only for the QEMU
platform.

Additionally, sort the EXTRA_FIXED_RANDCONFIG list alphabetically.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: f92e2709bd ("xen/riscv: implement data and instruction cache operations")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/build.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1ca6764225..1b884cc81c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -732,9 +732,10 @@ debian-12-riscv64-gcc:
       CONFIG_COVERAGE=n
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
+      CONFIG_LIVEPATCH=n
       CONFIG_MEM_ACCESS=n
       CONFIG_PERF_COUNTERS=n
-      CONFIG_LIVEPATCH=n
+      CONFIG_QEMU_PLATFORM=y
       CONFIG_XSM=n
 
 debian-12-riscv64-gcc-randconfig:
-- 
2.47.1


