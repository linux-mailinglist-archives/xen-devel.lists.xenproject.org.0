Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0641EF680
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 13:38:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhAfD-0007cj-FJ; Fri, 05 Jun 2020 11:37:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mreJ=7S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jhAfC-0007ce-Bv
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 11:37:30 +0000
X-Inumbo-ID: efeae05e-a720-11ea-afa3-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efeae05e-a720-11ea-afa3-12813bfff9fa;
 Fri, 05 Jun 2020 11:37:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l10so9386843wrr.10
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 04:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6rwoWVKrSvqfrI6Iyp/Gjae4Z7e8hfSug4PMkSldLdA=;
 b=dLPrVCZGlNTXcDg6O7dNkPx0WGntv7PXJ4FK5Nfq2AKgqhBUISFZ2JIV0EXeic1gnm
 zVd8Te4DznfzOgfB/vgbhohDlOavKcw0ykVZrwLZWDjg4oVxricdrLRtfTmJ8E1kqrEb
 nYLD86dPrNpkrRXCdn8chONQFXioDSGJ8CC42jqqwPMG7YKvkqLNXKeAh0D/ACuqKAlG
 NVcIfAa8rP7H0Xyuemc0CZOHKDmV4il2iTL5ev2yST3V8cApaetR6nn0iD2u87cDRxvj
 APdTLNnw9nlQMKLkBrVY9kJZbXiPSXgOWurL7IhZBkXvfAj+T+js6zXPO0YIhSQIGx0z
 TwAw==
X-Gm-Message-State: AOAM532WkiYDNmBzQQgJLrM55VF30z04EClJfGBVm6Jp+p31RdE29Be1
 NnBDzTdmoMX0m71TRn/2P24jwVQg
X-Google-Smtp-Source: ABdhPJyz1oEsfnBmGLJmXHLwhhEomtCn9kKaRcZhZEyWxNAOtw4SJnKGfOju83LUCj0xqyTot93Cxw==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr8863579wrv.287.1591357048741; 
 Fri, 05 Jun 2020 04:37:28 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z25sm10887532wmf.10.2020.06.05.04.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 04:37:28 -0700 (PDT)
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] libs/hypfs: use correct zlib name in pc file
Date: Fri,  5 Jun 2020 11:37:25 +0000
Message-Id: <20200605113725.30982-1-wl@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Its name is "zlib" not "z".

Reported-by: Olaf Hering <olaf@aepfle.de>
Fixes: 86234eafb952 ("libs: add libxenhypfs")
Signed-off-by: Wei Liu <wl@xen.org>
---
Cc: paul@xen.org
Cc: jgross@suse.com
---
 tools/libs/hypfs/xenhypfs.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/hypfs/xenhypfs.pc.in b/tools/libs/hypfs/xenhypfs.pc.in
index 92a262c7a252..ef9fcc87bf37 100644
--- a/tools/libs/hypfs/xenhypfs.pc.in
+++ b/tools/libs/hypfs/xenhypfs.pc.in
@@ -7,4 +7,4 @@ Description: The Xenhypfs library for Xen hypervisor
 Version: @@version@@
 Cflags: -I${includedir} @@cflagslocal@@
 Libs: @@libsflag@@${libdir} -lxenhypfs
-Requires.private: xentoolcore,xentoollog,xencall,z
+Requires.private: xentoolcore,xentoollog,xencall,zlib
-- 
2.20.1


