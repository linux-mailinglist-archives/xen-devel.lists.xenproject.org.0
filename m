Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C79A82C97
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944344.1342864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQM-0005kD-M1; Wed, 09 Apr 2025 16:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944344.1342864; Wed, 09 Apr 2025 16:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQM-0005cM-Fc; Wed, 09 Apr 2025 16:37:14 +0000
Received: by outflank-mailman (input) for mailman id 944344;
 Wed, 09 Apr 2025 16:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQL-0004rn-AO
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:13 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c310c6-1560-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 18:37:11 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5947342f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:11 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:10 -0700 (PDT)
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
X-Inumbo-ID: e2c310c6-1560-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216631; x=1744821431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyQzuwD6xN4VRWg/MDtNd3j0QqAGhL/LmpWTv3MgUQA=;
        b=T9Xk/ZMZ1wxVdl8LLhyumbiYoAHoTazBFK1QrX084FCvA5Pl/fQQ/yywru4xtbENdi
         UW5BxFREnnc7mf67oC88M0F/inn6yawKxRV0Rr23Yxkx5u6h72e6ezOSlOsM9mkDPujg
         3thW2snNyy+YHEugnO10PXvsEGZwsqmxEmRjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216631; x=1744821431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyQzuwD6xN4VRWg/MDtNd3j0QqAGhL/LmpWTv3MgUQA=;
        b=NW3V83mUkFid0FGOFqTvDIvu6J2gGk9TOQ3O1w4OJm/e8V2Toav2Umvty8bj71l7hl
         a2Jc2IuB3L0MQ96oslOwV2dfSYGdy5pLXTDJoSFRtb7HRKio+Ewe10O6mKBhUGDwY87C
         gzJOc1EMF6hAuXKbgpGaQ5hMaYSYVfneFk2n8vF+HI5dHrfv7XLknn6Z2WpVcBBtVcua
         Fjt2lmhW4U5wzkwm6PDZKKHZTTG74SJ808lDkbdI+8UOboGE5d9hn9rF1zZRBfk2hntD
         WkNyJtIwOaJJsoId5avVjZBsGRHHbZ14uyxKV3uIH49uLyZvgAJWWOkiZLzIT+6A+50J
         TA+g==
X-Gm-Message-State: AOJu0YxV1E9rd/MA7Ri2+D7juAKrBsYfteLLKyNls/YjV/POrBiZ4ywj
	HRkkMTvLP9yL6RNx+lv9XiLaXEdHH1znsu39QWlMPmNvRxRiinQ5+WwXI4lHPOK5Yb2oZEsHV8S
	tm4Y=
X-Gm-Gg: ASbGncu0bV6c6Tmf2lIegIjeymd1ZNnV47V6c9n2Ih5YzINJB5/8yO0mOEUdDvmJiXJ
	/p4GKm+8DNs83pKdYd/bxJh5+Q9ZgBqV0qlTAE4vLtXSmd5ooqwXGIo+jYSA18b8NA9YlQaNJk2
	/yv7gjT+JNMI71L2qK68X/6tZEDpXNRsnMbeihykD5f0eUMXd+T6ReDLNFRwynY+btnDzgrhZq5
	luEmZtxUz5iA7AO8E524FokSfiTgdPxF2zeWzRwyx1tP8xX7ZfkI9xk+dCi8g4hNbwjf9sR4rBA
	6aixFXkTVquVwmMgmxrHTOFQJ9P1Ksnr/zM5WpsRnGtQGHUDZmHoyVgZYp4BsPj1KhD2cBYD08P
	X2UL362py34u0DjM3owD6Ji3b
X-Google-Smtp-Source: AGHT+IGOcdGsljIjVVsdsWALFvdinkG6lUUagjLK1Jl/TKh9PJiq/vx2t1e+kFxVdlNMwFC6UbzijA==
X-Received: by 2002:a5d:64aa:0:b0:39c:142a:ed6c with SMTP id ffacd0b85a97d-39d87cd0301mr3678848f8f.40.1744216630737;
        Wed, 09 Apr 2025 09:37:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 5/8] Adjust Linux build script to work with other major versions
Date: Wed,  9 Apr 2025 17:36:59 +0100
Message-Id: <20250409163702.2037301-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also use 'tar o' to decompress based on file name.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 scripts/x86_64-kernel-linux.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/x86_64-kernel-linux.sh
index 2a816f0b3204..5a0160655bea 100755
--- a/scripts/x86_64-kernel-linux.sh
+++ b/scripts/x86_64-kernel-linux.sh
@@ -11,9 +11,10 @@ WORKDIR="${PWD}"
 COPYDIR="${WORKDIR}/binaries/"
 
 # Build Linux
+MAJOR=${LINUX_VERSION%%.*}
 curl -fsSLO \
-    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
-tar xJf linux-"${LINUX_VERSION}".tar.xz
+    https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
+tar oxf linux-"${LINUX_VERSION}".tar.xz
 cd linux-"${LINUX_VERSION}"
 make ARCH=x86 defconfig
 make ARCH=x86 xen.config
-- 
2.39.5


