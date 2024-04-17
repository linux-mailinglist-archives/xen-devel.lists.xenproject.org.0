Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0448A82D0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707425.1105358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45Y-0007d9-Ja; Wed, 17 Apr 2024 12:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707425.1105358; Wed, 17 Apr 2024 12:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45Y-0007aK-G4; Wed, 17 Apr 2024 12:08:32 +0000
Received: by outflank-mailman (input) for mailman id 707425;
 Wed, 17 Apr 2024 12:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45X-0006LA-3G
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:31 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3452679e-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:30 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a52223e004dso617539066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:30 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:28 -0700 (PDT)
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
X-Inumbo-ID: 3452679e-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355709; x=1713960509; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1Qabi3jNJegdKhnBiMWi1ZQl9X7iHb1l6tidFGT/F0=;
        b=EZvGXeOxLdAD4ASsid4T0Qs7PTssveJ3AIXqqSVcEdup8i0RFLL/x+/qDYXV0YulvU
         dPW+U4p3WqSbYyZTREOxsiRdAirlTPDnCu52v74pnzZeioKdhTrPx/ymESUI+Og5M0DA
         wAxAAKsxYnYnb9TFYifPhad01jkQLnmIZ/cYtNueYcf0oM+Y40202tfZHaAF+2mcm3kU
         RMghTRBGvxSUE9UzLZZcB9EscRU+00N91H8HHGYHs231kHoWHonedq+HK30ayCNgT2kh
         eK3SMP760GRP5L1i5reYTCBqYFN9vJ4FAX82mIPG3U/10pu2k4jZGs31r6QmJ9cn0g4N
         a5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355709; x=1713960509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1Qabi3jNJegdKhnBiMWi1ZQl9X7iHb1l6tidFGT/F0=;
        b=iEpOqRLD1oY2+1ldYDFe6mYJop+73rb0XyFChODmemrDNpGYWwq+ku/uTf35x1/0SI
         M3+YAcapnbNWSv3X0Wno0Vvw9mkTJkZEHPNL9IRL42blvxxRyDARxyIA7KLJvu2Ze3i4
         KBmr6/qlhIrBFVJs8zo2d1bbDPvT2e3xUe9LMgKR+6mlGycKsDlbdk0uRwyG+f0J6g2C
         RVJC5s6eNTxFEB/ai3QVR2GCMY4UeeEJA8g1/VosujlCcVdGd9eZA5f5XQSd7vWOD7pV
         f09Hy+bSb51REYZPnwmAqkBe4lslWjRzKEkMOpA0ZBoTu4QvBFc4s8yfLW65QZwnhr2Z
         na3A==
X-Gm-Message-State: AOJu0YylbE/woQcNWTi/RhAVqgtOtTp4yyMoPXF+E9ADE9PB0TGg8Pd4
	RqnhMkPEjRajw4uGPA2V1EwaOfbmorQi+/jLQMga1RFazwmCGQc7pGIhfA==
X-Google-Smtp-Source: AGHT+IHb8Vq/IOF6xICYfryAxfUddkwrB/+/DKcfazmmPzBN+SIvkYWlOPrfo0HJ92AWkgZcLafwVA==
X-Received: by 2002:a17:907:86ab:b0:a52:51bb:5f with SMTP id qa43-20020a17090786ab00b00a5251bb005fmr12084368ejc.9.1713355709404;
        Wed, 17 Apr 2024 05:08:29 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 5/5] uboot-script-gen: Add ability to specify "nr_spis"
Date: Wed, 17 Apr 2024 15:07:41 +0300
Message-Id: <20240417120741.2453431-6-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417120741.2453431-1-olekstysh@gmail.com>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is needed to have a possibility of assigning a specified number
of shared peripheral interrupts (SPIs) to domain.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 README.md                | 5 +++++
 scripts/uboot-script-gen | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/README.md b/README.md
index 63c4708..7683492 100644
--- a/README.md
+++ b/README.md
@@ -237,6 +237,11 @@ Where:
   PL011 UART for domain. The default is 1. If explicitly set to 0, then
   "console=ttyAMA0" is not used as a default DOMU_CMD[number].
 
+- DOMU_NR_SPIS[number] is optional. It specifies a number of shared peripheral
+  interrupts (SPIs) to be assigned to domain (depending on the underlying
+  hardware platform). The minimum possible value is 0, if DOMU_VPL011[number]
+  is also explicitly set to 0. Otherwise the minimum value is 1.
+
 - DOMU_CPUPOOL[number] specifies the id of the cpupool (created using
   CPUPOOL[number] option, where number == id) that will be assigned to domU.
 
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index fd37e18..50b6a59 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -348,6 +348,10 @@ function xen_device_tree_editing()
         then
             dt_set "/chosen/domU$i" "vpl011" "hex" "0x1"
         fi
+        if test -n "${DOMU_NR_SPIS[$i]}"
+        then
+            dt_set "/chosen/domU$i" "nr_spis" "int" "${DOMU_NR_SPIS[$i]}"
+        fi
         if [[ "${DOMU_ENHANCED[$i]}" == 1 || ("$DOM0_KERNEL" && "${DOMU_ENHANCED[$i]}" != 0) ]]
         then
             dt_set "/chosen/domU$i" "xen,enhanced" "str" "enabled"
-- 
2.34.1


