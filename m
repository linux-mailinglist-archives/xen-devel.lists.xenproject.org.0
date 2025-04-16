Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31FFA8B804
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955718.1349341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q5-0006Yn-DW; Wed, 16 Apr 2025 11:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955718.1349341; Wed, 16 Apr 2025 11:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51Q5-0006VY-83; Wed, 16 Apr 2025 11:59:09 +0000
Received: by outflank-mailman (input) for mailman id 955718;
 Wed, 16 Apr 2025 11:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q3-0006Ay-Vx
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:07 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32184829-1aba-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 13:59:05 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso4026123f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:04 -0700 (PDT)
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
X-Inumbo-ID: 32184829-1aba-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804745; x=1745409545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmL/ZnaF9EKDwjrLJuzd3+BdV4GeJNNzHF8jTkdgEEU=;
        b=YfrSm1QUIkYZzliUTjTuDYVhVYe8aohQJXpYJyDf+iz1SH6F7Il0VFXMPZk7rYd4GM
         fNh+kuHSR6QydgrSgNdg1YmTiUgoRgpSQyYbbKYgNbl53JyZWNLB2XMsMhcpj2Yt6ayx
         W258UamQ1NnHEPX9bsnhV320tgpZLQ41NR3TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804745; x=1745409545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmL/ZnaF9EKDwjrLJuzd3+BdV4GeJNNzHF8jTkdgEEU=;
        b=MSZaXhcFVM5+RLTX3T85DsuLlBnoSFLrlQt1IyrX4XpeFUledl7nlmuD+n4RXIEvPd
         RNM8iy5HwPRb7l5tNgj7UqmpBNQCAl9F51isuV+FHKiBzuIiV1DJ32sVxIN7/Mq/if4S
         9afUFaFzrUzP4RP13GZr4VUIwFXMszZGWTroAvzY/DFos/QR4TFgP11ig5Hx/q8go6AV
         YXUZ74agKA80DsMZtXd5C1zxb9I+5eneA4jL1T4UwK8qF6lRXcn5dDjZpweGh8JENYTU
         9DMlsyXbRJD1cFjtFsL0U/26ve6v6aoIi5dd0Vkk1cjuYVxRye/q89z4K0AZ8J1JZxgx
         jpdA==
X-Gm-Message-State: AOJu0Yz6ISW+Y2klXRT9Fh5h95B4vY2Ko9+vBvSLhwX6nzu9wRdvbqb/
	OskWj0MoyZk1cW+TtupG0eeJhGMMAw6+1E6Sn5k3plNln+75pK8+x0OJTuIANIcNeml2MCOn4/l
	O5NY=
X-Gm-Gg: ASbGncvRKlrDlGLeKCJAjyEyfo59e8mS4dCs9MBctGwOQmkNspQ7rnAf0AJrkYUIuaX
	M9iOvyFxkfyNmKZtovfG53Es9tIeUpQyBSvQlv2d2ynB5QES50ZSTtzhs7R+422zM9kDxoGxwrj
	sXiO8OaGOkUftVxjLxVNVsQ70+/6UuQsN4Hf3og7Tqz3+czzpxwQjZP5eM5u6BmYGdsytQKmVSz
	oLr0FKz8w9ASQXpaN4CmkfBCtSKam45ZCx1vb4kZSV1hukLyN3RLdRLCuDhIa9q/hf9zOqu63pU
	5QbPvfuLNzqDwNZ/Wo+VRqlGAFUcynK80KHq94lm4SyPWrHWpokMtT9WlvK7oaUqAB7bCVFgVMp
	4Hv4Abqk1cmTvlw==
X-Google-Smtp-Source: AGHT+IGoC35KrZip6fCDcL/oUGzi+YtFZJnDE7FrGERYhKy4EnzKfqCJeF21k2rDsfPw8nhjHTWBow==
X-Received: by 2002:a05:6000:240c:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39ee5b1682emr1420910f8f.23.1744804744884;
        Wed, 16 Apr 2025 04:59:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 02/15] drivers/smmu-v3: Fix impending MISRA R20.6 violation
Date: Wed, 16 Apr 2025 12:58:47 +0100
Message-Id: <20250416115900.2491661-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_to_le64() is about to become a macro, at which point the #ifdef in the
middle of it becomes undefined behaviour.

Use a logcal variable to prepare strtab, where the #ifdef is fine to use.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v6:
 * New

Eclair log from v5:
  https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/andyhhp/xen/ECLAIR_normal/xen-bswap/ARM64/9556392204/PROJECT.ecd;/by_service/MC3A2.R20.6.html
---
 xen/drivers/passthrough/arm/smmu-v3.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cee572402203..df162350578c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -722,15 +722,17 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 	}
 
 	if (s2_cfg) {
-		BUG_ON(ste_live);
-		dst[2] = cpu_to_le64(
+		u64 strtab =
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
 #ifdef __BIG_ENDIAN
 			 STRTAB_STE_2_S2ENDI |
 #endif
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
-			 STRTAB_STE_2_S2R);
+			 STRTAB_STE_2_S2R;
+
+		BUG_ON(ste_live);
+		dst[2] = cpu_to_le64(strtab);
 
 		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
 
-- 
2.39.5


