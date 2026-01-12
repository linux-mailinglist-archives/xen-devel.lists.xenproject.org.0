Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1ED14186
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 17:38:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200743.1516586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKw4-0000Mj-SY; Mon, 12 Jan 2026 16:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200743.1516586; Mon, 12 Jan 2026 16:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKw4-0000Jv-Pi; Mon, 12 Jan 2026 16:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1200743;
 Mon, 12 Jan 2026 16:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vfKw3-0000Jp-Mr
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 16:38:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 207e7bfc-efd5-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 17:38:30 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so5687016f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 08:38:30 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ede7esm40211880f8f.32.2026.01.12.08.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 08:38:28 -0800 (PST)
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
X-Inumbo-ID: 207e7bfc-efd5-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1768235909; x=1768840709; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsYepr6llrngVjLksK/0nWVIboj9pVEDeNz8G0+4fyE=;
        b=VuMsmwmuKz2Uxp6l86/YUn+YsPQ2oyajA3z6x8+a5Mp3NbUjmVJIYRTr3PpyultnLR
         sQUqRQRXbvbckg7gCPorbpjaoUgwGotpczvk3kCBL0H/8iLe2A9QVZijGCED5gryfYI0
         3e5q/ajmbZB7H5cHwJFXpI1oDSYmEgXR2o7ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235909; x=1768840709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsYepr6llrngVjLksK/0nWVIboj9pVEDeNz8G0+4fyE=;
        b=Ro29pcRKtYVLUVNtTKDMAyiHxSwrtP4gBfs0ylhwnDijwhSTO513jFTBycEMjMq9X0
         XOKRAHMggcP6mQtcUz9kzIgQ4OmE7AV8T0nBnZnnE/abgSUtAkk5g6BZcmNJ8tfnaRLm
         gW5qCTIXsfI6ezP/6WP1Y/hDdKnHzD+y77kMJhaRRgOirV2BhV6tRnVvwf31RFQ+/um5
         EDl32r1nfynYP4nfQ6soEXu0R0aTPzLPMANQNru062Lq87CBo8whwxLDk5Ud1lWweXQj
         yrFTyLK8niGxfVAmo5xpM14RHQUeVo441qNMziS1xB06bDGIMEKHmpdzInPnM4RxQi7D
         gFlw==
X-Gm-Message-State: AOJu0Yx4aOnk+t4/EyFDYo/wuwWEiKNtxu8+4KFhFc9OrhNnWnNrHTq5
	K6ftPvTZAcjuz3L77VN52b+x29B6mH7AcE19CvG7C5FK1C2VNF5IP6vfdidhQ6PNNotJJF1U416
	Hz+f5
X-Gm-Gg: AY/fxX7IxErCA8koxWhqNQ5yhVxXlYhwdIrQz5cFaCAYGNEHbHpf9wM9n27LskkgbbU
	n+lOF+cFxjzc7JnIOW/LS0TeDzEd6QVdO8dhuty5oDwQcdWTSx+DykmdOyx5xNiVdQWCpS6hMgH
	CLZuHUhHptXR6BEV3fhh0culzR1iQImxUJwbWg/hgxFbN+3Dc9/iAXayim7mldvG/sPIFqbH06b
	ppGAR/tdckyygHOzDqhzzyX8kPAwij07J4Vhfsl9q/TA0h+nhg541D/ZNvgaEAXmsj+5zKhmcVC
	VSFIeamq7wTn/JYj9a43hXYEH0sjMitd2Q02fLkisdXClmyCxEBUgMpah8WNR7FAh4o+yjTm0hP
	Btt0LCRXo1LIvvNqs1kjSQjjALslbrPMMzAm2UbPo8XJ+3RFLH+YIThMhLCSj3Nyzp6NZ0Fae9l
	2W3LpIPxPNPZJOjT1zzOSbmOiS60Ro4fq2IuGWbMa9lUS5eyrwbT8Zu8U6WEyw/w==
X-Google-Smtp-Source: AGHT+IF/EszdEveiQaMQPb3vAjwk8ur1K4N+LjI2wMVNroSCVFnZJScXibk+stQVA0GwNGl2jR3EPg==
X-Received: by 2002:a05:6000:2c0c:b0:42b:55a1:2158 with SMTP id ffacd0b85a97d-432c378fc28mr20892435f8f.17.1768235909252;
        Mon, 12 Jan 2026 08:38:29 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] CI/randconfig: Disable CONFIG_CONDITION_COVERAGE
Date: Mon, 12 Jan 2026 16:38:27 +0000
Message-Id: <20260112163827.1023401-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to GCC not liking x86_emulate(), it turns out that Clang is still
rather more a work in progress than a usable feature, causing failures in the
FreeBSD builds:

  https://cirrus-ci.com/task/5934059060199424

Exclude CONFIG_CONDITION_COVERAGE from Ranconfig until it gets a bit more
stable.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/tools/kconfig/allrandom.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/tools/kconfig/allrandom.config b/xen/tools/kconfig/allrandom.config
index f04b589a80af..8127ebb57090 100644
--- a/xen/tools/kconfig/allrandom.config
+++ b/xen/tools/kconfig/allrandom.config
@@ -1,2 +1,2 @@
 # Explicit option choices not subject to regular RANDCONFIG
-
+CONFIG_CONDITION_COVERAGE=n

base-commit: a2a34d76643e49ccc949296c9a45888034e50b55
-- 
2.39.5


