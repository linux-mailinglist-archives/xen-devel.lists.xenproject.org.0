Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A161A95C147
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782003.1191483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtA-0005Ix-Vx; Thu, 22 Aug 2024 23:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782003.1191483; Thu, 22 Aug 2024 23:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtA-0005HI-Si; Thu, 22 Aug 2024 23:06:44 +0000
Received: by outflank-mailman (input) for mailman id 782003;
 Thu, 22 Aug 2024 23:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGt9-00052v-BY
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:43 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31641ac1-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:41 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5334a8a1b07so1860646e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:39 -0700 (PDT)
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
X-Inumbo-ID: 31641ac1-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368000; x=1724972800; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vi0HNaxsoocOO70fDh+VCPKJb25Qc7z5AiDZW/3dXd4=;
        b=q1U1G8I5sUJYS3ilmi2J7exQaeisMT+5GRvN46ZFTt2eOMAcMvpMy8BRsYUe4RMh+X
         OAsuIsBOyVQhlpDXXg95c/7kCFKHCcdPKcSLqSLc0CtbTO8tVPpgF/wcER6J2sNAzuS+
         oZb6v1xzps4lfHg8l9N7mN9Ook8/8QKtsmD3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368000; x=1724972800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vi0HNaxsoocOO70fDh+VCPKJb25Qc7z5AiDZW/3dXd4=;
        b=I8kl4461gTHqdAXFQpqlSvHfX9YjtJQ9bjy6rbicy/uuR3o9faxcxjxpJMcaUUUYAB
         VssQg50CBmmXXax99Mf7Jn+b8MHKY2KSILXoL+8Sc+cGWx5bB5GBXk92nwOUnt9D5pZC
         IPGIR4j3C4IIvVInGbhYCyyEJ8wGf3R/g0fBzJ/aQN4cfffqlact6C9KCPkMmwyr2KnO
         lQPSlEEgWeMeTvpHGtEjiAiiqWsRS15vQc9o8SHQP4CGVVuRm6nt1vjsg5GYBvc+/J+K
         y6OV1CjL9ySH6Jfa0XsRA1zSS+jVMsoSOXAfTjU8Fe4SWiFFheOHWu8/xuGSSMLjYs3G
         EiNw==
X-Gm-Message-State: AOJu0YxLBIv//FkCVefrKGhiPiRjt2lKd0x8Wn/JAazsAsvHMPGuvowl
	jx4Sda6hmQcyt+hSOobDkUVyBEypfTgKPCAwzWESkAfHWQlIXtT8ECbdGulq6DSmC5csr+gVVe+
	F
X-Google-Smtp-Source: AGHT+IG08atBLSrHkN0q7MwPV4pRgbVAGpFeqlS9ZEga/uXi2+39o90RumbhPvbxno7nfcsm9Ll9eA==
X-Received: by 2002:a05:6512:3a8a:b0:52c:e4cf:4f31 with SMTP id 2adb3069b0e04-5343886beeemr195477e87.49.1724368000028;
        Thu, 22 Aug 2024 16:06:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/9] xen/bitops: Reinstate the please tidy message
Date: Fri, 23 Aug 2024 00:06:27 +0100
Message-Id: <20240822230635.954557-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent additions have undone prior tidying at the top of the file.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/include/xen/bitops.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 3d88d2f3f1d6..b8bb2ffcd337 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -204,6 +204,8 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
+/* --------------------- Please tidy above here --------------------- */
+
 static always_inline __pure unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
-- 
2.39.2


