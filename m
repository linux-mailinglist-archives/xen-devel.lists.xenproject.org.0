Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EC7E9FD0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631704.985344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YlJ-0001Bi-8s; Mon, 13 Nov 2023 15:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631704.985344; Mon, 13 Nov 2023 15:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YlJ-00018x-55; Mon, 13 Nov 2023 15:22:05 +0000
Received: by outflank-mailman (input) for mailman id 631704;
 Mon, 13 Nov 2023 15:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YlH-0007fE-K6
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:22:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64c60e60-8238-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:22:01 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9d216597f64so705796566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:22:01 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a1709066c8a00b009dbe08bc793sm4269124ejr.18.2023.11.13.07.21.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:22:00 -0800 (PST)
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
X-Inumbo-ID: 64c60e60-8238-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888921; x=1700493721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24ML07HsEvOYl+DuxzoZlUZnhAFy4fscEFWSzx7VWys=;
        b=lOzzkC5S6RQdYiPHj4aGiv8rW0Sjm3UITXtrK5KwSJCYfH/QOMm9hBuW28PtGMq3Cf
         O/GKUHh2Cx9tjoKNLMywry8TSYLn+EvsNuy9YSjWGR+mB0qLrteu+1koTH3+dDu4fCI3
         8un4rKadAWt4PRBlJ2030v0RrvQ4q3zGq53bZooHxBOgcPSCnpvbcOzJWrk4mR86gdiN
         wfCz45kQXt2U9WXzN/8/aLZT4L2AQ9jtByV62lmzT2BsZEdwLdc8GAF5IkWv0/WbXdZ2
         OCqbzfEOr0v39DUzmy7KktY/9X+H5832o+w9VUSlZ2PPiYBDQ1o7Rf6QLdhVAcOcl/fQ
         +1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888921; x=1700493721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24ML07HsEvOYl+DuxzoZlUZnhAFy4fscEFWSzx7VWys=;
        b=eTCKU1lxXmIBKR7JkzTvz3vtV/Sgc5IqhimqW+NQcdSWB/mAz5h91cVCvU5P46aUuY
         duEGUMcMEWbah5J+41UqV0vxcYLARyETmGF/aSnDHQYfWyo2kiIcHLAwJFzDJMc+wEtC
         kYpndQBKCgNqWm1bOPflVJCdeYbihRcDAvgPeDqQluXoXLqOkS/m2npwx0IHtf3D220W
         2y69dFDE/XnjAoWIUasHYXTdVKWs8T8FjppUdeCBOaS6qAQFwJVCz92eNFdkz9nCH7tp
         ird0uCw0L9T+hTYev3jV75btFneSPBFoUwPQORp7GMp1E+cUTBTNyE67dqpRF1afyDyF
         VEdw==
X-Gm-Message-State: AOJu0Yxm9N1hHSp2ld/2yC2gnZc/2JcGMH3lfoPtXqrkW5SwqsgLJP2C
	0wfVI6IVxZVuqGRGiKX1h8nL/A==
X-Google-Smtp-Source: AGHT+IH+PnzXWjrgKP+WWXsdazo2lewjVqkzA92vUb1Slw8L1D+s00HazVDZsJw73hj51Hyp7Aw3PQ==
X-Received: by 2002:a17:906:5fc6:b0:9e6:5132:43e5 with SMTP id k6-20020a1709065fc600b009e6513243e5mr4860965ejv.16.1699888921215;
        Mon, 13 Nov 2023 07:22:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability with CONFIG_XEN_IS_POSSIBLE
Date: Mon, 13 Nov 2023 16:21:10 +0100
Message-ID: <20231113152114.47916-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
in target-agnostic files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/xen-mapcache.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
index c8e7c2f6cf..10c2e3082a 100644
--- a/include/sysemu/xen-mapcache.h
+++ b/include/sysemu/xen-mapcache.h
@@ -10,10 +10,11 @@
 #define XEN_MAPCACHE_H
 
 #include "exec/cpu-common.h"
+#include "sysemu/xen.h"
 
 typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
                                          ram_addr_t size);
-#ifdef CONFIG_XEN
+#ifdef CONFIG_XEN_IS_POSSIBLE
 
 void xen_map_cache_init(phys_offset_to_gaddr_t f,
                         void *opaque);
-- 
2.41.0


