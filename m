Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DECAC7292
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 23:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999543.1380190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO30-0002Tz-UG; Wed, 28 May 2025 21:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999543.1380190; Wed, 28 May 2025 21:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKO30-0002ST-QT; Wed, 28 May 2025 21:10:50 +0000
Received: by outflank-mailman (input) for mailman id 999543;
 Wed, 28 May 2025 21:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CMiF=YM=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1uKO2z-0002Ed-4A
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 21:10:49 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a4dbba0-3c08-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 23:10:48 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so2660805e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 14:10:48 -0700 (PDT)
Received: from localhost.localdomain ([91.85.47.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4ef4f3aa3sm143910f8f.84.2025.05.28.14.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 14:10:47 -0700 (PDT)
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
X-Inumbo-ID: 3a4dbba0-3c08-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748466648; x=1749071448; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um4ciM1wf1r76488WPuGgT39VPFGzNQdLwM37kOyYP0=;
        b=arR5c779zr0WoC4C5PSj49InW7sWWO5pLHh1gcgB9ZjLJFZYoquyZ/ybnttWteXlBC
         iLRf84vZhhtfgznvu8GqAlArdJ9CZQryYDrxuJzYvghlGtFf/hHC1tDwbrTYb+OSUMNE
         rpxGRV2ABbXsccXsXVtqg3pECc7VmpjlCwz7nuT2AzZW3fHpugmV94Kp47xOhgFf6VwA
         hlsmhVX0/902/F3S2LB4pQM7jLOuKGxBU0pluqetEgxUEPyMW/7VKJpuGiKeAOfmjVWq
         c1JzczC29pfvKIHTlxzkXDQ+n6T9ab3mA3aGY6Bo2EE0zRaGabAjJI6aQAxgmokNO29S
         /VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466648; x=1749071448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um4ciM1wf1r76488WPuGgT39VPFGzNQdLwM37kOyYP0=;
        b=bHfkyI0ytT1WE3QJR8XC/HKFH/9YZKVfiODAAfDXn/78P6TVajjcdIhBp3sBnmf5Yx
         eLZIbkguktjgfgXJ/RlI2u67BTKj/Mr9kzyFP0+IabJ4sI0ozh610ZcMSS5Eb9VYWF3Q
         3UtEXVSnvzBkNKqg6tufVFUZHGgf1aKcmzlVRGf1hhLP1SVn+2X1s90n4MnLTcqf51oF
         ya62PAHOfe3Ct8pR/zoUn74ySnpGdq8mW7InEtOz9rLpHj/9vZQXfrqtMlPEGrUh+Ncb
         I8gcXhBvyylVLZDfG2wrNh5JhjBkCmVUU3dqUM3455JSi5CcgKfXkC1WBUEKKnPIkf6A
         tNHA==
X-Gm-Message-State: AOJu0YyKi6eOUDuMwnvxRLDaI2H3wWVbcC1mi8l9AhcN1tbAcn+16c5q
	02hsg987jGvoqQd4l/+4OH/WwkLy9tM6bG49BynO2XrGF0C1opKaF5fOljRtKhTk
X-Gm-Gg: ASbGnctgglA9Zke6wgoO4x+FNG9KiWMmen8i9l3AAWQoR1LW5vhRu9Mvvqr+ikw8Z7D
	FDrefLA4KghMiYaPJzYh7ImO4Q5+8nIAYn+XJaxI2vG7tbr2jpETXl2b9VDB8SzvRu0InKv/uAc
	wVk/i17EF8rsjFD7lG5DD3g/xaJ1Vv5NHqRE4UTMvzSgrQYehiD4s/odtUOPtR9G3g+LUYxOxte
	fJ9TFOBAM92z6xcwuGnrZJNF27PgYJhtZyNHu5uEfVBCpxPU9mCKve9nO+3u4L9nzpKT/ON9oj5
	btjQV959UW8UphmQKyyo4gEAVXJ2+2yi+hZ/Km5F82lecKTxsR1alngTV59f7YBc1YpVZ0WKyvX
	gtYQbfRsesw==
X-Google-Smtp-Source: AGHT+IF9hzN6IK9LWGC+wpyAGZqQfpFsDmwbmCvMJE+fk98v3fGV1lMGmW8S1N4hQg9DHNmxk/pUMQ==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-45077d424bbmr35272415e9.21.1748466647598;
        Wed, 28 May 2025 14:10:47 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
	Rich Persaud <persaur@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 3/3] MAINTAINERS: add a reviewer for Argo
Date: Wed, 28 May 2025 22:10:40 +0100
Message-Id: <20250528211040.10562-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528211040.10562-1-christopher.w.clark@gmail.com>
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Daniel P. Smith as reviewer for the Argo subsystem.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 697f383505..6b129704fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -222,6 +222,7 @@ F:	tools/libacpi/
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
+R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 W:	https://wiki.xenproject.org/wiki/Argo:_Hypervisor-Mediated_Exchange_(HMX)_for_Xen
 F:	xen/include/public/argo.h
-- 
2.34.1


